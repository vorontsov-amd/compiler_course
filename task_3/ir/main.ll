; ModuleID = '../src/main.cpp'
source_filename = "../src/main.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"struct.std::nothrow_t" = type { i8 }
%struct.Image = type { i32, i32, i32, i32, i32, ptr }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon.0 }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon.0 = type { i64, [8 x i8] }
%"class.std::random_device" = type { %union.anon }
%union.anon = type { %"class.std::mersenne_twister_engine" }
%"class.std::mersenne_twister_engine" = type { [624 x i64], i64 }
%"class.std::uniform_int_distribution" = type { %"struct.std::uniform_int_distribution<>::param_type" }
%"struct.std::uniform_int_distribution<>::param_type" = type { i32, i32 }

$_ZN5ImageC2EPKc = comdat any

$_ZN6Vector4randEiiii = comdat any

$__clang_call_terminate = comdat any

$_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE = comdat any

$_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv = comdat any

@__const.main.COLORS = private unnamed_addr constant [8 x i32] [i32 255, i32 65535, i32 65280, i32 16711935, i32 16744192, i32 8323327, i32 16711680, i32 16776960], align 16
@.str = private unnamed_addr constant [25 x i8] c"../images/ppm/output.ppm\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Could not open file %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"%*s %d %d\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Could not read file %s (1)\0A\00", align 1
@_ZSt7nothrow = external global %"struct.std::nothrow_t", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"%d %d %d\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"Could not read file %s (2)\0A\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"default\00", align 1
@str = private unnamed_addr constant [36 x i8] c"Could not allocate memory for image\00", align 1

; Function Attrs: mustprogress norecurse noreturn sspstrong uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca %struct.Image, align 8
  tail call void @simInit()
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %3) #13
  call void @_ZN5ImageC2EPKc(ptr noundef nonnull align 8 dereferenceable(32) %3, ptr noundef nonnull @.str)
  %4 = invoke i64 @_ZN6Vector4randEiiii(i32 noundef 500, i32 noundef 700, i32 noundef 500, i32 noundef 700)
          to label %5 unwind label %35

5:                                                ; preds = %2
  %6 = trunc i64 %4 to i32
  %7 = lshr i64 %4, 32
  %8 = trunc i64 %7 to i32
  store i32 %6, ptr %3, align 8, !tbaa !5
  %9 = getelementptr inbounds %struct.Image, ptr %3, i64 0, i32 1
  %10 = getelementptr inbounds %struct.Image, ptr %3, i64 0, i32 2
  %11 = getelementptr inbounds %struct.Image, ptr %3, i64 0, i32 4
  %12 = getelementptr inbounds %struct.Image, ptr %3, i64 0, i32 3
  %13 = getelementptr inbounds %struct.Image, ptr %3, i64 0, i32 5
  br label %14

14:                                               ; preds = %101, %5
  %15 = phi i32 [ %103, %101 ], [ %6, %5 ]
  %16 = phi i32 [ %105, %101 ], [ %8, %5 ]
  %17 = phi i32 [ %56, %101 ], [ 10, %5 ]
  %18 = phi i32 [ %38, %101 ], [ 10, %5 ]
  %19 = phi i32 [ %57, %101 ], [ 0, %5 ]
  store i32 %16, ptr %9, align 4, !tbaa !11
  %20 = icmp sgt i32 %15, -1
  %21 = load i32, ptr %10, align 8, !tbaa !12
  %22 = add nsw i32 %21, %15
  %23 = icmp slt i32 %22, 1920
  %24 = select i1 %20, i1 %23, i1 false
  br i1 %24, label %37, label %25

25:                                               ; preds = %14
  %26 = sub i32 1919, %21
  %27 = call i32 @llvm.smax.i32(i32 %15, i32 0)
  %28 = call i32 @llvm.smin.i32(i32 %26, i32 %27)
  store i32 %28, ptr %3, align 8, !tbaa !5
  %29 = sub nsw i32 0, %18
  %30 = add nsw i32 %19, 1
  %31 = and i32 %19, 7
  %32 = zext nneg i32 %31 to i64
  %33 = getelementptr inbounds [8 x i32], ptr @__const.main.COLORS, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4, !tbaa !13
  store i32 %34, ptr %11, align 8, !tbaa !15
  br label %37

35:                                               ; preds = %2
  %36 = landingpad { ptr, i32 }
          cleanup
  br label %110

