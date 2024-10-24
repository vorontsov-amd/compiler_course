#include "app/sdl.hpp"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include <memory>

using namespace llvm;

class IRGenerator final {
private:
  enum class llvmType {
    void_t,
    int32_t,
    int64_t,
    ptr_t,
  };

private:
  LLVMContext context;
  Module* module = new Module("main", context);
  IRBuilder<> builder = IRBuilder<>(context);

  StringMap<Type*> types;
  StringMap<std::pair<FunctionType*, FunctionCallee>> functions;
  Function* entry_function = nullptr;
private:

  // Type* getLLVMType (const llvmType type) {
  //   switch (type) {
  //   case llvmType::void_t:
  //     return builder.getVoidTy();
  //   case llvmType::int32_t:
  //     return builder.getInt32Ty();
  //   case llvmType::int64_t:
  //     return builder.getInt64Ty();
  //   case llvmType::ptr_t:
  //     return builder.getPtrTy();
  //   default:
  //     llvm_unreachable("Unsupported llvm type");
  //     return nullptr;
  //   }
  // }

  // ArrayRef<Type*> getLLVMTypes (const ArrayRef<llvmType> types) {
  //   ArrayRef<Type*> llvm_types;
  //   for (auto&& type : types) {
  //     llvm_types.
  //   }
  // }

public:
  void createTypes() {
    // class Image
    auto* image_type = StructType::create(context, ArrayRef<Type*>({
      /* int x */      builder.getInt32Ty(),
      /* int y */      builder.getInt32Ty(),
      /* int width */  builder.getInt32Ty(),
      /* int height */ builder.getInt32Ty(),
      /* int color */  builder.getInt32Ty(),
      /* int height */ builder.getInt32Ty(),
      /* int* data */  builder.getPtrTy()
    }), "struct.Image");

    types["Image"] = image_type;
  }

  std::pair<FunctionType*, FunctionCallee> declareFunction(Type* ret_type, ArrayRef<Type*> signature, StringRef name) {
    auto* function_type = FunctionType::get(ret_type, signature, /*isVarArg=*/ false);
    FunctionCallee function_callee = module->getOrInsertFunction(name, function_type);
    functions["_ZN5ImageC2EPKc"] = std::make_pair(function_type, function_callee);
    return functions["_ZN5ImageC2EPKc"];
  }

  Function* createFunction(Type* ret_type, ArrayRef<Type*> signature, StringRef name) {
    auto [function_type, _] = declareFunction(ret_type, signature, name);
    return Function::Create(function_type, Function::ExternalLinkage, name, module);
  }

  void callIntrinsic(ArrayRef<Value*> operands, Intrinsic::ID id) {
    SmallVector<Type*> signature;
    for (auto &&operand : operands) {
      signature.push_back(operand->getType());
    }

    auto* intrinsic_type = Intrinsic::getType(context, Intrinsic::lifetime_start, signature);
    FunctionCallee intrinsic_callee = module->getOrInsertFunction(Intrinsic::getName(id), intrinsic_type);
    builder.CreateCall(intrinsic_callee, operands); 
  }

  void defineImageCtor() {
    // Image::Image(char const*)
    auto* ctor = createFunction(builder.getVoidTy(), {builder.getPtrTy(), builder.getPtrTy()}, "_ZN5ImageC2EPKc");

    auto* entry = BasicBlock::Create(context, "", ctor);
    builder.SetInsertPoint(entry);

    auto* var_3 = builder.CreateAlloca(builder.getInt32Ty());   
    auto* var_4 = builder.CreateAlloca(builder.getInt32Ty());
    auto* var_5 = builder.CreateAlloca(builder.getInt32Ty());
    auto* var_6 = builder.CreateGEP(types["Image"], ctor->getOperand(0), {builder.getInt64(0), builder.getInt32(2)});
    auto* var_7 = builder.CreateGEP(types["Image"], ctor->getOperand(0), {builder.getInt64(0), builder.getInt32(3)});
    auto* var_8 = builder.CreateGEP(types["Image"], ctor->getOperand(0), {builder.getInt64(0), builder.getInt32(4)});
    auto* var_9 = builder.CreateGEP(types["Image"], ctor->getOperand(0), {builder.getInt64(0), builder.getInt32(5)});
    builder.CreateStore(ConstantPointerNull::get(builder.getPtrTy()), var_9);
    callIntrinsic({ctor->getOperand(0), builder.getInt8(0), builder.getInt64(20), builder.getInt1(false)}, Intrinsic::memset);

    builder.CreateRetVoid();
  }

  void defineImageClass() {
    defineImageCtor();
  }

