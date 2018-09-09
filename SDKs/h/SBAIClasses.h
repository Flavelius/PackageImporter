#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName SBAI_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif

AUTOGENERATE_NAME(AnnotationDone)
AUTOGENERATE_NAME(AutoFix)
AUTOGENERATE_NAME(FilterTarget)
AUTOGENERATE_NAME(FollowFunction)
AUTOGENERATE_NAME(GetActorRelations)
AUTOGENERATE_NAME(OnAllyLost)
AUTOGENERATE_NAME(OnAnimationDone)
AUTOGENERATE_NAME(OnArrived)
AUTOGENERATE_NAME(OnAttach)
AUTOGENERATE_NAME(OnBegin)
AUTOGENERATE_NAME(OnBeginScript)
AUTOGENERATE_NAME(OnBuff)
AUTOGENERATE_NAME(OnCheckAlly)
AUTOGENERATE_NAME(OnCheckChaseRange)
AUTOGENERATE_NAME(OnCheckEnemy)
AUTOGENERATE_NAME(OnCheckFriendly)
AUTOGENERATE_NAME(OnCheckHabitat)
AUTOGENERATE_NAME(OnCheckInvisibility)
AUTOGENERATE_NAME(OnContinue)
AUTOGENERATE_NAME(OnDamage)
AUTOGENERATE_NAME(OnDeath)
AUTOGENERATE_NAME(OnDebuff)
AUTOGENERATE_NAME(OnDespawn)
AUTOGENERATE_NAME(OnDetach)
AUTOGENERATE_NAME(OnDetectAlly)
AUTOGENERATE_NAME(OnDetectEnemy)
AUTOGENERATE_NAME(OnEnd)
AUTOGENERATE_NAME(OnEndConversation)
AUTOGENERATE_NAME(OnEndScript)
AUTOGENERATE_NAME(OnEnemyLost)
AUTOGENERATE_NAME(OnHomeLocation)
AUTOGENERATE_NAME(OnKill)
AUTOGENERATE_NAME(OnPause)
AUTOGENERATE_NAME(OnPhysicsChange)
AUTOGENERATE_NAME(OnSkillFinished)
AUTOGENERATE_NAME(OnSpawn)
AUTOGENERATE_NAME(OnStateBegin)
AUTOGENERATE_NAME(OnStateChange)
AUTOGENERATE_NAME(OnStateComplete)
AUTOGENERATE_NAME(OnStateSignal)
AUTOGENERATE_NAME(OnTick)
AUTOGENERATE_NAME(OnTimerEnded)
AUTOGENERATE_NAME(OnTrigger)
AUTOGENERATE_NAME(OnUnreachable)
AUTOGENERATE_NAME(OnWeaponSwapped)
AUTOGENERATE_NAME(PointReached)
AUTOGENERATE_NAME(SetFaction)
AUTOGENERATE_NAME(StartConversation)
AUTOGENERATE_NAME(StateSignal)
AUTOGENERATE_NAME(StopConversation)
AUTOGENERATE_NAME(sv_InitAI)
AUTOGENERATE_NAME(sv_OnEndAggro)
AUTOGENERATE_NAME(sv_OnScriptFrame)
AUTOGENERATE_NAME(sv_OnStartAggro)

//------------------------------------------------------------------------------
//  AIPoint
//------------------------------------------------------------------------------

//  AIPoint.PointReached 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAIPoint_eventPointReached_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


