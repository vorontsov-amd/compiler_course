#include "llvm/IR/IRBuilder.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
using namespace llvm;

struct MyModPass : public PassInfoMixin<MyModPass> {
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {

    auto isLogerFunc = [](StringRef funcName) {
      return funcName == "instLoger";
    };

    for (auto &F : M) {
      if (isLogerFunc(F.getName())) {
        continue;
      }

      // Prepare builder for IR modification
      LLVMContext &Ctx = F.getContext();
      IRBuilder<> builder(Ctx);

      // Prepare instLogger function
      Type *retType = Type::getVoidTy(Ctx);
      ArrayRef<Type *> instLoggerParamTypes = {
          builder.getInt8Ty()->getPointerTo(),
          builder.getInt8Ty()->getPointerTo()};

      FunctionType *instLoggerFuncType =
          FunctionType::get(retType, instLoggerParamTypes, false);
      FunctionCallee instLoggerFunc =
          M.getOrInsertFunction("instLoger", instLoggerFuncType);

      for (auto &B : F) {
        for (auto &I : B) {
          // Skip PHINode
          if (isa<PHINode>(I)) {
            continue;
          }

          // Insert before Instruction
          builder.SetInsertPoint(&I);
          Value *instName = builder.CreateGlobalStringPtr(I.getOpcodeName());

          bool hasUserInst = false;
          for (auto &&U : I.users()) {
            if (auto &&UI = dyn_cast<Instruction>(U)) {
              hasUserInst = true;
              Value *userName =
                  builder.CreateGlobalStringPtr(UI->getOpcodeName());
              Value *args[] = {instName, userName};
              builder.CreateCall(instLoggerFunc, args);
            }
          }

          if (hasUserInst == false) {
            Value *args[] = {instName,
                             ConstantPointerNull::get(builder.getInt8Ty()->getPointerTo())};
            builder.CreateCall(instLoggerFunc, args);
          }
        }
      }
    }
    return PreservedAnalyses::none();
  }
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    PB.registerOptimizerEarlyEPCallback([&](ModulePassManager &MPM, auto) {
      MPM.addPass(MyModPass{});
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "MyPlugin", "0.0.1", callback};
};

/* When a plugin is loaded by the driver, it will call this entry point to
obtain information about this plugin and about how to register its passes.
*/
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}
