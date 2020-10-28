// ResNet model with placeholder weights, for testing.

// RUN: iree-run-mlir -export-all -iree-hal-target-backends=vmla %s -function-input="1x224x224x3xf32" | IreeFileCheck %s
// RUN: [[ $IREE_LLVMJIT_DISABLE == 1 ]] || (iree-run-mlir -export-all -iree-hal-target-backends=llvm-ir %s -function-input="1x224x224x3xf32" | IreeFileCheck %s)
// RUN: [[ $IREE_VULKAN_DISABLE == 1 ]] || (iree-run-mlir -export-all -iree-hal-target-backends=vulkan-spirv %s -function-input="1x224x224x3xf32" | IreeFileCheck %s)

module attributes {tf.versions = {bad_consumers = [], min_consumer = 12 : i32, producer = 443 : i32}} {
  flow.variable @"__iree_flow___sm_node188__m.layer-2.kernel" dense<1.000000e+00> : tensor<7x7x3x64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node189__m.layer-2.bias" dense<5.000000e-01> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node195__m.layer-3.gamma" dense<0.333333343> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node196__m.layer-3.beta" dense<2.500000e-01> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node197__m.layer-3.moving_mean" dense<2.000000e-01> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node198__m.layer-3.moving_variance" dense<0.166666672> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node215__m.layer-7.kernel" dense<0.142857149> : tensor<1x1x64x64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node216__m.layer-7.bias" dense<1.250000e-01> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node222__m.layer-8.gamma" dense<0.111111112> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node223__m.layer-8.beta" dense<1.000000e-01> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node224__m.layer-8.moving_mean" dense<0.0909090936> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node225__m.layer-8.moving_variance" dense<0.0833333358> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node234__m.layer-10.kernel" dense<0.0769230798> : tensor<3x3x64x64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node235__m.layer-10.bias" dense<0.0714285746> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node241__m.layer-11.gamma" dense<0.0666666701> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node242__m.layer-11.beta" dense<6.250000e-02> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node243__m.layer-11.moving_mean" dense<0.0588235296> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node244__m.layer-11.moving_variance" dense<0.055555556> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node253__m.layer-13.kernel" dense<0.0526315793> : tensor<1x1x64x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node254__m.layer-13.bias" dense<5.000000e-02> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node259__m.layer-14.kernel" dense<0.0476190485> : tensor<1x1x64x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node260__m.layer-14.bias" dense<0.0454545468> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node266__m.layer-15.gamma" dense<0.0434782617> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node267__m.layer-15.beta" dense<0.0416666679> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node268__m.layer-15.moving_mean" dense<4.000000e-02> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node269__m.layer-15.moving_variance" dense<0.0384615399> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node275__m.layer-16.gamma" dense<0.0370370373> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node276__m.layer-16.beta" dense<0.0357142873> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node277__m.layer-16.moving_mean" dense<0.0344827585> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node278__m.layer-16.moving_variance" dense<0.0333333351> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node291__m.layer-19.kernel" dense<0.0322580636> : tensor<1x1x256x64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node292__m.layer-19.bias" dense<3.125000e-02> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node298__m.layer-20.gamma" dense<0.0303030312> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node299__m.layer-20.beta" dense<0.0294117648> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node300__m.layer-20.moving_mean" dense<0.0285714287> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node301__m.layer-20.moving_variance" dense<0.027777778> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node310__m.layer-22.kernel" dense<0.0270270277> : tensor<3x3x64x64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node311__m.layer-22.bias" dense<0.0263157897> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node317__m.layer-23.gamma" dense<0.025641026> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node318__m.layer-23.beta" dense<2.500000e-02> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node319__m.layer-23.moving_mean" dense<0.024390243> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node320__m.layer-23.moving_variance" dense<0.0238095243> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node329__m.layer-25.kernel" dense<0.0232558139> : tensor<1x1x64x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node330__m.layer-25.bias" dense<0.0227272734> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node336__m.layer-26.gamma" dense<0.0222222228> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node337__m.layer-26.beta" dense<0.0217391308> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node338__m.layer-26.moving_mean" dense<0.0212765951> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node339__m.layer-26.moving_variance" dense<0.020833334> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node352__m.layer-29.kernel" dense<0.0204081628> : tensor<1x1x256x64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node353__m.layer-29.bias" dense<2.000000e-02> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node359__m.layer-30.gamma" dense<0.0196078438> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node360__m.layer-30.beta" dense<0.0192307699> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node361__m.layer-30.moving_mean" dense<0.0188679248> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node362__m.layer-30.moving_variance" dense<0.0185185187> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node371__m.layer-32.kernel" dense<0.0181818176> : tensor<3x3x64x64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node372__m.layer-32.bias" dense<0.0178571437> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node378__m.layer-33.gamma" dense<0.0175438598> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node379__m.layer-33.beta" dense<0.0172413792> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node380__m.layer-33.moving_mean" dense<0.0169491526> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node381__m.layer-33.moving_variance" dense<0.0166666675> : tensor<64xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node390__m.layer-35.kernel" dense<0.0163934417> : tensor<1x1x64x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node391__m.layer-35.bias" dense<0.0161290318> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node397__m.layer-36.gamma" dense<0.0158730168> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node398__m.layer-36.beta" dense<1.562500e-02> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node399__m.layer-36.moving_mean" dense<0.0153846154> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node400__m.layer-36.moving_variance" dense<0.0151515156> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node413__m.layer-39.kernel" dense<0.0149253728> : tensor<1x1x256x128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node414__m.layer-39.bias" dense<0.0147058824> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node420__m.layer-40.gamma" dense<0.0144927539> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node421__m.layer-40.beta" dense<0.0142857144> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node422__m.layer-40.moving_mean" dense<0.0140845068> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node423__m.layer-40.moving_variance" dense<0.013888889> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node432__m.layer-42.kernel" dense<0.01369863> : tensor<3x3x128x128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node433__m.layer-42.bias" dense<0.0135135138> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node439__m.layer-43.gamma" dense<0.0133333337> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node440__m.layer-43.beta" dense<0.0131578948> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node441__m.layer-43.moving_mean" dense<0.012987013> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node442__m.layer-43.moving_variance" dense<0.012820513> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node451__m.layer-45.kernel" dense<0.0126582282> : tensor<1x1x256x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node452__m.layer-45.bias" dense<1.250000e-02> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node457__m.layer-46.kernel" dense<0.0123456791> : tensor<1x1x128x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node458__m.layer-46.bias" dense<0.0121951215> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node464__m.layer-47.gamma" dense<0.0120481923> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node465__m.layer-47.beta" dense<0.0119047621> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node466__m.layer-47.moving_mean" dense<0.0117647061> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node467__m.layer-47.moving_variance" dense<0.0116279069> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node473__m.layer-48.gamma" dense<0.0114942528> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node474__m.layer-48.beta" dense<0.0113636367> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node475__m.layer-48.moving_mean" dense<0.0112359552> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node476__m.layer-48.moving_variance" dense<0.0111111114> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node489__m.layer-51.kernel" dense<0.0109890113> : tensor<1x1x512x128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node490__m.layer-51.bias" dense<0.0108695654> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node496__m.layer-52.gamma" dense<0.0107526882> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node497__m.layer-52.beta" dense<0.0106382975> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node498__m.layer-52.moving_mean" dense<0.0105263162> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node499__m.layer-52.moving_variance" dense<0.010416667> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node508__m.layer-54.kernel" dense<0.010309278> : tensor<3x3x128x128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node509__m.layer-54.bias" dense<0.0102040814> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node515__m.layer-55.gamma" dense<0.0101010101> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node516__m.layer-55.beta" dense<0.00999999977> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node517__m.layer-55.moving_mean" dense<9.900990e-03> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node518__m.layer-55.moving_variance" dense<0.00980392192> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node527__m.layer-57.kernel" dense<0.00970873795> : tensor<1x1x128x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node528__m.layer-57.bias" dense<0.00961538497> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node534__m.layer-58.gamma" dense<9.523810e-03> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node535__m.layer-58.beta" dense<0.0094339624> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node536__m.layer-58.moving_mean" dense<0.00934579409> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node537__m.layer-58.moving_variance" dense<0.00925925932> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node550__m.layer-61.kernel" dense<0.00917431153> : tensor<1x1x512x128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node551__m.layer-61.bias" dense<0.0090909088> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node557__m.layer-62.gamma" dense<0.00900900922> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node558__m.layer-62.beta" dense<0.00892857183> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node559__m.layer-62.moving_mean" dense<0.00884955748> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node560__m.layer-62.moving_variance" dense<0.00877192988> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node569__m.layer-64.kernel" dense<0.00869565178> : tensor<3x3x128x128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node570__m.layer-64.bias" dense<8.620690e-03> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node576__m.layer-65.gamma" dense<0.00854700897> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node577__m.layer-65.beta" dense<0.00847457629> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node578__m.layer-65.moving_mean" dense<0.00840336177> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node579__m.layer-65.moving_variance" dense<0.00833333377> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node588__m.layer-67.kernel" dense<0.00826446246> : tensor<1x1x128x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node589__m.layer-67.bias" dense<0.00819672085> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node595__m.layer-68.gamma" dense<0.008130081> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node596__m.layer-68.beta" dense<0.00806451589> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node597__m.layer-68.moving_mean" dense<8.000000e-03> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node598__m.layer-68.moving_variance" dense<0.00793650839> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node611__m.layer-71.kernel" dense<0.00787401571> : tensor<1x1x512x128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node612__m.layer-71.bias" dense<7.812500e-03> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node618__m.layer-72.gamma" dense<0.00775193795> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node619__m.layer-72.beta" dense<0.0076923077> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node620__m.layer-72.moving_mean" dense<0.00763358781> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node621__m.layer-72.moving_variance" dense<0.0075757578> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node630__m.layer-74.kernel" dense<0.00751879718> : tensor<3x3x128x128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node631__m.layer-74.bias" dense<0.00746268639> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node637__m.layer-75.gamma" dense<0.00740740728> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node638__m.layer-75.beta" dense<0.0073529412> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node639__m.layer-75.moving_mean" dense<7.299270e-03> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node640__m.layer-75.moving_variance" dense<0.00724637694> : tensor<128xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node649__m.layer-77.kernel" dense<0.00719424477> : tensor<1x1x128x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node650__m.layer-77.bias" dense<0.00714285718> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node656__m.layer-78.gamma" dense<0.00709219835> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node657__m.layer-78.beta" dense<0.00704225338> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node658__m.layer-78.moving_mean" dense<0.00699300691> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node659__m.layer-78.moving_variance" dense<0.0069444445> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node672__m.layer-81.kernel" dense<0.0068965517> : tensor<1x1x512x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node673__m.layer-81.bias" dense<0.00684931502> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node679__m.layer-82.gamma" dense<0.00680272094> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node680__m.layer-82.beta" dense<0.00675675692> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node681__m.layer-82.moving_mean" dense<0.00671140943> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node682__m.layer-82.moving_variance" dense<0.00666666683> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node691__m.layer-84.kernel" dense<0.00662251655> : tensor<3x3x256x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node692__m.layer-84.bias" dense<0.00657894742> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node698__m.layer-85.gamma" dense<0.00653594779> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node699__m.layer-85.beta" dense<0.00649350649> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node700__m.layer-85.moving_mean" dense<0.0064516128> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node701__m.layer-85.moving_variance" dense<0.00641025649> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node710__m.layer-87.kernel" dense<0.00636942684> : tensor<1x1x512x1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node711__m.layer-87.bias" dense<0.00632911408> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node716__m.layer-88.kernel" dense<0.00628930796> : tensor<1x1x256x1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node717__m.layer-88.bias" dense<6.250000e-03> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node723__m.layer-89.gamma" dense<0.00621118024> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node724__m.layer-89.beta" dense<0.00617283955> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node725__m.layer-89.moving_mean" dense<0.00613496918> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node726__m.layer-89.moving_variance" dense<0.00609756075> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node732__m.layer-90.gamma" dense<0.00606060587> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node733__m.layer-90.beta" dense<0.00602409616> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node734__m.layer-90.moving_mean" dense<0.00598802418> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node735__m.layer-90.moving_variance" dense<0.00595238106> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node748__m.layer-93.kernel" dense<5.917160e-03> : tensor<1x1x1024x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node749__m.layer-93.bias" dense<0.00588235306> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node755__m.layer-94.gamma" dense<0.00584795326> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node756__m.layer-94.beta" dense<0.00581395347> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node757__m.layer-94.moving_mean" dense<0.00578034669> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node758__m.layer-94.moving_variance" dense<0.00574712642> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node767__m.layer-96.kernel" dense<0.00571428565> : tensor<3x3x256x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node768__m.layer-96.bias" dense<0.00568181835> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node774__m.layer-97.gamma" dense<0.00564971752> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node775__m.layer-97.beta" dense<0.00561797759> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node776__m.layer-97.moving_mean" dense<0.00558659201> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node777__m.layer-97.moving_variance" dense<0.00555555569> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node786__m.layer-99.kernel" dense<0.00552486209> : tensor<1x1x256x1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node787__m.layer-99.bias" dense<0.00549450563> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node793__m.layer-100.gamma" dense<0.00546448072> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node794__m.layer-100.beta" dense<0.00543478271> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node795__m.layer-100.moving_mean" dense<0.00540540554> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node796__m.layer-100.moving_variance" dense<0.00537634408> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node809__m.layer-103.kernel" dense<0.00534759369> : tensor<1x1x1024x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node810__m.layer-103.bias" dense<0.00531914877> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node816__m.layer-104.gamma" dense<0.00529100513> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node817__m.layer-104.beta" dense<0.00526315812> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node818__m.layer-104.moving_mean" dense<0.00523560215> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node819__m.layer-104.moving_variance" dense<0.00520833349> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node828__m.layer-106.kernel" dense<0.00518134702> : tensor<3x3x256x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node829__m.layer-106.bias" dense<0.00515463902> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node835__m.layer-107.gamma" dense<0.00512820529> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node836__m.layer-107.beta" dense<0.00510204071> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node837__m.layer-107.moving_mean" dense<0.00507614203> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node838__m.layer-107.moving_variance" dense<0.00505050505> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node847__m.layer-109.kernel" dense<0.00502512557> : tensor<1x1x256x1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node848__m.layer-109.bias" dense<5.000000e-03> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node854__m.layer-110.gamma" dense<0.00497512426> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node855__m.layer-110.beta" dense<0.00495049497> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node856__m.layer-110.moving_mean" dense<0.00492610829> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node857__m.layer-110.moving_variance" dense<0.00490196096> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node870__m.layer-113.kernel" dense<0.00487804879> : tensor<1x1x1024x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node871__m.layer-113.bias" dense<0.00485436898> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node877__m.layer-114.gamma" dense<0.00483091781> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node878__m.layer-114.beta" dense<0.00480769249> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node879__m.layer-114.moving_mean" dense<0.00478468882> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node880__m.layer-114.moving_variance" dense<0.00476190494> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node889__m.layer-116.kernel" dense<0.00473933667> : tensor<3x3x256x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node890__m.layer-116.bias" dense<0.0047169812> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node896__m.layer-117.gamma" dense<0.00469483575> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node897__m.layer-117.beta" dense<0.00467289705> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node898__m.layer-117.moving_mean" dense<0.00465116277> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node899__m.layer-117.moving_variance" dense<0.00462962966> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node908__m.layer-119.kernel" dense<0.00460829493> : tensor<1x1x256x1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node909__m.layer-119.bias" dense<0.00458715577> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node915__m.layer-120.gamma" dense<4.566210e-03> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node916__m.layer-120.beta" dense<0.0045454544> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node917__m.layer-120.moving_mean" dense<0.00452488707> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node918__m.layer-120.moving_variance" dense<0.00450450461> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node931__m.layer-123.kernel" dense<0.00448430516> : tensor<1x1x1024x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node932__m.layer-123.bias" dense<0.00446428591> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node938__m.layer-124.gamma" dense<0.00444444455> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node939__m.layer-124.beta" dense<0.00442477874> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node940__m.layer-124.moving_mean" dense<0.00440528616> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node941__m.layer-124.moving_variance" dense<0.00438596494> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node950__m.layer-126.kernel" dense<0.0043668123> : tensor<3x3x256x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node951__m.layer-126.bias" dense<0.00434782589> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node957__m.layer-127.gamma" dense<0.00432900432> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node958__m.layer-127.beta" dense<0.00431034481> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node959__m.layer-127.moving_mean" dense<0.00429184549> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node960__m.layer-127.moving_variance" dense<0.00427350448> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node969__m.layer-129.kernel" dense<0.00425531901> : tensor<1x1x256x1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node970__m.layer-129.bias" dense<0.00423728814> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node976__m.layer-130.gamma" dense<0.00421940908> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node977__m.layer-130.beta" dense<0.00420168089> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node978__m.layer-130.moving_mean" dense<0.00418410031> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node979__m.layer-130.moving_variance" dense<0.00416666688> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node992__m.layer-133.kernel" dense<0.00414937781> : tensor<1x1x1024x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node993__m.layer-133.bias" dense<0.00413223123> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node999__m.layer-134.gamma" dense<0.00411522621> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1000__m.layer-134.beta" dense<0.00409836043> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1001__m.layer-134.moving_mean" dense<0.00408163248> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1002__m.layer-134.moving_variance" dense<0.0040650405> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1011__m.layer-136.kernel" dense<0.0040485831> : tensor<3x3x256x256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1012__m.layer-136.bias" dense<0.00403225794> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1018__m.layer-137.gamma" dense<0.00401606411> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1019__m.layer-137.beta" dense<4.000000e-03> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1020__m.layer-137.moving_mean" dense<0.00398406386> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1021__m.layer-137.moving_variance" dense<0.0039682542> : tensor<256xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1030__m.layer-139.kernel" dense<0.00395256933> : tensor<1x1x256x1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1031__m.layer-139.bias" dense<0.00393700786> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1037__m.layer-140.gamma" dense<0.00392156886> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1038__m.layer-140.beta" dense<3.906250e-03> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1039__m.layer-140.moving_mean" dense<0.00389105058> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1040__m.layer-140.moving_variance" dense<0.00387596898> : tensor<1024xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1053__m.layer-143.kernel" dense<0.00386100379> : tensor<1x1x1024x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1054__m.layer-143.bias" dense<0.00384615385> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1060__m.layer-144.gamma" dense<0.00383141753> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1061__m.layer-144.beta" dense<0.00381679391> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1062__m.layer-144.moving_mean" dense<0.00380228134> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1063__m.layer-144.moving_variance" dense<0.0037878789> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1072__m.layer-146.kernel" dense<0.00377358496> : tensor<3x3x512x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1073__m.layer-146.bias" dense<0.00375939859> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1079__m.layer-147.gamma" dense<0.00374531839> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1080__m.layer-147.beta" dense<0.0037313432> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1081__m.layer-147.moving_mean" dense<0.00371747208> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1082__m.layer-147.moving_variance" dense<0.00370370364> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1091__m.layer-149.kernel" dense<0.00369003695> : tensor<1x1x1024x2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1092__m.layer-149.bias" dense<0.0036764706> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1097__m.layer-150.kernel" dense<0.00366300368> : tensor<1x1x512x2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1098__m.layer-150.bias" dense<0.00364963501> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1104__m.layer-151.gamma" dense<0.00363636366> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1105__m.layer-151.beta" dense<0.00362318847> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1106__m.layer-151.moving_mean" dense<0.00361010828> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1107__m.layer-151.moving_variance" dense<0.00359712238> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1113__m.layer-152.gamma" dense<0.00358422939> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1114__m.layer-152.beta" dense<0.00357142859> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1115__m.layer-152.moving_mean" dense<0.00355871883> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1116__m.layer-152.moving_variance" dense<0.00354609918> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1129__m.layer-155.kernel" dense<0.00353356893> : tensor<1x1x2048x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1130__m.layer-155.bias" dense<0.00352112669> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1136__m.layer-156.gamma" dense<0.003508772> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1137__m.layer-156.beta" dense<0.00349650346> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1138__m.layer-156.moving_mean" dense<0.00348432059> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1139__m.layer-156.moving_variance" dense<0.00347222225> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1148__m.layer-158.kernel" dense<0.00346020772> : tensor<3x3x512x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1149__m.layer-158.bias" dense<0.00344827585> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1155__m.layer-159.gamma" dense<0.00343642617> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1156__m.layer-159.beta" dense<0.00342465751> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1157__m.layer-159.moving_mean" dense<0.00341296918> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1158__m.layer-159.moving_variance" dense<0.00340136047> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1167__m.layer-161.kernel" dense<0.00338983047> : tensor<1x1x512x2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1168__m.layer-161.bias" dense<0.00337837846> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1174__m.layer-162.gamma" dense<0.00336700329> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1175__m.layer-162.beta" dense<0.00335570471> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1176__m.layer-162.moving_mean" dense<0.00334448158> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1177__m.layer-162.moving_variance" dense<0.00333333341> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1190__m.layer-165.kernel" dense<0.00332225906> : tensor<1x1x2048x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1191__m.layer-165.bias" dense<0.00331125828> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1197__m.layer-166.gamma" dense<0.00330033014> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1198__m.layer-166.beta" dense<0.00328947371> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1199__m.layer-166.moving_mean" dense<0.00327868853> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1200__m.layer-166.moving_variance" dense<0.00326797389> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1209__m.layer-168.kernel" dense<0.00325732888> : tensor<3x3x512x512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1210__m.layer-168.bias" dense<0.00324675324> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1216__m.layer-169.gamma" dense<0.00323624606> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1217__m.layer-169.beta" dense<0.0032258064> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1218__m.layer-169.moving_mean" dense<0.00321543403> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1219__m.layer-169.moving_variance" dense<0.00320512825> : tensor<512xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1228__m.layer-171.kernel" dense<0.00319488812> : tensor<1x1x512x2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1229__m.layer-171.bias" dense<0.00318471342> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1235__m.layer-172.gamma" dense<0.00317460322> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1236__m.layer-172.beta" dense<0.00316455704> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1237__m.layer-172.moving_mean" dense<0.00315457419> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1238__m.layer-172.moving_variance" dense<0.00314465398> : tensor<2048xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1255__m.layer-176.kernel" dense<0.00313479616> : tensor<2048x1000xf32> attributes {noinline, sym_visibility = "private"}
  flow.variable @"__iree_flow___sm_node1256__m.layer-176.bias" dense<3.125000e-03> : tensor<1000xf32> attributes {noinline, sym_visibility = "private"}
  // CHECK-LABEL: EXEC @predict
  func @predict(%arg0: tensor<1x224x224x3xf32> {tf._user_specified_name = "x"}) -> tensor<1x1000xf32> attributes {iree.module.export, iree.reflection = {abi = "sip", abiv = 1 : i32, sip = "I8!S5!k0_0R3!_0"}, tf._input_shapes = [#tf.shape<1x224x224x3>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>, #tf.shape<*>], tf.signature.is_stateful} {
    %0 = flow.variable.address @"__iree_flow___sm_node188__m.layer-2.kernel" : !iree.ptr<tensor<7x7x3x64xf32>>
    %1 = flow.variable.address @"__iree_flow___sm_node189__m.layer-2.bias" : !iree.ptr<tensor<64xf32>>
    %2 = flow.variable.address @"__iree_flow___sm_node195__m.layer-3.gamma" : !iree.ptr<tensor<64xf32>>
    %3 = flow.variable.address @"__iree_flow___sm_node196__m.layer-3.beta" : !iree.ptr<tensor<64xf32>>
    %4 = flow.variable.address @"__iree_flow___sm_node197__m.layer-3.moving_mean" : !iree.ptr<tensor<64xf32>>
    %5 = flow.variable.address @"__iree_flow___sm_node198__m.layer-3.moving_variance" : !iree.ptr<tensor<64xf32>>
    %6 = flow.variable.address @"__iree_flow___sm_node215__m.layer-7.kernel" : !iree.ptr<tensor<1x1x64x64xf32>>
    %7 = flow.variable.address @"__iree_flow___sm_node216__m.layer-7.bias" : !iree.ptr<tensor<64xf32>>
    %8 = flow.variable.address @"__iree_flow___sm_node222__m.layer-8.gamma" : !iree.ptr<tensor<64xf32>>
    %9 = flow.variable.address @"__iree_flow___sm_node223__m.layer-8.beta" : !iree.ptr<tensor<64xf32>>
    %10 = flow.variable.address @"__iree_flow___sm_node224__m.layer-8.moving_mean" : !iree.ptr<tensor<64xf32>>
    %11 = flow.variable.address @"__iree_flow___sm_node225__m.layer-8.moving_variance" : !iree.ptr<tensor<64xf32>>
    %12 = flow.variable.address @"__iree_flow___sm_node234__m.layer-10.kernel" : !iree.ptr<tensor<3x3x64x64xf32>>
    %13 = flow.variable.address @"__iree_flow___sm_node235__m.layer-10.bias" : !iree.ptr<tensor<64xf32>>
    %14 = flow.variable.address @"__iree_flow___sm_node241__m.layer-11.gamma" : !iree.ptr<tensor<64xf32>>
    %15 = flow.variable.address @"__iree_flow___sm_node242__m.layer-11.beta" : !iree.ptr<tensor<64xf32>>
    %16 = flow.variable.address @"__iree_flow___sm_node243__m.layer-11.moving_mean" : !iree.ptr<tensor<64xf32>>
    %17 = flow.variable.address @"__iree_flow___sm_node244__m.layer-11.moving_variance" : !iree.ptr<tensor<64xf32>>
    %18 = flow.variable.address @"__iree_flow___sm_node259__m.layer-14.kernel" : !iree.ptr<tensor<1x1x64x256xf32>>
    %19 = flow.variable.address @"__iree_flow___sm_node260__m.layer-14.bias" : !iree.ptr<tensor<256xf32>>
    %20 = flow.variable.address @"__iree_flow___sm_node253__m.layer-13.kernel" : !iree.ptr<tensor<1x1x64x256xf32>>
    %21 = flow.variable.address @"__iree_flow___sm_node254__m.layer-13.bias" : !iree.ptr<tensor<256xf32>>
    %22 = flow.variable.address @"__iree_flow___sm_node266__m.layer-15.gamma" : !iree.ptr<tensor<256xf32>>
    %23 = flow.variable.address @"__iree_flow___sm_node267__m.layer-15.beta" : !iree.ptr<tensor<256xf32>>
    %24 = flow.variable.address @"__iree_flow___sm_node268__m.layer-15.moving_mean" : !iree.ptr<tensor<256xf32>>
    %25 = flow.variable.address @"__iree_flow___sm_node269__m.layer-15.moving_variance" : !iree.ptr<tensor<256xf32>>
    %26 = flow.variable.address @"__iree_flow___sm_node275__m.layer-16.gamma" : !iree.ptr<tensor<256xf32>>
    %27 = flow.variable.address @"__iree_flow___sm_node276__m.layer-16.beta" : !iree.ptr<tensor<256xf32>>
    %28 = flow.variable.address @"__iree_flow___sm_node277__m.layer-16.moving_mean" : !iree.ptr<tensor<256xf32>>
    %29 = flow.variable.address @"__iree_flow___sm_node278__m.layer-16.moving_variance" : !iree.ptr<tensor<256xf32>>
    %30 = flow.variable.address @"__iree_flow___sm_node291__m.layer-19.kernel" : !iree.ptr<tensor<1x1x256x64xf32>>
    %31 = flow.variable.address @"__iree_flow___sm_node292__m.layer-19.bias" : !iree.ptr<tensor<64xf32>>
    %32 = flow.variable.address @"__iree_flow___sm_node298__m.layer-20.gamma" : !iree.ptr<tensor<64xf32>>
    %33 = flow.variable.address @"__iree_flow___sm_node299__m.layer-20.beta" : !iree.ptr<tensor<64xf32>>
    %34 = flow.variable.address @"__iree_flow___sm_node300__m.layer-20.moving_mean" : !iree.ptr<tensor<64xf32>>
    %35 = flow.variable.address @"__iree_flow___sm_node301__m.layer-20.moving_variance" : !iree.ptr<tensor<64xf32>>
    %36 = flow.variable.address @"__iree_flow___sm_node310__m.layer-22.kernel" : !iree.ptr<tensor<3x3x64x64xf32>>
    %37 = flow.variable.address @"__iree_flow___sm_node311__m.layer-22.bias" : !iree.ptr<tensor<64xf32>>
    %38 = flow.variable.address @"__iree_flow___sm_node317__m.layer-23.gamma" : !iree.ptr<tensor<64xf32>>
    %39 = flow.variable.address @"__iree_flow___sm_node318__m.layer-23.beta" : !iree.ptr<tensor<64xf32>>
    %40 = flow.variable.address @"__iree_flow___sm_node319__m.layer-23.moving_mean" : !iree.ptr<tensor<64xf32>>
    %41 = flow.variable.address @"__iree_flow___sm_node320__m.layer-23.moving_variance" : !iree.ptr<tensor<64xf32>>
    %42 = flow.variable.address @"__iree_flow___sm_node329__m.layer-25.kernel" : !iree.ptr<tensor<1x1x64x256xf32>>
    %43 = flow.variable.address @"__iree_flow___sm_node330__m.layer-25.bias" : !iree.ptr<tensor<256xf32>>
    %44 = flow.variable.address @"__iree_flow___sm_node336__m.layer-26.gamma" : !iree.ptr<tensor<256xf32>>
    %45 = flow.variable.address @"__iree_flow___sm_node337__m.layer-26.beta" : !iree.ptr<tensor<256xf32>>
    %46 = flow.variable.address @"__iree_flow___sm_node338__m.layer-26.moving_mean" : !iree.ptr<tensor<256xf32>>
    %47 = flow.variable.address @"__iree_flow___sm_node339__m.layer-26.moving_variance" : !iree.ptr<tensor<256xf32>>
    %48 = flow.variable.address @"__iree_flow___sm_node352__m.layer-29.kernel" : !iree.ptr<tensor<1x1x256x64xf32>>
    %49 = flow.variable.address @"__iree_flow___sm_node353__m.layer-29.bias" : !iree.ptr<tensor<64xf32>>
    %50 = flow.variable.address @"__iree_flow___sm_node359__m.layer-30.gamma" : !iree.ptr<tensor<64xf32>>
    %51 = flow.variable.address @"__iree_flow___sm_node360__m.layer-30.beta" : !iree.ptr<tensor<64xf32>>
    %52 = flow.variable.address @"__iree_flow___sm_node361__m.layer-30.moving_mean" : !iree.ptr<tensor<64xf32>>
    %53 = flow.variable.address @"__iree_flow___sm_node362__m.layer-30.moving_variance" : !iree.ptr<tensor<64xf32>>
    %54 = flow.variable.address @"__iree_flow___sm_node371__m.layer-32.kernel" : !iree.ptr<tensor<3x3x64x64xf32>>
    %55 = flow.variable.address @"__iree_flow___sm_node372__m.layer-32.bias" : !iree.ptr<tensor<64xf32>>
    %56 = flow.variable.address @"__iree_flow___sm_node378__m.layer-33.gamma" : !iree.ptr<tensor<64xf32>>
    %57 = flow.variable.address @"__iree_flow___sm_node379__m.layer-33.beta" : !iree.ptr<tensor<64xf32>>
    %58 = flow.variable.address @"__iree_flow___sm_node380__m.layer-33.moving_mean" : !iree.ptr<tensor<64xf32>>
    %59 = flow.variable.address @"__iree_flow___sm_node381__m.layer-33.moving_variance" : !iree.ptr<tensor<64xf32>>
    %60 = flow.variable.address @"__iree_flow___sm_node390__m.layer-35.kernel" : !iree.ptr<tensor<1x1x64x256xf32>>
    %61 = flow.variable.address @"__iree_flow___sm_node391__m.layer-35.bias" : !iree.ptr<tensor<256xf32>>
    %62 = flow.variable.address @"__iree_flow___sm_node397__m.layer-36.gamma" : !iree.ptr<tensor<256xf32>>
    %63 = flow.variable.address @"__iree_flow___sm_node398__m.layer-36.beta" : !iree.ptr<tensor<256xf32>>
    %64 = flow.variable.address @"__iree_flow___sm_node399__m.layer-36.moving_mean" : !iree.ptr<tensor<256xf32>>
    %65 = flow.variable.address @"__iree_flow___sm_node400__m.layer-36.moving_variance" : !iree.ptr<tensor<256xf32>>
    %66 = flow.variable.address @"__iree_flow___sm_node413__m.layer-39.kernel" : !iree.ptr<tensor<1x1x256x128xf32>>
    %67 = flow.variable.address @"__iree_flow___sm_node414__m.layer-39.bias" : !iree.ptr<tensor<128xf32>>
    %68 = flow.variable.address @"__iree_flow___sm_node420__m.layer-40.gamma" : !iree.ptr<tensor<128xf32>>
    %69 = flow.variable.address @"__iree_flow___sm_node421__m.layer-40.beta" : !iree.ptr<tensor<128xf32>>
    %70 = flow.variable.address @"__iree_flow___sm_node422__m.layer-40.moving_mean" : !iree.ptr<tensor<128xf32>>
    %71 = flow.variable.address @"__iree_flow___sm_node423__m.layer-40.moving_variance" : !iree.ptr<tensor<128xf32>>
    %72 = flow.variable.address @"__iree_flow___sm_node432__m.layer-42.kernel" : !iree.ptr<tensor<3x3x128x128xf32>>
    %73 = flow.variable.address @"__iree_flow___sm_node433__m.layer-42.bias" : !iree.ptr<tensor<128xf32>>
    %74 = flow.variable.address @"__iree_flow___sm_node439__m.layer-43.gamma" : !iree.ptr<tensor<128xf32>>
    %75 = flow.variable.address @"__iree_flow___sm_node440__m.layer-43.beta" : !iree.ptr<tensor<128xf32>>
    %76 = flow.variable.address @"__iree_flow___sm_node441__m.layer-43.moving_mean" : !iree.ptr<tensor<128xf32>>
    %77 = flow.variable.address @"__iree_flow___sm_node442__m.layer-43.moving_variance" : !iree.ptr<tensor<128xf32>>
    %78 = flow.variable.address @"__iree_flow___sm_node457__m.layer-46.kernel" : !iree.ptr<tensor<1x1x128x512xf32>>
    %79 = flow.variable.address @"__iree_flow___sm_node458__m.layer-46.bias" : !iree.ptr<tensor<512xf32>>
    %80 = flow.variable.address @"__iree_flow___sm_node451__m.layer-45.kernel" : !iree.ptr<tensor<1x1x256x512xf32>>
    %81 = flow.variable.address @"__iree_flow___sm_node452__m.layer-45.bias" : !iree.ptr<tensor<512xf32>>
    %82 = flow.variable.address @"__iree_flow___sm_node464__m.layer-47.gamma" : !iree.ptr<tensor<512xf32>>
    %83 = flow.variable.address @"__iree_flow___sm_node465__m.layer-47.beta" : !iree.ptr<tensor<512xf32>>
    %84 = flow.variable.address @"__iree_flow___sm_node466__m.layer-47.moving_mean" : !iree.ptr<tensor<512xf32>>
    %85 = flow.variable.address @"__iree_flow___sm_node467__m.layer-47.moving_variance" : !iree.ptr<tensor<512xf32>>
    %86 = flow.variable.address @"__iree_flow___sm_node473__m.layer-48.gamma" : !iree.ptr<tensor<512xf32>>
    %87 = flow.variable.address @"__iree_flow___sm_node474__m.layer-48.beta" : !iree.ptr<tensor<512xf32>>
    %88 = flow.variable.address @"__iree_flow___sm_node475__m.layer-48.moving_mean" : !iree.ptr<tensor<512xf32>>
    %89 = flow.variable.address @"__iree_flow___sm_node476__m.layer-48.moving_variance" : !iree.ptr<tensor<512xf32>>
    %90 = flow.variable.address @"__iree_flow___sm_node489__m.layer-51.kernel" : !iree.ptr<tensor<1x1x512x128xf32>>
    %91 = flow.variable.address @"__iree_flow___sm_node490__m.layer-51.bias" : !iree.ptr<tensor<128xf32>>
    %92 = flow.variable.address @"__iree_flow___sm_node496__m.layer-52.gamma" : !iree.ptr<tensor<128xf32>>
    %93 = flow.variable.address @"__iree_flow___sm_node497__m.layer-52.beta" : !iree.ptr<tensor<128xf32>>
    %94 = flow.variable.address @"__iree_flow___sm_node498__m.layer-52.moving_mean" : !iree.ptr<tensor<128xf32>>
    %95 = flow.variable.address @"__iree_flow___sm_node499__m.layer-52.moving_variance" : !iree.ptr<tensor<128xf32>>
    %96 = flow.variable.address @"__iree_flow___sm_node508__m.layer-54.kernel" : !iree.ptr<tensor<3x3x128x128xf32>>
    %97 = flow.variable.address @"__iree_flow___sm_node509__m.layer-54.bias" : !iree.ptr<tensor<128xf32>>
    %98 = flow.variable.address @"__iree_flow___sm_node515__m.layer-55.gamma" : !iree.ptr<tensor<128xf32>>
    %99 = flow.variable.address @"__iree_flow___sm_node516__m.layer-55.beta" : !iree.ptr<tensor<128xf32>>
    %100 = flow.variable.address @"__iree_flow___sm_node517__m.layer-55.moving_mean" : !iree.ptr<tensor<128xf32>>
    %101 = flow.variable.address @"__iree_flow___sm_node518__m.layer-55.moving_variance" : !iree.ptr<tensor<128xf32>>
    %102 = flow.variable.address @"__iree_flow___sm_node527__m.layer-57.kernel" : !iree.ptr<tensor<1x1x128x512xf32>>
    %103 = flow.variable.address @"__iree_flow___sm_node528__m.layer-57.bias" : !iree.ptr<tensor<512xf32>>
    %104 = flow.variable.address @"__iree_flow___sm_node534__m.layer-58.gamma" : !iree.ptr<tensor<512xf32>>
    %105 = flow.variable.address @"__iree_flow___sm_node535__m.layer-58.beta" : !iree.ptr<tensor<512xf32>>
    %106 = flow.variable.address @"__iree_flow___sm_node536__m.layer-58.moving_mean" : !iree.ptr<tensor<512xf32>>
    %107 = flow.variable.address @"__iree_flow___sm_node537__m.layer-58.moving_variance" : !iree.ptr<tensor<512xf32>>
    %108 = flow.variable.address @"__iree_flow___sm_node550__m.layer-61.kernel" : !iree.ptr<tensor<1x1x512x128xf32>>
    %109 = flow.variable.address @"__iree_flow___sm_node551__m.layer-61.bias" : !iree.ptr<tensor<128xf32>>
    %110 = flow.variable.address @"__iree_flow___sm_node557__m.layer-62.gamma" : !iree.ptr<tensor<128xf32>>
    %111 = flow.variable.address @"__iree_flow___sm_node558__m.layer-62.beta" : !iree.ptr<tensor<128xf32>>
    %112 = flow.variable.address @"__iree_flow___sm_node559__m.layer-62.moving_mean" : !iree.ptr<tensor<128xf32>>
    %113 = flow.variable.address @"__iree_flow___sm_node560__m.layer-62.moving_variance" : !iree.ptr<tensor<128xf32>>
    %114 = flow.variable.address @"__iree_flow___sm_node569__m.layer-64.kernel" : !iree.ptr<tensor<3x3x128x128xf32>>
    %115 = flow.variable.address @"__iree_flow___sm_node570__m.layer-64.bias" : !iree.ptr<tensor<128xf32>>
    %116 = flow.variable.address @"__iree_flow___sm_node576__m.layer-65.gamma" : !iree.ptr<tensor<128xf32>>
    %117 = flow.variable.address @"__iree_flow___sm_node577__m.layer-65.beta" : !iree.ptr<tensor<128xf32>>
    %118 = flow.variable.address @"__iree_flow___sm_node578__m.layer-65.moving_mean" : !iree.ptr<tensor<128xf32>>
    %119 = flow.variable.address @"__iree_flow___sm_node579__m.layer-65.moving_variance" : !iree.ptr<tensor<128xf32>>
    %120 = flow.variable.address @"__iree_flow___sm_node588__m.layer-67.kernel" : !iree.ptr<tensor<1x1x128x512xf32>>
    %121 = flow.variable.address @"__iree_flow___sm_node589__m.layer-67.bias" : !iree.ptr<tensor<512xf32>>
    %122 = flow.variable.address @"__iree_flow___sm_node595__m.layer-68.gamma" : !iree.ptr<tensor<512xf32>>
    %123 = flow.variable.address @"__iree_flow___sm_node596__m.layer-68.beta" : !iree.ptr<tensor<512xf32>>
    %124 = flow.variable.address @"__iree_flow___sm_node597__m.layer-68.moving_mean" : !iree.ptr<tensor<512xf32>>
    %125 = flow.variable.address @"__iree_flow___sm_node598__m.layer-68.moving_variance" : !iree.ptr<tensor<512xf32>>
    %126 = flow.variable.address @"__iree_flow___sm_node611__m.layer-71.kernel" : !iree.ptr<tensor<1x1x512x128xf32>>
    %127 = flow.variable.address @"__iree_flow___sm_node612__m.layer-71.bias" : !iree.ptr<tensor<128xf32>>
    %128 = flow.variable.address @"__iree_flow___sm_node618__m.layer-72.gamma" : !iree.ptr<tensor<128xf32>>
    %129 = flow.variable.address @"__iree_flow___sm_node619__m.layer-72.beta" : !iree.ptr<tensor<128xf32>>
    %130 = flow.variable.address @"__iree_flow___sm_node620__m.layer-72.moving_mean" : !iree.ptr<tensor<128xf32>>
    %131 = flow.variable.address @"__iree_flow___sm_node621__m.layer-72.moving_variance" : !iree.ptr<tensor<128xf32>>
    %132 = flow.variable.address @"__iree_flow___sm_node630__m.layer-74.kernel" : !iree.ptr<tensor<3x3x128x128xf32>>
    %133 = flow.variable.address @"__iree_flow___sm_node631__m.layer-74.bias" : !iree.ptr<tensor<128xf32>>
    %134 = flow.variable.address @"__iree_flow___sm_node637__m.layer-75.gamma" : !iree.ptr<tensor<128xf32>>
    %135 = flow.variable.address @"__iree_flow___sm_node638__m.layer-75.beta" : !iree.ptr<tensor<128xf32>>
    %136 = flow.variable.address @"__iree_flow___sm_node639__m.layer-75.moving_mean" : !iree.ptr<tensor<128xf32>>
    %137 = flow.variable.address @"__iree_flow___sm_node640__m.layer-75.moving_variance" : !iree.ptr<tensor<128xf32>>
    %138 = flow.variable.address @"__iree_flow___sm_node649__m.layer-77.kernel" : !iree.ptr<tensor<1x1x128x512xf32>>
    %139 = flow.variable.address @"__iree_flow___sm_node650__m.layer-77.bias" : !iree.ptr<tensor<512xf32>>
    %140 = flow.variable.address @"__iree_flow___sm_node656__m.layer-78.gamma" : !iree.ptr<tensor<512xf32>>
    %141 = flow.variable.address @"__iree_flow___sm_node657__m.layer-78.beta" : !iree.ptr<tensor<512xf32>>
    %142 = flow.variable.address @"__iree_flow___sm_node658__m.layer-78.moving_mean" : !iree.ptr<tensor<512xf32>>
    %143 = flow.variable.address @"__iree_flow___sm_node659__m.layer-78.moving_variance" : !iree.ptr<tensor<512xf32>>
    %144 = flow.variable.address @"__iree_flow___sm_node672__m.layer-81.kernel" : !iree.ptr<tensor<1x1x512x256xf32>>
    %145 = flow.variable.address @"__iree_flow___sm_node673__m.layer-81.bias" : !iree.ptr<tensor<256xf32>>
    %146 = flow.variable.address @"__iree_flow___sm_node679__m.layer-82.gamma" : !iree.ptr<tensor<256xf32>>
    %147 = flow.variable.address @"__iree_flow___sm_node680__m.layer-82.beta" : !iree.ptr<tensor<256xf32>>
    %148 = flow.variable.address @"__iree_flow___sm_node681__m.layer-82.moving_mean" : !iree.ptr<tensor<256xf32>>
    %149 = flow.variable.address @"__iree_flow___sm_node682__m.layer-82.moving_variance" : !iree.ptr<tensor<256xf32>>
    %150 = flow.variable.address @"__iree_flow___sm_node691__m.layer-84.kernel" : !iree.ptr<tensor<3x3x256x256xf32>>
    %151 = flow.variable.address @"__iree_flow___sm_node692__m.layer-84.bias" : !iree.ptr<tensor<256xf32>>
    %152 = flow.variable.address @"__iree_flow___sm_node698__m.layer-85.gamma" : !iree.ptr<tensor<256xf32>>
    %153 = flow.variable.address @"__iree_flow___sm_node699__m.layer-85.beta" : !iree.ptr<tensor<256xf32>>
    %154 = flow.variable.address @"__iree_flow___sm_node700__m.layer-85.moving_mean" : !iree.ptr<tensor<256xf32>>
    %155 = flow.variable.address @"__iree_flow___sm_node701__m.layer-85.moving_variance" : !iree.ptr<tensor<256xf32>>
    %156 = flow.variable.address @"__iree_flow___sm_node716__m.layer-88.kernel" : !iree.ptr<tensor<1x1x256x1024xf32>>
    %157 = flow.variable.address @"__iree_flow___sm_node717__m.layer-88.bias" : !iree.ptr<tensor<1024xf32>>
    %158 = flow.variable.address @"__iree_flow___sm_node710__m.layer-87.kernel" : !iree.ptr<tensor<1x1x512x1024xf32>>
    %159 = flow.variable.address @"__iree_flow___sm_node711__m.layer-87.bias" : !iree.ptr<tensor<1024xf32>>
    %160 = flow.variable.address @"__iree_flow___sm_node723__m.layer-89.gamma" : !iree.ptr<tensor<1024xf32>>
    %161 = flow.variable.address @"__iree_flow___sm_node724__m.layer-89.beta" : !iree.ptr<tensor<1024xf32>>
    %162 = flow.variable.address @"__iree_flow___sm_node725__m.layer-89.moving_mean" : !iree.ptr<tensor<1024xf32>>
    %163 = flow.variable.address @"__iree_flow___sm_node726__m.layer-89.moving_variance" : !iree.ptr<tensor<1024xf32>>
    %164 = flow.variable.address @"__iree_flow___sm_node732__m.layer-90.gamma" : !iree.ptr<tensor<1024xf32>>
    %165 = flow.variable.address @"__iree_flow___sm_node733__m.layer-90.beta" : !iree.ptr<tensor<1024xf32>>
    %166 = flow.variable.address @"__iree_flow___sm_node734__m.layer-90.moving_mean" : !iree.ptr<tensor<1024xf32>>
    %167 = flow.variable.address @"__iree_flow___sm_node735__m.layer-90.moving_variance" : !iree.ptr<tensor<1024xf32>>
    %168 = flow.variable.address @"__iree_flow___sm_node748__m.layer-93.kernel" : !iree.ptr<tensor<1x1x1024x256xf32>>
    %169 = flow.variable.address @"__iree_flow___sm_node749__m.layer-93.bias" : !iree.ptr<tensor<256xf32>>
    %170 = flow.variable.address @"__iree_flow___sm_node755__m.layer-94.gamma" : !iree.ptr<tensor<256xf32>>
    %171 = flow.variable.address @"__iree_flow___sm_node756__m.layer-94.beta" : !iree.ptr<tensor<256xf32>>
    %172 = flow.variable.address @"__iree_flow___sm_node757__m.layer-94.moving_mean" : !iree.ptr<tensor<256xf32>>
    %173 = flow.variable.address @"__iree_flow___sm_node758__m.layer-94.moving_variance" : !iree.ptr<tensor<256xf32>>
    %174 = flow.variable.address @"__iree_flow___sm_node767__m.layer-96.kernel" : !iree.ptr<tensor<3x3x256x256xf32>>
    %175 = flow.variable.address @"__iree_flow___sm_node768__m.layer-96.bias" : !iree.ptr<tensor<256xf32>>
    %176 = flow.variable.address @"__iree_flow___sm_node774__m.layer-97.gamma" : !iree.ptr<tensor<256xf32>>
    %177 = flow.variable.address @"__iree_flow___sm_node775__m.layer-97.beta" : !iree.ptr<tensor<256xf32>>
    %178 = flow.variable.address @"__iree_flow___sm_node776__m.layer-97.moving_mean" : !iree.ptr<tensor<256xf32>>
    %179 = flow.variable.address @"__iree_flow___sm_node777__m.layer-97.moving_variance" : !iree.ptr<tensor<256xf32>>
    %180 = flow.variable.address @"__iree_flow___sm_node786__m.layer-99.kernel" : !iree.ptr<tensor<1x1x256x1024xf32>>
    %181 = flow.variable.address @"__iree_flow___sm_node787__m.layer-99.bias" : !iree.ptr<tensor<1024xf32>>
    %182 = flow.variable.address @"__iree_flow___sm_node793__m.layer-100.gamma" : !iree.ptr<tensor<1024xf32>>
    %183 = flow.variable.address @"__iree_flow___sm_node794__m.layer-100.beta" : !iree.ptr<tensor<1024xf32>>
    %184 = flow.variable.address @"__iree_flow___sm_node795__m.layer-100.moving_mean" : !iree.ptr<tensor<1024xf32>>
    %185 = flow.variable.address @"__iree_flow___sm_node796__m.layer-100.moving_variance" : !iree.ptr<tensor<1024xf32>>
    %186 = flow.variable.address @"__iree_flow___sm_node809__m.layer-103.kernel" : !iree.ptr<tensor<1x1x1024x256xf32>>
    %187 = flow.variable.address @"__iree_flow___sm_node810__m.layer-103.bias" : !iree.ptr<tensor<256xf32>>
    %188 = flow.variable.address @"__iree_flow___sm_node816__m.layer-104.gamma" : !iree.ptr<tensor<256xf32>>
    %189 = flow.variable.address @"__iree_flow___sm_node817__m.layer-104.beta" : !iree.ptr<tensor<256xf32>>
    %190 = flow.variable.address @"__iree_flow___sm_node818__m.layer-104.moving_mean" : !iree.ptr<tensor<256xf32>>
    %191 = flow.variable.address @"__iree_flow___sm_node819__m.layer-104.moving_variance" : !iree.ptr<tensor<256xf32>>
    %192 = flow.variable.address @"__iree_flow___sm_node828__m.layer-106.kernel" : !iree.ptr<tensor<3x3x256x256xf32>>
    %193 = flow.variable.address @"__iree_flow___sm_node829__m.layer-106.bias" : !iree.ptr<tensor<256xf32>>
    %194 = flow.variable.address @"__iree_flow___sm_node835__m.layer-107.gamma" : !iree.ptr<tensor<256xf32>>
    %195 = flow.variable.address @"__iree_flow___sm_node836__m.layer-107.beta" : !iree.ptr<tensor<256xf32>>
    %196 = flow.variable.address @"__iree_flow___sm_node837__m.layer-107.moving_mean" : !iree.ptr<tensor<256xf32>>
    %197 = flow.variable.address @"__iree_flow___sm_node838__m.layer-107.moving_variance" : !iree.ptr<tensor<256xf32>>
    %198 = flow.variable.address @"__iree_flow___sm_node847__m.layer-109.kernel" : !iree.ptr<tensor<1x1x256x1024xf32>>
    %199 = flow.variable.address @"__iree_flow___sm_node848__m.layer-109.bias" : !iree.ptr<tensor<1024xf32>>
    %200 = flow.variable.address @"__iree_flow___sm_node854__m.layer-110.gamma" : !iree.ptr<tensor<1024xf32>>
    %201 = flow.variable.address @"__iree_flow___sm_node855__m.layer-110.beta" : !iree.ptr<tensor<1024xf32>>
    %202 = flow.variable.address @"__iree_flow___sm_node856__m.layer-110.moving_mean" : !iree.ptr<tensor<1024xf32>>
    %203 = flow.variable.address @"__iree_flow___sm_node857__m.layer-110.moving_variance" : !iree.ptr<tensor<1024xf32>>
    %204 = flow.variable.address @"__iree_flow___sm_node870__m.layer-113.kernel" : !iree.ptr<tensor<1x1x1024x256xf32>>
    %205 = flow.variable.address @"__iree_flow___sm_node871__m.layer-113.bias" : !iree.ptr<tensor<256xf32>>
    %206 = flow.variable.address @"__iree_flow___sm_node877__m.layer-114.gamma" : !iree.ptr<tensor<256xf32>>
    %207 = flow.variable.address @"__iree_flow___sm_node878__m.layer-114.beta" : !iree.ptr<tensor<256xf32>>
    %208 = flow.variable.address @"__iree_flow___sm_node879__m.layer-114.moving_mean" : !iree.ptr<tensor<256xf32>>
    %209 = flow.variable.address @"__iree_flow___sm_node880__m.layer-114.moving_variance" : !iree.ptr<tensor<256xf32>>
    %210 = flow.variable.address @"__iree_flow___sm_node889__m.layer-116.kernel" : !iree.ptr<tensor<3x3x256x256xf32>>
    %211 = flow.variable.address @"__iree_flow___sm_node890__m.layer-116.bias" : !iree.ptr<tensor<256xf32>>
    %212 = flow.variable.address @"__iree_flow___sm_node896__m.layer-117.gamma" : !iree.ptr<tensor<256xf32>>
    %213 = flow.variable.address @"__iree_flow___sm_node897__m.layer-117.beta" : !iree.ptr<tensor<256xf32>>
    %214 = flow.variable.address @"__iree_flow___sm_node898__m.layer-117.moving_mean" : !iree.ptr<tensor<256xf32>>
    %215 = flow.variable.address @"__iree_flow___sm_node899__m.layer-117.moving_variance" : !iree.ptr<tensor<256xf32>>
    %216 = flow.variable.address @"__iree_flow___sm_node908__m.layer-119.kernel" : !iree.ptr<tensor<1x1x256x1024xf32>>
    %217 = flow.variable.address @"__iree_flow___sm_node909__m.layer-119.bias" : !iree.ptr<tensor<1024xf32>>
    %218 = flow.variable.address @"__iree_flow___sm_node915__m.layer-120.gamma" : !iree.ptr<tensor<1024xf32>>
    %219 = flow.variable.address @"__iree_flow___sm_node916__m.layer-120.beta" : !iree.ptr<tensor<1024xf32>>
    %220 = flow.variable.address @"__iree_flow___sm_node917__m.layer-120.moving_mean" : !iree.ptr<tensor<1024xf32>>
    %221 = flow.variable.address @"__iree_flow___sm_node918__m.layer-120.moving_variance" : !iree.ptr<tensor<1024xf32>>
    %222 = flow.variable.address @"__iree_flow___sm_node931__m.layer-123.kernel" : !iree.ptr<tensor<1x1x1024x256xf32>>
    %223 = flow.variable.address @"__iree_flow___sm_node932__m.layer-123.bias" : !iree.ptr<tensor<256xf32>>
    %224 = flow.variable.address @"__iree_flow___sm_node938__m.layer-124.gamma" : !iree.ptr<tensor<256xf32>>
    %225 = flow.variable.address @"__iree_flow___sm_node939__m.layer-124.beta" : !iree.ptr<tensor<256xf32>>
    %226 = flow.variable.address @"__iree_flow___sm_node940__m.layer-124.moving_mean" : !iree.ptr<tensor<256xf32>>
    %227 = flow.variable.address @"__iree_flow___sm_node941__m.layer-124.moving_variance" : !iree.ptr<tensor<256xf32>>
    %228 = flow.variable.address @"__iree_flow___sm_node950__m.layer-126.kernel" : !iree.ptr<tensor<3x3x256x256xf32>>
    %229 = flow.variable.address @"__iree_flow___sm_node951__m.layer-126.bias" : !iree.ptr<tensor<256xf32>>
    %230 = flow.variable.address @"__iree_flow___sm_node957__m.layer-127.gamma" : !iree.ptr<tensor<256xf32>>
    %231 = flow.variable.address @"__iree_flow___sm_node958__m.layer-127.beta" : !iree.ptr<tensor<256xf32>>
    %232 = flow.variable.address @"__iree_flow___sm_node959__m.layer-127.moving_mean" : !iree.ptr<tensor<256xf32>>
    %233 = flow.variable.address @"__iree_flow___sm_node960__m.layer-127.moving_variance" : !iree.ptr<tensor<256xf32>>
    %234 = flow.variable.address @"__iree_flow___sm_node969__m.layer-129.kernel" : !iree.ptr<tensor<1x1x256x1024xf32>>
    %235 = flow.variable.address @"__iree_flow___sm_node970__m.layer-129.bias" : !iree.ptr<tensor<1024xf32>>
    %236 = flow.variable.address @"__iree_flow___sm_node976__m.layer-130.gamma" : !iree.ptr<tensor<1024xf32>>
    %237 = flow.variable.address @"__iree_flow___sm_node977__m.layer-130.beta" : !iree.ptr<tensor<1024xf32>>
    %238 = flow.variable.address @"__iree_flow___sm_node978__m.layer-130.moving_mean" : !iree.ptr<tensor<1024xf32>>
    %239 = flow.variable.address @"__iree_flow___sm_node979__m.layer-130.moving_variance" : !iree.ptr<tensor<1024xf32>>
    %240 = flow.variable.address @"__iree_flow___sm_node992__m.layer-133.kernel" : !iree.ptr<tensor<1x1x1024x256xf32>>
    %241 = flow.variable.address @"__iree_flow___sm_node993__m.layer-133.bias" : !iree.ptr<tensor<256xf32>>
    %242 = flow.variable.address @"__iree_flow___sm_node999__m.layer-134.gamma" : !iree.ptr<tensor<256xf32>>
    %243 = flow.variable.address @"__iree_flow___sm_node1000__m.layer-134.beta" : !iree.ptr<tensor<256xf32>>
    %244 = flow.variable.address @"__iree_flow___sm_node1001__m.layer-134.moving_mean" : !iree.ptr<tensor<256xf32>>
    %245 = flow.variable.address @"__iree_flow___sm_node1002__m.layer-134.moving_variance" : !iree.ptr<tensor<256xf32>>
    %246 = flow.variable.address @"__iree_flow___sm_node1011__m.layer-136.kernel" : !iree.ptr<tensor<3x3x256x256xf32>>
    %247 = flow.variable.address @"__iree_flow___sm_node1012__m.layer-136.bias" : !iree.ptr<tensor<256xf32>>
    %248 = flow.variable.address @"__iree_flow___sm_node1018__m.layer-137.gamma" : !iree.ptr<tensor<256xf32>>
    %249 = flow.variable.address @"__iree_flow___sm_node1019__m.layer-137.beta" : !iree.ptr<tensor<256xf32>>
    %250 = flow.variable.address @"__iree_flow___sm_node1020__m.layer-137.moving_mean" : !iree.ptr<tensor<256xf32>>
    %251 = flow.variable.address @"__iree_flow___sm_node1021__m.layer-137.moving_variance" : !iree.ptr<tensor<256xf32>>
    %252 = flow.variable.address @"__iree_flow___sm_node1030__m.layer-139.kernel" : !iree.ptr<tensor<1x1x256x1024xf32>>
    %253 = flow.variable.address @"__iree_flow___sm_node1031__m.layer-139.bias" : !iree.ptr<tensor<1024xf32>>
    %254 = flow.variable.address @"__iree_flow___sm_node1037__m.layer-140.gamma" : !iree.ptr<tensor<1024xf32>>
    %255 = flow.variable.address @"__iree_flow___sm_node1038__m.layer-140.beta" : !iree.ptr<tensor<1024xf32>>
    %256 = flow.variable.address @"__iree_flow___sm_node1039__m.layer-140.moving_mean" : !iree.ptr<tensor<1024xf32>>
    %257 = flow.variable.address @"__iree_flow___sm_node1040__m.layer-140.moving_variance" : !iree.ptr<tensor<1024xf32>>
    %258 = flow.variable.address @"__iree_flow___sm_node1053__m.layer-143.kernel" : !iree.ptr<tensor<1x1x1024x512xf32>>
    %259 = flow.variable.address @"__iree_flow___sm_node1054__m.layer-143.bias" : !iree.ptr<tensor<512xf32>>
    %260 = flow.variable.address @"__iree_flow___sm_node1060__m.layer-144.gamma" : !iree.ptr<tensor<512xf32>>
    %261 = flow.variable.address @"__iree_flow___sm_node1061__m.layer-144.beta" : !iree.ptr<tensor<512xf32>>
    %262 = flow.variable.address @"__iree_flow___sm_node1062__m.layer-144.moving_mean" : !iree.ptr<tensor<512xf32>>
    %263 = flow.variable.address @"__iree_flow___sm_node1063__m.layer-144.moving_variance" : !iree.ptr<tensor<512xf32>>
    %264 = flow.variable.address @"__iree_flow___sm_node1072__m.layer-146.kernel" : !iree.ptr<tensor<3x3x512x512xf32>>
    %265 = flow.variable.address @"__iree_flow___sm_node1073__m.layer-146.bias" : !iree.ptr<tensor<512xf32>>
    %266 = flow.variable.address @"__iree_flow___sm_node1079__m.layer-147.gamma" : !iree.ptr<tensor<512xf32>>
    %267 = flow.variable.address @"__iree_flow___sm_node1080__m.layer-147.beta" : !iree.ptr<tensor<512xf32>>
    %268 = flow.variable.address @"__iree_flow___sm_node1081__m.layer-147.moving_mean" : !iree.ptr<tensor<512xf32>>
    %269 = flow.variable.address @"__iree_flow___sm_node1082__m.layer-147.moving_variance" : !iree.ptr<tensor<512xf32>>
    %270 = flow.variable.address @"__iree_flow___sm_node1097__m.layer-150.kernel" : !iree.ptr<tensor<1x1x512x2048xf32>>
    %271 = flow.variable.address @"__iree_flow___sm_node1098__m.layer-150.bias" : !iree.ptr<tensor<2048xf32>>
    %272 = flow.variable.address @"__iree_flow___sm_node1091__m.layer-149.kernel" : !iree.ptr<tensor<1x1x1024x2048xf32>>
    %273 = flow.variable.address @"__iree_flow___sm_node1092__m.layer-149.bias" : !iree.ptr<tensor<2048xf32>>
    %274 = flow.variable.address @"__iree_flow___sm_node1104__m.layer-151.gamma" : !iree.ptr<tensor<2048xf32>>
    %275 = flow.variable.address @"__iree_flow___sm_node1105__m.layer-151.beta" : !iree.ptr<tensor<2048xf32>>
    %276 = flow.variable.address @"__iree_flow___sm_node1106__m.layer-151.moving_mean" : !iree.ptr<tensor<2048xf32>>
    %277 = flow.variable.address @"__iree_flow___sm_node1107__m.layer-151.moving_variance" : !iree.ptr<tensor<2048xf32>>
    %278 = flow.variable.address @"__iree_flow___sm_node1113__m.layer-152.gamma" : !iree.ptr<tensor<2048xf32>>
    %279 = flow.variable.address @"__iree_flow___sm_node1114__m.layer-152.beta" : !iree.ptr<tensor<2048xf32>>
    %280 = flow.variable.address @"__iree_flow___sm_node1115__m.layer-152.moving_mean" : !iree.ptr<tensor<2048xf32>>
    %281 = flow.variable.address @"__iree_flow___sm_node1116__m.layer-152.moving_variance" : !iree.ptr<tensor<2048xf32>>
    %282 = flow.variable.address @"__iree_flow___sm_node1129__m.layer-155.kernel" : !iree.ptr<tensor<1x1x2048x512xf32>>
    %283 = flow.variable.address @"__iree_flow___sm_node1130__m.layer-155.bias" : !iree.ptr<tensor<512xf32>>
    %284 = flow.variable.address @"__iree_flow___sm_node1136__m.layer-156.gamma" : !iree.ptr<tensor<512xf32>>
    %285 = flow.variable.address @"__iree_flow___sm_node1137__m.layer-156.beta" : !iree.ptr<tensor<512xf32>>
    %286 = flow.variable.address @"__iree_flow___sm_node1138__m.layer-156.moving_mean" : !iree.ptr<tensor<512xf32>>
    %287 = flow.variable.address @"__iree_flow___sm_node1139__m.layer-156.moving_variance" : !iree.ptr<tensor<512xf32>>
    %288 = flow.variable.address @"__iree_flow___sm_node1148__m.layer-158.kernel" : !iree.ptr<tensor<3x3x512x512xf32>>
    %289 = flow.variable.address @"__iree_flow___sm_node1149__m.layer-158.bias" : !iree.ptr<tensor<512xf32>>
    %290 = flow.variable.address @"__iree_flow___sm_node1155__m.layer-159.gamma" : !iree.ptr<tensor<512xf32>>
    %291 = flow.variable.address @"__iree_flow___sm_node1156__m.layer-159.beta" : !iree.ptr<tensor<512xf32>>
    %292 = flow.variable.address @"__iree_flow___sm_node1157__m.layer-159.moving_mean" : !iree.ptr<tensor<512xf32>>
    %293 = flow.variable.address @"__iree_flow___sm_node1158__m.layer-159.moving_variance" : !iree.ptr<tensor<512xf32>>
    %294 = flow.variable.address @"__iree_flow___sm_node1167__m.layer-161.kernel" : !iree.ptr<tensor<1x1x512x2048xf32>>
    %295 = flow.variable.address @"__iree_flow___sm_node1168__m.layer-161.bias" : !iree.ptr<tensor<2048xf32>>
    %296 = flow.variable.address @"__iree_flow___sm_node1174__m.layer-162.gamma" : !iree.ptr<tensor<2048xf32>>
    %297 = flow.variable.address @"__iree_flow___sm_node1175__m.layer-162.beta" : !iree.ptr<tensor<2048xf32>>
    %298 = flow.variable.address @"__iree_flow___sm_node1176__m.layer-162.moving_mean" : !iree.ptr<tensor<2048xf32>>
    %299 = flow.variable.address @"__iree_flow___sm_node1177__m.layer-162.moving_variance" : !iree.ptr<tensor<2048xf32>>
    %300 = flow.variable.address @"__iree_flow___sm_node1190__m.layer-165.kernel" : !iree.ptr<tensor<1x1x2048x512xf32>>
    %301 = flow.variable.address @"__iree_flow___sm_node1191__m.layer-165.bias" : !iree.ptr<tensor<512xf32>>
    %302 = flow.variable.address @"__iree_flow___sm_node1197__m.layer-166.gamma" : !iree.ptr<tensor<512xf32>>
    %303 = flow.variable.address @"__iree_flow___sm_node1198__m.layer-166.beta" : !iree.ptr<tensor<512xf32>>
    %304 = flow.variable.address @"__iree_flow___sm_node1199__m.layer-166.moving_mean" : !iree.ptr<tensor<512xf32>>
    %305 = flow.variable.address @"__iree_flow___sm_node1200__m.layer-166.moving_variance" : !iree.ptr<tensor<512xf32>>
    %306 = flow.variable.address @"__iree_flow___sm_node1209__m.layer-168.kernel" : !iree.ptr<tensor<3x3x512x512xf32>>
    %307 = flow.variable.address @"__iree_flow___sm_node1210__m.layer-168.bias" : !iree.ptr<tensor<512xf32>>
    %308 = flow.variable.address @"__iree_flow___sm_node1216__m.layer-169.gamma" : !iree.ptr<tensor<512xf32>>
    %309 = flow.variable.address @"__iree_flow___sm_node1217__m.layer-169.beta" : !iree.ptr<tensor<512xf32>>
    %310 = flow.variable.address @"__iree_flow___sm_node1218__m.layer-169.moving_mean" : !iree.ptr<tensor<512xf32>>
    %311 = flow.variable.address @"__iree_flow___sm_node1219__m.layer-169.moving_variance" : !iree.ptr<tensor<512xf32>>
    %312 = flow.variable.address @"__iree_flow___sm_node1228__m.layer-171.kernel" : !iree.ptr<tensor<1x1x512x2048xf32>>
    %313 = flow.variable.address @"__iree_flow___sm_node1229__m.layer-171.bias" : !iree.ptr<tensor<2048xf32>>
    %314 = flow.variable.address @"__iree_flow___sm_node1235__m.layer-172.gamma" : !iree.ptr<tensor<2048xf32>>
    %315 = flow.variable.address @"__iree_flow___sm_node1236__m.layer-172.beta" : !iree.ptr<tensor<2048xf32>>
    %316 = flow.variable.address @"__iree_flow___sm_node1237__m.layer-172.moving_mean" : !iree.ptr<tensor<2048xf32>>
    %317 = flow.variable.address @"__iree_flow___sm_node1238__m.layer-172.moving_variance" : !iree.ptr<tensor<2048xf32>>
    %318 = flow.variable.address @"__iree_flow___sm_node1255__m.layer-176.kernel" : !iree.ptr<tensor<2048x1000xf32>>
    %319 = flow.variable.address @"__iree_flow___sm_node1256__m.layer-176.bias" : !iree.ptr<tensor<1000xf32>>
    %320 = mhlo.constant dense<0.000000e+00> : tensor<1x112x112x64xf32>
    %321 = mhlo.constant dense<0.000000e+00> : tensor<1x56x56x64xf32>
    %322 = mhlo.constant dense<0.000000e+00> : tensor<1x56x56x256xf32>
    %323 = mhlo.constant dense<0.000000e+00> : tensor<1x28x28x128xf32>
    %324 = mhlo.constant dense<0.000000e+00> : tensor<1x28x28x512xf32>
    %325 = mhlo.constant dense<0.000000e+00> : tensor<1x14x14x256xf32>
    %326 = mhlo.constant dense<0.000000e+00> : tensor<1x14x14x1024xf32>
    %327 = mhlo.constant dense<0.000000e+00> : tensor<1x7x7x512xf32>
    %328 = mhlo.constant dense<0.000000e+00> : tensor<1x7x7x2048xf32>
    %329 = mhlo.constant dense<4.900000e+01> : tensor<1x2048xf32>
    %330 = mhlo.constant dense<0xFF800000> : tensor<f32>
    %331 = mhlo.constant dense<0.000000e+00> : tensor<f32>
    %332 = flow.variable.load.indirect %5 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %333 = flow.variable.load.indirect %4 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %334 = flow.variable.load.indirect %3 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %335 = flow.variable.load.indirect %2 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %336 = flow.variable.load.indirect %1 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %337 = flow.variable.load.indirect %0 : !iree.ptr<tensor<7x7x3x64xf32>> -> tensor<7x7x3x64xf32>
    %338 = flow.variable.load.indirect %25 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %339 = flow.variable.load.indirect %24 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %340 = flow.variable.load.indirect %23 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %341 = flow.variable.load.indirect %22 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %342 = flow.variable.load.indirect %21 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %343 = flow.variable.load.indirect %20 : !iree.ptr<tensor<1x1x64x256xf32>> -> tensor<1x1x64x256xf32>
    %344 = flow.variable.load.indirect %11 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %345 = flow.variable.load.indirect %10 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %346 = flow.variable.load.indirect %9 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %347 = flow.variable.load.indirect %8 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %348 = flow.variable.load.indirect %7 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %349 = flow.variable.load.indirect %6 : !iree.ptr<tensor<1x1x64x64xf32>> -> tensor<1x1x64x64xf32>
    %350 = flow.variable.load.indirect %17 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %351 = flow.variable.load.indirect %16 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %352 = flow.variable.load.indirect %15 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %353 = flow.variable.load.indirect %14 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %354 = flow.variable.load.indirect %13 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %355 = flow.variable.load.indirect %12 : !iree.ptr<tensor<3x3x64x64xf32>> -> tensor<3x3x64x64xf32>
    %356 = flow.variable.load.indirect %29 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %357 = flow.variable.load.indirect %28 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %358 = flow.variable.load.indirect %27 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %359 = flow.variable.load.indirect %26 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %360 = flow.variable.load.indirect %19 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %361 = flow.variable.load.indirect %18 : !iree.ptr<tensor<1x1x64x256xf32>> -> tensor<1x1x64x256xf32>
    %362 = flow.variable.load.indirect %35 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %363 = flow.variable.load.indirect %34 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %364 = flow.variable.load.indirect %33 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %365 = flow.variable.load.indirect %32 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %366 = flow.variable.load.indirect %31 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %367 = flow.variable.load.indirect %30 : !iree.ptr<tensor<1x1x256x64xf32>> -> tensor<1x1x256x64xf32>
    %368 = flow.variable.load.indirect %41 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %369 = flow.variable.load.indirect %40 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %370 = flow.variable.load.indirect %39 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %371 = flow.variable.load.indirect %38 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %372 = flow.variable.load.indirect %37 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %373 = flow.variable.load.indirect %36 : !iree.ptr<tensor<3x3x64x64xf32>> -> tensor<3x3x64x64xf32>
    %374 = flow.variable.load.indirect %47 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %375 = flow.variable.load.indirect %46 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %376 = flow.variable.load.indirect %45 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %377 = flow.variable.load.indirect %44 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %378 = flow.variable.load.indirect %43 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %379 = flow.variable.load.indirect %42 : !iree.ptr<tensor<1x1x64x256xf32>> -> tensor<1x1x64x256xf32>
    %380 = flow.variable.load.indirect %53 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %381 = flow.variable.load.indirect %52 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %382 = flow.variable.load.indirect %51 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %383 = flow.variable.load.indirect %50 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %384 = flow.variable.load.indirect %49 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %385 = flow.variable.load.indirect %48 : !iree.ptr<tensor<1x1x256x64xf32>> -> tensor<1x1x256x64xf32>
    %386 = flow.variable.load.indirect %59 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %387 = flow.variable.load.indirect %58 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %388 = flow.variable.load.indirect %57 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %389 = flow.variable.load.indirect %56 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %390 = flow.variable.load.indirect %55 : !iree.ptr<tensor<64xf32>> -> tensor<64xf32>
    %391 = flow.variable.load.indirect %54 : !iree.ptr<tensor<3x3x64x64xf32>> -> tensor<3x3x64x64xf32>
    %392 = flow.variable.load.indirect %65 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %393 = flow.variable.load.indirect %64 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %394 = flow.variable.load.indirect %63 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %395 = flow.variable.load.indirect %62 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %396 = flow.variable.load.indirect %61 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %397 = flow.variable.load.indirect %60 : !iree.ptr<tensor<1x1x64x256xf32>> -> tensor<1x1x64x256xf32>
    %398 = flow.variable.load.indirect %85 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %399 = flow.variable.load.indirect %84 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %400 = flow.variable.load.indirect %83 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %401 = flow.variable.load.indirect %82 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %402 = flow.variable.load.indirect %81 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %403 = flow.variable.load.indirect %80 : !iree.ptr<tensor<1x1x256x512xf32>> -> tensor<1x1x256x512xf32>
    %404 = flow.variable.load.indirect %71 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %405 = flow.variable.load.indirect %70 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %406 = flow.variable.load.indirect %69 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %407 = flow.variable.load.indirect %68 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %408 = flow.variable.load.indirect %67 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %409 = flow.variable.load.indirect %66 : !iree.ptr<tensor<1x1x256x128xf32>> -> tensor<1x1x256x128xf32>
    %410 = flow.variable.load.indirect %77 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %411 = flow.variable.load.indirect %76 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %412 = flow.variable.load.indirect %75 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %413 = flow.variable.load.indirect %74 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %414 = flow.variable.load.indirect %73 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %415 = flow.variable.load.indirect %72 : !iree.ptr<tensor<3x3x128x128xf32>> -> tensor<3x3x128x128xf32>
    %416 = flow.variable.load.indirect %89 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %417 = flow.variable.load.indirect %88 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %418 = flow.variable.load.indirect %87 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %419 = flow.variable.load.indirect %86 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %420 = flow.variable.load.indirect %79 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %421 = flow.variable.load.indirect %78 : !iree.ptr<tensor<1x1x128x512xf32>> -> tensor<1x1x128x512xf32>
    %422 = flow.variable.load.indirect %95 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %423 = flow.variable.load.indirect %94 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %424 = flow.variable.load.indirect %93 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %425 = flow.variable.load.indirect %92 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %426 = flow.variable.load.indirect %91 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %427 = flow.variable.load.indirect %90 : !iree.ptr<tensor<1x1x512x128xf32>> -> tensor<1x1x512x128xf32>
    %428 = flow.variable.load.indirect %101 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %429 = flow.variable.load.indirect %100 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %430 = flow.variable.load.indirect %99 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %431 = flow.variable.load.indirect %98 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %432 = flow.variable.load.indirect %97 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %433 = flow.variable.load.indirect %96 : !iree.ptr<tensor<3x3x128x128xf32>> -> tensor<3x3x128x128xf32>
    %434 = flow.variable.load.indirect %107 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %435 = flow.variable.load.indirect %106 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %436 = flow.variable.load.indirect %105 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %437 = flow.variable.load.indirect %104 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %438 = flow.variable.load.indirect %103 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %439 = flow.variable.load.indirect %102 : !iree.ptr<tensor<1x1x128x512xf32>> -> tensor<1x1x128x512xf32>
    %440 = flow.variable.load.indirect %113 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %441 = flow.variable.load.indirect %112 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %442 = flow.variable.load.indirect %111 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %443 = flow.variable.load.indirect %110 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %444 = flow.variable.load.indirect %109 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %445 = flow.variable.load.indirect %108 : !iree.ptr<tensor<1x1x512x128xf32>> -> tensor<1x1x512x128xf32>
    %446 = flow.variable.load.indirect %119 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %447 = flow.variable.load.indirect %118 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %448 = flow.variable.load.indirect %117 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %449 = flow.variable.load.indirect %116 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %450 = flow.variable.load.indirect %115 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %451 = flow.variable.load.indirect %114 : !iree.ptr<tensor<3x3x128x128xf32>> -> tensor<3x3x128x128xf32>
    %452 = flow.variable.load.indirect %125 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %453 = flow.variable.load.indirect %124 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %454 = flow.variable.load.indirect %123 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %455 = flow.variable.load.indirect %122 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %456 = flow.variable.load.indirect %121 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %457 = flow.variable.load.indirect %120 : !iree.ptr<tensor<1x1x128x512xf32>> -> tensor<1x1x128x512xf32>
    %458 = flow.variable.load.indirect %131 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %459 = flow.variable.load.indirect %130 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %460 = flow.variable.load.indirect %129 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %461 = flow.variable.load.indirect %128 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %462 = flow.variable.load.indirect %127 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %463 = flow.variable.load.indirect %126 : !iree.ptr<tensor<1x1x512x128xf32>> -> tensor<1x1x512x128xf32>
    %464 = flow.variable.load.indirect %137 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %465 = flow.variable.load.indirect %136 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %466 = flow.variable.load.indirect %135 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %467 = flow.variable.load.indirect %134 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %468 = flow.variable.load.indirect %133 : !iree.ptr<tensor<128xf32>> -> tensor<128xf32>
    %469 = flow.variable.load.indirect %132 : !iree.ptr<tensor<3x3x128x128xf32>> -> tensor<3x3x128x128xf32>
    %470 = flow.variable.load.indirect %143 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %471 = flow.variable.load.indirect %142 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %472 = flow.variable.load.indirect %141 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %473 = flow.variable.load.indirect %140 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %474 = flow.variable.load.indirect %139 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %475 = flow.variable.load.indirect %138 : !iree.ptr<tensor<1x1x128x512xf32>> -> tensor<1x1x128x512xf32>
    %476 = flow.variable.load.indirect %163 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %477 = flow.variable.load.indirect %162 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %478 = flow.variable.load.indirect %161 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %479 = flow.variable.load.indirect %160 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %480 = flow.variable.load.indirect %159 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %481 = flow.variable.load.indirect %158 : !iree.ptr<tensor<1x1x512x1024xf32>> -> tensor<1x1x512x1024xf32>
    %482 = flow.variable.load.indirect %149 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %483 = flow.variable.load.indirect %148 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %484 = flow.variable.load.indirect %147 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %485 = flow.variable.load.indirect %146 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %486 = flow.variable.load.indirect %145 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %487 = flow.variable.load.indirect %144 : !iree.ptr<tensor<1x1x512x256xf32>> -> tensor<1x1x512x256xf32>
    %488 = flow.variable.load.indirect %155 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %489 = flow.variable.load.indirect %154 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %490 = flow.variable.load.indirect %153 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %491 = flow.variable.load.indirect %152 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %492 = flow.variable.load.indirect %151 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %493 = flow.variable.load.indirect %150 : !iree.ptr<tensor<3x3x256x256xf32>> -> tensor<3x3x256x256xf32>
    %494 = flow.variable.load.indirect %167 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %495 = flow.variable.load.indirect %166 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %496 = flow.variable.load.indirect %165 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %497 = flow.variable.load.indirect %164 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %498 = flow.variable.load.indirect %157 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %499 = flow.variable.load.indirect %156 : !iree.ptr<tensor<1x1x256x1024xf32>> -> tensor<1x1x256x1024xf32>
    %500 = flow.variable.load.indirect %173 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %501 = flow.variable.load.indirect %172 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %502 = flow.variable.load.indirect %171 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %503 = flow.variable.load.indirect %170 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %504 = flow.variable.load.indirect %169 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %505 = flow.variable.load.indirect %168 : !iree.ptr<tensor<1x1x1024x256xf32>> -> tensor<1x1x1024x256xf32>
    %506 = flow.variable.load.indirect %179 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %507 = flow.variable.load.indirect %178 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %508 = flow.variable.load.indirect %177 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %509 = flow.variable.load.indirect %176 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %510 = flow.variable.load.indirect %175 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %511 = flow.variable.load.indirect %174 : !iree.ptr<tensor<3x3x256x256xf32>> -> tensor<3x3x256x256xf32>
    %512 = flow.variable.load.indirect %185 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %513 = flow.variable.load.indirect %184 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %514 = flow.variable.load.indirect %183 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %515 = flow.variable.load.indirect %182 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %516 = flow.variable.load.indirect %181 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %517 = flow.variable.load.indirect %180 : !iree.ptr<tensor<1x1x256x1024xf32>> -> tensor<1x1x256x1024xf32>
    %518 = flow.variable.load.indirect %191 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %519 = flow.variable.load.indirect %190 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %520 = flow.variable.load.indirect %189 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %521 = flow.variable.load.indirect %188 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %522 = flow.variable.load.indirect %187 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %523 = flow.variable.load.indirect %186 : !iree.ptr<tensor<1x1x1024x256xf32>> -> tensor<1x1x1024x256xf32>
    %524 = flow.variable.load.indirect %197 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %525 = flow.variable.load.indirect %196 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %526 = flow.variable.load.indirect %195 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %527 = flow.variable.load.indirect %194 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %528 = flow.variable.load.indirect %193 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %529 = flow.variable.load.indirect %192 : !iree.ptr<tensor<3x3x256x256xf32>> -> tensor<3x3x256x256xf32>
    %530 = flow.variable.load.indirect %203 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %531 = flow.variable.load.indirect %202 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %532 = flow.variable.load.indirect %201 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %533 = flow.variable.load.indirect %200 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %534 = flow.variable.load.indirect %199 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %535 = flow.variable.load.indirect %198 : !iree.ptr<tensor<1x1x256x1024xf32>> -> tensor<1x1x256x1024xf32>
    %536 = flow.variable.load.indirect %209 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %537 = flow.variable.load.indirect %208 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %538 = flow.variable.load.indirect %207 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %539 = flow.variable.load.indirect %206 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %540 = flow.variable.load.indirect %205 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %541 = flow.variable.load.indirect %204 : !iree.ptr<tensor<1x1x1024x256xf32>> -> tensor<1x1x1024x256xf32>
    %542 = flow.variable.load.indirect %215 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %543 = flow.variable.load.indirect %214 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %544 = flow.variable.load.indirect %213 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %545 = flow.variable.load.indirect %212 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %546 = flow.variable.load.indirect %211 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %547 = flow.variable.load.indirect %210 : !iree.ptr<tensor<3x3x256x256xf32>> -> tensor<3x3x256x256xf32>
    %548 = flow.variable.load.indirect %221 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %549 = flow.variable.load.indirect %220 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %550 = flow.variable.load.indirect %219 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %551 = flow.variable.load.indirect %218 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %552 = flow.variable.load.indirect %217 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %553 = flow.variable.load.indirect %216 : !iree.ptr<tensor<1x1x256x1024xf32>> -> tensor<1x1x256x1024xf32>
    %554 = flow.variable.load.indirect %227 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %555 = flow.variable.load.indirect %226 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %556 = flow.variable.load.indirect %225 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %557 = flow.variable.load.indirect %224 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %558 = flow.variable.load.indirect %223 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %559 = flow.variable.load.indirect %222 : !iree.ptr<tensor<1x1x1024x256xf32>> -> tensor<1x1x1024x256xf32>
    %560 = flow.variable.load.indirect %233 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %561 = flow.variable.load.indirect %232 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %562 = flow.variable.load.indirect %231 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %563 = flow.variable.load.indirect %230 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %564 = flow.variable.load.indirect %229 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %565 = flow.variable.load.indirect %228 : !iree.ptr<tensor<3x3x256x256xf32>> -> tensor<3x3x256x256xf32>
    %566 = flow.variable.load.indirect %239 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %567 = flow.variable.load.indirect %238 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %568 = flow.variable.load.indirect %237 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %569 = flow.variable.load.indirect %236 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %570 = flow.variable.load.indirect %235 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %571 = flow.variable.load.indirect %234 : !iree.ptr<tensor<1x1x256x1024xf32>> -> tensor<1x1x256x1024xf32>
    %572 = flow.variable.load.indirect %245 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %573 = flow.variable.load.indirect %244 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %574 = flow.variable.load.indirect %243 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %575 = flow.variable.load.indirect %242 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %576 = flow.variable.load.indirect %241 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %577 = flow.variable.load.indirect %240 : !iree.ptr<tensor<1x1x1024x256xf32>> -> tensor<1x1x1024x256xf32>
    %578 = flow.variable.load.indirect %251 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %579 = flow.variable.load.indirect %250 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %580 = flow.variable.load.indirect %249 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %581 = flow.variable.load.indirect %248 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %582 = flow.variable.load.indirect %247 : !iree.ptr<tensor<256xf32>> -> tensor<256xf32>
    %583 = flow.variable.load.indirect %246 : !iree.ptr<tensor<3x3x256x256xf32>> -> tensor<3x3x256x256xf32>
    %584 = flow.variable.load.indirect %257 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %585 = flow.variable.load.indirect %256 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %586 = flow.variable.load.indirect %255 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %587 = flow.variable.load.indirect %254 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %588 = flow.variable.load.indirect %253 : !iree.ptr<tensor<1024xf32>> -> tensor<1024xf32>
    %589 = flow.variable.load.indirect %252 : !iree.ptr<tensor<1x1x256x1024xf32>> -> tensor<1x1x256x1024xf32>
    %590 = flow.variable.load.indirect %277 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %591 = flow.variable.load.indirect %276 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %592 = flow.variable.load.indirect %275 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %593 = flow.variable.load.indirect %274 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %594 = flow.variable.load.indirect %273 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %595 = flow.variable.load.indirect %272 : !iree.ptr<tensor<1x1x1024x2048xf32>> -> tensor<1x1x1024x2048xf32>
    %596 = flow.variable.load.indirect %263 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %597 = flow.variable.load.indirect %262 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %598 = flow.variable.load.indirect %261 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %599 = flow.variable.load.indirect %260 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %600 = flow.variable.load.indirect %259 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %601 = flow.variable.load.indirect %258 : !iree.ptr<tensor<1x1x1024x512xf32>> -> tensor<1x1x1024x512xf32>
    %602 = flow.variable.load.indirect %269 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %603 = flow.variable.load.indirect %268 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %604 = flow.variable.load.indirect %267 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %605 = flow.variable.load.indirect %266 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %606 = flow.variable.load.indirect %265 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %607 = flow.variable.load.indirect %264 : !iree.ptr<tensor<3x3x512x512xf32>> -> tensor<3x3x512x512xf32>
    %608 = flow.variable.load.indirect %281 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %609 = flow.variable.load.indirect %280 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %610 = flow.variable.load.indirect %279 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %611 = flow.variable.load.indirect %278 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %612 = flow.variable.load.indirect %271 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %613 = flow.variable.load.indirect %270 : !iree.ptr<tensor<1x1x512x2048xf32>> -> tensor<1x1x512x2048xf32>
    %614 = flow.variable.load.indirect %287 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %615 = flow.variable.load.indirect %286 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %616 = flow.variable.load.indirect %285 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %617 = flow.variable.load.indirect %284 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %618 = flow.variable.load.indirect %283 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %619 = flow.variable.load.indirect %282 : !iree.ptr<tensor<1x1x2048x512xf32>> -> tensor<1x1x2048x512xf32>
    %620 = flow.variable.load.indirect %293 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %621 = flow.variable.load.indirect %292 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %622 = flow.variable.load.indirect %291 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %623 = flow.variable.load.indirect %290 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %624 = flow.variable.load.indirect %289 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %625 = flow.variable.load.indirect %288 : !iree.ptr<tensor<3x3x512x512xf32>> -> tensor<3x3x512x512xf32>
    %626 = flow.variable.load.indirect %299 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %627 = flow.variable.load.indirect %298 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %628 = flow.variable.load.indirect %297 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %629 = flow.variable.load.indirect %296 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %630 = flow.variable.load.indirect %295 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %631 = flow.variable.load.indirect %294 : !iree.ptr<tensor<1x1x512x2048xf32>> -> tensor<1x1x512x2048xf32>
    %632 = flow.variable.load.indirect %305 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %633 = flow.variable.load.indirect %304 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %634 = flow.variable.load.indirect %303 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %635 = flow.variable.load.indirect %302 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %636 = flow.variable.load.indirect %301 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %637 = flow.variable.load.indirect %300 : !iree.ptr<tensor<1x1x2048x512xf32>> -> tensor<1x1x2048x512xf32>
    %638 = flow.variable.load.indirect %311 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %639 = flow.variable.load.indirect %310 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %640 = flow.variable.load.indirect %309 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %641 = flow.variable.load.indirect %308 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %642 = flow.variable.load.indirect %307 : !iree.ptr<tensor<512xf32>> -> tensor<512xf32>
    %643 = flow.variable.load.indirect %306 : !iree.ptr<tensor<3x3x512x512xf32>> -> tensor<3x3x512x512xf32>
    %644 = flow.variable.load.indirect %317 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %645 = flow.variable.load.indirect %316 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %646 = flow.variable.load.indirect %315 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %647 = flow.variable.load.indirect %314 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %648 = flow.variable.load.indirect %313 : !iree.ptr<tensor<2048xf32>> -> tensor<2048xf32>
    %649 = flow.variable.load.indirect %312 : !iree.ptr<tensor<1x1x512x2048xf32>> -> tensor<1x1x512x2048xf32>
    %650 = flow.variable.load.indirect %319 : !iree.ptr<tensor<1000xf32>> -> tensor<1000xf32>
    %651 = flow.variable.load.indirect %318 : !iree.ptr<tensor<2048x1000xf32>> -> tensor<2048x1000xf32>
    %652 = "mhlo.pad"(%arg0, %331) {edge_padding_high = dense<[0, 3, 3, 0]> : tensor<4xi64>, edge_padding_low = dense<[0, 3, 3, 0]> : tensor<4xi64>, interior_padding = dense<0> : tensor<4xi64>} : (tensor<1x224x224x3xf32>, tensor<f32>) -> tensor<1x230x230x3xf32>
    %653 = "mhlo.convolution"(%652, %337) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : (tensor<1x230x230x3xf32>, tensor<7x7x3x64xf32>) -> tensor<1x112x112x64xf32>
    %654 = "mhlo.broadcast_in_dim"(%336) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<64xf32>) -> tensor<1x112x112x64xf32>
    %655 = mhlo.add %653, %654 : tensor<1x112x112x64xf32>
    %656 = "mhlo.batch_norm_inference"(%655, %335, %334, %333, %332) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x112x112x64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<1x112x112x64xf32>
    %657 = mhlo.maximum %656, %320 : tensor<1x112x112x64xf32>
    %658 = "mhlo.pad"(%657, %331) {edge_padding_high = dense<[0, 1, 1, 0]> : tensor<4xi64>, edge_padding_low = dense<[0, 1, 1, 0]> : tensor<4xi64>, interior_padding = dense<0> : tensor<4xi64>} : (tensor<1x112x112x64xf32>, tensor<f32>) -> tensor<1x114x114x64xf32>
    %659 = "mhlo.reduce_window"(%658, %330) ( {
    ^bb0(%arg1: tensor<f32>, %arg2: tensor<f32>):  // no predecessors
      %944 = mhlo.maximum %arg1, %arg2 : tensor<f32>
      "mhlo.return"(%944) : (tensor<f32>) -> ()
    }) {window_dimensions = dense<[1, 3, 3, 1]> : tensor<4xi64>, window_strides = dense<[1, 2, 2, 1]> : tensor<4xi64>} : (tensor<1x114x114x64xf32>, tensor<f32>) -> tensor<1x56x56x64xf32>
    %660 = "mhlo.convolution"(%659, %343) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x64xf32>, tensor<1x1x64x256xf32>) -> tensor<1x56x56x256xf32>
    %661 = "mhlo.broadcast_in_dim"(%342) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x56x56x256xf32>
    %662 = mhlo.add %660, %661 : tensor<1x56x56x256xf32>
    %663 = "mhlo.batch_norm_inference"(%662, %341, %340, %339, %338) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x56x56x256xf32>
    %664 = "mhlo.convolution"(%659, %349) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x64xf32>, tensor<1x1x64x64xf32>) -> tensor<1x56x56x64xf32>
    %665 = "mhlo.broadcast_in_dim"(%348) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %666 = mhlo.add %664, %665 : tensor<1x56x56x64xf32>
    %667 = "mhlo.batch_norm_inference"(%666, %347, %346, %345, %344) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %668 = mhlo.maximum %667, %321 : tensor<1x56x56x64xf32>
    %669 = "mhlo.convolution"(%668, %355) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x64xf32>, tensor<3x3x64x64xf32>) -> tensor<1x56x56x64xf32>
    %670 = "mhlo.broadcast_in_dim"(%354) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %671 = mhlo.add %669, %670 : tensor<1x56x56x64xf32>
    %672 = "mhlo.batch_norm_inference"(%671, %353, %352, %351, %350) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %673 = mhlo.maximum %672, %321 : tensor<1x56x56x64xf32>
    %674 = "mhlo.convolution"(%673, %361) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x64xf32>, tensor<1x1x64x256xf32>) -> tensor<1x56x56x256xf32>
    %675 = "mhlo.broadcast_in_dim"(%360) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x56x56x256xf32>
    %676 = mhlo.add %674, %675 : tensor<1x56x56x256xf32>
    %677 = "mhlo.batch_norm_inference"(%676, %359, %358, %357, %356) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x56x56x256xf32>
    %678 = mhlo.add %663, %677 : tensor<1x56x56x256xf32>
    %679 = mhlo.maximum %678, %322 : tensor<1x56x56x256xf32>
    %680 = "mhlo.convolution"(%679, %367) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x256xf32>, tensor<1x1x256x64xf32>) -> tensor<1x56x56x64xf32>
    %681 = "mhlo.broadcast_in_dim"(%366) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %682 = mhlo.add %680, %681 : tensor<1x56x56x64xf32>
    %683 = "mhlo.batch_norm_inference"(%682, %365, %364, %363, %362) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %684 = mhlo.maximum %683, %321 : tensor<1x56x56x64xf32>
    %685 = "mhlo.convolution"(%684, %373) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x64xf32>, tensor<3x3x64x64xf32>) -> tensor<1x56x56x64xf32>
    %686 = "mhlo.broadcast_in_dim"(%372) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %687 = mhlo.add %685, %686 : tensor<1x56x56x64xf32>
    %688 = "mhlo.batch_norm_inference"(%687, %371, %370, %369, %368) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %689 = mhlo.maximum %688, %321 : tensor<1x56x56x64xf32>
    %690 = "mhlo.convolution"(%689, %379) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x64xf32>, tensor<1x1x64x256xf32>) -> tensor<1x56x56x256xf32>
    %691 = "mhlo.broadcast_in_dim"(%378) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x56x56x256xf32>
    %692 = mhlo.add %690, %691 : tensor<1x56x56x256xf32>
    %693 = "mhlo.batch_norm_inference"(%692, %377, %376, %375, %374) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x56x56x256xf32>
    %694 = mhlo.add %679, %693 : tensor<1x56x56x256xf32>
    %695 = mhlo.maximum %694, %322 : tensor<1x56x56x256xf32>
    %696 = "mhlo.convolution"(%695, %385) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x256xf32>, tensor<1x1x256x64xf32>) -> tensor<1x56x56x64xf32>
    %697 = "mhlo.broadcast_in_dim"(%384) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %698 = mhlo.add %696, %697 : tensor<1x56x56x64xf32>
    %699 = "mhlo.batch_norm_inference"(%698, %383, %382, %381, %380) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %700 = mhlo.maximum %699, %321 : tensor<1x56x56x64xf32>
    %701 = "mhlo.convolution"(%700, %391) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x64xf32>, tensor<3x3x64x64xf32>) -> tensor<1x56x56x64xf32>
    %702 = "mhlo.broadcast_in_dim"(%390) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %703 = mhlo.add %701, %702 : tensor<1x56x56x64xf32>
    %704 = "mhlo.batch_norm_inference"(%703, %389, %388, %387, %386) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<1x56x56x64xf32>
    %705 = mhlo.maximum %704, %321 : tensor<1x56x56x64xf32>
    %706 = "mhlo.convolution"(%705, %397) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x56x56x64xf32>, tensor<1x1x64x256xf32>) -> tensor<1x56x56x256xf32>
    %707 = "mhlo.broadcast_in_dim"(%396) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x56x56x256xf32>
    %708 = mhlo.add %706, %707 : tensor<1x56x56x256xf32>
    %709 = "mhlo.batch_norm_inference"(%708, %395, %394, %393, %392) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x56x56x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x56x56x256xf32>
    %710 = mhlo.add %695, %709 : tensor<1x56x56x256xf32>
    %711 = mhlo.maximum %710, %322 : tensor<1x56x56x256xf32>
    %712 = "mhlo.convolution"(%711, %403) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : (tensor<1x56x56x256xf32>, tensor<1x1x256x512xf32>) -> tensor<1x28x28x512xf32>
    %713 = "mhlo.broadcast_in_dim"(%402) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %714 = mhlo.add %712, %713 : tensor<1x28x28x512xf32>
    %715 = "mhlo.batch_norm_inference"(%714, %401, %400, %399, %398) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %716 = "mhlo.convolution"(%711, %409) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : (tensor<1x56x56x256xf32>, tensor<1x1x256x128xf32>) -> tensor<1x28x28x128xf32>
    %717 = "mhlo.broadcast_in_dim"(%408) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %718 = mhlo.add %716, %717 : tensor<1x28x28x128xf32>
    %719 = "mhlo.batch_norm_inference"(%718, %407, %406, %405, %404) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %720 = mhlo.maximum %719, %323 : tensor<1x28x28x128xf32>
    %721 = "mhlo.convolution"(%720, %415) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x128xf32>, tensor<3x3x128x128xf32>) -> tensor<1x28x28x128xf32>
    %722 = "mhlo.broadcast_in_dim"(%414) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %723 = mhlo.add %721, %722 : tensor<1x28x28x128xf32>
    %724 = "mhlo.batch_norm_inference"(%723, %413, %412, %411, %410) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %725 = mhlo.maximum %724, %323 : tensor<1x28x28x128xf32>
    %726 = "mhlo.convolution"(%725, %421) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x128xf32>, tensor<1x1x128x512xf32>) -> tensor<1x28x28x512xf32>
    %727 = "mhlo.broadcast_in_dim"(%420) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %728 = mhlo.add %726, %727 : tensor<1x28x28x512xf32>
    %729 = "mhlo.batch_norm_inference"(%728, %419, %418, %417, %416) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %730 = mhlo.add %715, %729 : tensor<1x28x28x512xf32>
    %731 = mhlo.maximum %730, %324 : tensor<1x28x28x512xf32>
    %732 = "mhlo.convolution"(%731, %427) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x512xf32>, tensor<1x1x512x128xf32>) -> tensor<1x28x28x128xf32>
    %733 = "mhlo.broadcast_in_dim"(%426) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %734 = mhlo.add %732, %733 : tensor<1x28x28x128xf32>
    %735 = "mhlo.batch_norm_inference"(%734, %425, %424, %423, %422) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %736 = mhlo.maximum %735, %323 : tensor<1x28x28x128xf32>
    %737 = "mhlo.convolution"(%736, %433) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x128xf32>, tensor<3x3x128x128xf32>) -> tensor<1x28x28x128xf32>
    %738 = "mhlo.broadcast_in_dim"(%432) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %739 = mhlo.add %737, %738 : tensor<1x28x28x128xf32>
    %740 = "mhlo.batch_norm_inference"(%739, %431, %430, %429, %428) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %741 = mhlo.maximum %740, %323 : tensor<1x28x28x128xf32>
    %742 = "mhlo.convolution"(%741, %439) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x128xf32>, tensor<1x1x128x512xf32>) -> tensor<1x28x28x512xf32>
    %743 = "mhlo.broadcast_in_dim"(%438) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %744 = mhlo.add %742, %743 : tensor<1x28x28x512xf32>
    %745 = "mhlo.batch_norm_inference"(%744, %437, %436, %435, %434) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %746 = mhlo.add %731, %745 : tensor<1x28x28x512xf32>
    %747 = mhlo.maximum %746, %324 : tensor<1x28x28x512xf32>
    %748 = "mhlo.convolution"(%747, %445) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x512xf32>, tensor<1x1x512x128xf32>) -> tensor<1x28x28x128xf32>
    %749 = "mhlo.broadcast_in_dim"(%444) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %750 = mhlo.add %748, %749 : tensor<1x28x28x128xf32>
    %751 = "mhlo.batch_norm_inference"(%750, %443, %442, %441, %440) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %752 = mhlo.maximum %751, %323 : tensor<1x28x28x128xf32>
    %753 = "mhlo.convolution"(%752, %451) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x128xf32>, tensor<3x3x128x128xf32>) -> tensor<1x28x28x128xf32>
    %754 = "mhlo.broadcast_in_dim"(%450) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %755 = mhlo.add %753, %754 : tensor<1x28x28x128xf32>
    %756 = "mhlo.batch_norm_inference"(%755, %449, %448, %447, %446) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %757 = mhlo.maximum %756, %323 : tensor<1x28x28x128xf32>
    %758 = "mhlo.convolution"(%757, %457) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x128xf32>, tensor<1x1x128x512xf32>) -> tensor<1x28x28x512xf32>
    %759 = "mhlo.broadcast_in_dim"(%456) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %760 = mhlo.add %758, %759 : tensor<1x28x28x512xf32>
    %761 = "mhlo.batch_norm_inference"(%760, %455, %454, %453, %452) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %762 = mhlo.add %747, %761 : tensor<1x28x28x512xf32>
    %763 = mhlo.maximum %762, %324 : tensor<1x28x28x512xf32>
    %764 = "mhlo.convolution"(%763, %463) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x512xf32>, tensor<1x1x512x128xf32>) -> tensor<1x28x28x128xf32>
    %765 = "mhlo.broadcast_in_dim"(%462) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %766 = mhlo.add %764, %765 : tensor<1x28x28x128xf32>
    %767 = "mhlo.batch_norm_inference"(%766, %461, %460, %459, %458) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %768 = mhlo.maximum %767, %323 : tensor<1x28x28x128xf32>
    %769 = "mhlo.convolution"(%768, %469) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x128xf32>, tensor<3x3x128x128xf32>) -> tensor<1x28x28x128xf32>
    %770 = "mhlo.broadcast_in_dim"(%468) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %771 = mhlo.add %769, %770 : tensor<1x28x28x128xf32>
    %772 = "mhlo.batch_norm_inference"(%771, %467, %466, %465, %464) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) -> tensor<1x28x28x128xf32>
    %773 = mhlo.maximum %772, %323 : tensor<1x28x28x128xf32>
    %774 = "mhlo.convolution"(%773, %475) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x28x28x128xf32>, tensor<1x1x128x512xf32>) -> tensor<1x28x28x512xf32>
    %775 = "mhlo.broadcast_in_dim"(%474) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %776 = mhlo.add %774, %775 : tensor<1x28x28x512xf32>
    %777 = "mhlo.batch_norm_inference"(%776, %473, %472, %471, %470) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x28x28x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x28x28x512xf32>
    %778 = mhlo.add %763, %777 : tensor<1x28x28x512xf32>
    %779 = mhlo.maximum %778, %324 : tensor<1x28x28x512xf32>
    %780 = "mhlo.convolution"(%779, %481) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : (tensor<1x28x28x512xf32>, tensor<1x1x512x1024xf32>) -> tensor<1x14x14x1024xf32>
    %781 = "mhlo.broadcast_in_dim"(%480) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %782 = mhlo.add %780, %781 : tensor<1x14x14x1024xf32>
    %783 = "mhlo.batch_norm_inference"(%782, %479, %478, %477, %476) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %784 = "mhlo.convolution"(%779, %487) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : (tensor<1x28x28x512xf32>, tensor<1x1x512x256xf32>) -> tensor<1x14x14x256xf32>
    %785 = "mhlo.broadcast_in_dim"(%486) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %786 = mhlo.add %784, %785 : tensor<1x14x14x256xf32>
    %787 = "mhlo.batch_norm_inference"(%786, %485, %484, %483, %482) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %788 = mhlo.maximum %787, %325 : tensor<1x14x14x256xf32>
    %789 = "mhlo.convolution"(%788, %493) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<3x3x256x256xf32>) -> tensor<1x14x14x256xf32>
    %790 = "mhlo.broadcast_in_dim"(%492) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %791 = mhlo.add %789, %790 : tensor<1x14x14x256xf32>
    %792 = "mhlo.batch_norm_inference"(%791, %491, %490, %489, %488) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %793 = mhlo.maximum %792, %325 : tensor<1x14x14x256xf32>
    %794 = "mhlo.convolution"(%793, %499) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<1x1x256x1024xf32>) -> tensor<1x14x14x1024xf32>
    %795 = "mhlo.broadcast_in_dim"(%498) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %796 = mhlo.add %794, %795 : tensor<1x14x14x1024xf32>
    %797 = "mhlo.batch_norm_inference"(%796, %497, %496, %495, %494) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %798 = mhlo.add %783, %797 : tensor<1x14x14x1024xf32>
    %799 = mhlo.maximum %798, %326 : tensor<1x14x14x1024xf32>
    %800 = "mhlo.convolution"(%799, %505) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x1024xf32>, tensor<1x1x1024x256xf32>) -> tensor<1x14x14x256xf32>
    %801 = "mhlo.broadcast_in_dim"(%504) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %802 = mhlo.add %800, %801 : tensor<1x14x14x256xf32>
    %803 = "mhlo.batch_norm_inference"(%802, %503, %502, %501, %500) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %804 = mhlo.maximum %803, %325 : tensor<1x14x14x256xf32>
    %805 = "mhlo.convolution"(%804, %511) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<3x3x256x256xf32>) -> tensor<1x14x14x256xf32>
    %806 = "mhlo.broadcast_in_dim"(%510) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %807 = mhlo.add %805, %806 : tensor<1x14x14x256xf32>
    %808 = "mhlo.batch_norm_inference"(%807, %509, %508, %507, %506) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %809 = mhlo.maximum %808, %325 : tensor<1x14x14x256xf32>
    %810 = "mhlo.convolution"(%809, %517) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<1x1x256x1024xf32>) -> tensor<1x14x14x1024xf32>
    %811 = "mhlo.broadcast_in_dim"(%516) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %812 = mhlo.add %810, %811 : tensor<1x14x14x1024xf32>
    %813 = "mhlo.batch_norm_inference"(%812, %515, %514, %513, %512) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %814 = mhlo.add %799, %813 : tensor<1x14x14x1024xf32>
    %815 = mhlo.maximum %814, %326 : tensor<1x14x14x1024xf32>
    %816 = "mhlo.convolution"(%815, %523) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x1024xf32>, tensor<1x1x1024x256xf32>) -> tensor<1x14x14x256xf32>
    %817 = "mhlo.broadcast_in_dim"(%522) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %818 = mhlo.add %816, %817 : tensor<1x14x14x256xf32>
    %819 = "mhlo.batch_norm_inference"(%818, %521, %520, %519, %518) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %820 = mhlo.maximum %819, %325 : tensor<1x14x14x256xf32>
    %821 = "mhlo.convolution"(%820, %529) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<3x3x256x256xf32>) -> tensor<1x14x14x256xf32>
    %822 = "mhlo.broadcast_in_dim"(%528) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %823 = mhlo.add %821, %822 : tensor<1x14x14x256xf32>
    %824 = "mhlo.batch_norm_inference"(%823, %527, %526, %525, %524) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %825 = mhlo.maximum %824, %325 : tensor<1x14x14x256xf32>
    %826 = "mhlo.convolution"(%825, %535) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<1x1x256x1024xf32>) -> tensor<1x14x14x1024xf32>
    %827 = "mhlo.broadcast_in_dim"(%534) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %828 = mhlo.add %826, %827 : tensor<1x14x14x1024xf32>
    %829 = "mhlo.batch_norm_inference"(%828, %533, %532, %531, %530) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %830 = mhlo.add %815, %829 : tensor<1x14x14x1024xf32>
    %831 = mhlo.maximum %830, %326 : tensor<1x14x14x1024xf32>
    %832 = "mhlo.convolution"(%831, %541) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x1024xf32>, tensor<1x1x1024x256xf32>) -> tensor<1x14x14x256xf32>
    %833 = "mhlo.broadcast_in_dim"(%540) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %834 = mhlo.add %832, %833 : tensor<1x14x14x256xf32>
    %835 = "mhlo.batch_norm_inference"(%834, %539, %538, %537, %536) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %836 = mhlo.maximum %835, %325 : tensor<1x14x14x256xf32>
    %837 = "mhlo.convolution"(%836, %547) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<3x3x256x256xf32>) -> tensor<1x14x14x256xf32>
    %838 = "mhlo.broadcast_in_dim"(%546) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %839 = mhlo.add %837, %838 : tensor<1x14x14x256xf32>
    %840 = "mhlo.batch_norm_inference"(%839, %545, %544, %543, %542) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %841 = mhlo.maximum %840, %325 : tensor<1x14x14x256xf32>
    %842 = "mhlo.convolution"(%841, %553) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<1x1x256x1024xf32>) -> tensor<1x14x14x1024xf32>
    %843 = "mhlo.broadcast_in_dim"(%552) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %844 = mhlo.add %842, %843 : tensor<1x14x14x1024xf32>
    %845 = "mhlo.batch_norm_inference"(%844, %551, %550, %549, %548) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %846 = mhlo.add %831, %845 : tensor<1x14x14x1024xf32>
    %847 = mhlo.maximum %846, %326 : tensor<1x14x14x1024xf32>
    %848 = "mhlo.convolution"(%847, %559) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x1024xf32>, tensor<1x1x1024x256xf32>) -> tensor<1x14x14x256xf32>
    %849 = "mhlo.broadcast_in_dim"(%558) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %850 = mhlo.add %848, %849 : tensor<1x14x14x256xf32>
    %851 = "mhlo.batch_norm_inference"(%850, %557, %556, %555, %554) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %852 = mhlo.maximum %851, %325 : tensor<1x14x14x256xf32>
    %853 = "mhlo.convolution"(%852, %565) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<3x3x256x256xf32>) -> tensor<1x14x14x256xf32>
    %854 = "mhlo.broadcast_in_dim"(%564) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %855 = mhlo.add %853, %854 : tensor<1x14x14x256xf32>
    %856 = "mhlo.batch_norm_inference"(%855, %563, %562, %561, %560) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %857 = mhlo.maximum %856, %325 : tensor<1x14x14x256xf32>
    %858 = "mhlo.convolution"(%857, %571) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<1x1x256x1024xf32>) -> tensor<1x14x14x1024xf32>
    %859 = "mhlo.broadcast_in_dim"(%570) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %860 = mhlo.add %858, %859 : tensor<1x14x14x1024xf32>
    %861 = "mhlo.batch_norm_inference"(%860, %569, %568, %567, %566) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %862 = mhlo.add %847, %861 : tensor<1x14x14x1024xf32>
    %863 = mhlo.maximum %862, %326 : tensor<1x14x14x1024xf32>
    %864 = "mhlo.convolution"(%863, %577) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x1024xf32>, tensor<1x1x1024x256xf32>) -> tensor<1x14x14x256xf32>
    %865 = "mhlo.broadcast_in_dim"(%576) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %866 = mhlo.add %864, %865 : tensor<1x14x14x256xf32>
    %867 = "mhlo.batch_norm_inference"(%866, %575, %574, %573, %572) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %868 = mhlo.maximum %867, %325 : tensor<1x14x14x256xf32>
    %869 = "mhlo.convolution"(%868, %583) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<3x3x256x256xf32>) -> tensor<1x14x14x256xf32>
    %870 = "mhlo.broadcast_in_dim"(%582) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %871 = mhlo.add %869, %870 : tensor<1x14x14x256xf32>
    %872 = "mhlo.batch_norm_inference"(%871, %581, %580, %579, %578) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>) -> tensor<1x14x14x256xf32>
    %873 = mhlo.maximum %872, %325 : tensor<1x14x14x256xf32>
    %874 = "mhlo.convolution"(%873, %589) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x14x14x256xf32>, tensor<1x1x256x1024xf32>) -> tensor<1x14x14x1024xf32>
    %875 = "mhlo.broadcast_in_dim"(%588) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %876 = mhlo.add %874, %875 : tensor<1x14x14x1024xf32>
    %877 = "mhlo.batch_norm_inference"(%876, %587, %586, %585, %584) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x14x14x1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1x14x14x1024xf32>
    %878 = mhlo.add %863, %877 : tensor<1x14x14x1024xf32>
    %879 = mhlo.maximum %878, %326 : tensor<1x14x14x1024xf32>
    %880 = "mhlo.convolution"(%879, %595) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : (tensor<1x14x14x1024xf32>, tensor<1x1x1024x2048xf32>) -> tensor<1x7x7x2048xf32>
    %881 = "mhlo.broadcast_in_dim"(%594) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<2048xf32>) -> tensor<1x7x7x2048xf32>
    %882 = mhlo.add %880, %881 : tensor<1x7x7x2048xf32>
    %883 = "mhlo.batch_norm_inference"(%882, %593, %592, %591, %590) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x2048xf32>, tensor<2048xf32>, tensor<2048xf32>, tensor<2048xf32>, tensor<2048xf32>) -> tensor<1x7x7x2048xf32>
    %884 = "mhlo.convolution"(%879, %601) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : (tensor<1x14x14x1024xf32>, tensor<1x1x1024x512xf32>) -> tensor<1x7x7x512xf32>
    %885 = "mhlo.broadcast_in_dim"(%600) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %886 = mhlo.add %884, %885 : tensor<1x7x7x512xf32>
    %887 = "mhlo.batch_norm_inference"(%886, %599, %598, %597, %596) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %888 = mhlo.maximum %887, %327 : tensor<1x7x7x512xf32>
    %889 = "mhlo.convolution"(%888, %607) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x7x7x512xf32>, tensor<3x3x512x512xf32>) -> tensor<1x7x7x512xf32>
    %890 = "mhlo.broadcast_in_dim"(%606) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %891 = mhlo.add %889, %890 : tensor<1x7x7x512xf32>
    %892 = "mhlo.batch_norm_inference"(%891, %605, %604, %603, %602) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %893 = mhlo.maximum %892, %327 : tensor<1x7x7x512xf32>
    %894 = "mhlo.convolution"(%893, %613) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x7x7x512xf32>, tensor<1x1x512x2048xf32>) -> tensor<1x7x7x2048xf32>
    %895 = "mhlo.broadcast_in_dim"(%612) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<2048xf32>) -> tensor<1x7x7x2048xf32>
    %896 = mhlo.add %894, %895 : tensor<1x7x7x2048xf32>
    %897 = "mhlo.batch_norm_inference"(%896, %611, %610, %609, %608) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x2048xf32>, tensor<2048xf32>, tensor<2048xf32>, tensor<2048xf32>, tensor<2048xf32>) -> tensor<1x7x7x2048xf32>
    %898 = mhlo.add %883, %897 : tensor<1x7x7x2048xf32>
    %899 = mhlo.maximum %898, %328 : tensor<1x7x7x2048xf32>
    %900 = "mhlo.convolution"(%899, %619) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x7x7x2048xf32>, tensor<1x1x2048x512xf32>) -> tensor<1x7x7x512xf32>
    %901 = "mhlo.broadcast_in_dim"(%618) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %902 = mhlo.add %900, %901 : tensor<1x7x7x512xf32>
    %903 = "mhlo.batch_norm_inference"(%902, %617, %616, %615, %614) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %904 = mhlo.maximum %903, %327 : tensor<1x7x7x512xf32>
    %905 = "mhlo.convolution"(%904, %625) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x7x7x512xf32>, tensor<3x3x512x512xf32>) -> tensor<1x7x7x512xf32>
    %906 = "mhlo.broadcast_in_dim"(%624) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %907 = mhlo.add %905, %906 : tensor<1x7x7x512xf32>
    %908 = "mhlo.batch_norm_inference"(%907, %623, %622, %621, %620) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %909 = mhlo.maximum %908, %327 : tensor<1x7x7x512xf32>
    %910 = "mhlo.convolution"(%909, %631) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x7x7x512xf32>, tensor<1x1x512x2048xf32>) -> tensor<1x7x7x2048xf32>
    %911 = "mhlo.broadcast_in_dim"(%630) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<2048xf32>) -> tensor<1x7x7x2048xf32>
    %912 = mhlo.add %910, %911 : tensor<1x7x7x2048xf32>
    %913 = "mhlo.batch_norm_inference"(%912, %629, %628, %627, %626) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x2048xf32>, tensor<2048xf32>, tensor<2048xf32>, tensor<2048xf32>, tensor<2048xf32>) -> tensor<1x7x7x2048xf32>
    %914 = mhlo.add %899, %913 : tensor<1x7x7x2048xf32>
    %915 = mhlo.maximum %914, %328 : tensor<1x7x7x2048xf32>
    %916 = "mhlo.convolution"(%915, %637) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x7x7x2048xf32>, tensor<1x1x2048x512xf32>) -> tensor<1x7x7x512xf32>
    %917 = "mhlo.broadcast_in_dim"(%636) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %918 = mhlo.add %916, %917 : tensor<1x7x7x512xf32>
    %919 = "mhlo.batch_norm_inference"(%918, %635, %634, %633, %632) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %920 = mhlo.maximum %919, %327 : tensor<1x7x7x512xf32>
    %921 = "mhlo.convolution"(%920, %643) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x7x7x512xf32>, tensor<3x3x512x512xf32>) -> tensor<1x7x7x512xf32>
    %922 = "mhlo.broadcast_in_dim"(%642) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %923 = mhlo.add %921, %922 : tensor<1x7x7x512xf32>
    %924 = "mhlo.batch_norm_inference"(%923, %641, %640, %639, %638) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>) -> tensor<1x7x7x512xf32>
    %925 = mhlo.maximum %924, %327 : tensor<1x7x7x512xf32>
    %926 = "mhlo.convolution"(%925, %649) {batch_group_count = 1 : i64, dimension_numbers = {input_batch_dimension = 0 : i64, input_feature_dimension = 3 : i64, input_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>, kernel_input_feature_dimension = 2 : i64, kernel_output_feature_dimension = 3 : i64, kernel_spatial_dimensions = dense<[0, 1]> : tensor<2xi64>, output_batch_dimension = 0 : i64, output_feature_dimension = 3 : i64, output_spatial_dimensions = dense<[1, 2]> : tensor<2xi64>}, feature_group_count = 1 : i64, padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<1x7x7x512xf32>, tensor<1x1x512x2048xf32>) -> tensor<1x7x7x2048xf32>
    %927 = "mhlo.broadcast_in_dim"(%648) {broadcast_dimensions = dense<3> : tensor<1xi64>} : (tensor<2048xf32>) -> tensor<1x7x7x2048xf32>
    %928 = mhlo.add %926, %927 : tensor<1x7x7x2048xf32>
    %929 = "mhlo.batch_norm_inference"(%928, %647, %646, %645, %644) {epsilon = 1.001000e-05 : f32, feature_index = 3 : i64} : (tensor<1x7x7x2048xf32>, tensor<2048xf32>, tensor<2048xf32>, tensor<2048xf32>, tensor<2048xf32>) -> tensor<1x7x7x2048xf32>
    %930 = mhlo.add %915, %929 : tensor<1x7x7x2048xf32>
    %931 = mhlo.maximum %930, %328 : tensor<1x7x7x2048xf32>
    %932 = "mhlo.reduce"(%931, %331) ( {
    ^bb0(%arg1: tensor<f32>, %arg2: tensor<f32>):  // no predecessors
      %944 = mhlo.add %arg1, %arg2 : tensor<f32>
      "mhlo.return"(%944) : (tensor<f32>) -> ()
    }) {dimensions = dense<[1, 2]> : tensor<2xi64>} : (tensor<1x7x7x2048xf32>, tensor<f32>) -> tensor<1x2048xf32>
    %933 = mhlo.divide %932, %329 : tensor<1x2048xf32>
    %934 = "mhlo.dot"(%933, %651) : (tensor<1x2048xf32>, tensor<2048x1000xf32>) -> tensor<1x1000xf32>
    %935 = "mhlo.broadcast_in_dim"(%650) {broadcast_dimensions = dense<1> : tensor<1xi64>} : (tensor<1000xf32>) -> tensor<1x1000xf32>
    %936 = mhlo.add %934, %935 : tensor<1x1000xf32>
    %937 = "mhlo.reduce"(%936, %330) ( {
    ^bb0(%arg1: tensor<f32>, %arg2: tensor<f32>):  // no predecessors
      %944 = mhlo.maximum %arg1, %arg2 : tensor<f32>
      "mhlo.return"(%944) : (tensor<f32>) -> ()
    }) {dimensions = dense<1> : tensor<1xi64>} : (tensor<1x1000xf32>, tensor<f32>) -> tensor<1xf32>
    %938 = "mhlo.broadcast_in_dim"(%937) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<1xf32>) -> tensor<1x1000xf32>
    %939 = mhlo.subtract %936, %938 : tensor<1x1000xf32>
    %940 = "mhlo.exponential"(%939) : (tensor<1x1000xf32>) -> tensor<1x1000xf32>
    %941 = "mhlo.reduce"(%940, %331) ( {
    ^bb0(%arg1: tensor<f32>, %arg2: tensor<f32>):  // no predecessors
      %944 = mhlo.add %arg1, %arg2 : tensor<f32>
      "mhlo.return"(%944) : (tensor<f32>) -> ()
    }) {dimensions = dense<1> : tensor<1xi64>} : (tensor<1x1000xf32>, tensor<f32>) -> tensor<1xf32>
    %942 = "mhlo.broadcast_in_dim"(%941) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<1xf32>) -> tensor<1x1000xf32>
    %943 = mhlo.divide %940, %942 : tensor<1x1000xf32>
    return %943 : tensor<1x1000xf32>
  }
}

// CHECK: 1x1000xf32=[0.001 0.001 0.001 0.001 0.001
