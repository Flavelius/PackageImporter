//==============================================================================
//  Game_PlayerInfo
//==============================================================================

class Game_PlayerInfo extends Object
    native
    dependsOn(Class,Actor,Game_GameServer,SBWorld,Game_PlayerController,SBPortal,Game_Pawn,Game_Character)
  ;

  var transient Game_PlayerController mController;
  var transient SBWorld mDeathWorld;
  var transient SBPortal mDeathPortal;


  function sv_Teleport(SBWorld world,SBPortal Portal) {
    local Game_GameServer Engine;
    Engine = Game_GameServer(Class'Actor'.static.GetGameEngine());              //0000 : 0F 00 90 95 34 19 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
    Engine.LoginToWorldByID(world.worldID,mController.CharacterID,Portal.Tag,"");//001A : 19 00 90 95 34 19 32 00 04 1B C7 0C 00 00 19 00 70 94 34 19 05 00 04 01 30 83 34 19 19 01 A0 68 34 19 05 00 04 01 68 3B 19 11 19 00 08 96 34 19 05 00 00 01 E0 8D 34 19 1F 00 16 
    //0F 00 90 95 34 19 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 19 00 90 95 34 19 
    //32 00 04 1B C7 0C 00 00 19 00 70 94 34 19 05 00 04 01 30 83 34 19 19 01 A0 68 34 19 05 00 04 01 
    //68 3B 19 11 19 00 08 96 34 19 05 00 00 01 E0 8D 34 19 1F 00 16 04 0B 47 
  }


  function string sv_GetName() {
    return sv_GetPawn().Character.sv_GetName();                                 //0000 : 04 19 19 1B 83 0C 00 00 16 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 
    //04 19 19 1B 83 0C 00 00 16 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 04 0B 47 
  }


  function Game_Pawn sv_GetPawn() {
    return Game_Pawn(mController.Pawn);                                         //0000 : 04 2E 18 38 5B 01 19 01 A0 68 34 19 05 00 04 01 88 83 6C 0F 
    //04 2E 18 38 5B 01 19 01 A0 68 34 19 05 00 04 01 88 83 6C 0F 04 0B 47 
  }


  function Game_PlayerController sv_GetController() {
    return mController;                                                         //0000 : 04 01 A0 68 34 19 
    //04 01 A0 68 34 19 04 0B 47 
  }



