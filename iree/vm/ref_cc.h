// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef IREE_VM_REF_CC_H_
#define IREE_VM_REF_CC_H_

#include <memory>
#include <utility>

#include "absl/base/attributes.h"
#include "iree/base/api.h"
#include "iree/vm/ref.h"
#include "iree/vm/types.h"

#ifndef __cplusplus
#error "This header is meant for use with C++ implementations."
#endif  // __cplusplus

namespace iree {
namespace vm {

// TODO(benvanik): make this automatic for most types, or use type lookup.
// This could be done with SFINAE to detect iree_vm_ref_object_t or RefObject
// types. We may still need the iree_vm_ref_type_t exposed but that's relatively
// simple compared to getting the typed retain/release functions.

// Users may override this with their custom types to allow the packing code to
// access their registered type ID at runtime.
template <typename T>
ABSL_ATTRIBUTE_ALWAYS_INLINE void ref_type_retain(T* p) {
  iree_vm_ref_object_retain(p, ref_type_descriptor<T>::get());
}

template <typename T>
ABSL_ATTRIBUTE_ALWAYS_INLINE void ref_type_release(T* p) {
  iree_vm_ref_object_release(p, ref_type_descriptor<T>::get());
}

// Reference counted pointer container wrapping iree_vm_ref_t.
// This is modeled on boost::instrusive_ptr in that it requires no
// extra storage over the pointer type and should compile to almost
// no additional code. It also allows us to round-trip object pointers
// through regular pointers, which is critical when having to round-trip
// them through JNI/etc where we can't use things like unique_ptr/shared_ptr.
//
// The ref wrapper calls the iree_vm_ref_* functions and uses the
// iree_vm_ref_type_descriptor_t registered for the type T to manipulate the
// reference counter and, when needed, destroy the object using
// iree_vm_ref_destroy_t. Any iree_vm_ref_t can be used interchangably with
// ref<T> when RAII is needed.
//
// Example:
//   ref<Foo> p1(new Foo());    // ref count 1
//   ref<Foo> p2(p1);           // ref count 2
//   p1.reset();                // ref count 1
//   p2.reset();                // ref count 0, deleted
//
// When round-tripping the pointer through external APIs, use release():
//   ref<Foo> p1(new Foo());    // ref count 1
//   Foo* raw_p = p1.release(); // ref count 1
//   // pass to API
//   ref<Foo> p2(raw_p);        // ref count 1 (don't add ref)
//   p2.reset();                // ref count 0, deleted
//
// See the boost intrusive_ptr docs for details of behavior:
// http://www.boost.org/doc/libs/1_55_0/libs/smart_ptr/intrusive_ptr.html
//
// The retain_ref and assign_ref helpers can be used to make it easier to
// declare and use ref types:
//   ref<Foo> p = assign_ref(new Foo());  // ref count 1
//   PassRefWithRetain(retain_ref(p));
//   PassRefWithMove(std::move(p));       // ala unique_ptr/shared_ptr
//
// ref manages the target objects in a thread-safe way, though you'll want
// to take care with objects that may have pinned threads for deallocation. If
// you release the last reference to an object on a thread other than what it
// was expecting you're gonna have a bad time.
//
// Compatible only with types that implement the following methods:
//   ref_type_retain(T*)
//   ref_type_release(T*)
//   ref_type_descriptor<T>::get()
//
// If you get link errors pertaining to ref_type_descriptor then ensure that you
// have included the header file containing the IREE_VM_DECLARE_TYPE_ADAPTERS
// for the given type.
//
// TODO(benvanik): reconcile RefObject, iree_vm_ref_t, and this.
template <typename T>
class ref {
 private:
  typedef ref this_type;
  typedef T* this_type::*unspecified_bool_type;

 public:
  ABSL_ATTRIBUTE_ALWAYS_INLINE iree_vm_ref_type_t type() const noexcept {
    return ref_type_descriptor<T>::get()->type;
  }

  ABSL_ATTRIBUTE_ALWAYS_INLINE ref() noexcept = default;
  ABSL_ATTRIBUTE_ALWAYS_INLINE ref(std::nullptr_t) noexcept {}  // NOLINT
  ABSL_ATTRIBUTE_ALWAYS_INLINE ref(T* p) noexcept : px_(p) {}
  ABSL_ATTRIBUTE_ALWAYS_INLINE ~ref() noexcept {
    if (px_) ref_type_release<T>(px_);
  }

  // No implicit ref copying allowed; use retain_ref instead.
  ref(const ref&) noexcept = delete;
  ref& operator=(const ref&) noexcept = delete;

  // Move support to transfer ownership from one ref to another.
  ref(ref&& rhs) noexcept : px_(rhs.release()) {}
  ref& operator=(ref&& rhs) noexcept {
    if (px_ != rhs.px_) {
      if (px_) ref_type_release<T>(px_);
      px_ = rhs.release();
    }
    return *this;
  }

