// RUN: iree-opt -split-input-file %s | iree-opt -split-input-file | IreeFileCheck %s

// CHECK-LABEL: @trunc
vm.module @my_module {
  vm.func @trunc(%arg0 : i32) -> i32 {
    // CHECK: %0 = vm.trunc.i32.i8 %arg0 : i32 -> i32
    %0 = vm.trunc.i32.i8 %arg0 : i32 -> i32
    // CHECK-NEXT: %1 = vm.trunc.i32.i16 %0 : i32 -> i32
    %1 = vm.trunc.i32.i16 %0 : i32 -> i32
    vm.return %1 : i32
  }
}

// -----

// CHECK-LABEL: @trunc_i64
vm.module @my_module {
  vm.func @trunc_i64(%arg0 : i64) -> (i32, i32 ,i32) {
    // CHECK: %0 = vm.trunc.i64.i8 %arg0 : i64 -> i32
    %0 = vm.trunc.i64.i8 %arg0 : i64 -> i32
    // CHECK-NEXT: %1 = vm.trunc.i64.i16 %arg0 : i64 -> i32
    %1 = vm.trunc.i64.i16 %arg0 : i64 -> i32
    // CHECK-NEXT: %2 = vm.trunc.i64.i32 %arg0 : i64 -> i32
    %2 = vm.trunc.i64.i32 %arg0 : i64 -> i32
    vm.return %0, %1, %2 : i32, i32, i32
  }
}

// -----

// CHECK-LABEL: @ext
vm.module @my_module {
  vm.func @ext(%arg0 : i32) -> i32 {
    // CHECK-NEXT: %0 = vm.ext.i8.i32.s %arg0 : i32 -> i32
    %0 = vm.ext.i8.i32.s %arg0 : i32 -> i32
    // CHECK-NEXT: %1 = vm.ext.i8.i32.u %0 : i32 -> i32
    %1 = vm.ext.i8.i32.u %0 : i32 -> i32
    // CHECK-NEXT: %2 = vm.ext.i16.i32.s %1 : i32 -> i32
    %2 = vm.ext.i16.i32.s %1 : i32 -> i32
    // CHECK-NEXT: %3 = vm.ext.i16.i32.u %2 : i32 -> i32
    %3 = vm.ext.i16.i32.u %2 : i32 -> i32
    vm.return %3 : i32
  }
}

// -----

// CHECK-LABEL: @ext_i64
vm.module @my_module {
  vm.func @ext_i64(%arg0 : i32) -> i64 {
    // CHECK-NEXT: %0 = vm.ext.i8.i64.s %arg0 : i32 -> i64
    %0 = vm.ext.i8.i64.s %arg0 : i32 -> i64
    // CHECK-NEXT: %1 = vm.ext.i8.i64.u %arg0 : i32 -> i64
    %1 = vm.ext.i8.i64.u %arg0 : i32 -> i64
    // CHECK-NEXT: %2 = vm.ext.i16.i64.s %arg0 : i32 -> i64
    %2 = vm.ext.i16.i64.s %arg0 : i32 -> i64
    // CHECK-NEXT: %3 = vm.ext.i16.i64.u %arg0 : i32 -> i64
    %3 = vm.ext.i16.i64.u %arg0 : i32 -> i64
    // CHECK-NEXT: %4 = vm.ext.i32.i64.s %arg0 : i32 -> i64
    %4 = vm.ext.i32.i64.s %arg0 : i32 -> i64
    // CHECK-NEXT: %5 = vm.ext.i32.i64.u %arg0 : i32 -> i64
    %5 = vm.ext.i32.i64.u %arg0 : i32 -> i64
    vm.return %5 : i64
  }
}