//  AIPoint.GetWalking 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct AAIPoint_execGetWalking_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AIPoint.GetControlDestination 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct AAIPoint_execGetControlDestination_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class AAIPoint* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// AAIPoint 213 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAIPoint : public AAnnotationActor {
  public:
    class AAnnotation_Script* AnnotationScript;  // 45C 2000001 CPF_Edit CPF_EditorData
    BITFIELD TriggerScript : 1;  // 460 2000001 CPF_Edit CPF_EditorData
    BITFIELD WaitForScript : 1;  // 460 2000001 CPF_Edit CPF_EditorData
    virtual ~AAIPoint(void);
    virtual unsigned int GetCPPSize(void);
    virtual void CleanupSubObjects(int);
    virtual void DrawDebugInfo(class FRenderInterface *);
    virtual void BeginControl(class AGame_Pawn *);
    virtual bool ControlTick(float,class AGame_Pawn *);
    virtual bool ComputePath(class AGame_Pawn *,class ASBPoint *,class USBPath * &);
    virtual void EndControl(class AGame_Pawn *);
    virtual class AAIPoint * GetControlDestination(class AGame_Pawn *);
    virtual bool GetWalking(void);
    AAIPoint(class AAIPoint const &);
    AAIPoint(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AAIPoint & operator=(class AAIPoint const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventPointReached(class AGame_Pawn *);
    void execGetControlDestination(struct FFrame &,void * const);
    void execGetWalking(struct FFrame &,void * const);
  protected:
    bool ScriptsDone(class AGame_Pawn *);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(AAIPoint,0,execGetControlDestination)
AUTOGENERATE_FUNCTION(AAIPoint,0,execGetWalking)


//------------------------------------------------------------------------------
//  PatrolPoint
//------------------------------------------------------------------------------

// APatrolPoint 4212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT APatrolPoint : public AAIPoint {
  public:
    BITFIELD PausePatrolScript : 1;  // 464 2000001 CPF_Edit CPF_EditorData
    BITFIELD bWalking : 1;  // 464 2000001 CPF_Edit CPF_EditorData
    FLOAT MinimalPathHeight;  // 468 2000001 CPF_Edit CPF_EditorData
    BITFIELD ShowPrecomputedPaths : 1;  // 46C 1 CPF_Edit
    TArray<class USBPath*> PatrolPaths;  // 470 400000 CPF_NeedCtorLink
    virtual ~APatrolPoint(void);
    virtual unsigned int GetCPPSize(void);
    virtual void DrawDebugInfo(class FRenderInterface *);
    virtual bool ComputePath(class AGame_Pawn *,class ASBPoint *,class USBPath * &);
    virtual void PreComputePaths(bool);
    virtual bool GetWalking(void);
    APatrolPoint(class APatrolPoint const &);
    APatrolPoint(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class APatrolPoint & operator=(class APatrolPoint const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AI_MetaController
//------------------------------------------------------------------------------

enum ControllerMessages {
  CM_OnSpawn = 0,
  CM_OnBegin = 1,
  CM_OnDespawn = 2,
  CM_OnEnd = 3,
  CM_OnBeginScript = 4,
  CM_OnEndScript = 5,
  CM_OnDamage = 6,
  CM_OnBuff = 7,
  CM_OnDebuff = 8,
  CM_OnStateBegin = 9,
  CM_OnStateChange = 10,
  CM_OnStateEnded = 11,
  CM_OnStateSignal = 12,
  CM_OnDeath = 13,
  CM_OnTick = 14,
  CM_OnInteraction = 15,
  CM_OnTimerEnded = 16,
  CM_OnTrigger = 17,
  CM_OnDetectEnemy = 18,
  CM_OnEnemyLost = 19,
  CM_OnDetectAlly = 20,
  CM_OnAllyLost = 21,
  CM_OnHomeLocation = 22,
  CM_OnCheckChaseRange = 23,
  CM_OnCheckHabitat = 24,
  CM_OnEndConversation = 25,
  CM_CheckEnemy = 26,
  CM_CheckFriendly = 27,
  CM_CheckAlly = 28,
  CM_OnAggro = 29,
  CM_OnKill = 30,
  CM_OnArrived = 31,
  CM_OnUnreachable = 32,
  CM_OnPause = 33,
  CM_OnContinue = 34,
  CM_OnWeaponSwapped = 35,
  CM_OnSkillFinished = 36,
  CM_OnAnimationDone = 37,
  CM_OnPhysicsChange = 38,
  CM_OnCheckInvisibility = 39
};

// FControllerMessageFilter 0 ( )
struct DLL_IMPORT FControllerMessageFilter {
  public:
    BITFIELD OnSpawn : 1;  // 0 0
    BITFIELD OnBegin : 1;  // 0 0
    BITFIELD OnDespawn : 1;  // 0 0
    BITFIELD OnEnd : 1;  // 0 0
    BITFIELD OnBeginScript : 1;  // 0 0
    BITFIELD OnEndScript : 1;  // 0 0
    BITFIELD OnDamage : 1;  // 0 0
    BITFIELD OnBuff : 1;  // 0 0
    BITFIELD OnDebuff : 1;  // 0 0
    BITFIELD OnStateBegin : 1;  // 0 0
    BITFIELD OnStateChange : 1;  // 0 0
    BITFIELD OnStateComplete : 1;  // 0 0
    BITFIELD OnStateSignal : 1;  // 0 0
    BITFIELD OnDeath : 1;  // 0 0
    BITFIELD OnTick : 1;  // 0 0
    BITFIELD OnInteraction : 1;  // 0 0
    BITFIELD OnTimerEnded : 1;  // 0 0
    BITFIELD OnTrigger : 1;  // 0 0
    BITFIELD OnDetectEnemy : 1;  // 0 0
    BITFIELD OnEnemyLost : 1;  // 0 0
    BITFIELD OnDetectAlly : 1;  // 0 0
    BITFIELD OnAllyLost : 1;  // 0 0
    BITFIELD OnHomeLocation : 1;  // 0 0
    BITFIELD OnCheckChaseRange : 1;  // 0 0
    BITFIELD OnCheckHabitat : 1;  // 0 0
    BITFIELD OnEndConversation : 1;  // 0 0
    BITFIELD OnCheckEnemy : 1;  // 0 0
    BITFIELD OnCheckFriendly : 1;  // 0 0
    BITFIELD OnCheckAlly : 1;  // 0 0
    BITFIELD OnAggro : 1;  // 0 0
    BITFIELD OnKill : 1;  // 0 0
    BITFIELD OnArrived : 1;  // 0 0
    BITFIELD OnUnreachable : 1;  // 4 0
    BITFIELD OnPause : 1;  // 4 0
    BITFIELD OnContinue : 1;  // 4 0
    BITFIELD OnWeaponSwapped : 1;  // 4 0
    BITFIELD OnSkillFinished : 1;  // 4 0
    BITFIELD OnAnimationDone : 1;  // 4 0
    BITFIELD OnPhysicsChange : 1;  // 4 0
    BITFIELD OnCheckInvisibility : 1;  // 4 0
    struct FControllerMessageFilter & operator=(struct FControllerMessageFilter const &);
};

//  AI_MetaController.OnCheckInvisibility 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnCheckInvisibility_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AGame_Pawn* aPawn;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnPhysicsChange 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnPhysicsChange_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  BYTE aNewPhysics;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnAnimationDone 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnAnimationDone_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  FName aAnimation;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnSkillFinished 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnSkillFinished_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class UFSkill_Type* aSkill;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnWeaponSwapped 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnWeaponSwapped_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  BYTE aMode;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnContinue 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnContinue_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnPause 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnPause_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnUnreachable 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnUnreachable_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class ASBPoint* aControlPoint;  // 4 80 CPF_Parm
  class FVector aDestination;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnArrived 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnArrived_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class ASBPoint* aControlPoint;  // 4 80 CPF_Parm
  class ASBPoint* aDestinationPoint;  // 8 80 CPF_Parm
  class FVector aDestination;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnKill 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnKill_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AActor* aVictim;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnCheckAlly 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnCheckAlly_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AGame_Pawn* potentialAlly;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnCheckFriendly 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnCheckFriendly_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AGame_Pawn* potentialFriend;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnCheckEnemy 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnCheckEnemy_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AGame_Pawn* potentialEnemy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnTick 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnTick_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  FLOAT aDeltaTime;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnDeath 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnDeath_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AActor* aDeceasedActor;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnTimerEnded 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnTimerEnded_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AActor* aInstigator;  // 4 80 CPF_Parm
  FName aTag;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnEndConversation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnEndConversation_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AActor* partner;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnCheckHabitat 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnCheckHabitat_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class FVector aLocation;  // 4 80 CPF_Parm
  class ANPC_Habitat* aHabitat;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnCheckChaseRange 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnCheckChaseRange_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class FVector aLocation;  // 4 80 CPF_Parm
  FLOAT aRange;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnHomeLocation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnHomeLocation_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class FVector aLocation;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnStateSignal 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnStateSignal_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class UAIState* aState;  // 4 80 CPF_Parm
  BYTE aSignal;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnStateChange 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnStateChange_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class UAIState* aState;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnStateBegin 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnStateBegin_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class UAIState* aState;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnStateComplete 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnStateComplete_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class UAIState* aState;  // 4 80 CPF_Parm
  BYTE aResult;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnAllyLost 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnAllyLost_Parms {
  class AGame_AIController* anObserver;  // 0 80 CPF_Parm
  class AGame_Pawn* anAlly;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnDetectAlly 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnDetectAlly_Parms {
  class AGame_AIController* anObserver;  // 0 80 CPF_Parm
  class AGame_Pawn* anAlly;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnEnemyLost 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnEnemyLost_Parms {
  class AGame_AIController* anObserver;  // 0 80 CPF_Parm
  class AGame_Pawn* anEnemy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnDetectEnemy 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnDetectEnemy_Parms {
  class AGame_AIController* anObserver;  // 0 80 CPF_Parm
  class AGame_Pawn* anEnemy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnTrigger 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnTrigger_Parms {
  class AGame_AIController* receiver;  // 0 80 CPF_Parm
  class AActor* anActor;  // 4 80 CPF_Parm
  class APawn* Instigator;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnDebuff 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnDebuff_Parms {
  class AGame_AIController* Victim;  // 0 80 CPF_Parm
  class AGame_Pawn* Instigator;  // 4 80 CPF_Parm
  class UFSkill_EffectClass* effect;  // 8 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  FLOAT aValue;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnBuff 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnBuff_Parms {
  class AGame_AIController* Victim;  // 0 80 CPF_Parm
  class AGame_Pawn* Instigator;  // 4 80 CPF_Parm
  class UFSkill_EffectClass* effect;  // 8 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  FLOAT aValue;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnDamage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnDamage_Parms {
  class AGame_AIController* Victim;  // 0 80 CPF_Parm
  class AActor* cause;  // 4 80 CPF_Parm
  FLOAT Damage;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.OnEndScript 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnEndScript_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AAI_Script* aScriptInstance;  // 4 80 CPF_Parm
};


//  AI_MetaController.OnBeginScript 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnBeginScript_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AAI_Script* aScriptInstance;  // 4 80 CPF_Parm
};


//  AI_MetaController.OnEnd 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnEnd_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
};


//  AI_MetaController.OnDespawn 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnDespawn_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
};


//  AI_MetaController.OnBegin 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnBegin_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
};


//  AI_MetaController.OnSpawn 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_MetaController_eventOnSpawn_Parms {
  class AGame_AIController* aSpawn;  // 0 80 CPF_Parm
  class UNPC_Type* aType;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  class FVector aLocation;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_MetaController.GetFaction 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_MetaController_execGetFaction_Parms {
  class UNPC_Taxonomy* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


// AAI_MetaController 4212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT AAI_MetaController : public ANPC_AI {
  public:
    INT Priority;  // 428 1 CPF_Edit
    BITFIELD mRequiresClone : 1;  // 42C 1 CPF_Edit
    class AAI_MetaController* Parent;  // 430 2000 CPF_Transient
    struct FControllerMessageFilter mControllerMessageFilter;  // 434 0
    INT mControllerMessageMask1;  // 43C 2000 CPF_Transient
    INT mControllerMessageMask2;  // 440 2000 CPF_Transient
    virtual ~AAI_MetaController(void);
    virtual void PostLoad(void);
    virtual unsigned int GetCPPSize(void);
    virtual void CleanupSubObjects(int);
    virtual void PostBeginPlay(void);
    virtual int sv_OnSpawn(class AGame_Controller *);
    virtual bool IsGroupAlive(void);
    virtual int HandleMessage(class AGame_AIController *,unsigned char,class AActor *,class FName,class UObject *,float,class FVector);
    AAI_MetaController(class AAI_MetaController const &);
    AAI_MetaController(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AAI_MetaController & operator=(class AAI_MetaController const &);
    void EnableMessage(enum ControllerMessages);
    void EnableMessageFilter(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long eventOnAllyLost(class AGame_AIController *,class AGame_Pawn *);
    unsigned long eventOnAnimationDone(class AGame_AIController *,class FName);
    unsigned long eventOnArrived(class AGame_AIController *,class ASBPoint *,class ASBPoint *,class FVector);
    void eventOnBegin(class AGame_AIController *);
    void eventOnBeginScript(class AGame_AIController *,class AAI_Script *);
    unsigned long eventOnBuff(class AGame_AIController *,class AGame_Pawn *,class UFSkill_EffectClass *,float);
    unsigned long eventOnCheckAlly(class AGame_AIController *,class AGame_Pawn *);
    unsigned long eventOnCheckChaseRange(class AGame_AIController *,class FVector,float);
    unsigned long eventOnCheckEnemy(class AGame_AIController *,class AGame_Pawn *);
    unsigned long eventOnCheckFriendly(class AGame_AIController *,class AGame_Pawn *);
    unsigned long eventOnCheckHabitat(class AGame_AIController *,class FVector,class ANPC_Habitat *);
    unsigned long eventOnCheckInvisibility(class AGame_AIController *,class AGame_Pawn *);
    unsigned long eventOnContinue(class AGame_AIController *);
    unsigned long eventOnDamage(class AGame_AIController *,class AActor *,float);
    unsigned long eventOnDeath(class AGame_AIController *,class AActor *);
    unsigned long eventOnDebuff(class AGame_AIController *,class AGame_Pawn *,class UFSkill_EffectClass *,float);
    void eventOnDespawn(class AGame_AIController *);
    unsigned long eventOnDetectAlly(class AGame_AIController *,class AGame_Pawn *);
    unsigned long eventOnDetectEnemy(class AGame_AIController *,class AGame_Pawn *);
    void eventOnEnd(class AGame_AIController *);
    unsigned long eventOnEndConversation(class AGame_AIController *,class AActor *);
    void eventOnEndScript(class AGame_AIController *,class AAI_Script *);
    unsigned long eventOnEnemyLost(class AGame_AIController *,class AGame_Pawn *);
    unsigned long eventOnHomeLocation(class AGame_AIController *,class FVector);
    unsigned long eventOnKill(class AGame_AIController *,class AActor *);
    unsigned long eventOnPause(class AGame_AIController *);
    unsigned long eventOnPhysicsChange(class AGame_AIController *,unsigned char);
    unsigned long eventOnSkillFinished(class AGame_AIController *,class UFSkill_Type *);
    unsigned long eventOnSpawn(class AGame_AIController *,class UNPC_Type *,class FVector);
    unsigned long eventOnStateBegin(class AGame_AIController *,class UAIState *);
    unsigned long eventOnStateChange(class AGame_AIController *,class UAIState *);
    unsigned long eventOnStateComplete(class AGame_AIController *,class UAIState *,unsigned char);
    unsigned long eventOnStateSignal(class AGame_AIController *,class UAIState *,unsigned char);
    unsigned long eventOnTick(class AGame_AIController *,float);
    unsigned long eventOnTimerEnded(class AGame_AIController *,class AActor *,class FName);
    unsigned long eventOnTrigger(class AGame_AIController *,class AActor *,class APawn *);
    unsigned long eventOnUnreachable(class AGame_AIController *,class ASBPoint *,class FVector);
    unsigned long eventOnWeaponSwapped(class AGame_AIController *,unsigned char);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GroupMind
//------------------------------------------------------------------------------

// FGroupMember 0 ( )
struct DLL_IMPORT FGroupMember {
  public:
    class AGame_AIController* Controller;  // 0 0
    class AGame_NPCPawn* Pawn;  // 4 0
    BITFIELD Alive : 1;  // 8 0
    INT FameLevel;  // C 0
    INT PePRank;  // 10 0
    class UNPC_Type* Type;  // 14 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    class UClass* State;  // 18 0
    struct FGroupMember & operator=(struct FGroupMember const &);
};

//  GroupMind.NoneInState 80401 0 ( FUNC_Final FUNC_Native FUNC_Protected )
struct AGroupMind_execNoneInState_Parms {
  class UClass* aState;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GroupMind.AllInState 80401 0 ( FUNC_Final FUNC_Native FUNC_Protected )
struct AGroupMind_execAllInState_Parms {
  class UClass* aState;  // 0 80 CPF_Parm
  BITFIELD aAllowIdle : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GroupMind.CommandMember 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct AGroupMind_execCommandMember_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BYTE aSignal;  // 4 80 CPF_Parm
};


//  GroupMind.CommandTeam 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct AGroupMind_execCommandTeam_Parms {
  BYTE aSignal;  // 0 80 CPF_Parm
};


//  GroupMind.GiveKillCredit 20002 0 ( FUNC_Defined FUNC_Public )
struct AGroupMind_execGiveKillCredit_Parms {
  class FVector aCenterLocation;  // 0 80 CPF_Parm
};


//  GroupMind.OnDetectEnemy 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGroupMind_eventOnDetectEnemy_Parms {
  class AGame_AIController* anObserver;  // 0 80 CPF_Parm
  class AGame_Pawn* anEnemy;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GroupMind.OnDespawn 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGroupMind_eventOnDespawn_Parms {
  class AGame_AIController* GroupMember;  // 0 80 CPF_Parm
};


//  GroupMind.OnDeath 20002 0 ( FUNC_Defined FUNC_Public )
struct AGroupMind_execOnDeath_Parms {
  class AGame_AIController* GroupMember;  // 0 80 CPF_Parm
  class AActor* deceasedActor;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GroupMind.GetFaction 20002 0 ( FUNC_Defined FUNC_Public )
struct AGroupMind_execGetFaction_Parms {
  class UNPC_Taxonomy* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  GroupMind.SetFaction 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGroupMind_eventSetFaction_Parms {
  class UNPC_Taxonomy* aFaction;  // 0 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  GroupMind.OnCreateComponents 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGroupMind_eventOnCreateComponents_Parms {
};


//  GroupMind.OnBegin 20002 0 ( FUNC_Defined FUNC_Public )
struct AGroupMind_execOnBegin_Parms {
  class AGame_AIController* aSpawn;  // 0 80 CPF_Parm
};


//  GroupMind.OnSpawn 20002 0 ( FUNC_Defined FUNC_Public )
struct AGroupMind_execOnSpawn_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class UNPC_Type* aNPCType;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  class FVector aLocation;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// AGroupMind 4213 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT AGroupMind : public AAI_MetaController {
  public:
    class UNPC_Taxonomy* mFaction;  // 444 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    FLOAT LootTimeout;  // 448 0
    class UMeta_CombatStats* CombatStats;  // 44C 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    FLOAT VisualRange;  // 450 1 CPF_Edit
    FLOAT LineOfSightRange;  // 454 1 CPF_Edit
    FLOAT ThreatRange;  // 458 1 CPF_Edit
    FLOAT ChaseRange;  // 45C 1 CPF_Edit
    class ANPC_Habitat* Habitat;  // 460 1 CPF_Edit
    FLOAT SocialAggroFactor;  // 464 1 CPF_Edit
    TArray<struct FGroupMember> GroupMembers;  // 468 400000 CPF_NeedCtorLink
    class UGame_Team* mTeam;  // 474 0
    virtual ~AGroupMind(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual void DrawDebugInfo(class FRenderInterface *);
    virtual int sv_CanAggro(class AGame_Pawn *);
    virtual bool IsGroupAlive(void);
    virtual int HandleMessage(class AGame_AIController *,unsigned char,class AActor *,class FName,class UObject *,float,class FVector);
    virtual void sv_OnInit(void);
    virtual void GetTargets(class TArray<class AGame_Pawn *> &);
    virtual void OnStateChange(class AGame_AIController *,class UAIState *);
    virtual void OnAggro(class AGame_AIController *,class AGame_Pawn *,class UFSkill_EffectClass *,float);
    virtual bool IsLeader(class AGame_AIController *);
    AGroupMind(class AGroupMind const &);
    AGroupMind(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AGroupMind & operator=(class AGroupMind const &);
    static void CDECL InternalConstructor(void *);
    bool IsUnreachable(class AActor *,float);
    static class UClass * CDECL StaticClass(void);
    void eventSetFaction(class UNPC_Taxonomy *);
    void execAllInState(struct FFrame &,void * const);
    void execCommandMember(struct FFrame &,void * const);
    void execCommandTeam(struct FFrame &,void * const);
    void execNoneInState(struct FFrame &,void * const);
  protected:
    static class FName AlertState;
    int AllInState(class UClass *,int);
    void CommandMember(class AGame_AIController *,enum EStateSignal);
    void CommandTeam(enum EStateSignal);
    static class FName FightState;
    static class FName IdleState;
    int NoneInState(class UClass *);
    static class FName PatrolState;
    static class FName ReturnState;
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(AGroupMind,0,execAllInState)
AUTOGENERATE_FUNCTION(AGroupMind,0,execCommandMember)
AUTOGENERATE_FUNCTION(AGroupMind,0,execCommandTeam)
AUTOGENERATE_FUNCTION(AGroupMind,0,execNoneInState)


//------------------------------------------------------------------------------
//  SquadMind
//------------------------------------------------------------------------------

//  SquadMind.IsLeader 20002 0 ( FUNC_Defined FUNC_Public )
struct ASquadMind_execIsLeader_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SquadMind.PromoteLeader 20400 0 ( FUNC_Native FUNC_Public )
struct ASquadMind_execPromoteLeader_Parms {
  class AGame_AIController* aNewLeader;  // 0 80 CPF_Parm
};


//  SquadMind.PickNewLeader 20400 0 ( FUNC_Native FUNC_Public )
struct ASquadMind_execPickNewLeader_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SquadMind.OnDespawn 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ASquadMind_eventOnDespawn_Parms {
  class AGame_AIController* GroupMember;  // 0 80 CPF_Parm
};


//  SquadMind.OnDeath 20002 0 ( FUNC_Defined FUNC_Public )
struct ASquadMind_execOnDeath_Parms {
  class AGame_AIController* GroupMember;  // 0 80 CPF_Parm
  class AActor* deceasedActor;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SquadMind.OnBegin 20002 0 ( FUNC_Defined FUNC_Public )
struct ASquadMind_execOnBegin_Parms {
  class AGame_AIController* aSpawn;  // 0 80 CPF_Parm
};


// ASquadMind 4212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT ASquadMind : public AGroupMind {
  public:
    class AGame_AIController* mLeader;  // 478 0
    class UAIStateMachine* mLeaderOldMachine;  // 47C 2000000 CPF_EditorData
    class FVector mLeaderOldHome;  // 480 2000000 CPF_EditorData
    class UClass* LeaderMachineClass;  // 48C 1 CPF_Edit
    virtual ~ASquadMind(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual int HandleMessage(class AGame_AIController *,unsigned char,class AActor *,class FName,class UObject *,float,class FVector);
    virtual void GetTargets(class TArray<class AGame_Pawn *> &);
    virtual void OnStateChange(class AGame_AIController *,class UAIState *);
    virtual void OnAggro(class AGame_AIController *,class AGame_Pawn *,class UFSkill_EffectClass *,float);
    virtual bool IsLeader(class AGame_AIController *);
    ASquadMind(class ASquadMind const &);
    ASquadMind(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASquadMind & operator=(class ASquadMind const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execPickNewLeader(struct FFrame &,void * const);
    void execPromoteLeader(struct FFrame &,void * const);
  protected:
    bool PickNewLeader(void);
    void PromoteLeader(class AGame_AIController *);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(ASquadMind,0,execPickNewLeader)
AUTOGENERATE_FUNCTION(ASquadMind,0,execPromoteLeader)


//------------------------------------------------------------------------------
//  Meta_CombatStats
//------------------------------------------------------------------------------

//  Meta_CombatStats.GetOuterDead 80400 0 ( FUNC_Native FUNC_Protected )
struct UMeta_CombatStats_execGetOuterDead_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Meta_CombatStats.GetOuterName 80802 0 ( FUNC_Defined FUNC_Event FUNC_Protected )
struct UMeta_CombatStats_eventGetOuterName_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Meta_CombatStats.sv_QuestCredit 20002 0 ( FUNC_Defined FUNC_Public )
struct UMeta_CombatStats_execsv_QuestCredit_Parms {
  TArray<class AGame_Pawn*> Enemies;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  Meta_CombatStats.sv_OnEndAggro 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMeta_CombatStats_eventsv_OnEndAggro_Parms {
};


//  Meta_CombatStats.sv_OnStartAggro 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UMeta_CombatStats_eventsv_OnStartAggro_Parms {
};


// UMeta_CombatStats 200016 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UMeta_CombatStats : public UGame_CombatStats {
  public:
    virtual ~UMeta_CombatStats(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual bool GetOuterDead(void);
    UMeta_CombatStats(class UMeta_CombatStats const &);
    UMeta_CombatStats(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UMeta_CombatStats & operator=(class UMeta_CombatStats const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventsv_OnEndAggro(void);
    void eventsv_OnStartAggro(void);
    void execGetOuterDead(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UMeta_CombatStats,0,execGetOuterDead)


//------------------------------------------------------------------------------
//  HiveMind
//------------------------------------------------------------------------------

#define UCONST_HiveMind_RedetectTime 0.5
//  HiveMind.EnableDetection 80002 0 ( FUNC_Defined FUNC_Protected )
struct AHiveMind_execEnableDetection_Parms {
};


//  HiveMind.DisableDetection 80002 0 ( FUNC_Defined FUNC_Protected )
struct AHiveMind_execDisableDetection_Parms {
};


//  HiveMind.OnBegin 20002 0 ( FUNC_Defined FUNC_Public )
struct AHiveMind_execOnBegin_Parms {
  class AGame_AIController* aSpawn;  // 0 80 CPF_Parm
};


// AHiveMind 4212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT AHiveMind : public AGroupMind {
  public:
    TArray<class AGame_Pawn*> Targets;  // 478 400000 CPF_NeedCtorLink
    FLOAT RedetectTimer;  // 484 2000000 CPF_EditorData
    virtual ~AHiveMind(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual void GetTargets(class TArray<class AGame_Pawn *> &);
    virtual void OnStateChange(class AGame_AIController *,class UAIState *);
    AHiveMind(class AHiveMind const &);
    AHiveMind(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AHiveMind & operator=(class AHiveMind const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    bool Detect(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIScriptSubObject
//------------------------------------------------------------------------------

// UAIScriptSubObject 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UAIScriptSubObject : public UObject {
  public:
    INT ExCleanIndex;  // 28 2002000 CPF_Transient CPF_EditorData
    virtual ~UAIScriptSubObject(void);
    virtual void ExtendCleanMe(void);
    virtual int IsExtendedCleaned(void);
    virtual unsigned int GetCPPSize(void);
    UAIScriptSubObject(class UAIScriptSubObject const &);
    UAIScriptSubObject(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIScriptSubObject & operator=(class UAIScriptSubObject const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Annotation_Script
//------------------------------------------------------------------------------

//  Annotation_Script.AnnotationDone 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAnnotation_Script_eventAnnotationDone_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Annotation_Script.OnDetach 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAnnotation_Script_eventOnDetach_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AAIPoint* aPoint;  // 4 80 CPF_Parm
};


//  Annotation_Script.OnAttach 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAnnotation_Script_eventOnAttach_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AAIPoint* aPoint;  // 4 80 CPF_Parm
};


// AAnnotation_Script 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAnnotation_Script : public AAI_MetaController {
  public:
    virtual ~AAnnotation_Script(void);
    virtual unsigned int GetCPPSize(void);
    AAnnotation_Script(class AAnnotation_Script const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AAnnotation_Script & operator=(class AAnnotation_Script const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long eventAnnotationDone(class AGame_AIController *);
    void eventOnAttach(class AGame_AIController *,class AAIPoint *);
    void eventOnDetach(class AGame_AIController *,class AAIPoint *);
  protected:
    AAnnotation_Script(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AI_Script
//------------------------------------------------------------------------------

// FAppliedEffect 0 ( )
struct DLL_IMPORT FAppliedEffect {
  public:
    class AGame_Pawn* Pawn;  // 0 0
    INT EffectHandle;  // 4 0
    struct FAppliedEffect & operator=(struct FAppliedEffect const &);
};

//  AI_Script.GetDayNightTime 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetDayNightTime_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.GetPersistentVariable 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetPersistentVariable_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UContent_Type* aContext;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  INT aValueId;  // 8 80 CPF_Parm
  INT ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.SetPersistentVariable 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetPersistentVariable_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UContent_Type* aContext;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  INT aValueId;  // 8 80 CPF_Parm
  INT aValue;  // C 80 CPF_Parm
};


//  AI_Script.RandomInt 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRandomInt_Parms {
  INT aMinValue;  // 0 80 CPF_Parm
  INT aMaxValue;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.RandomFloat 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRandomFloat_Parms {
  FLOAT aMinValue;  // 0 80 CPF_Parm
  FLOAT aMaxValue;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.RandomBool 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRandomBool_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.Despawn 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execDespawn_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
};


//  AI_Script.SetSkilldeck 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetSkilldeck_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UNPC_SkillDeck* aSkilldeck;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  class UNPC_SkillDeck* ReturnValue;  // 8 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  AI_Script.SetFreeze 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetFreeze_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  BITFIELD aOnOff : 1;  // 4 80 CPF_Parm
  BITFIELD Movement : 1;  // 8 80 CPF_Parm
  BITFIELD Rotation : 1;  // C 80 CPF_Parm
  BITFIELD Animation : 1;  // 10 80 CPF_Parm
  BITFIELD Stats : 1;  // 14 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.RemoveEachDuff 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRemoveEachDuff_Parms {
  class UObject* aParameter;  // 0 80 CPF_Parm
  class UFSkill_Event_Duff* aDuffEvent;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.RemoveAllDuffs 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRemoveAllDuffs_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


//  AI_Script.RemoveSkillDuff 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRemoveSkillDuff_Parms {
  class UObject* aParameter;  // 0 80 CPF_Parm
  class UFSkill_Event_Duff* aDuffEvent;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.RemoveSkillDuffs 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRemoveSkillDuffs_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UFSkill_Type* aSkill;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  AI_Script.AllPlayerClientTrigger 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execAllPlayerClientTrigger_Parms {
  class AGame_Pawn* aInstigator;  // 0 80 CPF_Parm
  class FString aEventTag;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  AI_Script.ClientSideTrigger 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execClientSideTrigger_Parms {
  class AGame_Pawn* aInstigator;  // 0 80 CPF_Parm
  class FString aEventTag;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class AGame_PlayerPawn* aClient;  // C 80 CPF_Parm
};


//  AI_Script.RemoveAudioVisualEffects 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRemoveAudioVisualEffects_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


//  AI_Script.RemoveAudioVisualEffect 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRemoveAudioVisualEffect_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  INT aServerSideEffectHandle;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.ApplyAudioVisualEffect 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execApplyAudioVisualEffect_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UFSkill_EffectClass_AudioVisual* aEffect;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.ApplyOneShotAudioVisualEffect 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execApplyOneShotAudioVisualEffect_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UFSkill_EffectClass_AudioVisual* aEffect;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.RemoveSkillEffectsFromPlayers 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execRemoveSkillEffectsFromPlayers_Parms {
  class UFSkill_Type* aSkill;  // 0 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  AI_Script.ApplySkillEffectsToPlayers 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execApplySkillEffectsToPlayers_Parms {
  class UFSkill_Type* aSkill;  // 0 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  class AGame_Pawn* aExecutor;  // 4 80 CPF_Parm
};


//  AI_Script.ApplySkillEffects 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execApplySkillEffects_Parms {
  class UFSkill_Type* aSkill;  // 0 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  class AGame_Pawn* aExecutor;  // 4 80 CPF_Parm
  class AGame_Pawn* aTarget;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.SitStand 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSitStand_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  BITFIELD aSit : 1;  // 4 80 CPF_Parm
  class AActor* aStool;  // 8 80 CPF_Parm
};


//  AI_Script.CharName 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execCharName_Parms {
  class AActor* aActor;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  AI_Script.ScriptAssert 20400 0 ( FUNC_Native FUNC_Public )
struct AAI_Script_execScriptAssert_Parms {
  BITFIELD aCheck : 1;  // 0 80 CPF_Parm
  class FString aMessage;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  AI_Script.Failure 20400 0 ( FUNC_Native FUNC_Public )
struct AAI_Script_execFailure_Parms {
  class FString aWarning;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  AI_Script.Warning 20400 0 ( FUNC_Native FUNC_Public )
struct AAI_Script_execWarning_Parms {
  class FString aWarning;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  AI_Script.Debug 20400 0 ( FUNC_Native FUNC_Public )
struct AAI_Script_execDebug_Parms {
  class FString aWarning;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  AI_Script.ScriptName 20400 0 ( FUNC_Native FUNC_Public )
struct AAI_Script_execScriptName_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  AI_Script.FrameOff 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execFrameOff_Parms {
};


//  AI_Script.FrameOn 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execFrameOn_Parms {
  FLOAT aFrameTime;  // 0 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.GetTeam 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetTeam_Parms {
  class AGame_Pawn* aMember;  // 0 80 CPF_Parm
  TArray<class AGame_Pawn*> oTeam;  // 4 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


//  AI_Script.GetNPC 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetNPC_Parms {
  class UNPC_Type* aType;  // 0 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  class AGame_Pawn* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.GetActor 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetActor_Parms {
  FName aName;  // 0 80 CPF_Parm
  class AActor* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.GetInvulnerable 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetInvulnerable_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.SetInvulnerable 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetInvulnerable_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BITFIELD aInvulnerable : 1;  // 4 80 CPF_Parm
};


//  AI_Script.ReceiveDamage 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execReceiveDamage_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class AGame_Pawn* aInstigator;  // 4 80 CPF_Parm
  FLOAT aDamage;  // 8 80 CPF_Parm
};


//  AI_Script.DealDamage 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execDealDamage_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class AGame_Pawn* aTarget;  // 4 80 CPF_Parm
  FLOAT aDamage;  // 8 80 CPF_Parm
};


//  AI_Script.GetMaxHealth 80002 0 ( FUNC_Defined FUNC_Protected )
struct AAI_Script_execGetMaxHealth_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.GetHealth 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetHealth_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.GetSpeed 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetSpeed_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.ResetSpeed 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execResetSpeed_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
};


//  AI_Script.SetSpeed 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetSpeed_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  FLOAT newSpeed;  // 4 80 CPF_Parm
};


//  AI_Script.GetHomeLocation 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetHomeLocation_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class FVector ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.SetHomeLocation 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetHomeLocation_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class FVector aHomeLocation;  // 4 80 CPF_Parm
};


//  AI_Script.Distance 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execDistance_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class AActor* anActor;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.GetLocation 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execGetLocation_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class FVector ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.ChangeToNextScript 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execChangeToNextScript_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class APawn* aInstigator;  // 4 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.SwitchScript 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSwitchScript_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class AAI_Script* oldScript;  // 4 80 CPF_Parm
  class AAI_Script* NewScript;  // 8 80 CPF_Parm
};


//  AI_Script.StopScript 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execStopScript_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class AAI_Script* oldScript;  // 4 80 CPF_Parm
};


//  AI_Script.StartScript 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execStartScript_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class AAI_Script* NewScript;  // 4 80 CPF_Parm
};


//  AI_Script.StopTimer 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execStopTimer_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  FName aTimer;  // 4 80 CPF_Parm
};


//  AI_Script.StartTimer 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execStartTimer_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  FName aTimer;  // 4 80 CPF_Parm
  FLOAT aTime;  // 8 80 CPF_Parm
};


//  AI_Script.PerformEmote 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execPerformEmote_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BYTE aEmote;  // 4 80 CPF_Parm
};


//  AI_Script.LocalizedChat 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execLocalizedChat_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  struct FLocalizedString aText;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class UObject* aTopic;  // 10 90 CPF_OptionalParm CPF_Parm
  class UObject* aTarget;  // 14 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.SetHealth 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetHealth_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  FLOAT aNewHealth;  // 4 80 CPF_Parm
  BITFIELD aIsRelative : 1;  // 8 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.sv_DBQuestProgressSet 80002 0 ( FUNC_Defined FUNC_Protected )
struct AAI_Script_execsv_DBQuestProgressSet_Parms {
  BITFIELD success : 1;  // 0 80 CPF_Parm
  TArray<struct FDatabaseRow> rows;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  INT auto_increment_id;  // 10 80 CPF_Parm
  INT affected_rows;  // 14 80 CPF_Parm
  INT UserData;  // 18 80 CPF_Parm
};


//  AI_Script.SetDBQuestProgress 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetDBQuestProgress_Parms {
  INT aCharacterId;  // 0 80 CPF_Parm
  class UQuest_Type* aQuest;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  INT aObjective;  // 8 80 CPF_Parm
  INT aProgress;  // C 80 CPF_Parm
};


//  AI_Script.SetQuestProgress 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetQuestProgress_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UQuest_Type* aQuest;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  INT aObjective;  // 8 80 CPF_Parm
  INT aProgress;  // C 80 CPF_Parm
  class AGame_Pawn* aTargetPawn;  // 10 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.FireScriptHook 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execFireScriptHook_Parms {
  class AGame_Controller* aDestination;  // 0 80 CPF_Parm
  FName aTag;  // 4 80 CPF_Parm
  INT aNumParam;  // 8 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.FireHook 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execFireHook_Parms {
  class AGame_Controller* aDestination;  // 0 80 CPF_Parm
  BYTE aHook;  // 4 80 CPF_Parm
  class UObject* aObjParam;  // 8 80 CPF_Parm
  INT aNumParam;  // C 80 CPF_Parm
};


//  AI_Script.PlayControllerSound 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execPlayControllerSound_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class FString SoundName;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  AI_Script.OnDetach 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_Script_eventOnDetach_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AAIPoint* aPoint;  // 4 80 CPF_Parm
};


//  AI_Script.OnAttach 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AAI_Script_eventOnAttach_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class AAIPoint* aPoint;  // 4 80 CPF_Parm
};


//  AI_Script.PlayControllerAnimation 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execPlayControllerAnimation_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BYTE variation;  // 4 80 CPF_Parm
  BYTE flag1;  // 5 80 CPF_Parm
  BYTE flag2;  // 6 90 CPF_OptionalParm CPF_Parm
  BYTE flag3;  // 7 90 CPF_OptionalParm CPF_Parm
  BITFIELD isLooping : 1;  // 8 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.AdjustHormone 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execAdjustHormone_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  FName Hormone;  // 4 80 CPF_Parm
  FLOAT aRate;  // 8 80 CPF_Parm
};


//  AI_Script.Flee 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execFlee_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
};


//  AI_Script.Patrol 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execPatrol_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class AAIPoint* aFrom;  // 4 80 CPF_Parm
};


//  AI_Script.Aggro 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execAggro_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
};


//  AI_Script.ReturnHome 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execReturnHome_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class FVector aReturnLocation;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.Idle 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execIdle_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
};


//  AI_Script.Follow 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execFollow_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  FLOAT aDistance;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.EndConversation 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execEndConversation_Parms {
  class AGame_AIController* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.StartConversation 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execStartConversation_Parms {
  class AGame_AIController* aSpeaker;  // 0 80 CPF_Parm
  class AGame_Pawn* aPartner;  // 4 80 CPF_Parm
  class UConversation_Topic* aTopic;  // 8 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.HasWeaponDrawn 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execHasWeaponDrawn_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.SheathWeapon 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSheathWeapon_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.DrawWeapon 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execDrawWeapon_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BYTE aPreferedMode;  // 4 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.CanPerformSkill 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execCanPerformSkill_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class UFSkill_Type* aSkill;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.PerformSkill 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execPerformSkill_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class UFSkill_Type* aSkill;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  class FVector aTarget;  // 8 80 CPF_Parm
};


//  AI_Script.LookAt 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execLookAt_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class FVector Target;  // 4 80 CPF_Parm
};


//  AI_Script.IsDetecting 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execIsDetecting_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.SetDetection 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetDetection_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BITFIELD aOnOff : 1;  // 4 80 CPF_Parm
};


//  AI_Script.SetTarget 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetTarget_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class AActor* aTarget;  // 4 80 CPF_Parm
};


//  AI_Script.IsMoving 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execIsMoving_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.StopMovement 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execStopMovement_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
};


//  AI_Script.Teleport 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execTeleport_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class FVector aLocation;  // 4 80 CPF_Parm
  FLOAT aRadius;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.SetControllerLocation 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSetControllerLocation_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class FVector NewLocation;  // 4 80 CPF_Parm
};


//  AI_Script.SetTouching 20400 0 ( FUNC_Native FUNC_Public )
struct AAI_Script_execSetTouching_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  BITFIELD aTouch : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.MoveTo 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execMoveTo_Parms {
  class AGame_AIController* aGame_AIController;  // 0 80 CPF_Parm
  class FVector aLocation;  // 4 80 CPF_Parm
  FLOAT aRange;  // 10 90 CPF_OptionalParm CPF_Parm
};


//  AI_Script.InAIState 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execInAIState_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  FName StateClass;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.IsAIOff 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execIsAIOff_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.IsAIPaused 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execIsAIPaused_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.HasPausedAI 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execHasPausedAI_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.ContinueAI 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execContinueAI_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
};


//  AI_Script.PauseAI 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execPauseAI_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
};


//  AI_Script.SwapStateMachine 20002 0 ( FUNC_Defined FUNC_Public )
struct AAI_Script_execSwapStateMachine_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class UAIStateMachine* aNewMachine;  // 4 80 CPF_Parm
  class UAIStateMachine* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.SpawnScript 80400 0 ( FUNC_Native FUNC_Protected )
struct AAI_Script_execSpawnScript_Parms {
  class UClass* SpawnClass;  // 0 80 CPF_Parm
  class AAI_Script* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  AI_Script.AutoFix 80802 0 ( FUNC_Defined FUNC_Event FUNC_Protected )
struct AAI_Script_eventAutoFix_Parms {
};


//  AI_Script.GetActorRelations 80802 0 ( FUNC_Defined FUNC_Event FUNC_Protected )
struct AAI_Script_eventGetActorRelations_Parms {
  TArray<struct FActorRelation> oRelations;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


//  AI_Script.sv_OnScriptFrame 80802 0 ( FUNC_Defined FUNC_Event FUNC_Protected )
struct AAI_Script_eventsv_OnScriptFrame_Parms {
  FLOAT DeltaTime;  // 0 80 CPF_Parm
};


// AAI_Script 4212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate CLASS_ExportStructs )
class DLL_IMPORT AAI_Script : public AAnnotation_Script {
  public:
    class AAI_Script* NextScript;  // 444 2000001 CPF_Edit CPF_EditorData
    BITFIELD TriggerNextScript : 1;  // 448 2000001 CPF_Edit CPF_EditorData
    BITFIELD LogDebug : 1;  // 448 2000001 CPF_Edit CPF_EditorData
    BITFIELD acceptsTicks : 1;  // 448 0
    TArray<struct FAppliedEffect> AppliedEffects;  // 44C 2400000 CPF_NeedCtorLink CPF_EditorData
    BITFIELD mWantsScriptFrame : 1;  // 458 0
    FLOAT mScriptFrameTime;  // 45C 0
    FLOAT mFrameTimer;  // 460 2000 CPF_Transient
    virtual ~AAI_Script(void);
    virtual unsigned int GetCPPSize(void);
    virtual void PostEditLoad(void);
    virtual void GetActorRelations(class TArray<struct FActorRelation> &);
    virtual void sv_OnFrame(float);
    virtual void PostBeginPlay(void);
    AAI_Script(class AAI_Script const &);
    AAI_Script(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AAI_Script & operator=(class AAI_Script const &);
    class FString GetScriptName(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventAutoFix(void);
    void eventGetActorRelations(class TArray<struct FActorRelation> &);
    void eventsv_OnScriptFrame(float);
    void execDebug(struct FFrame &,void * const);
    void execFailure(struct FFrame &,void * const);
    void execScriptAssert(struct FFrame &,void * const);
    void execScriptName(struct FFrame &,void * const);
    void execSetTouching(struct FFrame &,void * const);
    void execSpawnScript(struct FFrame &,void * const);
    void execWarning(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(AAI_Script,0,execDebug)
AUTOGENERATE_FUNCTION(AAI_Script,0,execFailure)
AUTOGENERATE_FUNCTION(AAI_Script,0,execScriptAssert)
AUTOGENERATE_FUNCTION(AAI_Script,0,execScriptName)
AUTOGENERATE_FUNCTION(AAI_Script,0,execSetTouching)
AUTOGENERATE_FUNCTION(AAI_Script,0,execSpawnScript)
AUTOGENERATE_FUNCTION(AAI_Script,0,execWarning)


//------------------------------------------------------------------------------
//  FSkill_EffectClass_DirectTeleportAI
//------------------------------------------------------------------------------

// UFSkill_EffectClass_DirectTeleportAI 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UFSkill_EffectClass_DirectTeleportAI : public UFSkill_EffectClass_DirectTeleport/*,MHasSkillPower*/  {
  public:
    virtual ~UFSkill_EffectClass_DirectTeleportAI(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool TryMovePawn(class AGame_Pawn *,class FVector &,class FRotator &);
    UFSkill_EffectClass_DirectTeleportAI(class UFSkill_EffectClass_DirectTeleportAI const &);
    UFSkill_EffectClass_DirectTeleportAI(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UFSkill_EffectClass_DirectTeleportAI & operator=(class UFSkill_EffectClass_DirectTeleportAI const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  TargetComponent
//------------------------------------------------------------------------------

enum EPrecitionMethod {
  EPM_Unknown = 0,
  EPM_Dead = 1,
  EPM_Path = 2,
  EPM_Destination = 3,
  EPM_Now = 4,
  EPM_History = 5,
  EPM_Velocity = 6
};

enum EFilterResult {
  EFR_None = 0,
  EFR_Ok = 1,
  EFR_Precondition = 2,
  EFR_Invalid = 3,
  EFR_Dead = 4,
  EFR_Class = 5,
  EFR_Filtered = 6,
  EFR_Unreachable = 7,
  EFR_OutOfRange = 8,
  EFR_Invulnerable = 9,
  EFR_Deselected = 10
};

enum ETargettingMode {
  ETM_None = 0,
  ETM_Location = 1,
  ETM_Fixed = 2,
  ETM_Nearest = 3,
  ETM_Random = 4,
  ETM_Combat = 5
};

// FVisualMemoryStruct 0 ( )
struct DLL_IMPORT FVisualMemoryStruct {
  public:
    FLOAT LastSeen;  // 0 0
    BITFIELD CurrentlyDetected : 1;  // 4 0
    struct FVisualMemoryStruct & operator=(struct FVisualMemoryStruct const &);
};

// FPredictionStruct 0 ( )
struct DLL_IMPORT FPredictionStruct {
  public:
    BYTE Method;  // 0 0
    class AGame_Pawn* Pawn;  // 4 0
    FLOAT ServerTime;  // 8 0
    FLOAT DeltaTime;  // C 0
    FLOAT Certainty;  // 10 0
    class FVector Result;  // 14 0
    FPredictionStruct(void);
    struct FPredictionStruct & operator=(struct FPredictionStruct const &);
};

// FUnreachableStruct 0 ( )
struct DLL_IMPORT FUnreachableStruct {
  public:
    class AGame_Pawn* Pawn;  // 0 0
    FLOAT Range;  // 4 0
    FLOAT Area;  // 8 0
    class FVector Location;  // C 0
    FLOAT Time;  // 18 0
    FUnreachableStruct(void);
    struct FUnreachableStruct & operator=(struct FUnreachableStruct const &);
};

// FTargetConfigStruct 0 ( )
struct DLL_IMPORT FTargetConfigStruct {
  public:
    class UObject* mOwner;  // 0 0
    BYTE Mode;  // 4 0
    class FVector TargetLocation;  // 8 0
    class AActor* TargetActor;  // 14 0
    class UClass* TargetClass;  // 18 0
    FLOAT TargetRange;  // 1C 0
    BITFIELD Detection : 1;  // 20 0
    FLOAT RetargetSlack;  // 24 0
    FLOAT DistanceSlack;  // 28 0
    FLOAT UnreachableSlack;  // 2C 0
    DWORD FilterFunction;  // 30 2000 CPF_Transient
    class UObject* FilterDelegateObject;  // 34 0
    FName FilterDelegateName;  // 38 0
    FTargetConfigStruct(void);
    struct FTargetConfigStruct & operator=(struct FTargetConfigStruct const &);
};

// FDetectedStruct 0 ( )
struct DLL_IMPORT FDetectedStruct {
  public:
    class AActor* Detected;  // 0 0
    FLOAT SqrDistance;  // 4 0
    BYTE Status;  // 8 0
    BITFIELD Enemy : 1;  // C 0
    BITFIELD Ally : 1;  // C 0
    struct FDetectedStruct & operator=(struct FDetectedStruct const &);
};

//  TargetComponent.SetDistanceSlack 20002 0 ( FUNC_Defined FUNC_Public )
struct UTargetComponent_execSetDistanceSlack_Parms {
  FLOAT aNewSlack;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  TargetComponent.SetTargetSlack 20002 0 ( FUNC_Defined FUNC_Public )
struct UTargetComponent_execSetTargetSlack_Parms {
  FLOAT aNewSlack;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  TargetComponent.SetLineOfSight 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetLineOfSight_Parms {
  FLOAT aLineOfSightRange;  // 0 80 CPF_Parm
};


//  TargetComponent.SetVisualRange 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetVisualRange_Parms {
  FLOAT aVisualRange;  // 0 80 CPF_Parm
};


//  TargetComponent.SetDetection 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetDetection_Parms {
  BITFIELD aOn : 1;  // 0 80 CPF_Parm
};


//  TargetComponent.SetCombat 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetCombat_Parms {
};


//  TargetComponent.SetRandomPawn 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetRandomPawn_Parms {
  class AActor* aOrigin;  // 0 90 CPF_OptionalParm CPF_Parm
  FLOAT aRange;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  TargetComponent.SetRandomActor 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetRandomActor_Parms {
  class UClass* aClass;  // 0 90 CPF_OptionalParm CPF_Parm
  FLOAT aRange;  // 4 90 CPF_OptionalParm CPF_Parm
  class AActor* aOrigin;  // 8 90 CPF_OptionalParm CPF_Parm
};


//  TargetComponent.SetNearestPawn 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetNearestPawn_Parms {
  FLOAT aRange;  // 0 90 CPF_OptionalParm CPF_Parm
  class AActor* aOrigin;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  TargetComponent.SetNearestActor 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetNearestActor_Parms {
  class UClass* aClass;  // 0 90 CPF_OptionalParm CPF_Parm
  FLOAT aRange;  // 4 90 CPF_OptionalParm CPF_Parm
  class AActor* aOrigin;  // 8 90 CPF_OptionalParm CPF_Parm
};


//  TargetComponent.SetPawn 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetPawn_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


//  TargetComponent.SetActor 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetActor_Parms {
  class AActor* aActor;  // 0 80 CPF_Parm
};


//  TargetComponent.SetLocation 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetLocation_Parms {
  class FVector aLocation;  // 0 80 CPF_Parm
};


//  TargetComponent.SetDisabled 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execSetDisabled_Parms {
};


//  TargetComponent.DetectingAllies 20002 0 ( FUNC_Defined FUNC_Public )
struct UTargetComponent_execDetectingAllies_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  TargetComponent.DetectingEnemies 20002 0 ( FUNC_Defined FUNC_Public )
struct UTargetComponent_execDetectingEnemies_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  TargetComponent.IsDetecting 20002 0 ( FUNC_Defined FUNC_Public )
struct UTargetComponent_execIsDetecting_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  TargetComponent.GetAllies 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execGetAllies_Parms {
  TArray<class AGame_Pawn*> oEnemies;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


//  TargetComponent.GetEnemies 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execGetEnemies_Parms {
  TArray<class AGame_Pawn*> oEnemies;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


//  TargetComponent.GetCandidates 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execGetCandidates_Parms {
  TArray<class AGame_Pawn*> oEnemies;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


//  TargetComponent.GetDetected 20400 0 ( FUNC_Native FUNC_Public )
struct UTargetComponent_execGetDetected_Parms {
  TArray<class AGame_Pawn*> oDetected;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


//  TargetComponent.GetPawn 20002 0 ( FUNC_Defined FUNC_Public )
struct UTargetComponent_execGetPawn_Parms {
  class AGame_Pawn* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  TargetComponent.GetTarget 20002 0 ( FUNC_Defined FUNC_Public )
struct UTargetComponent_execGetTarget_Parms {
  class AActor* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  TargetComponent.GetTargetLocation 20002 0 ( FUNC_Defined FUNC_Public )
struct UTargetComponent_execGetTargetLocation_Parms {
  class FVector ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  TargetComponent.FilterTarget 120000 0 ( FUNC_Public FUNC_Delegate )
struct UTargetComponent_execFilterTarget_Parms {
  class AActor* aActor;  // 0 80 CPF_Parm
  BYTE ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UTargetComponent 204012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UTargetComponent : public UBase_Component {
  public:
    BITFIELD Initialized : 1;  // 40 0
    BYTE Mode;  // 44 0
    class FVector TargetLocation;  // 48 0
    class AActor* TargetActor;  // 54 0
    class UClass* TargetClass;  // 58 0
    FLOAT TargetRange;  // 5C 0
    BITFIELD Detection : 1;  // 60 0
    FLOAT VisualRange;  // 64 0
    FLOAT LineOfSightRange;  // 68 0
    TArray<struct FUnreachableStruct> Unreachable;  // 6C 400000 CPF_NeedCtorLink
    BITFIELD AllEnemiesUnreachable : 1;  // 78 0
    BITFIELD HadTarget : 1;  // 78 2000000 CPF_EditorData
    class AActor* Target;  // 7C 0
    class FVector Location;  // 80 0
    TArray<struct FDetectedStruct> Detected;  // 8C 400000 CPF_NeedCtorLink
    TArray<struct FDetectedStruct> OldDetected;  // 98 400000 CPF_NeedCtorLink
    DWORD VisualMemory;  // A4 2002000 CPF_Transient CPF_EditorData
    INT Enemies;  // A8 0
    INT Allies;  // AC 0
    INT UnreachableEnemies;  // B0 0
    INT UnreachableAllies;  // B4 0
    INT DetectedEnemies;  // B8 0
    INT DetectedAllies;  // BC 0
    FLOAT AimedTime;  // C0 2000000 CPF_EditorData
    class UFSkill_Type* Skill;  // C4 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    FLOAT MinBattleZone;  // C8 0
    FLOAT MaxBattleZone;  // CC 0
    FLOAT NoTargetCombatTime;  // D0 2000000 CPF_EditorData
    FLOAT RetargetSlack;  // D4 2000000 CPF_EditorData
    FLOAT DistanceSlack;  // D8 2000000 CPF_EditorData
    FLOAT UnreachableSlack;  // DC 2000000 CPF_EditorData
    FLOAT VisualMemoryTime;  // E0 2000000 CPF_EditorData
    FLOAT RecomputeTimer;  // E4 0
    FLOAT PreviousDistance;  // E8 0
    TArray<struct FTargetConfigStruct> ConfigStack;  // EC 2400000 CPF_NeedCtorLink CPF_EditorData
    BITFIELD AnalyzePrediction : 1;  // F8 0
    TArray<struct FPredictionStruct> PredictionResults;  // FC 400000 CPF_NeedCtorLink
    DWORD FilterFunction;  // 108 2000 CPF_Transient
    struct FScriptDelegate __FilterTarget__Delegate;  // 10C 400000 CPF_NeedCtorLink
    virtual ~UTargetComponent(void);
    virtual void Destroy(void);
    virtual void ExtendCleanMe(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnInit(void);
    virtual void sv_OnFrame(float);
    UTargetComponent(class UTargetComponent const &);
    UTargetComponent(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UTargetComponent & operator=(class UTargetComponent const &);
    void AddUnreachable(class AGame_Pawn *,float,float);
    bool CandidateEnemies(void);
    bool CheckUnreachableRange(class AActor *,float);
    void ClearConfig(void);
    class FVector ExtrapolateLocation(class AGame_Pawn *,float,float &);
    float GetAimedTime(void);
    void GetAllies(class TArray<class AGame_Pawn *> &);
    void GetCandidates(class TArray<class AActor *> &);
    void GetDetected(class TArray<class AActor *> &);
    int GetDetectedAllies(void);
    int GetDetectedEnemies(void);
    void GetDetectedPawns(class TArray<class AGame_Pawn *> &);
    void GetEnemies(class TArray<class AGame_Pawn *> &);
    float GetMaxBattleZone(void);
    float GetMinBattleZone(void);
    class UFSkill_Type * GetSkill(void);
    class AActor * GetTarget(void);
    class FVector GetTargetLocation(void);
    class AGame_Pawn * GetTargetPawn(void);
    static void CDECL InternalConstructor(void *);
    bool IsCombatTarget(class AActor *);
    bool IsDetecting(void);
    void PopConfig(class UObject *);
    class FVector PredictAILocation(class AGame_Pawn *,float,float &);
    class FVector PredictInterceptLocation(class AGame_Pawn *,float);
    class FVector PredictTargetLocation(class AGame_Pawn *,float,float &);
    float PredictTimeToTarget(class AGame_Pawn *,float)const ;
    void PushConfig(class UObject *);
    void ResetConfig(void);
    void SetActor(class AActor *,class UClass *,enum EFilterResult (__cdecl*)(class AGame_Pawn *,class AActor *));
    void SetCombat(void);
    void SetDetection(bool);
    void SetDisabled(void);
    void SetFilter(enum EFilterResult (__cdecl*)(class AGame_Pawn *,class AActor *));
    void SetLineOfSight(float);
    void SetLocation(class FVector);
    void SetNearestActor(class UClass *,enum EFilterResult (__cdecl*)(class AGame_Pawn *,class AActor *),float,class AActor *);
    void SetRandomActor(class UClass *,enum EFilterResult (__cdecl*)(class AGame_Pawn *,class AActor *),float,class AActor *);
    void SetVisualRange(float);
    static class UClass * CDECL StaticClass(void);
    bool TacticalTarget(enum EFilterResult);
    static enum EFilterResult CDECL TargetCombatFilter(class AGame_Pawn *,class AActor *);
    bool ValidCombatTarget(enum EFilterResult);
    unsigned char delegateFilterTarget(class AActor *);
    void execGetAllies(struct FFrame &,void * const);
    void execGetCandidates(struct FFrame &,void * const);
    void execGetDetected(struct FFrame &,void * const);
    void execGetEnemies(struct FFrame &,void * const);
    void execSetActor(struct FFrame &,void * const);
    void execSetCombat(struct FFrame &,void * const);
    void execSetDetection(struct FFrame &,void * const);
    void execSetDisabled(struct FFrame &,void * const);
    void execSetLineOfSight(struct FFrame &,void * const);
    void execSetLocation(struct FFrame &,void * const);
    void execSetNearestActor(struct FFrame &,void * const);
    void execSetNearestPawn(struct FFrame &,void * const);
    void execSetPawn(struct FFrame &,void * const);
    void execSetRandomActor(struct FFrame &,void * const);
    void execSetRandomPawn(struct FFrame &,void * const);
    void execSetVisualRange(struct FFrame &,void * const);
  protected:
    void AddCombatDetected(class UGame_CombatStats *);
    int AddDetected(class AActor *,float,bool);
    void AddGroupMindDetected(class AGroupMind *);
    void AddPredictionResult(enum EPrecitionMethod,class AGame_Pawn *,float,float,class FVector);
    void AddTeamDetected(class UGame_Team *,float);
    void AddTeamMembers(class UGame_Team *);
    void AddVisualDetected(class FVector,float);
    void ApplyConfig(struct FTargetConfigStruct const &);
    void ClearResults(void);
    bool ComputeSight(class FVector,float,class AGame_Pawn *,class AActor *,float);
    bool DebugCheckDuplicateDetected(void);
    enum EFilterResult Filter(class AActor *);
    int FindDetected(class AActor *);
    class AGame_AIController * GetAIController(void)const ;
    float GetAimTime(class FVector,class UFSkill_Type *);
    class AGame_Pawn * GetObserver(void)const ;
    class AGame_Pawn * GetOwnerPawn(void)const ;
    bool GetSkillProgress(class UFSkill_Type * &,float &);
    float GetTargetTime(class AGame_Pawn *,class UFSkill_Type *,float);
    bool IsUnreachable(class AActor *);
    bool PrePostFilter(class AActor *);
    void RecomputeDetected(class FVector,float);
    void RecomputeEnemies(void);
    void RecomputeLocation(void);
    void RecomputeTarget(void);
    void RecomputeUnreachable(void);
    void SelectAttack(void);
    class AActor * SelectNearestCandidate(void);
    class AActor * SelectRandomCandidate(void);
    void SetEnemiesAllies(int,int);
    void StoreConfig(struct FTargetConfigStruct &);
    void UpdateAndAddVisualMemory(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UTargetComponent,0,execGetAllies)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execGetCandidates)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execGetDetected)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execGetEnemies)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetActor)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetCombat)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetDetection)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetDisabled)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetLineOfSight)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetLocation)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetNearestActor)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetNearestPawn)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetPawn)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetRandomActor)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetRandomPawn)
