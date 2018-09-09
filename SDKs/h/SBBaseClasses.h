#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName SBBASE_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif

AUTOGENERATE_NAME(GetUniverseID)
AUTOGENERATE_NAME(GetWorldID)
AUTOGENERATE_NAME(IsInCombat)
AUTOGENERATE_NAME(SetAuthorityLevel)
AUTOGENERATE_NAME(SetFixedRelativeTimeOfDay)
AUTOGENERATE_NAME(SetTimeSpeedUpFactor)
AUTOGENERATE_NAME(SitDown)
AUTOGENERATE_NAME(StandUp)
AUTOGENERATE_NAME(cl_OnBaseline)
AUTOGENERATE_NAME(cl_OnFrame)
AUTOGENERATE_NAME(cl_OnGroupChange)
AUTOGENERATE_NAME(cl_OnInit)
AUTOGENERATE_NAME(cl_OnLogout)
AUTOGENERATE_NAME(cl_OnShutdown)
AUTOGENERATE_NAME(cl_OnUpdate)
AUTOGENERATE_NAME(sv2cl_GotoState)
AUTOGENERATE_NAME(sv2clrel_DamageActions)
AUTOGENERATE_NAME(sv2clrel_QueueAnimation)
AUTOGENERATE_NAME(sv_OnInit)
AUTOGENERATE_NAME(sv_OnLogin)
AUTOGENERATE_NAME(sv_OnLogout)
AUTOGENERATE_NAME(sv_OnShutdown)
AUTOGENERATE_NAME(sv_OnSpawn)

//------------------------------------------------------------------------------
//  Base_Component
//------------------------------------------------------------------------------

//  Base_Component.GetComponentDescription 20002 0 ( FUNC_Defined FUNC_Public )
struct UBase_Component_execGetComponentDescription_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Base_Component.IsControllerComponent 20002 0 ( FUNC_Defined FUNC_Public )
struct UBase_Component_execIsControllerComponent_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Component.IsPawnComponent 20002 0 ( FUNC_Defined FUNC_Public )
struct UBase_Component_execIsPawnComponent_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Component.sv_CanReplicate 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_Component_execsv_CanReplicate_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Component.cl_OnGroupChange 20800 0 ( FUNC_Event FUNC_Public )
struct UBase_Component_eventcl_OnGroupChange_Parms {
  INT newGroupFlags;  // 0 80 CPF_Parm
};


//  Base_Component.cl_OnUpdate 20800 0 ( FUNC_Event FUNC_Public )
struct UBase_Component_eventcl_OnUpdate_Parms {
};


//  Base_Component.cl_OnBaseline 20800 0 ( FUNC_Event FUNC_Public )
struct UBase_Component_eventcl_OnBaseline_Parms {
};


//  Base_Component.cl_OnShutdown 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UBase_Component_eventcl_OnShutdown_Parms {
};


//  Base_Component.cl_OnInit 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UBase_Component_eventcl_OnInit_Parms {
};


//  Base_Component.sv_OnShutdown 20C01 0 ( FUNC_Final FUNC_Native FUNC_Event FUNC_Public )
struct UBase_Component_eventsv_OnShutdown_Parms {
};


//  Base_Component.sv_OnLogin 20C01 0 ( FUNC_Final FUNC_Native FUNC_Event FUNC_Public )
struct UBase_Component_eventsv_OnLogin_Parms {
};


//  Base_Component.sv_OnInit 20C01 0 ( FUNC_Final FUNC_Native FUNC_Event FUNC_Public )
struct UBase_Component_eventsv_OnInit_Parms {
};


// UBase_Component 200012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UBase_Component : public UObject {
  public:
    INT mhastransactionmanager_data;  // 28 802000 CPF_Transient CPF_Unk_00800000
    DWORD d_Component;  // 2C 2002 CPF_Const CPF_Transient
    BITFIELD ComponentInitialized : 1;  // 30 2000002 CPF_Const CPF_EditorData
    class FString ComponentName;  // 34 2400002 CPF_Const CPF_NeedCtorLink CPF_EditorData
    INT ExCleanIndex;  // 3C 2000 CPF_Transient
    virtual ~UBase_Component(void);
    virtual int ProcessRemoteFunction(class UFunction *,void *,struct FFrame *);
    virtual void ExtendCleanMe(void);
    virtual int IsExtendedCleaned(void);
    virtual void SetCleanIndex(int);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnInit(void);
    virtual void sv_OnLogin(void);
    virtual void sv_OnShutdown(void);
    virtual void sv_OnFrame(float);
    UBase_Component(class UBase_Component const &);
    UBase_Component(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UBase_Component & operator=(class UBase_Component const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventcl_OnBaseline(void);
    void eventcl_OnGroupChange(int);
    void eventcl_OnInit(void);
    void eventcl_OnShutdown(void);
    void eventcl_OnUpdate(void);
    void eventsv_OnInit(void);
    void eventsv_OnLogin(void);
    void eventsv_OnShutdown(void);
    void execsv_CanReplicate(struct FFrame &,void * const);
    void execsv_OnInit(struct FFrame &,void * const);
    void execsv_OnLogin(struct FFrame &,void * const);
    void execsv_OnShutdown(struct FFrame &,void * const);
    class d_relevance::d_relevance_object * get_relevance_object(void);
    unsigned int const get_relevance_object_id(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UBase_Component,0,execsv_CanReplicate)
AUTOGENERATE_FUNCTION(UBase_Component,0,execsv_OnInit)
AUTOGENERATE_FUNCTION(UBase_Component,0,execsv_OnLogin)
AUTOGENERATE_FUNCTION(UBase_Component,0,execsv_OnShutdown)


//------------------------------------------------------------------------------
//  Base_Pawn
//------------------------------------------------------------------------------

#define UCONST_Base_Pawn_IDEAL_JUMP_SPEED_FOR_ANIM  350.f
//  Base_Pawn.StandUp 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ABase_Pawn_eventStandUp_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Pawn.SitDown 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ABase_Pawn_eventSitDown_Parms {
  BITFIELD aOnChairFlag : 1;  // 0 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Pawn.Landed 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ABase_Pawn_eventLanded_Parms {
  class FVector aHitNormal;  // 0 80 CPF_Parm
};


//  Base_Pawn.PlayJumpTakeoff 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlayJumpTakeoff_Parms {
};


//  Base_Pawn.PlayHitAnim 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlayHitAnim_Parms {
  FLOAT aHitFactor;  // 0 80 CPF_Parm
};


//  Base_Pawn.sv2clrel_QueueAnimation_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct ABase_Pawn_execsv2clrel_QueueAnimation_CallStub_Parms {
};


//  Base_Pawn.sv2clrel_QueueAnimation 20802 1F80 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CLREL )
struct ABase_Pawn_eventsv2clrel_QueueAnimation_Parms {
  BYTE flag1;  // 0 80 CPF_Parm
  BYTE flag2;  // 1 80 CPF_Parm
  BYTE flag3;  // 2 80 CPF_Parm
  BYTE variation;  // 3 80 CPF_Parm
  BITFIELD isLooping : 1;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  Base_Pawn.sv_ForwardAnimation 20002 0 ( FUNC_Defined FUNC_Public )
struct ABase_Pawn_execsv_ForwardAnimation_Parms {
  BYTE flag1;  // 0 80 CPF_Parm
  BYTE flag2;  // 1 80 CPF_Parm
  BYTE flag3;  // 2 80 CPF_Parm
  BYTE variation;  // 3 80 CPF_Parm
  BITFIELD isLooping : 1;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  Base_Pawn.sv_HackDamageActions 20002 0 ( FUNC_Defined FUNC_Public )
struct ABase_Pawn_execsv_HackDamageActions_Parms {
  FLOAT aDamageFactor;  // 0 80 CPF_Parm
};


//  Base_Pawn.sv2clrel_DamageActions_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct ABase_Pawn_execsv2clrel_DamageActions_CallStub_Parms {
};


//  Base_Pawn.sv2clrel_DamageActions 20802 1F80 ( FUNC_Defined FUNC_Event FUNC_Public FUNC_SV2CLREL )
struct ABase_Pawn_eventsv2clrel_DamageActions_Parms {
  FLOAT aDamageFactor;  // 0 80 CPF_Parm
};


//  Base_Pawn.ResetFallTimer 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execResetFallTimer_Parms {
};


//  Base_Pawn.PlayIdle 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlayIdle_Parms {
  BITFIELD aForce : 1;  // 0 90 CPF_OptionalParm CPF_Parm
};


//  Base_Pawn.PlaySubmergeAnim 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlaySubmergeAnim_Parms {
};


//  Base_Pawn.PlayEmergeAnim 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlayEmergeAnim_Parms {
};


//  Base_Pawn.PlayStandAnim 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlayStandAnim_Parms {
  BITFIELD aOnChairFlag : 1;  // 0 80 CPF_Parm
};


//  Base_Pawn.PlaySitAnim 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlaySitAnim_Parms {
  BITFIELD aOnChairFlag : 1;  // 0 80 CPF_Parm
};


//  Base_Pawn.PlayEmote 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlayEmote_Parms {
  INT emoteNr;  // 0 80 CPF_Parm
  FLOAT AnimSpeed;  // 4 80 CPF_Parm
};


//  Base_Pawn.PlayDrawWeaponAnim 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlayDrawWeaponAnim_Parms {
  INT WeaponFlag;  // 0 80 CPF_Parm
  BITFIELD combatState : 1;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  Base_Pawn.PlaySheatheWeaponAnim 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlaySheatheWeaponAnim_Parms {
  INT WeaponFlag;  // 0 80 CPF_Parm
  BITFIELD combatState : 1;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  Base_Pawn.PlayDeathAnim 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execPlayDeathAnim_Parms {
  class FVector damageDirection;  // 0 80 CPF_Parm
};


//  Base_Pawn.Emote 20202 0 ( FUNC_Defined FUNC_Exec FUNC_Public )
struct ABase_Pawn_execEmote_Parms {
  INT emoteNr;  // 0 80 CPF_Parm
  FLOAT AnimSpeed;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  Base_Pawn.IsInCombat 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ABase_Pawn_eventIsInCombat_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Pawn.sv_CanReplicate 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Pawn_execsv_CanReplicate_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Pawn.sv2cl_GotoState_CallStub 80400 0 ( FUNC_Native FUNC_Protected )
struct ABase_Pawn_execsv2cl_GotoState_CallStub_Parms {
};


//  Base_Pawn.sv2cl_GotoState 20802 380 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ABase_Pawn_eventsv2cl_GotoState_Parms {
  class FString aState;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  Base_Pawn.GetWorldID 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct ABase_Pawn_eventGetWorldID_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Pawn.GetUniverseID 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct ABase_Pawn_eventGetUniverseID_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Pawn.cl_OnBaseline 20800 0 ( FUNC_Event FUNC_Public )
struct ABase_Pawn_eventcl_OnBaseline_Parms {
};


//  Base_Pawn.sv_OnSpawn 20C01 0 ( FUNC_Final FUNC_Native FUNC_Event FUNC_Public )
struct ABase_Pawn_eventsv_OnSpawn_Parms {
  class ABase_Controller* aController;  // 0 80 CPF_Parm
};


//  Base_Pawn.cl_OnFrame 20800 0 ( FUNC_Event FUNC_Public )
struct ABase_Pawn_eventcl_OnFrame_Parms {
  FLOAT delta;  // 0 80 CPF_Parm
};


//  Base_Pawn.cl_OnTick 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct ABase_Pawn_eventcl_OnTick_Parms {
  FLOAT delta;  // 0 80 CPF_Parm
};


//  Base_Pawn.cl_OnShutdown 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct ABase_Pawn_eventcl_OnShutdown_Parms {
};


//  Base_Pawn.cl_OnInit 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct ABase_Pawn_eventcl_OnInit_Parms {
};


//  Base_Pawn.sv_OnShutdown 20C01 0 ( FUNC_Final FUNC_Native FUNC_Event FUNC_Public )
struct ABase_Pawn_eventsv_OnShutdown_Parms {
};


//  Base_Pawn.sv_OnInit 20C01 0 ( FUNC_Final FUNC_Native FUNC_Event FUNC_Public )
struct ABase_Pawn_eventsv_OnInit_Parms {
};


// ABase_Pawn 236 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_Localized CLASS_NoUserCreate )
class DLL_IMPORT ABase_Pawn : public ASBAnimatedPawn {
  public:
    DWORD d_relevance_object_vtbl;  // 778 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mRelevanceObjectID;  // 77C 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mpRelevance;  // 780 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mBlockIndexX;  // 784 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mBlockIndexY;  // 788 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mVisibilityLevel;  // 78C 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mbVisible;  // 790 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mbGM;  // 794 802000 CPF_Transient CPF_Unk_00800000
    INT mFramer;  // 798 2802000 CPF_Transient CPF_Unk_00800000 CPF_EditorData
    BITFIELD bIsFalling : 1;  // 79C 2000 CPF_Transient
    FLOAT mTimeToFall;  // 7A0 0
    FLOAT mFallTimer;  // 7A4 2000 CPF_Transient
    virtual ~ABase_Pawn(void);
    virtual unsigned int GetCPPSize(void);
    virtual void CleanupSubObjects(int);
    virtual void * get_relevance_object_virtual(void);
    virtual void UpdateMovementAnimation(float);
    virtual void PlayIdle(void);
    virtual bool IsMoving(void);
    virtual class FString GetCharacterName(void);
    virtual void sv_OnInit(void);
    virtual void sv_OnLogin(void);
    virtual void sv_OnShutdown(void);
    virtual void sv_OnSpawn(class ABase_Controller *);
    virtual void cl_OnInit(void);
    virtual void cl_OnShutdown(void);
    virtual void cl_OnTick(float);
    //virtual class AActor * get_actor(void);
    ABase_Pawn(class ABase_Pawn const &);
    ABase_Pawn(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ABase_Pawn & operator=(class ABase_Pawn const &);
    float GetHitBlendFactor(void);
    float GetJumpAnimationSpeed(void);
    float GetLadderClimbSpeed(void);
    static void CDECL InternalConstructor(void *);
    bool IsSubmerged(void);
    bool IsTurning(void);
    bool IsWalking(void);
    void PlayDeath(class FVector const &);
    void PlayDrawWeapon(int,int);
    void PlayEmerge(void);
    void PlayEmote(int,float);
    void PlayFallImpact(void);
    void PlayFalling(void);
    void PlayFlying(void);
    void PlayHit(float);
    void PlayJumpAscend(void);
    void PlayJumpDescent(void);
    void PlayJumpLand(void);
    void PlayRunning(void);
    void PlaySheatheWeapon(int,int);
    void PlaySit(bool);
    void PlaySitIdle(void);
    void PlayStand(bool);
    void PlaySubmerge(void);
    void PlayTakeoff(void);
    void PlayTurning(float);
    void ResetFallTimer(void);
    bool ShouldPlayIdle(void);
    static class UClass * CDECL StaticClass(void);
    void UpdateClimb(float);
    bool UpdateDeadPawn(void);
    void UpdateFallTimer(float);
    void UpdateInAir(float);
    void UpdateOnGround(float);
    void UpdateSitting(float);
    void UpdateSwimming(float);
    int eventGetUniverseID(void);
    int eventGetWorldID(void);
    unsigned long eventIsInCombat(void);
    unsigned long eventSitDown(unsigned long);
    unsigned long eventStandUp(void);
    void eventcl_OnFrame(float);
    void eventcl_OnInit(void);
    void eventcl_OnShutdown(void);
    void eventsv2cl_GotoState(class FString const &);
    void eventsv2clrel_DamageActions(float);
    void eventsv2clrel_QueueAnimation(unsigned char,unsigned char,unsigned char,unsigned char,unsigned long);
    void eventsv_OnInit(void);
    void eventsv_OnShutdown(void);
    void eventsv_OnSpawn(class ABase_Controller *);
    void execGetUniverseID(struct FFrame &,void * const);
    void execGetWorldID(struct FFrame &,void * const);
    void execPlayDeathAnim(struct FFrame &,void * const);
    void execPlayDrawWeaponAnim(struct FFrame &,void * const);
    void execPlayEmergeAnim(struct FFrame &,void * const);
    void execPlayEmote(struct FFrame &,void * const);
    void execPlayHitAnim(struct FFrame &,void * const);
    void execPlayIdle(struct FFrame &,void * const);
    void execPlayJumpTakeoff(struct FFrame &,void * const);
    void execPlaySheatheWeaponAnim(struct FFrame &,void * const);
    void execPlaySitAnim(struct FFrame &,void * const);
    void execPlayStandAnim(struct FFrame &,void * const);
    void execPlaySubmergeAnim(struct FFrame &,void * const);
    void execResetFallTimer(struct FFrame &,void * const);
    void execcl_OnInit(struct FFrame &,void * const);
    void execcl_OnShutdown(struct FFrame &,void * const);
    void execcl_OnTick(struct FFrame &,void * const);
    void execsv2cl_GotoState_CallStub(struct FFrame &,void * const);
    void execsv2clrel_DamageActions_CallStub(struct FFrame &,void * const);
    void execsv2clrel_QueueAnimation_CallStub(struct FFrame &,void * const);
    void execsv_CanReplicate(struct FFrame &,void * const);
    void execsv_OnInit(struct FFrame &,void * const);
    void execsv_OnShutdown(struct FFrame &,void * const);
    void execsv_OnSpawn(struct FFrame &,void * const);
    class d_relevance::d_relevance_object * get_relevance_object(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execGetUniverseID)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execGetWorldID)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlayDeathAnim)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlayDrawWeaponAnim)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlayEmergeAnim)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlayEmote)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlayHitAnim)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlayIdle)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlayJumpTakeoff)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlaySheatheWeaponAnim)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlaySitAnim)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlayStandAnim)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execPlaySubmergeAnim)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execResetFallTimer)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execcl_OnInit)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execcl_OnShutdown)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execcl_OnTick)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execsv2cl_GotoState_CallStub)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execsv2clrel_DamageActions_CallStub)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execsv2clrel_QueueAnimation_CallStub)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execsv_CanReplicate)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execsv_OnInit)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execsv_OnShutdown)
AUTOGENERATE_FUNCTION(ABase_Pawn,0,execsv_OnSpawn)


//------------------------------------------------------------------------------
//  Base_Controller
//------------------------------------------------------------------------------

enum EGroupIDs {
  EGroupIDs_RESERVED_0 = 0,
  GID_CLIENT = 1,
  GID_RELEVANT = 2,
  EGroupIDs_RESERVED_3 = 3,
  GID_SCENERY = 4,
  EGroupIDs_RESERVED_5 = 5,
  EGroupIDs_RESERVED_6 = 6,
  EGroupIDs_RESERVED_7 = 7,
  GID_TEAM = 8,
  EGroupIDs_RESERVED_9 = 9,
  EGroupIDs_RESERVED_10 = 10,
  EGroupIDs_RESERVED_11 = 11,
  EGroupIDs_RESERVED_12 = 12,
  EGroupIDs_RESERVED_13 = 13,
  EGroupIDs_RESERVED_14 = 14,
  EGroupIDs_RESERVED_15 = 15,
  GID_FRIENDS = 16,
  EGroupIDs_RESERVED_17 = 17,
  EGroupIDs_RESERVED_18 = 18,
  EGroupIDs_RESERVED_19 = 19,
  EGroupIDs_RESERVED_20 = 20,
  EGroupIDs_RESERVED_21 = 21,
  EGroupIDs_RESERVED_22 = 22,
  EGroupIDs_RESERVED_23 = 23,
  EGroupIDs_RESERVED_24 = 24,
  EGroupIDs_RESERVED_25 = 25,
  EGroupIDs_RESERVED_26 = 26,
  EGroupIDs_RESERVED_27 = 27,
  EGroupIDs_RESERVED_28 = 28,
  EGroupIDs_RESERVED_29 = 29,
  EGroupIDs_RESERVED_30 = 30,
  EGroupIDs_RESERVED_31 = 31,
  GID_GUILD = 32,
  EGroupIDs_RESERVED_33 = 33,
  EGroupIDs_RESERVED_34 = 34,
  EGroupIDs_RESERVED_35 = 35,
  EGroupIDs_RESERVED_36 = 36,
  EGroupIDs_RESERVED_37 = 37,
  EGroupIDs_RESERVED_38 = 38,
  EGroupIDs_RESERVED_39 = 39,
  EGroupIDs_RESERVED_40 = 40,
  EGroupIDs_RESERVED_41 = 41,
  EGroupIDs_RESERVED_42 = 42,
  EGroupIDs_RESERVED_43 = 43,
  EGroupIDs_RESERVED_44 = 44,
  EGroupIDs_RESERVED_45 = 45,
  EGroupIDs_RESERVED_46 = 46,
  EGroupIDs_RESERVED_47 = 47,
  EGroupIDs_RESERVED_48 = 48,
  EGroupIDs_RESERVED_49 = 49,
  EGroupIDs_RESERVED_50 = 50,
  EGroupIDs_RESERVED_51 = 51,
  EGroupIDs_RESERVED_52 = 52,
  EGroupIDs_RESERVED_53 = 53,
  EGroupIDs_RESERVED_54 = 54,
  EGroupIDs_RESERVED_55 = 55,
  EGroupIDs_RESERVED_56 = 56,
  EGroupIDs_RESERVED_57 = 57,
  EGroupIDs_RESERVED_58 = 58,
  EGroupIDs_RESERVED_59 = 59,
  EGroupIDs_RESERVED_60 = 60,
  EGroupIDs_RESERVED_61 = 61,
  EGroupIDs_RESERVED_62 = 62,
  EGroupIDs_RESERVED_63 = 63,
  GID_QUERY = 64,
  EGroupIDs_RESERVED_65 = 65,
  EGroupIDs_RESERVED_66 = 66,
  EGroupIDs_RESERVED_67 = 67,
  EGroupIDs_RESERVED_68 = 68,
  EGroupIDs_RESERVED_69 = 69,
  EGroupIDs_RESERVED_70 = 70,
  EGroupIDs_RESERVED_71 = 71,
  EGroupIDs_RESERVED_72 = 72,
  EGroupIDs_RESERVED_73 = 73,
  EGroupIDs_RESERVED_74 = 74,
  EGroupIDs_RESERVED_75 = 75,
  EGroupIDs_RESERVED_76 = 76,
  EGroupIDs_RESERVED_77 = 77,
  EGroupIDs_RESERVED_78 = 78,
  EGroupIDs_RESERVED_79 = 79,
  EGroupIDs_RESERVED_80 = 80,
  EGroupIDs_RESERVED_81 = 81,
  EGroupIDs_RESERVED_82 = 82,
  EGroupIDs_RESERVED_83 = 83,
  EGroupIDs_RESERVED_84 = 84,
  EGroupIDs_RESERVED_85 = 85,
  EGroupIDs_RESERVED_86 = 86,
  EGroupIDs_RESERVED_87 = 87,
  EGroupIDs_RESERVED_88 = 88,
  EGroupIDs_RESERVED_89 = 89,
  EGroupIDs_RESERVED_90 = 90,
  EGroupIDs_RESERVED_91 = 91,
  EGroupIDs_RESERVED_92 = 92,
  EGroupIDs_RESERVED_93 = 93,
  EGroupIDs_RESERVED_94 = 94,
  EGroupIDs_RESERVED_95 = 95,
  EGroupIDs_RESERVED_96 = 96,
  EGroupIDs_RESERVED_97 = 97,
  EGroupIDs_RESERVED_98 = 98,
  EGroupIDs_RESERVED_99 = 99,
  EGroupIDs_RESERVED_100 = 100,
  EGroupIDs_RESERVED_101 = 101,
  EGroupIDs_RESERVED_102 = 102,
  EGroupIDs_RESERVED_103 = 103,
  EGroupIDs_RESERVED_104 = 104,
  EGroupIDs_RESERVED_105 = 105,
  EGroupIDs_RESERVED_106 = 106,
  EGroupIDs_RESERVED_107 = 107,
  EGroupIDs_RESERVED_108 = 108,
  EGroupIDs_RESERVED_109 = 109,
  EGroupIDs_RESERVED_110 = 110,
  EGroupIDs_RESERVED_111 = 111,
  EGroupIDs_RESERVED_112 = 112,
  EGroupIDs_RESERVED_113 = 113,
  EGroupIDs_RESERVED_114 = 114,
  EGroupIDs_RESERVED_115 = 115,
  EGroupIDs_RESERVED_116 = 116,
  EGroupIDs_RESERVED_117 = 117,
  EGroupIDs_RESERVED_118 = 118,
  EGroupIDs_RESERVED_119 = 119,
  EGroupIDs_RESERVED_120 = 120,
  EGroupIDs_RESERVED_121 = 121,
  EGroupIDs_RESERVED_122 = 122,
  EGroupIDs_RESERVED_123 = 123,
  EGroupIDs_RESERVED_124 = 124,
  EGroupIDs_RESERVED_125 = 125,
  EGroupIDs_RESERVED_126 = 126,
  EGroupIDs_RESERVED_127 = 127,
  GID_SERVER = 128
};

//  Base_Controller.sv_ClientMessage 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Controller_execsv_ClientMessage_Parms {
  class FString Message;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  Base_Controller.sv_PrivateMessage 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Controller_execsv_PrivateMessage_Parms {
  class APawn* aPawn;  // 0 80 CPF_Parm
  class FString Message;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  Base_Controller.sv_ZoneMessage 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Controller_execsv_ZoneMessage_Parms {
  class FString Message;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  Base_Controller.sv_UniverseMessage 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Controller_execsv_UniverseMessage_Parms {
  class FString Message;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  Base_Controller.sv_GlobalMessage 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Controller_execsv_GlobalMessage_Parms {
  class FString Message;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  Base_Controller.sv_SupportMessage 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Controller_execsv_SupportMessage_Parms {
  class FString Message;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  Base_Controller.sv_SystemMessage 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Controller_execsv_SystemMessage_Parms {
  class FString Message;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  Base_Controller.sv_CanReplicate 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Controller_execsv_CanReplicate_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_Controller.cl_OnShutdown 20800 0 ( FUNC_Event FUNC_Public )
struct ABase_Controller_eventcl_OnShutdown_Parms {
};


//  Base_Controller.cl_OnTick 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ABase_Controller_eventcl_OnTick_Parms {
  FLOAT DeltaTime;  // 0 80 CPF_Parm
};


//  Base_Controller.cl_OnBaseline 20800 0 ( FUNC_Event FUNC_Public )
struct ABase_Controller_eventcl_OnBaseline_Parms {
};


//  Base_Controller.cl_OnInit 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ABase_Controller_eventcl_OnInit_Parms {
};


//  Base_Controller.sv_OnShutdown 20800 0 ( FUNC_Event FUNC_Public )
struct ABase_Controller_eventsv_OnShutdown_Parms {
};


//  Base_Controller.sv_OnInit 20400 0 ( FUNC_Native FUNC_Public )
struct ABase_Controller_execsv_OnInit_Parms {
};


//  Base_Controller.SetAuthorityLevel 20800 0 ( FUNC_Event FUNC_Public )
struct ABase_Controller_eventSetAuthorityLevel_Parms {
  INT aLevel;  // 0 80 CPF_Parm
};


// ABase_Controller 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT ABase_Controller : public APlayerController {
  public:
    INT AccountID;  // 864 0
    INT CharacterID;  // 868 0
    BITFIELD ControllerInitialized : 1;  // 86C 2 CPF_Const
    class UClass* mPawnClass;  // 870 0
    virtual ~ABase_Controller(void);
    virtual unsigned int GetCPPSize(void);
    virtual void CleanupSubObjects(int);
    virtual void * get_relevance_object_virtual(void);
    virtual void sv_OnInit(void);
    virtual void sv_OnLogin(void);
    ABase_Controller(class ABase_Controller const &);
    ABase_Controller(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ABase_Controller & operator=(class ABase_Controller const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventSetAuthorityLevel(int);
    void eventcl_OnInit(void);
    void eventcl_OnShutdown(void);
    void eventsv_OnShutdown(void);
    void execsv_CanReplicate(struct FFrame &,void * const);
    void execsv_ClientMessage(struct FFrame &,void * const);
    void execsv_GlobalMessage(struct FFrame &,void * const);
    void execsv_OnInit(struct FFrame &,void * const);
    void execsv_PrivateMessage(struct FFrame &,void * const);
    void execsv_SupportMessage(struct FFrame &,void * const);
    void execsv_SystemMessage(struct FFrame &,void * const);
    void execsv_UniverseMessage(struct FFrame &,void * const);
    void execsv_ZoneMessage(struct FFrame &,void * const);
    class d_relevance::d_relevance_object * get_relevance_object(void);
    unsigned int const get_relevance_object_id(void)const ;
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(ABase_Controller,0,execsv_CanReplicate)
AUTOGENERATE_FUNCTION(ABase_Controller,0,execsv_ClientMessage)
AUTOGENERATE_FUNCTION(ABase_Controller,0,execsv_GlobalMessage)
AUTOGENERATE_FUNCTION(ABase_Controller,0,execsv_OnInit)
AUTOGENERATE_FUNCTION(ABase_Controller,0,execsv_PrivateMessage)
AUTOGENERATE_FUNCTION(ABase_Controller,0,execsv_SupportMessage)
AUTOGENERATE_FUNCTION(ABase_Controller,0,execsv_SystemMessage)
AUTOGENERATE_FUNCTION(ABase_Controller,0,execsv_UniverseMessage)
AUTOGENERATE_FUNCTION(ABase_Controller,0,execsv_ZoneMessage)


//------------------------------------------------------------------------------
//  Base_GameInfo
//------------------------------------------------------------------------------

//  Base_GameInfo.cl_OnUpdate 20800 0 ( FUNC_Event FUNC_Public )
struct ABase_GameInfo_eventcl_OnUpdate_Parms {
};


//  Base_GameInfo.cl_OnFrame 20800 0 ( FUNC_Event FUNC_Public )
struct ABase_GameInfo_eventcl_OnFrame_Parms {
  FLOAT delta;  // 0 80 CPF_Parm
};


//  Base_GameInfo.cl_OnLogout 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ABase_GameInfo_eventcl_OnLogout_Parms {
  class AActor* controllerActor;  // 0 80 CPF_Parm
};


//  Base_GameInfo.cl_OnBaseline 20800 0 ( FUNC_Event FUNC_Public )
struct ABase_GameInfo_eventcl_OnBaseline_Parms {
};


//  Base_GameInfo.sv_OnLogout 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct ABase_GameInfo_eventsv_OnLogout_Parms {
  INT aAccountID;  // 0 80 CPF_Parm
  class ABase_Pawn* aPawn;  // 4 80 CPF_Parm
};


// ABase_GameInfo 4013 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT ABase_GameInfo : public AGameInfo {
  public:
    DWORD d_relevance_object_vtbl;  // 420 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mRelevanceObjectID;  // 424 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mpRelevance;  // 428 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mBlockIndexX;  // 42C 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mBlockIndexY;  // 430 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mVisibilityLevel;  // 434 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mbVisible;  // 438 802000 CPF_Transient CPF_Unk_00800000
    INT d_relevance_object_mbGM;  // 43C 802000 CPF_Transient CPF_Unk_00800000
    INT HackFlags;  // 440 0
    FLOAT mFixedRelativeTimeOfDay;  // 444 0
    class UClass* mPlayerControllerClass;  // 448 2000001 CPF_Edit CPF_EditorData
    class UClass* mTestBotControllerClass;  // 44C 2000001 CPF_Edit CPF_EditorData
    class UClass* mGameMasterControllerClass;  // 450 2000001 CPF_Edit CPF_EditorData
    virtual ~ABase_GameInfo(void);
    virtual unsigned int GetCPPSize(void);
    virtual void * get_relevance_object_virtual(void);
    virtual class ABase_Controller * CreatePlayerControllerAndPawn(struct SD_CHARACTER_INFO const &,class FVector const &,class FRotator const &,int,int);
    //virtual class AActor * get_actor(void);
    ABase_GameInfo(class ABase_GameInfo const &);
    ABase_GameInfo(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ABase_GameInfo & operator=(class ABase_GameInfo const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventcl_OnFrame(float);
    void eventcl_OnLogout(class AActor *);
    void eventsv_OnLogout(int,class ABase_Pawn *);
    class d_relevance::d_relevance_object * get_relevance_object(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBRoute
//------------------------------------------------------------------------------

// USBRoute 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBRoute : public UObject {
  public:
    struct FLocalizedString ShardName;  // 28 400000 CPF_NeedCtorLink
    class USBWorld* TravelWorld;  // 34 0
    class USBPortal* TravelPortal;  // 38 0
    class USBWorld* DestinationWorld;  // 3C 0
    class USBPortal* DestinationPortal;  // 40 0
    BITFIELD AllowRentACabin : 1;  // 44 0
    INT CrewCost;  // 48 0
    INT CabinCost;  // 4C 0
    class FString WorldPortalTag;  // 50 2400000 CPF_NeedCtorLink CPF_EditorData
    virtual ~USBRoute(void);
    virtual unsigned int GetCPPSize(void);
    USBRoute(class USBRoute const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBRoute & operator=(class USBRoute const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBRoute(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBPortal
//------------------------------------------------------------------------------

// USBPortal 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBPortal : public UObject {
  public:
    class USBWorld* TargetWorld;  // 28 0
    class USBPortal* EntryPortal;  // 2C 0
    class FString Tag;  // 30 400000 CPF_NeedCtorLink
    class AActor* LevelActor;  // 38 2002000 CPF_Transient CPF_EditorData
    virtual ~USBPortal(void);
    virtual unsigned int GetCPPSize(void);
    USBPortal(class USBPortal const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBPortal & operator=(class USBPortal const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBPortal(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBBasePortal
//------------------------------------------------------------------------------

// ASBBasePortal 232 ( CLASS_Compiled CLASS_Parsed CLASS_Localized CLASS_NoUserCreate )
class DLL_IMPORT ASBBasePortal : public ATrigger {
  public:
    class FString NavigationTag;  // 450 2400001 CPF_Edit CPF_NeedCtorLink CPF_EditorData
    virtual ~ASBBasePortal(void);
    virtual unsigned int GetCPPSize(void);
    ASBBasePortal(class ASBBasePortal const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ASBBasePortal & operator=(class ASBBasePortal const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    ASBBasePortal(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Base_Notification
//------------------------------------------------------------------------------

//  Base_Notification.RemoveListener 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UBase_Notification_execRemoveListener_Parms {
  class UObject* Object;  // 0 80 CPF_Parm
};


//  Base_Notification.AddListener 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UBase_Notification_execAddListener_Parms {
  class UObject* Object;  // 0 80 CPF_Parm
  FName funcName;  // 4 80 CPF_Parm
};


//  Base_Notification.Delete 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_Notification_execDelete_Parms {
};


// UBase_Notification 10000012 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UBase_Notification : public UObject {
  public:
    INT mNotificationData;  // 28 800000 CPF_Unk_00800000
    virtual ~UBase_Notification(void);
    virtual unsigned int GetCPPSize(void);
    UBase_Notification(class UBase_Notification const &);
    UBase_Notification(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UBase_Notification & operator=(class UBase_Notification const &);
    void AddListener(class UObject *,class FName);
    void Delete(void);
    static void CDECL InternalConstructor(void *);
    void RemoveListener(class UObject *);
    static class UClass * CDECL StaticClass(void);
    void execAddListener(struct FFrame &,void * const);
    void execDelete(struct FFrame &,void * const);
    void execRemoveListener(struct FFrame &,void * const);
  protected:
    void Trigger(void *);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UBase_Notification,0,execAddListener)
AUTOGENERATE_FUNCTION(UBase_Notification,0,execDelete)
AUTOGENERATE_FUNCTION(UBase_Notification,0,execRemoveListener)


//------------------------------------------------------------------------------
//  Base_GameServer
//------------------------------------------------------------------------------

//  Base_GameServer.sv_OnCreateInstanceNAck 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UBase_GameServer_eventsv_OnCreateInstanceNAck_Parms {
  INT InstanceID;  // 0 80 CPF_Parm
};


//  Base_GameServer.sv_OnCreateInstanceAck 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UBase_GameServer_eventsv_OnCreateInstanceAck_Parms {
  INT InstanceID;  // 0 80 CPF_Parm
  INT zoneID;  // 4 80 CPF_Parm
};


//  Base_GameServer.LoginToWorldByID 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameServer_execLoginToWorldByID_Parms {
  INT _worldID;  // 0 80 CPF_Parm
  INT _characterID;  // 4 80 CPF_Parm
  class FString _portalName;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString _routeName;  // 10 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_GameServer.GetPortalDestinationWorldID 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameServer_execGetPortalDestinationWorldID_Parms {
  class UObject* _gamePortal;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_GameServer.LoginToWorldByPortal 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameServer_execLoginToWorldByPortal_Parms {
  class UObject* _gamePortal;  // 0 80 CPF_Parm
  INT _characterID;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UBase_GameServer 11E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed CLASS_NoExport )
class DLL_IMPORT UBase_GameServer : public UGameEngine/*,FExec*/  {
  public:
    INT ServerMode;  // 1A0 0
    class FString ServerOptions;  // 1A4 400000 CPF_NeedCtorLink
    BITFIELD IsPvPServer : 1;  // 1AC 0
    INT mGameServerData;  // 1B0 800000 CPF_Unk_00800000
    virtual ~UBase_GameServer(void);
    UBase_GameServer(class UBase_GameServer const &);
    UBase_GameServer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UBase_GameServer & operator=(class UBase_GameServer const &);
    static class UClass * CDECL StaticClass(void);
    void execGetPortalDestinationWorldID(struct FFrame &,void * const);
    void execLoginToWorldByID(struct FFrame &,void * const);
    void execLoginToWorldByPortal(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UBase_GameServer,0,execGetPortalDestinationWorldID)
AUTOGENERATE_FUNCTION(UBase_GameServer,0,execLoginToWorldByID)
AUTOGENERATE_FUNCTION(UBase_GameServer,0,execLoginToWorldByPortal)


//------------------------------------------------------------------------------
//  Base_GameClient
//------------------------------------------------------------------------------

//  Base_GameClient.QueryUniverses 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execQueryUniverses_Parms {
};


//  Base_GameClient.CancelConnectToUniverse 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execCancelConnectToUniverse_Parms {
};


//  Base_GameClient.ConnectToUniverse 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execConnectToUniverse_Parms {
  INT universeID;  // 0 80 CPF_Parm
};


//  Base_GameClient.CancelConnectToLogin 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execCancelConnectToLogin_Parms {
};


//  Base_GameClient.ConnectToLoginServer 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execConnectToLoginServer_Parms {
  class FString aUsername;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aPassword;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_GameClient.ForcedLogin 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execForcedLogin_Parms {
  INT Status;  // 0 80 CPF_Parm
};


//  Base_GameClient.StopSceneDump 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execStopSceneDump_Parms {
};


//  Base_GameClient.StartSceneDump 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execStartSceneDump_Parms {
};


//  Base_GameClient.GetUserName 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execGetUserName_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Base_GameClient.ApplyPatch 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execApplyPatch_Parms {
};


//  Base_GameClient.ContentUpdateErrorOK 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execContentUpdateErrorOK_Parms {
};


//  Base_GameClient.CancelContentUpdate 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execCancelContentUpdate_Parms {
};


//  Base_GameClient.GetContentUpdateProgress 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execGetContentUpdateProgress_Parms {
  INT peerCount;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT upSpeed;  // 4 180 CPF_Parm CPF_OutParm
  FLOAT downSpeed;  // 8 180 CPF_Parm CPF_OutParm
  class FString errorMessage;  // C 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  FLOAT ReturnValue;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Base_GameClient.Logout 20400 0 ( FUNC_Native FUNC_Public )
struct UBase_GameClient_execLogout_Parms {
  INT forcedReason;  // 0 90 CPF_OptionalParm CPF_Parm
};


// UBase_GameClient 11E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed CLASS_NoExport )
class DLL_IMPORT UBase_GameClient : public UGameEngine/*,FExec*/  {
  public:
    INT __LogoutState;  // 1A0 0
    INT __CurrentConnectedServer;  // 1A4 0
    INT __mUniverseDataPtr;  // 1A8 0
    INT mWorldID;  // 1AC 0
    BITFIELD IsPvPServer : 1;  // 1B0 0
    INT __mSplashScreenCloserPtr;  // 1B4 0
    class APlayerController* GPlayerController;  // 1B8 0
    FLOAT CellUpdateTime;  // 1BC 2 CPF_Const
    INT CurrentCell;  // 1C0 2000002 CPF_Const CPF_EditorData
    //virtual int Exec(unsigned short const *,class FOutputDevice &);
    virtual ~UBase_GameClient(void);
    virtual void Serialize(class FArchive &);
    virtual void Init(void);
    virtual void ReInit(void);
    virtual void Loop(float);
    virtual void Draw(class UViewport *,int,unsigned char *,int *);
    virtual void MouseDelta(class UViewport *,unsigned long,float,float);
    virtual void MousePosition(class UViewport *,unsigned long,float,float);
    virtual void MouseWheel(class UViewport *,unsigned long,int);
    virtual int shutdown(void);
    virtual class APlayerController * GetPlayerController(void);
    virtual bool is_client(void)const ;
    virtual void InitActors(class ULevel *,int,int);
    virtual void PostLevelLoad(void);
    virtual void CreateGameInfo(void);
    virtual int GetWorldID(void);
    virtual int GetInstanceID(void);
    virtual void OutputVersionInfo(class FOutputDevice &);
  protected:
    virtual bool is_valid_entity(void const *,bool);
    virtual bool is_valid_resource(void const *);
    virtual void handle_group_change(void *,int);
    virtual void login_status(int,int);
    virtual void handle_update(void *);
    virtual void handle_baseline(void *);
  public:
    UBase_GameClient(class UBase_GameClient const &);
    UBase_GameClient(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UBase_GameClient & operator=(class UBase_GameClient const &);
    bool ConnectToGameServer(class d_mmos::d_address const &,int,int);
    int ConnectToLoginServer(class FString const &,class FString const &);
    void ConnectToUniverse(int);
    void ForcedLogout(int);
    class USBWorld * GetCurrentWorld(void);
    class USBUniverse * GetUniverse(void);
    int InitEngine(void);
    void InitPlayerController(class APlayerController *);
    bool IsPvPServer(void);
    void ManageCell(struct FGridCell *,int);
    void ManageTickCell(struct FGridCell *,int);
    void OnForcedLogout(int,class FString const &);
    void OnSystemNotify(int,class FString const &);
    void PostLoadLevelSetCell(void);
    void PostLogin(void);
    void PostLogout(void);
    bool PreLogin(int,bool);
    void PreLogout(int);
    void QueryUniverses(void);
    void SetSplashScreenCloser(void (__cdecl*)(void));
    void SetUniverse(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    class APlayerController * SpawnPlayActor(class UPlayer *,enum ENetRole,class FString &);
    static class UClass * CDECL StaticClass(void);
    void UpdateCells(float);
    void UpdateGrid(class AActor *,int);
    void UpdateGrid(class UTerrainSector *,int);
    void execApplyPatch(struct FFrame &,void * const);
    void execCancelConnectToLogin(struct FFrame &,void * const);
    void execCancelConnectToUniverse(struct FFrame &,void * const);
    void execCancelContentUpdate(struct FFrame &,void * const);
    void execConnectToLoginServer(struct FFrame &,void * const);
    void execConnectToUniverse(struct FFrame &,void * const);
    void execContentUpdateErrorOK(struct FFrame &,void * const);
    void execForcedLogin(struct FFrame &,void * const);
    void execGetContentUpdateProgress(struct FFrame &,void * const);
    void execGetUserName(struct FFrame &,void * const);
    void execLogout(struct FFrame &,void * const);
    void execQueryUniverses(struct FFrame &,void * const);
    void execStartSceneDump(struct FFrame &,void * const);
    void execStopSceneDump(struct FFrame &,void * const);
  protected:
    void SaveBigScreenshot(int,int);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execApplyPatch)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execCancelConnectToLogin)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execCancelConnectToUniverse)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execCancelContentUpdate)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execConnectToLoginServer)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execConnectToUniverse)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execContentUpdateErrorOK)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execForcedLogin)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execGetContentUpdateProgress)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execGetUserName)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execLogout)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execQueryUniverses)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execStartSceneDump)
