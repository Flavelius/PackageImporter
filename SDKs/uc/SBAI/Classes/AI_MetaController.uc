//==============================================================================
//  AI_MetaController
//==============================================================================

class AI_MetaController extends NPC_AI
    native
    exportstructs
    dependsOn()
  ;

  enum ControllerMessages {
    CM_OnSpawn ,
    CM_OnBegin ,
    CM_OnDespawn ,
    CM_OnEnd ,
    CM_OnBeginScript ,
    CM_OnEndScript ,
    CM_OnDamage ,
    CM_OnBuff ,
    CM_OnDebuff ,
    CM_OnStateBegin ,
    CM_OnStateChange ,
    CM_OnStateEnded ,
    CM_OnStateSignal ,
    CM_OnDeath ,
    CM_OnTick ,
    CM_OnInteraction ,
    CM_OnTimerEnded ,
    CM_OnTrigger ,
    CM_OnDetectEnemy ,
    CM_OnEnemyLost ,
    CM_OnDetectAlly ,
    CM_OnAllyLost ,
    CM_OnHomeLocation ,
    CM_OnCheckChaseRange ,
    CM_OnCheckHabitat ,
    CM_OnEndConversation ,
    CM_CheckEnemy ,
    CM_CheckFriendly ,
    CM_CheckAlly ,
    CM_OnAggro ,
    CM_OnKill ,
    CM_OnArrived ,
    CM_OnUnreachable ,
    CM_OnPause ,
    CM_OnContinue ,
    CM_OnWeaponSwapped ,
    CM_OnSkillFinished ,
    CM_OnAnimationDone ,
    CM_OnPhysicsChange ,
    CM_OnCheckInvisibility 
  };

  struct ControllerMessageFilter {
      var bool OnSpawn;
      var bool OnBegin;
      var bool OnDespawn;
      var bool OnEnd;
      var bool OnBeginScript;
      var bool OnEndScript;
      var bool OnDamage;
      var bool OnBuff;
      var bool OnDebuff;
      var bool OnStateBegin;
      var bool OnStateChange;
      var bool OnStateComplete;
      var bool OnStateSignal;
      var bool OnDeath;
      var bool OnTick;
      var bool OnInteraction;
      var bool OnTimerEnded;
      var bool OnTrigger;
      var bool OnDetectEnemy;
      var bool OnEnemyLost;
      var bool OnDetectAlly;
      var bool OnAllyLost;
      var bool OnHomeLocation;
      var bool OnCheckChaseRange;
      var bool OnCheckHabitat;
      var bool OnEndConversation;
      var bool OnCheckEnemy;
      var bool OnCheckFriendly;
      var bool OnCheckAlly;
      var bool OnAggro;
      var bool OnKill;
      var bool OnArrived;
      var bool OnUnreachable;
      var bool OnPause;
      var bool OnContinue;
      var bool OnWeaponSwapped;
      var bool OnSkillFinished;
      var bool OnAnimationDone;
      var bool OnPhysicsChange;
      var bool OnCheckInvisibility;

  };


  var (AI_MetaController) int Priority;
  var (AI_MetaController) bool mRequiresClone;
  var transient AI_MetaController Parent;
  var ControllerMessageFilter mControllerMessageFilter;
  var transient int mControllerMessageMask1;
  var transient int mControllerMessageMask2;


  event bool OnCheckInvisibility(Game_AIController aController,Game_Pawn aPawn) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnPhysicsChange(Game_AIController aController,byte aNewPhysics) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnAnimationDone(Game_AIController aController,name aAnimation) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnSkillFinished(Game_AIController aController,export editinline FSkill_Type aSkill) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnWeaponSwapped(Game_AIController aController,byte aMode) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnContinue(Game_AIController aController) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnPause(Game_AIController aController) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnUnreachable(Game_AIController aController,SBPoint aControlPoint,Vector aDestination) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnArrived(Game_AIController aController,SBPoint aControlPoint,SBPoint aDestinationPoint,Vector aDestination) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnKill(Game_AIController aController,Actor aVictim) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnCheckAlly(Game_AIController aController,Game_Pawn potentialAlly) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnCheckFriendly(Game_AIController aController,Game_Pawn potentialFriend) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnCheckEnemy(Game_AIController aController,Game_Pawn potentialEnemy) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnTick(Game_AIController aController,float aDeltaTime) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnDeath(Game_AIController aController,Actor aDeceasedActor) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnTimerEnded(Game_AIController aController,Actor aInstigator,name aTag) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnEndConversation(Game_AIController aController,Actor partner) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnCheckHabitat(Game_AIController aController,Vector aLocation,NPC_Habitat aHabitat) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnCheckChaseRange(Game_AIController aController,Vector aLocation,float aRange) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnHomeLocation(Game_AIController aController,Vector aLocation) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnStateSignal(Game_AIController aController,AIState aState,byte aSignal) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnStateChange(Game_AIController aController,AIState aState) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnStateBegin(Game_AIController aController,AIState aState) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnStateComplete(Game_AIController aController,AIState aState,byte aResult) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnAllyLost(Game_AIController anObserver,Game_Pawn anAlly) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnDetectAlly(Game_AIController anObserver,Game_Pawn anAlly) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnEnemyLost(Game_AIController anObserver,Game_Pawn anEnemy) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnDetectEnemy(Game_AIController anObserver,Game_Pawn anEnemy) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnTrigger(Game_AIController receiver,Actor anActor,Pawn Instigator) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnDebuff(Game_AIController Victim,Game_Pawn Instigator,export editinline FSkill_EffectClass effect,float aValue) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnBuff(Game_AIController Victim,Game_Pawn Instigator,export editinline FSkill_EffectClass effect,float aValue) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool OnDamage(Game_AIController Victim,Actor cause,float Damage) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event OnEndScript(Game_AIController aController,AI_Script aScriptInstance) {
    //04 0B 47 
  }


  event OnBeginScript(Game_AIController aController,AI_Script aScriptInstance) {
    //04 0B 47 
  }


  event OnEnd(Game_AIController aController) {
    //04 0B 47 
  }


  event OnDespawn(Game_AIController aController) {
    //04 0B 47 
  }


  event OnBegin(Game_AIController aController) {
    //04 0B 47 
  }


  event bool OnSpawn(Game_AIController aSpawn,export editinline NPC_Type aType,Vector aLocation) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function NPC_Taxonomy GetFaction() {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }



