//==============================================================================
//  SquadMind
//==============================================================================

class SquadMind extends GroupMind
    native
    exportstructs
    dependsOn()
  ;

  var private Game_AIController mLeader;
  var private AIStateMachine mLeaderOldMachine;
  var private Vector mLeaderOldHome;
  var (SquadMind) class<AIStateMachine> LeaderMachineClass;


  function bool IsLeader(Game_AIController aGame_AIController) {
    return aGame_AIController != None && mLeader == aGame_AIController;         //0000 : 04 82 77 00 28 9A E8 14 2A 16 18 0D 00 72 01 30 77 E8 14 00 28 9A E8 14 16 16 
    //04 82 77 00 28 9A E8 14 2A 16 18 0D 00 72 01 30 77 E8 14 00 28 9A E8 14 16 16 04 0B 47 
  }


  native function PromoteLeader(Game_AIController aNewLeader);


  native function bool PickNewLeader();


  event OnDespawn(Game_AIController GroupMember) {
    Super.OnDespawn(GroupMember);                                               //0000 : 1C 70 07 E8 14 00 20 9E E8 14 16 
    if (GroupMember == mLeader) {                                               //000B : 07 27 00 72 00 20 9E E8 14 01 30 77 E8 14 16 
      mLeader = None;                                                           //001A : 0F 01 30 77 E8 14 2A 
      PickNewLeader();                                                          //0021 : 1B 0C 73 00 00 16 
    }
    //1C 70 07 E8 14 00 20 9E E8 14 16 07 27 00 72 00 20 9E E8 14 01 30 77 E8 14 16 0F 01 30 77 E8 14 
    //2A 1B 0C 73 00 00 16 04 0B 47 
  }


  function bool OnDeath(Game_AIController GroupMember,Actor deceasedActor) {
    local bool ret;
    ret = Super.OnDeath(GroupMember,deceasedActor);                             //0000 : 14 2D 00 E0 87 E8 14 1C 00 0A E8 14 00 E8 86 E8 14 00 58 88 E8 14 16 
    if (GroupMember == mLeader) {                                               //0017 : 07 33 00 72 00 E8 86 E8 14 01 30 77 E8 14 16 
      mLeader = None;                                                           //0026 : 0F 01 30 77 E8 14 2A 
      PickNewLeader();                                                          //002D : 1B 0C 73 00 00 16 
    }
    return ret;                                                                 //0033 : 04 2D 00 E0 87 E8 14 
    //14 2D 00 E0 87 E8 14 1C 00 0A E8 14 00 E8 86 E8 14 00 58 88 E8 14 16 07 33 00 72 00 E8 86 E8 14 
    //01 30 77 E8 14 16 0F 01 30 77 E8 14 2A 1B 0C 73 00 00 16 04 2D 00 E0 87 E8 14 04 0B 47 
  }


  function OnBegin(Game_AIController aSpawn) {
    local Game_NPCPawn npcPawn;
    Super.OnBegin(aSpawn);                                                      //0000 : 1C C8 15 E8 14 00 A8 77 E8 14 16 
    npcPawn = Game_NPCPawn(aSpawn.Pawn);                                        //000B : 0F 00 20 78 E8 14 2E D0 32 5B 01 19 00 A8 77 E8 14 05 00 04 01 88 83 6C 0F 
    if (npcPawn != None) {                                                      //0024 : 07 79 00 77 00 20 78 E8 14 2A 16 
      if (mLeader == None) {                                                    //002F : 07 5C 00 72 01 30 77 E8 14 2A 16 
        aSpawn.SetHomeLocation(Location);                                       //003A : 19 00 A8 77 E8 14 0B 00 04 1C 08 D9 31 0F 01 30 81 6C 0F 16 
        PromoteLeader(aSpawn);                                                  //004E : 1B 1A 73 00 00 00 A8 77 E8 14 16 
      } else {                                                                  //0059 : 06 79 00 
        aSpawn.SetHomeLocation(npcPawn.Location);                               //005C : 19 00 A8 77 E8 14 14 00 04 1C 08 D9 31 0F 19 00 20 78 E8 14 05 00 0C 01 30 81 6C 0F 16 
      }
    }
    //1C C8 15 E8 14 00 A8 77 E8 14 16 0F 00 20 78 E8 14 2E D0 32 5B 01 19 00 A8 77 E8 14 05 00 04 01 
    //88 83 6C 0F 07 79 00 77 00 20 78 E8 14 2A 16 07 5C 00 72 01 30 77 E8 14 2A 16 19 00 A8 77 E8 14 
    //0B 00 04 1C 08 D9 31 0F 01 30 81 6C 0F 16 1B 1A 73 00 00 00 A8 77 E8 14 16 06 79 00 19 00 A8 77 
    //E8 14 14 00 04 1C 08 D9 31 0F 19 00 20 78 E8 14 05 00 0C 01 30 81 6C 0F 16 04 0B 47 
  }


  state Patrol {

      function OnBegin(Game_AIController aSpawn) {
        Global.OnBegin(aSpawn);                                                 //0000 : 38 BA 08 00 00 00 48 79 E8 14 16 
        CommandMember(aSpawn,47);                                               //000B : 1C 60 F3 E7 14 00 48 79 E8 14 24 2F 16 
        //38 BA 08 00 00 00 48 79 E8 14 16 1C 60 F3 E7 14 00 48 79 E8 14 24 2F 16 04 0B 47 
      }


      function BeginState() {
        CommandTeam(47);                                                        //0000 : 1C B8 F5 E7 14 24 2F 16 
        //1C B8 F5 E7 14 24 2F 16 04 0B 47 
      }


    //08 47 

  }


  state Return {

      function BeginState() {
        CommandTeam(44);                                                        //0000 : 1C B8 F5 E7 14 24 2C 16 
        //1C B8 F5 E7 14 24 2C 16 04 0B 47 
      }


    //08 47 

  }


  state Fight {

      function EndState() {
        CombatStats.sv_ExitCombat();                                            //0000 : 19 01 00 FE E7 14 06 00 00 1B 70 0F 00 00 16 
        //19 01 00 FE E7 14 06 00 00 1B 70 0F 00 00 16 04 0B 47 
      }


      function bool OnDeath(Game_AIController GroupMember,Actor deceasedActor) {
        local bool ret;
        ret = Global.OnDeath(GroupMember,deceasedActor);                        //0000 : 14 2D 00 E8 8A E8 14 38 C5 08 00 00 00 F8 89 E8 14 00 60 8B E8 14 16 
        if (AllInState(Class'AIRetreatState',True)) {                           //0017 : 07 2D 00 1C B8 F1 E7 14 20 D8 1E A3 01 27 16 
          GotoState('Return');                                                  //0026 : 71 21 C2 02 00 00 16 
        }
        return ret;                                                             //002D : 04 2D 00 E8 8A E8 14 
        //14 2D 00 E8 8A E8 14 38 C5 08 00 00 00 F8 89 E8 14 00 60 8B E8 14 16 07 2D 00 1C B8 F1 E7 14 20 
        //D8 1E A3 01 27 16 71 21 C2 02 00 00 16 04 2D 00 E8 8A E8 14 04 0B 47 
      }


      function bool OnSpawn(Game_AIController aController,export editinline NPC_Type aNPCType,Vector aLocation) {
        return True;                                                            //0000 : 04 27 
        //04 27 04 0B 47 
      }


      function OnBegin(Game_AIController aSpawn) {
        Global.OnBegin(aSpawn);                                                 //0000 : 38 BA 08 00 00 00 C0 8F E8 14 16 
        CommandMember(aSpawn,43);                                               //000B : 1C 60 F3 E7 14 00 C0 8F E8 14 24 2B 16 
        //38 BA 08 00 00 00 C0 8F E8 14 16 1C 60 F3 E7 14 00 C0 8F E8 14 24 2B 16 04 0B 47 
      }


      function BeginState() {
        CombatStats.sv_EnterCombat();                                           //0000 : 19 01 00 FE E7 14 06 00 00 1B 35 10 00 00 16 
        CommandTeam(43);                                                        //000F : 1C B8 F5 E7 14 24 2B 16 
        //19 01 00 FE E7 14 06 00 00 1B 35 10 00 00 16 1C B8 F5 E7 14 24 2B 16 04 0B 47 
      }


    //08 47 

  }


  state Alert {

      function OnBegin(Game_AIController aSpawn) {
        Global.OnBegin(aSpawn);                                                 //0000 : 38 BA 08 00 00 00 B8 96 E8 14 16 
        CommandMember(aSpawn,42);                                               //000B : 1C 60 F3 E7 14 00 B8 96 E8 14 24 2A 16 
        //38 BA 08 00 00 00 B8 96 E8 14 16 1C 60 F3 E7 14 00 B8 96 E8 14 24 2A 16 04 0B 47 
      }


      function BeginState() {
        CommandTeam(42);                                                        //0000 : 1C B8 F5 E7 14 24 2A 16 
        //1C B8 F5 E7 14 24 2A 16 04 0B 47 
      }


    //08 47 

  }


  auto state Idle {

      function BeginState() {
        //04 0B 47 
      }


    //08 47 

  }