37:                                               ; preds = %14, %25
  %38 = phi i32 [ %29, %25 ], [ %18, %14 ]
  %39 = phi i32 [ %30, %25 ], [ %19, %14 ]
  %40 = icmp sgt i32 %16, -1
  %41 = load i32, ptr %12, align 4, !tbaa !16
  %42 = add nsw i32 %41, %16
  %43 = icmp slt i32 %42, 1080
  %44 = select i1 %40, i1 %43, i1 false
  br i1 %44, label %55, label %45

45:                                               ; preds = %37
  %46 = sub i32 1079, %41
  %47 = call i32 @llvm.smax.i32(i32 %16, i32 0)
  %48 = call i32 @llvm.smin.i32(i32 %46, i32 %47)
  store i32 %48, ptr %9, align 4, !tbaa !11
  %49 = sub nsw i32 0, %17
  %50 = add nsw i32 %39, 1
  %51 = and i32 %39, 7
  %52 = zext nneg i32 %51 to i64
  %53 = getelementptr inbounds [8 x i32], ptr @__const.main.COLORS, i64 0, i64 %52
  %54 = load i32, ptr %53, align 4, !tbaa !13
  store i32 %54, ptr %11, align 8, !tbaa !15
  br label %55

55:                                               ; preds = %37, %45
  %56 = phi i32 [ %49, %45 ], [ %17, %37 ]
  %57 = phi i32 [ %50, %45 ], [ %39, %37 ]
  invoke void @simClearWindow()
          to label %58 unwind label %108

58:                                               ; preds = %55
  %59 = load i32, ptr %10, align 8, !tbaa !12
  %60 = icmp sgt i32 %59, 0
  br i1 %60, label %61, label %100

61:                                               ; preds = %58
  %62 = load i32, ptr %12, align 4, !tbaa !16
  br label %63

63:                                               ; preds = %71, %61
  %64 = phi i32 [ %59, %61 ], [ %72, %71 ]
  %65 = phi i32 [ %62, %61 ], [ %73, %71 ]
  %66 = phi i32 [ %62, %61 ], [ %74, %71 ]
  %67 = phi i32 [ 0, %61 ], [ %75, %71 ]
  %68 = icmp sgt i32 %66, 0
  br i1 %68, label %77, label %71

69:                                               ; preds = %96
  %70 = load i32, ptr %10, align 8, !tbaa !12
  br label %71

71:                                               ; preds = %69, %63
  %72 = phi i32 [ %70, %69 ], [ %64, %63 ]
  %73 = phi i32 [ %97, %69 ], [ %65, %63 ]
  %74 = phi i32 [ %97, %69 ], [ %66, %63 ]
  %75 = add nuw nsw i32 %67, 1
  %76 = icmp slt i32 %75, %72
  br i1 %76, label %63, label %100, !llvm.loop !17

77:                                               ; preds = %63, %96
  %78 = phi i32 [ %97, %96 ], [ %65, %63 ]
  %79 = phi i32 [ %98, %96 ], [ 0, %63 ]
  %80 = load ptr, ptr %13, align 8, !tbaa !19
  %81 = load i32, ptr %10, align 8, !tbaa !12
  %82 = mul nsw i32 %81, %79
  %83 = add nsw i32 %82, %67
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, ptr %80, i64 %84
  %86 = load i32, ptr %85, align 4, !tbaa !20
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %96, label %88

88:                                               ; preds = %77
  %89 = load i32, ptr %9, align 4, !tbaa !11
  %90 = add nsw i32 %89, %79
  %91 = load i32, ptr %3, align 8, !tbaa !5
  %92 = add nsw i32 %91, %67
  %93 = load i32, ptr %11, align 8, !tbaa !15
  invoke void @simPutPixel(i32 noundef %92, i32 noundef %90, i32 noundef %93)
          to label %94 unwind label %106

94:                                               ; preds = %88
  %95 = load i32, ptr %12, align 4, !tbaa !16
  br label %96

96:                                               ; preds = %94, %77
  %97 = phi i32 [ %95, %94 ], [ %78, %77 ]
  %98 = add nuw nsw i32 %79, 1
  %99 = icmp slt i32 %98, %97
  br i1 %99, label %77, label %69, !llvm.loop !21

100:                                              ; preds = %71, %58
  invoke void @simFlush()
          to label %101 unwind label %108

