//==============================================================================
//  Content_Type
//==============================================================================

class Content_Type extends Content_API
    native
    abstract
    dependsOn()
  ;

  enum EContentHook {
    ECH_None ,
    ECH_Kill ,
    ECH_Defeat ,
    ECH_Interact ,
    ECH_Converse ,
    ECH_Trigger ,
    ECH_Eradicate ,
    ECH_Loot ,
    ECH_Death ,
    ECH_Aggro ,
    ECH_Timer ,
    ECH_Killed ,
    ECH_QuestFinished ,
    ECH_Script ,
    ECH_Spotted ,
    ECH_PvPKill ,
    ECH_InventoryUpdate 
  };

  var transient int ExCleanIndex;
  var transient int ResourceId;


  final native function sv_RemoveHooks(Game_Pawn aPawn);


  final native function sv_OnHook(Game_PlayerPawn aPlayerPawn,byte aHookType,Object aObjParam,int aNumParam);


  final native function sv_Detach(Game_Pawn aPawn);


  final native function sv_Attach(Game_Pawn aPawn);


  final function int GetResourceId() {
    return ResourceId;                                                          //0000 : 04 01 58 92 20 11 
    //04 01 58 92 20 11 04 0B 47 
  }