AUTOGENERATE_FUNCTION(UTargetComponent,0,execSetVisualRange)


//------------------------------------------------------------------------------
//  MovementComponent
//------------------------------------------------------------------------------

enum EAIMoveMode {
  AMM_None = 0,
  AMM_Pathfinding = 1,
  AMM_Wander = 2,
  AMM_Tactical = 3,
  AMM_Flee = 4,
  AMM_Follow = 5
};

// FMCTimer 0 ( )
struct DLL_IMPORT FMCTimer {
  public:
    BYTE mMode;  // 0 0
    class UClass* mState;  // 4 0
    FLOAT mTimePlanning;  // 8 0
    FLOAT mTimeMoving;  // C 0
    INT mPlans;  // 10 0
    INT mMoves;  // 14 0
    struct FMCTimer & operator=(struct FMCTimer const &);
};

// FMovementConfigStruct 0 ( )
struct DLL_IMPORT FMovementConfigStruct {
  public:
    class UObject* mOwner;  // 0 0
    class FVector pawnLocation;  // 4 0
    BYTE Mode;  // 10 0
    class FVector Destination;  // 14 0
    FLOAT Range;  // 20 0
    class AGame_Pawn* Target;  // 24 0
    class UFSkill_Type* Skill;  // 28 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    class AAIPoint* ControlPoint;  // 2C 0
    FLOAT speed;  // 30 0
    BITFIELD Walking : 1;  // 34 0
    BITFIELD Strafing : 1;  // 34 0
    BITFIELD MovingTurn : 1;  // 34 0
    FMovementConfigStruct(void);
    struct FMovementConfigStruct & operator=(struct FMovementConfigStruct const &);
};

// FTacticalLocation 0 ( )
struct DLL_IMPORT FTacticalLocation {
  public:
    class FVector Location;  // 0 0
    FLOAT Distance;  // C 0
    FLOAT LowerLimit;  // 10 0
    FLOAT UpperLimit;  // 14 0
    FLOAT Weight;  // 18 0
    BITFIELD LimitPath : 1;  // 1C 0
    BITFIELD Penalty : 1;  // 1C 0
    FTacticalLocation(void);
    struct FTacticalLocation & operator=(struct FTacticalLocation const &);
};

