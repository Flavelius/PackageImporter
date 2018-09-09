//==============================================================================
//  Game_NPCCombatStats
//==============================================================================

class Game_NPCCombatStats extends Game_CombatStats within Game_NPCPawn
    native
    dependsOn(Game_NPCPawn,Game_Character,Game_Controller)
    Config(charstats)
  ;


  protected native function bool GetOuterDead();


  protected event string GetOuterName() {
    return "NPC" @ Outer.Character.sv_GetName();                                //0000 : 04 A8 1F 4E 50 43 00 19 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 16 
    //04 A8 1F 4E 50 43 00 19 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 16 
    //04 0B 47 
  }


  function sv_QuestCredit(array<Game_Pawn> Enemies) {
    local int enemyI;
    local Game_Controller enemyController;
    enemyI = 0;                                                                 //0000 : 0F 00 98 DB 35 11 25 
    while (enemyI < Enemies.Length) {                                           //0007 : 07 57 00 96 00 98 DB 35 11 37 00 78 DA 35 11 16 
      enemyController = Game_Controller(Enemies[enemyI].Controller);            //0017 : 0F 00 10 DC 35 11 2E 10 0E 5B 01 19 10 00 98 DB 35 11 00 78 DA 35 11 05 00 04 01 00 6E 6C 0F 
      enemyController.sv_FireHook(1,Outer,0);                                   //0036 : 19 00 10 DC 35 11 0E 00 00 1B 0D 07 00 00 24 01 01 00 E4 6B 0F 25 16 
      enemyI++;                                                                 //004D : A5 00 98 DB 35 11 16 
    }
    //0F 00 98 DB 35 11 25 07 57 00 96 00 98 DB 35 11 37 00 78 DA 35 11 16 0F 00 10 DC 35 11 2E 10 0E 
    //5B 01 19 10 00 98 DB 35 11 00 78 DA 35 11 05 00 04 01 00 6E 6C 0F 19 00 10 DC 35 11 0E 00 00 1B 
    //0D 07 00 00 24 01 01 00 E4 6B 0F 25 16 A5 00 98 DB 35 11 16 06 07 00 04 0B 47 
  }