101:                                              ; preds = %100
  %102 = load i32, ptr %3, align 8, !tbaa !5
  %103 = add nsw i32 %102, %38
  store i32 %103, ptr %3, align 8, !tbaa !5
  %104 = load i32, ptr %9, align 4, !tbaa !11
  %105 = add nsw i32 %104, %56
  br label %14, !llvm.loop !22

106:                                              ; preds = %88
  %107 = landingpad { ptr, i32 }
          cleanup
  br label %110

108:                                              ; preds = %55, %100
  %109 = landingpad { ptr, i32 }
          cleanup
  br label %110

110:                                              ; preds = %106, %108, %35
  %111 = phi { ptr, i32 } [ %36, %35 ], [ %107, %106 ], [ %109, %108 ]
  %112 = getelementptr inbounds %struct.Image, ptr %3, i64 0, i32 5
  %113 = load ptr, ptr %112, align 8, !tbaa !19
  %114 = icmp eq ptr %113, null
  br i1 %114, label %116, label %115

115:                                              ; preds = %110
  call void @_ZdaPv(ptr noundef nonnull %113) #14
  br label %116

116:                                              ; preds = %110, %115
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %3) #13
  resume { ptr, i32 } %111
}

declare void @simInit() local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: mustprogress sspstrong uwtable
define linkonce_odr dso_local void @_ZN5ImageC2EPKc(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef %1) unnamed_addr #4 comdat align 2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = getelementptr inbounds %struct.Image, ptr %0, i64 0, i32 2
  %7 = getelementptr inbounds %struct.Image, ptr %0, i64 0, i32 3
  %8 = getelementptr inbounds %struct.Image, ptr %0, i64 0, i32 4
  %9 = getelementptr inbounds %struct.Image, ptr %0, i64 0, i32 5
  store ptr null, ptr %9, align 8, !tbaa !19
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(20) %0, i8 0, i64 20, i1 false)
  %10 = tail call noalias ptr @fopen(ptr noundef %1, ptr noundef nonnull @.str.1)
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, ptr noundef %1)
  br label %14

14:                                               ; preds = %12, %2
  %15 = tail call i32 (ptr, ptr, ...) @__isoc23_fscanf(ptr noundef %10, ptr noundef nonnull @.str.3, ptr noundef nonnull %6, ptr noundef nonnull %7)
  %16 = icmp eq i32 %15, 2
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, ptr noundef %1)
  br label %19

19:                                               ; preds = %17, %14
  %20 = load i32, ptr %6, align 8, !tbaa !12
  %21 = load i32, ptr %7, align 4, !tbaa !16
  %22 = mul nsw i32 %21, %20
  %23 = sext i32 %22 to i64
  %24 = icmp slt i32 %22, 0
  %25 = shl nsw i64 %23, 2
  %26 = select i1 %24, i64 -1, i64 %25
  %27 = tail call noalias noundef ptr @_ZnamRKSt9nothrow_t(i64 noundef %26, ptr noundef nonnull align 1 dereferenceable(1) @_ZSt7nothrow) #15
  store ptr %27, ptr %9, align 8, !tbaa !19
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %34

29:                                               ; preds = %19
  %30 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %31 = load i32, ptr %6, align 8, !tbaa !12
  %32 = load i32, ptr %7, align 4, !tbaa !16
  %33 = mul nsw i32 %32, %31
  br label %34

34:                                               ; preds = %29, %19
  %35 = phi i32 [ %33, %29 ], [ %22, %19 ]
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %39, label %37

37:                                               ; preds = %57, %34
  %38 = call i32 @fclose(ptr noundef %10)
  ret void