  void defineMainFunction() {
    // int main() { ... }
    auto* main_func_type = FunctionType::get(builder.getInt32Ty(), /*isVarArg=*/ false);
    auto* main_func = Function::Create(main_func_type, Function::ExternalLinkage, "main", module);
    auto* entry     = BasicBlock::Create(context, "", main_func);
    builder.SetInsertPoint(entry);

    // simInit();
    auto* sim_init_func_type = FunctionType::get(builder. getVoidTy(), /*isVarArg=*/ false);
    FunctionCallee sim_init_callee = module->getOrInsertFunction("simInit", sim_init_func_type);
    builder.CreateCall(sim_init_callee);

    // auto image = Image("../images/ppm/output.ppm");
    auto* image_alloca = builder.CreateAlloca(types["Image"]);    
    auto* lifetime_start_intrinsic_type = Intrinsic::getType(context, Intrinsic::lifetime_start, {builder.getInt64Ty(), builder.getPtrTy()});
    FunctionCallee lifetime_start_callee = module->getOrInsertFunction(Intrinsic::getName(Intrinsic::lifetime_start), lifetime_start_intrinsic_type);
    builder.CreateCall(lifetime_start_callee, {builder.getInt64(32), image_alloca});

    auto* image_ctor_type = FunctionType::get(builder.getVoidTy(), {builder.getPtrTy(), builder.getPtrTy()}, /*isVarArg=*/ false);
    FunctionCallee image_ctor_callee = module->getOrInsertFunction("_ZN5ImageC2EPKc", image_ctor_type);
    auto* call_instr = builder.CreateCall(image_ctor_callee, {image_alloca, builder.CreateGlobalStringPtr("../images/ppm/output.ppm", "str")});

    // simExit();
    auto* sim_exit_func_type = FunctionType::get(builder. getVoidTy(), /*isVarArg=*/ false);
    FunctionCallee sim_exit_callee = module->getOrInsertFunction("simExit", sim_exit_func_type);
    builder.CreateCall(sim_exit_callee);
  
    // return 0;
    builder.CreateRet(builder.getInt32(0));
    entry_function = main_func;

    module->print(outs(), nullptr);
    outs() << "\n";
  }

  void run() {
    // LLVM IR Interpreter
    outs() << "[EE] Run\n";
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();
    errs() << "OK" << __LINE__ << "\n" ;

    ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
    
    errs() << "OK" << __LINE__ << "\n" ;
    ee->InstallLazyFunctionCreator([=](const std::string &fnName) -> void * {
      if (fnName == "simInit") {
        return reinterpret_cast<void *>(simInit);
      } else if (fnName == "simExit") {
        return reinterpret_cast<void *>(simExit);
      }
      return nullptr;
    });

    errs() << "OK" << __LINE__ << "\n" ;
    ee->finalizeObject();
    ArrayRef<GenericValue> noargs;
    GenericValue v = ee->runFunction(entry_function, noargs);
    outs() << "[EE] Result: " << v.IntVal << "\n";
  }
};

void func() { outs() << "Hello from \'external\' function:)\n"; }

int main() {

#if 0
  LLVMContext context;
  // ; ModuleID = 'main'
  // source_filename = "main"
  Module *module = new Module("main", context);
  IRBuilder<> builder(context);

  // declare void @main()
  FunctionType *funcType = FunctionType::get(builder.getInt32Ty(), false);
  Function *mainFunc =
      Function::Create(funcType, Function::ExternalLinkage, "main", module);

  // entrypoint:
  BasicBlock *entry = BasicBlock::Create(context, "", mainFunc);
  builder.SetInsertPoint(entry);

  // @0 = private unnamed_addr constant [14 x i8] c"hello world!\0A\00", align 1
  Value *helloWorld = builder.CreateGlobalStringPtr("hello world!");

  // declare i32 @puts(i8*)
  ArrayRef<Type *> argsRef(builder.getInt8Ty()->getPointerTo());
  FunctionType *putsType =
      FunctionType::get(builder.getInt32Ty(), argsRef, false);
  FunctionCallee putsFunc = module->getOrInsertFunction("puts", putsType);

  // %0 = call i32 @puts(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @0,
  // i32 0, i32 0))
  builder.CreateCall(putsFunc, helloWorld);
  // declare void @func(void)
  Function *ExtFunc = Function::Create(
      FunctionType::get(builder.getVoidTy(),
                        ArrayRef<Type *>(builder.getVoidTy()), false),
      Function::ExternalLinkage, "func", module);
  // call void @func()
  builder.CreateCall(ExtFunc);
  // ret i32 0
  builder.CreateRet(builder.getInt32(0));

  // Dump LLVM IR
  module->print(outs(), nullptr);

  // LLVM IR Interpreter
  outs() << "[EE] Run\n";
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();

  ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
  ee->InstallLazyFunctionCreator([=](const std::string &fnName) -> void * {
    if (fnName == "func") {
      return reinterpret_cast<void *>(func);
    }
    return nullptr;
  });
  ee->finalizeObject();
  ArrayRef<GenericValue> noargs;
  GenericValue v = ee->runFunction(mainFunc, noargs);
  outs() << "[EE] Result: " << v.IntVal << "\n";
#endif

  IRGenerator gen;
  gen.createTypes();
  gen.defineImageClass();
  gen.defineMainFunction();
  gen.run();

  return 0;
}