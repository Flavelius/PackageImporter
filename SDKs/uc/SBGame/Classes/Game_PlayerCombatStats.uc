//==============================================================================
//  Game_PlayerCombatStats
//==============================================================================

class Game_PlayerCombatStats extends Game_CombatStats within Game_PlayerPawn
    native
    dependsOn(Game_PlayerPawn,Game_Character,Game_Controller)
    Config(charstats)
  ;

  var float mPvPTimer;
  var config float PvPTimeOut;
  var float mCombatIdleTimer;
  var config float CombatIdleTimeOut;


  protected native function cl2sv_ShakeCombat_CallStub();


  native event cl2sv_ShakeCombat();


  protected native function bool GetOuterDead();


  protected event string GetOuterName() {
    return "Player" @ Outer.Character.sv_GetName();                             //0000 : 04 A8 1F 50 6C 61 79 65 72 00 19 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 16 
    //04 A8 1F 50 6C 61 79 65 72 00 19 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 
    //11 16 16 04 0B 47 
  }


  function sv_QuestCredit(array<Game_Pawn> Enemies) {
    local int enemyI;
    local Game_Controller enemyController;
    enemyI = 0;                                                                 //0000 : 0F 00 40 ED 34 11 25 
    while (enemyI < Enemies.Length) {                                           //0007 : 07 57 00 96 00 40 ED 34 11 37 00 20 EC 34 11 16 
      enemyController = Game_Controller(Enemies[enemyI].Controller);            //0017 : 0F 00 B8 ED 34 11 2E 10 0E 5B 01 19 10 00 40 ED 34 11 00 20 EC 34 11 05 00 04 01 00 6E 6C 0F 
      enemyController.sv_FireHook(6,Outer,0);                                   //0036 : 19 00 B8 ED 34 11 0E 00 00 1B 0D 07 00 00 24 06 01 00 E4 6B 0F 25 16 
      enemyI++;                                                                 //004D : A5 00 40 ED 34 11 16 
    }
    //0F 00 40 ED 34 11 25 07 57 00 96 00 40 ED 34 11 37 00 20 EC 34 11 16 0F 00 B8 ED 34 11 2E 10 0E 
    //5B 01 19 10 00 40 ED 34 11 00 20 EC 34 11 05 00 04 01 00 6E 6C 0F 19 00 B8 ED 34 11 0E 00 00 1B 
    //0D 07 00 00 24 06 01 00 E4 6B 0F 25 16 A5 00 40 ED 34 11 16 06 07 00 04 0B 47 
  }



