//==============================================================================
//  GroupMind
//==============================================================================

class GroupMind extends AI_MetaController
    native
    abstract
    exportstructs
    dependsOn(Meta_CombatStats,Game_Pawn,Game_PlayerController,Game_PlayerTeams,NPC_Type,NPC_Taxonomy,Class,Loot_Manager,Content_Type,Game_Team,Actor,Game_AIController,Game_NPCPawn,Game_CombatStats)
  ;

  struct GroupMember {
      var Game_AIController Controller;
      var Game_NPCPawn Pawn;
      var bool Alive;
      var int FameLevel;
      var int PePRank;
      var export editinline NPC_Type Type;
      var class<Object> State;

  };


  var export editinline NPC_Taxonomy mFaction;
  var float LootTimeout;
  var export editinline Meta_CombatStats CombatStats;
  var (GroupMind) float VisualRange;
  var (GroupMind) float LineOfSightRange;
  var (GroupMind) float ThreatRange;
  var (GroupMind) float ChaseRange;
  var (GroupMind) NPC_Habitat Habitat;
  var (GroupMind) float SocialAggroFactor;
  var array<GroupMember> GroupMembers;
  var Game_Team mTeam;


  protected final native function bool NoneInState(class<AIState> aState);


  protected final native function bool AllInState(class<AIState> aState,bool aAllowIdle);


  final native function CommandMember(Game_AIController aGame_AIController,byte aSignal);


  final native function CommandTeam(byte aSignal);


  function GiveKillCredit(Vector aCenterLocation) {
    local Game_Pawn Killer;
    local Game_PlayerController PlayerController;
    local array<Game_Pawn> Enemies;
    local float singleFame;
    local float totalFame;
    local float singlePep;
    local float totalPep;
    local int gi;
    local Loot_Manager lootManager;
    local array<LootTable> Loot;
    local int li;
    Killer = CombatStats.sv_GetKiller();                                        //0000 : 0F 00 88 FD E7 14 19 01 00 FE E7 14 06 00 04 1C 98 8A 18 11 16 
    if (Killer != None) {                                                       //0015 : 07 4E 02 77 00 88 FD E7 14 2A 16 
      PlayerController = Game_PlayerController(Killer.Controller);              //0020 : 0F 00 78 FE E7 14 2E 90 18 5B 01 19 00 88 FD E7 14 05 00 04 01 00 6E 6C 0F 
      if (PlayerController != None) {                                           //0039 : 07 4B 02 77 00 78 FE E7 14 2A 16 
        PlayerController.GroupingTeams.sv_GetCreditTeam(Enemies,aCenterLocation);//0044 : 19 19 00 78 FE E7 14 05 00 04 01 48 C2 18 11 10 00 00 1B 02 0E 00 00 00 F0 FE E7 14 00 A0 F9 E7 14 16 
        if (Enemies.Length > 0) {                                               //0066 : 07 4B 02 97 37 00 F0 FE E7 14 25 16 
          CombatStats.sv_QuestCredit(Enemies);                                  //0072 : 19 01 00 FE E7 14 0B 00 00 1B EB 0C 00 00 00 F0 FE E7 14 16 
          totalFame = 0.00000000;                                               //0086 : 0F 00 68 FF E7 14 1E 00 00 00 00 
          totalPep = 0.00000000;                                                //0091 : 0F 00 E0 FF E7 14 1E 00 00 00 00 
          gi = 0;                                                               //009C : 0F 00 58 00 E8 14 25 
          while (gi < GroupMembers.Length) {                                    //00A3 : 07 AC 01 96 00 58 00 E8 14 37 01 D0 00 E8 14 16 
            if (!GroupMembers[gi].Type.IndividualKillCredit) {                  //00B3 : 07 A2 01 81 19 36 D0 01 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 06 00 04 2D 01 C0 98 34 0F 16 
              CombatStats.sv_FamePepCredit(Enemies,GroupMembers[gi].Type.CreditMultiplier,GroupMembers[gi].FameLevel,GroupMembers[gi].PePRank,singleFame,singlePep);//00D2 : 19 01 00 FE E7 14 4E 00 00 1B 23 0F 00 00 00 F0 FE E7 14 19 36 D0 01 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 05 00 04 01 B8 EE 21 11 36 48 02 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 36 C0 02 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 00 38 03 E8 14 00 B0 03 E8 14 16 
              totalFame += singleFame;                                          //0129 : B8 00 68 FF E7 14 00 38 03 E8 14 16 
              totalPep += singlePep;                                            //0135 : B8 00 E0 FF E7 14 00 B0 03 E8 14 16 
              li = 0;                                                           //0141 : 0F 00 28 04 E8 14 25 
              while (li < GroupMembers[gi].Type.Loot.Length) {                  //0148 : 07 A2 01 96 00 28 04 E8 14 37 19 36 D0 01 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 05 00 00 01 48 98 34 0F 16 
                Loot[Loot.Length] = GroupMembers[gi].Type.Loot[li];             //016C : 0F 10 37 00 A0 04 E8 14 00 A0 04 E8 14 10 00 28 04 E8 14 19 36 D0 01 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 05 00 00 01 48 98 34 0F 
                li++;                                                           //0198 : A5 00 28 04 E8 14 16 
              }
            }
            gi++;                                                               //01A2 : A5 00 58 00 E8 14 16 
          }
          CombatStats.sv_FamePepDistribution(Enemies,totalFame,totalPep);       //01AC : 19 01 00 FE E7 14 15 00 00 1B 7D 0F 00 00 00 F0 FE E7 14 00 68 FF E7 14 00 E0 FF E7 14 16 
          if (mFaction != None) {                                               //01CA : 07 E9 01 77 01 18 05 E8 14 2A 16 
            mFaction.AppendLoot(Loot);                                          //01D5 : 19 01 18 05 E8 14 0B 00 00 1C 70 21 25 11 00 A0 04 E8 14 16 
          }
          if (Loot.Length > 0) {                                                //01E9 : 07 4B 02 97 37 00 A0 04 E8 14 25 16 
            lootManager = Class'Loot_Manager'.static.sv_GetInstance();          //01F5 : 0F 00 90 05 E8 14 12 20 B8 01 5D 01 06 00 04 1C 48 58 35 0F 16 
            if (lootManager != None) {                                          //020A : 07 4B 02 77 00 90 05 E8 14 2A 16 
              lootManager.sv_CreateTransaction(Loot,Enemies,LootTimeout,PlayerController.GroupingTeams.GetTeamLootMode());//0215 : 19 00 90 05 E8 14 2D 00 00 1C F8 58 35 0F 00 A0 04 E8 14 00 F0 FE E7 14 01 08 06 E8 14 19 19 00 78 FE E7 14 05 00 04 01 48 C2 18 11 06 00 01 1B 97 0E 00 00 16 16 
            }
          }
        }
      }
      goto jl024E;                                                              //024B : 06 4E 02 
    }
    CombatStats.sv_OnEndAggro();                                                //024E : 19 01 00 FE E7 14 06 00 00 1B E3 08 00 00 16 
    //0F 00 88 FD E7 14 19 01 00 FE E7 14 06 00 04 1C 98 8A 18 11 16 07 4E 02 77 00 88 FD E7 14 2A 16 
    //0F 00 78 FE E7 14 2E 90 18 5B 01 19 00 88 FD E7 14 05 00 04 01 00 6E 6C 0F 07 4B 02 77 00 78 FE 
    //E7 14 2A 16 19 19 00 78 FE E7 14 05 00 04 01 48 C2 18 11 10 00 00 1B 02 0E 00 00 00 F0 FE E7 14 
    //00 A0 F9 E7 14 16 07 4B 02 97 37 00 F0 FE E7 14 25 16 19 01 00 FE E7 14 0B 00 00 1B EB 0C 00 00 
    //00 F0 FE E7 14 16 0F 00 68 FF E7 14 1E 00 00 00 00 0F 00 E0 FF E7 14 1E 00 00 00 00 0F 00 58 00 
    //E8 14 25 07 AC 01 96 00 58 00 E8 14 37 01 D0 00 E8 14 16 07 A2 01 81 19 36 D0 01 E8 14 10 00 58 
    //00 E8 14 01 D0 00 E8 14 06 00 04 2D 01 C0 98 34 0F 16 19 01 00 FE E7 14 4E 00 00 1B 23 0F 00 00 
    //00 F0 FE E7 14 19 36 D0 01 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 05 00 04 01 B8 EE 21 11 36 48 
    //02 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 36 C0 02 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 00 38 
    //03 E8 14 00 B0 03 E8 14 16 B8 00 68 FF E7 14 00 38 03 E8 14 16 B8 00 E0 FF E7 14 00 B0 03 E8 14 
    //16 0F 00 28 04 E8 14 25 07 A2 01 96 00 28 04 E8 14 37 19 36 D0 01 E8 14 10 00 58 00 E8 14 01 D0 
    //00 E8 14 05 00 00 01 48 98 34 0F 16 0F 10 37 00 A0 04 E8 14 00 A0 04 E8 14 10 00 28 04 E8 14 19 
    //36 D0 01 E8 14 10 00 58 00 E8 14 01 D0 00 E8 14 05 00 00 01 48 98 34 0F A5 00 28 04 E8 14 16 06 
    //48 01 A5 00 58 00 E8 14 16 06 A3 00 19 01 00 FE E7 14 15 00 00 1B 7D 0F 00 00 00 F0 FE E7 14 00 
    //68 FF E7 14 00 E0 FF E7 14 16 07 E9 01 77 01 18 05 E8 14 2A 16 19 01 18 05 E8 14 0B 00 00 1C 70 
    //21 25 11 00 A0 04 E8 14 16 07 4B 02 97 37 00 A0 04 E8 14 25 16 0F 00 90 05 E8 14 12 20 B8 01 5D 
    //01 06 00 04 1C 48 58 35 0F 16 07 4B 02 77 00 90 05 E8 14 2A 16 19 00 90 05 E8 14 2D 00 00 1C F8 
    //58 35 0F 00 A0 04 E8 14 00 F0 FE E7 14 01 08 06 E8 14 19 19 00 78 FE E7 14 05 00 04 01 48 C2 18 
    //11 06 00 01 1B 97 0E 00 00 16 16 06 4E 02 19 01 00 FE E7 14 06 00 00 1B E3 08 00 00 16 04 0B 47 
    //
  }


  event bool OnDetectEnemy(Game_AIController anObserver,Game_Pawn anEnemy) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(anEnemy.Controller);               //0000 : 0F 00 98 08 E8 14 2E 90 18 5B 01 19 00 10 09 E8 14 05 00 04 01 00 6E 6C 0F 
    if (PlayerController != None) {                                             //0019 : 07 44 00 77 00 98 08 E8 14 2A 16 
      PlayerController.sv_FireHook(Class'Content_Type'.9,mFaction,0);           //0024 : 19 00 98 08 E8 14 17 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 09 01 18 05 E8 14 25 16 
    }
    return True;                                                                //0044 : 04 27 
    //0F 00 98 08 E8 14 2E 90 18 5B 01 19 00 10 09 E8 14 05 00 04 01 00 6E 6C 0F 07 44 00 77 00 98 08 
    //E8 14 2A 16 19 00 98 08 E8 14 17 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 09 01 18 05 
    //E8 14 25 16 04 27 04 0B 47 
  }


  event OnDespawn(Game_AIController GroupMember) {
    local int gi;
    gi = 0;                                                                     //0000 : 0F 00 E8 0B E8 14 25 
    while (gi < GroupMembers.Length) {                                          //0007 : 07 69 00 96 00 E8 0B E8 14 37 01 D0 00 E8 14 16 
      if (GroupMembers[gi].Controller == GroupMember) {                         //0017 : 07 5F 00 72 36 60 0C E8 14 10 00 E8 0B E8 14 01 D0 00 E8 14 00 B0 0A E8 14 16 
        mTeam.RemoveMember(GroupMembers[gi].Pawn);                              //0031 : 19 01 D8 0C E8 14 16 00 00 1B 0B 06 00 00 36 50 0D E8 14 10 00 E8 0B E8 14 01 D0 00 E8 14 16 
        GroupMembers.Remove(gi,1);                                              //0050 : 41 01 D0 00 E8 14 00 E8 0B E8 14 26 
        goto jl0069;                                                            //005C : 06 69 00 
      }
      gi++;                                                                     //005F : A5 00 E8 0B E8 14 16 
    }
    //0F 00 E8 0B E8 14 25 07 69 00 96 00 E8 0B E8 14 37 01 D0 00 E8 14 16 07 5F 00 72 36 60 0C E8 14 
    //10 00 E8 0B E8 14 01 D0 00 E8 14 00 B0 0A E8 14 16 19 01 D8 0C E8 14 16 00 00 1B 0B 06 00 00 36 
    //50 0D E8 14 10 00 E8 0B E8 14 01 D0 00 E8 14 16 41 01 D0 00 E8 14 00 E8 0B E8 14 26 06 69 00 A5 
    //00 E8 0B E8 14 16 06 07 00 04 0B 47 
  }


  function bool OnDeath(Game_AIController GroupMember,Actor deceasedActor) {
    local int gi;
    local bool found;
    local bool alldead;
    alldead = True;                                                             //0000 : 14 2D 00 30 10 E8 14 27 
    gi = 0;                                                                     //0008 : 0F 00 A8 10 E8 14 25 
    while (gi < GroupMembers.Length) {                                          //000F : 07 A5 00 96 00 A8 10 E8 14 37 01 D0 00 E8 14 16 
      if (GroupMembers[gi].Pawn == deceasedActor) {                             //001F : 07 76 00 72 36 50 0D E8 14 10 00 A8 10 E8 14 01 D0 00 E8 14 00 20 11 E8 14 16 
        mTeam.RemoveMember(GroupMembers[gi].Pawn);                              //0039 : 19 01 D8 0C E8 14 16 00 00 1B 0B 06 00 00 36 50 0D E8 14 10 00 A8 10 E8 14 01 D0 00 E8 14 16 
        GroupMembers[gi].Alive = False;                                         //0058 : 14 2D 36 98 11 E8 14 10 00 A8 10 E8 14 01 D0 00 E8 14 28 
        found = True;                                                           //006B : 14 2D 00 10 12 E8 14 27 
        goto jl0076;                                                            //0073 : 06 76 00 
      }
      alldead = alldead && !GroupMembers[gi].Alive;                             //0076 : 14 2D 00 30 10 E8 14 82 2D 00 30 10 E8 14 18 14 00 81 2D 36 98 11 E8 14 10 00 A8 10 E8 14 01 D0 00 E8 14 16 16 
      gi++;                                                                     //009B : A5 00 A8 10 E8 14 16 
    }
    if (alldead) {                                                              //00A5 : 07 C2 00 2D 00 30 10 E8 14 
      GiveKillCredit(deceasedActor.Location);                                   //00AE : 1B 19 73 00 00 19 00 20 11 E8 14 05 00 0C 01 30 81 6C 0F 16 
    }
    return False;                                                               //00C2 : 04 28 
    //14 2D 00 30 10 E8 14 27 0F 00 A8 10 E8 14 25 07 A5 00 96 00 A8 10 E8 14 37 01 D0 00 E8 14 16 07 
    //76 00 72 36 50 0D E8 14 10 00 A8 10 E8 14 01 D0 00 E8 14 00 20 11 E8 14 16 19 01 D8 0C E8 14 16 
    //00 00 1B 0B 06 00 00 36 50 0D E8 14 10 00 A8 10 E8 14 01 D0 00 E8 14 16 14 2D 36 98 11 E8 14 10 
    //00 A8 10 E8 14 01 D0 00 E8 14 28 14 2D 00 10 12 E8 14 27 06 76 00 14 2D 00 30 10 E8 14 82 2D 00 
    //30 10 E8 14 18 14 00 81 2D 36 98 11 E8 14 10 00 A8 10 E8 14 01 D0 00 E8 14 16 16 A5 00 A8 10 E8 
    //14 16 06 0F 00 07 C2 00 2D 00 30 10 E8 14 1B 19 73 00 00 19 00 20 11 E8 14 05 00 0C 01 30 81 6C 
    //0F 16 04 28 04 0B 47 
  }


  function NPC_Taxonomy GetFaction() {
    return mFaction;                                                            //0000 : 04 01 18 05 E8 14 
    //04 01 18 05 E8 14 04 0B 47 
  }


  event SetFaction(export editinline NPC_Taxonomy aFaction) {
    mFaction = aFaction;                                                        //0000 : 0F 01 18 05 E8 14 00 10 15 E8 14 
    //0F 01 18 05 E8 14 00 10 15 E8 14 04 0B 47 
  }


  event OnCreateComponents() {
    Super.OnCreateComponents();                                                 //0000 : 1C 28 26 6E 0F 16 
    CombatStats = new (self) Class'Meta_CombatStats';                           //0006 : 0F 01 00 FE E7 14 11 17 0B 0B 20 70 DD A3 01 
    //1C 28 26 6E 0F 16 0F 01 00 FE E7 14 11 17 0B 0B 20 70 DD A3 01 04 0B 47 
  }


  function OnBegin(Game_AIController aSpawn) {
    local int i;
    local GroupMember newGroupMember;
    local Game_NPCPawn npcPawn;
    Super.OnBegin(aSpawn);                                                      //0000 : 1C 68 FD 31 0F 00 78 17 E8 14 16 
    i = 0;                                                                      //000B : 0F 00 C0 19 E8 14 25 
    while (i < GroupMembers.Length) {                                           //0012 : 07 55 00 96 00 C0 19 E8 14 37 01 D0 00 E8 14 16 
      if (!GroupMembers[i].Alive) {                                             //0022 : 07 4B 00 81 2D 36 98 11 E8 14 10 00 C0 19 E8 14 01 D0 00 E8 14 16 
        GroupMembers.Remove(i,1);                                               //0038 : 41 01 D0 00 E8 14 00 C0 19 E8 14 26 
        i--;                                                                    //0044 : A6 00 C0 19 E8 14 16 
      }
      i++;                                                                      //004B : A5 00 C0 19 E8 14 16 
    }
    npcPawn = Game_NPCPawn(aSpawn.Pawn);                                        //0055 : 0F 00 38 1A E8 14 2E D0 32 5B 01 19 00 78 17 E8 14 05 00 04 01 88 83 6C 0F 
    newGroupMember.Controller = aSpawn;                                         //006E : 0F 36 60 0C E8 14 00 B0 1A E8 14 00 78 17 E8 14 
    newGroupMember.Pawn = npcPawn;                                              //007E : 0F 36 50 0D E8 14 00 B0 1A E8 14 00 38 1A E8 14 
    newGroupMember.Alive = True;                                                //008E : 14 2D 36 98 11 E8 14 00 B0 1A E8 14 27 
    newGroupMember.FameLevel = npcPawn.NPCFameLevel;                            //009B : 0F 36 48 02 E8 14 00 B0 1A E8 14 19 00 38 1A E8 14 05 00 04 01 B8 68 25 11 
    newGroupMember.PePRank = npcPawn.NPCPePRank;                                //00B4 : 0F 36 C0 02 E8 14 00 B0 1A E8 14 19 00 38 1A E8 14 05 00 04 01 30 69 25 11 
    newGroupMember.Type = npcPawn.NPCType;                                      //00CD : 0F 36 D0 01 E8 14 00 B0 1A E8 14 19 00 38 1A E8 14 05 00 04 01 00 47 1B 11 
    GroupMembers[GroupMembers.Length] = newGroupMember;                         //00E6 : 0F 10 37 01 D0 00 E8 14 01 D0 00 E8 14 00 B0 1A E8 14 
    npcPawn.CombatStats.LinkSocialStats(CombatStats,SocialAggroFactor);         //00F8 : 19 19 00 38 1A E8 14 05 00 04 01 30 41 18 11 10 00 00 1B 34 10 00 00 01 00 FE E7 14 01 28 1B E8 14 16 
    mTeam.AddMember(npcPawn);                                                   //011A : 19 01 D8 0C E8 14 0B 00 00 1B 7C 04 00 00 00 38 1A E8 14 16 
    //1C 68 FD 31 0F 00 78 17 E8 14 16 0F 00 C0 19 E8 14 25 07 55 00 96 00 C0 19 E8 14 37 01 D0 00 E8 
    //14 16 07 4B 00 81 2D 36 98 11 E8 14 10 00 C0 19 E8 14 01 D0 00 E8 14 16 41 01 D0 00 E8 14 00 C0 
    //19 E8 14 26 A6 00 C0 19 E8 14 16 A5 00 C0 19 E8 14 16 06 12 00 0F 00 38 1A E8 14 2E D0 32 5B 01 
    //19 00 78 17 E8 14 05 00 04 01 88 83 6C 0F 0F 36 60 0C E8 14 00 B0 1A E8 14 00 78 17 E8 14 0F 36 
    //50 0D E8 14 00 B0 1A E8 14 00 38 1A E8 14 14 2D 36 98 11 E8 14 00 B0 1A E8 14 27 0F 36 48 02 E8 
    //14 00 B0 1A E8 14 19 00 38 1A E8 14 05 00 04 01 B8 68 25 11 0F 36 C0 02 E8 14 00 B0 1A E8 14 19 
    //00 38 1A E8 14 05 00 04 01 30 69 25 11 0F 36 D0 01 E8 14 00 B0 1A E8 14 19 00 38 1A E8 14 05 00 
    //04 01 00 47 1B 11 0F 10 37 01 D0 00 E8 14 01 D0 00 E8 14 00 B0 1A E8 14 19 19 00 38 1A E8 14 05 
    //00 04 01 30 41 18 11 10 00 00 1B 34 10 00 00 01 00 FE E7 14 01 28 1B E8 14 16 19 01 D8 0C E8 14 
    //0B 00 00 1B 7C 04 00 00 00 38 1A E8 14 16 04 0B 47 
  }


  function bool OnSpawn(Game_AIController aController,export editinline NPC_Type aNPCType,Vector aLocation) {
    aController.Habitat = Habitat;                                              //0000 : 0F 19 00 20 1C E8 14 05 00 04 01 68 5B FC 13 01 E0 1D E8 14 
    aController.ThreatRange = ThreatRange;                                      //0014 : 0F 19 00 20 1C E8 14 05 00 04 01 20 58 FC 13 01 58 1E E8 14 
    aController.ChaseRange = ChaseRange;                                        //0028 : 0F 19 00 20 1C E8 14 05 00 04 01 30 57 FC 13 01 D0 1E E8 14 
    aController.SetVisualRange(VisualRange);                                    //003C : 19 00 20 1C E8 14 0B 00 00 1C 88 41 FC 13 01 48 1F E8 14 16 
    aController.SetLineOfSightRange(LineOfSightRange);                          //0050 : 19 00 20 1C E8 14 0B 00 00 1C 60 DA 31 0F 01 C0 1F E8 14 16 
    aController.FearFactor = 0.30000001;                                        //0064 : 0F 19 00 20 1C E8 14 05 00 04 01 88 59 FC 13 1E 9A 99 99 3E 
    aController.AggressionFactor = 0.69999999;                                  //0078 : 0F 19 00 20 1C E8 14 05 00 04 01 10 59 FC 13 1E 33 33 33 3F 
    aController.SocialFactor = 0.00000000;                                      //008C : 0F 19 00 20 1C E8 14 05 00 04 01 00 5A FC 13 1E 00 00 00 00 
    aController.BoredomFactor = 0.50000000;                                     //00A0 : 0F 19 00 20 1C E8 14 05 00 04 01 78 5A FC 13 1E 00 00 00 3F 
    return Super.OnSpawn(aController,aNPCType,aLocation);                       //00B4 : 04 1C C0 FE 31 0F 00 20 1C E8 14 00 38 20 E8 14 00 B0 20 E8 14 16 
    //0F 19 00 20 1C E8 14 05 00 04 01 68 5B FC 13 01 E0 1D E8 14 0F 19 00 20 1C E8 14 05 00 04 01 20 
    //58 FC 13 01 58 1E E8 14 0F 19 00 20 1C E8 14 05 00 04 01 30 57 FC 13 01 D0 1E E8 14 19 00 20 1C 
    //E8 14 0B 00 00 1C 88 41 FC 13 01 48 1F E8 14 16 19 00 20 1C E8 14 0B 00 00 1C 60 DA 31 0F 01 C0 
    //1F E8 14 16 0F 19 00 20 1C E8 14 05 00 04 01 88 59 FC 13 1E 9A 99 99 3E 0F 19 00 20 1C E8 14 05 
    //00 04 01 10 59 FC 13 1E 33 33 33 3F 0F 19 00 20 1C E8 14 05 00 04 01 00 5A FC 13 1E 00 00 00 00 
    //0F 19 00 20 1C E8 14 05 00 04 01 78 5A FC 13 1E 00 00 00 3F 04 1C C0 FE 31 0F 00 20 1C E8 14 00 
    //38 20 E8 14 00 B0 20 E8 14 16 04 0B 47 
  }



