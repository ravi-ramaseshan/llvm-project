# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=skylake-avx512 -instruction-tables < %s | FileCheck %s

cmpxchg8b  (%rax)
cmpxchg16b (%rax)

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  14     16    2.75    *      *            cmpxchg8b	(%rax)
# CHECK-NEXT:  19     23    4.00    *      *            cmpxchg16b	(%rax)

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SKXDivider
# CHECK-NEXT: [1]   - SKXFPDivider
# CHECK-NEXT: [2]   - SKXPort0
# CHECK-NEXT: [3]   - SKXPort1
# CHECK-NEXT: [4]   - SKXPort2
# CHECK-NEXT: [5]   - SKXPort3
# CHECK-NEXT: [6]   - SKXPort4
# CHECK-NEXT: [7]   - SKXPort5
# CHECK-NEXT: [8]   - SKXPort6
# CHECK-NEXT: [9]   - SKXPort7

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]
# CHECK-NEXT:  -      -     8.75   3.75   1.67   1.67   2.00   7.75   6.75   0.67

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    Instructions:
# CHECK-NEXT:  -      -     3.25   2.25   0.83   0.83   1.00   2.25   3.25   0.33   cmpxchg8b	(%rax)
# CHECK-NEXT:  -      -     5.50   1.50   0.83   0.83   1.00   5.50   3.50   0.33   cmpxchg16b	(%rax)
