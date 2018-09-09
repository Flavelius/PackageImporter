#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName GAMEPLAY_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif

AUTOGENERATE_NAME(ActionCompleted)
AUTOGENERATE_NAME(GetActorRelations)
AUTOGENERATE_NAME(PostBeginPlay)
AUTOGENERATE_NAME(Reset)


//------------------------------------------------------------------------------
//  AScriptedSequence
//------------------------------------------------------------------------------

class DLL_IMPORT AScriptedSequence {
  public:
    virtual ~AScriptedSequence(void);
    virtual unsigned int GetCPPSize(void);
    virtual void GetActorRelations(class TArray<struct FActorRelation> &);
    AScriptedSequence(class AScriptedSequence const &);
    AScriptedSequence(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AScriptedSequence & operator=(class AScriptedSequence const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};

//------------------------------------------------------------------------------
//  UScriptedAction
//------------------------------------------------------------------------------

class DLL_IMPORT UScriptedAction {
  public:
    virtual ~UScriptedAction(void);
    virtual unsigned int GetCPPSize(void);
    UScriptedAction(class UScriptedAction const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UScriptedAction & operator=(class UScriptedAction const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventActionCompleted(void);
    void eventGetActorRelations(class AActor *,class TArray<struct FActorRelation> &);
    void eventPostBeginPlay(class AScriptedSequence *);
    void eventReset(void);
  protected:
    UScriptedAction(void);
  private:
    static class UClass PrivateStaticClass;
};


AUTOGENERATE_CLASS(AScriptedSequence)
AUTOGENERATE_CLASS(UScriptedAction)

AUTOGENERATE_PACKAGE(GamePlay)


//_DllMain@12 b7a104b
//Gameplay_InitPackage b7a10cd

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