39:                                               ; preds = %34, %57
  %40 = phi i64 [ %58, %57 ], [ 0, %34 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #13
  store i32 0, ptr %3, align 4, !tbaa !20
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #13
  store i32 0, ptr %4, align 4, !tbaa !20
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #13
  store i32 0, ptr %5, align 4, !tbaa !20
  %41 = call i32 (ptr, ptr, ...) @__isoc23_fscanf(ptr noundef %10, ptr noundef nonnull @.str.6, ptr noundef nonnull %3, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %42 = icmp eq i32 %41, 3
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, ptr noundef %1)
  br label %45

45:                                               ; preds = %43, %39
  %46 = load i32, ptr %3, align 4, !tbaa !20
  %47 = shl i32 %46, 16
  %48 = load i32, ptr %4, align 4, !tbaa !20
  %49 = shl i32 %48, 8
  %50 = or i32 %49, %47
  %51 = load i32, ptr %5, align 4, !tbaa !20
  %52 = or i32 %50, %51
  %53 = load ptr, ptr %9, align 8, !tbaa !19
  %54 = getelementptr inbounds i32, ptr %53, i64 %40
  store i32 %52, ptr %54, align 4, !tbaa !20
  %55 = icmp eq i32 %52, 0
  br i1 %55, label %57, label %56

56:                                               ; preds = %45
  store i32 %52, ptr %8, align 8, !tbaa !15
  br label %57

57:                                               ; preds = %56, %45
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #13
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #13
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #13
  %58 = add nuw nsw i64 %40, 1
  %59 = load i32, ptr %6, align 8, !tbaa !12
  %60 = load i32, ptr %7, align 4, !tbaa !16
  %61 = mul nsw i32 %60, %59
  %62 = sext i32 %61 to i64
  %63 = icmp slt i64 %58, %62
  br i1 %63, label %39, label %37, !llvm.loop !23
}

; Function Attrs: mustprogress sspstrong uwtable
define linkonce_odr dso_local i64 @_ZN6Vector4randEiiii(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #4 comdat align 2 personality ptr @__gxx_personality_v0 {
  %5 = alloca %"class.std::__cxx11::basic_string", align 8
  %6 = alloca %"class.std::random_device", align 8
  %7 = alloca %"class.std::mersenne_twister_engine", align 8
  %8 = alloca %"class.std::uniform_int_distribution", align 4
  %9 = alloca %"class.std::uniform_int_distribution", align 4
  call void @llvm.lifetime.start.p0(i64 5000, ptr nonnull %6) #13
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %5) #13
  %10 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %5, i64 0, i32 2
  store ptr %10, ptr %5, align 8, !tbaa !24
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(7) %10, ptr noundef nonnull align 1 dereferenceable(7) @.str.8, i64 7, i1 false)
  %11 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %5, i64 0, i32 1
  store i64 7, ptr %11, align 8, !tbaa !26
  %12 = getelementptr inbounds i8, ptr %5, i64 23
  store i8 0, ptr %12, align 1, !tbaa !29
  invoke void @_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(ptr noundef nonnull align 8 dereferenceable(5000) %6, ptr noundef nonnull align 8 dereferenceable(32) %5)
          to label %13 unwind label %20

13:                                               ; preds = %4
  %14 = load ptr, ptr %5, align 8, !tbaa !30
  %15 = icmp eq ptr %14, %10
  br i1 %15, label %16, label %19

16:                                               ; preds = %13
  %17 = load i64, ptr %11, align 8, !tbaa !26
  %18 = icmp ult i64 %17, 16
  call void @llvm.assume(i1 %18)
  br label %31

19:                                               ; preds = %13
  call void @_ZdlPv(ptr noundef %14) #14
  br label %31

20:                                               ; preds = %4
  %21 = landingpad { ptr, i32 }
          cleanup
  %22 = load ptr, ptr %5, align 8, !tbaa !30
  %23 = icmp eq ptr %22, %10
  br i1 %23, label %24, label %27

24:                                               ; preds = %20
  %25 = load i64, ptr %11, align 8, !tbaa !26
  %26 = icmp ult i64 %25, 16
  call void @llvm.assume(i1 %26)
  br label %30

27:                                               ; preds = %20
  call void @_ZdlPv(ptr noundef %22) #14
  br label %30

28:                                               ; preds = %79, %30
  %29 = phi { ptr, i32 } [ %21, %30 ], [ %75, %79 ]
  resume { ptr, i32 } %29

30:                                               ; preds = %27, %24
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %5) #13
  br label %28

31:                                               ; preds = %16, %19
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %5) #13
  call void @llvm.lifetime.start.p0(i64 5000, ptr nonnull %7) #13
  %32 = invoke noundef i32 @_ZNSt13random_device9_M_getvalEv(ptr noundef nonnull align 8 dereferenceable(5000) %6)
          to label %33 unwind label %70

33:                                               ; preds = %31
  %34 = zext i32 %32 to i64
  store i64 %34, ptr %7, align 8, !tbaa !31
  br label %35

