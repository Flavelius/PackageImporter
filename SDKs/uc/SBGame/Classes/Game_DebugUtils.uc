//==============================================================================
//  Game_DebugUtils
//==============================================================================

class Game_DebugUtils extends Base_Component within Game_Controller
    native
    dependsOn(Actor,Game_GameClient,SBAudioManager,Game_Controller,Game_PlayerPawn,Game_PersistentData,Game_Character,Game_StatuePawn,Game_Pawn,Game_BodySlots,Game_PlayerStats,Quest_Type,Game_QuestLog,Pawn,Game_NPCPawn,Game_CharacterStats,SBClock,Player,Console,Game_NPCController,Game_PlayerController,Game_PlayerInput,Game_Camera,GameInfo,NavigationPoint)
  ;

  var bool mTestTrace;
  var int mLoadingScreenHandle;
  var private bool mStartPoll;
  var private float mLastPollTime;
  var private byte mEquippedWeaponType;
  var private bool mUseWeaponOVerride;
  var private Game_NPCPawn mNPCViewTarget;
  var transient bool mLogARTimer;


  protected native function sv2cl_FarMovePawn_CallStub();


  event sv2cl_FarMovePawn(Vector L) {
    Outer.Pawn.SetLocation(L);                                                  //0000 : 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 08 00 04 61 0B 00 A0 35 32 11 16 
    //19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 08 00 04 61 0B 00 A0 35 32 11 16 04 0B 47 
  }


  protected native function cl2sv_Die_CallStub();


  private event cl2sv_Die() {
    Outer.Pawn.SetHealth(0.00000000);                                           //0000 : 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0B 00 00 1B AC 0F 00 00 1E 00 00 00 00 16 
    //19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0B 00 00 1B AC 0F 00 00 1E 00 00 00 00 16 04 0B 47 
    //
  }


  protected native function cl2sv_Resurrect_CallStub();


  private event cl2sv_Resurrect() {
    Game_Pawn(Outer.Pawn).CharacterStats.sv_Resurrect();                        //0000 : 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 06 00 00 1B 58 0C 00 00 16 
    //19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 06 00 00 
    //1B 58 0C 00 00 16 04 0B 47 
  }


  native function bool sv_Invulnerable(optional bool aInvulnerable);


  protected native function cl2sv_SetTime_CallStub();


  protected event cl2sv_SetTime(float aRelTimeOfDay) {
    local export editinline SBClock Clock;
    local float NewVal;
    Clock = Game_Pawn(Outer.Pawn).GetClock();                                   //0000 : 0F 00 28 3E 32 11 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1B 7F 0D 00 00 16 
    if (Clock != None) {                                                        //0023 : 07 4B 00 77 00 28 3E 32 11 2A 16 
      NewVal = Clock.SetFixedRelativeTimeOfDay(aRelTimeOfDay);                  //002E : 0F 00 A0 3E 32 11 19 00 28 3E 32 11 0B 00 04 1B 6C 07 00 00 00 18 3D 32 11 16 
      goto jl004B;                                                              //0048 : 06 4B 00 
    }
    //0F 00 28 3E 32 11 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1B 7F 0D 
    //00 00 16 07 4B 00 77 00 28 3E 32 11 2A 16 0F 00 A0 3E 32 11 19 00 28 3E 32 11 0B 00 04 1B 6C 07 
    //00 00 00 18 3D 32 11 16 06 4B 00 04 0B 47 
  }


  function cl_OnFrame(float DeltaTime) {
    local Game_PlayerPawn gpp;
    if (mLogARTimer && Outer.Pawn.IsLocalPlayer()) {                            //0000 : 07 60 00 82 2D 01 F0 40 32 11 18 19 00 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 18 1A 76 0F 16 16 
      gpp = Game_PlayerPawn(Outer.Pawn);                                        //0026 : 0F 00 18 61 32 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
      if (gpp != None && gpp.mPersistentData != None) {                         //003F : 07 60 00 82 77 00 18 61 32 11 2A 16 18 12 00 77 19 00 18 61 32 11 05 00 04 01 38 DF 7E 0F 2A 16 16 
      }
    }
    //07 60 00 82 2D 01 F0 40 32 11 18 19 00 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 
    //18 1A 76 0F 16 16 0F 00 18 61 32 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 07 
    //60 00 82 77 00 18 61 32 11 2A 16 18 12 00 77 19 00 18 61 32 11 05 00 04 01 38 DF 7E 0F 2A 16 16 
    //04 0B 47 
  }


  function cl_OnTick(float DeltaTime) {
    //04 0B 47 
  }


  protected native function cl2sv_OnStart_CallStub();


  private event cl2sv_OnStart() {
    local Game_Pawn gp;
    local Actor PlayerStart;
    gp = Game_Pawn(Outer.Pawn);                                                 //0000 : 0F 00 48 64 32 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    PlayerStart = Outer.GetGameInfo().FindPlayerStart();                        //0019 : 0F 00 40 66 32 11 19 19 01 00 E4 6B 0F 06 00 04 1C 38 E1 6C 0F 16 06 00 04 1B CD 12 00 00 16 
    if (PlayerStart == None) {                                                  //0038 : 07 45 00 72 00 40 66 32 11 2A 16 
      return;                                                                   //0043 : 04 0B 
    }
    if (gp != None) {                                                           //0045 : 07 D1 00 77 00 48 64 32 11 2A 16 
      gp.sv_TeleportTo(PlayerStart.Location,PlayerStart.Rotation);              //0050 : 19 00 48 64 32 11 22 00 04 1B 4A 07 00 00 19 00 40 66 32 11 05 00 0C 01 30 81 6C 0F 19 00 40 66 32 11 05 00 0C 01 00 84 6C 0F 16 
      if (gp.CharacterStats != None) {                                          //007B : 07 A7 00 77 19 00 48 64 32 11 05 00 04 01 08 43 34 0F 2A 16 
        gp.CharacterStats.sv_Resurrect();                                       //008F : 19 19 00 48 64 32 11 05 00 04 01 08 43 34 0F 06 00 00 1B 58 0C 00 00 16 
      }
      gp.TriggerEvent(PlayerStart.Event,PlayerStart,gp);                        //00A7 : 19 00 48 64 32 11 1E 00 00 1C F8 B1 34 0F 19 00 40 66 32 11 05 00 04 01 38 9F 6C 0F 00 40 66 32 11 00 48 64 32 11 16 
    } else {                                                                    //00CE : 06 F4 00 
      Outer.Pawn.SetLocation(PlayerStart.Location);                             //00D1 : 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 11 00 04 61 0B 19 00 40 66 32 11 05 00 0C 01 30 81 6C 0F 16 
    }
    //0F 00 48 64 32 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0F 00 40 66 32 11 19 
    //19 01 00 E4 6B 0F 06 00 04 1C 38 E1 6C 0F 16 06 00 04 1B CD 12 00 00 16 07 45 00 72 00 40 66 32 
    //11 2A 16 04 0B 07 D1 00 77 00 48 64 32 11 2A 16 19 00 48 64 32 11 22 00 04 1B 4A 07 00 00 19 00 
    //40 66 32 11 05 00 0C 01 30 81 6C 0F 19 00 40 66 32 11 05 00 0C 01 00 84 6C 0F 16 07 A7 00 77 19 
    //00 48 64 32 11 05 00 04 01 08 43 34 0F 2A 16 19 19 00 48 64 32 11 05 00 04 01 08 43 34 0F 06 00 
    //00 1B 58 0C 00 00 16 19 00 48 64 32 11 1E 00 00 1C F8 B1 34 0F 19 00 40 66 32 11 05 00 04 01 38 
    //9F 6C 0F 00 40 66 32 11 00 48 64 32 11 16 06 F4 00 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    //11 00 04 61 0B 19 00 40 66 32 11 05 00 0C 01 30 81 6C 0F 16 04 0B 47 
  }


  exec function TrackPreviousNPC() {
    local Game_NPCPawn current;
    local Game_NPCPawn previous;
    foreach Outer.Pawn.AllActors(Class'Game_NPCPawn',current) {                 //0000 : 2F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0D 00 00 61 30 20 D0 32 5B 01 00 30 67 32 11 16 8A 00 
      if (current == mNPCViewTarget) {                                          //0022 : 07 7E 00 72 00 30 67 32 11 01 A8 67 32 11 16 
        if (previous == None) {                                                 //0031 : 07 5C 00 72 00 20 68 32 11 2A 16 
          Outer.SetViewTarget(Outer.Pawn);                                      //003C : 19 01 00 E4 6B 0F 14 00 00 1C C8 73 71 0F 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 16 
        } else {                                                                //0059 : 06 7B 00 
          mNPCViewTarget = previous;                                            //005C : 0F 01 A8 67 32 11 00 20 68 32 11 
          Outer.SetViewTarget(mNPCViewTarget);                                  //0067 : 19 01 00 E4 6B 0F 0B 00 00 1C C8 73 71 0F 01 A8 67 32 11 16 
        }
        return;                                                                 //007C : 04 0B 
      }
      previous = current;                                                       //007E : 0F 00 20 68 32 11 00 30 67 32 11 
    }
    mNPCViewTarget = previous;                                                  //008B : 0F 01 A8 67 32 11 00 20 68 32 11 
    Outer.SetViewTarget(mNPCViewTarget);                                        //0096 : 19 01 00 E4 6B 0F 0B 00 00 1C C8 73 71 0F 01 A8 67 32 11 16 
    //2F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0D 00 00 61 30 20 D0 32 5B 01 00 30 67 32 11 16 
    //8A 00 07 7E 00 72 00 30 67 32 11 01 A8 67 32 11 16 07 5C 00 72 00 20 68 32 11 2A 16 19 01 00 E4 
    //6B 0F 14 00 00 1C C8 73 71 0F 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 16 06 7B 00 0F 01 A8 67 
    //32 11 00 20 68 32 11 19 01 00 E4 6B 0F 0B 00 00 1C C8 73 71 0F 01 A8 67 32 11 16 30 04 0B 0F 00 
    //20 68 32 11 00 30 67 32 11 31 30 0F 01 A8 67 32 11 00 20 68 32 11 19 01 00 E4 6B 0F 0B 00 00 1C 
    //C8 73 71 0F 01 A8 67 32 11 16 04 0B 47 
  }