AUTOGENERATE_FUNCTION(UBase_GameClient,0,execStopSceneDump)


//------------------------------------------------------------------------------
//  NullClient
//------------------------------------------------------------------------------

// UNullClient 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UNullClient : public UClient {
  public:
    virtual ~UNullClient(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Init(class UEngine *);
    virtual void EnableViewportWindows(unsigned long,int);
    virtual void ShowViewportWindows(unsigned long,int);
    virtual void Tick(void);
    virtual int Exec(unsigned short const *,class FOutputDevice &);
    virtual class UViewport * NewViewport(class FName);
    virtual void MakeCurrent(class UViewport *);
    virtual class UViewport * GetLastCurrent(void);
    UNullClient(class UNullClient const &);
    UNullClient(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNullClient & operator=(class UNullClient const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  NullViewport
//------------------------------------------------------------------------------

// UNullViewport 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UNullViewport : public UViewport/*,FExec*/ /*,FOutputDevice*/  {
  public:
    virtual ~UNullViewport(void);
    virtual unsigned int GetCPPSize(void);
    virtual void * GetWindow(void);
    virtual int IsFullscreen(void);
    virtual int ResizeViewport(unsigned long,int,int,int);
    virtual void CloseWindow(void);
    virtual void SetModeCursor(void);
    virtual void UpdateWindowFrame(void);
    virtual void OpenWindow(unsigned long,int,int,int,int,int);
    virtual void UpdateInput(int,float);
    virtual void SetMouseCapture(int,int,int);
    virtual void Repaint(int);
    virtual int TryRenderDevice(unsigned short const *,int,int,int);
    virtual unsigned short * GetLocalizedKeyName(enum EInputKey);
    UNullViewport(class UNullViewport const &);
    UNullViewport(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNullViewport & operator=(class UNullViewport const &);
    class UClient * GetOuterUClient(void)const ;
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBTeamMember
//------------------------------------------------------------------------------

// USBTeamMember 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBTeamMember : public UObject {
  public:
    INT MemberHandle;  // 28 2000000 CPF_EditorData
    class FString Name;  // 2C 400000 CPF_NeedCtorLink
    FLOAT Health;  // 34 0
    FLOAT MaxHealth;  // 38 0
    INT Pep;  // 3C 0
    INT Fame;  // 40 0
    FLOAT Physique;  // 44 0
    FLOAT Morale;  // 48 0
    FLOAT Concentration;  // 4C 0
    INT StateRankShift;  // 50 0
    TArray<INT> Buffs;  // 54 400000 CPF_NeedCtorLink
    INT LastDuffUpdateTime;  // 60 0
    class APawn* AppearancePawn;  // 64 0
    BITFIELD IsLeader : 1;  // 68 0
    INT worldID;  // 6C 0
    virtual ~USBTeamMember(void);
    virtual unsigned int GetCPPSize(void);
    USBTeamMember(class USBTeamMember const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBTeamMember & operator=(class USBTeamMember const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBTeamMember(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBGuildMember
//------------------------------------------------------------------------------

// USBGuildMember 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBGuildMember : public UObject {
  public:
    INT CharacterID;  // 28 0
    INT ClassType;  // 2C 0
    INT Level;  // 30 0
    class FString Name;  // 34 400000 CPF_NeedCtorLink
    INT Location;  // 3C 0
    INT RankLevel;  // 40 0
    BITFIELD Online : 1;  // 44 0
    virtual ~USBGuildMember(void);
    virtual unsigned int GetCPPSize(void);
    USBGuildMember(class USBGuildMember const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBGuildMember & operator=(class USBGuildMember const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBGuildMember(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBFriendsMember
//------------------------------------------------------------------------------

// USBFriendsMember 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBFriendsMember : public UObject {
  public:
    class FString Name;  // 28 400000 CPF_NeedCtorLink
    INT Flag;  // 30 0
    INT CharacterID;  // 34 0
    INT Level;  // 38 0
    INT Class;  // 3C 0
    INT world;  // 40 0
    BITFIELD Online : 1;  // 44 0
    virtual ~USBFriendsMember(void);
    virtual unsigned int GetCPPSize(void);
    USBFriendsMember(class USBFriendsMember const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBFriendsMember & operator=(class USBFriendsMember const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBFriendsMember(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBWorldRules
//------------------------------------------------------------------------------

// USBWorldRules 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBWorldRules : public UObject {
  public:
    BITFIELD AllowPvP : 1;  // 28 1 CPF_Edit
    BITFIELD AllowChallenge : 1;  // 28 1 CPF_Edit
    BITFIELD AllowCombat : 1;  // 28 1 CPF_Edit
    BITFIELD InviteOnly : 1;  // 28 1 CPF_Edit
    virtual ~USBWorldRules(void);
    virtual unsigned int GetCPPSize(void);
    USBWorldRules(class USBWorldRules const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBWorldRules & operator=(class USBWorldRules const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBWorldRules(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBWorld
//------------------------------------------------------------------------------

enum eZoneWorldTypes {
  eZoneWorldTypes_RESERVED_0 = 0,
  ZWT_PERSISTENT = 1,
  ZWT_INSTANCED = 2,
  eZoneWorldTypes_RESERVED_3 = 3,
  ZWT_SUBINSTANCED = 4
};

// USBWorld 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBWorld : public UObject {
  public:
    INT worldID;  // 28 0
    class FString WorldName;  // 2C 400001 CPF_Edit CPF_NeedCtorLink
    class FString WorldFile;  // 34 2400001 CPF_Edit CPF_NeedCtorLink CPF_EditorData
    class ABase_GameInfo* GameInfo;  // 3C 16000001 CPF_Edit CPF_EditorData CPF_EditInline CPF_Unk_10000000
    class USBWorldRules* GameRules;  // 40 16000001 CPF_Edit CPF_EditorData CPF_EditInline CPF_Unk_10000000
    BYTE WorldType;  // 44 1 CPF_Edit
    INT InstanceMaxPlayers;  // 48 1 CPF_Edit
    INT InstanceMaxInstances;  // 4C 1 CPF_Edit
    INT InstanceLingerTime;  // 50 1 CPF_Edit
    BITFIELD InstanceAutoDestroy : 1;  // 54 1 CPF_Edit
    BITFIELD FreeToPlayAllowed : 1;  // 54 1 CPF_Edit
    TArray<class USBRoute*> ExitRoutes;  // 58 2400000 CPF_NeedCtorLink CPF_EditorData
    TArray<class USBPortal*> EntryPortals;  // 64 400000 CPF_NeedCtorLink
    TArray<class USBTravel*> TravelNPCs;  // 70 400000 CPF_NeedCtorLink
    class FString LoadingScreenTex;  // 7C 400000 CPF_NeedCtorLink
    class FString ExteriorMesh;  // 84 400000 CPF_NeedCtorLink
    FLOAT WorldWeight;  // 8C 1 CPF_Edit
    virtual ~USBWorld(void);
    virtual unsigned int GetCPPSize(void);
    USBWorld(class USBWorld const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBWorld & operator=(class USBWorld const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBWorld(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBUniverseRules
//------------------------------------------------------------------------------

// USBUniverseRules 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBUniverseRules : public UObject {
  public:
    BITFIELD PvP : 1;  // 28 1 CPF_Edit
    BITFIELD Bla : 1;  // 28 1 CPF_Edit
    BITFIELD Muek : 1;  // 28 1 CPF_Edit
    virtual ~USBUniverseRules(void);
    virtual unsigned int GetCPPSize(void);
    USBUniverseRules(class USBUniverseRules const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBUniverseRules & operator=(class USBUniverseRules const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBUniverseRules(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBUniverse
//------------------------------------------------------------------------------

// USBUniverse 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBUniverse : public UObject {
  public:
    class USBUniverseRules* GameRules;  // 28 14000001 CPF_Edit CPF_EditInline CPF_Unk_10000000
    class USBWorld* EntryWorld;  // 2C 14000001 CPF_Edit CPF_EditInline CPF_Unk_10000000
    class USBPortal* EntryPortal;  // 30 14000001 CPF_Edit CPF_EditInline CPF_Unk_10000000
    class USBWorld* LobbyWorld;  // 34 14000001 CPF_Edit CPF_EditInline CPF_Unk_10000000
    INT MaxPlayers;  // 38 1 CPF_Edit
    TArray<struct FLocalizedString> LocalizedInstanceNames;  // 3C 400001 CPF_Edit CPF_NeedCtorLink
    TArray<class USBWorld*> Worlds;  // 48 400000 CPF_NeedCtorLink
    virtual ~USBUniverse(void);
    virtual unsigned int GetCPPSize(void);
    USBUniverse(class USBUniverse const &);
    USBUniverse(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBUniverse & operator=(class USBUniverse const &);
    static void CDECL InternalConstructor(void *);
    int IsWorldFreeToPlay(int);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBTravel
//------------------------------------------------------------------------------

// USBTravel 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBTravel : public UObject {
  public:
    class FString Tag;  // 28 400000 CPF_NeedCtorLink
    TArray<class USBRoute*> Routes;  // 30 400000 CPF_NeedCtorLink
    virtual ~USBTravel(void);
    virtual unsigned int GetCPPSize(void);
    USBTravel(class USBTravel const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBTravel & operator=(class USBTravel const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBTravel(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Base_InstanceType
//------------------------------------------------------------------------------

// ABase_InstanceType 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT ABase_InstanceType : public ASBActor {
  public:
    virtual ~ABase_InstanceType(void);
    virtual unsigned int GetCPPSize(void);
    ABase_InstanceType(class ABase_InstanceType const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ABase_InstanceType & operator=(class ABase_InstanceType const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    ABase_InstanceType(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  ReleaseToCMSCommandlet
//------------------------------------------------------------------------------

// UReleaseToCMSCommandlet 3A ( CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized )
class DLL_IMPORT UReleaseToCMSCommandlet : public UCommandlet {
  public:
    virtual ~UReleaseToCMSCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    UReleaseToCMSCommandlet(class UReleaseToCMSCommandlet const &);
    UReleaseToCMSCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UReleaseToCMSCommandlet & operator=(class UReleaseToCMSCommandlet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBDBAsync
//------------------------------------------------------------------------------

// FSetPersistentVariableParams 0 ( )
struct DLL_IMPORT FSetPersistentVariableParams {
  public:
    INT character_id;  // 0 0
    INT context_id;  // 4 0
    INT value_id;  // 8 0
    INT Value;  // C 0
    class APawn* Pawn;  // 10 0
    struct FSetPersistentVariableParams & operator=(struct FSetPersistentVariableParams const &);
};

// FSBDBAsyncCallback 0 ( )
struct DLL_IMPORT FSBDBAsyncCallback {
  public:
    FName ObjectName;  // 0 0
    FName funcName;  // 4 0
    INT UserData;  // 8 0
    DWORD NativeFunction;  // C 2000 CPF_Transient
    FSBDBAsyncCallback(void);
    struct FSBDBAsyncCallback & operator=(struct FSBDBAsyncCallback const &);
};

//  SBDBAsync.SetPersistentPlayerVariable 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execSetPersistentPlayerVariable_Parms {
  class APawn* Pawn;  // 0 80 CPF_Parm
  INT character_id;  // 4 80 CPF_Parm
  INT context_id;  // 8 80 CPF_Parm
  INT value_id;  // C 80 CPF_Parm
  INT Value;  // 10 80 CPF_Parm
};


//  SBDBAsync.UpdateStatueNewPlayerByTag 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execUpdateStatueNewPlayerByTag_Parms {
  class APawn* Pawn;  // 0 80 CPF_Parm
  class FString Tag;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  INT new_character_id;  // C 80 CPF_Parm
  class FString new_player_name;  // 10 400080 CPF_Parm CPF_NeedCtorLink
  class FString new_title;  // 18 400080 CPF_Parm CPF_NeedCtorLink
  class FString new_description;  // 20 400080 CPF_Parm CPF_NeedCtorLink
  TArray<BYTE> new_loddata0;  // 28 400080 CPF_Parm CPF_NeedCtorLink
  TArray<BYTE> new_loddata1;  // 34 400080 CPF_Parm CPF_NeedCtorLink
  TArray<BYTE> new_loddata2;  // 40 400080 CPF_Parm CPF_NeedCtorLink
  TArray<BYTE> new_loddata3;  // 4C 400080 CPF_Parm CPF_NeedCtorLink
  INT new_awarded_timestamp;  // 58 80 CPF_Parm
  INT new_pose;  // 5C 80 CPF_Parm
};


//  SBDBAsync.GetStatueEnabledByTag 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execGetStatueEnabledByTag_Parms {
  class APawn* aPawn;  // 0 80 CPF_Parm
  class FString Tag;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  struct FSBDBAsyncCallback callback;  // C 80 CPF_Parm
};


//  SBDBAsync.SetQuestObjective 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execSetQuestObjective_Parms {
  class APawn* Pawn;  // 0 80 CPF_Parm
  INT CharacterID;  // 4 80 CPF_Parm
  INT objectiveID;  // 8 80 CPF_Parm
  INT Value;  // C 80 CPF_Parm
  struct FSBDBAsyncCallback callback;  // 10 80 CPF_Parm
};


//  SBDBAsync.SetCharacterSkilldeckSkills 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execSetCharacterSkilldeckSkills_Parms {
  class APawn* Pawn;  // 0 80 CPF_Parm
  INT character_id;  // 4 80 CPF_Parm
  INT skilldeck_id;  // 8 80 CPF_Parm
  TArray<INT> skilldeck_skills;  // C 400080 CPF_Parm CPF_NeedCtorLink
};


//  SBDBAsync.LogCSCommand 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execLogCSCommand_Parms {
  INT aCSAccountID;  // 0 80 CPF_Parm
  class FString aCSname;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FString aCommand;  // C 400080 CPF_Parm CPF_NeedCtorLink
  INT aPlayerAccountID;  // 14 80 CPF_Parm
  class FString aPlayerName;  // 18 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString aMessage;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString lootItems;  // 28 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString muteScope;  // 30 400890 CPF_OptionalParm CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  INT muteDuration;  // 38 90 CPF_OptionalParm CPF_Parm
  class FString killDetails;  // 3C 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  SBDBAsync.SetCharacterFaction 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execSetCharacterFaction_Parms {
  class APawn* Pawn;  // 0 80 CPF_Parm
  INT Id;  // 4 80 CPF_Parm
  INT faction_id;  // 8 80 CPF_Parm
};


//  SBDBAsync.SetCharacterClass 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execSetCharacterClass_Parms {
  class APawn* Pawn;  // 0 80 CPF_Parm
  INT Id;  // 4 80 CPF_Parm
  INT class_id;  // 8 80 CPF_Parm
};


//  SBDBAsync.UpdateCharacterFamePep 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execUpdateCharacterFamePep_Parms {
  class APawn* Pawn;  // 0 80 CPF_Parm
  INT Id;  // 4 80 CPF_Parm
  FLOAT fame_points;  // 8 80 CPF_Parm
  FLOAT pep_points;  // C 80 CPF_Parm
};


//  SBDBAsync.UpdateCharacterHealth 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBAsync_execUpdateCharacterHealth_Parms {
  class APawn* Pawn;  // 0 80 CPF_Parm
  INT Id;  // 4 80 CPF_Parm
  FLOAT Health;  // 8 80 CPF_Parm
};


// USBDBAsync 4012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT USBDBAsync : public UObject {
  public:
    virtual ~USBDBAsync(void);
    virtual unsigned int GetCPPSize(void);
    USBDBAsync(class USBDBAsync const &);
    USBDBAsync(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBDBAsync & operator=(class USBDBAsync const &);
    static bool CDECL HandleCallback(void *,class FName,class FName);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetStatueEnabledByTag(struct FFrame &,void * const);
    void execLogCSCommand(struct FFrame &,void * const);
    void execSetCharacterClass(struct FFrame &,void * const);
    void execSetCharacterFaction(struct FFrame &,void * const);
    void execSetCharacterSkilldeckSkills(struct FFrame &,void * const);
    void execSetPersistentPlayerVariable(struct FFrame &,void * const);
    void execSetQuestObjective(struct FFrame &,void * const);
    void execUpdateCharacterFamePep(struct FFrame &,void * const);
    void execUpdateCharacterHealth(struct FFrame &,void * const);
    void execUpdateStatueNewPlayerByTag(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(USBDBAsync,0,execGetStatueEnabledByTag)
AUTOGENERATE_FUNCTION(USBDBAsync,0,execLogCSCommand)
AUTOGENERATE_FUNCTION(USBDBAsync,0,execSetCharacterClass)
AUTOGENERATE_FUNCTION(USBDBAsync,0,execSetCharacterFaction)
AUTOGENERATE_FUNCTION(USBDBAsync,0,execSetCharacterSkilldeckSkills)
AUTOGENERATE_FUNCTION(USBDBAsync,0,execSetPersistentPlayerVariable)
AUTOGENERATE_FUNCTION(USBDBAsync,0,execSetQuestObjective)
AUTOGENERATE_FUNCTION(USBDBAsync,0,execUpdateCharacterFamePep)
AUTOGENERATE_FUNCTION(USBDBAsync,0,execUpdateCharacterHealth)
AUTOGENERATE_FUNCTION(USBDBAsync,0,execUpdateStatueNewPlayerByTag)


//------------------------------------------------------------------------------
//  SBDBSync
//------------------------------------------------------------------------------

//  SBDBSync.GetQuestFame 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetQuestFame_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetKillFame 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetKillFame_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetFameToReachFameLevel 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetFameToReachFameLevel_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetAttributePoints 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetAttributePoints_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetSkillTokenCount 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetSkillTokenCount_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetSkillCount 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetSkillCount_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetComtbatBarColumns 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetComtbatBarColumns_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetComtbatBarRows 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetComtbatBarRows_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetSkillTier 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetSkillTier_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.ValidFameLevel 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execValidFameLevel_Parms {
  INT FameLevel;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetFameLevelCount 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetFameLevelCount_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetHighestFameLevel 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetHighestFameLevel_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetLowestFameLevel 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetLowestFameLevel_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetDescription 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetDescription_Parms {
  INT Id;  // 0 80 CPF_Parm
  INT language_id;  // 4 90 CPF_OptionalParm CPF_Parm
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  SBDBSync.GetResourceObject 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetResourceObject_Parms {
  INT resource_id;  // 0 80 CPF_Parm
  class UObject* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.CreateResourceId 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execCreateResourceId_Parms {
  class FString PathName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBDBSync.GetPathName 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetPathName_Parms {
  INT resource_id;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  SBDBSync.GetResourceId 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct USBDBSync_execGetResourceId_Parms {
  class FString PathName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// USBDBSync 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBDBSync : public UObject {
  public:
    virtual ~USBDBSync(void);
    virtual unsigned int GetCPPSize(void);
    USBDBSync(class USBDBSync const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBDBSync & operator=(class USBDBSync const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execCreateResourceId(struct FFrame &,void * const);
    void execGetAttributePoints(struct FFrame &,void * const);
    void execGetComtbatBarColumns(struct FFrame &,void * const);
    void execGetComtbatBarRows(struct FFrame &,void * const);
    void execGetDescription(struct FFrame &,void * const);
    void execGetFameLevelCount(struct FFrame &,void * const);
    void execGetFameToReachFameLevel(struct FFrame &,void * const);
    void execGetHighestFameLevel(struct FFrame &,void * const);
    void execGetKillFame(struct FFrame &,void * const);
    void execGetLowestFameLevel(struct FFrame &,void * const);
    void execGetPathName(struct FFrame &,void * const);
    void execGetQuestFame(struct FFrame &,void * const);
    void execGetResourceId(struct FFrame &,void * const);
    void execGetResourceObject(struct FFrame &,void * const);
    void execGetSkillCount(struct FFrame &,void * const);
    void execGetSkillTier(struct FFrame &,void * const);
    void execGetSkillTokenCount(struct FFrame &,void * const);
    void execValidFameLevel(struct FFrame &,void * const);
  protected:
    USBDBSync(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(USBDBSync,0,execCreateResourceId)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetAttributePoints)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetComtbatBarColumns)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetComtbatBarRows)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetDescription)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetFameLevelCount)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetFameToReachFameLevel)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetHighestFameLevel)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetKillFame)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetLowestFameLevel)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetPathName)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetQuestFame)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetResourceId)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetResourceObject)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetSkillCount)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetSkillTier)
AUTOGENERATE_FUNCTION(USBDBSync,0,execGetSkillTokenCount)
AUTOGENERATE_FUNCTION(USBDBSync,0,execValidFameLevel)


//------------------------------------------------------------------------------
//  Base_DBObject
//------------------------------------------------------------------------------

// UBase_DBObject 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UBase_DBObject : public UObject {
  public:
    INT _Mask;  // 28 0
    virtual ~UBase_DBObject(void);
    virtual unsigned int GetCPPSize(void);
    UBase_DBObject(class UBase_DBObject const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UBase_DBObject & operator=(class UBase_DBObject const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UBase_DBObject(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  DB_QuestRequirement
//------------------------------------------------------------------------------

// UDB_QuestRequirement 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UDB_QuestRequirement : public UBase_DBObject {
  public:
    INT Id;  // 2C 0
    INT CharacterID;  // 30 0
    INT QuestReqId;  // 34 0
    INT Param0;  // 38 0
    INT Param1;  // 3C 0
    INT Param2;  // 40 0
    INT Param3;  // 44 0
    INT Param4;  // 48 0
    INT Param5;  // 4C 0
    BYTE Enabled;  // 50 0
    BYTE Completed;  // 51 0
    virtual ~UDB_QuestRequirement(void);
    virtual unsigned int GetCPPSize(void);
    UDB_QuestRequirement(class UDB_QuestRequirement const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UDB_QuestRequirement & operator=(class UDB_QuestRequirement const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UDB_QuestRequirement(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  DB_Skill
//------------------------------------------------------------------------------

// UDB_Skill 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UDB_Skill : public UBase_DBObject {
  public:
    INT ActionRid;  // 2C 0
    INT LogoRid;  // 30 0
    virtual ~UDB_Skill(void);
    virtual unsigned int GetCPPSize(void);
    UDB_Skill(class UDB_Skill const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UDB_Skill & operator=(class UDB_Skill const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UDB_Skill(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  DB_Item
//------------------------------------------------------------------------------

// UDB_Item 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UDB_Item : public UBase_DBObject {
  public:
    INT Id;  // 2C 0
    INT ItemTypeID;  // 30 0
    INT CharacterID;  // 34 0
    BYTE LocationType;  // 38 0
    INT LocationID;  // 3C 0
    INT LocationSlot;  // 40 0
    INT StackSize;  // 44 0
    BYTE Attuned;  // 48 0
    BYTE Color1;  // 49 0
    BYTE Color2;  // 4A 0
    INT Serial;  // 4C 0
    virtual ~UDB_Item(void);
    virtual unsigned int GetCPPSize(void);
    UDB_Item(class UDB_Item const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UDB_Item & operator=(class UDB_Item const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UDB_Item(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  DB_CharacterSkill
//------------------------------------------------------------------------------

// UDB_CharacterSkill 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UDB_CharacterSkill : public UBase_DBObject {
  public:
    INT CharacterID;  // 2C 0
    INT SkillID;  // 30 0
    INT TokenSlots;  // 34 0
    virtual ~UDB_CharacterSkill(void);
    virtual unsigned int GetCPPSize(void);
    UDB_CharacterSkill(class UDB_CharacterSkill const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UDB_CharacterSkill & operator=(class UDB_CharacterSkill const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UDB_CharacterSkill(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  DB_SkillDeck
//------------------------------------------------------------------------------

// UDB_SkillDeck 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UDB_SkillDeck : public UObject {
  public:
    INT Id;  // 28 0
    class FString mName;  // 2C 400000 CPF_NeedCtorLink
    TArray<INT> mSkills;  // 34 400000 CPF_NeedCtorLink
    virtual ~UDB_SkillDeck(void);
    virtual unsigned int GetCPPSize(void);
    UDB_SkillDeck(class UDB_SkillDeck const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UDB_SkillDeck & operator=(class UDB_SkillDeck const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UDB_SkillDeck(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  DB_Guild
//------------------------------------------------------------------------------

// UDB_Guild 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UDB_Guild : public UBase_DBObject {
  public:
    INT GroupId;  // 2C 0
    INT MotdTextId;  // 30 0
    INT LogoId;  // 34 0
    INT Color1;  // 38 0
    INT Color2;  // 3C 0
    TArray<class UDB_Character*> mGuildMembers;  // 40 400002 CPF_Const CPF_NeedCtorLink
    BITFIELD mGuildMembersSet : 1;  // 4C 2 CPF_Const
    virtual ~UDB_Guild(void);
    virtual unsigned int GetCPPSize(void);
    UDB_Guild(class UDB_Guild const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UDB_Guild & operator=(class UDB_Guild const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UDB_Guild(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  DB_CharacterSheet
//------------------------------------------------------------------------------

// UDB_CharacterSheet 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UDB_CharacterSheet : public UBase_DBObject {
  public:
    INT ClassId;  // 2C 0
    FLOAT FamePoints;  // 30 0
    FLOAT PepPoints;  // 34 0
    FLOAT Health;  // 38 0
    INT SelectedSkilldeckID;  // 3C 0
    BYTE ExtraBodyPoints;  // 40 0
    BYTE ExtraMindPoints;  // 41 0
    BYTE ExtraFocusPoints;  // 42 0
    virtual ~UDB_CharacterSheet(void);
    virtual unsigned int GetCPPSize(void);
    UDB_CharacterSheet(class UDB_CharacterSheet const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UDB_CharacterSheet & operator=(class UDB_CharacterSheet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UDB_CharacterSheet(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  DB_Character
//------------------------------------------------------------------------------

// UDB_Character 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UDB_Character : public UBase_DBObject {
  public:
    INT Id;  // 2C 0
    BYTE Dead;  // 30 0
    INT AccountID;  // 34 0
    class FVector Location;  // 38 0
    INT worldID;  // 44 0
    INT Money;  // 48 0
    INT AppearancePart1;  // 4C 2000000 CPF_EditorData
    INT AppearancePart2;  // 50 2000000 CPF_EditorData
    class FRotator Rotation;  // 54 2000000 CPF_EditorData
    INT FactionId;  // 60 0
    INT LastUsedTimestamp;  // 64 0
    class FString Name;  // 68 400000 CPF_NeedCtorLink
    virtual ~UDB_Character(void);
    virtual unsigned int GetCPPSize(void);
    UDB_Character(class UDB_Character const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UDB_Character & operator=(class UDB_Character const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UDB_Character(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBClock
//------------------------------------------------------------------------------

enum EDayTime {
  EDT_Night = 0,
  EDT_Morning = 1,
  EDT_Afternoon = 2,
  EDT_Evening = 3
};

//  SBClock.NaturalFormat 20002 0 ( FUNC_Defined FUNC_Public )
struct USBClock_execNaturalFormat_Parms {
  FLOAT aRelativeTimeOfDay;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  SBClock.SetFixedRelativeTimeOfDay 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct USBClock_eventSetFixedRelativeTimeOfDay_Parms {
  FLOAT aFixedRelativeTimeOfDay;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBClock.SetTimeSpeedUpFactor 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct USBClock_eventSetTimeSpeedUpFactor_Parms {
  FLOAT aSpeedUpFactor;  // 0 80 CPF_Parm
};


//  SBClock.GetTimeOfDay 20400 0 ( FUNC_Native FUNC_Public )
struct USBClock_execGetTimeOfDay_Parms {
  BYTE ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBClock.GetCurrentTime 20002 0 ( FUNC_Defined FUNC_Public )
struct USBClock_execGetCurrentTime_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBClock.GetFormatted 20400 0 ( FUNC_Native FUNC_Public )
struct USBClock_execGetFormatted_Parms {
  class FString aFormat;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  SBClock.GetRelativeTimeOfDay 20400 0 ( FUNC_Native FUNC_Public )
struct USBClock_execGetRelativeTimeOfDay_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBClock.cl_OnUpdate 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct USBClock_eventcl_OnUpdate_Parms {
};


//  SBClock.cl_OnFrame 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct USBClock_eventcl_OnFrame_Parms {
  FLOAT delta;  // 0 80 CPF_Parm
};


// USBClock 204012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT USBClock : public UBase_Component {
  public:
    INT mReplicatedRealWorldTime;  // 40 0
    INT mCurrentRealWorldTime;  // 44 2000000 CPF_EditorData
    DWORD mSBTime;  // 48 2002000 CPF_Transient CPF_EditorData
    FLOAT mLastUpdate;  // 4C 2000000 CPF_EditorData
    INT mInitialUpdatePerformed;  // 50 0
    FLOAT mTimeSpeedUpFactor;  // 54 0
    INT mTimeDelta;  // 58 2000000 CPF_EditorData
    virtual ~USBClock(void);
    virtual unsigned int GetCPPSize(void);
    virtual void sv_OnFrame(float);
    USBClock(class USBClock const &);
    USBClock(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBClock & operator=(class USBClock const &);
    void AssureSBTimeInstance(void);
    class FString GetFormatted(class FString);
    float GetRelativeTimeOfDay(void);
    enum EDayTime GetTimeOfDay(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UnpackAddStream(struct S2R_SBCLOCK_ADD_STREAM const &);
    float eventSetFixedRelativeTimeOfDay(float);
    void eventSetTimeSpeedUpFactor(float);
    void eventcl_OnFrame(float);
    void execGetFormatted(struct FFrame &,void * const);
    void execGetRelativeTimeOfDay(struct FFrame &,void * const);
    void execGetTimeOfDay(struct FFrame &,void * const);
    void execcl_OnFrame(struct FFrame &,void * const);
    void execcl_OnUpdate(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(USBClock,0,execGetFormatted)
AUTOGENERATE_FUNCTION(USBClock,0,execGetRelativeTimeOfDay)
AUTOGENERATE_FUNCTION(USBClock,0,execGetTimeOfDay)
AUTOGENERATE_FUNCTION(USBClock,0,execcl_OnFrame)
AUTOGENERATE_FUNCTION(USBClock,0,execcl_OnUpdate)


//------------------------------------------------------------------------------
//  DB_Team
//------------------------------------------------------------------------------

// UDB_Team 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UDB_Team : public UObject {
};


//------------------------------------------------------------------------------
//  SBZoneManager
//------------------------------------------------------------------------------

// ASBZoneManager 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT ASBZoneManager : public ASBActor {
};



//------------------------------------------------------------------------------
//  d_mmos::d_connector<struct packet_id_CL>
//------------------------------------------------------------------------------

template struct DLL_IMPORT d_mmos::d_connector<struct packet_id_CL> {
  public:
    virtual ~d_connector<struct packet_id_CL>(void);
    virtual enum d_mmos::PACKET_ID_TYPE const GetPacketIDType(void)const ;
    d_connector<struct packet_id_CL>(void);
};

//------------------------------------------------------------------------------
//  d_mmos::d_connector<struct packet_id_CS>
//------------------------------------------------------------------------------

template struct DLL_IMPORT d_mmos::d_connector<struct packet_id_CS> {
  public:
    virtual ~d_connector<struct packet_id_CS>(void);
    virtual enum d_mmos::PACKET_ID_TYPE const GetPacketIDType(void)const ;
    d_connector<struct packet_id_CS>(void);
};

//------------------------------------------------------------------------------
//  d_relevance
//------------------------------------------------------------------------------

class DLL_IMPORT d_relevance {
  public:
    virtual d_mmos::d_objmanager<class d_relevance_object>::~d_objmanager<class d_relevance::d_relevance_object>(void);
    d_mmos::d_objmanager<class d_relevance_object>::d_objmanager<class d_relevance::d_relevance_object>(class d_mmos::d_objmanager<class d_relevance::d_relevance_object> const &);
    d_mmos::d_objmanager<class d_relevance_object>::d_objmanager<class d_relevance::d_relevance_object>(void);
};

//------------------------------------------------------------------------------
//  Dummy_StringProvider
//------------------------------------------------------------------------------

class DLL_IMPORT Dummy_StringProvider {
  public:
    virtual ~Dummy_StringProvider(void);
    virtual void LoadDescription(struct FLocalizedString &);
    virtual void SaveDescription(struct FLocalizedString &);
    Dummy_StringProvider(class Dummy_StringProvider const &);
    Dummy_StringProvider(void);
    class Dummy_StringProvider & operator=(class Dummy_StringProvider const &);
    static class Dummy_StringProvider & CDECL get_instance(void);
    static bool CDECL has_instance(void);
};

//------------------------------------------------------------------------------
//  SBZoneInterface
//------------------------------------------------------------------------------

class DLL_IMPORT SBZoneInterface {
  public:
    SBZoneInterface(void);
    ~SBZoneInterface(void);
    class SBZoneInterface & operator=(class SBZoneInterface const &);
    void Serialize(class FArchive &);
    static class SBZoneInterface & CDECL get_instance(void);
    bool get_routes(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,int,class std::vector<struct SBZoneInterface::route_setup,class std::allocator<struct SBZoneInterface::route_setup> > *);
    bool get_universe(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,struct SBZoneInterface::universe_setup *);
    bool get_universes(class std::vector<struct SBZoneInterface::universe_setup,class std::allocator<struct SBZoneInterface::universe_setup> > *);
    bool get_world(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,int,struct SBZoneInterface::world_setup *);
    bool get_worlds(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,class std::vector<struct SBZoneInterface::world_setup,class std::allocator<struct SBZoneInterface::world_setup> > *);
    static bool CDECL has_instance(void);
};

//------------------------------------------------------------------------------
//  Static_StringProvider
//------------------------------------------------------------------------------

class DLL_IMPORT Static_StringProvider {
  public:
    virtual ~Static_StringProvider(void);
    virtual void LoadDescription(struct FLocalizedString &);
    virtual void SaveDescription(struct FLocalizedString &);
    Static_StringProvider(class Static_StringProvider const &);
    Static_StringProvider(void);
    class Static_StringProvider & operator=(class Static_StringProvider const &);
    static class Static_StringProvider & CDECL get_instance(void);
    static bool CDECL has_instance(void);
};

//------------------------------------------------------------------------------
//  d_relevance::d_relevance_object
//------------------------------------------------------------------------------

class DLL_IMPORT d_relevance::d_relevance_object {
  protected:
    virtual ~d_relevance_object(void);
  public:
    d_relevance_object(class d_relevance::d_relevance_object const &);
    class d_relevance::d_relevance_object & operator=(class d_relevance::d_relevance_object const &);
    unsigned int const get_relevance_object_id(void)const ;
  protected:
    d_relevance_object(void);
};

//------------------------------------------------------------------------------
//  d_relevance::d_relevance_object_manager
//------------------------------------------------------------------------------

class DLL_IMPORT d_relevance::d_relevance_object_manager {
  public:
    virtual ~d_relevance_object_manager(void);
    d_relevance_object_manager(class d_relevance::d_relevance_object_manager const &);
    class d_relevance::d_relevance_object_manager & operator=(class d_relevance::d_relevance_object_manager const &);
    bool const add(unsigned int,class d_relevance::d_relevance_object *);
    class d_relevance::d_relevance_object * find(unsigned int);
    class d_relevance::d_relevance_object const * find(unsigned int)const ;
    static class d_relevance::d_relevance_object_manager & CDECL get_instance(void);
    static bool CDECL has_instance(void);
    bool const remove(unsigned int);
    void remove_all(void);
  private:
    d_relevance_object_manager(void);
};

//------------------------------------------------------------------------------
//  sb_client::s_game_server
//------------------------------------------------------------------------------

class DLL_IMPORT sb_client::s_game_server {
  public:
    virtual ~s_game_server(void);
    virtual void finish(void);
    virtual void on_disconnected(enum d_mmos::D_DISCONNECT_REASON,class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &);
    virtual bool const connect(class d_mmos::d_address const &);
    enum peLoginState get_LoginState(void);
    enum peLogoutState get_LogoutState(void);
    static class sb_client::s_game_server & CDECL get_instance(void);
    static bool CDECL has_instance(void);
    bool is_GameConnected(void);
    bool const reInit(void);
    void set_GameConnected(bool);
    void set_LoginState(enum peLoginState);
    void set_LogoutState(enum peLogoutState);
    void set_ReConnectInfo(class d_mmos::d_address const &,int);
  private:
    s_game_server(void);
};

//------------------------------------------------------------------------------
//  sb_client::s_login_server
//------------------------------------------------------------------------------

class DLL_IMPORT sb_client::s_login_server {
  public:
    virtual ~s_login_server(void);
    virtual void finish(void);
    virtual void on_disconnected(enum d_mmos::D_DISCONNECT_REASON,class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &);
    bool const connect(void);
    enum peLogoutState get_LogoutState(void);
    static class sb_client::s_login_server & CDECL get_instance(void);
    static bool CDECL has_instance(void);
    bool const init(class d_mmos::d_address const &,unsigned int,unsigned int,class d_mmos::d_i_packet_handler_manager *);
    bool is_LoginConnected(void);
    void set_LogoutState(enum peLogoutState);
  private:
    s_login_server(void);
};

//------------------------------------------------------------------------------
//  d_mmos::d_objmanager<class d_relevance::d_relevance_object>
//------------------------------------------------------------------------------

template class DLL_IMPORT d_mmos::d_objmanager<class d_relevance::d_relevance_object> {
  public:
    class d_mmos::d_objmanager<class d_relevance::d_relevance_object> & operator=(class d_mmos::d_objmanager<class d_relevance::d_relevance_object> const &);
    bool const add_object(unsigned int,class d_relevance::d_relevance_object *);
    class d_relevance::d_relevance_object * find_object(unsigned int);
    class d_relevance::d_relevance_object const * find_object(unsigned int)const ;
    class std::list<unsigned int,class boost::fast_pool_allocator<unsigned int *,struct boost::default_user_allocator_new_delete,class boost::details::pool::null_mutex,32> > & get_keys(void);
    class std::list<unsigned int,class boost::fast_pool_allocator<unsigned int *,struct boost::default_user_allocator_new_delete,class boost::details::pool::null_mutex,32> > const & get_keys(void)const ;
    class std::map<unsigned int,struct MAP_VALUE,struct std::less<unsigned int>,class std::allocator<struct std::pair<unsigned int const ,struct d_mmos::d_objmanager<class d_relevance::d_relevance_object>::MAP_VALUE> > > & d_mmos::d_objmanager<class d_relevance::d_relevance_object>::get_map(void);
    class std::map<unsigned int,struct MAP_VALUE,struct std::less<unsigned int>,class std::allocator<struct std::pair<unsigned int const ,struct d_mmos::d_objmanager<class d_relevance::d_relevance_object>::MAP_VALUE> > > const & d_mmos::d_objmanager<class d_relevance::d_relevance_object>::get_map(void)const ;
    class std::list<class d_relevance::d_relevance_object *,class boost::fast_pool_allocator<class d_relevance::d_relevance_object *,struct boost::default_user_allocator_new_delete,class boost::details::pool::null_mutex,32> > & get_objects(void);
    class std::list<class d_relevance::d_relevance_object *,class boost::fast_pool_allocator<class d_relevance::d_relevance_object *,struct boost::default_user_allocator_new_delete,class boost::details::pool::null_mutex,32> > const & get_objects(void)const ;
    unsigned int const get_size(void)const ;
    bool const is_empty(void)const ;
    bool const is_exist_object(unsigned int)const ;
    void remove_all_object(void);
    bool const remove_object(unsigned int);
};

//------------------------------------------------------------------------------
//  `d_relevance
//------------------------------------------------------------------------------

struct DLL_IMPORT `d_relevance {
};


AUTOGENERATE_CLASS(ABase_Controller)
AUTOGENERATE_CLASS(ABase_GameInfo)
AUTOGENERATE_CLASS(ABase_InstanceType)
AUTOGENERATE_CLASS(ABase_Pawn)
AUTOGENERATE_CLASS(ASBBasePortal)
AUTOGENERATE_CLASS(UBase_Component)
AUTOGENERATE_CLASS(UBase_DBObject)
AUTOGENERATE_CLASS(UBase_GameClient)
AUTOGENERATE_CLASS(UBase_GameServer)
AUTOGENERATE_CLASS(UBase_Notification)
AUTOGENERATE_CLASS(UDB_Character)
AUTOGENERATE_CLASS(UDB_CharacterSheet)
AUTOGENERATE_CLASS(UDB_CharacterSkill)
AUTOGENERATE_CLASS(UDB_Guild)
AUTOGENERATE_CLASS(UDB_Item)
AUTOGENERATE_CLASS(UDB_QuestRequirement)
AUTOGENERATE_CLASS(UDB_Skill)
AUTOGENERATE_CLASS(UDB_SkillDeck)
AUTOGENERATE_CLASS(UNullClient)
AUTOGENERATE_CLASS(UNullViewport)
AUTOGENERATE_CLASS(UReleaseToCMSCommandlet)
AUTOGENERATE_CLASS(USBClock)
AUTOGENERATE_CLASS(USBDBAsync)
AUTOGENERATE_CLASS(USBDBSync)
AUTOGENERATE_CLASS(USBFriendsMember)
AUTOGENERATE_CLASS(USBGuildMember)
AUTOGENERATE_CLASS(USBPortal)
AUTOGENERATE_CLASS(USBRoute)
AUTOGENERATE_CLASS(USBTeamMember)
AUTOGENERATE_CLASS(USBTravel)
AUTOGENERATE_CLASS(USBUniverse)
AUTOGENERATE_CLASS(USBUniverseRules)
AUTOGENERATE_CLASS(USBWorld)
AUTOGENERATE_CLASS(USBWorldRules)

AUTOGENERATE_PACKAGE(SBBase)


//void CDECL ExecuteNativeCallback(struct FSBDBAsyncCallback &,bool) 121bb20
//class UObject * CDECL SBDatabase::Resources::GetResourceObject(int) 1210b50
//struct HWND__ * hSBClientSplash 1242d54
//_DllMain@12 1218e80
//SBBase_InitPackage 1218ea0

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