35:                                               ; preds = %46, %33
  %36 = phi i64 [ %34, %33 ], [ %51, %46 ]
  %37 = phi i64 [ 1, %33 ], [ %53, %46 ]
  %38 = lshr i64 %36, 30
  %39 = xor i64 %38, %36
  %40 = mul nuw nsw i64 %39, 1812433253
  %41 = add nuw i64 %40, %37
  %42 = and i64 %41, 4294967295
  %43 = getelementptr inbounds [624 x i64], ptr %7, i64 0, i64 %37
  store i64 %42, ptr %43, align 8, !tbaa !31
  %44 = add nuw nsw i64 %37, 1
  %45 = icmp eq i64 %44, 624
  br i1 %45, label %54, label %46, !llvm.loop !32

46:                                               ; preds = %35
  %47 = lshr i64 %42, 30
  %48 = xor i64 %47, %41
  %49 = mul i64 %48, 1812433253
  %50 = add i64 %49, %44
  %51 = and i64 %50, 4294967295
  %52 = getelementptr inbounds [624 x i64], ptr %7, i64 0, i64 %44
  store i64 %51, ptr %52, align 8, !tbaa !31
  %53 = add nuw nsw i64 %37, 2
  br label %35

54:                                               ; preds = %35
  %55 = getelementptr inbounds %"class.std::mersenne_twister_engine", ptr %7, i64 0, i32 1
  store i64 624, ptr %55, align 8, !tbaa !33
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8) #13
  store i32 %0, ptr %8, align 4, !tbaa !35
  %56 = getelementptr inbounds %"struct.std::uniform_int_distribution<>::param_type", ptr %8, i64 0, i32 1
  store i32 %1, ptr %56, align 4, !tbaa !37
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9) #13
  store i32 %2, ptr %9, align 4, !tbaa !35
  %57 = getelementptr inbounds %"struct.std::uniform_int_distribution<>::param_type", ptr %9, i64 0, i32 1
  store i32 %3, ptr %57, align 4, !tbaa !37
  %58 = invoke noundef i32 @_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE(ptr noundef nonnull align 4 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(5000) %7, ptr noundef nonnull align 4 dereferenceable(8) %8)
          to label %59 unwind label %72

59:                                               ; preds = %54
  %60 = invoke noundef i32 @_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE(ptr noundef nonnull align 4 dereferenceable(8) %9, ptr noundef nonnull align 8 dereferenceable(5000) %7, ptr noundef nonnull align 4 dereferenceable(8) %9)
          to label %61 unwind label %72

61:                                               ; preds = %59
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9) #13
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8) #13
  call void @llvm.lifetime.end.p0(i64 5000, ptr nonnull %7) #13
  invoke void @_ZNSt13random_device7_M_finiEv(ptr noundef nonnull align 8 dereferenceable(5000) %6)
          to label %65 unwind label %62

62:                                               ; preds = %61
  %63 = landingpad { ptr, i32 }
          catch ptr null
  %64 = extractvalue { ptr, i32 } %63, 0
  call void @__clang_call_terminate(ptr %64) #16
  unreachable

65:                                               ; preds = %61
  call void @llvm.lifetime.end.p0(i64 5000, ptr nonnull %6) #13
  %66 = zext i32 %60 to i64
  %67 = shl nuw i64 %66, 32
  %68 = zext i32 %58 to i64
  %69 = or disjoint i64 %67, %68
  ret i64 %69

70:                                               ; preds = %31
  %71 = landingpad { ptr, i32 }
          cleanup
  br label %74

72:                                               ; preds = %59, %54
  %73 = landingpad { ptr, i32 }
          cleanup
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9) #13
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8) #13
  br label %74

74:                                               ; preds = %72, %70
  %75 = phi { ptr, i32 } [ %73, %72 ], [ %71, %70 ]
  call void @llvm.lifetime.end.p0(i64 5000, ptr nonnull %7) #13
  invoke void @_ZNSt13random_device7_M_finiEv(ptr noundef nonnull align 8 dereferenceable(5000) %6)
          to label %79 unwind label %76

76:                                               ; preds = %74
  %77 = landingpad { ptr, i32 }
          catch ptr null
  %78 = extractvalue { ptr, i32 } %77, 0
  call void @__clang_call_terminate(ptr %78) #16
  unreachable

79:                                               ; preds = %74
  call void @llvm.lifetime.end.p0(i64 5000, ptr nonnull %6) #13
  br label %28
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

declare void @simClearWindow() local_unnamed_addr #1

declare void @simFlush() local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #5

declare i32 @__isoc23_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #1