//  MovementComponent.GetNextPatrolPoint 20400 0 ( FUNC_Native FUNC_Public )
struct UMovementComponent_execGetNextPatrolPoint_Parms {
  class APatrolPoint* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MovementComponent.SetWalking 20002 0 ( FUNC_Defined FUNC_Public )
struct UMovementComponent_execSetWalking_Parms {
  BITFIELD aWalking : 1;  // 0 80 CPF_Parm
};


//  MovementComponent.SetSpeed 20002 0 ( FUNC_Defined FUNC_Public )
struct UMovementComponent_execSetSpeed_Parms {
  FLOAT aSpeed;  // 0 80 CPF_Parm
};


//  MovementComponent.Approach 20400 0 ( FUNC_Native FUNC_Public )
struct UMovementComponent_execApproach_Parms {
  class FVector aDestination;  // 0 80 CPF_Parm
  FLOAT aRange;  // C 80 CPF_Parm
};


//  MovementComponent.Wander 20400 0 ( FUNC_Native FUNC_Public )
struct UMovementComponent_execWander_Parms {
};


//  MovementComponent.MoveControlled 20400 0 ( FUNC_Native FUNC_Public )
struct UMovementComponent_execMoveControlled_Parms {
  class AAIPoint* aControl;  // 0 80 CPF_Parm
};


//  MovementComponent.MoveTo 20400 0 ( FUNC_Native FUNC_Public )
struct UMovementComponent_execMoveTo_Parms {
  class FVector aDestination;  // 0 80 CPF_Parm
};


//  MovementComponent.NoMovement 20400 0 ( FUNC_Native FUNC_Public )
struct UMovementComponent_execNoMovement_Parms {
};


// UMovementComponent 204012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UMovementComponent : public UBase_Component {
  public:
    BYTE MoveMode;  // 40 0
    class FVector Destination;  // 44 0
    FLOAT Range;  // 50 0
    class AGame_Pawn* Target;  // 54 0
    class UFSkill_Type* Skill;  // 58 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    class AAIPoint* ControlPoint;  // 5C 0
    class AAIPoint* DestinationPoint;  // 60 0
    FLOAT speed;  // 64 0
    BITFIELD Walking : 1;  // 68 0
    BITFIELD Strafing : 1;  // 68 0
    BITFIELD MovingTurn : 1;  // 68 0
    BITFIELD AnnotationAttached : 1;  // 68 0
    TArray<struct FTacticalLocation> TacticalLocations;  // 6C 400000 CPF_NeedCtorLink
    class USBAccessMap* mAccessmap;  // 78 0
    class USBPath* mPath;  // 7C 2000000 CPF_EditorData
    TArray<struct FMovementConfigStruct> ConfigStack;  // 80 2400000 CPF_NeedCtorLink CPF_EditorData
    TArray<class USBPath*> mPathStack;  // 8C 400000 CPF_NeedCtorLink
    FLOAT mFrequencyTimer;  // 98 0
    FLOAT mArrivedTime;  // 9C 0
    INT mData1;  // A0 800000 CPF_Unk_00800000
    virtual ~UMovementComponent(void);
  private:
    virtual void Destroy(void);
  public:
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnInit(void);
    virtual void sv_OnFrame(float);
    UMovementComponent(class UMovementComponent const &);
    UMovementComponent(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UMovementComponent & operator=(class UMovementComponent const &);
    void ApproachDestination(class FVector const &,float);
    bool CanAim(void);
    bool CanMove(void);
    void ClearConfig(void);
    void Flee(class FVector const &,float);
    void Follow(class AGame_Pawn *,float);
    float GetArrivedTime(void);
    class FVector GetDestination(void);
    float GetPawnSpeed(void);
    static void CDECL InternalConstructor(void *);
    void MoveControlled(class AAIPoint *);
    void MoveToDestination(class FVector const &);
    bool Moving(void);
    void NoMovement(void);
    class FVector PlannedPathEnd(void);
    float PlannedPathLength(void);
    void PopConfig(class UObject *);
    class FVector PredictLocation(float);
    void PushConfig(class UObject *);
    float RemainingPathLength(void);
    void ResetConfig(void);
    void SetMovingTurn(bool);
    void SetSpeed(float);
    void SetStrafing(bool);
    void SetWalking(bool);
    static class UClass * CDECL StaticClass(void);
    void Tactical(class AGame_Pawn *,class UFSkill_Type *);
    void Wander(void);
    void execApproach(struct FFrame &,void * const);
    void execGetNextPatrolPoint(struct FFrame &,void * const);
    void execMoveControlled(struct FFrame &,void * const);
    void execMoveTo(struct FFrame &,void * const);
    void execNoMovement(struct FFrame &,void * const);
    void execWander(struct FFrame &,void * const);
  protected:
    void AddControlPoints(void);
    void ApplyConfig(struct FMovementConfigStruct const &);
    void BeginControlledMovement(void);
    void CreatePath(class FVector const &,float);
    void CreatePathIfNeeded(class FVector const &,float);
    void EndControlledMovement(void);
    struct FMCTimer & GetTimer(void);
    bool IsPathStillValid(class FVector,float);
    void PotentiallyDumpTimers(void);
    void ResetMovement(void);
    void StartMoveTimer(void);
    void StartPlanTimer(void);
    void StopMoveTimer(void);
    void StopPlanTimer(void);
    void StoreConfig(struct FMovementConfigStruct &);
    static float mLastTimerDump;
    static unsigned long mMoveTime;
    static unsigned long mPlanTime;
    static class TArray<struct FMCTimer> mProfilingTimers;
    static enum EAIMoveMode mTimeMode;
  private:
    void Arrived(void);
    void Blocked(void);
    bool CheckRanges(class FVector);
    bool CheckUnreachablePerch(float);
    void DebugDrawPath(void);
    void DebugDrawSubPath(class USBPath *,int);
    class FRotator FocusDirection(class AGame_NPCPawn *);
    class AGame_Controller * GetController(void);
    class AAnnotationActor * GetCurrentPathAnnotation(void);
    class FVector GetCurrentPathLocation(void);
    class AAnnotationActor * GetNextPathAnnotation(void);
    class FVector GetNextPathLocation(void);
    class AGame_Pawn * GetPawn(void);
    void Immobilized(void);
    void Move(float,bool);
    bool MovePawn(class FVector const &,float,bool,float &);
    bool NextPathPoint(void);
    bool PathDone(void);
    bool PlanFlee(float);
    bool PlanFollow(float);
    bool PlanPath(void);
    bool PlanTactical(float);
    bool PlanWander(float);
    void PopPath(void);
    static class UClass PrivateStaticClass;
    void PushPath(void);
    bool RotatePawn(float);
    void SendStateSignal(enum EStateSignal);
    void StopMovement(void);
    void SubPath(class AAnnotationActor *,class AAnnotationActor *,float);
    void TruncatePath(void);
    void Unreachable(void);
    bool WalkAlongPath(float);
};
AUTOGENERATE_FUNCTION(UMovementComponent,0,execApproach)
AUTOGENERATE_FUNCTION(UMovementComponent,0,execGetNextPatrolPoint)
AUTOGENERATE_FUNCTION(UMovementComponent,0,execMoveControlled)
AUTOGENERATE_FUNCTION(UMovementComponent,0,execMoveTo)
AUTOGENERATE_FUNCTION(UMovementComponent,0,execNoMovement)
AUTOGENERATE_FUNCTION(UMovementComponent,0,execWander)


//------------------------------------------------------------------------------
//  MetaControllerManagerComponent
//------------------------------------------------------------------------------

//  MetaControllerManagerComponent.RecomputeControllerMask 80401 0 ( FUNC_Final FUNC_Native FUNC_Protected )
struct UMetaControllerManagerComponent_execRecomputeControllerMask_Parms {
};


//  MetaControllerManagerComponent.WantMetaControllerMessage 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UMetaControllerManagerComponent_execWantMetaControllerMessage_Parms {
  BYTE aMessage;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MetaControllerManagerComponent.HasMetaController 20002 0 ( FUNC_Defined FUNC_Public )
struct UMetaControllerManagerComponent_execHasMetaController_Parms {
  class ANPC_AI* aController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  MetaControllerManagerComponent.RemoveMetaController 20400 0 ( FUNC_Native FUNC_Public )
struct UMetaControllerManagerComponent_execRemoveMetaController_Parms {
  class AAI_MetaController* aMetaController;  // 0 80 CPF_Parm
};


//  MetaControllerManagerComponent.AddMetaController 20400 0 ( FUNC_Native FUNC_Public )
struct UMetaControllerManagerComponent_execAddMetaController_Parms {
  class AAI_MetaController* aMetaController;  // 0 80 CPF_Parm
  class AAI_MetaController* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UMetaControllerManagerComponent 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UMetaControllerManagerComponent : public UBase_Component {
  public:
    TArray<class AAI_MetaController*> mMetaControllers;  // 40 400000 CPF_NeedCtorLink
    INT mControllerMessageMask1;  // 4C 0
    INT mControllerMessageMask2;  // 50 0
    virtual ~UMetaControllerManagerComponent(void);
    virtual unsigned int GetCPPSize(void);
    UMetaControllerManagerComponent(class UMetaControllerManagerComponent const &);
    UMetaControllerManagerComponent(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UMetaControllerManagerComponent & operator=(class UMetaControllerManagerComponent const &);
    class AAI_MetaController * AddMetaController(class AAI_MetaController *);
    class ANPC_AI * FindController(class UClass *,int &);
    static void CDECL InternalConstructor(void *);
    int MetaControllerMessage(enum ControllerMessages,class AActor *,class FName,class UObject *,float,class FVector);
    void RecomputeControllerMask(void);
    void RemoveMetaController(class AAI_MetaController *);
    static class UClass * CDECL StaticClass(void);
    int WantMetaControllerMessage(enum ControllerMessages);
    void execAddMetaController(struct FFrame &,void * const);
    void execRecomputeControllerMask(struct FFrame &,void * const);
    void execRemoveMetaController(struct FFrame &,void * const);
    void execWantMetaControllerMessage(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UMetaControllerManagerComponent,0,execAddMetaController)
AUTOGENERATE_FUNCTION(UMetaControllerManagerComponent,0,execRecomputeControllerMask)
AUTOGENERATE_FUNCTION(UMetaControllerManagerComponent,0,execRemoveMetaController)
AUTOGENERATE_FUNCTION(UMetaControllerManagerComponent,0,execWantMetaControllerMessage)


//------------------------------------------------------------------------------
//  HormoneComponent
//------------------------------------------------------------------------------

// FHormoneSynergy 0 ( )
struct DLL_IMPORT FHormoneSynergy {
  public:
    INT FromIndex;  // 0 0
    INT ToIndex;  // 4 0
    FLOAT Rate;  // 8 0
    struct FHormoneSynergy & operator=(struct FHormoneSynergy const &);
};

// FHormone 0 ( )
struct DLL_IMPORT FHormone {
  public:
    FName Tag;  // 0 0
    FLOAT mLevel;  // 4 0
    FLOAT Rate;  // 8 0
    FLOAT Intensity;  // C 0
    BYTE signal;  // 10 0
    FHormone(void);
    struct FHormone & operator=(struct FHormone const &);
};

//  HormoneComponent.DeltaValue 80400 0 ( FUNC_Native FUNC_Protected )
struct UHormoneComponent_execDeltaValue_Parms {
  FLOAT aValue;  // 0 80 CPF_Parm
  FLOAT aRate;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HormoneComponent.AdjustHormone 20400 0 ( FUNC_Native FUNC_Public )
struct UHormoneComponent_execAdjustHormone_Parms {
  FName aTag;  // 0 80 CPF_Parm
  FLOAT aRate;  // 4 80 CPF_Parm
};


// UHormoneComponent 204012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UHormoneComponent : public UBase_Component {
  public:
    TArray<struct FHormone> Hormones;  // 40 400000 CPF_NeedCtorLink
    TArray<struct FHormoneSynergy> Synergies;  // 4C 400000 CPF_NeedCtorLink
    FLOAT cPulseTime;  // 58 2 CPF_Const
    FLOAT PulseTimer;  // 5C 2000000 CPF_EditorData
    FLOAT cPhaseTime;  // 60 2 CPF_Const
    BITFIELD bTrace : 1;  // 64 2000000 CPF_EditorData
    TArray<FLOAT> TraceLevel;  // 68 2400000 CPF_NeedCtorLink CPF_EditorData
    virtual ~UHormoneComponent(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnInit(void);
    virtual void sv_OnFrame(float);
    UHormoneComponent(class UHormoneComponent const &);
    UHormoneComponent(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHormoneComponent & operator=(class UHormoneComponent const &);
    void AddSynergy(class FName,class FName,float);
    void AdjustHormone(class FName,float);
    float GetHormoneLevel(class FString);
    static void CDECL InternalConstructor(void *);
    void RandomInitHormone(class FName,float,float,float,enum EStateSignal);
    static class UClass * CDECL StaticClass(void);
    void execAdjustHormone(struct FFrame &,void * const);
    void execDeltaValue(struct FFrame &,void * const);
  protected:
    float DeltaValue(float,float);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHormoneComponent,0,execAdjustHormone)
AUTOGENERATE_FUNCTION(UHormoneComponent,0,execDeltaValue)


//------------------------------------------------------------------------------
//  ConversationComponent
//------------------------------------------------------------------------------

//  ConversationComponent.OnFailConversation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UConversationComponent_eventOnFailConversation_Parms {
  class AGame_Pawn* aPartner;  // 0 80 CPF_Parm
};


//  ConversationComponent.FailConversation 20002 0 ( FUNC_Defined FUNC_Public )
struct UConversationComponent_execFailConversation_Parms {
  class AGame_Pawn* aPartner;  // 0 80 CPF_Parm
};


//  ConversationComponent.OnEndConversation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UConversationComponent_eventOnEndConversation_Parms {
  class AGame_Pawn* aPartner;  // 0 80 CPF_Parm
};


//  ConversationComponent.EndAllConversations 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UConversationComponent_eventEndAllConversations_Parms {
};


//  ConversationComponent.EndConversation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UConversationComponent_eventEndConversation_Parms {
  class AGame_Pawn* aPartner;  // 0 80 CPF_Parm
};


//  ConversationComponent.OnTopic 20002 0 ( FUNC_Defined FUNC_Public )
struct UConversationComponent_execOnTopic_Parms {
  class AGame_Pawn* aPartner;  // 0 80 CPF_Parm
  class UConversation_Topic* aTopic;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  ConversationComponent.OnResponse 20002 0 ( FUNC_Defined FUNC_Public )
struct UConversationComponent_execOnResponse_Parms {
  class AGame_Pawn* aPartner;  // 0 80 CPF_Parm
  class UConversation_Response* aResponse;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  ConversationComponent.Converse 20002 0 ( FUNC_Defined FUNC_Public )
struct UConversationComponent_execConverse_Parms {
  class AGame_Pawn* aPartner;  // 0 80 CPF_Parm
  class UConversation_Topic* aTopic;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  class UConversation_Node* aState;  // 8 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  ConversationComponent.OnInteraction 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UConversationComponent_eventOnInteraction_Parms {
  class AGame_Pawn* aSource;  // 0 80 CPF_Parm
};


//  ConversationComponent.OnReact 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UConversationComponent_eventOnReact_Parms {
  class AGame_Pawn* aSource;  // 0 80 CPF_Parm
};


//  ConversationComponent.StopConversation 80802 0 ( FUNC_Defined FUNC_Event FUNC_Protected )
struct UConversationComponent_eventStopConversation_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


//  ConversationComponent.StartConversation 80802 0 ( FUNC_Defined FUNC_Event FUNC_Protected )
struct UConversationComponent_eventStartConversation_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


//  ConversationComponent.QueueConversation 80002 0 ( FUNC_Defined FUNC_Protected )
struct UConversationComponent_execQueueConversation_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
};


//  ConversationComponent.FindConversationIndex 20002 0 ( FUNC_Defined FUNC_Public )
struct UConversationComponent_execFindConversationIndex_Parms {
  class AGame_Pawn* aPartner;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  ConversationComponent.FindConversation 20002 0 ( FUNC_Defined FUNC_Public )
struct UConversationComponent_execFindConversation_Parms {
  class AGame_Pawn* aPartner;  // 0 80 CPF_Parm
  class UGame_ConversationState* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  ConversationComponent.GetAvailableTopics 20400 0 ( FUNC_Native FUNC_Public )
struct UConversationComponent_execGetAvailableTopics_Parms {
  TArray<class UConversation_Topic*> ret;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


// UConversationComponent 204012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UConversationComponent : public UGame_Conversation {
  public:
    BITFIELD mEnabled : 1;  // 40 0
    TArray<class UGame_ConversationState*> mConversations;  // 44 400000 CPF_NeedCtorLink
    TArray<class AGame_Pawn*> mQueuedConversations;  // 50 400000 CPF_NeedCtorLink
    virtual ~UConversationComponent(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual bool CanConverse(class AGame_Pawn *);
    virtual class UConversation_Topic * ChooseTopic(class AGame_Pawn *);
    UConversationComponent(class UConversationComponent const &);
    UConversationComponent(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UConversationComponent & operator=(class UConversationComponent const &);
    bool ConversationEnabled(void);
    bool ConversationsActive(void);
    void DisableConversation(void);
    void EnableConversation(void);
    void GetAvailableTopics(class TArray<class UConversation_Topic *> &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventStartConversation(class AGame_Pawn *);
    void eventStopConversation(class AGame_Pawn *);
    void execGetAvailableTopics(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UConversationComponent,0,execGetAvailableTopics)


//------------------------------------------------------------------------------
//  AIState
//------------------------------------------------------------------------------

enum EStateSignal {
  SS_None = 0,
  SS_StateSuccess = 1,
  SS_StateFailure = 2,
  SS_StateError = 3,
  SS_StateAborted = 4,
  SS_Timer = 5,
  SS_EnemyDetected = 6,
  SS_EnemiesLost = 7,
  SS_AllyDetected = 8,
  SS_AllyLost = 9,
  SS_CombatEnter = 10,
  SS_CombatExit = 11,
  SS_LostAggro = 12,
  SS_SkillFinished = 13,
  SS_SkillReady = 14,
  SS_SkillAimed = 15,
  SS_Conversation = 16,
  SS_EndConversation = 17,
  SS_TargetChanged = 18,
  SS_TargetMoved = 19,
  SS_Target = 20,
  SS_NoTarget = 21,
  SS_Arrived = 22,
  SS_Unreachable = 23,
  SS_Blocked = 24,
  SS_Immobilized = 25,
  SS_OutOfHabitat = 26,
  SS_OutOfChaseRange = 27,
  SS_NoReachableEnemy = 28,
  SS_NoUnreachableEnemy = 29,
  SS_ReachableEnemy = 30,
  SS_Emote = 31,
  SS_Chat = 32,
  SS_Trigger = 33,
  SS_Untrigger = 34,
  SS_NegativeEffect = 35,
  SS_PositiveEffect = 36,
  SS_OwnerNegativeEffect = 37,
  SS_OwnerPositiveEffect = 38,
  SS_OwnerAggression = 39,
  SS__MachineSignals = 40,
  SS_MetaControllerIdle = 41,
  SS_MetaControllerAlert = 42,
  SS_MetaControllerAggro = 43,
  SS_MetaControllerReturn = 44,
  SS_MetaControllerFlee = 45,
  SS_MetaControllerFollow = 46,
  SS_MetaControllerPatrol = 47,
  SS_MetaControllerConversation = 48,
  SS_Bored = 49,
  SS_Hungry = 50,
  SS_Sleepy = 51,
  SS_Aggro = 52,
  SS_Fear = 53,
  SS_Desolate = 54
};

enum EStateResult {
  SR_Available = 0,
  SR_Scheduled = 1,
  SR_Active = 2,
  SR_Succeeded = 3,
  SR_Failed = 4,
  SR_Aborted = 5,
  SR_Error = 6
};

//  AIState.Initialize 20400 0 ( FUNC_Native FUNC_Public )
struct UAIState_execInitialize_Parms {
  class AGame_AIController* aController;  // 0 80 CPF_Parm
  class UAIState* aParent;  // 4 80 CPF_Parm
};


// UAIState 4016 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UAIState : public UObject {
  public:
    class UAIState* mParent;  // 28 0
    class AGame_AIController* mOwner;  // 2C 0
    FLOAT mFrequencyTimeout;  // 30 0
    FLOAT mFrequencyTimer;  // 34 0
    BITFIELD mAborted : 1;  // 38 0
    BITFIELD mControlTargeting : 1;  // 38 2000000 CPF_EditorData
    BITFIELD mControlMovement : 1;  // 38 2000000 CPF_EditorData
    FLOAT Heal;  // 3C 2004000 CPF_Config CPF_EditorData
    INT ExCleanIndex;  // 40 2000 CPF_Transient
    BITFIELD mQueued : 1;  // 44 0
    BITFIELD mNeedWeapon : 1;  // 44 2000000 CPF_EditorData
    BITFIELD mNeedAggro : 1;  // 44 2000000 CPF_EditorData
    virtual ~UAIState(void);
    virtual void ExtendCleanMe(void);
    virtual int IsExtendedCleaned(void);
    virtual void SetCleanIndex(int);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual void OnQueue(class AGame_AIController *);
    virtual void OnDequeue(class AGame_AIController *);
    virtual enum EStateResult Tick(float);
    virtual enum EStateResult StateTick(float);
    virtual void RequestAbort(void);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult StateSignal(enum EStateSignal);
    virtual enum EStateResult OnBlocked(void);
    virtual enum EStateResult OnBored(void);
    virtual enum EStateResult OnChat(void);
    virtual enum EStateResult OnCombatEnter(void);
    virtual enum EStateResult OnCombatExit(void);
    virtual enum EStateResult OnConversation(void);
    virtual enum EStateResult OnDesolate(void);
    virtual enum EStateResult OnEmote(void);
    virtual enum EStateResult OnEndConversation(void);
    virtual enum EStateResult OnEnemiesLost(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnFear(void);
    virtual enum EStateResult OnHungry(void);
    virtual enum EStateResult OnImmobilized(void);
    virtual enum EStateResult OnLostAggro(void);
    virtual enum EStateResult OnMetaControllerAggro(void);
    virtual enum EStateResult OnMetaControllerAlert(void);
    virtual enum EStateResult OnMetaControllerConversation(void);
    virtual enum EStateResult OnMetaControllerFlee(void);
    virtual enum EStateResult OnMetaControllerFollow(void);
    virtual enum EStateResult OnMetaControllerIdle(void);
    virtual enum EStateResult OnMetaControllerPatrol(void);
    virtual enum EStateResult OnMetaControllerReturn(void);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual enum EStateResult OnNoReachableEnemy(void);
    virtual enum EStateResult OnNoTarget(void);
    virtual enum EStateResult OnNoUnreachableEnemy(void);
    virtual enum EStateResult OnOutOfChaseRange(void);
    virtual enum EStateResult OnOutOfHabitat(void);
    virtual enum EStateResult OnOwnerAggression(void);
    virtual enum EStateResult OnOwnerNegativeEffect(void);
    virtual enum EStateResult OnOwnerPositiveEffect(void);
    virtual enum EStateResult OnPositiveEffect(void);
    virtual enum EStateResult OnReachableEnemy(void);
    virtual enum EStateResult OnSkillAimed(void);
    virtual enum EStateResult OnSkillFinished(void);
    virtual enum EStateResult OnSkillReady(void);
    virtual enum EStateResult OnSleepy(void);
    virtual enum EStateResult OnStateAborted(void);
    virtual enum EStateResult OnStateError(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnTarget(void);
    virtual enum EStateResult OnTargetChanged(void);
    virtual enum EStateResult OnTargetMoved(void);
    virtual enum EStateResult OnTimer(void);
    virtual enum EStateResult OnTrigger(void);
    virtual enum EStateResult OnUnreachable(void);
    virtual enum EStateResult OnUntrigger(void);
    virtual enum EStateResult OnAllyDetected(void);
    virtual enum EStateResult OnAllyLost(void);
    virtual enum EStateResult OnArrived(void);
    virtual enum EStateResult OnAggro(void);
    virtual class FString GetDebugDescription(void)const ;
    virtual unsigned short const * GetDebugInfo(void);
    virtual class FString GetResultDescription(enum EStateResult);
    UAIState(class UAIState const &);
    UAIState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIState & operator=(class UAIState const &);
    void AdjustHormone(unsigned short const *,float);
    void Despawn(void);
    class AGame_NPCPawn * GetPawn(void)const ;
    bool HasAggro(void);
    void HealPawn(float);
    static void CDECL InternalConstructor(void *);
    static enum EFilterResult CDECL IsAThreatFilter(class AGame_Pawn *,class AActor *);
    static enum EFilterResult CDECL IsAllyFilter(class AGame_Pawn *,class AActor *);
    static enum EFilterResult CDECL IsEnemyFilter(class AGame_Pawn *,class AActor *);
    static enum EFilterResult CDECL IsInTeamFilter(class AGame_Pawn *,class AActor *);
    static enum EFilterResult CDECL IsLivingEnemyFilter(class AGame_Pawn *,class AActor *);
    static enum EFilterResult CDECL IsSameTaxonomyFilter(class AGame_Pawn *,class AActor *);
    static enum EFilterResult CDECL IsTeamLeaderFilter(class AGame_Pawn *,class AActor *);
    bool RandomEmote(int,enum EContentEmote * const,float * const);
    static class UClass * CDECL StaticClass(void);
    void execInitialize(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UAIState,0,execInitialize)


//------------------------------------------------------------------------------
//  AIStateMachine
//------------------------------------------------------------------------------

//  AIStateMachine.StateSignal 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct UAIStateMachine_eventStateSignal_Parms {
  BYTE signal;  // 0 80 CPF_Parm
  BYTE ReturnValue;  // 1 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UAIStateMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIStateMachine : public UAIState {
  public:
    class UAIState* mCurrentState;  // 48 0
    class UAIState* mAbortedState;  // 4C 0
    class UAIState* mNextState;  // 50 0
    BITFIELD mDebugging : 1;  // 54 0
    virtual ~UAIStateMachine(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Deinitialize(void);
    virtual enum EStateResult Tick(float);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult StateSignal(enum EStateSignal);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnStateError(void);
    virtual enum EStateResult OnStateAborted(void);
    virtual enum EStateResult OnMetaControllerIdle(void);
    virtual enum EStateResult OnMetaControllerAlert(void);
    virtual enum EStateResult OnMetaControllerAggro(void);
    virtual enum EStateResult OnMetaControllerReturn(void);
    virtual enum EStateResult OnMetaControllerFlee(void);
    virtual enum EStateResult OnMetaControllerPatrol(void);
    virtual enum EStateResult OnMetaControllerFollow(void);
    virtual enum EStateResult OnMetaControllerConversation(void);
    virtual void InitializeMachine(class AGame_AIController *,class UClass *);
    virtual enum EStateResult HandleStateResult(class UAIState *,enum EStateResult);
    virtual class UAIState * CreateIdle(void);
    virtual void StateChange(class UAIState *);
    UAIStateMachine(class UAIStateMachine const &);
    UAIStateMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIStateMachine & operator=(class UAIStateMachine const &);
    bool InState(class UClass *);
    static void CDECL InternalConstructor(void *);
    static void CDECL ProfileFrame(float);
    void ProfileMachine(class UAIStateMachine *,float);
    void StartCurrentState(void);
    static class UClass * CDECL StaticClass(void);
    unsigned char eventStateSignal(unsigned char);
    void execStateSignal(struct FFrame &,void * const);
    static float lastProfileTime;
    static class std::map<class UClass *,int,struct std::less<class UClass *>,class std::allocator<struct std::pair<class UClass * const,int> > > machineCount;
    static class std::map<class UClass *,float,struct std::less<class UClass *>,class std::allocator<struct std::pair<class UClass * const,float> > > machineTime;
    static float profileTimeOut;
    static class std::map<class UClass *,int,struct std::less<class UClass *>,class std::allocator<struct std::pair<class UClass * const,int> > > stateCount;
    static class std::map<class UClass *,float,struct std::less<class UClass *>,class std::allocator<struct std::pair<class UClass * const,float> > > stateTime;
  protected:
    void DestroyState(class UAIState * &);
    void EndState(class UAIState * &);
    bool LastAttackerValid(void);
    void UpdateDebugInfo(bool);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UAIStateMachine,0,execStateSignal)


//------------------------------------------------------------------------------
//  AIWakingMachine
//------------------------------------------------------------------------------

// UAIWakingMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIWakingMachine : public UAIStateMachine {
  public:
    virtual ~UAIWakingMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnReachableEnemy(void);
    virtual enum EStateResult OnConversation(void);
    virtual enum EStateResult OnOutOfChaseRange(void);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual class UAIState * CreateIdle(void);
    UAIWakingMachine(class UAIWakingMachine const &);
    UAIWakingMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIWakingMachine & operator=(class UAIWakingMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIPassiveMachine
//------------------------------------------------------------------------------

// UAIPassiveMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIPassiveMachine : public UAIStateMachine {
  public:
    virtual ~UAIPassiveMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnConversation(void);
    UAIPassiveMachine(class UAIPassiveMachine const &);
    UAIPassiveMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIPassiveMachine & operator=(class UAIPassiveMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIKillingMachine
//------------------------------------------------------------------------------

// UAIKillingMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIKillingMachine : public UAIStateMachine {
  public:
    virtual ~UAIKillingMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnReachableEnemy(void);
    virtual enum EStateResult OnConversation(void);
    virtual enum EStateResult OnOutOfChaseRange(void);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual class UAIState * CreateIdle(void);
    UAIKillingMachine(class UAIKillingMachine const &);
    UAIKillingMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIKillingMachine & operator=(class UAIKillingMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIAggressiveMachine
//------------------------------------------------------------------------------

// UAIAggressiveMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIAggressiveMachine : public UAIStateMachine {
  public:
    virtual ~UAIAggressiveMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual enum EStateResult OnConversation(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual class UAIState * CreateIdle(void);
    UAIAggressiveMachine(class UAIAggressiveMachine const &);
    UAIAggressiveMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIAggressiveMachine & operator=(class UAIAggressiveMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIPetMachine
//------------------------------------------------------------------------------

// UAIPetMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIPetMachine : public UAIStateMachine {
  public:
    virtual ~UAIPetMachine(void);
    virtual unsigned int GetCPPSize(void);
  protected:
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnEnemiesLost(void);
    virtual enum EStateResult OnArrived(void);
    virtual enum EStateResult OnMetaControllerIdle(void);
    virtual enum EStateResult OnMetaControllerAggro(void);
    virtual enum EStateResult OnMetaControllerReturn(void);
    virtual enum EStateResult OnMetaControllerFollow(void);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual enum EStateResult OnOwnerNegativeEffect(void);
    virtual enum EStateResult OnOwnerAggression(void);
    virtual class UAIState * CreateIdle(void);
  public:
    UAIPetMachine(class UAIPetMachine const &);
    UAIPetMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIPetMachine & operator=(class UAIPetMachine const &);
    enum EPetAttackState GetAttackState(void);
    enum EPetMoveState GetMoveState(void);
    class AGame_PetPawn * GetPet(void)const ;
    class AGame_Pawn * GetPetMaster(void)const ;
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIKidMachine
//------------------------------------------------------------------------------

// UAIKidMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIKidMachine : public UAIStateMachine {
  public:
    virtual ~UAIKidMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual class UAIState * CreateIdle(void);
    UAIKidMachine(class UAIKidMachine const &);
    UAIKidMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIKidMachine & operator=(class UAIKidMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AITestMachine
//------------------------------------------------------------------------------

// UAITestMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAITestMachine : public UAIStateMachine {
  public:
    virtual ~UAITestMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnTarget(void);
    virtual enum EStateResult OnOutOfHabitat(void);
    virtual class UAIState * CreateIdle(void);
    UAITestMachine(class UAITestMachine const &);
    UAITestMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAITestMachine & operator=(class UAITestMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIPredatorMachine
//------------------------------------------------------------------------------

// UAIPredatorMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIPredatorMachine : public UAIStateMachine {
  public:
    virtual ~UAIPredatorMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnOutOfHabitat(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnReachableEnemy(void);
    virtual enum EStateResult OnOutOfChaseRange(void);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual enum EStateResult OnBored(void);
    virtual enum EStateResult OnAggro(void);
    virtual enum EStateResult OnFear(void);
    virtual enum EStateResult OnDesolate(void);
    virtual class UAIState * CreateIdle(void);
    UAIPredatorMachine(class UAIPredatorMachine const &);
    UAIPredatorMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIPredatorMachine & operator=(class UAIPredatorMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AILeaderMachine
//------------------------------------------------------------------------------

// UAILeaderMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAILeaderMachine : public UAIStateMachine {
  public:
    virtual ~UAILeaderMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnReachableEnemy(void);
    virtual enum EStateResult OnConversation(void);
    virtual enum EStateResult OnOutOfChaseRange(void);
    virtual enum EStateResult OnMetaControllerAlert(void);
    virtual enum EStateResult OnMetaControllerAggro(void);
    virtual class UAIState * CreateIdle(void);
    UAILeaderMachine(class UAILeaderMachine const &);
    UAILeaderMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAILeaderMachine & operator=(class UAILeaderMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIHowlerMachine
//------------------------------------------------------------------------------

// UAIHowlerMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIHowlerMachine : public UAIStateMachine {
  public:
    virtual ~UAIHowlerMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnOutOfChaseRange(void);
    virtual class UAIState * CreateIdle(void);
    UAIHowlerMachine(class UAIHowlerMachine const &);
    UAIHowlerMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIHowlerMachine & operator=(class UAIHowlerMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIGruntMachine
//------------------------------------------------------------------------------

// UAIGruntMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIGruntMachine : public UAIStateMachine {
  public:
    virtual ~UAIGruntMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnReachableEnemy(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnMetaControllerIdle(void);
    virtual enum EStateResult OnMetaControllerAlert(void);
    virtual enum EStateResult OnMetaControllerAggro(void);
    virtual enum EStateResult OnMetaControllerReturn(void);
    virtual enum EStateResult OnMetaControllerFlee(void);
    virtual enum EStateResult OnMetaControllerPatrol(void);
    virtual class UAIState * CreateIdle(void);
    UAIGruntMachine(class UAIGruntMachine const &);
    UAIGruntMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIGruntMachine & operator=(class UAIGruntMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIDroneMachine
//------------------------------------------------------------------------------

// UAIDroneMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIDroneMachine : public UAIStateMachine {
  public:
    virtual ~UAIDroneMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnMetaControllerIdle(void);
    virtual enum EStateResult OnMetaControllerAlert(void);
    virtual enum EStateResult OnMetaControllerAggro(void);
    virtual enum EStateResult OnMetaControllerReturn(void);
    UAIDroneMachine(class UAIDroneMachine const &);
    UAIDroneMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIDroneMachine & operator=(class UAIDroneMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AICritterMachine
//------------------------------------------------------------------------------

// UAICritterMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAICritterMachine : public UAIStateMachine {
  public:
    virtual ~UAICritterMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnOutOfHabitat(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual enum EStateResult OnBored(void);
    virtual enum EStateResult OnFear(void);
    virtual enum EStateResult OnDesolate(void);
    virtual class UAIState * CreateIdle(void);
    UAICritterMachine(class UAICritterMachine const &);
    UAICritterMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAICritterMachine & operator=(class UAICritterMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AICitizenMachine
//------------------------------------------------------------------------------

// UAICitizenMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAICitizenMachine : public UAIStateMachine {
  public:
    virtual ~UAICitizenMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnConversation(void);
    virtual enum EStateResult OnNegativeEffect(void);
    UAICitizenMachine(class UAICitizenMachine const &);
    UAICitizenMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAICitizenMachine & operator=(class UAICitizenMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIBossMachine
//------------------------------------------------------------------------------

// UAIBossMachine 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIBossMachine : public UAIStateMachine {
  public:
    virtual ~UAIBossMachine(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnStateSuccess(void);
    virtual enum EStateResult OnStateFailure(void);
    virtual enum EStateResult OnReachableEnemy(void);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual class UAIState * CreateIdle(void);
    UAIBossMachine(class UAIBossMachine const &);
    UAIBossMachine(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIBossMachine & operator=(class UAIBossMachine const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIAlertState
//------------------------------------------------------------------------------

// UAIAlertState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIAlertState : public UAIState {
  public:
    BITFIELD mEnemy : 1;  // 48 0
    class FString mDebugInfo;  // 4C 400000 CPF_NeedCtorLink
    FLOAT mAlertDuration;  // 54 2000000 CPF_EditorData
    virtual ~UAIAlertState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnTargetMoved(void);
    virtual enum EStateResult OnTarget(void);
    virtual enum EStateResult OnNoTarget(void);
    virtual unsigned short const * GetDebugInfo(void);
    UAIAlertState(class UAIAlertState const &);
    UAIAlertState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIAlertState & operator=(class UAIAlertState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIWakingAlertState
//------------------------------------------------------------------------------

// UAIWakingAlertState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIWakingAlertState : public UAIAlertState {
  public:
    virtual ~UAIWakingAlertState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult StateTick(float);
    UAIWakingAlertState(class UAIWakingAlertState const &);
    UAIWakingAlertState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIWakingAlertState & operator=(class UAIWakingAlertState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIRetreatState
//------------------------------------------------------------------------------

// UAIRetreatState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIRetreatState : public UAIState {
  public:
    virtual ~UAIRetreatState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnImmoblized(void);
    virtual enum EStateResult OnUnreachable(void);
    virtual unsigned short const * GetDebugInfo(void);
    UAIRetreatState(class UAIRetreatState const &);
    UAIRetreatState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIRetreatState & operator=(class UAIRetreatState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AINormalRetreatState
//------------------------------------------------------------------------------

// UAINormalRetreatState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAINormalRetreatState : public UAIRetreatState {
  public:
    virtual ~UAINormalRetreatState(void);
    virtual unsigned int GetCPPSize(void);
    virtual enum EStateResult OnNoUnreachableEnemy(void);
    virtual enum EStateResult OnArrived(void);
    UAINormalRetreatState(class UAINormalRetreatState const &);
    UAINormalRetreatState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAINormalRetreatState & operator=(class UAINormalRetreatState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIPatrolState
//------------------------------------------------------------------------------

// UAIPatrolState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIPatrolState : public UAIState {
  public:
    virtual ~UAIPatrolState(void);
    virtual unsigned int GetCPPSize(void);
    UAIPatrolState(class UAIPatrolState const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIPatrolState & operator=(class UAIPatrolState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UAIPatrolState(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AINormalPatrolState
//------------------------------------------------------------------------------

// UAINormalPatrolState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAINormalPatrolState : public UAIPatrolState {
  public:
    virtual ~UAINormalPatrolState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnBlocked(void);
    virtual enum EStateResult OnArrived(void);
    virtual enum EStateResult OnUnreachable(void);
    UAINormalPatrolState(class UAINormalPatrolState const &);
    UAINormalPatrolState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAINormalPatrolState & operator=(class UAINormalPatrolState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIIdleState
//------------------------------------------------------------------------------

// UAIIdleState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIIdleState : public UAIState {
  public:
    virtual ~UAIIdleState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual unsigned short const * GetDebugInfo(void);
    UAIIdleState(class UAIIdleState const &);
    UAIIdleState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIIdleState & operator=(class UAIIdleState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIBossIdleState
//------------------------------------------------------------------------------

// UAIBossIdleState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIBossIdleState : public UAIIdleState {
  public:
    virtual ~UAIBossIdleState(void);
    virtual unsigned int GetCPPSize(void);
    UAIBossIdleState(class UAIBossIdleState const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIBossIdleState & operator=(class UAIBossIdleState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UAIBossIdleState(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIWanderState
//------------------------------------------------------------------------------

// UAIWanderState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIWanderState : public UAIState {
  public:
    virtual ~UAIWanderState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnArrived(void);
    virtual enum EStateResult OnUnreachable(void);
    virtual enum EStateResult OnBlocked(void);
    virtual enum EStateResult OnBored(void);
    virtual unsigned short const * GetDebugInfo(void);
    UAIWanderState(class UAIWanderState const &);
    UAIWanderState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIWanderState & operator=(class UAIWanderState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    void SearchSmell(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIReturnState
//------------------------------------------------------------------------------

// UAIReturnState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIReturnState : public UAIState {
  public:
    BITFIELD mError : 1;  // 48 2000000 CPF_EditorData
    virtual ~UAIReturnState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnArrived(void);
    virtual enum EStateResult OnImmoblized(void);
    virtual enum EStateResult OnUnreachable(void);
    virtual unsigned short const * GetDebugInfo(void);
    UAIReturnState(class UAIReturnState const &);
    UAIReturnState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIReturnState & operator=(class UAIReturnState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIFollowState
//------------------------------------------------------------------------------

// UAIFollowState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIFollowState : public UAIState {
  public:
    FLOAT FollowDistance;  // 48 0
    virtual ~UAIFollowState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult OnArrived(void);
    virtual enum EStateResult OnTarget(void);
    virtual enum EStateResult OnTargetChanged(void);
    virtual enum EStateResult OnTargetMoved(void);
    virtual enum EStateResult OnNoTarget(void);
    virtual enum EStateResult OnUnreachable(void);
    UAIFollowState(class UAIFollowState const &);
    UAIFollowState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIFollowState & operator=(class UAIFollowState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIFleeState
//------------------------------------------------------------------------------

// UAIFleeState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIFleeState : public UAIState {
  public:
    virtual ~UAIFleeState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnEnemyDetected(void);
    virtual enum EStateResult OnArrived(void);
    virtual enum EStateResult OnUnreachable(void);
    virtual enum EStateResult OnImmoblized(void);
    UAIFleeState(class UAIFleeState const &);
    UAIFleeState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIFleeState & operator=(class UAIFleeState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIFightState
//------------------------------------------------------------------------------

// UAIFightState 4017 ( CLASS_Abstract CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UAIFightState : public UAIState {
  public:
    BYTE mTerminatingState;  // 48 2000000 CPF_EditorData
    class FString mDebugInfo;  // 4C 400000 CPF_NeedCtorLink
    class FString mOldDebugInfo;  // 54 400000 CPF_NeedCtorLink
    class FString mDebugAction;  // 5C 400000 CPF_NeedCtorLink
    class FString mDebugSignal;  // 64 400000 CPF_NeedCtorLink
    virtual ~UAIFightState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnSkillFinished(void);
    virtual enum EStateResult OnSkillReady(void);
    virtual enum EStateResult OnSkillAimed(void);
    virtual enum EStateResult OnTargetChanged(void);
    virtual enum EStateResult OnTargetMoved(void);
    virtual enum EStateResult OnTarget(void);
    virtual enum EStateResult OnNoTarget(void);
    virtual enum EStateResult OnArrived(void);
    virtual enum EStateResult OnUnreachable(void);
    virtual enum EStateResult OnBlocked(void);
  protected:
    virtual unsigned short const * GetDebugInfo(void);
  public:
    virtual enum EStateResult FightTick(float);
  protected:
    virtual void UpdateDebugInfo(void);
  public:
    UAIFightState(class UAIFightState const &);
    UAIFightState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIFightState & operator=(class UAIFightState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    void Move(void);
    bool PerformSkill(class AGame_Pawn *,class UFSkill_Type *,class FVector,float);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AICowerState
//------------------------------------------------------------------------------

// UAICowerState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAICowerState : public UAIState {
  public:
    virtual ~UAICowerState(void);
    virtual unsigned int GetCPPSize(void);
    virtual enum EStateResult OnLostAggro(void);
    UAICowerState(class UAICowerState const &);
    UAICowerState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAICowerState & operator=(class UAICowerState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIPetIdleState
//------------------------------------------------------------------------------

// UAIPetIdleState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIPetIdleState : public UAIIdleState {
  public:
    virtual ~UAIPetIdleState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    UAIPetIdleState(class UAIPetIdleState const &);
    UAIPetIdleState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIPetIdleState & operator=(class UAIPetIdleState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIPetLostState
//------------------------------------------------------------------------------

// UAIPetLostState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIPetLostState : public UAIPetIdleState {
  public:
    virtual ~UAIPetLostState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnTarget(void);
    virtual enum EStateResult OnTargetChanged(void);
    virtual enum EStateResult OnTargetMoved(void);
    UAIPetLostState(class UAIPetLostState const &);
    UAIPetLostState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIPetLostState & operator=(class UAIPetLostState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIPetFollowState
//------------------------------------------------------------------------------

// UAIPetFollowState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIPetFollowState : public UAIFollowState {
  public:
    virtual ~UAIPetFollowState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    UAIPetFollowState(class UAIPetFollowState const &);
    UAIPetFollowState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIPetFollowState & operator=(class UAIPetFollowState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIBattleState
//------------------------------------------------------------------------------

// UAIBattleState 4016 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UAIBattleState : public UAIFightState {
  public:
    virtual ~UAIBattleState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnEnemiesLost(void);
    virtual enum EStateResult OnNoReachableEnemy(void);
    virtual enum EStateResult FightTick(float);
    UAIBattleState(class UAIBattleState const &);
    UAIBattleState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIBattleState & operator=(class UAIBattleState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    class FString GetDebugDescription(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIPetBattleState
//------------------------------------------------------------------------------

// UAIPetBattleState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIPetBattleState : public UAIBattleState {
  public:
    virtual ~UAIPetBattleState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    UAIPetBattleState(class UAIPetBattleState const &);
    UAIPetBattleState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIPetBattleState & operator=(class UAIPetBattleState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AISubmergeState
//------------------------------------------------------------------------------

// UAISubmergeState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAISubmergeState : public UAIIdleState {
  public:
    FLOAT mTimer;  // 48 0
    virtual ~UAISubmergeState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnEnemyDetected(void);
    UAISubmergeState(class UAISubmergeState const &);
    UAISubmergeState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAISubmergeState & operator=(class UAISubmergeState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIAnimalIdleState
//------------------------------------------------------------------------------

// UAIAnimalIdleState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIAnimalIdleState : public UAIIdleState {
  public:
    virtual ~UAIAnimalIdleState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult StateTick(float);
    UAIAnimalIdleState(class UAIAnimalIdleState const &);
    UAIAnimalIdleState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIAnimalIdleState & operator=(class UAIAnimalIdleState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AICombatState
//------------------------------------------------------------------------------

// UAICombatState 4017 ( CLASS_Abstract CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UAICombatState : public UAIFightState {
  public:
    virtual ~UAICombatState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual enum EStateResult OnAggro(void);
    virtual enum EStateResult OnFear(void);
    virtual enum EStateResult FightTick(float);
    UAICombatState(class UAICombatState const &);
    UAICombatState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAICombatState & operator=(class UAICombatState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AILeaderCombatState
//------------------------------------------------------------------------------

// UAILeaderCombatState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAILeaderCombatState : public UAICombatState {
  public:
    FLOAT mCommandTimer;  // 6C 0
    virtual ~UAILeaderCombatState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult OnEnemiesLost(void);
    virtual enum EStateResult OnNoReachableEnemy(void);
    virtual enum EStateResult FightTick(float);
    UAILeaderCombatState(class UAILeaderCombatState const &);
    UAILeaderCombatState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAILeaderCombatState & operator=(class UAILeaderCombatState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AILeaderAlertState
//------------------------------------------------------------------------------

// UAILeaderAlertState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAILeaderAlertState : public UAIAlertState {
  public:
    BITFIELD mWarned : 1;  // 58 0
    virtual ~UAILeaderAlertState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult OnAggro(void);
    UAILeaderAlertState(class UAILeaderAlertState const &);
    UAILeaderAlertState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAILeaderAlertState & operator=(class UAILeaderAlertState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIKillingCombatState
//------------------------------------------------------------------------------

// UAIKillingCombatState 4016 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UAIKillingCombatState : public UAIFightState {
  public:
    virtual ~UAIKillingCombatState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult OnEnemiesLost(void);
    virtual enum EStateResult OnNoReachableEnemy(void);
    UAIKillingCombatState(class UAIKillingCombatState const &);
    UAIKillingCombatState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIKillingCombatState & operator=(class UAIKillingCombatState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIHumanoidRetreatState
//------------------------------------------------------------------------------

// UAIHumanoidRetreatState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIHumanoidRetreatState : public UAIRetreatState {
  public:
    virtual ~UAIHumanoidRetreatState(void);
    virtual unsigned int GetCPPSize(void);
    UAIHumanoidRetreatState(class UAIHumanoidRetreatState const &);
    UAIHumanoidRetreatState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIHumanoidRetreatState & operator=(class UAIHumanoidRetreatState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIHumanoidIdleState
//------------------------------------------------------------------------------

// UAIHumanoidIdleState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIHumanoidIdleState : public UAIIdleState {
  public:
    virtual ~UAIHumanoidIdleState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnBored(void);
    virtual void IdleEmote(bool);
    UAIHumanoidIdleState(class UAIHumanoidIdleState const &);
    UAIHumanoidIdleState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIHumanoidIdleState & operator=(class UAIHumanoidIdleState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIHumanoidCowerState
//------------------------------------------------------------------------------

// UAIHumanoidCowerState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIHumanoidCowerState : public UAICowerState {
  public:
    virtual ~UAIHumanoidCowerState(void);
    virtual unsigned int GetCPPSize(void);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult OnNegativeEffect(void);
    virtual enum EStateResult OnFear(void);
    virtual unsigned short const * GetDebugInfo(void);
    UAIHumanoidCowerState(class UAIHumanoidCowerState const &);
    UAIHumanoidCowerState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIHumanoidCowerState & operator=(class UAIHumanoidCowerState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIGruntPatrolState
//------------------------------------------------------------------------------

// UAIGruntPatrolState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIGruntPatrolState : public UAIPatrolState {
  public:
    FLOAT FollowDistance;  // 48 0
    virtual ~UAIGruntPatrolState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult OnTarget(void);
    virtual enum EStateResult OnTargetChanged(void);
    virtual enum EStateResult OnTargetMoved(void);
    virtual enum EStateResult OnNoTarget(void);
    virtual enum EStateResult OnUnreachable(void);
    UAIGruntPatrolState(class UAIGruntPatrolState const &);
    UAIGruntPatrolState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIGruntPatrolState & operator=(class UAIGruntPatrolState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIGruntIdleState
//------------------------------------------------------------------------------

// UAIGruntIdleState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIGruntIdleState : public UAIHumanoidIdleState {
  public:
    virtual ~UAIGruntIdleState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual void IdleEmote(bool);
    UAIGruntIdleState(class UAIGruntIdleState const &);
    UAIGruntIdleState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIGruntIdleState & operator=(class UAIGruntIdleState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIGruntCombatState
//------------------------------------------------------------------------------

// UAIGruntCombatState 4016 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UAIGruntCombatState : public UAICombatState {
  public:
    virtual ~UAIGruntCombatState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    virtual enum EStateResult OnEnemiesLost(void);
    virtual enum EStateResult OnNoReachableEnemy(void);
    virtual enum EStateResult FightTick(float);
    UAIGruntCombatState(class UAIGruntCombatState const &);
    UAIGruntCombatState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIGruntCombatState & operator=(class UAIGruntCombatState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIGruntAlertState
//------------------------------------------------------------------------------

// UAIGruntAlertState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIGruntAlertState : public UAIAlertState {
  public:
    virtual ~UAIGruntAlertState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual void Deinitialize(void);
    UAIGruntAlertState(class UAIGruntAlertState const &);
    UAIGruntAlertState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIGruntAlertState & operator=(class UAIGruntAlertState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AICoverState
//------------------------------------------------------------------------------

// UAICoverState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAICoverState : public UAICowerState {
  public:
    virtual ~UAICoverState(void);
    virtual unsigned int GetCPPSize(void);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult OnAggro(void);
    virtual unsigned short const * GetDebugInfo(void);
    UAICoverState(class UAICoverState const &);
    UAICoverState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAICoverState & operator=(class UAICoverState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  AIConversationState
//------------------------------------------------------------------------------

// UAIConversationState 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UAIConversationState : public UAIState {
  public:
    virtual ~UAIConversationState(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(class AGame_AIController *,class UAIState *);
    virtual enum EStateResult StateTick(float);
    virtual enum EStateResult AbortTick(float);
    virtual enum EStateResult OnConversation(void);
    virtual enum EStateResult OnEndConversation(void);
    virtual unsigned short const * GetDebugInfo(void);
    UAIConversationState(class UAIConversationState const &);
    UAIConversationState(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UAIConversationState & operator=(class UAIConversationState const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    class UConversationComponent * GetConversationComponent(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Game_AIController
//------------------------------------------------------------------------------

#define UCONST_Game_AIController_cSpawnInTimer 2.0f
// FAITimerStruct 0 ( )
struct DLL_IMPORT FAITimerStruct {
  public:
    class AActor* Instigator;  // 0 0
    FLOAT Time;  // 4 0
    FLOAT Timeout;  // 8 0
    FName Tag;  // C 0
    FAITimerStruct(void);
    struct FAITimerStruct & operator=(struct FAITimerStruct const &);
};

//  Game_AIController.HasMetaController 20002 0 ( FUNC_Defined FUNC_Public )
struct AGame_AIController_execHasMetaController_Parms {
  class ANPC_AI* aController;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.MetaControllerMessage 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execMetaControllerMessage_Parms {
  BYTE aMessage;  // 0 80 CPF_Parm
  class AActor* aCollaborator;  // 4 90 CPF_OptionalParm CPF_Parm
  FName aTag;  // 8 90 CPF_OptionalParm CPF_Parm
  class UObject* aContext;  // C 90 CPF_OptionalParm CPF_Parm
  FLOAT aValue;  // 10 90 CPF_OptionalParm CPF_Parm
  class FVector aLocation;  // 14 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 20 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.RemoveMetaController 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execRemoveMetaController_Parms {
  class AAI_MetaController* aMetaController;  // 0 80 CPF_Parm
};


//  Game_AIController.AddMetaController 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execAddMetaController_Parms {
  class AAI_MetaController* aMetaController;  // 0 80 CPF_Parm
  class AAI_MetaController* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.IsAIPausedBy 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execIsAIPausedBy_Parms {
  class UObject* aPauser;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.IsAIPaused 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execIsAIPaused_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.ContinueAI 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execContinueAI_Parms {
  class UObject* aPauser;  // 0 80 CPF_Parm
};


//  Game_AIController.PauseAI 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execPauseAI_Parms {
  class UObject* aPauser;  // 0 80 CPF_Parm
};


//  Game_AIController.GetActiveAIState 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execGetActiveAIState_Parms {
  class UAIState* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.SetStateMachine 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execSetStateMachine_Parms {
  class UAIStateMachine* aMachine;  // 0 80 CPF_Parm
  class UAIStateMachine* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.RemoveTimer 20002 0 ( FUNC_Defined FUNC_Public )
struct AGame_AIController_execRemoveTimer_Parms {
  FName aTag;  // 0 80 CPF_Parm
};


//  Game_AIController.SetTimerTimeout 20002 0 ( FUNC_Defined FUNC_Public )
struct AGame_AIController_execSetTimerTimeout_Parms {
  class AActor* aInstigator;  // 0 80 CPF_Parm
  FName aTag;  // 4 80 CPF_Parm
  FLOAT aDuration;  // 8 80 CPF_Parm
};


//  Game_AIController.Trigger 20002 0 ( FUNC_Defined FUNC_Public )
struct AGame_AIController_execTrigger_Parms {
  class AActor* aTrigger;  // 0 80 CPF_Parm
  class APawn* anInstigator;  // 4 80 CPF_Parm
};


//  Game_AIController.GetFaction 20002 0 ( FUNC_Defined FUNC_Public )
struct AGame_AIController_execGetFaction_Parms {
  class UNPC_Taxonomy* ReturnValue;  // 0 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  Game_AIController.SetControlPoint 20002 0 ( FUNC_Defined FUNC_Public )
struct AGame_AIController_execSetControlPoint_Parms {
  class AAIPoint* aControlPoint;  // 0 80 CPF_Parm
};


//  Game_AIController.GetHomeLocation 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct AGame_AIController_execGetHomeLocation_Parms {
  class FVector ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.SetHomeLocation 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct AGame_AIController_execSetHomeLocation_Parms {
  class FVector aLocation;  // 0 80 CPF_Parm
  BITFIELD aForce : 1;  // C 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.SetLineOfSightRange 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct AGame_AIController_execSetLineOfSightRange_Parms {
  FLOAT aLineOfSightRange;  // 0 80 CPF_Parm
};


//  Game_AIController.GetVisualRange 20002 0 ( FUNC_Defined FUNC_Public )
struct AGame_AIController_execGetVisualRange_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.SetVisualRange 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct AGame_AIController_execSetVisualRange_Parms {
  FLOAT aVisualRange;  // 0 80 CPF_Parm
};


//  Game_AIController.sv_OnAttack 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventsv_OnAttack_Parms {
  class AGame_Pawn* aPawn;  // 0 80 CPF_Parm
  class UFSkill_EffectClass* aEffect;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  BITFIELD WasNegativeEffect : 1;  // 8 80 CPF_Parm
  FLOAT aValue;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.sv_OnOwnerAttack 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventsv_OnOwnerAttack_Parms {
  BITFIELD WasNegativeEffect : 1;  // 0 80 CPF_Parm
};


//  Game_AIController.sv_OnOwnerAggression 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventsv_OnOwnerAggression_Parms {
};


//  Game_AIController.sv_OnDamage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventsv_OnDamage_Parms {
  class AGame_Pawn* anEnemy;  // 0 80 CPF_Parm
  INT aDamage;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.SpawnedIn 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct AGame_AIController_execSpawnedIn_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_AIController.StateSignal 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_AIController_execStateSignal_Parms {
  BYTE aSignal;  // 0 80 CPF_Parm
};


//  Game_AIController.cl_OnShutdown 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventcl_OnShutdown_Parms {
};


//  Game_AIController.cl_OnTick 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventcl_OnTick_Parms {
  FLOAT DeltaTime;  // 0 80 CPF_Parm
};


//  Game_AIController.cl_OnInit 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventcl_OnInit_Parms {
};


//  Game_AIController.OnCreateComponents 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventOnCreateComponents_Parms {
};


//  Game_AIController.sv_OnShutdown 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventsv_OnShutdown_Parms {
};


//  Game_AIController.sv_InitAI 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct AGame_AIController_eventsv_InitAI_Parms {
};


//  Game_AIController.FollowFunction 120000 0 ( FUNC_Public FUNC_Delegate )
struct AGame_AIController_execFollowFunction_Parms {
  class AActor* aActor;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// AGame_AIController 4016 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT AGame_AIController : public AGame_NPCController {
  public:
    class UMetaControllerManagerComponent* mMetaControl;  // 928 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    class UMovementComponent* mMovement;  // 92C 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    class UTargetComponent* mTargeting;  // 930 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    class UHormoneComponent* mHypothalamus;  // 934 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    FLOAT ChaseRange;  // 938 0
    FLOAT VisualRange;  // 93C 0
    FLOAT LineOfSightRange;  // 940 0
    FLOAT ThreatRange;  // 944 0
    FLOAT FollowRange;  // 948 0
    FLOAT AggressionFactor;  // 94C 0
    FLOAT FearFactor;  // 950 0
    FLOAT SocialFactor;  // 954 0
    FLOAT BoredomFactor;  // 958 0
    class FVector HomeLocation;  // 95C 0
    class ANPC_Habitat* Habitat;  // 968 0
    class AAIPoint* ControlPoint;  // 96C 0
    TArray<struct FAITimerStruct> mTimer;  // 970 400000 CPF_NeedCtorLink
    FLOAT mSpawnInTimer;  // 97C 0
    class UAIStateMachine* mAbortedMachine;  // 980 0
    class UAIStateMachine* mStateMachine;  // 984 0
    class UClass* mMachineClass;  // 988 0
    BYTE mTickResult;  // 98C 0
    BITFIELD bProfileStateMachines : 1;  // 990 4000 CPF_Config
    BITFIELD bProfileMovementModes : 1;  // 990 4000 CPF_Config
    TArray<class UObject*> mPausers;  // 994 400000 CPF_NeedCtorLink
    class AGame_Pawn* mLastAttackPawn;  // 9A0 2000000 CPF_EditorData
    class UFSkill_EffectClass* mLastAttackEffect;  // 9A4 6400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditorData CPF_EditInline
    struct FScriptDelegate __FollowFunction__Delegate;  // 9A8 400000 CPF_NeedCtorLink
    virtual ~AGame_AIController(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual class APlayerController * GetAPlayerController(void);
    virtual int AcceptNearbyPath(class AActor *);
    virtual void sv_OnInit(void);
    virtual bool IsAlly(class AGame_Pawn *);
    virtual bool IsHostile(class AGame_Pawn *,int &);
    virtual bool OnWeaponSwapped(enum ECombatMode);
    virtual bool OnSkillFinished(class UFSkill_Type *);
    virtual bool OnPhysicsChange(enum EPhysics);
    virtual void LostAggro(void);
    virtual bool VisibleForPawn(class AGame_Pawn *);
    virtual void Despawn(void);
    virtual class FString GetAIDebugInfo(void);
    virtual bool SpawnedIn(void);
    virtual bool SetHomeLocation(class FVector,bool);
    virtual class FVector GetHomeLocation(void);
    virtual bool CheckChaseRange(class FVector);
    virtual bool CheckHabitatRange(class FVector);
    AGame_AIController(class AGame_AIController const &);
    AGame_AIController(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AGame_AIController & operator=(class AGame_AIController const &);
    class AAI_MetaController * AddMetaController(class AAI_MetaController *);
    void ContinueAI(class UObject *);
    void DestroyAI(void);
    class UAIState * GetActiveAIState(void);
    static void CDECL InternalConstructor(void *);
    bool IsAIPaused(void);
    bool IsAIPausedBy(class UObject *);
    int MetaControllerMessage(enum ControllerMessages,class AActor *,class FName,class UObject *,float,class FVector);
    void PauseAI(class UObject *);
    void RemoveMetaController(class AAI_MetaController *);
    void SetLineOfSightRange(float);
    class UAIStateMachine * SetStateMachine(class UAIStateMachine *);
    void SetVisualRange(float);
    void StateSignal(enum EStateSignal);
    static class UClass * CDECL StaticClass(void);
    void TickStateMachine(float);
    class UAIStateMachine * TransplantStateMachine(class UAIStateMachine *,class UClass *);
    unsigned long delegateFollowFunction(class AActor *);
    void eventsv_InitAI(void);
    void execAddMetaController(struct FFrame &,void * const);
    void execContinueAI(struct FFrame &,void * const);
    void execGetActiveAIState(struct FFrame &,void * const);
    void execGetHomeLocation(struct FFrame &,void * const);
    void execIsAIPaused(struct FFrame &,void * const);
    void execIsAIPausedBy(struct FFrame &,void * const);
    void execMetaControllerMessage(struct FFrame &,void * const);
    void execPauseAI(struct FFrame &,void * const);
    void execRemoveMetaController(struct FFrame &,void * const);
    void execSetHomeLocation(struct FFrame &,void * const);
    void execSetLineOfSightRange(struct FFrame &,void * const);
    void execSetStateMachine(struct FFrame &,void * const);
    void execSetVisualRange(struct FFrame &,void * const);
    void execSpawnedIn(struct FFrame &,void * const);
    void execStateSignal(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(AGame_AIController,0,execAddMetaController)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execContinueAI)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execGetActiveAIState)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execGetHomeLocation)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execIsAIPaused)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execIsAIPausedBy)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execMetaControllerMessage)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execPauseAI)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execRemoveMetaController)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execSetHomeLocation)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execSetLineOfSightRange)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execSetStateMachine)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execSetVisualRange)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execSpawnedIn)
AUTOGENERATE_FUNCTION(AGame_AIController,0,execStateSignal)


//------------------------------------------------------------------------------
//  Game_PetController
//------------------------------------------------------------------------------

//  Game_PetController.sv_PetCallBack 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_PetController_execsv_PetCallBack_Parms {
};


//  Game_PetController.sv_PetAttack 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_PetController_execsv_PetAttack_Parms {
  class AGame_Pawn* Target;  // 0 80 CPF_Parm
};


//  Game_PetController.sv_GetPetAttackState 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_PetController_execsv_GetPetAttackState_Parms {
  BYTE ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_PetController.sv_GetPetMoveState 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_PetController_execsv_GetPetMoveState_Parms {
  BYTE ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Game_PetController.sv_SetPetAttackState 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_PetController_execsv_SetPetAttackState_Parms {
  BYTE aAttackState;  // 0 80 CPF_Parm
};


//  Game_PetController.sv_SetPetMoveState 20400 0 ( FUNC_Native FUNC_Public )
struct AGame_PetController_execsv_SetPetMoveState_Parms {
  BYTE aMoveState;  // 0 80 CPF_Parm
};


//  Game_PetController.sv_SetPetOwner 20002 0 ( FUNC_Defined FUNC_Public )
struct AGame_PetController_execsv_SetPetOwner_Parms {
  class AGame_Pawn* aOwner;  // 0 80 CPF_Parm
};


// AGame_PetController 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT AGame_PetController : public AGame_AIController {
  public:
    class AGame_Pawn* PetOwner;  // 9B0 0
    class AGame_Pawn* PetMaster;  // 9B4 2000000 CPF_EditorData
    class AGame_Pawn* PetTarget;  // 9B8 2000000 CPF_EditorData
    FLOAT OwnerDistance;  // 9BC 2000000 CPF_EditorData
    virtual ~AGame_PetController(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    virtual void sv_OnInit(void);
    virtual bool IsAlly(class AGame_Pawn *);
    virtual bool IsHostile(class AGame_Pawn *,int &);
    virtual bool IsCombatTarget(class AGame_Pawn *);
    virtual void Despawn(void);
    virtual class FVector GetHomeLocation(void);
    virtual bool CheckChaseRange(class FVector);
    virtual bool CheckHabitatRange(class FVector);
    AGame_PetController(class AGame_PetController const &);
    AGame_PetController(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AGame_PetController & operator=(class AGame_PetController const &);
    void Attack(class AGame_Pawn *);
    void CallBack(void);
    enum EPetAttackState GetAttackState(void);
    enum EPetMoveState GetMoveState(void);
    static void CDECL InternalConstructor(void *);
    void SetAttackState(enum EPetAttackState);
    void SetMoveState(enum EPetMoveState);
    static class UClass * CDECL StaticClass(void);
    void execsv_GetPetAttackState(struct FFrame &,void * const);
    void execsv_GetPetMoveState(struct FFrame &,void * const);
    void execsv_PetAttack(struct FFrame &,void * const);
    void execsv_PetCallBack(struct FFrame &,void * const);
    void execsv_SetPetAttackState(struct FFrame &,void * const);
    void execsv_SetPetMoveState(struct FFrame &,void * const);
    class AGame_Pawn * sv_GetPetMaster(void)const ;
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(AGame_PetController,0,execsv_GetPetAttackState)
AUTOGENERATE_FUNCTION(AGame_PetController,0,execsv_GetPetMoveState)
AUTOGENERATE_FUNCTION(AGame_PetController,0,execsv_PetAttack)
AUTOGENERATE_FUNCTION(AGame_PetController,0,execsv_PetCallBack)
AUTOGENERATE_FUNCTION(AGame_PetController,0,execsv_SetPetAttackState)
AUTOGENERATE_FUNCTION(AGame_PetController,0,execsv_SetPetMoveState)


//------------------------------------------------------------------------------
//  PathPlanningDebugActor
//------------------------------------------------------------------------------

// APathPlanningDebugActor 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT APathPlanningDebugActor : public AActor {
};


//------------------------------------------------------------------------------
//  ActionTrigger
//------------------------------------------------------------------------------

// AActionTrigger 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AActionTrigger : public AActor {
};




//state SquadMind.Patrol 0

//state SquadMind.Return 0

//state SquadMind.Fight 0

//state SquadMind.Alert 0

//state SquadMind.Idle 2

//state HiveMind.Return 0

//state HiveMind.Fight 0

//state HiveMind.Alert 0

//state HiveMind.Idle 0

//state HiveMind.Spawning 2

//state Game_AIController.PawnDead 0


AUTOGENERATE_CLASS(AAIPoint)
AUTOGENERATE_CLASS(AAI_MetaController)
AUTOGENERATE_CLASS(AAI_Script)
AUTOGENERATE_CLASS(AAnnotation_Script)
AUTOGENERATE_CLASS(AGame_AIController)
AUTOGENERATE_CLASS(AGame_PetController)
AUTOGENERATE_CLASS(AGroupMind)
AUTOGENERATE_CLASS(AHiveMind)
AUTOGENERATE_CLASS(APatrolPoint)
AUTOGENERATE_CLASS(ASquadMind)
AUTOGENERATE_CLASS(UAIAggressiveMachine)
AUTOGENERATE_CLASS(UAIAlertState)
AUTOGENERATE_CLASS(UAIAnimalIdleState)
AUTOGENERATE_CLASS(UAIBattleState)
AUTOGENERATE_CLASS(UAIBossIdleState)
AUTOGENERATE_CLASS(UAIBossMachine)
AUTOGENERATE_CLASS(UAICitizenMachine)
AUTOGENERATE_CLASS(UAICombatState)
AUTOGENERATE_CLASS(UAIConversationState)
AUTOGENERATE_CLASS(UAICoverState)
AUTOGENERATE_CLASS(UAICowerState)
AUTOGENERATE_CLASS(UAICritterMachine)
AUTOGENERATE_CLASS(UAIDroneMachine)
AUTOGENERATE_CLASS(UAIFightState)
AUTOGENERATE_CLASS(UAIFleeState)
AUTOGENERATE_CLASS(UAIFollowState)
AUTOGENERATE_CLASS(UAIGruntAlertState)
AUTOGENERATE_CLASS(UAIGruntCombatState)
AUTOGENERATE_CLASS(UAIGruntIdleState)
AUTOGENERATE_CLASS(UAIGruntMachine)
AUTOGENERATE_CLASS(UAIGruntPatrolState)
AUTOGENERATE_CLASS(UAIHowlerMachine)
AUTOGENERATE_CLASS(UAIHumanoidCowerState)
AUTOGENERATE_CLASS(UAIHumanoidIdleState)
AUTOGENERATE_CLASS(UAIHumanoidRetreatState)
AUTOGENERATE_CLASS(UAIIdleState)
AUTOGENERATE_CLASS(UAIKidMachine)
AUTOGENERATE_CLASS(UAIKillingCombatState)
AUTOGENERATE_CLASS(UAIKillingMachine)
AUTOGENERATE_CLASS(UAILeaderAlertState)
AUTOGENERATE_CLASS(UAILeaderCombatState)
AUTOGENERATE_CLASS(UAILeaderMachine)
AUTOGENERATE_CLASS(UAINormalPatrolState)
AUTOGENERATE_CLASS(UAINormalRetreatState)
AUTOGENERATE_CLASS(UAIPassiveMachine)
AUTOGENERATE_CLASS(UAIPatrolState)
AUTOGENERATE_CLASS(UAIPetBattleState)
AUTOGENERATE_CLASS(UAIPetFollowState)
AUTOGENERATE_CLASS(UAIPetIdleState)
AUTOGENERATE_CLASS(UAIPetLostState)
AUTOGENERATE_CLASS(UAIPetMachine)
AUTOGENERATE_CLASS(UAIPredatorMachine)
AUTOGENERATE_CLASS(UAIRetreatState)
AUTOGENERATE_CLASS(UAIReturnState)
AUTOGENERATE_CLASS(UAIScriptSubObject)
AUTOGENERATE_CLASS(UAIState)
AUTOGENERATE_CLASS(UAIStateMachine)
AUTOGENERATE_CLASS(UAISubmergeState)
AUTOGENERATE_CLASS(UAITestMachine)
AUTOGENERATE_CLASS(UAIWakingAlertState)
AUTOGENERATE_CLASS(UAIWakingMachine)
AUTOGENERATE_CLASS(UAIWanderState)
AUTOGENERATE_CLASS(UConversationComponent)
AUTOGENERATE_CLASS(UFSkill_EffectClass_DirectTeleportAI)
AUTOGENERATE_CLASS(UHormoneComponent)
AUTOGENERATE_CLASS(UMetaControllerManagerComponent)
AUTOGENERATE_CLASS(UMeta_CombatStats)
AUTOGENERATE_CLASS(UMovementComponent)
AUTOGENERATE_CLASS(UTargetComponent)

AUTOGENERATE_PACKAGE(SBAI)


//_DllMain@12 19ec540
//SBAI_InitPackage 19ec560

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

