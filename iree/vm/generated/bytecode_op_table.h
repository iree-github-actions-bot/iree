/*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
|*                                                                            *|
|* IREE VM Operation Tables                                                   *|
|*                                                                            *|
|* Automatically generated file, do not edit!                                 *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

typedef enum {
  IREE_VM_OP_CORE_GlobalLoadI32 = 0x00,
  IREE_VM_OP_CORE_GlobalStoreI32 = 0x01,
  IREE_VM_OP_CORE_GlobalLoadIndirectI32 = 0x02,
  IREE_VM_OP_CORE_GlobalStoreIndirectI32 = 0x03,
  IREE_VM_OP_CORE_GlobalLoadRef = 0x04,
  IREE_VM_OP_CORE_GlobalStoreRef = 0x05,
  IREE_VM_OP_CORE_GlobalLoadIndirectRef = 0x06,
  IREE_VM_OP_CORE_GlobalStoreIndirectRef = 0x07,
  IREE_VM_OP_CORE_ConstI32Zero = 0x08,
  IREE_VM_OP_CORE_ConstI32 = 0x09,
  IREE_VM_OP_CORE_ConstRefZero = 0x0A,
  IREE_VM_OP_CORE_ConstRefRodata = 0x0B,
  IREE_VM_OP_CORE_RSV_0x0C,
  IREE_VM_OP_CORE_RSV_0x0D,
  IREE_VM_OP_CORE_RSV_0x0E,
  IREE_VM_OP_CORE_RSV_0x0F,
  IREE_VM_OP_CORE_ListAlloc = 0x10,
  IREE_VM_OP_CORE_ListReserve = 0x11,
  IREE_VM_OP_CORE_ListSize = 0x12,
  IREE_VM_OP_CORE_ListResize = 0x13,
  IREE_VM_OP_CORE_ListGetI32 = 0x14,
  IREE_VM_OP_CORE_ListSetI32 = 0x15,
  IREE_VM_OP_CORE_ListGetRef = 0x16,
  IREE_VM_OP_CORE_ListSetRef = 0x17,
  IREE_VM_OP_CORE_RSV_0x18,
  IREE_VM_OP_CORE_RSV_0x19,
  IREE_VM_OP_CORE_RSV_0x1A,
  IREE_VM_OP_CORE_RSV_0x1B,
  IREE_VM_OP_CORE_RSV_0x1C,
  IREE_VM_OP_CORE_RSV_0x1D,
  IREE_VM_OP_CORE_SelectI32 = 0x1E,
  IREE_VM_OP_CORE_SelectRef = 0x1F,
  IREE_VM_OP_CORE_SwitchI32 = 0x20,
  IREE_VM_OP_CORE_SwitchRef = 0x21,
  IREE_VM_OP_CORE_AddI32 = 0x22,
  IREE_VM_OP_CORE_SubI32 = 0x23,
  IREE_VM_OP_CORE_MulI32 = 0x24,
  IREE_VM_OP_CORE_DivI32S = 0x25,
  IREE_VM_OP_CORE_DivI32U = 0x26,
  IREE_VM_OP_CORE_RemI32S = 0x27,
  IREE_VM_OP_CORE_RemI32U = 0x28,
  IREE_VM_OP_CORE_NotI32 = 0x29,
  IREE_VM_OP_CORE_AndI32 = 0x2A,
  IREE_VM_OP_CORE_OrI32 = 0x2B,
  IREE_VM_OP_CORE_XorI32 = 0x2C,
  IREE_VM_OP_CORE_ShlI32 = 0x2D,
  IREE_VM_OP_CORE_ShrI32S = 0x2E,
  IREE_VM_OP_CORE_ShrI32U = 0x2F,
  IREE_VM_OP_CORE_RSV_0x30,
  IREE_VM_OP_CORE_TruncI32I8 = 0x31,
  IREE_VM_OP_CORE_TruncI32I16 = 0x32,
  IREE_VM_OP_CORE_ExtI8I32S = 0x33,
  IREE_VM_OP_CORE_ExtI8I32U = 0x34,
  IREE_VM_OP_CORE_ExtI16I32S = 0x35,
  IREE_VM_OP_CORE_ExtI16I32U = 0x36,
  IREE_VM_OP_CORE_RSV_0x37,
  IREE_VM_OP_CORE_RSV_0x38,
  IREE_VM_OP_CORE_RSV_0x39,
  IREE_VM_OP_CORE_RSV_0x3A,
  IREE_VM_OP_CORE_RSV_0x3B,
  IREE_VM_OP_CORE_RSV_0x3C,
  IREE_VM_OP_CORE_RSV_0x3D,
  IREE_VM_OP_CORE_RSV_0x3E,
  IREE_VM_OP_CORE_RSV_0x3F,
  IREE_VM_OP_CORE_CmpEQI32 = 0x40,
  IREE_VM_OP_CORE_CmpNEI32 = 0x41,
  IREE_VM_OP_CORE_CmpLTI32S = 0x42,
  IREE_VM_OP_CORE_CmpLTI32U = 0x43,
  IREE_VM_OP_CORE_RSV_0x44,
  IREE_VM_OP_CORE_RSV_0x45,
  IREE_VM_OP_CORE_RSV_0x46,
  IREE_VM_OP_CORE_RSV_0x47,
  IREE_VM_OP_CORE_RSV_0x48,
  IREE_VM_OP_CORE_RSV_0x49,
  IREE_VM_OP_CORE_CmpEQRef = 0x4A,
  IREE_VM_OP_CORE_CmpNERef = 0x4B,
  IREE_VM_OP_CORE_CmpNZRef = 0x4C,
  IREE_VM_OP_CORE_CmpNZI32 = 0x4D,
  IREE_VM_OP_CORE_RSV_0x4E,
  IREE_VM_OP_CORE_RSV_0x4F,
  IREE_VM_OP_CORE_Branch = 0x50,
  IREE_VM_OP_CORE_CondBranch = 0x51,
  IREE_VM_OP_CORE_Call = 0x52,
  IREE_VM_OP_CORE_CallVariadic = 0x53,
  IREE_VM_OP_CORE_Return = 0x54,
  IREE_VM_OP_CORE_Fail = 0x55,
  IREE_VM_OP_CORE_RSV_0x56,
  IREE_VM_OP_CORE_RSV_0x57,
  IREE_VM_OP_CORE_RSV_0x58,
  IREE_VM_OP_CORE_RSV_0x59,
  IREE_VM_OP_CORE_RSV_0x5A,
  IREE_VM_OP_CORE_RSV_0x5B,
  IREE_VM_OP_CORE_RSV_0x5C,
  IREE_VM_OP_CORE_RSV_0x5D,
  IREE_VM_OP_CORE_RSV_0x5E,
  IREE_VM_OP_CORE_RSV_0x5F,
  IREE_VM_OP_CORE_Yield = 0x60,
  IREE_VM_OP_CORE_RSV_0x61,
  IREE_VM_OP_CORE_RSV_0x62,
  IREE_VM_OP_CORE_RSV_0x63,
  IREE_VM_OP_CORE_RSV_0x64,
  IREE_VM_OP_CORE_RSV_0x65,
  IREE_VM_OP_CORE_RSV_0x66,
  IREE_VM_OP_CORE_RSV_0x67,
  IREE_VM_OP_CORE_RSV_0x68,
  IREE_VM_OP_CORE_RSV_0x69,
  IREE_VM_OP_CORE_RSV_0x6A,
  IREE_VM_OP_CORE_RSV_0x6B,
  IREE_VM_OP_CORE_RSV_0x6C,
  IREE_VM_OP_CORE_RSV_0x6D,
  IREE_VM_OP_CORE_RSV_0x6E,
  IREE_VM_OP_CORE_RSV_0x6F,
  IREE_VM_OP_CORE_RSV_0x70,
  IREE_VM_OP_CORE_RSV_0x71,
  IREE_VM_OP_CORE_RSV_0x72,
  IREE_VM_OP_CORE_RSV_0x73,
  IREE_VM_OP_CORE_RSV_0x74,
  IREE_VM_OP_CORE_RSV_0x75,
  IREE_VM_OP_CORE_RSV_0x76,
  IREE_VM_OP_CORE_RSV_0x77,
  IREE_VM_OP_CORE_RSV_0x78,
  IREE_VM_OP_CORE_RSV_0x79,
  IREE_VM_OP_CORE_RSV_0x7A,
  IREE_VM_OP_CORE_RSV_0x7B,
  IREE_VM_OP_CORE_Trace = 0x7C,
  IREE_VM_OP_CORE_Print = 0x7D,
  IREE_VM_OP_CORE_CondBreak = 0x7E,
  IREE_VM_OP_CORE_Break = 0x7F,
  IREE_VM_OP_CORE_RSV_0x80,
  IREE_VM_OP_CORE_RSV_0x81,
  IREE_VM_OP_CORE_RSV_0x82,
  IREE_VM_OP_CORE_RSV_0x83,
  IREE_VM_OP_CORE_RSV_0x84,
  IREE_VM_OP_CORE_RSV_0x85,
  IREE_VM_OP_CORE_RSV_0x86,
  IREE_VM_OP_CORE_RSV_0x87,
  IREE_VM_OP_CORE_RSV_0x88,
  IREE_VM_OP_CORE_RSV_0x89,
  IREE_VM_OP_CORE_RSV_0x8A,
  IREE_VM_OP_CORE_RSV_0x8B,
  IREE_VM_OP_CORE_RSV_0x8C,
  IREE_VM_OP_CORE_RSV_0x8D,
  IREE_VM_OP_CORE_RSV_0x8E,
  IREE_VM_OP_CORE_RSV_0x8F,
  IREE_VM_OP_CORE_RSV_0x90,
  IREE_VM_OP_CORE_RSV_0x91,
  IREE_VM_OP_CORE_RSV_0x92,
  IREE_VM_OP_CORE_RSV_0x93,
  IREE_VM_OP_CORE_RSV_0x94,
  IREE_VM_OP_CORE_RSV_0x95,
  IREE_VM_OP_CORE_RSV_0x96,
  IREE_VM_OP_CORE_RSV_0x97,
  IREE_VM_OP_CORE_RSV_0x98,
  IREE_VM_OP_CORE_RSV_0x99,
  IREE_VM_OP_CORE_RSV_0x9A,
  IREE_VM_OP_CORE_RSV_0x9B,
  IREE_VM_OP_CORE_RSV_0x9C,
  IREE_VM_OP_CORE_RSV_0x9D,
  IREE_VM_OP_CORE_RSV_0x9E,
  IREE_VM_OP_CORE_RSV_0x9F,
  IREE_VM_OP_CORE_PrefixExtI64 = 0xA0,
  IREE_VM_OP_CORE_PrefixExtF32 = 0xA1,
  IREE_VM_OP_CORE_PrefixExtF64 = 0xA2,
  IREE_VM_OP_CORE_RSV_0xA3,
  IREE_VM_OP_CORE_RSV_0xA4,
  IREE_VM_OP_CORE_RSV_0xA5,
  IREE_VM_OP_CORE_RSV_0xA6,
  IREE_VM_OP_CORE_RSV_0xA7,
  IREE_VM_OP_CORE_RSV_0xA8,
  IREE_VM_OP_CORE_RSV_0xA9,
  IREE_VM_OP_CORE_RSV_0xAA,
  IREE_VM_OP_CORE_RSV_0xAB,
  IREE_VM_OP_CORE_RSV_0xAC,
  IREE_VM_OP_CORE_RSV_0xAD,
  IREE_VM_OP_CORE_RSV_0xAE,
  IREE_VM_OP_CORE_RSV_0xAF,
  IREE_VM_OP_CORE_RSV_0xB0,
  IREE_VM_OP_CORE_RSV_0xB1,
  IREE_VM_OP_CORE_RSV_0xB2,
  IREE_VM_OP_CORE_RSV_0xB3,
  IREE_VM_OP_CORE_RSV_0xB4,
  IREE_VM_OP_CORE_RSV_0xB5,
  IREE_VM_OP_CORE_RSV_0xB6,
  IREE_VM_OP_CORE_RSV_0xB7,
  IREE_VM_OP_CORE_RSV_0xB8,
  IREE_VM_OP_CORE_RSV_0xB9,
  IREE_VM_OP_CORE_RSV_0xBA,
  IREE_VM_OP_CORE_RSV_0xBB,
  IREE_VM_OP_CORE_RSV_0xBC,
  IREE_VM_OP_CORE_RSV_0xBD,
  IREE_VM_OP_CORE_RSV_0xBE,
  IREE_VM_OP_CORE_RSV_0xBF,
  IREE_VM_OP_CORE_RSV_0xC0,
  IREE_VM_OP_CORE_RSV_0xC1,
  IREE_VM_OP_CORE_RSV_0xC2,
  IREE_VM_OP_CORE_RSV_0xC3,
  IREE_VM_OP_CORE_RSV_0xC4,
  IREE_VM_OP_CORE_RSV_0xC5,
  IREE_VM_OP_CORE_RSV_0xC6,
  IREE_VM_OP_CORE_RSV_0xC7,
  IREE_VM_OP_CORE_RSV_0xC8,
  IREE_VM_OP_CORE_RSV_0xC9,
  IREE_VM_OP_CORE_RSV_0xCA,
  IREE_VM_OP_CORE_RSV_0xCB,
  IREE_VM_OP_CORE_RSV_0xCC,
  IREE_VM_OP_CORE_RSV_0xCD,
  IREE_VM_OP_CORE_RSV_0xCE,
  IREE_VM_OP_CORE_RSV_0xCF,
  IREE_VM_OP_CORE_RSV_0xD0,
  IREE_VM_OP_CORE_RSV_0xD1,
  IREE_VM_OP_CORE_RSV_0xD2,
  IREE_VM_OP_CORE_RSV_0xD3,
  IREE_VM_OP_CORE_RSV_0xD4,
  IREE_VM_OP_CORE_RSV_0xD5,
  IREE_VM_OP_CORE_RSV_0xD6,
  IREE_VM_OP_CORE_RSV_0xD7,
  IREE_VM_OP_CORE_RSV_0xD8,
  IREE_VM_OP_CORE_RSV_0xD9,
  IREE_VM_OP_CORE_RSV_0xDA,
  IREE_VM_OP_CORE_RSV_0xDB,
  IREE_VM_OP_CORE_RSV_0xDC,
  IREE_VM_OP_CORE_RSV_0xDD,
  IREE_VM_OP_CORE_RSV_0xDE,
  IREE_VM_OP_CORE_RSV_0xDF,
  IREE_VM_OP_CORE_RSV_0xE0,
  IREE_VM_OP_CORE_RSV_0xE1,
  IREE_VM_OP_CORE_RSV_0xE2,
  IREE_VM_OP_CORE_RSV_0xE3,
  IREE_VM_OP_CORE_RSV_0xE4,
  IREE_VM_OP_CORE_RSV_0xE5,
  IREE_VM_OP_CORE_RSV_0xE6,
  IREE_VM_OP_CORE_RSV_0xE7,
  IREE_VM_OP_CORE_RSV_0xE8,
  IREE_VM_OP_CORE_RSV_0xE9,
  IREE_VM_OP_CORE_RSV_0xEA,
  IREE_VM_OP_CORE_RSV_0xEB,
  IREE_VM_OP_CORE_RSV_0xEC,
  IREE_VM_OP_CORE_RSV_0xED,
  IREE_VM_OP_CORE_RSV_0xEE,
  IREE_VM_OP_CORE_RSV_0xEF,
  IREE_VM_OP_CORE_RSV_0xF0,
  IREE_VM_OP_CORE_RSV_0xF1,
  IREE_VM_OP_CORE_RSV_0xF2,
  IREE_VM_OP_CORE_RSV_0xF3,
  IREE_VM_OP_CORE_RSV_0xF4,
  IREE_VM_OP_CORE_RSV_0xF5,
  IREE_VM_OP_CORE_RSV_0xF6,
  IREE_VM_OP_CORE_RSV_0xF7,
  IREE_VM_OP_CORE_RSV_0xF8,
  IREE_VM_OP_CORE_RSV_0xF9,
  IREE_VM_OP_CORE_RSV_0xFA,
  IREE_VM_OP_CORE_RSV_0xFB,
  IREE_VM_OP_CORE_RSV_0xFC,
  IREE_VM_OP_CORE_RSV_0xFD,
  IREE_VM_OP_CORE_RSV_0xFE,
  IREE_VM_OP_CORE_RSV_0xFF,
} iree_vm_core_op_t;

#define IREE_VM_OP_CORE_TABLE(OPC, RSV) \
    OPC(0x00, GlobalLoadI32) \
    OPC(0x01, GlobalStoreI32) \
    OPC(0x02, GlobalLoadIndirectI32) \
    OPC(0x03, GlobalStoreIndirectI32) \
    OPC(0x04, GlobalLoadRef) \
    OPC(0x05, GlobalStoreRef) \
    OPC(0x06, GlobalLoadIndirectRef) \
    OPC(0x07, GlobalStoreIndirectRef) \
    OPC(0x08, ConstI32Zero) \
    OPC(0x09, ConstI32) \
    OPC(0x0A, ConstRefZero) \
    OPC(0x0B, ConstRefRodata) \
    RSV(0x0C) \
    RSV(0x0D) \
    RSV(0x0E) \
    RSV(0x0F) \
    OPC(0x10, ListAlloc) \
    OPC(0x11, ListReserve) \
    OPC(0x12, ListSize) \
    OPC(0x13, ListResize) \
    OPC(0x14, ListGetI32) \
    OPC(0x15, ListSetI32) \
    OPC(0x16, ListGetRef) \
    OPC(0x17, ListSetRef) \
    RSV(0x18) \
    RSV(0x19) \
    RSV(0x1A) \
    RSV(0x1B) \
    RSV(0x1C) \
    RSV(0x1D) \
    OPC(0x1E, SelectI32) \
    OPC(0x1F, SelectRef) \
    OPC(0x20, SwitchI32) \
    OPC(0x21, SwitchRef) \
    OPC(0x22, AddI32) \
    OPC(0x23, SubI32) \
    OPC(0x24, MulI32) \
    OPC(0x25, DivI32S) \
    OPC(0x26, DivI32U) \
    OPC(0x27, RemI32S) \
    OPC(0x28, RemI32U) \
    OPC(0x29, NotI32) \
    OPC(0x2A, AndI32) \
    OPC(0x2B, OrI32) \
    OPC(0x2C, XorI32) \
    OPC(0x2D, ShlI32) \
    OPC(0x2E, ShrI32S) \
    OPC(0x2F, ShrI32U) \
    RSV(0x30) \
    OPC(0x31, TruncI32I8) \
    OPC(0x32, TruncI32I16) \
    OPC(0x33, ExtI8I32S) \
    OPC(0x34, ExtI8I32U) \
    OPC(0x35, ExtI16I32S) \
    OPC(0x36, ExtI16I32U) \
    RSV(0x37) \
    RSV(0x38) \
    RSV(0x39) \
    RSV(0x3A) \
    RSV(0x3B) \
    RSV(0x3C) \
    RSV(0x3D) \
    RSV(0x3E) \
    RSV(0x3F) \
    OPC(0x40, CmpEQI32) \
    OPC(0x41, CmpNEI32) \
    OPC(0x42, CmpLTI32S) \
    OPC(0x43, CmpLTI32U) \
    RSV(0x44) \
    RSV(0x45) \
    RSV(0x46) \
    RSV(0x47) \
    RSV(0x48) \
    RSV(0x49) \
    OPC(0x4A, CmpEQRef) \
    OPC(0x4B, CmpNERef) \
    OPC(0x4C, CmpNZRef) \
    OPC(0x4D, CmpNZI32) \
    RSV(0x4E) \
    RSV(0x4F) \
    OPC(0x50, Branch) \
    OPC(0x51, CondBranch) \
    OPC(0x52, Call) \
    OPC(0x53, CallVariadic) \
    OPC(0x54, Return) \
    OPC(0x55, Fail) \
    RSV(0x56) \
    RSV(0x57) \
    RSV(0x58) \
    RSV(0x59) \
    RSV(0x5A) \
    RSV(0x5B) \
    RSV(0x5C) \
    RSV(0x5D) \
    RSV(0x5E) \
    RSV(0x5F) \
    OPC(0x60, Yield) \
    RSV(0x61) \
    RSV(0x62) \
    RSV(0x63) \
    RSV(0x64) \
    RSV(0x65) \
    RSV(0x66) \
    RSV(0x67) \
    RSV(0x68) \
    RSV(0x69) \
    RSV(0x6A) \
    RSV(0x6B) \
    RSV(0x6C) \
    RSV(0x6D) \
    RSV(0x6E) \
    RSV(0x6F) \
    RSV(0x70) \
    RSV(0x71) \
    RSV(0x72) \
    RSV(0x73) \
    RSV(0x74) \
    RSV(0x75) \
    RSV(0x76) \
    RSV(0x77) \
    RSV(0x78) \
    RSV(0x79) \
    RSV(0x7A) \
    RSV(0x7B) \
    OPC(0x7C, Trace) \
    OPC(0x7D, Print) \
    OPC(0x7E, CondBreak) \
    OPC(0x7F, Break) \
    RSV(0x80) \
    RSV(0x81) \
    RSV(0x82) \
    RSV(0x83) \
    RSV(0x84) \
    RSV(0x85) \
    RSV(0x86) \
    RSV(0x87) \
    RSV(0x88) \
    RSV(0x89) \
    RSV(0x8A) \
    RSV(0x8B) \
    RSV(0x8C) \
    RSV(0x8D) \
    RSV(0x8E) \
    RSV(0x8F) \
    RSV(0x90) \
    RSV(0x91) \
    RSV(0x92) \
    RSV(0x93) \
    RSV(0x94) \
    RSV(0x95) \
    RSV(0x96) \
    RSV(0x97) \
    RSV(0x98) \
    RSV(0x99) \
    RSV(0x9A) \
    RSV(0x9B) \
    RSV(0x9C) \
    RSV(0x9D) \
    RSV(0x9E) \
    RSV(0x9F) \
    OPC(0xA0, PrefixExtI64) \
    OPC(0xA1, PrefixExtF32) \
    OPC(0xA2, PrefixExtF64) \
    RSV(0xA3) \
    RSV(0xA4) \
    RSV(0xA5) \
    RSV(0xA6) \
    RSV(0xA7) \
    RSV(0xA8) \
    RSV(0xA9) \
    RSV(0xAA) \
    RSV(0xAB) \
    RSV(0xAC) \
    RSV(0xAD) \
    RSV(0xAE) \
    RSV(0xAF) \
    RSV(0xB0) \
    RSV(0xB1) \
    RSV(0xB2) \
    RSV(0xB3) \
    RSV(0xB4) \
    RSV(0xB5) \
    RSV(0xB6) \
    RSV(0xB7) \
    RSV(0xB8) \
    RSV(0xB9) \
    RSV(0xBA) \
    RSV(0xBB) \
    RSV(0xBC) \
    RSV(0xBD) \
    RSV(0xBE) \
    RSV(0xBF) \
    RSV(0xC0) \
    RSV(0xC1) \
    RSV(0xC2) \
    RSV(0xC3) \
    RSV(0xC4) \
    RSV(0xC5) \
    RSV(0xC6) \
    RSV(0xC7) \
    RSV(0xC8) \
    RSV(0xC9) \
    RSV(0xCA) \
    RSV(0xCB) \
    RSV(0xCC) \
    RSV(0xCD) \
    RSV(0xCE) \
    RSV(0xCF) \
    RSV(0xD0) \
    RSV(0xD1) \
    RSV(0xD2) \
    RSV(0xD3) \
    RSV(0xD4) \
    RSV(0xD5) \
    RSV(0xD6) \
    RSV(0xD7) \
    RSV(0xD8) \
    RSV(0xD9) \
    RSV(0xDA) \
    RSV(0xDB) \
    RSV(0xDC) \
    RSV(0xDD) \
    RSV(0xDE) \
    RSV(0xDF) \
    RSV(0xE0) \
    RSV(0xE1) \
    RSV(0xE2) \
    RSV(0xE3) \
    RSV(0xE4) \
    RSV(0xE5) \
    RSV(0xE6) \
    RSV(0xE7) \
    RSV(0xE8) \
    RSV(0xE9) \
    RSV(0xEA) \
    RSV(0xEB) \
    RSV(0xEC) \
    RSV(0xED) \
    RSV(0xEE) \
    RSV(0xEF) \
    RSV(0xF0) \
    RSV(0xF1) \
    RSV(0xF2) \
    RSV(0xF3) \
    RSV(0xF4) \
    RSV(0xF5) \
    RSV(0xF6) \
    RSV(0xF7) \
    RSV(0xF8) \
    RSV(0xF9) \
    RSV(0xFA) \
    RSV(0xFB) \
    RSV(0xFC) \
    RSV(0xFD) \
    RSV(0xFE) \
    RSV(0xFF)

typedef enum {
  IREE_VM_OP_EXT_I64_GlobalLoadI64 = 0x00,
  IREE_VM_OP_EXT_I64_GlobalStoreI64 = 0x01,
  IREE_VM_OP_EXT_I64_GlobalLoadIndirectI64 = 0x02,
  IREE_VM_OP_EXT_I64_GlobalStoreIndirectI64 = 0x03,
  IREE_VM_OP_EXT_I64_RSV_0x04,
  IREE_VM_OP_EXT_I64_RSV_0x05,
  IREE_VM_OP_EXT_I64_RSV_0x06,
  IREE_VM_OP_EXT_I64_RSV_0x07,
  IREE_VM_OP_EXT_I64_ConstI64Zero = 0x08,
  IREE_VM_OP_EXT_I64_ConstI64 = 0x09,
  IREE_VM_OP_EXT_I64_RSV_0x0A,
  IREE_VM_OP_EXT_I64_RSV_0x0B,
  IREE_VM_OP_EXT_I64_RSV_0x0C,
  IREE_VM_OP_EXT_I64_RSV_0x0D,
  IREE_VM_OP_EXT_I64_RSV_0x0E,
  IREE_VM_OP_EXT_I64_RSV_0x0F,
  IREE_VM_OP_EXT_I64_RSV_0x10,
  IREE_VM_OP_EXT_I64_RSV_0x11,
  IREE_VM_OP_EXT_I64_RSV_0x12,
  IREE_VM_OP_EXT_I64_RSV_0x13,
  IREE_VM_OP_EXT_I64_ListGetI64 = 0x14,
  IREE_VM_OP_EXT_I64_ListSetI64 = 0x15,
  IREE_VM_OP_EXT_I64_RSV_0x16,
  IREE_VM_OP_EXT_I64_RSV_0x17,
  IREE_VM_OP_EXT_I64_RSV_0x18,
  IREE_VM_OP_EXT_I64_RSV_0x19,
  IREE_VM_OP_EXT_I64_RSV_0x1A,
  IREE_VM_OP_EXT_I64_RSV_0x1B,
  IREE_VM_OP_EXT_I64_RSV_0x1C,
  IREE_VM_OP_EXT_I64_RSV_0x1D,
  IREE_VM_OP_EXT_I64_SelectI64 = 0x1E,
  IREE_VM_OP_EXT_I64_RSV_0x1F,
  IREE_VM_OP_EXT_I64_SwitchI64 = 0x20,
  IREE_VM_OP_EXT_I64_RSV_0x21,
  IREE_VM_OP_EXT_I64_AddI64 = 0x22,
  IREE_VM_OP_EXT_I64_SubI64 = 0x23,
  IREE_VM_OP_EXT_I64_MulI64 = 0x24,
  IREE_VM_OP_EXT_I64_DivI64S = 0x25,
  IREE_VM_OP_EXT_I64_DivI64U = 0x26,
  IREE_VM_OP_EXT_I64_RemI64S = 0x27,
  IREE_VM_OP_EXT_I64_RemI64U = 0x28,
  IREE_VM_OP_EXT_I64_NotI64 = 0x29,
  IREE_VM_OP_EXT_I64_AndI64 = 0x2A,
  IREE_VM_OP_EXT_I64_OrI64 = 0x2B,
  IREE_VM_OP_EXT_I64_XorI64 = 0x2C,
  IREE_VM_OP_EXT_I64_ShlI64 = 0x2D,
  IREE_VM_OP_EXT_I64_ShrI64S = 0x2E,
  IREE_VM_OP_EXT_I64_ShrI64U = 0x2F,
  IREE_VM_OP_EXT_I64_RSV_0x30,
  IREE_VM_OP_EXT_I64_RSV_0x31,
  IREE_VM_OP_EXT_I64_TruncI64I32 = 0x32,
  IREE_VM_OP_EXT_I64_RSV_0x33,
  IREE_VM_OP_EXT_I64_RSV_0x34,
  IREE_VM_OP_EXT_I64_RSV_0x35,
  IREE_VM_OP_EXT_I64_RSV_0x36,
  IREE_VM_OP_EXT_I64_ExtI32I64S = 0x37,
  IREE_VM_OP_EXT_I64_ExtI32I64U = 0x38,
  IREE_VM_OP_EXT_I64_RSV_0x39,
  IREE_VM_OP_EXT_I64_RSV_0x3A,
  IREE_VM_OP_EXT_I64_RSV_0x3B,
  IREE_VM_OP_EXT_I64_RSV_0x3C,
  IREE_VM_OP_EXT_I64_RSV_0x3D,
  IREE_VM_OP_EXT_I64_RSV_0x3E,
  IREE_VM_OP_EXT_I64_RSV_0x3F,
  IREE_VM_OP_EXT_I64_CmpEQI64 = 0x40,
  IREE_VM_OP_EXT_I64_CmpNEI64 = 0x41,
  IREE_VM_OP_EXT_I64_CmpLTI64S = 0x42,
  IREE_VM_OP_EXT_I64_CmpLTI64U = 0x43,
  IREE_VM_OP_EXT_I64_RSV_0x44,
  IREE_VM_OP_EXT_I64_RSV_0x45,
  IREE_VM_OP_EXT_I64_RSV_0x46,
  IREE_VM_OP_EXT_I64_RSV_0x47,
  IREE_VM_OP_EXT_I64_RSV_0x48,
  IREE_VM_OP_EXT_I64_RSV_0x49,
  IREE_VM_OP_EXT_I64_RSV_0x4A,
  IREE_VM_OP_EXT_I64_RSV_0x4B,
  IREE_VM_OP_EXT_I64_RSV_0x4C,
  IREE_VM_OP_EXT_I64_CmpNZI64 = 0x4D,
  IREE_VM_OP_EXT_I64_RSV_0x4E,
  IREE_VM_OP_EXT_I64_RSV_0x4F,
  IREE_VM_OP_EXT_I64_RSV_0x50,
  IREE_VM_OP_EXT_I64_RSV_0x51,
  IREE_VM_OP_EXT_I64_RSV_0x52,
  IREE_VM_OP_EXT_I64_RSV_0x53,
  IREE_VM_OP_EXT_I64_RSV_0x54,
  IREE_VM_OP_EXT_I64_RSV_0x55,
  IREE_VM_OP_EXT_I64_RSV_0x56,
  IREE_VM_OP_EXT_I64_RSV_0x57,
  IREE_VM_OP_EXT_I64_RSV_0x58,
  IREE_VM_OP_EXT_I64_RSV_0x59,
  IREE_VM_OP_EXT_I64_RSV_0x5A,
  IREE_VM_OP_EXT_I64_RSV_0x5B,
  IREE_VM_OP_EXT_I64_RSV_0x5C,
  IREE_VM_OP_EXT_I64_RSV_0x5D,
  IREE_VM_OP_EXT_I64_RSV_0x5E,
  IREE_VM_OP_EXT_I64_RSV_0x5F,
  IREE_VM_OP_EXT_I64_RSV_0x60,
  IREE_VM_OP_EXT_I64_RSV_0x61,
  IREE_VM_OP_EXT_I64_RSV_0x62,
  IREE_VM_OP_EXT_I64_RSV_0x63,
  IREE_VM_OP_EXT_I64_RSV_0x64,
  IREE_VM_OP_EXT_I64_RSV_0x65,
  IREE_VM_OP_EXT_I64_RSV_0x66,
  IREE_VM_OP_EXT_I64_RSV_0x67,
  IREE_VM_OP_EXT_I64_RSV_0x68,
  IREE_VM_OP_EXT_I64_RSV_0x69,
  IREE_VM_OP_EXT_I64_RSV_0x6A,
  IREE_VM_OP_EXT_I64_RSV_0x6B,
  IREE_VM_OP_EXT_I64_RSV_0x6C,
  IREE_VM_OP_EXT_I64_RSV_0x6D,
  IREE_VM_OP_EXT_I64_RSV_0x6E,
  IREE_VM_OP_EXT_I64_RSV_0x6F,
  IREE_VM_OP_EXT_I64_RSV_0x70,
  IREE_VM_OP_EXT_I64_RSV_0x71,
  IREE_VM_OP_EXT_I64_RSV_0x72,
  IREE_VM_OP_EXT_I64_RSV_0x73,
  IREE_VM_OP_EXT_I64_RSV_0x74,
  IREE_VM_OP_EXT_I64_RSV_0x75,
  IREE_VM_OP_EXT_I64_RSV_0x76,
  IREE_VM_OP_EXT_I64_RSV_0x77,
  IREE_VM_OP_EXT_I64_RSV_0x78,
  IREE_VM_OP_EXT_I64_RSV_0x79,
  IREE_VM_OP_EXT_I64_RSV_0x7A,
  IREE_VM_OP_EXT_I64_RSV_0x7B,
  IREE_VM_OP_EXT_I64_RSV_0x7C,
  IREE_VM_OP_EXT_I64_RSV_0x7D,
  IREE_VM_OP_EXT_I64_RSV_0x7E,
  IREE_VM_OP_EXT_I64_RSV_0x7F,
  IREE_VM_OP_EXT_I64_RSV_0x80,
  IREE_VM_OP_EXT_I64_RSV_0x81,
  IREE_VM_OP_EXT_I64_RSV_0x82,
  IREE_VM_OP_EXT_I64_RSV_0x83,
  IREE_VM_OP_EXT_I64_RSV_0x84,
  IREE_VM_OP_EXT_I64_RSV_0x85,
  IREE_VM_OP_EXT_I64_RSV_0x86,
  IREE_VM_OP_EXT_I64_RSV_0x87,
  IREE_VM_OP_EXT_I64_RSV_0x88,
  IREE_VM_OP_EXT_I64_RSV_0x89,
  IREE_VM_OP_EXT_I64_RSV_0x8A,
  IREE_VM_OP_EXT_I64_RSV_0x8B,
  IREE_VM_OP_EXT_I64_RSV_0x8C,
  IREE_VM_OP_EXT_I64_RSV_0x8D,
  IREE_VM_OP_EXT_I64_RSV_0x8E,
  IREE_VM_OP_EXT_I64_RSV_0x8F,
  IREE_VM_OP_EXT_I64_RSV_0x90,
  IREE_VM_OP_EXT_I64_RSV_0x91,
  IREE_VM_OP_EXT_I64_RSV_0x92,
  IREE_VM_OP_EXT_I64_RSV_0x93,
  IREE_VM_OP_EXT_I64_RSV_0x94,
  IREE_VM_OP_EXT_I64_RSV_0x95,
  IREE_VM_OP_EXT_I64_RSV_0x96,
  IREE_VM_OP_EXT_I64_RSV_0x97,
  IREE_VM_OP_EXT_I64_RSV_0x98,
  IREE_VM_OP_EXT_I64_RSV_0x99,
  IREE_VM_OP_EXT_I64_RSV_0x9A,
  IREE_VM_OP_EXT_I64_RSV_0x9B,
  IREE_VM_OP_EXT_I64_RSV_0x9C,
  IREE_VM_OP_EXT_I64_RSV_0x9D,
  IREE_VM_OP_EXT_I64_RSV_0x9E,
  IREE_VM_OP_EXT_I64_RSV_0x9F,
  IREE_VM_OP_EXT_I64_RSV_0xA0,
  IREE_VM_OP_EXT_I64_RSV_0xA1,
  IREE_VM_OP_EXT_I64_RSV_0xA2,
  IREE_VM_OP_EXT_I64_RSV_0xA3,
  IREE_VM_OP_EXT_I64_RSV_0xA4,
  IREE_VM_OP_EXT_I64_RSV_0xA5,
  IREE_VM_OP_EXT_I64_RSV_0xA6,
  IREE_VM_OP_EXT_I64_RSV_0xA7,
  IREE_VM_OP_EXT_I64_RSV_0xA8,
  IREE_VM_OP_EXT_I64_RSV_0xA9,
  IREE_VM_OP_EXT_I64_RSV_0xAA,
  IREE_VM_OP_EXT_I64_RSV_0xAB,
  IREE_VM_OP_EXT_I64_RSV_0xAC,
  IREE_VM_OP_EXT_I64_RSV_0xAD,
  IREE_VM_OP_EXT_I64_RSV_0xAE,
  IREE_VM_OP_EXT_I64_RSV_0xAF,
  IREE_VM_OP_EXT_I64_RSV_0xB0,
  IREE_VM_OP_EXT_I64_RSV_0xB1,
  IREE_VM_OP_EXT_I64_RSV_0xB2,
  IREE_VM_OP_EXT_I64_RSV_0xB3,
  IREE_VM_OP_EXT_I64_RSV_0xB4,
  IREE_VM_OP_EXT_I64_RSV_0xB5,
  IREE_VM_OP_EXT_I64_RSV_0xB6,
  IREE_VM_OP_EXT_I64_RSV_0xB7,
  IREE_VM_OP_EXT_I64_RSV_0xB8,
  IREE_VM_OP_EXT_I64_RSV_0xB9,
  IREE_VM_OP_EXT_I64_RSV_0xBA,
  IREE_VM_OP_EXT_I64_RSV_0xBB,
  IREE_VM_OP_EXT_I64_RSV_0xBC,
  IREE_VM_OP_EXT_I64_RSV_0xBD,
  IREE_VM_OP_EXT_I64_RSV_0xBE,
  IREE_VM_OP_EXT_I64_RSV_0xBF,
  IREE_VM_OP_EXT_I64_RSV_0xC0,
  IREE_VM_OP_EXT_I64_RSV_0xC1,
  IREE_VM_OP_EXT_I64_RSV_0xC2,
  IREE_VM_OP_EXT_I64_RSV_0xC3,
  IREE_VM_OP_EXT_I64_RSV_0xC4,
  IREE_VM_OP_EXT_I64_RSV_0xC5,
  IREE_VM_OP_EXT_I64_RSV_0xC6,
  IREE_VM_OP_EXT_I64_RSV_0xC7,
  IREE_VM_OP_EXT_I64_RSV_0xC8,
  IREE_VM_OP_EXT_I64_RSV_0xC9,
  IREE_VM_OP_EXT_I64_RSV_0xCA,
  IREE_VM_OP_EXT_I64_RSV_0xCB,
  IREE_VM_OP_EXT_I64_RSV_0xCC,
  IREE_VM_OP_EXT_I64_RSV_0xCD,
  IREE_VM_OP_EXT_I64_RSV_0xCE,
  IREE_VM_OP_EXT_I64_RSV_0xCF,
  IREE_VM_OP_EXT_I64_RSV_0xD0,
  IREE_VM_OP_EXT_I64_RSV_0xD1,
  IREE_VM_OP_EXT_I64_RSV_0xD2,
  IREE_VM_OP_EXT_I64_RSV_0xD3,
  IREE_VM_OP_EXT_I64_RSV_0xD4,
  IREE_VM_OP_EXT_I64_RSV_0xD5,
  IREE_VM_OP_EXT_I64_RSV_0xD6,
  IREE_VM_OP_EXT_I64_RSV_0xD7,
  IREE_VM_OP_EXT_I64_RSV_0xD8,
  IREE_VM_OP_EXT_I64_RSV_0xD9,
  IREE_VM_OP_EXT_I64_RSV_0xDA,
  IREE_VM_OP_EXT_I64_RSV_0xDB,
  IREE_VM_OP_EXT_I64_RSV_0xDC,
  IREE_VM_OP_EXT_I64_RSV_0xDD,
  IREE_VM_OP_EXT_I64_RSV_0xDE,
  IREE_VM_OP_EXT_I64_RSV_0xDF,
  IREE_VM_OP_EXT_I64_RSV_0xE0,
  IREE_VM_OP_EXT_I64_RSV_0xE1,
  IREE_VM_OP_EXT_I64_RSV_0xE2,
  IREE_VM_OP_EXT_I64_RSV_0xE3,
  IREE_VM_OP_EXT_I64_RSV_0xE4,
  IREE_VM_OP_EXT_I64_RSV_0xE5,
  IREE_VM_OP_EXT_I64_RSV_0xE6,
  IREE_VM_OP_EXT_I64_RSV_0xE7,
  IREE_VM_OP_EXT_I64_RSV_0xE8,
  IREE_VM_OP_EXT_I64_RSV_0xE9,
  IREE_VM_OP_EXT_I64_RSV_0xEA,
  IREE_VM_OP_EXT_I64_RSV_0xEB,
  IREE_VM_OP_EXT_I64_RSV_0xEC,
  IREE_VM_OP_EXT_I64_RSV_0xED,
  IREE_VM_OP_EXT_I64_RSV_0xEE,
  IREE_VM_OP_EXT_I64_RSV_0xEF,
  IREE_VM_OP_EXT_I64_RSV_0xF0,
  IREE_VM_OP_EXT_I64_RSV_0xF1,
  IREE_VM_OP_EXT_I64_RSV_0xF2,
  IREE_VM_OP_EXT_I64_RSV_0xF3,
  IREE_VM_OP_EXT_I64_RSV_0xF4,
  IREE_VM_OP_EXT_I64_RSV_0xF5,
  IREE_VM_OP_EXT_I64_RSV_0xF6,
  IREE_VM_OP_EXT_I64_RSV_0xF7,
  IREE_VM_OP_EXT_I64_RSV_0xF8,
  IREE_VM_OP_EXT_I64_RSV_0xF9,
  IREE_VM_OP_EXT_I64_RSV_0xFA,
  IREE_VM_OP_EXT_I64_RSV_0xFB,
  IREE_VM_OP_EXT_I64_RSV_0xFC,
  IREE_VM_OP_EXT_I64_RSV_0xFD,
  IREE_VM_OP_EXT_I64_RSV_0xFE,
  IREE_VM_OP_EXT_I64_RSV_0xFF,
} iree_vm_ext_i64_op_t;

#define IREE_VM_OP_EXT_I64_TABLE(OPC, RSV) \
    OPC(0x00, GlobalLoadI64) \
    OPC(0x01, GlobalStoreI64) \
    OPC(0x02, GlobalLoadIndirectI64) \
    OPC(0x03, GlobalStoreIndirectI64) \
    RSV(0x04) \
    RSV(0x05) \
    RSV(0x06) \
    RSV(0x07) \
    OPC(0x08, ConstI64Zero) \
    OPC(0x09, ConstI64) \
    RSV(0x0A) \
    RSV(0x0B) \
    RSV(0x0C) \
    RSV(0x0D) \
    RSV(0x0E) \
    RSV(0x0F) \
    RSV(0x10) \
    RSV(0x11) \
    RSV(0x12) \
    RSV(0x13) \
    OPC(0x14, ListGetI64) \
    OPC(0x15, ListSetI64) \
    RSV(0x16) \
    RSV(0x17) \
    RSV(0x18) \
    RSV(0x19) \
    RSV(0x1A) \
    RSV(0x1B) \
    RSV(0x1C) \
    RSV(0x1D) \
    OPC(0x1E, SelectI64) \
    RSV(0x1F) \
    OPC(0x20, SwitchI64) \
    RSV(0x21) \
    OPC(0x22, AddI64) \
    OPC(0x23, SubI64) \
    OPC(0x24, MulI64) \
    OPC(0x25, DivI64S) \
    OPC(0x26, DivI64U) \
    OPC(0x27, RemI64S) \
    OPC(0x28, RemI64U) \
    OPC(0x29, NotI64) \
    OPC(0x2A, AndI64) \
    OPC(0x2B, OrI64) \
    OPC(0x2C, XorI64) \
    OPC(0x2D, ShlI64) \
    OPC(0x2E, ShrI64S) \
    OPC(0x2F, ShrI64U) \
    RSV(0x30) \
    RSV(0x31) \
    OPC(0x32, TruncI64I32) \
    RSV(0x33) \
    RSV(0x34) \
    RSV(0x35) \
    RSV(0x36) \
    OPC(0x37, ExtI32I64S) \
    OPC(0x38, ExtI32I64U) \
    RSV(0x39) \
    RSV(0x3A) \
    RSV(0x3B) \
    RSV(0x3C) \
    RSV(0x3D) \
    RSV(0x3E) \
    RSV(0x3F) \
    OPC(0x40, CmpEQI64) \
    OPC(0x41, CmpNEI64) \
    OPC(0x42, CmpLTI64S) \
    OPC(0x43, CmpLTI64U) \
    RSV(0x44) \
    RSV(0x45) \
    RSV(0x46) \
    RSV(0x47) \
    RSV(0x48) \
    RSV(0x49) \
    RSV(0x4A) \
    RSV(0x4B) \
    RSV(0x4C) \
    OPC(0x4D, CmpNZI64) \
    RSV(0x4E) \
    RSV(0x4F) \
    RSV(0x50) \
    RSV(0x51) \
    RSV(0x52) \
    RSV(0x53) \
    RSV(0x54) \
    RSV(0x55) \
    RSV(0x56) \
    RSV(0x57) \
    RSV(0x58) \
    RSV(0x59) \
    RSV(0x5A) \
    RSV(0x5B) \
    RSV(0x5C) \
    RSV(0x5D) \
    RSV(0x5E) \
    RSV(0x5F) \
    RSV(0x60) \
    RSV(0x61) \
    RSV(0x62) \
    RSV(0x63) \
    RSV(0x64) \
    RSV(0x65) \
    RSV(0x66) \
    RSV(0x67) \
    RSV(0x68) \
    RSV(0x69) \
    RSV(0x6A) \
    RSV(0x6B) \
    RSV(0x6C) \
    RSV(0x6D) \
    RSV(0x6E) \
    RSV(0x6F) \
    RSV(0x70) \
    RSV(0x71) \
    RSV(0x72) \
    RSV(0x73) \
    RSV(0x74) \
    RSV(0x75) \
    RSV(0x76) \
    RSV(0x77) \
    RSV(0x78) \
    RSV(0x79) \
    RSV(0x7A) \
    RSV(0x7B) \
    RSV(0x7C) \
    RSV(0x7D) \
    RSV(0x7E) \
    RSV(0x7F) \
    RSV(0x80) \
    RSV(0x81) \
    RSV(0x82) \
    RSV(0x83) \
    RSV(0x84) \
    RSV(0x85) \
    RSV(0x86) \
    RSV(0x87) \
    RSV(0x88) \
    RSV(0x89) \
    RSV(0x8A) \
    RSV(0x8B) \
    RSV(0x8C) \
    RSV(0x8D) \
    RSV(0x8E) \
    RSV(0x8F) \
    RSV(0x90) \
    RSV(0x91) \
    RSV(0x92) \
    RSV(0x93) \
    RSV(0x94) \
    RSV(0x95) \
    RSV(0x96) \
    RSV(0x97) \
    RSV(0x98) \
    RSV(0x99) \
    RSV(0x9A) \
    RSV(0x9B) \
    RSV(0x9C) \
    RSV(0x9D) \
    RSV(0x9E) \
    RSV(0x9F) \
    RSV(0xA0) \
    RSV(0xA1) \
    RSV(0xA2) \
    RSV(0xA3) \
    RSV(0xA4) \
    RSV(0xA5) \
    RSV(0xA6) \
    RSV(0xA7) \
    RSV(0xA8) \
    RSV(0xA9) \
    RSV(0xAA) \
    RSV(0xAB) \
    RSV(0xAC) \
    RSV(0xAD) \
    RSV(0xAE) \
    RSV(0xAF) \
    RSV(0xB0) \
    RSV(0xB1) \
    RSV(0xB2) \
    RSV(0xB3) \
    RSV(0xB4) \
    RSV(0xB5) \
    RSV(0xB6) \
    RSV(0xB7) \
    RSV(0xB8) \
    RSV(0xB9) \
    RSV(0xBA) \
    RSV(0xBB) \
    RSV(0xBC) \
    RSV(0xBD) \
    RSV(0xBE) \
    RSV(0xBF) \
    RSV(0xC0) \
    RSV(0xC1) \
    RSV(0xC2) \
    RSV(0xC3) \
    RSV(0xC4) \
    RSV(0xC5) \
    RSV(0xC6) \
    RSV(0xC7) \
    RSV(0xC8) \
    RSV(0xC9) \
    RSV(0xCA) \
    RSV(0xCB) \
    RSV(0xCC) \
    RSV(0xCD) \
    RSV(0xCE) \
    RSV(0xCF) \
    RSV(0xD0) \
    RSV(0xD1) \
    RSV(0xD2) \
    RSV(0xD3) \
    RSV(0xD4) \
    RSV(0xD5) \
    RSV(0xD6) \
    RSV(0xD7) \
    RSV(0xD8) \
    RSV(0xD9) \
    RSV(0xDA) \
    RSV(0xDB) \
    RSV(0xDC) \
    RSV(0xDD) \
    RSV(0xDE) \
    RSV(0xDF) \
    RSV(0xE0) \
    RSV(0xE1) \
    RSV(0xE2) \
    RSV(0xE3) \
    RSV(0xE4) \
    RSV(0xE5) \
    RSV(0xE6) \
    RSV(0xE7) \
    RSV(0xE8) \
    RSV(0xE9) \
    RSV(0xEA) \
    RSV(0xEB) \
    RSV(0xEC) \
    RSV(0xED) \
    RSV(0xEE) \
    RSV(0xEF) \
    RSV(0xF0) \
    RSV(0xF1) \
    RSV(0xF2) \
    RSV(0xF3) \
    RSV(0xF4) \
    RSV(0xF5) \
    RSV(0xF6) \
    RSV(0xF7) \
    RSV(0xF8) \
    RSV(0xF9) \
    RSV(0xFA) \
    RSV(0xFB) \
    RSV(0xFC) \
    RSV(0xFD) \
    RSV(0xFE) \
    RSV(0xFF)