; Function Attrs: nobuiltin nounwind allocsize(0)
declare noalias noundef ptr @_ZnamRKSt9nothrow_t(i64 noundef, ptr noundef nonnull align 1 dereferenceable(1)) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #5

declare void @_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(ptr noundef nonnull align 8 dereferenceable(5000), ptr noundef nonnull align 8 dereferenceable(32)) local_unnamed_addr #1

; Function Attrs: noinline noreturn nounwind sspstrong uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) local_unnamed_addr #7 comdat {
  %2 = tail call ptr @__cxa_begin_catch(ptr %0) #13
  tail call void @_ZSt9terminatev() #16
  unreachable
}

declare ptr @__cxa_begin_catch(ptr) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(ptr noundef) local_unnamed_addr #8

declare noundef i32 @_ZNSt13random_device9_M_getvalEv(ptr noundef nonnull align 8 dereferenceable(5000)) local_unnamed_addr #1

; Function Attrs: mustprogress sspstrong uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE(ptr noundef nonnull align 4 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(5000) %1, ptr noundef nonnull align 4 dereferenceable(8) %2) local_unnamed_addr #4 comdat align 2 {
  %4 = alloca %"struct.std::uniform_int_distribution<>::param_type", align 4
  %5 = getelementptr inbounds %"struct.std::uniform_int_distribution<>::param_type", ptr %2, i64 0, i32 1
  %6 = load i32, ptr %5, align 4, !tbaa !37
  %7 = sext i32 %6 to i64
  %8 = load i32, ptr %2, align 4, !tbaa !35
  %9 = sext i32 %8 to i64
  %10 = sub nsw i64 %7, %9
  %11 = icmp ult i64 %10, 4294967295
  br i1 %11, label %12, label %32

12:                                               ; preds = %3
  %13 = trunc i64 %10 to i32
  %14 = add nuw i32 %13, 1
  %15 = tail call noundef i64 @_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv(ptr noundef nonnull align 8 dereferenceable(5000) %1)
  %16 = zext i32 %14 to i64
  %17 = mul i64 %15, %16
  %18 = trunc i64 %17 to i32
  %19 = icmp ult i32 %13, %18
  br i1 %19, label %29, label %20

20:                                               ; preds = %12
  %21 = xor i32 %13, -1
  %22 = urem i32 %21, %14
  %23 = icmp ugt i32 %22, %18
  br i1 %23, label %24, label %29

24:                                               ; preds = %20, %24
  %25 = tail call noundef i64 @_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv(ptr noundef nonnull align 8 dereferenceable(5000) %1)
  %26 = mul i64 %25, %16
  %27 = trunc i64 %26 to i32
  %28 = icmp ugt i32 %22, %27
  br i1 %28, label %24, label %29, !llvm.loop !38

29:                                               ; preds = %24, %12, %20
  %30 = phi i64 [ %17, %12 ], [ %17, %20 ], [ %26, %24 ]
  %31 = lshr i64 %30, 32
  br label %47

32:                                               ; preds = %3
  %33 = icmp eq i64 %10, 4294967295
  br i1 %33, label %45, label %34

34:                                               ; preds = %32
  %35 = getelementptr inbounds %"struct.std::uniform_int_distribution<>::param_type", ptr %4, i64 0, i32 1
  br label %36

36:                                               ; preds = %34, %36
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #13
  store i32 0, ptr %4, align 4, !tbaa !35
  store i32 -1, ptr %35, align 4, !tbaa !37
  %37 = call noundef i32 @_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE(ptr noundef nonnull align 4 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(5000) %1, ptr noundef nonnull align 4 dereferenceable(8) %4)
  %38 = sext i32 %37 to i64
  %39 = shl nsw i64 %38, 32
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #13
  %40 = call noundef i64 @_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv(ptr noundef nonnull align 8 dereferenceable(5000) %1)
  %41 = add i64 %39, %40
  %42 = icmp ugt i64 %41, %10
  %43 = icmp ult i64 %41, %39
  %44 = or i1 %42, %43
  br i1 %44, label %36, label %47, !llvm.loop !39

45:                                               ; preds = %32
  %46 = tail call noundef i64 @_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv(ptr noundef nonnull align 8 dereferenceable(5000) %1)
  br label %47

47:                                               ; preds = %36, %45, %29
  %48 = phi i64 [ %31, %29 ], [ %46, %45 ], [ %41, %36 ]
  %49 = load i32, ptr %2, align 4, !tbaa !35
  %50 = trunc i64 %48 to i32
  %51 = add i32 %49, %50
  ret i32 %51
}

; Function Attrs: mustprogress sspstrong uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv(ptr noundef nonnull align 8 dereferenceable(5000) %0) local_unnamed_addr #4 comdat align 2 {
  %2 = getelementptr inbounds %"class.std::mersenne_twister_engine", ptr %0, i64 0, i32 1
  %3 = load i64, ptr %2, align 8, !tbaa !33
  %4 = icmp ugt i64 %3, 623
  br i1 %4, label %5, label %86

5:                                                ; preds = %1
  %6 = load i64, ptr %0, align 8, !tbaa !31
  %7 = insertelement <2 x i64> poison, i64 %6, i64 1
  br label %8

8:                                                ; preds = %8, %5
  %9 = phi i64 [ 0, %5 ], [ %28, %8 ]
  %10 = phi <2 x i64> [ %7, %5 ], [ %14, %8 ]
  %11 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 %9
  %12 = or disjoint i64 %9, 1
  %13 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 %12
  %14 = load <2 x i64>, ptr %13, align 8, !tbaa !31
  %15 = shufflevector <2 x i64> %10, <2 x i64> %14, <2 x i32> <i32 1, i32 2>
  %16 = and <2 x i64> %15, <i64 -2147483648, i64 -2147483648>
  %17 = and <2 x i64> %14, <i64 2147483646, i64 2147483646>
  %18 = or disjoint <2 x i64> %17, %16
  %19 = add nuw nsw i64 %9, 397
  %20 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 %19
  %21 = load <2 x i64>, ptr %20, align 8, !tbaa !31
  %22 = lshr exact <2 x i64> %18, <i64 1, i64 1>
  %23 = xor <2 x i64> %22, %21
  %24 = and <2 x i64> %14, <i64 1, i64 1>
  %25 = icmp eq <2 x i64> %24, zeroinitializer
  %26 = select <2 x i1> %25, <2 x i64> zeroinitializer, <2 x i64> <i64 2567483615, i64 2567483615>
  %27 = xor <2 x i64> %23, %26
  store <2 x i64> %27, ptr %11, align 8, !tbaa !31
  %28 = add nuw i64 %9, 2
  %29 = icmp eq i64 %28, 226
  br i1 %29, label %30, label %8, !llvm.loop !40

30:                                               ; preds = %8
  %31 = extractelement <2 x i64> %14, i64 1
  %32 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 226
  %33 = and i64 %31, -2147483648
  %34 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 227
  %35 = load i64, ptr %34, align 8, !tbaa !31
  %36 = and i64 %35, 2147483646
  %37 = or disjoint i64 %36, %33
  %38 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 623
  %39 = load i64, ptr %38, align 8, !tbaa !31
  %40 = lshr exact i64 %37, 1
  %41 = xor i64 %40, %39
  %42 = and i64 %35, 1
  %43 = icmp eq i64 %42, 0
  %44 = select i1 %43, i64 0, i64 2567483615
  %45 = xor i64 %41, %44
  store i64 %45, ptr %32, align 8, !tbaa !31
  %46 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 227
  %47 = load i64, ptr %46, align 8, !tbaa !31
  %48 = insertelement <2 x i64> poison, i64 %47, i64 1
  br label %49

49:                                               ; preds = %49, %30
  %50 = phi i64 [ 0, %30 ], [ %69, %49 ]
  %51 = phi <2 x i64> [ %48, %30 ], [ %56, %49 ]
  %52 = add i64 %50, 227
  %53 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 %52
  %54 = add i64 %50, 228
  %55 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 %54
  %56 = load <2 x i64>, ptr %55, align 8, !tbaa !31
  %57 = shufflevector <2 x i64> %51, <2 x i64> %56, <2 x i32> <i32 1, i32 2>
  %58 = and <2 x i64> %57, <i64 -2147483648, i64 -2147483648>
  %59 = and <2 x i64> %56, <i64 2147483646, i64 2147483646>
  %60 = or disjoint <2 x i64> %59, %58
  %61 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 %50
  %62 = load <2 x i64>, ptr %61, align 8, !tbaa !31
  %63 = lshr exact <2 x i64> %60, <i64 1, i64 1>
  %64 = xor <2 x i64> %63, %62
  %65 = and <2 x i64> %56, <i64 1, i64 1>
  %66 = icmp eq <2 x i64> %65, zeroinitializer
  %67 = select <2 x i1> %66, <2 x i64> zeroinitializer, <2 x i64> <i64 2567483615, i64 2567483615>
  %68 = xor <2 x i64> %64, %67
  store <2 x i64> %68, ptr %53, align 8, !tbaa !31
  %69 = add nuw i64 %50, 2
  %70 = icmp eq i64 %69, 396
  br i1 %70, label %71, label %49, !llvm.loop !43

