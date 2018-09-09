//==============================================================================
//  HiveMind
//==============================================================================

class HiveMind extends GroupMind
    native
    exportstructs
    dependsOn()
  ;

  const RedetectTime = 0.5;
  var array<Game_Pawn> Targets;
  var float RedetectTimer;


  protected function EnableDetection() {
    RedetectTimer = 0.00000000;                                                 //0000 : 0F 01 70 52 E8 14 1E 00 00 00 00 
    //0F 01 70 52 E8 14 1E 00 00 00 00 04 0B 47 
  }


  protected function DisableDetection() {
    RedetectTimer = -1.00000000;                                                //0000 : 0F 01 70 52 E8 14 1E 00 00 80 BF 
    //0F 01 70 52 E8 14 1E 00 00 80 BF 04 0B 47 
  }


  function OnBegin(Game_AIController aSpawn) {
    local Game_NPCPawn npcPawn;
    Super.OnBegin(aSpawn);                                                      //0000 : 1C C8 15 E8 14 00 E0 28 E8 14 16 
    npcPawn = Game_NPCPawn(aSpawn.Pawn);                                        //000B : 0F 00 C8 40 E8 14 2E D0 32 5B 01 19 00 E0 28 E8 14 05 00 04 01 88 83 6C 0F 
    aSpawn.SetHomeLocation(npcPawn.Location);                                   //0024 : 19 00 E0 28 E8 14 14 00 04 1C 08 D9 31 0F 19 00 C8 40 E8 14 05 00 0C 01 30 81 6C 0F 16 
    //1C C8 15 E8 14 00 E0 28 E8 14 16 0F 00 C8 40 E8 14 2E D0 32 5B 01 19 00 E0 28 E8 14 05 00 04 01 
    //88 83 6C 0F 19 00 E0 28 E8 14 14 00 04 1C 08 D9 31 0F 19 00 C8 40 E8 14 05 00 0C 01 30 81 6C 0F 
    //16 04 0B 47 
  }


  state Return {

      function BeginState() {
        DisableDetection();                                                     //0000 : 1B 07 73 00 00 16 
        CommandTeam(44);                                                        //0006 : 1C B8 F5 E7 14 24 2C 16 
        //1B 07 73 00 00 16 1C B8 F5 E7 14 24 2C 16 04 0B 47 
      }


    //08 47 

  }


  state Fight {

      function EndState() {
        CombatStats.sv_ExitCombat();                                            //0000 : 19 01 00 FE E7 14 06 00 00 1B 70 0F 00 00 16 
        //19 01 00 FE E7 14 06 00 00 1B 70 0F 00 00 16 04 0B 47 
      }


      function OnBegin(Game_AIController aSpawn) {
        Global.OnBegin(aSpawn);                                                 //0000 : 38 BA 08 00 00 00 F0 41 E8 14 16 
        CommandMember(aSpawn,43);                                               //000B : 1C 60 F3 E7 14 00 F0 41 E8 14 24 2B 16 
        //38 BA 08 00 00 00 F0 41 E8 14 16 1C 60 F3 E7 14 00 F0 41 E8 14 24 2B 16 04 0B 47 
      }


      function BeginState() {
        EnableDetection();                                                      //0000 : 1B 03 73 00 00 16 
        CombatStats.sv_EnterCombat();                                           //0006 : 19 01 00 FE E7 14 06 00 00 1B 35 10 00 00 16 
        CommandTeam(43);                                                        //0015 : 1C B8 F5 E7 14 24 2B 16 
        //1B 03 73 00 00 16 19 01 00 FE E7 14 06 00 00 1B 35 10 00 00 16 1C B8 F5 E7 14 24 2B 16 04 0B 47 
        //
      }


    //08 47 

  }


  state Alert {

      function BeginState() {
        EnableDetection();                                                      //0000 : 1B 03 73 00 00 16 
        //1B 03 73 00 00 16 04 0B 47 
      }


    //08 47 

  }


  state Idle {

      function BeginState() {
        EnableDetection();                                                      //0000 : 1B 03 73 00 00 16 
        //1B 03 73 00 00 16 04 0B 47 
      }


    //08 47 

  }


  auto state Spawning {

      function OnBegin(Game_AIController aSpawn) {
        GotoState('Idle');                                                      //0000 : 71 21 F8 51 00 00 16 
        OnBegin(aSpawn);                                                        //0007 : 1C C8 15 E8 14 00 88 50 E8 14 16 
        //71 21 F8 51 00 00 16 1C C8 15 E8 14 00 88 50 E8 14 16 04 0B 47 
      }


      function BeginState() {
        DisableDetection();                                                     //0000 : 1B 07 73 00 00 16 
        //1B 07 73 00 00 16 04 0B 47 
      }


    //08 47 

  }