  // Move support from another compatible type.
  template <typename U>
  ref(ref<U>&& rhs) noexcept : px_(rhs.release()) {}  // NOLINT
  template <typename U>
  ref& operator=(ref<U>&& rhs) noexcept {
    if (px_ != rhs.get()) {
      if (px_) ref_type_release<T>(px_);
      px_ = rhs.release();
    }
    return *this;
  }

  // Resets the object to nullptr and decrements the reference count, possibly
  // deleting it.
  void reset() noexcept {
    if (px_) {
      ref_type_release<T>(px_);
      px_ = nullptr;
    }
  }

  // Releases a pointer.
  // Returns the current pointer held by this object without having
  // its reference count decremented and resets the ref to empty.
  // Returns nullptr if the ref holds no value.
  // To re-wrap in a ref use either ref<T>(value) or assign().
  ABSL_ATTRIBUTE_ALWAYS_INLINE T* release() noexcept {
    T* p = px_;
    px_ = nullptr;
    return p;
  }

  // Assigns a pointer.
  // The pointer will be accepted by the ref and its reference count will
  // not be incremented.
  ABSL_ATTRIBUTE_ALWAYS_INLINE void assign(T* value) noexcept {
    reset();
    px_ = value;
  }

  // Gets the pointer referenced by this instance.
  // operator* and operator-> will assert() if there is no current object.
  constexpr T* get() const noexcept { return px_; }
  constexpr T& operator*() const noexcept { return *px_; }
  constexpr T* operator->() const noexcept { return px_; }

  // Returns a pointer to the inner pointer storage.
  // This allows passing a pointer to the ref as an output argument to C-style
  // creation functions.
  constexpr T** operator&() noexcept { return &px_; }  // NOLINT

  // Support boolean expression evaluation ala unique_ptr/shared_ptr:
  // https://en.cppreference.com/w/cpp/memory/shared_ptr/operator_bool
  constexpr operator unspecified_bool_type() const noexcept {
    return px_ ? &this_type::px_ : nullptr;
  }
  // Supports unary expression evaluation.
  constexpr bool operator!() const noexcept { return !px_; }

  // Swap support.
  void swap(ref& rhs) { std::swap(px_, rhs.px_); }

 private:
  T* px_ = nullptr;
};

// Adds a reference to the given ref and returns the same ref.
//
// Usage:
//  ref<MyType> a = AcquireRefFromSomewhere();
//  ref<MyType> b = retain_ref(a);  // ref count + 1
//  retain_ref(b);  // ref count + 1
template <typename T>
inline ref<T> retain_ref(ref<T>& value) {
  if (value) ref_type_retain<T>(value.get());
  return ref<T>(value.get());
}

// Adds a reference to the given raw pointer and returns it wrapped in a ref.
//
// Usage:
//  MyType* raw_ptr = AcquirePointerFromSomewhere();
//  ref<MyType> p = retain_ref(raw_ptr);  // ref count + 1
template <typename T>
inline ref<T> retain_ref(T* value) {
  if (value) ref_type_retain<T>(value);
  return ref<T>(value);
}

// Assigns a raw pointer to a ref without adding a reference.
//
// Usage:
//  ref<MyType> p = assign_ref(new MyType());  // ref count untouched
template <typename T>
inline ref<T> assign_ref(T* value) {
  return ref<T>(value);
}

template <class T, class U>
inline bool operator==(ref<T> const& a, ref<U> const& b) {
  return a.get() == b.get();
}

template <class T, class U>
inline bool operator!=(ref<T> const& a, ref<U> const& b) {
  return a.get() != b.get();
}

template <class T, class U>
inline bool operator==(ref<T> const& a, U* b) {
  return a.get() == b;
}

template <class T, class U>
inline bool operator!=(ref<T> const& a, U* b) {
  return a.get() != b;
}

template <class T, class U>
inline bool operator==(T* a, ref<U> const& b) {
  return a == b.get();
}

template <class T, class U>
inline bool operator!=(T* a, ref<U> const& b) {
  return a != b.get();
}

template <class T>
inline bool operator<(ref<T> const& a, ref<T> const& b) {
  return a.get() < b.get();
}

// Swaps the pointers of two refs.
template <class T>
void swap(ref<T>& lhs, ref<T>& rhs) {
  lhs.swap(rhs);
}

// An opaque reference that does not make any assertions about the type of the
// ref contained. This can be used to accept arbitrary ref objects that are then
// dynamically handled based on type.
struct opaque_ref {
  iree_vm_ref_t value = {0};
  opaque_ref() = default;
  opaque_ref(const opaque_ref&) = delete;
  opaque_ref& operator=(const opaque_ref&) = delete;
  opaque_ref(opaque_ref&& rhs) noexcept {
    iree_vm_ref_move(&rhs.value, &value);
  }
  opaque_ref& operator=(opaque_ref&& rhs) noexcept {
    iree_vm_ref_move(&rhs.value, &value);
    return *this;
  }
  ~opaque_ref() { iree_vm_ref_release(&value); }
};

}  // namespace vm
}  // namespace iree

#endif  // IREE_VM_REF_CC_H_
