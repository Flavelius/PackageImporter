//==============================================================================
//  Meta_CombatStats
//==============================================================================

class Meta_CombatStats extends Game_CombatStats within AI_MetaController
    native
    dependsOn(Game_Controller,AI_MetaController)
    Config(charstats)
  ;


  protected native function bool GetOuterDead();


  protected event string GetOuterName() {
    return "MetaController" @ string(Outer);                                    //0000 : 04 A8 1F 4D 65 74 61 43 6F 6E 74 72 6F 6C 6C 65 72 00 39 56 01 00 E4 6B 0F 16 
    //04 A8 1F 4D 65 74 61 43 6F 6E 74 72 6F 6C 6C 65 72 00 39 56 01 00 E4 6B 0F 16 04 0B 47 
  }


  function sv_QuestCredit(array<Game_Pawn> Enemies) {
    local int enemyI;
    local Game_Controller enemyController;
    enemyI = 0;                                                                 //0000 : 0F 00 E0 62 E8 14 25 
    while (enemyI < Enemies.Length) {                                           //0007 : 07 61 00 96 00 E0 62 E8 14 37 00 B0 61 E8 14 16 
      enemyController = Game_Controller(Enemies[enemyI].Controller);            //0017 : 0F 00 58 63 E8 14 2E 10 0E 5B 01 19 10 00 E0 62 E8 14 00 B0 61 E8 14 05 00 04 01 00 6E 6C 0F 
      enemyController.sv_FireHook(6,Outer.GetFaction(),0);                      //0036 : 19 00 58 63 E8 14 18 00 00 1B 0D 07 00 00 24 06 19 01 00 E4 6B 0F 06 00 04 1B 6D 05 00 00 16 25 16 
      enemyI++;                                                                 //0057 : A5 00 E0 62 E8 14 16 
    }
    //0F 00 E0 62 E8 14 25 07 61 00 96 00 E0 62 E8 14 37 00 B0 61 E8 14 16 0F 00 58 63 E8 14 2E 10 0E 
    //5B 01 19 10 00 E0 62 E8 14 00 B0 61 E8 14 05 00 04 01 00 6E 6C 0F 19 00 58 63 E8 14 18 00 00 1B 
    //0D 07 00 00 24 06 19 01 00 E4 6B 0F 06 00 04 1B 6D 05 00 00 16 25 16 A5 00 E0 62 E8 14 16 06 07 
    //00 04 0B 47 
  }


  event sv_OnEndAggro() {
    if (mInCombat) {                                                            //0000 : 07 0F 00 2D 01 C0 C8 28 11 
      sv_ExitCombat();                                                          //0009 : 1B 70 0F 00 00 16 
    }
    //07 0F 00 2D 01 C0 C8 28 11 1B 70 0F 00 00 16 04 0B 47 
  }


  event sv_OnStartAggro() {
    if (!mInCombat) {                                                           //0000 : 07 11 00 81 2D 01 C0 C8 28 11 16 
      sv_EnterCombat();                                                         //000B : 1B 35 10 00 00 16 
    }
    //07 11 00 81 2D 01 C0 C8 28 11 16 1B 35 10 00 00 16 04 0B 47 
  }