71:                                               ; preds = %49
  %72 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 623
  %73 = load i64, ptr %72, align 8, !tbaa !31
  %74 = and i64 %73, -2147483648
  %75 = load i64, ptr %0, align 8, !tbaa !31
  %76 = and i64 %75, 2147483646
  %77 = or disjoint i64 %76, %74
  %78 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 396
  %79 = load i64, ptr %78, align 8, !tbaa !31
  %80 = lshr exact i64 %77, 1
  %81 = xor i64 %80, %79
  %82 = and i64 %75, 1
  %83 = icmp eq i64 %82, 0
  %84 = select i1 %83, i64 0, i64 2567483615
  %85 = xor i64 %81, %84
  store i64 %85, ptr %72, align 8, !tbaa !31
  br label %86

86:                                               ; preds = %71, %1
  %87 = phi i64 [ 0, %71 ], [ %3, %1 ]
  %88 = add nuw nsw i64 %87, 1
  store i64 %88, ptr %2, align 8, !tbaa !33
  %89 = getelementptr inbounds [624 x i64], ptr %0, i64 0, i64 %87
  %90 = load i64, ptr %89, align 8, !tbaa !31
  %91 = lshr i64 %90, 11
  %92 = and i64 %91, 4294967295
  %93 = xor i64 %92, %90
  %94 = shl i64 %93, 7
  %95 = and i64 %94, 2636928640
  %96 = xor i64 %95, %93
  %97 = shl i64 %96, 15
  %98 = and i64 %97, 4022730752
  %99 = xor i64 %98, %96
  %100 = lshr i64 %99, 18
  %101 = xor i64 %100, %99
  ret i64 %101
}

declare void @_ZNSt13random_device7_M_finiEv(ptr noundef nonnull align 8 dereferenceable(5000)) local_unnamed_addr #1

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(ptr noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #9

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #10

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #12

attributes #0 = { mustprogress norecurse noreturn sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { mustprogress sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nobuiltin nounwind allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noinline noreturn nounwind sspstrong uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #10 = { nofree nounwind }
attributes #11 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #12 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nounwind }
attributes #14 = { builtin nounwind }
attributes #15 = { builtin nounwind allocsize(0) }
attributes #16 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 18.1.8"}
!5 = !{!6, !7, i64 0}
!6 = !{!"_ZTS5Image", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !7, i64 16, !10, i64 24}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!"any pointer", !8, i64 0}
!11 = !{!6, !7, i64 4}
!12 = !{!6, !7, i64 8}
!13 = !{!14, !14, i64 0}
!14 = !{!"_ZTS5color", !8, i64 0}
!15 = !{!6, !7, i64 16}
!16 = !{!6, !7, i64 12}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!6, !10, i64 24}
!20 = !{!7, !7, i64 0}
!21 = distinct !{!21, !18}
!22 = distinct !{!22, !18}
!23 = distinct !{!23, !18}
!24 = !{!25, !10, i64 0}
!25 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !10, i64 0}
!26 = !{!27, !28, i64 8}
!27 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !25, i64 0, !28, i64 8, !8, i64 16}
!28 = !{!"long", !8, i64 0}
!29 = !{!8, !8, i64 0}
!30 = !{!27, !10, i64 0}
!31 = !{!28, !28, i64 0}
!32 = distinct !{!32, !18}
!33 = !{!34, !28, i64 4992}
!34 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !8, i64 0, !28, i64 4992}
!35 = !{!36, !7, i64 0}
!36 = !{!"_ZTSNSt24uniform_int_distributionIiE10param_typeE", !7, i64 0, !7, i64 4}
!37 = !{!36, !7, i64 4}
!38 = distinct !{!38, !18}
!39 = distinct !{!39, !18}
!40 = distinct !{!40, !18, !41, !42}
!41 = !{!"llvm.loop.isvectorized", i32 1}
!42 = !{!"llvm.loop.unroll.runtime.disable"}
!43 = distinct !{!43, !18, !41, !42}
