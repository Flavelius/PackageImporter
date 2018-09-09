//==============================================================================
//  Game_ShiftableAppearance
//==============================================================================

class Game_ShiftableAppearance extends Base_Component within Game_Pawn
    native
    exportstructs
    dependsOn(SBDBSync,NPC_Type,Game_Pawn,NPC_Appearance,Game_AppearanceListener,Game_Appearance,NPC_Equipment)
  ;

  struct PhysicState {
      var byte Physics;
      var float GroundSpeed;
      var float BaseMovementSpeed;
      var float MovementSpeedMultiplier[5];
      var float AirSpeed;
      var float MinFlySpeed;
      var float AirControl;
      var bool CanStrafe;
      var bool CanRest;
      var bool CanWalkBackwards;
      var float WalkingPct;
      var float WaterSpeed;
      var float JumpSpeed;
      var float LadderSpeed;
      var float AccelRate;
      var float TurnSpeed;
      var deprecated bool bAlignToFloor;
      var bool bAlignToFloorRoll;
      var bool bAlignToFloorPitch;
      var bool bForceAttachmentUpdates;
      var float CollisionHeight;
      var float CollisionRadius;
      var float TerminalVelocity;

  };


  var private transient PhysicState mSavedPhysics;
  var int mShiftedNPCTypeID;
  var export editinline NPC_Type mShiftedNPCType;
  var export editinline Game_Appearance mShiftedAppearance;
  var array<Game_AppearanceListener> mAppearanceListeners;
  var bool mInvalidatedDressup;


  private function ShiftToNPCTypeID(int aNPCTypeID) {
    local export editinline NPC_Type NPCType;
    TestInvariant();                                                            //0000 : 1B 5B 07 00 00 16 
    if (aNPCTypeID != 0) {                                                      //0006 : 07 3E 00 9B 00 C0 55 35 0F 25 16 
      NPCType = NPC_Type(Class'SBDBSync'.GetResourceObject(aNPCTypeID));        //0011 : 0F 00 40 6A 20 11 2E 78 9C 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 C0 55 35 0F 16 
      ShiftAppearance(NPCType);                                                 //0030 : 1B DA 0C 00 00 00 40 6A 20 11 16 
    } else {                                                                    //003B : 06 44 00 
      UnshiftAppearance();                                                      //003E : 1B 1E 0E 00 00 16 
    }
    TestInvariant();                                                            //0044 : 1B 5B 07 00 00 16 
    //1B 5B 07 00 00 16 07 3E 00 9B 00 C0 55 35 0F 25 16 0F 00 40 6A 20 11 2E 78 9C 5B 01 12 20 30 82 
    //24 01 0B 00 04 1B E5 0B 00 00 00 C0 55 35 0F 16 1B DA 0C 00 00 00 40 6A 20 11 16 06 44 00 1B 1E 
    //0E 00 00 16 1B 5B 07 00 00 16 04 0B 47 
  }


  protected native function sv2clrel_ShiftAppearance_CallStub();


  protected event sv2clrel_ShiftAppearance(int aNPCTypeID) {
    local export editinline NPC_Type NPCType;
    if (aNPCTypeID != 0) {                                                      //0000 : 07 33 00 9B 00 18 6C 20 11 25 16 
      NPCType = NPC_Type(Class'SBDBSync'.GetResourceObject(aNPCTypeID));        //000B : 0F 00 38 6E 20 11 2E 78 9C 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 18 6C 20 11 16 
      SaveMovementPhysics();                                                    //002A : 1B 3B 0F 00 00 16 
    } else {                                                                    //0030 : 06 3E 00 
      NPCType = mShiftedNPCType;                                                //0033 : 0F 00 38 6E 20 11 01 B0 6E 20 11 
    }
    if (NPCType == None) {                                                      //003E : 07 4B 00 72 00 38 6E 20 11 2A 16 
      return;                                                                   //0049 : 04 0B 
    }
    ShiftToNPCTypeID(aNPCTypeID);                                               //004B : 1B 84 0D 00 00 00 18 6C 20 11 16 
    if (aNPCTypeID != 0) {                                                      //0056 : 07 D1 00 9B 00 18 6C 20 11 25 16 
      NPCType.InitMovement(Outer);                                              //0061 : 19 00 38 6E 20 11 0B 00 00 1B 96 05 00 00 01 00 E4 6B 0F 16 
      Outer.PrePivot.Z += NPCType.Appearance.GetCollisionHeight() - mSavedPhysics.CollisionHeight;//0075 : B8 36 38 C5 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 80 B5 6E 0F AF 19 19 00 38 6E 20 11 05 00 04 01 78 47 1B 11 06 00 04 1B 5D 0C 00 00 16 36 B0 6F 20 11 01 28 70 20 11 16 16 
      Outer.SetCollisionSize(mSavedPhysics.CollisionRadius,mSavedPhysics.CollisionHeight);//00AE : 19 01 00 E4 6B 0F 17 00 04 61 1B 36 A0 70 20 11 01 28 70 20 11 36 B0 6F 20 11 01 28 70 20 11 16 
    } else {                                                                    //00CE : 06 10 01 
      Outer.PrePivot.Z -= NPCType.Appearance.GetCollisionHeight() - mSavedPhysics.CollisionHeight;//00D1 : B9 36 38 C5 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 80 B5 6E 0F AF 19 19 00 38 6E 20 11 05 00 04 01 78 47 1B 11 06 00 04 1B 5D 0C 00 00 16 36 B0 6F 20 11 01 28 70 20 11 16 16 
      RestoreMovementPhysics();                                                 //010A : 1B BE 0D 00 00 16 
    }
    //07 33 00 9B 00 18 6C 20 11 25 16 0F 00 38 6E 20 11 2E 78 9C 5B 01 12 20 30 82 24 01 0B 00 04 1B 
    //E5 0B 00 00 00 18 6C 20 11 16 1B 3B 0F 00 00 16 06 3E 00 0F 00 38 6E 20 11 01 B0 6E 20 11 07 4B 
    //00 72 00 38 6E 20 11 2A 16 04 0B 1B 84 0D 00 00 00 18 6C 20 11 16 07 D1 00 9B 00 18 6C 20 11 25 
    //16 19 00 38 6E 20 11 0B 00 00 1B 96 05 00 00 01 00 E4 6B 0F 16 B8 36 38 C5 69 0F 19 01 00 E4 6B 
    //0F 05 00 0C 01 80 B5 6E 0F AF 19 19 00 38 6E 20 11 05 00 04 01 78 47 1B 11 06 00 04 1B 5D 0C 00 
    //00 16 36 B0 6F 20 11 01 28 70 20 11 16 16 19 01 00 E4 6B 0F 17 00 04 61 1B 36 A0 70 20 11 01 28 
    //70 20 11 36 B0 6F 20 11 01 28 70 20 11 16 06 10 01 B9 36 38 C5 69 0F 19 01 00 E4 6B 0F 05 00 0C 
    //01 80 B5 6E 0F AF 19 19 00 38 6E 20 11 05 00 04 01 78 47 1B 11 06 00 04 1B 5D 0C 00 00 16 36 B0 
    //6F 20 11 01 28 70 20 11 16 16 1B BE 0D 00 00 16 04 0B 47 
  }


  protected event NotifyAppearanceListeners(Game_Pawn aPawn,export editinline Game_Appearance aAppearance) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 40 72 20 11 25 
    while (i < mAppearanceListeners.Length) {                                   //0007 : 07 6B 00 96 00 40 72 20 11 37 01 B8 72 20 11 16 
      if (mAppearanceListeners[i] == None) {                                    //0017 : 07 3E 00 72 10 00 40 72 20 11 01 B8 72 20 11 2A 16 
        mAppearanceListeners.Remove(i,1);                                       //0028 : 41 01 B8 72 20 11 00 40 72 20 11 26 
        i--;                                                                    //0034 : A6 00 40 72 20 11 16 
      } else {                                                                  //003B : 06 61 00 
        mAppearanceListeners[i].OnAppearanceChanged(aPawn,aAppearance);         //003E : 19 10 00 40 72 20 11 01 B8 72 20 11 14 00 00 43 70 78 20 11 64 0F 00 00 00 C8 71 20 11 00 E8 78 20 11 16 
      }
      i++;                                                                      //0061 : A5 00 40 72 20 11 16 
    }
    //0F 00 40 72 20 11 25 07 6B 00 96 00 40 72 20 11 37 01 B8 72 20 11 16 07 3E 00 72 10 00 40 72 20 
    //11 01 B8 72 20 11 2A 16 41 01 B8 72 20 11 00 40 72 20 11 26 A6 00 40 72 20 11 16 06 61 00 19 10 
    //00 40 72 20 11 01 B8 72 20 11 14 00 00 43 70 78 20 11 64 0F 00 00 00 C8 71 20 11 00 E8 78 20 11 
    //16 A5 00 40 72 20 11 16 06 07 00 04 0B 47 
  }


  function UnregisterAppearanceListener(Game_AppearanceListener aListener) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 88 7A 20 11 25 
    while (i < mAppearanceListeners.Length) {                                   //0007 : 07 44 00 96 00 88 7A 20 11 37 01 B8 72 20 11 16 
      if (mAppearanceListeners[i] == aListener) {                               //0017 : 07 3A 00 72 10 00 88 7A 20 11 01 B8 72 20 11 00 10 7A 20 11 16 
        mAppearanceListeners.Remove(i,1);                                       //002C : 41 01 B8 72 20 11 00 88 7A 20 11 26 
        return;                                                                 //0038 : 04 0B 
      }
      i++;                                                                      //003A : A5 00 88 7A 20 11 16 
    }
    assert(False);                                                              //0044 : 09 52 01 28 
    //0F 00 88 7A 20 11 25 07 44 00 96 00 88 7A 20 11 37 01 B8 72 20 11 16 07 3A 00 72 10 00 88 7A 20 
    //11 01 B8 72 20 11 00 10 7A 20 11 16 41 01 B8 72 20 11 00 88 7A 20 11 26 04 0B A5 00 88 7A 20 11 
    //16 06 07 00 09 52 01 28 04 0B 47 
  }


  function RegisterAppearanceListener(Game_AppearanceListener aListener) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 C0 7C 20 11 25 
    while (i < mAppearanceListeners.Length) {                                   //0007 : 07 3C 00 96 00 C0 7C 20 11 37 01 B8 72 20 11 16 
      if (mAppearanceListeners[i] == aListener) {                               //0017 : 07 32 00 72 10 00 C0 7C 20 11 01 B8 72 20 11 00 B0 7B 20 11 16 
        assert(False);                                                          //002C : 09 39 01 28 
        return;                                                                 //0030 : 04 0B 
      }
      i++;                                                                      //0032 : A5 00 C0 7C 20 11 16 
    }
    mAppearanceListeners[mAppearanceListeners.Length] = aListener;              //003C : 0F 10 37 01 B8 72 20 11 01 B8 72 20 11 00 B0 7B 20 11 
    //0F 00 C0 7C 20 11 25 07 3C 00 96 00 C0 7C 20 11 37 01 B8 72 20 11 16 07 32 00 72 10 00 C0 7C 20 
    //11 01 B8 72 20 11 00 B0 7B 20 11 16 09 39 01 28 04 0B A5 00 C0 7C 20 11 16 06 07 00 0F 10 37 01 
    //B8 72 20 11 01 B8 72 20 11 00 B0 7B 20 11 04 0B 47 
  }


  function InstallBaseAppearance(export editinline NPC_Type aNPCType) {
    Outer.BaseAppearance = aNPCType.Appearance.CreateAppearance(Outer,Outer.BaseAppearance,False);//0000 : 0F 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 19 19 00 E8 7D 20 11 05 00 04 01 78 47 1B 11 1A 00 04 1B 0C 0D 00 00 01 00 E4 6B 0F 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 28 16 
    Outer.BaseAppearance.Apply();                                               //003B : 19 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 06 00 00 1C A0 3B 21 11 16 
    //0F 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 19 19 00 E8 7D 20 11 05 00 04 01 78 47 1B 11 1A 00 
    //04 1B 0C 0D 00 00 01 00 E4 6B 0F 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 28 16 19 19 01 00 E4 
    //6B 0F 05 00 04 01 B8 2E 19 11 06 00 00 1C A0 3B 21 11 16 04 0B 47 
  }


  function cl_OnShutdown() {
    if (mShiftedAppearance != None) {                                           //0000 : 07 1A 00 77 01 30 80 20 11 2A 16 
      mShiftedAppearance.cl_OnShutdown();                                       //000B : 19 01 30 80 20 11 06 00 00 1B 66 07 00 00 16 
    }
    Outer.BaseAppearance.cl_OnShutdown();                                       //001A : 19 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 06 00 00 1B 66 07 00 00 16 
    Super.cl_OnShutdown();                                                      //0032 : 1C 00 C4 19 11 16 
    //07 1A 00 77 01 30 80 20 11 2A 16 19 01 30 80 20 11 06 00 00 1B 66 07 00 00 16 19 19 01 00 E4 6B 
    //0F 05 00 04 01 B8 2E 19 11 06 00 00 1B 66 07 00 00 16 1C 00 C4 19 11 16 04 0B 47 
  }


  function cl_OnFrame(float aDeltaTime) {
    if (mShiftedAppearance != None) {                                           //0000 : 07 1F 00 77 01 30 80 20 11 2A 16 
      mShiftedAppearance.cl_OnFrame(aDeltaTime);                                //000B : 19 01 30 80 20 11 0B 00 00 1B 3E 05 00 00 00 58 81 20 11 16 
    }
    Outer.BaseAppearance.cl_OnFrame(aDeltaTime);                                //001F : 19 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 0B 00 00 1B 3E 05 00 00 00 58 81 20 11 16 
    if (mInvalidatedDressup) {                                                  //003C : 07 4B 00 2D 01 A0 F0 21 11 
      DressUp();                                                                //0045 : 1C D0 30 19 11 16 
    }
    //07 1F 00 77 01 30 80 20 11 2A 16 19 01 30 80 20 11 0B 00 00 1B 3E 05 00 00 00 58 81 20 11 16 19 
    //19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 0B 00 00 1B 3E 05 00 00 00 58 81 20 11 16 07 4B 00 2D 
    //01 A0 F0 21 11 1C D0 30 19 11 16 04 0B 47 
  }


  function cl_OnInit() {
    local int aShiftedNPCTypeID;
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    Outer.BaseAppearance.cl_OnInit();                                           //0006 : 19 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 06 00 00 1B 3F 05 00 00 16 
    if (mShiftedNPCTypeID != 0) {                                               //001E : 07 46 00 9B 01 D8 F2 21 11 25 16 
      aShiftedNPCTypeID = mShiftedNPCTypeID;                                    //0029 : 0F 00 C8 F1 21 11 01 D8 F2 21 11 
      mShiftedNPCTypeID = 0;                                                    //0034 : 0F 01 D8 F2 21 11 25 
      ShiftToNPCTypeID(aShiftedNPCTypeID);                                      //003B : 1B 84 0D 00 00 00 C8 F1 21 11 16 
    }
    TestInvariant();                                                            //0046 : 1B 5B 07 00 00 16 
    //1C E0 C4 19 11 16 19 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 06 00 00 1B 3F 05 00 00 16 07 46 
    //00 9B 01 D8 F2 21 11 25 16 0F 00 C8 F1 21 11 01 D8 F2 21 11 0F 01 D8 F2 21 11 25 1B 84 0D 00 00 
    //00 C8 F1 21 11 16 1B 5B 07 00 00 16 04 0B 47 
  }


  function OnConstruct() {
    TestInvariant();                                                            //0000 : 1B 5B 07 00 00 16 
    if (Outer.BaseAppearance != None) {                                         //0006 : 07 32 00 77 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 2A 16 
      Outer.BaseAppearance.OnConstruct();                                       //001A : 19 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 06 00 00 1B BC 05 00 00 16 
    }
    //1B 5B 07 00 00 16 07 32 00 77 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 2A 16 19 19 01 00 E4 6B 
    //0F 05 00 04 01 B8 2E 19 11 06 00 00 1B BC 05 00 00 16 04 0B 47 
  }


  function app(int A) {
    GetCurrent().app(A);                                                        //0000 : 19 1B 6A 05 00 00 16 0B 00 00 1B 4D 0C 00 00 00 20 F5 21 11 16 
    //19 1B 6A 05 00 00 16 0B 00 00 1B 4D 0C 00 00 00 20 F5 21 11 16 04 0B 47 
  }


  event InvalidateDressup() {
    mInvalidatedDressup = True;                                                 //0000 : 14 2D 01 A0 F0 21 11 27 
    //14 2D 01 A0 F0 21 11 27 04 0B 47 
  }


  final native function DressUp();


  function bool UnshiftAppearance() {
    return ShiftAppearance(None);                                               //0000 : 04 1B DA 0C 00 00 2A 16 
    //04 1B DA 0C 00 00 2A 16 04 0B 47 
  }


  event bool sv_UnshiftAppearance() {
    return sv_ShiftAppearance(None);                                            //0000 : 04 1B 3C 07 00 00 2A 16 
    //04 1B 3C 07 00 00 2A 16 04 0B 47 
  }


  event NPC_Type GetShiftedNPCType() {
    return mShiftedNPCType;                                                     //0000 : 04 01 B0 6E 20 11 
    //04 01 B0 6E 20 11 04 0B 47 
  }


  event bool sv_ShiftAppearance(export editinline NPC_Type aOtherNPCType) {
    ShiftAppearance(aOtherNPCType);                                             //0000 : 1B DA 0C 00 00 00 A0 FB 21 11 16 
    sv2clrel_ShiftAppearance_CallStub(mShiftedNPCTypeID);                       //000B : 1B BE 0E 00 00 01 D8 F2 21 11 16 
    return True;                                                                //0016 : 04 27 
    //1B DA 0C 00 00 00 A0 FB 21 11 16 1B BE 0E 00 00 01 D8 F2 21 11 16 04 27 04 0B 47 
  }


  function bool ShiftAppearance(export editinline NPC_Type aOtherNPCType) {
    TestInvariant();                                                            //0000 : 1B 5B 07 00 00 16 
    if (mShiftedNPCType == aOtherNPCType) {                                     //0006 : 07 17 00 72 01 B0 6E 20 11 00 90 FD 21 11 16 
      return False;                                                             //0015 : 04 28 
    }
    if (mShiftedNPCType != None) {                                              //0017 : 07 37 00 77 01 B0 6E 20 11 2A 16 
      mShiftedAppearance = None;                                                //0022 : 0F 01 30 80 20 11 2A 
      mShiftedNPCType = None;                                                   //0029 : 0F 01 B0 6E 20 11 2A 
      mShiftedNPCTypeID = 0;                                                    //0030 : 0F 01 D8 F2 21 11 25 
    }
    TestInvariant();                                                            //0037 : 1B 5B 07 00 00 16 
    if (aOtherNPCType != None) {                                                //003D : 07 91 00 77 00 90 FD 21 11 2A 16 
      mShiftedNPCType = aOtherNPCType;                                          //0048 : 0F 01 B0 6E 20 11 00 90 FD 21 11 
      mShiftedNPCTypeID = mShiftedNPCType.GetResourceId();                      //0053 : 0F 01 D8 F2 21 11 19 01 B0 6E 20 11 06 00 04 1C 08 90 20 11 16 
      mShiftedAppearance = aOtherNPCType.Appearance.CreateAppearance(Outer,mShiftedAppearance,True);//0068 : 0F 01 30 80 20 11 19 19 00 90 FD 21 11 05 00 04 01 78 47 1B 11 11 00 04 1B 0C 0D 00 00 01 00 E4 6B 0F 01 30 80 20 11 27 16 
    }
    if (mShiftedAppearance != None
      && mShiftedNPCType.Equipment != None) {//0091 : 07 D5 00 82 77 01 30 80 20 11 2A 16 18 12 00 77 19 01 B0 6E 20 11 05 00 04 01 98 BA 21 11 2A 16 16 
      mShiftedNPCType.Equipment.ApplyToAppearance(Game_EquippedAppearance(GetCurrent()));//00B2 : 19 19 01 B0 6E 20 11 05 00 04 01 98 BA 21 11 11 00 00 1B 5C 0E 00 00 2E 70 B8 5F 01 1B 6A 05 00 00 16 16 
    }
    GetCurrent().Apply();                                                       //00D5 : 19 1B 6A 05 00 00 16 06 00 00 1C A0 3B 21 11 16 
    TestInvariant();                                                            //00E5 : 1B 5B 07 00 00 16 
    //1B 5B 07 00 00 16 07 17 00 72 01 B0 6E 20 11 00 90 FD 21 11 16 04 28 07 37 00 77 01 B0 6E 20 11 
    //2A 16 0F 01 30 80 20 11 2A 0F 01 B0 6E 20 11 2A 0F 01 D8 F2 21 11 25 1B 5B 07 00 00 16 07 91 00 
    //77 00 90 FD 21 11 2A 16 0F 01 B0 6E 20 11 00 90 FD 21 11 0F 01 D8 F2 21 11 19 01 B0 6E 20 11 06 
    //00 04 1C 08 90 20 11 16 0F 01 30 80 20 11 19 19 00 90 FD 21 11 05 00 04 01 78 47 1B 11 11 00 04 
    //1B 0C 0D 00 00 01 00 E4 6B 0F 01 30 80 20 11 27 16 07 D5 00 82 77 01 30 80 20 11 2A 16 18 12 00 
    //77 19 01 B0 6E 20 11 05 00 04 01 98 BA 21 11 2A 16 16 19 19 01 B0 6E 20 11 05 00 04 01 98 BA 21 
    //11 11 00 00 1B 5C 0E 00 00 2E 70 B8 5F 01 1B 6A 05 00 00 16 16 19 1B 6A 05 00 00 16 06 00 00 1C 
    //A0 3B 21 11 16 1B 5B 07 00 00 16 04 0B 47 
  }


  native function bool IsFeminine();


  native function bool IsShifted();


  event Game_Appearance GetBase() {
    return Outer.BaseAppearance;                                                //0000 : 04 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 
    //04 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 04 0B 47 
  }


  event Game_Appearance GetCurrent() {
    if (mShiftedAppearance != None) {                                           //0000 : 07 14 00 77 01 30 80 20 11 2A 16 
      return mShiftedAppearance;                                                //000B : 04 01 30 80 20 11 
    } else {                                                                    //0011 : 06 23 00 
      return Outer.BaseAppearance;                                              //0014 : 04 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 
    }
    //07 14 00 77 01 30 80 20 11 2A 16 04 01 30 80 20 11 06 23 00 04 19 01 00 E4 6B 0F 05 00 04 01 B8 
    //2E 19 11 04 0B 47 
  }


  event TestInvariant() {
    if (Outer.BaseAppearanceClass != None) {                                    //0000 : 07 7E 00 77 19 01 00 E4 6B 0F 05 00 04 01 E8 3F 19 11 2A 16 
      assert(Outer.BaseAppearance != None);                                     //0014 : 09 58 00 77 19 01 00 E4 6B 0F 05 00 04 01 B8 2E 19 11 2A 16 
      assert(mShiftedNPCType == None || mShiftedAppearance != None);            //0028 : 09 5B 00 84 72 01 B0 6E 20 11 2A 16 18 09 00 77 01 30 80 20 11 2A 16 16 
      assert(mShiftedNPCType != None || mShiftedAppearance == None);            //0040 : 09 5E 00 84 77 01 B0 6E 20 11 2A 16 18 09 00 72 01 30 80 20 11 2A 16 16 
      assert(mShiftedNPCType == None
        || mShiftedNPCTypeID == mShiftedNPCType.GetResourceId());//0058 : 09 61 00 84 72 01 B0 6E 20 11 2A 16 18 17 00 9A 01 D8 F2 21 11 19 01 B0 6E 20 11 06 00 04 1C 08 90 20 11 16 16 16 
    }
    //07 7E 00 77 19 01 00 E4 6B 0F 05 00 04 01 E8 3F 19 11 2A 16 09 58 00 77 19 01 00 E4 6B 0F 05 00 
    //04 01 B8 2E 19 11 2A 16 09 5B 00 84 72 01 B0 6E 20 11 2A 16 18 09 00 77 01 30 80 20 11 2A 16 16 
    //09 5E 00 84 77 01 B0 6E 20 11 2A 16 18 09 00 72 01 30 80 20 11 2A 16 16 09 61 00 84 72 01 B0 6E 
    //20 11 2A 16 18 17 00 9A 01 D8 F2 21 11 19 01 B0 6E 20 11 06 00 04 1C 08 90 20 11 16 16 16 04 0B 
    //47 
  }


  native function RestoreMovementPhysics();


  native function SaveMovementPhysics();



