//==============================================================================
//  Game_PlayerInput
//==============================================================================

class Game_PlayerInput extends Base_Component within Game_PlayerController
    native
    dependsOn(Game_PlayerController,Player,InteractionMaster,LevelInfo,Game_PlayerPawn,Game_CombatState,Game_Camera,GUI_BaseDesktop,Game_GUI,Game_Pawn,Game_Skills,FSkill_Type,Game_PlayerSkills,Game_PlayerCombatState,Game_SelectionCircle,PlayerInput,Pawn,Game_CharacterStats,Actor,PvPSettings,StringReferences,Game_Desktop,Game_MiniGameProxy,Game_TargetProjector,Interaction,Game_Effects,Game_GameMasterController,Editor_SpwnieControl)
    Config(User)
  ;

  const GPI_MOUSEMODIFIER3 =  2;
  const GPI_MOUSEMODIFIER2 =  1;
  const GPI_MOUSEMODIFIER1 =  0;
  const GPI_RIGHTMOUSEBUTTON =  2;
  const GPI_MIDDLEMOUSEBUTTON =  1;
  const GPI_LEFTMOUSEBUTTON =  0;
  enum EOutOfRangeState {
    OORS_InRange ,
    OORS_TooFar ,
    OORS_TooClose 
  };

  var bool mViewOverrideReceived;
  var private Vector mLastForceLocation;
  var private Actor mActorUnderMouse;
  var private Game_Pawn mPawnUnderReticule;
  var private byte mOutOfRangeState;
  var private byte mSkillStartFailure;
  var private bool mTargetLocationValid;
  var private Vector mTargetLocation;
  var private Actor mTargetActor;
  var private Game_Pawn mTargetPawn;
  var private Game_Pawn mLastReplicatedTargetPawn;
  var private Game_TargetProjector mTargetProjector;
  var private Game_SelectionCircle mSelectionCircle;
  var private bool mMouseWalking;
  var private bool mLeftMouseLooking;
  var Rotator ViewRotation;
  var bool mAutoRun;
  var int mBindings[16];
  var int mMouseModifiers[3];
  var float mLastClickTime[3];
  var float mMaxDoubleClickTime;
  var int SelectedSkillIndex;
  var globalconfig bool AutoSelectSkill;
  var int PreviousSkillIndex;
  var export editinline FSkill_Type mPreparedSkill;
  var globalconfig bool ShowSelectionCircle;
  var private bool mForwardPressed;
  var private bool mBackwardPressed;
  var private bool mPreviousForwardPressed;
  var private bool mPreviousBackwardPressed;
  var private bool mLeftPressed;
  var private bool mRightPressed;
  var private bool mRotateLeftPressed;
  var private bool mRotateRightPressed;
  var private bool mJumpPressed;
  var private transient bool mJumpJustPressed;
  var private bool mDodging;
  var private bool mLeftMouseDown;
  var private bool mRightMouseDown;
  var private bool mMiddleMouseDown;
  var config float mKeyboardRotateSpeed;
  var private float cCooldown;
  var private float mDrawSheatheCooldown;
  var Rotator ClientDirection;
  var private transient int mForwardCount;
  var private transient int mSideCount;
  var private transient bool mJumped;
  var config float mMouseLookModeMouseSensitivity;
  var config float mCursorModeMouseSensitivity;
  var bool mIgnoreTrace;
  var bool SkillsEnabled;
  var bool IsDrawingWeapon;
  var (null);


  private final function bool IsScreenshotMode() {
    return Outer.Player.InteractionMaster.ScreenshotMode == 2;                  //0000 : 04 9A 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 2C 02 16 
    //04 9A 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 
    //71 0F 2C 02 16 04 0B 47 
  }


  private final function bool IsDoubleClick(int Button) {
    if (Button < 3) {                                                           //0000 : 07 99 00 96 00 B8 DA 23 11 2C 03 16 
      if (Outer.Level != None) {                                                //000C : 07 99 00 77 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 2A 16 
        if (mLastClickTime[Button] > 0
          && mLastClickTime[Button] + mMaxDoubleClickTime >= Outer.Level.TimeSeconds) {//0020 : 07 76 00 82 B1 1A 00 B8 DA 23 11 01 38 DC 23 11 39 3F 25 16 18 2C 00 B3 AE 1A 00 B8 DA 23 11 01 38 DC 23 11 01 B0 DC 23 11 16 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 16 
          mLastClickTime[Button] = 0.00000000;                                  //0063 : 0F 1A 00 B8 DA 23 11 01 38 DC 23 11 1E 00 00 00 00 
          return True;                                                          //0074 : 04 27 
        }
        mLastClickTime[Button] = Outer.Level.TimeSeconds;                       //0076 : 0F 1A 00 B8 DA 23 11 01 38 DC 23 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      }
    }
    return False;                                                               //0099 : 04 28 
    //07 99 00 96 00 B8 DA 23 11 2C 03 16 07 99 00 77 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 2A 16 
    //07 76 00 82 B1 1A 00 B8 DA 23 11 01 38 DC 23 11 39 3F 25 16 18 2C 00 B3 AE 1A 00 B8 DA 23 11 01 
    //38 DC 23 11 01 B0 DC 23 11 16 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 
    //0F 16 16 0F 1A 00 B8 DA 23 11 01 38 DC 23 11 1E 00 00 00 00 04 27 0F 1A 00 B8 DA 23 11 01 38 DC 
    //23 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 04 28 04 0B 47 
  }


  final function bool IsModifierDown(int aModifier) {
    return mMouseModifiers[aModifier] == 1;                                     //0000 : 04 9A 1A 00 50 DE 23 11 01 08 DF 23 11 26 16 
    //04 9A 1A 00 50 DE 23 11 01 08 DF 23 11 26 16 04 0B 47 
  }


  private final function bool IsCombatReady() {
    local Game_PlayerPawn Pawn;
    Pawn = Game_PlayerPawn(Outer.Pawn);                                         //0000 : 0F 00 C8 E1 23 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    return Pawn != None && Pawn.combatState != None
      && Pawn.combatState.CombatReady();//0019 : 04 82 82 77 00 C8 E1 23 11 2A 16 18 12 00 77 19 00 C8 E1 23 11 05 00 04 01 B8 40 18 11 2A 16 16 18 19 00 19 19 00 C8 E1 23 11 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 
    //0F 00 C8 E1 23 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 04 82 82 77 00 C8 E1 
    //23 11 2A 16 18 12 00 77 19 00 C8 E1 23 11 05 00 04 01 B8 40 18 11 2A 16 16 18 19 00 19 19 00 C8 
    //E1 23 11 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 04 0B 47 
  }


  private final function Game_Camera GetCamera() {
    if (Outer != None && Outer.Camera != None) {                                //0000 : 07 30 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 B0 6A 18 11 2A 16 16 
      return Outer.Camera;                                                      //0021 : 04 19 01 00 E4 6B 0F 05 00 04 01 B0 6A 18 11 
    }
    return None;                                                                //0030 : 04 2A 
    //07 30 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 B0 6A 18 11 2A 16 
    //16 04 19 01 00 E4 6B 0F 05 00 04 01 B0 6A 18 11 04 2A 04 0B 47 
  }


  private final function GUI_BaseDesktop GetDesktop() {
    local Game_PlayerController GPC;
    GPC = Outer;                                                                //0000 : 0F 00 C0 E5 23 11 01 00 E4 6B 0F 
    if (GPC == None || GPC.Player == None
      || GPC.Player.GUIDesktop == None) {//000B : 07 50 00 84 84 72 00 C0 E5 23 11 2A 16 18 12 00 72 19 00 C0 E5 23 11 05 00 04 01 28 25 71 0F 2A 16 16 18 1B 00 72 19 19 00 C0 E5 23 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 2A 16 16 
      return None;                                                              //004B : 04 2A 
    } else {                                                                    //004D : 06 68 00 
      return GPC.Player.GUIDesktop;                                             //0050 : 04 19 19 00 C0 E5 23 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
    }
    //0F 00 C0 E5 23 11 01 00 E4 6B 0F 07 50 00 84 84 72 00 C0 E5 23 11 2A 16 18 12 00 72 19 00 C0 E5 
    //23 11 05 00 04 01 28 25 71 0F 2A 16 16 18 1B 00 72 19 19 00 C0 E5 23 11 05 00 04 01 28 25 71 0F 
    //05 00 04 01 90 C0 79 0F 2A 16 16 04 2A 06 68 00 04 19 19 00 C0 E5 23 11 05 00 04 01 28 25 71 0F 
    //05 00 04 01 90 C0 79 0F 04 0B 47 
  }


  final event CancelAction() {
    //04 0B 47 
  }


  exec function MouseModifier3(bool keyDown) {
    mMouseModifiers[2] = keyDown;                                               //0000 : 0F 1A 2C 02 01 08 DF 23 11 39 41 2D 00 C8 E7 23 11 
    //0F 1A 2C 02 01 08 DF 23 11 39 41 2D 00 C8 E7 23 11 04 0B 47 
  }


  exec function MouseModifier2(bool keyDown) {
    mMouseModifiers[1] = keyDown;                                               //0000 : 0F 1A 26 01 08 DF 23 11 39 41 2D 00 38 E9 23 11 
    //0F 1A 26 01 08 DF 23 11 39 41 2D 00 38 E9 23 11 04 0B 47 
  }


  exec function MouseModifier1(bool keyDown) {
    mMouseModifiers[0] = keyDown;                                               //0000 : 0F 1A 25 01 08 DF 23 11 39 41 2D 00 A8 EA 23 11 
    //0F 1A 25 01 08 DF 23 11 39 41 2D 00 A8 EA 23 11 04 0B 47 
  }


  exec function WheelDownBinding() {
    if (IsCombatReady()) {                                                      //0000 : 07 2F 00 1C A0 DD 23 11 16 
      if (IsModifierDown(0)) {                                                  //0009 : 07 26 00 1C 08 DA 23 11 25 16 
        GetCamera().ZoomOut();                                                  //0013 : 19 1C F8 DF 23 11 16 06 00 00 1B 23 0D 00 00 16 
      } else {                                                                  //0023 : 06 2C 00 
        SelectPreviousSkill();                                                  //0026 : 1B D5 0D 00 00 16 
      }
    } else {                                                                    //002C : 06 3F 00 
      GetCamera().ZoomOut();                                                    //002F : 19 1C F8 DF 23 11 16 06 00 00 1B 23 0D 00 00 16 
    }
    //07 2F 00 1C A0 DD 23 11 16 07 26 00 1C 08 DA 23 11 25 16 19 1C F8 DF 23 11 16 06 00 00 1B 23 0D 
    //00 00 16 06 2C 00 1B D5 0D 00 00 16 06 3F 00 19 1C F8 DF 23 11 16 06 00 00 1B 23 0D 00 00 16 04 
    //0B 47 
  }


  exec function WheelUpBinding() {
    if (IsCombatReady()) {                                                      //0000 : 07 2F 00 1C A0 DD 23 11 16 
      if (IsModifierDown(0)) {                                                  //0009 : 07 26 00 1C 08 DA 23 11 25 16 
        GetCamera().ZoomIn();                                                   //0013 : 19 1C F8 DF 23 11 16 06 00 00 1B 22 0D 00 00 16 
      } else {                                                                  //0023 : 06 2C 00 
        SelectNextSkill();                                                      //0026 : 1B D3 0D 00 00 16 
      }
    } else {                                                                    //002C : 06 3F 00 
      GetCamera().ZoomIn();                                                     //002F : 19 1C F8 DF 23 11 16 06 00 00 1B 22 0D 00 00 16 
    }
    //07 2F 00 1C A0 DD 23 11 16 07 26 00 1C 08 DA 23 11 25 16 19 1C F8 DF 23 11 16 06 00 00 1B 22 0D 
    //00 00 16 06 2C 00 1B D3 0D 00 00 16 06 3F 00 19 1C F8 DF 23 11 16 06 00 00 1B 22 0D 00 00 16 04 
    //0B 47 
  }


  private function SetMouseLookMode(bool mouseDown) {
    local GUI_BaseDesktop desktop;
    desktop = GetDesktop();                                                     //0000 : 0F 00 E8 EF 23 11 1C 40 E2 23 11 16 
    if (desktop == None) {                                                      //000C : 07 19 00 72 00 E8 EF 23 11 2A 16 
      return;                                                                   //0017 : 04 0B 
    }
    if (desktop.IsActive()) {                                                   //0019 : 07 63 00 19 00 E8 EF 23 11 06 00 04 1B 34 0C 00 00 16 
      if (mouseDown) {                                                          //002B : 07 3E 00 2D 00 88 EE 23 11 
        cl_SetMouseLookMode(True);                                              //0034 : 1B 59 0D 00 00 27 16 
      } else {                                                                  //003B : 06 60 00 
        if (desktop.IsTempActive()) {                                           //003E : 07 60 00 19 00 E8 EF 23 11 06 00 04 1B 35 0D 00 00 16 
          desktop.SetTempInactive(False);                                       //0050 : 19 00 E8 EF 23 11 07 00 00 1B 34 0D 00 00 28 16 
        }
      }
    } else {                                                                    //0060 : 06 87 00 
      if (desktop.IsTempInactive()) {                                           //0063 : 07 87 00 19 00 E8 EF 23 11 06 00 04 1B 36 0D 00 00 16 
        if (!mouseDown) {                                                       //0075 : 07 87 00 81 2D 00 88 EE 23 11 16 
          cl_SetMouseLookMode(False);                                           //0080 : 1B 59 0D 00 00 28 16 
        }
      }
    }
    //0F 00 E8 EF 23 11 1C 40 E2 23 11 16 07 19 00 72 00 E8 EF 23 11 2A 16 04 0B 07 63 00 19 00 E8 EF 
    //23 11 06 00 04 1B 34 0C 00 00 16 07 3E 00 2D 00 88 EE 23 11 1B 59 0D 00 00 27 16 06 60 00 07 60 
    //00 19 00 E8 EF 23 11 06 00 04 1B 35 0D 00 00 16 19 00 E8 EF 23 11 07 00 00 1B 34 0D 00 00 28 16 
    //06 87 00 07 87 00 19 00 E8 EF 23 11 06 00 04 1B 36 0D 00 00 16 07 87 00 81 2D 00 88 EE 23 11 16 
    //1B 59 0D 00 00 28 16 04 0B 47 
  }


  exec function MiddleMouseBinding(bool mouseDown) {
    if (!mAutoRun && mouseDown && IsDoubleClick(1)) {                           //0000 : 07 34 00 82 82 81 2D 01 20 F2 23 11 16 18 07 00 2D 00 10 F1 23 11 16 18 08 00 1C 80 D8 23 11 26 16 16 
      cl_SetAutoRun(True);                                                      //0022 : 1B D2 0C 00 00 27 16 
      mMiddleMouseDown = False;                                                 //0029 : 14 2D 01 98 F2 23 11 28 
    } else {                                                                    //0031 : 06 41 00 
      mMiddleMouseDown = mouseDown;                                             //0034 : 14 2D 01 98 F2 23 11 2D 00 10 F1 23 11 
    }
    SetMouseLookMode(mouseDown);                                                //0041 : 1B 7E 0C 00 00 2D 00 10 F1 23 11 16 
    //07 34 00 82 82 81 2D 01 20 F2 23 11 16 18 07 00 2D 00 10 F1 23 11 16 18 08 00 1C 80 D8 23 11 26 
    //16 16 1B D2 0C 00 00 27 16 14 2D 01 98 F2 23 11 28 06 41 00 14 2D 01 98 F2 23 11 2D 00 10 F1 23 
    //11 1B 7E 0C 00 00 2D 00 10 F1 23 11 16 04 0B 47 
  }


  exec function RightMouseBinding(bool mouseDown) {
    local bool isInteractionPossible;
    local GUI_BaseDesktop desktop;
    desktop = GetDesktop();                                                     //0000 : 0F 00 38 F4 23 11 1C 40 E2 23 11 16 
    if (desktop == None) {                                                      //000C : 07 19 00 72 00 38 F4 23 11 2A 16 
      return;                                                                   //0017 : 04 0B 
    }
    isInteractionPossible = desktop.IsRadialInteractionPossible();              //0019 : 14 2D 00 B0 F4 23 11 19 00 38 F4 23 11 06 00 04 1B 3A 0D 00 00 16 
    if (desktop.IsActive()) {                                                   //002F : 07 D0 00 19 00 38 F4 23 11 06 00 04 1B 34 0C 00 00 16 
      if (!desktop.HasHiliteComponent()) {                                      //0041 : 07 CD 00 81 19 00 38 F4 23 11 06 00 04 1B A9 12 00 00 16 16 
        if (!isInteractionPossible) {                                           //0055 : 07 A6 00 81 2D 00 B0 F4 23 11 16 
          Outer.GUI.CloseRadialMenu();                                          //0060 : 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B 16 0E 00 00 16 
          if (mouseDown && IsDoubleClick(2)) {                                  //0078 : 07 97 00 82 2D 00 C0 F3 23 11 18 09 00 1C 80 D8 23 11 2C 02 16 16 
            ToggleMouseLookMode();                                              //008E : 1B 57 0D 00 00 16 
          } else {                                                              //0094 : 06 A3 00 
            SetMouseLookMode(mouseDown);                                        //0097 : 1B 7E 0C 00 00 2D 00 C0 F3 23 11 16 
          }
        } else {                                                                //00A3 : 06 CD 00 
          if (mouseDown) {                                                      //00A6 : 07 CD 00 2D 00 C0 F3 23 11 
            cl_SelectTargetUnderMouse();                                        //00AF : 1B 49 05 00 00 16 
            Outer.GUI.OpenRadialMenu();                                         //00B5 : 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B 66 0D 00 00 16 
          }
        }
      }
    } else {                                                                    //00CD : 06 3D 01 
      if (mouseDown && !mRightMouseDown && isInteractionPossible) {             //00D0 : 07 12 01 82 82 2D 00 C0 F3 23 11 18 09 00 81 2D 01 28 F5 23 11 16 16 18 07 00 2D 00 B0 F4 23 11 16 
        cl_SelectTargetUnderMouse();                                            //00F1 : 1B 49 05 00 00 16 
        Outer.GUI.OpenRadialMenu();                                             //00F7 : 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B 66 0D 00 00 16 
      } else {                                                                  //010F : 06 3D 01 
        if (mouseDown && IsDoubleClick(2)) {                                    //0112 : 07 31 01 82 2D 00 C0 F3 23 11 18 09 00 1C 80 D8 23 11 2C 02 16 16 
          ToggleMouseLookMode();                                                //0128 : 1B 57 0D 00 00 16 
        } else {                                                                //012E : 06 3D 01 
          SetMouseLookMode(mouseDown);                                          //0131 : 1B 7E 0C 00 00 2D 00 C0 F3 23 11 16 
        }
      }
    }
    mRightMouseDown = mouseDown;                                                //013D : 14 2D 01 28 F5 23 11 2D 00 C0 F3 23 11 
    //0F 00 38 F4 23 11 1C 40 E2 23 11 16 07 19 00 72 00 38 F4 23 11 2A 16 04 0B 14 2D 00 B0 F4 23 11 
    //19 00 38 F4 23 11 06 00 04 1B 3A 0D 00 00 16 07 D0 00 19 00 38 F4 23 11 06 00 04 1B 34 0C 00 00 
    //16 07 CD 00 81 19 00 38 F4 23 11 06 00 04 1B A9 12 00 00 16 16 07 A6 00 81 2D 00 B0 F4 23 11 16 
    //19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B 16 0E 00 00 16 07 97 00 82 2D 00 C0 F3 
    //23 11 18 09 00 1C 80 D8 23 11 2C 02 16 16 1B 57 0D 00 00 16 06 A3 00 1B 7E 0C 00 00 2D 00 C0 F3 
    //23 11 16 06 CD 00 07 CD 00 2D 00 C0 F3 23 11 1B 49 05 00 00 16 19 19 01 00 E4 6B 0F 05 00 04 01 
    //40 8A 1B 11 06 00 00 1B 66 0D 00 00 16 06 3D 01 07 12 01 82 82 2D 00 C0 F3 23 11 18 09 00 81 2D 
    //01 28 F5 23 11 16 16 18 07 00 2D 00 B0 F4 23 11 16 1B 49 05 00 00 16 19 19 01 00 E4 6B 0F 05 00 
    //04 01 40 8A 1B 11 06 00 00 1B 66 0D 00 00 16 06 3D 01 07 31 01 82 2D 00 C0 F3 23 11 18 09 00 1C 
    //80 D8 23 11 2C 02 16 16 1B 57 0D 00 00 16 06 3D 01 1B 7E 0C 00 00 2D 00 C0 F3 23 11 16 14 2D 01 
    //28 F5 23 11 2D 00 C0 F3 23 11 04 0B 47 
  }


  exec function LeftMouseBinding(bool mouseDown) {
    local GUI_BaseDesktop desktop;
    desktop = GetDesktop();                                                     //0000 : 0F 00 C8 F6 23 11 1C 40 E2 23 11 16 
    if (desktop == None) {                                                      //000C : 07 19 00 72 00 C8 F6 23 11 2A 16 
      return;                                                                   //0017 : 04 0B 
    }
    if (mouseDown) {                                                            //0019 : 07 9A 00 2D 00 50 F6 23 11 
      if (IsCombatReady()) {                                                    //0022 : 07 8F 00 1C A0 DD 23 11 16 
        if (!desktop.IsActive()) {                                              //002B : 07 61 00 81 19 00 C8 F6 23 11 06 00 04 1B 34 0C 00 00 16 16 
          if (!IsModifierDown(0) || !cl_SelectTargetUnderMouse()) {             //003F : 07 5E 00 84 81 1C 08 DA 23 11 25 16 16 18 09 00 81 1B 49 05 00 00 16 16 16 
            ActivateSelectedSkill();                                            //0058 : 1B 7C 0C 00 00 16 
          }
        } else {                                                                //005E : 06 8C 00 
          if (mTargetPawn != None
            && mTargetPawn == mPawnUnderReticule) {//0061 : 07 86 00 82 77 01 40 F7 23 11 2A 16 18 0D 00 72 01 40 F7 23 11 01 B8 F7 23 11 16 16 
            ActivateSelectedSkill();                                            //007D : 1B 7C 0C 00 00 16 
          } else {                                                              //0083 : 06 8C 00 
            cl_SelectTargetUnderMouse();                                        //0086 : 1B 49 05 00 00 16 
          }
        }
      } else {                                                                  //008C : 06 9A 00 
        if (cl_SelectTargetUnderMouse()) {                                      //008F : 07 9A 00 1B 49 05 00 00 16 
          return;                                                               //0098 : 04 0B 
        }
      }
    }
    if (mouseDown && !mRightMouseDown
      && (!IsCombatReady() || !desktop.IsActive())
      && desktop.IsMouseInsideWindow()) {//009A : 07 F9 00 82 82 82 2D 00 50 F6 23 11 18 09 00 81 2D 01 28 F5 23 11 16 16 18 1F 00 84 81 1C A0 DD 23 11 16 16 18 12 00 81 19 00 C8 F6 23 11 06 00 04 1B 34 0C 00 00 16 16 16 16 18 10 00 19 00 C8 F6 23 11 06 00 04 1B AA 12 00 00 16 16 
      SetMouseLookMode(True);                                                   //00E7 : 1B 7E 0C 00 00 27 16 
      mLeftMouseLooking = True;                                                 //00EE : 14 2D 01 30 F8 23 11 27 
    } else {                                                                    //00F6 : 06 11 01 
      if (mLeftMouseLooking) {                                                  //00F9 : 07 11 01 2D 01 30 F8 23 11 
        mLeftMouseLooking = False;                                              //0102 : 14 2D 01 30 F8 23 11 28 
        SetMouseLookMode(False);                                                //010A : 1B 7E 0C 00 00 28 16 
      }
    }
    mLeftMouseDown = mouseDown;                                                 //0111 : 14 2D 01 A8 F8 23 11 2D 00 50 F6 23 11 
    //0F 00 C8 F6 23 11 1C 40 E2 23 11 16 07 19 00 72 00 C8 F6 23 11 2A 16 04 0B 07 9A 00 2D 00 50 F6 
    //23 11 07 8F 00 1C A0 DD 23 11 16 07 61 00 81 19 00 C8 F6 23 11 06 00 04 1B 34 0C 00 00 16 16 07 
    //5E 00 84 81 1C 08 DA 23 11 25 16 16 18 09 00 81 1B 49 05 00 00 16 16 16 1B 7C 0C 00 00 16 06 8C 
    //00 07 86 00 82 77 01 40 F7 23 11 2A 16 18 0D 00 72 01 40 F7 23 11 01 B8 F7 23 11 16 16 1B 7C 0C 
    //00 00 16 06 8C 00 1B 49 05 00 00 16 06 9A 00 07 9A 00 1B 49 05 00 00 16 04 0B 07 F9 00 82 82 82 
    //2D 00 50 F6 23 11 18 09 00 81 2D 01 28 F5 23 11 16 16 18 1F 00 84 81 1C A0 DD 23 11 16 16 18 12 
    //00 81 19 00 C8 F6 23 11 06 00 04 1B 34 0C 00 00 16 16 16 16 18 10 00 19 00 C8 F6 23 11 06 00 04 
    //1B AA 12 00 00 16 16 1B 7E 0C 00 00 27 16 14 2D 01 30 F8 23 11 27 06 11 01 07 11 01 2D 01 30 F8 
    //23 11 14 2D 01 30 F8 23 11 28 1B 7E 0C 00 00 28 16 14 2D 01 A8 F8 23 11 2D 00 50 F6 23 11 04 0B 
    //47 
  }


  exec function cl_NextTab() {
    Outer.Player.GUIDesktop.NextTabStop();                                      //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B 37 0D 00 00 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B 37 0D 00 00 
    //16 04 0B 47 
  }


  function cl_SetMouseLookMode(bool aIsPressed) {
    local GUI_BaseDesktop desktop;
    desktop = GetDesktop();                                                     //0000 : 0F 00 58 FB 23 11 1C 40 E2 23 11 16 
    if (desktop != None) {                                                      //000C : 07 DD 00 77 00 58 FB 23 11 2A 16 
      if (aIsPressed) {                                                         //0017 : 07 82 00 2D 00 E0 FA 23 11 
        if (!desktop.IsTempActive() && !desktop.IsTempInactive()) {             //0020 : 07 7F 00 82 81 19 00 58 FB 23 11 06 00 04 1B 35 0D 00 00 16 16 18 12 00 81 19 00 58 FB 23 11 06 00 04 1B 36 0D 00 00 16 16 16 
          if (desktop.IsActive()) {                                             //004A : 07 6F 00 19 00 58 FB 23 11 06 00 04 1B 34 0C 00 00 16 
            desktop.SetTempInactive(True);                                      //005C : 19 00 58 FB 23 11 07 00 00 1B 34 0D 00 00 27 16 
          } else {                                                              //006C : 06 7F 00 
            desktop.SetTempActive(True);                                        //006F : 19 00 58 FB 23 11 07 00 00 1B 02 0F 00 00 27 16 
          }
        }
      } else {                                                                  //007F : 06 DD 00 
        if (desktop.IsTempActive() || desktop.IsTempInactive()) {               //0082 : 07 DD 00 84 19 00 58 FB 23 11 06 00 04 1B 35 0D 00 00 16 18 10 00 19 00 58 FB 23 11 06 00 04 1B 36 0D 00 00 16 16 
          if (desktop.IsActive()) {                                             //00A8 : 07 CD 00 19 00 58 FB 23 11 06 00 04 1B 34 0C 00 00 16 
            desktop.SetTempActive(False);                                       //00BA : 19 00 58 FB 23 11 07 00 00 1B 02 0F 00 00 28 16 
          } else {                                                              //00CA : 06 DD 00 
            desktop.SetTempInactive(False);                                     //00CD : 19 00 58 FB 23 11 07 00 00 1B 34 0D 00 00 28 16 
          }
        }
      }
    }
    //0F 00 58 FB 23 11 1C 40 E2 23 11 16 07 DD 00 77 00 58 FB 23 11 2A 16 07 82 00 2D 00 E0 FA 23 11 
    //07 7F 00 82 81 19 00 58 FB 23 11 06 00 04 1B 35 0D 00 00 16 16 18 12 00 81 19 00 58 FB 23 11 06 
    //00 04 1B 36 0D 00 00 16 16 16 07 6F 00 19 00 58 FB 23 11 06 00 04 1B 34 0C 00 00 16 19 00 58 FB 
    //23 11 07 00 00 1B 34 0D 00 00 27 16 06 7F 00 19 00 58 FB 23 11 07 00 00 1B 02 0F 00 00 27 16 06 
    //DD 00 07 DD 00 84 19 00 58 FB 23 11 06 00 04 1B 35 0D 00 00 16 18 10 00 19 00 58 FB 23 11 06 00 
    //04 1B 36 0D 00 00 16 16 07 CD 00 19 00 58 FB 23 11 06 00 04 1B 34 0C 00 00 16 19 00 58 FB 23 11 
    //07 00 00 1B 02 0F 00 00 28 16 06 DD 00 19 00 58 FB 23 11 07 00 00 1B 34 0D 00 00 28 16 04 0B 47 
    //
  }


  exec function ToggleMouseLookMode() {
    GetDesktop().ToggleActive();                                                //0000 : 19 1C 40 E2 23 11 16 06 00 00 1B A2 12 00 00 16 
    //19 1C 40 E2 23 11 16 06 00 00 1B A2 12 00 00 16 04 0B 47 
  }


  exec function Rest() {
    local Game_PlayerController PlayerController;
    local Game_Pawn Pawn;
    local bool ignoreVelocity;
    PlayerController = Outer;                                                   //0000 : 0F 00 78 FD 23 11 01 00 E4 6B 0F 
    if (PlayerController != None) {                                             //000B : 07 D1 00 77 00 78 FD 23 11 2A 16 
      Pawn = Game_Pawn(PlayerController.Pawn);                                  //0016 : 0F 00 40 FF 23 11 2E 18 38 5B 01 19 00 78 FD 23 11 05 00 04 01 88 83 6C 0F 
      if (Pawn != None && !Pawn.IsDead()) {                                     //002F : 07 D1 00 82 77 00 40 FF 23 11 2A 16 18 12 00 81 19 00 40 FF 23 11 06 00 04 1C D8 52 34 0F 16 16 16 
        if (Pawn.bCanRest) {                                                    //0050 : 07 D1 00 19 00 40 FF 23 11 06 00 04 2D 01 68 75 76 0F 
          switch (Pawn.Physics) {                                               //0062 : 05 01 19 00 40 FF 23 11 05 00 01 01 C0 93 6C 0F 
            case 1 :                                                            //0072 : 0A 77 00 24 01 
            case 19 :                                                           //0077 : 0A 7C 00 24 13 
            case 20 :                                                           //007C : 0A CE 00 24 14 
              ignoreVelocity = mAutoRun
                && !(mLeftPressed || mRightPressed);//0081 : 14 2D 00 B8 FF 23 11 82 2D 01 20 F2 23 11 18 14 00 81 84 2D 01 30 00 24 11 18 07 00 2D 01 A8 00 24 11 16 16 16 
              Pawn.cl2sv_Rest_CallStub(ignoreVelocity);                         //00A6 : 19 00 40 FF 23 11 0C 00 00 1B 56 0E 00 00 2D 00 B8 FF 23 11 16 
              if (ignoreVelocity) {                                             //00BB : 07 CB 00 2D 00 B8 FF 23 11 
                cl_SetAutoRun(False);                                           //00C4 : 1B D2 0C 00 00 28 16 
              }
              break;                                                            //00CB : 06 D1 00 
            default:                                                            //00CE : 0A FF FF 
          }
        }
      }
    }
    //0F 00 78 FD 23 11 01 00 E4 6B 0F 07 D1 00 77 00 78 FD 23 11 2A 16 0F 00 40 FF 23 11 2E 18 38 5B 
    //01 19 00 78 FD 23 11 05 00 04 01 88 83 6C 0F 07 D1 00 82 77 00 40 FF 23 11 2A 16 18 12 00 81 19 
    //00 40 FF 23 11 06 00 04 1C D8 52 34 0F 16 16 16 07 D1 00 19 00 40 FF 23 11 06 00 04 2D 01 68 75 
    //76 0F 05 01 19 00 40 FF 23 11 05 00 01 01 C0 93 6C 0F 0A 77 00 24 01 0A 7C 00 24 13 0A CE 00 24 
    //14 14 2D 00 B8 FF 23 11 82 2D 01 20 F2 23 11 18 14 00 81 84 2D 01 30 00 24 11 18 07 00 2D 01 A8 
    //00 24 11 16 16 16 19 00 40 FF 23 11 0C 00 00 1B 56 0E 00 00 2D 00 B8 FF 23 11 16 07 CB 00 2D 00 
    //B8 FF 23 11 1B D2 0C 00 00 28 16 06 D1 00 0A FF FF 04 0B 47 
  }


  function EnableSkills(bool aSetting) {
    if (SkillsEnabled != aSetting) {                                            //0000 : 07 77 00 F3 2D 01 48 02 24 11 2D 00 D0 01 24 11 16 
      SkillsEnabled = aSetting;                                                 //0011 : 14 2D 01 48 02 24 11 2D 00 D0 01 24 11 
      if (SkillsEnabled && AutoSelectSkill) {                                   //001E : 07 61 00 82 2D 01 48 02 24 11 18 07 00 2D 01 C0 02 24 11 16 
        SelectedSkillIndex = PreviousSkillIndex;                                //0032 : 0F 01 38 03 24 11 01 B0 03 24 11 
        if (SelectedSkillIndex == -1) {                                         //003D : 07 53 00 9A 01 38 03 24 11 1D FF FF FF FF 16 
          SelectedSkillIndex = 0;                                               //004C : 0F 01 38 03 24 11 25 
        }
        SelectSkillSlot(SelectedSkillIndex);                                    //0053 : 1B 57 0C 00 00 01 38 03 24 11 16 
      } else {                                                                  //005E : 06 77 00 
        PreviousSkillIndex = SelectedSkillIndex;                                //0061 : 0F 01 B0 03 24 11 01 38 03 24 11 
        SelectedSkillIndex = -1;                                                //006C : 0F 01 38 03 24 11 1D FF FF FF FF 
      }
    }
    //07 77 00 F3 2D 01 48 02 24 11 2D 00 D0 01 24 11 16 14 2D 01 48 02 24 11 2D 00 D0 01 24 11 07 61 
    //00 82 2D 01 48 02 24 11 18 07 00 2D 01 C0 02 24 11 16 0F 01 38 03 24 11 01 B0 03 24 11 07 53 00 
    //9A 01 38 03 24 11 1D FF FF FF FF 16 0F 01 38 03 24 11 25 1B 57 0C 00 00 01 38 03 24 11 16 06 77 
    //00 0F 01 B0 03 24 11 01 38 03 24 11 0F 01 38 03 24 11 1D FF FF FF FF 04 0B 47 
  }


  function AutoTarget(Game_Pawn aTargetPawn) {
    if (aTargetPawn != None
      && (mTargetPawn == None || mTargetPawn.IsDead())) {//0000 : 07 37 00 82 77 00 D8 04 24 11 2A 16 18 1D 00 84 72 01 40 F7 23 11 2A 16 18 10 00 19 01 40 F7 23 11 06 00 04 1C D8 52 34 0F 16 16 16 
      cl_SetTargetActor(aTargetPawn);                                           //002C : 1B 4F 05 00 00 00 D8 04 24 11 16 
    }
    //07 37 00 82 77 00 D8 04 24 11 2A 16 18 1D 00 84 72 01 40 F7 23 11 2A 16 18 10 00 19 01 40 F7 23 
    //11 06 00 04 1C D8 52 34 0F 16 16 16 1B 4F 05 00 00 00 D8 04 24 11 16 04 0B 47 
  }


  exec function bool ActivateSelectedSkill() {
    local Game_Pawn gamePawn;
    local export editinline FSkill_Type selectedSkillType;
    local AimingInfo AimingInfo;
    local Game_PlayerController GPC;
    local Vector targetVec;
    gamePawn = Game_Pawn(Outer.Pawn);                                           //0000 : 0F 00 F0 06 24 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    selectedSkillType = gamePawn.Skills.GetActiveTierSlotSkill(SelectedSkillIndex);//0019 : 0F 00 68 07 24 11 19 19 00 F0 06 24 11 05 00 04 01 08 28 18 11 0B 00 04 1C 60 E0 21 11 01 38 03 24 11 16 
    if (selectedSkillType != None) {                                            //003C : 07 73 00 77 00 68 07 24 11 2A 16 
      Game_Pawn(Outer.Pawn).Skills.CanActivateSpecificSkill(selectedSkillType,True);//0047 : 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 08 28 18 11 0C 00 01 1C 30 D4 21 11 00 68 07 24 11 27 16 
    }
    if (SkillsEnabled && SelectedSkillIndex != -1) {                            //0073 : 07 59 02 82 2D 01 48 02 24 11 18 0D 00 9B 01 38 03 24 11 1D FF FF FF FF 16 16 
      if (selectedSkillType != None) {                                          //008D : 07 59 02 77 00 68 07 24 11 2A 16 
        GPC = Outer;                                                            //0098 : 0F 00 E0 07 24 11 01 00 E4 6B 0F 
        if (GPC != None) {                                                      //00A3 : 07 FC 00 77 00 E0 07 24 11 2A 16 
          AimingInfo.CameraLocation = GPC.CalcViewLocation;                     //00AE : 0F 36 58 2B 18 11 00 58 08 24 11 19 00 E0 07 24 11 05 00 0C 01 E8 71 71 0F 
          AimingInfo.CameraRotation = GPC.CalcViewRotation;                     //00C7 : 0F 36 E0 2A 18 11 00 58 08 24 11 19 00 E0 07 24 11 05 00 0C 01 D8 72 71 0F 
          AimingInfo.TriggerTime = GPC.ServerTime;                              //00E0 : 0F 36 48 2C 18 11 00 58 08 24 11 19 00 E0 07 24 11 05 00 04 01 10 93 1B 11 
        } else {                                                                //00F9 : 06 3C 01 
          AimingInfo.CameraLocation = vect(0.000000, 0.000000, 0.000000);       //00FC : 0F 36 58 2B 18 11 00 58 08 24 11 23 00 00 00 00 00 00 00 00 00 00 00 00 
          AimingInfo.CameraRotation = rot(0, 0, 0);                             //0114 : 0F 36 E0 2A 18 11 00 58 08 24 11 22 00 00 00 00 00 00 00 00 00 00 00 00 
          AimingInfo.TriggerTime = -1.00000000;                                 //012C : 0F 36 48 2C 18 11 00 58 08 24 11 1E 00 00 80 BF 
        }
        AimingInfo.PreferredTarget = mPawnUnderReticule;                        //013C : 0F 36 D0 2B 18 11 00 58 08 24 11 01 B8 F7 23 11 
        if (selectedSkillType.PaintLocation) {                                  //014C : 07 23 02 19 00 68 07 24 11 06 00 04 2D 01 10 BB 20 11 
          if (mOutOfRangeState != 0) {                                          //015E : 07 95 01 9B 39 3A 01 D0 08 24 11 39 3A 24 00 16 
            Game_PlayerSkills(gamePawn.Skills).ReportError(selectedSkillType,10);//016E : 19 2E C8 9D 5F 01 19 00 F0 06 24 11 05 00 04 01 08 28 18 11 0D 00 00 1B FB 0E 00 00 00 68 07 24 11 24 0A 16 
          } else {                                                              //0192 : 06 20 02 
            if (mTargetLocationValid) {                                         //0195 : 07 20 02 2D 01 48 09 24 11 
              if (mPawnUnderReticule != None) {                                 //019E : 07 E5 01 77 01 B8 F7 23 11 2A 16 
                targetVec = mPawnUnderReticule.Location;                        //01A9 : 0F 00 C0 09 24 11 19 01 B8 F7 23 11 05 00 0C 01 30 81 6C 0F 
                targetVec.Z -= mPawnUnderReticule.CollisionHeight;              //01BD : B9 36 38 C5 69 0F 00 C0 09 24 11 19 01 B8 F7 23 11 05 00 04 01 40 8A 6C 0F 16 
                AutoTarget(mPawnUnderReticule);                                 //01D7 : 1B CC 0C 00 00 01 B8 F7 23 11 16 
              } else {                                                          //01E2 : 06 F0 01 
                targetVec = mTargetLocation;                                    //01E5 : 0F 00 C0 09 24 11 01 38 0A 24 11 
              }
              gamePawn.Skills.ExecuteIndexL(SelectedSkillIndex,targetVec,AimingInfo);//01F0 : 19 19 00 F0 06 24 11 05 00 04 01 08 28 18 11 15 00 00 1C 00 D0 21 11 01 38 03 24 11 00 C0 09 24 11 00 58 08 24 11 16 
              mPreparedSkill = None;                                            //0217 : 0F 01 B0 0A 24 11 2A 
              return True;                                                      //021E : 04 27 
            }
          }
        } else {                                                                //0220 : 06 59 02 
          gamePawn.Skills.ExecuteIndex(SelectedSkillIndex,AimingInfo);          //0223 : 19 19 00 F0 06 24 11 05 00 04 01 08 28 18 11 10 00 00 1B 5B 0F 00 00 01 38 03 24 11 00 58 08 24 11 16 
          mPreparedSkill = None;                                                //0245 : 0F 01 B0 0A 24 11 2A 
          AutoTarget(mPawnUnderReticule);                                       //024C : 1B CC 0C 00 00 01 B8 F7 23 11 16 
          return True;                                                          //0257 : 04 27 
        }
      }
    }
    OnActivateSkillFailed();                                                    //0259 : 43 08 30 27 11 B0 05 00 00 16 
    return False;                                                               //0263 : 04 28 
    //0F 00 F0 06 24 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0F 00 68 07 24 11 19 
    //19 00 F0 06 24 11 05 00 04 01 08 28 18 11 0B 00 04 1C 60 E0 21 11 01 38 03 24 11 16 07 73 00 77 
    //00 68 07 24 11 2A 16 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 
    //08 28 18 11 0C 00 01 1C 30 D4 21 11 00 68 07 24 11 27 16 07 59 02 82 2D 01 48 02 24 11 18 0D 00 
    //9B 01 38 03 24 11 1D FF FF FF FF 16 16 07 59 02 77 00 68 07 24 11 2A 16 0F 00 E0 07 24 11 01 00 
    //E4 6B 0F 07 FC 00 77 00 E0 07 24 11 2A 16 0F 36 58 2B 18 11 00 58 08 24 11 19 00 E0 07 24 11 05 
    //00 0C 01 E8 71 71 0F 0F 36 E0 2A 18 11 00 58 08 24 11 19 00 E0 07 24 11 05 00 0C 01 D8 72 71 0F 
    //0F 36 48 2C 18 11 00 58 08 24 11 19 00 E0 07 24 11 05 00 04 01 10 93 1B 11 06 3C 01 0F 36 58 2B 
    //18 11 00 58 08 24 11 23 00 00 00 00 00 00 00 00 00 00 00 00 0F 36 E0 2A 18 11 00 58 08 24 11 22 
    //00 00 00 00 00 00 00 00 00 00 00 00 0F 36 48 2C 18 11 00 58 08 24 11 1E 00 00 80 BF 0F 36 D0 2B 
    //18 11 00 58 08 24 11 01 B8 F7 23 11 07 23 02 19 00 68 07 24 11 06 00 04 2D 01 10 BB 20 11 07 95 
    //01 9B 39 3A 01 D0 08 24 11 39 3A 24 00 16 19 2E C8 9D 5F 01 19 00 F0 06 24 11 05 00 04 01 08 28 
    //18 11 0D 00 00 1B FB 0E 00 00 00 68 07 24 11 24 0A 16 06 20 02 07 20 02 2D 01 48 09 24 11 07 E5 
    //01 77 01 B8 F7 23 11 2A 16 0F 00 C0 09 24 11 19 01 B8 F7 23 11 05 00 0C 01 30 81 6C 0F B9 36 38 
    //C5 69 0F 00 C0 09 24 11 19 01 B8 F7 23 11 05 00 04 01 40 8A 6C 0F 16 1B CC 0C 00 00 01 B8 F7 23 
    //11 16 06 F0 01 0F 00 C0 09 24 11 01 38 0A 24 11 19 19 00 F0 06 24 11 05 00 04 01 08 28 18 11 15 
    //00 00 1C 00 D0 21 11 01 38 03 24 11 00 C0 09 24 11 00 58 08 24 11 16 0F 01 B0 0A 24 11 2A 04 27 
    //06 59 02 19 19 00 F0 06 24 11 05 00 04 01 08 28 18 11 10 00 00 1B 5B 0F 00 00 01 38 03 24 11 00 
    //58 08 24 11 16 0F 01 B0 0A 24 11 2A 1B CC 0C 00 00 01 B8 F7 23 11 16 04 27 43 08 30 27 11 B0 05 
    //00 00 16 04 28 04 0B 47 
  }


  exec function ReleaseKeybinding(int Index,string execCommand) {
    if (mBindings[Index] == 1) {                                                //0000 : 07 51 00 9A 1A 00 30 31 27 11 01 48 32 27 11 26 16 
      mBindings[Index] = 0;                                                     //0011 : 0F 1A 00 30 31 27 11 01 48 32 27 11 25 
      if (Len(execCommand) > 0) {                                               //001E : 07 51 00 97 7D 00 C0 32 27 11 16 25 16 
        Outer.Player.GUIDesktop.ConsoleCommand(execCommand);                    //002B : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 04 1B 65 0C 00 00 00 C0 32 27 11 16 
      }
    }
    //07 51 00 9A 1A 00 30 31 27 11 01 48 32 27 11 26 16 0F 1A 00 30 31 27 11 01 48 32 27 11 25 07 51 
    //00 97 7D 00 C0 32 27 11 16 25 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 
    //C0 79 0F 0B 00 04 1B 65 0C 00 00 00 C0 32 27 11 16 04 0B 47 
  }


  exec function SetKeybinding(int Index,string execCommand) {
    if (mBindings[Index] == 0) {                                                //0000 : 07 51 00 9A 1A 00 E8 33 27 11 01 48 32 27 11 25 16 
      mBindings[Index] = 1;                                                     //0011 : 0F 1A 00 E8 33 27 11 01 48 32 27 11 26 
      if (Len(execCommand) > 0) {                                               //001E : 07 51 00 97 7D 00 00 35 27 11 16 25 16 
        Outer.Player.GUIDesktop.ConsoleCommand(execCommand);                    //002B : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 04 1B 65 0C 00 00 00 00 35 27 11 16 
      }
    }
    //07 51 00 9A 1A 00 E8 33 27 11 01 48 32 27 11 25 16 0F 1A 00 E8 33 27 11 01 48 32 27 11 26 07 51 
    //00 97 7D 00 00 35 27 11 16 25 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 
    //C0 79 0F 0B 00 04 1B 65 0C 00 00 00 00 35 27 11 16 04 0B 47 
  }


  exec function SelectNearestEnemy() {
    //04 0B 47 
  }


  native exec function SelectNextEnemy();


  exec function SelectAndExecuteSkill(int aSelectedSkillIndex) {
    local export editinline FSkill_Type aSkill;
    if (aSelectedSkillIndex < Game_Pawn(Outer.Pawn).Skills.GetSkilldeckColumnCount()) {//0000 : 07 52 00 96 00 E8 37 27 11 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 08 28 18 11 06 00 04 1B 87 0C 00 00 16 16 
      mPreparedSkill = SelectSkillSlot(aSelectedSkillIndex);                    //0030 : 0F 01 B0 0A 24 11 1B 57 0C 00 00 00 E8 37 27 11 16 
      if (mPreparedSkill != None) {                                             //0041 : 07 52 00 77 01 B0 0A 24 11 2A 16 
        ActivateSelectedSkill();                                                //004C : 1B 7C 0C 00 00 16 
      }
    }
    //07 52 00 96 00 E8 37 27 11 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 
    //04 01 08 28 18 11 06 00 04 1B 87 0C 00 00 16 16 0F 01 B0 0A 24 11 1B 57 0C 00 00 00 E8 37 27 11 
    //16 07 52 00 77 01 B0 0A 24 11 2A 16 1B 7C 0C 00 00 16 04 0B 47 
  }


  exec function SelectOrExecuteSkill(int aSelectedSkillIndex) {
    if (SkillsEnabled) {                                                        //0000 : 07 62 00 2D 01 48 02 24 11 
      if (SelectedSkillIndex != aSelectedSkillIndex) {                          //0009 : 07 5C 00 9B 01 38 03 24 11 00 28 3A 27 11 16 
        if (aSelectedSkillIndex < Game_Pawn(Outer.Pawn).Skills.GetSkilldeckColumnCount()) {//0018 : 07 59 00 96 00 28 3A 27 11 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 08 28 18 11 06 00 04 1B 87 0C 00 00 16 16 
          mPreparedSkill = SelectSkillSlot(aSelectedSkillIndex);                //0048 : 0F 01 B0 0A 24 11 1B 57 0C 00 00 00 28 3A 27 11 16 
        }
      } else {                                                                  //0059 : 06 62 00 
        ActivateSelectedSkill();                                                //005C : 1B 7C 0C 00 00 16 
      }
    }
    //07 62 00 2D 01 48 02 24 11 07 5C 00 9B 01 38 03 24 11 00 28 3A 27 11 16 07 59 00 96 00 28 3A 27 
    //11 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 08 28 18 11 06 00 
    //04 1B 87 0C 00 00 16 16 0F 01 B0 0A 24 11 1B 57 0C 00 00 00 28 3A 27 11 16 06 62 00 1B 7C 0C 00 
    //00 16 04 0B 47 
  }


  exec function SelectPreviousSkill() {
    if (SelectedSkillIndex < 0) {                                               //0000 : 07 13 00 96 01 38 03 24 11 25 16 
      SelectSkillSlot(4);                                                       //000B : 1B 57 0C 00 00 2C 04 16 
    }
    if (SelectedSkillIndex >= 1) {                                              //0013 : 07 2C 00 99 01 38 03 24 11 26 16 
      SelectSkillSlot(SelectedSkillIndex - 1);                                  //001E : 1B 57 0C 00 00 93 01 38 03 24 11 26 16 16 
    }
    //07 13 00 96 01 38 03 24 11 25 16 1B 57 0C 00 00 2C 04 16 07 2C 00 99 01 38 03 24 11 26 16 1B 57 
    //0C 00 00 93 01 38 03 24 11 26 16 16 04 0B 47 
  }


  exec function SelectNextSkill() {
    local Game_PlayerPawn playerPawn;
    playerPawn = Game_PlayerPawn(Outer.Pawn);                                   //0000 : 0F 00 20 3D 27 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    if (playerPawn != None && playerPawn.Skills != None) {                      //0019 : 07 7B 00 82 77 00 20 3D 27 11 2A 16 18 12 00 77 19 00 20 3D 27 11 05 00 04 01 08 28 18 11 2A 16 16 
      if (SelectedSkillIndex < 4
        && SelectedSkillIndex < playerPawn.Skills.GetSkilldeckColumnCount() - 1) {//003A : 07 7B 00 82 96 01 38 03 24 11 2C 04 16 18 23 00 96 01 38 03 24 11 93 19 19 00 20 3D 27 11 05 00 04 01 08 28 18 11 06 00 04 1B 87 0C 00 00 16 26 16 16 16 
        SelectSkillSlot(SelectedSkillIndex + 1);                                //006D : 1B 57 0C 00 00 92 01 38 03 24 11 26 16 16 
      }
    }
    //0F 00 20 3D 27 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 07 7B 00 82 77 00 20 
    //3D 27 11 2A 16 18 12 00 77 19 00 20 3D 27 11 05 00 04 01 08 28 18 11 2A 16 16 07 7B 00 82 96 01 
    //38 03 24 11 2C 04 16 18 23 00 96 01 38 03 24 11 93 19 19 00 20 3D 27 11 05 00 04 01 08 28 18 11 
    //06 00 04 1B 87 0C 00 00 16 26 16 16 16 1B 57 0C 00 00 92 01 38 03 24 11 26 16 16 04 0B 47 
  }


  exec function FSkill_Type SelectSkillSlot(int aSelectedSkillIndex) {
    local Game_PlayerPawn gamePlayerPawn;
    local export editinline FSkill_Type selectedSkillType;
    if (SkillsEnabled) {                                                        //0000 : 07 F8 00 2D 01 48 02 24 11 
      gamePlayerPawn = Game_PlayerPawn(Outer.Pawn);                             //0009 : 0F 00 20 41 27 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
      if (gamePlayerPawn == None || gamePlayerPawn.Skills == None) {            //0022 : 07 45 00 84 72 00 20 41 27 11 2A 16 18 12 00 72 19 00 20 41 27 11 05 00 04 01 08 28 18 11 2A 16 16 
        return None;                                                            //0043 : 04 2A 
      }
      if (aSelectedSkillIndex < 0
        || aSelectedSkillIndex >= gamePlayerPawn.Skills.GetSkilldeckColumnCount()) {//0045 : 07 7F 00 84 96 00 20 3F 27 11 25 16 18 20 00 99 00 20 3F 27 11 19 19 00 20 41 27 11 05 00 04 01 08 28 18 11 06 00 04 1B 87 0C 00 00 16 16 16 
        aSelectedSkillIndex = -1;                                               //0074 : 0F 00 20 3F 27 11 1D FF FF FF FF 
      }
      if (aSelectedSkillIndex != SelectedSkillIndex) {                          //007F : 07 99 00 9B 00 20 3F 27 11 01 38 03 24 11 16 
        SelectedSkillIndex = aSelectedSkillIndex;                               //008E : 0F 01 38 03 24 11 00 20 3F 27 11 
      }
      if (SelectedSkillIndex >= 0) {                                            //0099 : 07 F8 00 99 01 38 03 24 11 25 16 
        selectedSkillType = gamePlayerPawn.Skills.GetActiveTierSlotSkill(SelectedSkillIndex);//00A4 : 0F 00 98 41 27 11 19 19 00 20 41 27 11 05 00 04 01 08 28 18 11 0B 00 04 1C 60 E0 21 11 01 38 03 24 11 16 
        Game_PlayerCombatState(gamePlayerPawn.combatState).cl2sv_SwitchWeaponType_CallStub(selectedSkillType.RequiredWeapon);//00C7 : 19 2E 70 88 5F 01 19 00 20 41 27 11 05 00 04 01 B8 40 18 11 14 00 00 1B 3A 0F 00 00 19 00 98 41 27 11 05 00 01 01 10 B6 20 11 16 
        return selectedSkillType;                                               //00F2 : 04 00 98 41 27 11 
      }
    }
    return None;                                                                //00F8 : 04 2A 
    //07 F8 00 2D 01 48 02 24 11 0F 00 20 41 27 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 
    //6C 0F 07 45 00 84 72 00 20 41 27 11 2A 16 18 12 00 72 19 00 20 41 27 11 05 00 04 01 08 28 18 11 
    //2A 16 16 04 2A 07 7F 00 84 96 00 20 3F 27 11 25 16 18 20 00 99 00 20 3F 27 11 19 19 00 20 41 27 
    //11 05 00 04 01 08 28 18 11 06 00 04 1B 87 0C 00 00 16 16 16 0F 00 20 3F 27 11 1D FF FF FF FF 07 
    //99 00 9B 00 20 3F 27 11 01 38 03 24 11 16 0F 01 38 03 24 11 00 20 3F 27 11 07 F8 00 99 01 38 03 
    //24 11 25 16 0F 00 98 41 27 11 19 19 00 20 41 27 11 05 00 04 01 08 28 18 11 0B 00 04 1C 60 E0 21 
    //11 01 38 03 24 11 16 19 2E 70 88 5F 01 19 00 20 41 27 11 05 00 04 01 B8 40 18 11 14 00 00 1B 3A 
    //0F 00 00 19 00 98 41 27 11 05 00 01 01 10 B6 20 11 16 04 00 98 41 27 11 04 2A 04 0B 47 
  }


  event cl_OnUpdateSelectionCircle(float aDeltaTime) {
    if (mSelectionCircle != None) {                                             //0000 : 07 1F 00 77 01 08 44 27 11 2A 16 
      mSelectionCircle.cl_UpdateLocation(aDeltaTime);                           //000B : 19 01 08 44 27 11 0B 00 00 1B 46 0F 00 00 00 38 43 27 11 16 
    }
    //07 1F 00 77 01 08 44 27 11 2A 16 19 01 08 44 27 11 0B 00 00 1B 46 0F 00 00 00 38 43 27 11 16 04 
    //0B 47 
  }


  event sv_PlayerInput(float DeltaSeconds) {
    //04 0B 47 
  }


  event cl_PlayerInput(Game_PlayerController aController,float DeltaSeconds) {
    if (aController != None) {                                                  //0000 : 07 65 00 77 00 88 46 27 11 2A 16 
      if (aController.PlayerInput.bInvertMouse) {                               //000B : 07 47 00 19 19 00 88 46 27 11 05 00 04 01 30 20 71 0F 06 00 04 2D 01 88 23 71 0F 
        aController.aLookUp -= aController.aMouseY;                             //0026 : B9 19 00 88 46 27 11 05 00 04 01 08 56 71 0F 19 00 88 46 27 11 05 00 04 01 D8 30 72 0F 16 
      } else {                                                                  //0044 : 06 65 00 
        aController.aLookUp += aController.aMouseY;                             //0047 : B8 19 00 88 46 27 11 05 00 04 01 08 56 71 0F 19 00 88 46 27 11 05 00 04 01 D8 30 72 0F 16 
      }
    }
    //07 65 00 77 00 88 46 27 11 2A 16 07 47 00 19 19 00 88 46 27 11 05 00 04 01 30 20 71 0F 06 00 04 
    //2D 01 88 23 71 0F B9 19 00 88 46 27 11 05 00 04 01 08 56 71 0F 19 00 88 46 27 11 05 00 04 01 D8 
    //30 72 0F 16 06 65 00 B8 19 00 88 46 27 11 05 00 04 01 08 56 71 0F 19 00 88 46 27 11 05 00 04 01 
    //D8 30 72 0F 16 04 0B 47 
  }


  event FocusChanged(bool aHasFocus) {
    if (!aHasFocus) {                                                           //0000 : 07 41 00 81 2D 00 E0 48 27 11 16 
      ResetInput();                                                             //000B : 1B 0E 06 00 00 16 
      if (mLeftMouseDown) {                                                     //0011 : 07 21 00 2D 01 A8 F8 23 11 
        LeftMouseBinding(False);                                                //001A : 1B E6 0D 00 00 28 16 
      }
      if (mRightMouseDown) {                                                    //0021 : 07 31 00 2D 01 28 F5 23 11 
        RightMouseBinding(False);                                               //002A : 1B F6 0D 00 00 28 16 
      }
      if (mMiddleMouseDown) {                                                   //0031 : 07 41 00 2D 01 98 F2 23 11 
        MiddleMouseBinding(False);                                              //003A : 1B FC 0D 00 00 28 16 
      }
    }
    //07 41 00 81 2D 00 E0 48 27 11 16 1B 0E 06 00 00 16 07 21 00 2D 01 A8 F8 23 11 1B E6 0D 00 00 28 
    //16 07 31 00 2D 01 28 F5 23 11 1B F6 0D 00 00 28 16 07 41 00 2D 01 98 F2 23 11 1B FC 0D 00 00 28 
    //16 04 0B 47 
  }


  event ResetInput() {
    mJumpPressed = False;                                                       //0000 : 14 2D 01 E8 4A 27 11 28 
    mForwardCount = 0;                                                          //0008 : 0F 01 60 4B 27 11 25 
    mSideCount = 0;                                                             //000F : 0F 01 D8 4B 27 11 25 
    mDodging = False;                                                           //0016 : 14 2D 01 50 4C 27 11 28 
    //14 2D 01 E8 4A 27 11 28 0F 01 60 4B 27 11 25 0F 01 D8 4B 27 11 25 14 2D 01 50 4C 27 11 28 04 0B 
    //47 
  }


  protected final native function SampleMoveCommands(float aDeltaTime);


  private final function UpdateFreeCam() {
    local Game_PlayerController GPC;
    local bool useFreeCam;
    GPC = Outer;                                                                //0000 : 0F 00 D8 4E 27 11 01 00 E4 6B 0F 
    if (GPC != None) {                                                          //000B : 07 53 01 77 00 D8 4E 27 11 2A 16 
      useFreeCam = !GetDesktop().IsActive()
        && (mLeftMouseDown && !mRightMouseDown
        && !IsCombatReady()
        || GPC.IsSitting()
        || GPC.Pawn.Physics == 11
        || IsModifierDown(0)
        && (mRightMouseDown || mMiddleMouseDown)
        || Game_Pawn(GPC.Pawn).CharacterStats.IsMovementFrozen()
        && !IsCombatReady());//0016 : 14 2D 00 50 51 27 11 82 81 19 1C 40 E2 23 11 16 06 00 04 1B 34 0C 00 00 16 16 18 B3 00 84 84 84 84 82 82 2D 01 A8 F8 23 11 18 09 00 81 2D 01 28 F5 23 11 16 16 18 09 00 81 1C A0 DD 23 11 16 16 16 18 10 00 19 00 D8 4E 27 11 06 00 04 1B A3 05 00 00 16 16 18 20 00 9A 39 3A 19 19 00 D8 4E 27 11 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 0B 16 16 18 1E 00 82 1C 08 DA 23 11 25 16 18 12 00 84 2D 01 28 F5 23 11 18 07 00 2D 01 98 F2 23 11 16 16 16 18 34 00 82 19 19 2E 18 38 5B 01 19 00 D8 4E 27 11 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 18 09 00 81 1C A0 DD 23 11 16 16 16 16 16 
      if (!useFreeCam && GPC.bFreeCam && !mRightMouseDown
        && VSize(GPC.Pawn.Velocity) == 0) {//00E6 : 07 3D 01 82 82 82 81 2D 00 50 51 27 11 16 18 10 00 19 00 D8 4E 27 11 06 00 04 2D 01 28 54 71 0F 16 18 09 00 81 2D 01 28 F5 23 11 16 16 18 1F 00 B4 E1 19 19 00 D8 4E 27 11 05 00 04 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 16 39 3F 25 16 16 
        useFreeCam = True;                                                      //0135 : 14 2D 00 50 51 27 11 27 
      }
      GetCamera().SetFreeCam(useFreeCam);                                       //013D : 19 1C F8 DF 23 11 16 0C 00 00 1B 20 0D 00 00 2D 00 50 51 27 11 16 
    }
    //0F 00 D8 4E 27 11 01 00 E4 6B 0F 07 53 01 77 00 D8 4E 27 11 2A 16 14 2D 00 50 51 27 11 82 81 19 
    //1C 40 E2 23 11 16 06 00 04 1B 34 0C 00 00 16 16 18 B3 00 84 84 84 84 82 82 2D 01 A8 F8 23 11 18 
    //09 00 81 2D 01 28 F5 23 11 16 16 18 09 00 81 1C A0 DD 23 11 16 16 16 18 10 00 19 00 D8 4E 27 11 
    //06 00 04 1B A3 05 00 00 16 16 18 20 00 9A 39 3A 19 19 00 D8 4E 27 11 05 00 04 01 88 83 6C 0F 05 
    //00 01 01 C0 93 6C 0F 39 3A 24 0B 16 16 18 1E 00 82 1C 08 DA 23 11 25 16 18 12 00 84 2D 01 28 F5 
    //23 11 18 07 00 2D 01 98 F2 23 11 16 16 16 18 34 00 82 19 19 2E 18 38 5B 01 19 00 D8 4E 27 11 05 
    //00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 06 00 04 1C 90 3F 18 11 16 18 09 00 81 1C A0 DD 23 
    //11 16 16 16 16 16 07 3D 01 82 82 82 81 2D 00 50 51 27 11 16 18 10 00 19 00 D8 4E 27 11 06 00 04 
    //2D 01 28 54 71 0F 16 18 09 00 81 2D 01 28 F5 23 11 16 16 18 1F 00 B4 E1 19 19 00 D8 4E 27 11 05 
    //00 04 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 16 39 3F 25 16 16 14 2D 00 50 51 27 11 27 19 1C F8 
    //DF 23 11 16 0C 00 00 1B 20 0D 00 00 2D 00 50 51 27 11 16 04 0B 47 
  }


  function UpdateMouseWalking() {
    if (!mMouseWalking && mForwardPressed) {                                    //0000 : 07 18 00 82 81 2D 01 70 53 27 11 16 18 07 00 2D 01 E8 53 27 11 16 
      return;                                                                   //0016 : 04 0B 
    }
    if (mMiddleMouseDown
      || mLeftMouseDown && mRightMouseDown
      && !IsCombatReady()
      && (mMouseWalking
      || !GetDesktop().IsRadialInteractionPossible())) {//0018 : 07 78 00 84 2D 01 98 F2 23 11 18 41 00 82 82 82 2D 01 A8 F8 23 11 18 07 00 2D 01 28 F5 23 11 16 18 09 00 81 1C A0 DD 23 11 16 16 16 18 1E 00 84 2D 01 70 53 27 11 18 13 00 81 19 1C 40 E2 23 11 16 06 00 04 1B 3A 0D 00 00 16 16 16 16 16 
      GoForward(True);                                                          //0066 : 1C 60 54 27 11 27 16 
      mMouseWalking = True;                                                     //006D : 14 2D 01 70 53 27 11 27 
    } else {                                                                    //0075 : 06 90 00 
      if (mMouseWalking) {                                                      //0078 : 07 90 00 2D 01 70 53 27 11 
        GoForward(False);                                                       //0081 : 1C 60 54 27 11 28 16 
        mMouseWalking = False;                                                  //0088 : 14 2D 01 70 53 27 11 28 
      }
    }
    //07 18 00 82 81 2D 01 70 53 27 11 16 18 07 00 2D 01 E8 53 27 11 16 04 0B 07 78 00 84 2D 01 98 F2 
    //23 11 18 41 00 82 82 82 2D 01 A8 F8 23 11 18 07 00 2D 01 28 F5 23 11 16 18 09 00 81 1C A0 DD 23 
    //11 16 16 16 18 1E 00 84 2D 01 70 53 27 11 18 13 00 81 19 1C 40 E2 23 11 16 06 00 04 1B 3A 0D 00 
    //00 16 16 16 16 16 1C 60 54 27 11 27 16 14 2D 01 70 53 27 11 27 06 90 00 07 90 00 2D 01 70 53 27 
    //11 1C 60 54 27 11 28 16 14 2D 01 70 53 27 11 28 04 0B 47 
  }


  event cl_OnPlayerTick(float DeltaTime) {
    local Game_PlayerController GPC;
    local Game_Pawn gamePawn;
    GPC = Outer;                                                                //0000 : 0F 00 20 58 27 11 01 00 E4 6B 0F 
    if (GPC != None) {                                                          //000B : 07 DF 00 77 00 20 58 27 11 2A 16 
      UpdateMouseWalking();                                                     //0016 : 1B A8 0D 00 00 16 
      UpdateFreeCam();                                                          //001C : 1C C8 4C 27 11 16 
      cl_PlayerInput(GPC,DeltaTime);                                            //0022 : 1B 45 05 00 00 00 20 58 27 11 00 C0 55 27 11 16 
      GPC.UpdateRotation(DeltaTime,2.00000000);                                 //0032 : 19 00 20 58 27 11 10 00 00 1B C1 12 00 00 00 C0 55 27 11 1E 00 00 00 40 16 
      gamePawn = Game_Pawn(GPC.Pawn);                                           //004B : 0F 00 98 58 27 11 2E 18 38 5B 01 19 00 20 58 27 11 05 00 04 01 88 83 6C 0F 
      if (gamePawn != None) {                                                   //0064 : 07 94 00 77 00 98 58 27 11 2A 16 
        cl_UpdateTargetProjectorAndReticule();                                  //006F : 1B 03 0F 00 00 16 
        if (mSelectionCircle != None) {                                         //0075 : 07 94 00 77 01 08 44 27 11 2A 16 
          mSelectionCircle.cl_OnPlayerTick(DeltaTime);                          //0080 : 19 01 08 44 27 11 0B 00 00 1B 40 05 00 00 00 C0 55 27 11 16 
        }
      }
      if (!GPC.IsViewingCinematic()) {                                          //0094 : 07 BC 00 81 19 00 20 58 27 11 06 00 04 1B 1F 0D 00 00 16 16 
        UpdateViewRotation();                                                   //00A8 : 1C 10 59 27 11 16 
        SampleMoveCommands(DeltaTime);                                          //00AE : 1C E0 49 27 11 00 C0 55 27 11 16 
      } else {                                                                  //00B9 : 06 DF 00 
        cl2sv_SetViewTarget_CallStub(GPC.ViewTarget.Location);                  //00BC : 1B A7 0D 00 00 19 19 00 20 58 27 11 05 00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 16 
        ResetInput();                                                           //00D9 : 1B 0E 06 00 00 16 
      }
    }
    if (Game_Pawn(mTargetActor) == None
      || !mTargetActor.IsValidActor()
      || mTargetPawn.Physics == 21) {//00DF : 07 27 01 84 84 72 2E 18 38 5B 01 01 C0 59 27 11 2A 16 18 12 00 81 19 01 C0 59 27 11 06 00 04 1B 2E 0D 00 00 16 16 16 18 17 00 9A 39 3A 19 01 40 F7 23 11 05 00 01 01 C0 93 6C 0F 39 3A 24 15 16 16 
      cl_SetTargetActor(None);                                                  //0120 : 1B 4F 05 00 00 2A 16 
    }
    if (mDrawSheatheCooldown > 0.00000000) {                                    //0127 : 07 42 01 B1 01 38 5A 27 11 1E 00 00 00 00 16 
      mDrawSheatheCooldown -= DeltaTime;                                        //0136 : B9 01 38 5A 27 11 00 C0 55 27 11 16 
    }
    //0F 00 20 58 27 11 01 00 E4 6B 0F 07 DF 00 77 00 20 58 27 11 2A 16 1B A8 0D 00 00 16 1C C8 4C 27 
    //11 16 1B 45 05 00 00 00 20 58 27 11 00 C0 55 27 11 16 19 00 20 58 27 11 10 00 00 1B C1 12 00 00 
    //00 C0 55 27 11 1E 00 00 00 40 16 0F 00 98 58 27 11 2E 18 38 5B 01 19 00 20 58 27 11 05 00 04 01 
    //88 83 6C 0F 07 94 00 77 00 98 58 27 11 2A 16 1B 03 0F 00 00 16 07 94 00 77 01 08 44 27 11 2A 16 
    //19 01 08 44 27 11 0B 00 00 1B 40 05 00 00 00 C0 55 27 11 16 07 BC 00 81 19 00 20 58 27 11 06 00 
    //04 1B 1F 0D 00 00 16 16 1C 10 59 27 11 16 1C E0 49 27 11 00 C0 55 27 11 16 06 DF 00 1B A7 0D 00 
    //00 19 19 00 20 58 27 11 05 00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 16 1B 0E 06 00 00 16 07 
    //27 01 84 84 72 2E 18 38 5B 01 01 C0 59 27 11 2A 16 18 12 00 81 19 01 C0 59 27 11 06 00 04 1B 2E 
    //0D 00 00 16 16 16 18 17 00 9A 39 3A 19 01 40 F7 23 11 05 00 01 01 C0 93 6C 0F 39 3A 24 15 16 16 
    //1B 4F 05 00 00 2A 16 07 42 01 B1 01 38 5A 27 11 1E 00 00 00 00 16 B9 01 38 5A 27 11 00 C0 55 27 
    //11 16 04 0B 47 
  }


  protected native function cl2sv_SetViewTarget_CallStub();


  event cl2sv_SetViewTarget(Vector aViewTarget) {
    Outer.SetLocation(aViewTarget);                                             //0000 : 19 01 00 E4 6B 0F 08 00 04 61 0B 00 10 5C 27 11 16 
    Outer.sv_OnSetViewTarget();                                                 //0011 : 19 01 00 E4 6B 0F 06 00 00 1B E0 0E 00 00 16 
    //19 01 00 E4 6B 0F 08 00 04 61 0B 00 10 5C 27 11 16 19 01 00 E4 6B 0F 06 00 00 1B E0 0E 00 00 16 
    //04 0B 47 
  }


  exec function cl_SetAutoRun(bool B) {
    mAutoRun = B;                                                               //0000 : 14 2D 01 20 F2 23 11 2D 00 90 5D 27 11 
    //14 2D 01 20 F2 23 11 2D 00 90 5D 27 11 04 0B 47 
  }


  exec function ToggleAutoRun() {
    mAutoRun = !mAutoRun;                                                       //0000 : 14 2D 01 20 F2 23 11 81 2D 01 20 F2 23 11 16 
    //14 2D 01 20 F2 23 11 81 2D 01 20 F2 23 11 16 04 0B 47 
  }


  exec function Jump(bool aJump) {
    if (aJump) {                                                                //0000 : 07 68 00 2D 00 E8 5F 27 11 
      if (!mJumpJustPressed
        && (Outer.Pawn.IsGrounded() || Outer.Pawn.Physics == 11)) {//0009 : 07 65 00 82 81 2D 01 38 61 27 11 16 18 3D 00 84 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1B 90 0F 00 00 16 18 20 00 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 0B 16 16 16 
        mJumpJustPressed = True;                                                //0055 : 14 2D 01 38 61 27 11 27 
        mJumpPressed = True;                                                    //005D : 14 2D 01 E8 4A 27 11 27 
      }
    } else {                                                                    //0065 : 06 78 00 
      mJumpJustPressed = False;                                                 //0068 : 14 2D 01 38 61 27 11 28 
      mJumpPressed = False;                                                     //0070 : 14 2D 01 E8 4A 27 11 28 
    }
    //07 68 00 2D 00 E8 5F 27 11 07 65 00 82 81 2D 01 38 61 27 11 16 18 3D 00 84 19 19 01 00 E4 6B 0F 
    //05 00 04 01 88 83 6C 0F 06 00 04 1B 90 0F 00 00 16 18 20 00 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 
    //04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 0B 16 16 16 14 2D 01 38 61 27 11 27 14 2D 01 
    //E8 4A 27 11 27 06 78 00 14 2D 01 38 61 27 11 28 14 2D 01 E8 4A 27 11 28 04 0B 47 
  }


  final exec function GoRight(bool B) {
    if (Outer.Pawn.Physics == 4 && B == False) {                                //0000 : 07 55 00 82 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 04 16 18 0A 00 F2 2D 00 60 62 27 11 28 16 16 
      Outer.Pawn.Velocity = vect(0.000000, 0.000000, 0.000000);                 //0030 : 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    }
    mRightPressed = B;                                                          //0055 : 14 2D 01 A8 00 24 11 2D 00 60 62 27 11 
    //07 55 00 82 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 
    //24 04 16 18 0A 00 F2 2D 00 60 62 27 11 28 16 16 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    //05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 14 2D 01 A8 00 24 11 2D 00 60 62 
    //27 11 04 0B 47 
  }


  final exec function GoLeft(bool B) {
    if (Outer.Pawn.Physics == 4 && B == False) {                                //0000 : 07 55 00 82 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 04 16 18 0A 00 F2 2D 00 40 64 27 11 28 16 16 
      Outer.Pawn.Velocity = vect(0.000000, 0.000000, 0.000000);                 //0030 : 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    }
    mLeftPressed = B;                                                           //0055 : 14 2D 01 30 00 24 11 2D 00 40 64 27 11 
    //07 55 00 82 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 
    //24 04 16 18 0A 00 F2 2D 00 40 64 27 11 28 16 16 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    //05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 14 2D 01 30 00 24 11 2D 00 40 64 
    //27 11 04 0B 47 
  }


  final exec function GoBackward(bool B) {
    if (Outer.Pawn.Physics == 4 && B == False) {                                //0000 : 07 55 00 82 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 04 16 18 0A 00 F2 2D 00 70 65 27 11 28 16 16 
      Outer.Pawn.Velocity = vect(0.000000, 0.000000, 0.000000);                 //0030 : 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    }
    if (mAutoRun && B && !mPreviousBackwardPressed) {                           //0055 : 07 7E 00 82 82 2D 01 20 F2 23 11 18 07 00 2D 00 70 65 27 11 16 18 09 00 81 2D 01 E8 66 27 11 16 16 
      mAutoRun = False;                                                         //0076 : 14 2D 01 20 F2 23 11 28 
    }
    mBackwardPressed = B;                                                       //007E : 14 2D 01 60 67 27 11 2D 00 70 65 27 11 
    mPreviousBackwardPressed = B;                                               //008B : 14 2D 01 E8 66 27 11 2D 00 70 65 27 11 
    //07 55 00 82 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 
    //24 04 16 18 0A 00 F2 2D 00 70 65 27 11 28 16 16 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    //05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 07 7E 00 82 82 2D 01 20 F2 23 11 
    //18 07 00 2D 00 70 65 27 11 16 18 09 00 81 2D 01 E8 66 27 11 16 16 14 2D 01 20 F2 23 11 28 14 2D 
    //01 60 67 27 11 2D 00 70 65 27 11 14 2D 01 E8 66 27 11 2D 00 70 65 27 11 04 0B 47 
  }


  final exec function GoForward(bool B) {
    if (Outer.Pawn.Physics == 4 && B == False) {                                //0000 : 07 55 00 82 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 04 16 18 0A 00 F2 2D 00 88 68 27 11 28 16 16 
      Outer.Pawn.Velocity = vect(0.000000, 0.000000, 0.000000);                 //0030 : 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    }
    if (mAutoRun && B && !mPreviousForwardPressed) {                            //0055 : 07 7E 00 82 82 2D 01 20 F2 23 11 18 07 00 2D 00 88 68 27 11 16 18 09 00 81 2D 01 00 6A 27 11 16 16 
      mAutoRun = False;                                                         //0076 : 14 2D 01 20 F2 23 11 28 
    }
    mForwardPressed = B;                                                        //007E : 14 2D 01 E8 53 27 11 2D 00 88 68 27 11 
    mPreviousForwardPressed = B;                                                //008B : 14 2D 01 00 6A 27 11 2D 00 88 68 27 11 
    //07 55 00 82 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 
    //24 04 16 18 0A 00 F2 2D 00 88 68 27 11 28 16 16 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    //05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 07 7E 00 82 82 2D 01 20 F2 23 11 
    //18 07 00 2D 00 88 68 27 11 16 18 09 00 81 2D 01 00 6A 27 11 16 16 14 2D 01 20 F2 23 11 28 14 2D 
    //01 E8 53 27 11 2D 00 88 68 27 11 14 2D 01 00 6A 27 11 2D 00 88 68 27 11 04 0B 47 
  }


  final exec function RotateRight(bool B) {
    if (Outer != None && !Outer.IsViewingCinematic()) {                         //0000 : 07 42 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 81 19 01 00 E4 6B 0F 06 00 04 1B 1F 0D 00 00 16 16 16 
      Outer.aTurn += FClamp(mKeyboardRotateSpeed,0.50000000,5.00000000);        //0021 : B8 19 01 00 E4 6B 0F 05 00 04 01 90 55 71 0F F6 01 38 6C 27 11 1E 00 00 00 3F 1E 00 00 A0 40 16 16 
    }
    mRotateRightPressed = B;                                                    //0042 : 14 2D 01 B0 6C 27 11 2D 00 28 6B 27 11 
    //07 42 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 81 19 01 00 E4 6B 0F 06 00 04 1B 1F 0D 00 00 16 16 
    //16 B8 19 01 00 E4 6B 0F 05 00 04 01 90 55 71 0F F6 01 38 6C 27 11 1E 00 00 00 3F 1E 00 00 A0 40 
    //16 16 14 2D 01 B0 6C 27 11 2D 00 28 6B 27 11 04 0B 47 
  }


  final exec function RotateLeft(bool B) {
    if (Outer != None && !Outer.IsViewingCinematic()) {                         //0000 : 07 42 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 81 19 01 00 E4 6B 0F 06 00 04 1B 1F 0D 00 00 16 16 16 
      Outer.aTurn -= FClamp(mKeyboardRotateSpeed,0.50000000,5.00000000);        //0021 : B9 19 01 00 E4 6B 0F 05 00 04 01 90 55 71 0F F6 01 38 6C 27 11 1E 00 00 00 3F 1E 00 00 A0 40 16 16 
    }
    mRotateLeftPressed = B;                                                     //0042 : 14 2D 01 E8 6E 27 11 2D 00 D8 6D 27 11 
    //07 42 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 81 19 01 00 E4 6B 0F 06 00 04 1B 1F 0D 00 00 16 16 
    //16 B9 19 01 00 E4 6B 0F 05 00 04 01 90 55 71 0F F6 01 38 6C 27 11 1E 00 00 00 3F 1E 00 00 A0 40 
    //16 16 14 2D 01 E8 6E 27 11 2D 00 D8 6D 27 11 04 0B 47 
  }


  exec function DrawSheatheWeapon() {
    local Game_PlayerPawn gamePlayerPawn;
    local export editinline FSkill_Type selectedSkillType;
    local byte combatMode;
    gamePlayerPawn = Game_PlayerPawn(Outer.Pawn);                               //0000 : 0F 00 10 70 27 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    if (gamePlayerPawn == None) {                                               //0019 : 07 26 00 72 00 10 70 27 11 2A 16 
      return;                                                                   //0024 : 04 0B 
    }
    if (gamePlayerPawn.IsDead()) {                                              //0026 : 07 3A 00 19 00 10 70 27 11 06 00 04 1C D8 52 34 0F 16 
      return;                                                                   //0038 : 04 0B 
    }
    if (gamePlayerPawn.mPvPSettings != None
      && !gamePlayerPawn.mPvPSettings.AllowDrawWeapon
      || gamePlayerPawn.Physics == 11) {//003A : 07 B9 00 84 82 77 19 00 10 70 27 11 05 00 04 01 48 4F 7F 0F 2A 16 18 1B 00 81 19 19 00 10 70 27 11 05 00 04 01 48 4F 7F 0F 06 00 04 2D 01 E0 C6 7C 0F 16 16 18 17 00 9A 39 3A 19 00 10 70 27 11 05 00 01 01 C0 93 6C 0F 39 3A 24 0B 16 16 
      gamePlayerPawn.SendDesktopMessage("",Class'StringReferences'.default.Cannot_draw_weapon_here.Text,Class'Game_Desktop'.7);//0088 : 19 00 10 70 27 11 26 00 00 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 38 FB 1B 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
      return;                                                                   //00B7 : 04 0B 
    }
    if (gamePlayerPawn.MiniGameProxy != None
      && gamePlayerPawn.MiniGameProxy.IsPlaying()) {//00B9 : 07 EC 00 82 77 19 00 10 70 27 11 05 00 04 01 30 5D 83 0F 2A 16 18 19 00 19 19 00 10 70 27 11 05 00 04 01 30 5D 83 0F 06 00 04 1B A2 05 00 00 16 16 
      return;                                                                   //00EA : 04 0B 
    }
    if (gamePlayerPawn.IsShifted()) {                                           //00EC : 07 00 01 19 00 10 70 27 11 06 00 04 1B 2E 0C 00 00 16 
      return;                                                                   //00FE : 04 0B 
    }
    if (gamePlayerPawn.IsInShop()) {                                            //0100 : 07 14 01 19 00 10 70 27 11 06 00 04 1B 9D 05 00 00 16 
      return;                                                                   //0112 : 04 0B 
    }
    if (mDrawSheatheCooldown <= 0.00000000) {                                   //0114 : 07 D6 01 B2 01 38 5A 27 11 1E 00 00 00 00 16 
      IsDrawingWeapon = !IsDrawingWeapon;                                       //0123 : 14 2D 01 40 73 27 11 81 2D 01 40 73 27 11 16 
      if (PreviousSkillIndex >= 0) {                                            //0132 : 07 A1 01 99 01 B0 03 24 11 25 16 
        selectedSkillType = gamePlayerPawn.Skills.GetActiveTierSlotSkill(PreviousSkillIndex);//013D : 0F 00 B8 73 27 11 19 19 00 10 70 27 11 05 00 04 01 08 28 18 11 0B 00 04 1C 60 E0 21 11 01 B0 03 24 11 16 
        switch (selectedSkillType.RequiredWeapon) {                             //0160 : 05 01 19 00 B8 73 27 11 05 00 01 01 10 B6 20 11 
          case 1 :                                                              //0170 : 0A 80 01 24 01 
            combatMode = 1;                                                     //0175 : 0F 00 30 74 27 11 24 01 
            break;                                                              //017D : 06 9E 01 
          case 2 :                                                              //0180 : 0A 90 01 24 02 
            combatMode = 2;                                                     //0185 : 0F 00 30 74 27 11 24 02 
            break;                                                              //018D : 06 9E 01 
          default:                                                              //0190 : 0A FF FF 
            combatMode = 3;                                                     //0193 : 0F 00 30 74 27 11 24 03 
            break;                                                              //019B : 06 9E 01 
        }
      } else {                                                                  //019E : 06 A9 01 
        combatMode = 1;                                                         //01A1 : 0F 00 30 74 27 11 24 01 
      }
      Game_PlayerCombatState(gamePlayerPawn.combatState).cl2sv_DrawSheatheWeapon_CallStub(combatMode);//01A9 : 19 2E 70 88 5F 01 19 00 10 70 27 11 05 00 04 01 B8 40 18 11 0B 00 00 1B 70 0E 00 00 00 30 74 27 11 16 
      mDrawSheatheCooldown = cCooldown;                                         //01CB : 0F 01 38 5A 27 11 01 A8 74 27 11 
    }
    //0F 00 10 70 27 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 07 26 00 72 00 10 70 
    //27 11 2A 16 04 0B 07 3A 00 19 00 10 70 27 11 06 00 04 1C D8 52 34 0F 16 04 0B 07 B9 00 84 82 77 
    //19 00 10 70 27 11 05 00 04 01 48 4F 7F 0F 2A 16 18 1B 00 81 19 19 00 10 70 27 11 05 00 04 01 48 
    //4F 7F 0F 06 00 04 2D 01 E0 C6 7C 0F 16 16 18 17 00 9A 39 3A 19 00 10 70 27 11 05 00 01 01 C0 93 
    //6C 0F 39 3A 24 0B 16 16 19 00 10 70 27 11 26 00 00 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 
    //F7 60 01 05 00 0C 02 38 FB 1B 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 04 0B 07 EC 00 82 77 19 00 
    //10 70 27 11 05 00 04 01 30 5D 83 0F 2A 16 18 19 00 19 19 00 10 70 27 11 05 00 04 01 30 5D 83 0F 
    //06 00 04 1B A2 05 00 00 16 16 04 0B 07 00 01 19 00 10 70 27 11 06 00 04 1B 2E 0C 00 00 16 04 0B 
    //07 14 01 19 00 10 70 27 11 06 00 04 1B 9D 05 00 00 16 04 0B 07 D6 01 B2 01 38 5A 27 11 1E 00 00 
    //00 00 16 14 2D 01 40 73 27 11 81 2D 01 40 73 27 11 16 07 A1 01 99 01 B0 03 24 11 25 16 0F 00 B8 
    //73 27 11 19 19 00 10 70 27 11 05 00 04 01 08 28 18 11 0B 00 04 1C 60 E0 21 11 01 B0 03 24 11 16 
    //05 01 19 00 B8 73 27 11 05 00 01 01 10 B6 20 11 0A 80 01 24 01 0F 00 30 74 27 11 24 01 06 9E 01 
    //0A 90 01 24 02 0F 00 30 74 27 11 24 02 06 9E 01 0A FF FF 0F 00 30 74 27 11 24 03 06 9E 01 06 A9 
    //01 0F 00 30 74 27 11 24 01 19 2E 70 88 5F 01 19 00 10 70 27 11 05 00 04 01 B8 40 18 11 0B 00 00 
    //1B 70 0E 00 00 00 30 74 27 11 16 0F 01 38 5A 27 11 01 A8 74 27 11 04 0B 47 
  }


  function cl_UpdateTargetProjectorAndReticule() {
    local export editinline FSkill_Type selectedSkill;
    local Vector targetingVector;
    local float Distance;
    local float MinDistance;
    local float MaxDistance;
    local float paintRadius;
    local Game_Pawn gamePawn;
    gamePawn = Game_Pawn(Outer.Pawn);                                           //0000 : 0F 00 08 7C 27 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    if (mTargetProjector == None) {                                             //0019 : 07 50 00 72 01 80 7C 27 11 2A 16 
      mTargetProjector = gamePawn.Spawn(Class'Game_TargetProjector',Outer);     //0024 : 0F 01 80 7C 27 11 19 00 08 7C 27 11 0D 00 04 61 16 20 F8 7C 27 11 01 00 E4 6B 0F 16 
      mTargetProjector.SetIsVisible(False);                                     //0040 : 19 01 80 7C 27 11 07 00 00 1B 5F 0C 00 00 28 16 
    }
    selectedSkill = cl_GetSelectedSkill();                                      //0050 : 0F 00 D0 75 27 11 1B 38 05 00 00 16 
    mSkillStartFailure = gamePawn.Skills.CanActivateSpecificSkill(selectedSkill);//005C : 0F 01 78 87 27 11 19 19 00 08 7C 27 11 05 00 04 01 08 28 18 11 0B 00 01 1C 30 D4 21 11 00 D0 75 27 11 16 
    if (selectedSkill != None && mSkillStartFailure == 0) {                     //007F : 07 EB 03 82 77 00 D0 75 27 11 2A 16 18 0E 00 9A 39 3A 01 78 87 27 11 39 3A 24 00 16 16 
      if (selectedSkill.PaintLocation) {                                        //009C : 07 CF 01 19 00 D0 75 27 11 06 00 04 2D 01 10 BB 20 11 
        MinDistance = gamePawn.Skills.sv_GetTokenEffect(selectedSkill,2,selectedSkill.PaintLocationMinDistance);//00AE : 0F 00 F0 87 27 11 19 19 00 08 7C 27 11 05 00 04 01 08 28 18 11 1B 00 04 1C 90 2F 23 11 00 D0 75 27 11 24 02 19 00 D0 75 27 11 05 00 04 01 88 BB 20 11 16 
        MaxDistance = gamePawn.Skills.sv_GetTokenEffect(selectedSkill,3,selectedSkill.PaintLocationMaxDistance);//00E1 : 0F 00 68 88 27 11 19 19 00 08 7C 27 11 05 00 04 01 08 28 18 11 1B 00 04 1C 90 2F 23 11 00 D0 75 27 11 24 03 19 00 D0 75 27 11 05 00 04 01 00 BC 20 11 16 
        paintRadius = gamePawn.Skills.sv_GetTokenEffect(selectedSkill,4,selectedSkill.GetTargetMaxRange(gamePawn));//0114 : 0F 00 E0 88 27 11 19 19 00 08 7C 27 11 05 00 04 01 08 28 18 11 21 00 04 1C 90 2F 23 11 00 D0 75 27 11 24 04 19 00 D0 75 27 11 0B 00 04 1C 60 A1 20 11 00 08 7C 27 11 16 16 
        if (mPawnUnderReticule != None) {                                       //014D : 07 6C 01 77 01 B8 F7 23 11 2A 16 
          mTargetLocation = mPawnUnderReticule.Location;                        //0158 : 0F 01 38 0A 24 11 19 01 B8 F7 23 11 05 00 0C 01 30 81 6C 0F 
        }
        if (mTargetProjector != None) {                                         //016C : 07 CC 01 77 01 80 7C 27 11 2A 16 
          if (!IsScreenshotMode()) {                                            //0177 : 07 BC 01 81 1C D0 D7 23 11 16 16 
            mTargetProjector.SetIsVisible(True);                                //0182 : 19 01 80 7C 27 11 07 00 00 1B 5F 0C 00 00 27 16 
            mTargetProjector.ProjectOnToLocation(mTargetLocation,gamePawn.Location,paintRadius);//0192 : 19 01 80 7C 27 11 1E 00 00 1B 8E 0F 00 00 01 38 0A 24 11 19 00 08 7C 27 11 05 00 0C 01 30 81 6C 0F 00 E0 88 27 11 16 
          } else {                                                              //01B9 : 06 CC 01 
            mTargetProjector.SetIsVisible(False);                               //01BC : 19 01 80 7C 27 11 07 00 00 1B 5F 0C 00 00 28 16 
          }
        }
      } else {                                                                  //01CC : 06 3C 02 
        MinDistance = selectedSkill.MinDistance;                                //01CF : 0F 00 F0 87 27 11 19 00 D0 75 27 11 05 00 04 01 68 BD 20 11 
        MaxDistance = gamePawn.Skills.sv_GetTokenEffect(selectedSkill,4,selectedSkill.MaxDistance);//01E3 : 0F 00 68 88 27 11 19 19 00 08 7C 27 11 05 00 04 01 08 28 18 11 1B 00 04 1C 90 2F 23 11 00 D0 75 27 11 24 04 19 00 D0 75 27 11 05 00 04 01 A8 BE 20 11 16 
        paintRadius = 0.00000000;                                               //0216 : 0F 00 E0 88 27 11 1E 00 00 00 00 
        if (mTargetProjector != None) {                                         //0221 : 07 3C 02 77 01 80 7C 27 11 2A 16 
          mTargetProjector.SetIsVisible(False);                                 //022C : 19 01 80 7C 27 11 07 00 00 1B 5F 0C 00 00 28 16 
        }
      }
      if (MinDistance >= MaxDistance) {                                         //023C : 07 61 02 B3 00 F0 87 27 11 00 68 88 27 11 16 
        MinDistance = 0.00000000;                                               //024B : 0F 00 F0 87 27 11 1E 00 00 00 00 
        MaxDistance = 10000.00000000;                                           //0256 : 0F 00 68 88 27 11 1E 00 40 1C 46 
      }
      mOutOfRangeState = 0;                                                     //0261 : 0F 01 D0 08 24 11 24 00 
      if (mPawnUnderReticule != None || selectedSkill.PaintLocation) {          //0269 : 07 50 03 84 77 01 B8 F7 23 11 2A 16 18 10 00 19 00 D0 75 27 11 06 00 04 2D 01 10 BB 20 11 16 
        targetingVector = mTargetLocation - Outer.Pawn.Location;                //0288 : 0F 00 58 89 27 11 D8 01 38 0A 24 11 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 16 
        Distance = VSize(targetingVector);                                      //02AC : 0F 00 D0 89 27 11 E1 00 58 89 27 11 16 
        if (selectedSkill.PaintLocation) {                                      //02B9 : 07 FF 02 19 00 D0 75 27 11 06 00 04 2D 01 10 BB 20 11 
          if (Distance > MaxDistance) {                                         //02CB : 07 E5 02 B1 00 D0 89 27 11 00 68 88 27 11 16 
            mOutOfRangeState = 1;                                               //02DA : 0F 01 D0 08 24 11 24 01 
          } else {                                                              //02E2 : 06 FC 02 
            if (Distance < MinDistance) {                                       //02E5 : 07 FC 02 B0 00 D0 89 27 11 00 F0 87 27 11 16 
              mOutOfRangeState = 2;                                             //02F4 : 0F 01 D0 08 24 11 24 02 
            }
          }
        } else {                                                                //02FC : 06 50 03 
          if (Distance - mPawnUnderReticule.SkillRadius > MaxDistance) {        //02FF : 07 29 03 B1 AF 00 D0 89 27 11 19 01 B8 F7 23 11 05 00 04 01 C0 57 19 11 16 00 68 88 27 11 16 
            mOutOfRangeState = 1;                                               //031E : 0F 01 D0 08 24 11 24 01 
          } else {                                                              //0326 : 06 50 03 
            if (Distance + mPawnUnderReticule.SkillRadius < MinDistance) {      //0329 : 07 50 03 B0 AE 00 D0 89 27 11 19 01 B8 F7 23 11 05 00 04 01 C0 57 19 11 16 00 F0 87 27 11 16 
              mOutOfRangeState = 2;                                             //0348 : 0F 01 D0 08 24 11 24 02 
            }
          }
        }
      }
      if (!IsPaintLocationWithinAngle(gamePawn.Location,Outer.Pawn.Rotation,90.00000000,mTargetLocation,paintRadius)) {//0350 : 07 97 03 81 1B 08 0F 00 00 19 00 08 7C 27 11 05 00 0C 01 30 81 6C 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 00 84 6C 0F 1E 00 00 B4 42 01 38 0A 24 11 00 E0 88 27 11 16 16 
        mOutOfRangeState = 1;                                                   //038F : 0F 01 D0 08 24 11 24 01 
      }
      if (mLeftMouseDown && mOutOfRangeState == 0
        && !IsModifierDown(0)
        && IsCombatReady()
        && !GetDesktop().IsActive()) {//0397 : 07 E8 03 82 82 82 82 2D 01 A8 F8 23 11 18 0E 00 9A 39 3A 01 D0 08 24 11 39 3A 24 00 16 16 18 0A 00 81 1C 08 DA 23 11 25 16 16 16 18 07 00 1C A0 DD 23 11 16 16 18 13 00 81 19 1C 40 E2 23 11 16 06 00 04 1B 34 0C 00 00 16 16 16 
        ActivateSelectedSkill();                                                //03E2 : 1B 7C 0C 00 00 16 
      }
    } else {                                                                    //03E8 : 06 0E 04 
      mOutOfRangeState = 0;                                                     //03EB : 0F 01 D0 08 24 11 24 00 
      if (mTargetProjector != None) {                                           //03F3 : 07 0E 04 77 01 80 7C 27 11 2A 16 
        mTargetProjector.SetIsVisible(False);                                   //03FE : 19 01 80 7C 27 11 07 00 00 1B 5F 0C 00 00 28 16 
      }
    }
    //0F 00 08 7C 27 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 07 50 00 72 01 80 7C 
    //27 11 2A 16 0F 01 80 7C 27 11 19 00 08 7C 27 11 0D 00 04 61 16 20 F8 7C 27 11 01 00 E4 6B 0F 16 
    //19 01 80 7C 27 11 07 00 00 1B 5F 0C 00 00 28 16 0F 00 D0 75 27 11 1B 38 05 00 00 16 0F 01 78 87 
    //27 11 19 19 00 08 7C 27 11 05 00 04 01 08 28 18 11 0B 00 01 1C 30 D4 21 11 00 D0 75 27 11 16 07 
    //EB 03 82 77 00 D0 75 27 11 2A 16 18 0E 00 9A 39 3A 01 78 87 27 11 39 3A 24 00 16 16 07 CF 01 19 
    //00 D0 75 27 11 06 00 04 2D 01 10 BB 20 11 0F 00 F0 87 27 11 19 19 00 08 7C 27 11 05 00 04 01 08 
    //28 18 11 1B 00 04 1C 90 2F 23 11 00 D0 75 27 11 24 02 19 00 D0 75 27 11 05 00 04 01 88 BB 20 11 
    //16 0F 00 68 88 27 11 19 19 00 08 7C 27 11 05 00 04 01 08 28 18 11 1B 00 04 1C 90 2F 23 11 00 D0 
    //75 27 11 24 03 19 00 D0 75 27 11 05 00 04 01 00 BC 20 11 16 0F 00 E0 88 27 11 19 19 00 08 7C 27 
    //11 05 00 04 01 08 28 18 11 21 00 04 1C 90 2F 23 11 00 D0 75 27 11 24 04 19 00 D0 75 27 11 0B 00 
    //04 1C 60 A1 20 11 00 08 7C 27 11 16 16 07 6C 01 77 01 B8 F7 23 11 2A 16 0F 01 38 0A 24 11 19 01 
    //B8 F7 23 11 05 00 0C 01 30 81 6C 0F 07 CC 01 77 01 80 7C 27 11 2A 16 07 BC 01 81 1C D0 D7 23 11 
    //16 16 19 01 80 7C 27 11 07 00 00 1B 5F 0C 00 00 27 16 19 01 80 7C 27 11 1E 00 00 1B 8E 0F 00 00 
    //01 38 0A 24 11 19 00 08 7C 27 11 05 00 0C 01 30 81 6C 0F 00 E0 88 27 11 16 06 CC 01 19 01 80 7C 
    //27 11 07 00 00 1B 5F 0C 00 00 28 16 06 3C 02 0F 00 F0 87 27 11 19 00 D0 75 27 11 05 00 04 01 68 
    //BD 20 11 0F 00 68 88 27 11 19 19 00 08 7C 27 11 05 00 04 01 08 28 18 11 1B 00 04 1C 90 2F 23 11 
    //00 D0 75 27 11 24 04 19 00 D0 75 27 11 05 00 04 01 A8 BE 20 11 16 0F 00 E0 88 27 11 1E 00 00 00 
    //00 07 3C 02 77 01 80 7C 27 11 2A 16 19 01 80 7C 27 11 07 00 00 1B 5F 0C 00 00 28 16 07 61 02 B3 
    //00 F0 87 27 11 00 68 88 27 11 16 0F 00 F0 87 27 11 1E 00 00 00 00 0F 00 68 88 27 11 1E 00 40 1C 
    //46 0F 01 D0 08 24 11 24 00 07 50 03 84 77 01 B8 F7 23 11 2A 16 18 10 00 19 00 D0 75 27 11 06 00 
    //04 2D 01 10 BB 20 11 16 0F 00 58 89 27 11 D8 01 38 0A 24 11 19 19 01 00 E4 6B 0F 05 00 04 01 88 
    //83 6C 0F 05 00 0C 01 30 81 6C 0F 16 0F 00 D0 89 27 11 E1 00 58 89 27 11 16 07 FF 02 19 00 D0 75 
    //27 11 06 00 04 2D 01 10 BB 20 11 07 E5 02 B1 00 D0 89 27 11 00 68 88 27 11 16 0F 01 D0 08 24 11 
    //24 01 06 FC 02 07 FC 02 B0 00 D0 89 27 11 00 F0 87 27 11 16 0F 01 D0 08 24 11 24 02 06 50 03 07 
    //29 03 B1 AF 00 D0 89 27 11 19 01 B8 F7 23 11 05 00 04 01 C0 57 19 11 16 00 68 88 27 11 16 0F 01 
    //D0 08 24 11 24 01 06 50 03 07 50 03 B0 AE 00 D0 89 27 11 19 01 B8 F7 23 11 05 00 04 01 C0 57 19 
    //11 16 00 F0 87 27 11 16 0F 01 D0 08 24 11 24 02 07 97 03 81 1B 08 0F 00 00 19 00 08 7C 27 11 05 
    //00 0C 01 30 81 6C 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 00 84 6C 0F 1E 00 
    //00 B4 42 01 38 0A 24 11 00 E0 88 27 11 16 16 0F 01 D0 08 24 11 24 01 07 E8 03 82 82 82 82 2D 01 
    //A8 F8 23 11 18 0E 00 9A 39 3A 01 D0 08 24 11 39 3A 24 00 16 16 18 0A 00 81 1C 08 DA 23 11 25 16 
    //16 16 18 07 00 1C A0 DD 23 11 16 16 18 13 00 81 19 1C 40 E2 23 11 16 06 00 04 1B 34 0C 00 00 16 
    //16 16 1B 7C 0C 00 00 16 06 0E 04 0F 01 D0 08 24 11 24 00 07 0E 04 77 01 80 7C 27 11 2A 16 19 01 
    //80 7C 27 11 07 00 00 1B 5F 0C 00 00 28 16 04 0B 47 
  }


  function bool IsPaintLocationWithinAngle(Vector pawnLocation,Rotator pawnRotation,float maxAngleInDegrees,Vector aPaintLocation,float aRadius) {
    local float Yaw;
    Yaw = static.ConvertURUToDegrees(pawnRotation.Yaw);                         //0000 : 0F 00 30 8C 27 11 1C 28 0E 6A 0F 39 3F 36 20 BF 69 0F 00 A8 8C 27 11 16 
    Yaw = Yaw % 360;                                                            //0018 : 0F 00 30 8C 27 11 AD 39 3F 39 44 00 30 8C 27 11 39 3F 1D 68 01 00 00 16 
    if (Yaw < 0) {                                                              //0030 : 07 4B 00 B0 00 30 8C 27 11 39 3F 25 16 
      Yaw += 360;                                                               //003D : B8 00 30 8C 27 11 39 3F 1D 68 01 00 00 16 
    }
    return static.IsInAngle(maxAngleInDegrees,pawnLocation,Yaw,aPaintLocation,aRadius);//004B : 04 1C 60 11 6A 0F 00 20 8D 27 11 00 F8 8A 27 11 00 30 8C 27 11 00 98 8D 27 11 00 10 8E 27 11 16 
    //0F 00 30 8C 27 11 1C 28 0E 6A 0F 39 3F 36 20 BF 69 0F 00 A8 8C 27 11 16 0F 00 30 8C 27 11 AD 39 
    //3F 39 44 00 30 8C 27 11 39 3F 1D 68 01 00 00 16 07 4B 00 B0 00 30 8C 27 11 39 3F 25 16 B8 00 30 
    //8C 27 11 39 3F 1D 68 01 00 00 16 04 1C 60 11 6A 0F 00 20 8D 27 11 00 F8 8A 27 11 00 30 8C 27 11 
    //00 98 8D 27 11 00 10 8E 27 11 16 04 0B 47 
  }


  event FSkill_Type cl_GetSelectedSkill() {
    local Game_Pawn gamePawn;
    gamePawn = Game_Pawn(Outer.Pawn);                                           //0000 : 0F 00 D0 90 27 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    if (!SkillsEnabled || SelectedSkillIndex == -1) {                           //0019 : 07 37 00 84 81 2D 01 48 02 24 11 16 18 0D 00 9A 01 38 03 24 11 1D FF FF FF FF 16 16 
      return None;                                                              //0035 : 04 2A 
    }
    return gamePawn.Skills.GetActiveTierSlotSkill(SelectedSkillIndex);          //0037 : 04 19 19 00 D0 90 27 11 05 00 04 01 08 28 18 11 0B 00 04 1C 60 E0 21 11 01 38 03 24 11 16 
    //0F 00 D0 90 27 11 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 07 37 00 84 81 2D 01 
    //48 02 24 11 16 18 0D 00 9A 01 38 03 24 11 1D FF FF FF FF 16 16 04 2A 04 19 19 00 D0 90 27 11 05 
    //00 04 01 08 28 18 11 0B 00 04 1C 60 E0 21 11 01 38 03 24 11 16 04 0B 47 
  }


  event cl_EnableMouseTrace(bool aEnableFlag) {
    mIgnoreTrace = !aEnableFlag;                                                //0000 : 14 2D 01 B0 92 27 11 81 2D 00 F8 91 27 11 16 
    //14 2D 01 B0 92 27 11 81 2D 00 F8 91 27 11 16 04 0B 47 
  }


  function cl_TraceMouseCursor(float aMouseX,float aMouseY,float aCenterX,float aCenterY,out Vector aHit,out Actor outActor) {
    local Game_PlayerController GPC;
    local Vector mouseLocation;
    local Vector centerLocation;
    local Vector norm;
    local Vector mouseWorldVector;
    local Vector centerWorldVector;
    local Vector startTrace;
    local Vector endTrace;
    local float Distance;
    local Actor centerActor;
    local Game_Pawn newPawnUnderReticule;
    Distance = 4096.00000000;                                                   //0000 : 0F 00 48 98 27 11 1E 00 00 80 45 
    GPC = Outer;                                                                //000B : 0F 00 C0 98 27 11 01 00 E4 6B 0F 
    if (GPC != None && GPC.Player != None) {                                    //0016 : 07 C3 02 82 77 00 C0 98 27 11 2A 16 18 12 00 77 19 00 C0 98 27 11 05 00 04 01 28 25 71 0F 2A 16 16 
      if (aMouseX > 0 || aMouseY > 0) {                                         //0037 : 07 83 00 84 B1 00 D8 93 27 11 39 3F 25 16 18 0B 00 B1 00 38 99 27 11 39 3F 25 16 16 
        mouseLocation.X = aMouseX;                                              //0053 : 0F 36 48 C4 69 0F 00 B0 99 27 11 00 D8 93 27 11 
        mouseLocation.Y = aMouseY;                                              //0063 : 0F 36 C0 C4 69 0F 00 B0 99 27 11 00 38 99 27 11 
        mouseLocation.Z = 0.00000000;                                           //0073 : 0F 36 38 C5 69 0F 00 B0 99 27 11 1E 00 00 00 00 
      }
      mouseWorldVector = GPC.Player.LocalInteractions[0].ScreenToWorld(mouseLocation,GPC.CalcViewLocation,GPC.CalcViewRotation);//0083 : 0F 00 28 9A 27 11 19 10 25 19 19 00 C0 98 27 11 05 00 04 01 28 25 71 0F 05 00 00 01 08 F9 71 0F 27 00 0C 1B 04 0F 00 00 00 B0 99 27 11 19 00 C0 98 27 11 05 00 0C 01 E8 71 71 0F 19 00 C0 98 27 11 05 00 0C 01 D8 72 71 0F 16 
      startTrace = GPC.CalcViewLocation + mouseWorldVector;                     //00CD : 0F 00 A0 9A 27 11 D7 19 00 C0 98 27 11 05 00 0C 01 E8 71 71 0F 00 28 9A 27 11 16 
      mouseWorldVector = Normal(mouseWorldVector);                              //00E8 : 0F 00 28 9A 27 11 E2 00 28 9A 27 11 16 
      endTrace = startTrace + mouseWorldVector * Distance;                      //00F5 : 0F 00 18 9B 27 11 D7 00 A0 9A 27 11 D4 00 28 9A 27 11 00 48 98 27 11 16 16 
      outActor = GPC.Trace(aHit,norm,endTrace,startTrace,True);                 //010E : 0F 00 90 9B 27 11 19 00 C0 98 27 11 18 00 04 61 15 00 08 9C 27 11 00 80 9C 27 11 00 18 9B 27 11 00 A0 9A 27 11 27 16 
      if (IsCombatReady()) {                                                    //0135 : 07 23 02 1C A0 DD 23 11 16 
        centerLocation.X = aCenterX;                                            //013E : 0F 36 48 C4 69 0F 00 F8 9C 27 11 00 70 9D 27 11 
        centerLocation.Y = aCenterY;                                            //014E : 0F 36 C0 C4 69 0F 00 F8 9C 27 11 00 E8 9D 27 11 
        centerLocation.Z = 0.00000000;                                          //015E : 0F 36 38 C5 69 0F 00 F8 9C 27 11 1E 00 00 00 00 
        centerWorldVector = GPC.Player.LocalInteractions[0].ScreenToWorld(centerLocation,GPC.CalcViewLocation,GPC.CalcViewRotation);//016E : 0F 00 60 9E 27 11 19 10 25 19 19 00 C0 98 27 11 05 00 04 01 28 25 71 0F 05 00 00 01 08 F9 71 0F 27 00 0C 1B 04 0F 00 00 00 F8 9C 27 11 19 00 C0 98 27 11 05 00 0C 01 E8 71 71 0F 19 00 C0 98 27 11 05 00 0C 01 D8 72 71 0F 16 
        startTrace = GPC.CalcViewLocation + centerWorldVector;                  //01B8 : 0F 00 A0 9A 27 11 D7 19 00 C0 98 27 11 05 00 0C 01 E8 71 71 0F 00 60 9E 27 11 16 
        centerWorldVector = Normal(centerWorldVector);                          //01D3 : 0F 00 60 9E 27 11 E2 00 60 9E 27 11 16 
        endTrace = startTrace + centerWorldVector * Distance;                   //01E0 : 0F 00 18 9B 27 11 D7 00 A0 9A 27 11 D4 00 60 9E 27 11 00 48 98 27 11 16 16 
        centerActor = GPC.Trace(aHit,norm,endTrace,startTrace,True);            //01F9 : 0F 00 D8 9E 27 11 19 00 C0 98 27 11 18 00 04 61 15 00 08 9C 27 11 00 80 9C 27 11 00 18 9B 27 11 00 A0 9A 27 11 27 16 
      } else {                                                                  //0220 : 06 2A 02 
        centerActor = None;                                                     //0223 : 0F 00 D8 9E 27 11 2A 
      }
      if (centerActor != None) {                                                //022A : 07 50 02 77 00 D8 9E 27 11 2A 16 
        mTargetLocationValid = True;                                            //0235 : 14 2D 01 48 09 24 11 27 
        newPawnUnderReticule = Game_Pawn(centerActor);                          //023D : 0F 00 50 9F 27 11 2E 18 38 5B 01 00 D8 9E 27 11 
      } else {                                                                  //024D : 06 5F 02 
        mTargetLocationValid = False;                                           //0250 : 14 2D 01 48 09 24 11 28 
        newPawnUnderReticule = None;                                            //0258 : 0F 00 50 9F 27 11 2A 
      }
      if (newPawnUnderReticule != mPawnUnderReticule) {                         //025F : 07 C3 02 77 00 50 9F 27 11 01 B8 F7 23 11 16 
        if (mPawnUnderReticule != None) {                                       //026E : 07 93 02 77 01 B8 F7 23 11 2A 16 
          mPawnUnderReticule.Effects.cl_SetTargetInteractionEffect(0);          //0279 : 19 19 01 B8 F7 23 11 05 00 04 01 48 63 34 0F 08 00 00 1B 1C 0D 00 00 24 00 16 
        }
        mPawnUnderReticule = newPawnUnderReticule;                              //0293 : 0F 01 B8 F7 23 11 00 50 9F 27 11 
        if (mPawnUnderReticule != None) {                                       //029E : 07 C3 02 77 01 B8 F7 23 11 2A 16 
          mPawnUnderReticule.Effects.cl_SetTargetInteractionEffect(1);          //02A9 : 19 19 01 B8 F7 23 11 05 00 04 01 48 63 34 0F 08 00 00 1B 1C 0D 00 00 24 01 16 
        }
      }
    }
    //0F 00 48 98 27 11 1E 00 00 80 45 0F 00 C0 98 27 11 01 00 E4 6B 0F 07 C3 02 82 77 00 C0 98 27 11 
    //2A 16 18 12 00 77 19 00 C0 98 27 11 05 00 04 01 28 25 71 0F 2A 16 16 07 83 00 84 B1 00 D8 93 27 
    //11 39 3F 25 16 18 0B 00 B1 00 38 99 27 11 39 3F 25 16 16 0F 36 48 C4 69 0F 00 B0 99 27 11 00 D8 
    //93 27 11 0F 36 C0 C4 69 0F 00 B0 99 27 11 00 38 99 27 11 0F 36 38 C5 69 0F 00 B0 99 27 11 1E 00 
    //00 00 00 0F 00 28 9A 27 11 19 10 25 19 19 00 C0 98 27 11 05 00 04 01 28 25 71 0F 05 00 00 01 08 
    //F9 71 0F 27 00 0C 1B 04 0F 00 00 00 B0 99 27 11 19 00 C0 98 27 11 05 00 0C 01 E8 71 71 0F 19 00 
    //C0 98 27 11 05 00 0C 01 D8 72 71 0F 16 0F 00 A0 9A 27 11 D7 19 00 C0 98 27 11 05 00 0C 01 E8 71 
    //71 0F 00 28 9A 27 11 16 0F 00 28 9A 27 11 E2 00 28 9A 27 11 16 0F 00 18 9B 27 11 D7 00 A0 9A 27 
    //11 D4 00 28 9A 27 11 00 48 98 27 11 16 16 0F 00 90 9B 27 11 19 00 C0 98 27 11 18 00 04 61 15 00 
    //08 9C 27 11 00 80 9C 27 11 00 18 9B 27 11 00 A0 9A 27 11 27 16 07 23 02 1C A0 DD 23 11 16 0F 36 
    //48 C4 69 0F 00 F8 9C 27 11 00 70 9D 27 11 0F 36 C0 C4 69 0F 00 F8 9C 27 11 00 E8 9D 27 11 0F 36 
    //38 C5 69 0F 00 F8 9C 27 11 1E 00 00 00 00 0F 00 60 9E 27 11 19 10 25 19 19 00 C0 98 27 11 05 00 
    //04 01 28 25 71 0F 05 00 00 01 08 F9 71 0F 27 00 0C 1B 04 0F 00 00 00 F8 9C 27 11 19 00 C0 98 27 
    //11 05 00 0C 01 E8 71 71 0F 19 00 C0 98 27 11 05 00 0C 01 D8 72 71 0F 16 0F 00 A0 9A 27 11 D7 19 
    //00 C0 98 27 11 05 00 0C 01 E8 71 71 0F 00 60 9E 27 11 16 0F 00 60 9E 27 11 E2 00 60 9E 27 11 16 
    //0F 00 18 9B 27 11 D7 00 A0 9A 27 11 D4 00 60 9E 27 11 00 48 98 27 11 16 16 0F 00 D8 9E 27 11 19 
    //00 C0 98 27 11 18 00 04 61 15 00 08 9C 27 11 00 80 9C 27 11 00 18 9B 27 11 00 A0 9A 27 11 27 16 
    //06 2A 02 0F 00 D8 9E 27 11 2A 07 50 02 77 00 D8 9E 27 11 2A 16 14 2D 01 48 09 24 11 27 0F 00 50 
    //9F 27 11 2E 18 38 5B 01 00 D8 9E 27 11 06 5F 02 14 2D 01 48 09 24 11 28 0F 00 50 9F 27 11 2A 07 
    //C3 02 77 00 50 9F 27 11 01 B8 F7 23 11 16 07 93 02 77 01 B8 F7 23 11 2A 16 19 19 01 B8 F7 23 11 
    //05 00 04 01 48 63 34 0F 08 00 00 1B 1C 0D 00 00 24 00 16 0F 01 B8 F7 23 11 00 50 9F 27 11 07 C3 
    //02 77 01 B8 F7 23 11 2A 16 19 19 01 B8 F7 23 11 05 00 04 01 48 63 34 0F 08 00 00 1B 1C 0D 00 00 
    //24 01 16 04 0B 47 
  }


  function cl_ResetMouseSelection() {
    if (mActorUnderMouse != None) {                                             //0000 : 07 22 00 77 01 D8 A0 27 11 2A 16 
      mActorUnderMouse.cl_NotifyUnderCursor(False);                             //000B : 19 01 D8 A0 27 11 07 00 00 1B 8B 0C 00 00 28 16 
      mActorUnderMouse = None;                                                  //001B : 0F 01 D8 A0 27 11 2A 
    }
    //07 22 00 77 01 D8 A0 27 11 2A 16 19 01 D8 A0 27 11 07 00 00 1B 8B 0C 00 00 28 16 0F 01 D8 A0 27 
    //11 2A 04 0B 47 
  }


  function Game_Pawn sv_GetTargetPawn() {
    return mTargetPawn;                                                         //0000 : 04 01 40 F7 23 11 
    //04 01 40 F7 23 11 04 0B 47 
  }


  event Game_Pawn cl_GetTargetPawn() {
    return mTargetPawn;                                                         //0000 : 04 01 40 F7 23 11 
    //04 01 40 F7 23 11 04 0B 47 
  }


  event Actor cl_GetActorUnderMouse() {
    return mActorUnderMouse;                                                    //0000 : 04 01 D8 A0 27 11 
    //04 01 D8 A0 27 11 04 0B 47 
  }


  function Actor cl_GetTargetActor() {
    return mTargetActor;                                                        //0000 : 04 01 C0 59 27 11 
    //04 01 C0 59 27 11 04 0B 47 
  }


  protected native function cl2sv_SetTargetPawn_CallStub();


  private event cl2sv_SetTargetPawn(Game_Pawn targetPawn) {
    mTargetPawn = targetPawn;                                                   //0000 : 0F 01 40 F7 23 11 00 30 A8 27 11 
    //0F 01 40 F7 23 11 00 30 A8 27 11 04 0B 47 
  }


  event cl_SetTargetActor(Actor aTargetActor) {
    if (Game_Pawn(mTargetActor) != None
      && (mTargetActor == None && aTargetActor == None
      || mTargetActor == aTargetActor && mTargetActor != None
      && mTargetActor.IsValidActor())) {//0000 : 07 5E 00 82 77 2E 18 38 5B 01 01 C0 59 27 11 2A 16 18 48 00 84 82 72 01 C0 59 27 11 2A 16 18 09 00 72 00 98 A9 27 11 2A 16 16 18 2E 00 82 82 72 01 C0 59 27 11 00 98 A9 27 11 16 18 09 00 77 01 C0 59 27 11 2A 16 16 18 10 00 19 01 C0 59 27 11 06 00 04 1B 2E 0D 00 00 16 16 16 16 
      return;                                                                   //005C : 04 0B 
    }
    if (Outer.IsDead()) {                                                       //005E : 07 72 00 19 01 00 E4 6B 0F 06 00 04 1B 9B 05 00 00 16 
      return;                                                                   //0070 : 04 0B 
    }
    if (mTargetPawn != None) {                                                  //0072 : 07 8D 00 77 01 40 F7 23 11 2A 16 
      mTargetPawn.cl_NotifySelected(False);                                     //007D : 19 01 40 F7 23 11 07 00 00 1B 3D 05 00 00 28 16 
    }
    mTargetActor = aTargetActor;                                                //008D : 0F 01 C0 59 27 11 00 98 A9 27 11 
    mTargetPawn = Game_Pawn(mTargetActor);                                      //0098 : 0F 01 40 F7 23 11 2E 18 38 5B 01 01 C0 59 27 11 
    if (mTargetPawn != None
      && Game_StatuePawn(mTargetPawn) != None) {    //00A8 : 07 DC 00 82 77 01 40 F7 23 11 2A 16 18 0E 00 77 2E 98 E3 60 01 01 40 F7 23 11 2A 16 16 
      if (Game_StatuePawn(mTargetPawn) != None) {                               //00C5 : 07 DC 00 77 2E 98 E3 60 01 01 40 F7 23 11 2A 16 
        mTargetPawn = None;                                                     //00D5 : 0F 01 40 F7 23 11 2A 
      }
    }
    if (mTargetPawn != None) {                                                  //00DC : 07 F7 00 77 01 40 F7 23 11 2A 16 
      mTargetPawn.cl_NotifySelected(True);                                      //00E7 : 19 01 40 F7 23 11 07 00 00 1B 3D 05 00 00 27 16 
    }
    if (ShowSelectionCircle && mSelectionCircle != None) {                      //00F7 : 07 21 01 82 2D 01 88 AC 27 11 18 09 00 77 01 08 44 27 11 2A 16 16 
      mSelectionCircle.SetPawn(mTargetPawn);                                    //010D : 19 01 08 44 27 11 0B 00 00 1B B7 0C 00 00 01 40 F7 23 11 16 
    }
    if (IsClient()) {                                                           //0121 : 07 42 01 1B 1C 0C 00 00 16 
      Outer.GUI.TargetActorChanged();                                           //012A : 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B C8 0E 00 00 16 
    }
    //07 5E 00 82 77 2E 18 38 5B 01 01 C0 59 27 11 2A 16 18 48 00 84 82 72 01 C0 59 27 11 2A 16 18 09 
    //00 72 00 98 A9 27 11 2A 16 16 18 2E 00 82 82 72 01 C0 59 27 11 00 98 A9 27 11 16 18 09 00 77 01 
    //C0 59 27 11 2A 16 16 18 10 00 19 01 C0 59 27 11 06 00 04 1B 2E 0D 00 00 16 16 16 16 04 0B 07 72 
    //00 19 01 00 E4 6B 0F 06 00 04 1B 9B 05 00 00 16 04 0B 07 8D 00 77 01 40 F7 23 11 2A 16 19 01 40 
    //F7 23 11 07 00 00 1B 3D 05 00 00 28 16 0F 01 C0 59 27 11 00 98 A9 27 11 0F 01 40 F7 23 11 2E 18 
    //38 5B 01 01 C0 59 27 11 07 DC 00 82 77 01 40 F7 23 11 2A 16 18 0E 00 77 2E 98 E3 60 01 01 40 F7 
    //23 11 2A 16 16 07 DC 00 77 2E 98 E3 60 01 01 40 F7 23 11 2A 16 0F 01 40 F7 23 11 2A 07 F7 00 77 
    //01 40 F7 23 11 2A 16 19 01 40 F7 23 11 07 00 00 1B 3D 05 00 00 27 16 07 21 01 82 2D 01 88 AC 27 
    //11 18 09 00 77 01 08 44 27 11 2A 16 16 19 01 08 44 27 11 0B 00 00 1B B7 0C 00 00 01 40 F7 23 11 
    //16 07 42 01 1B 1C 0C 00 00 16 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B C8 0E 00 
    //00 16 04 0B 47 
  }


  event bool cl_SelectTargetUnderMouse() {
    local Game_GameMasterController GMC;
    cl_SetTargetActor(mActorUnderMouse);                                        //0000 : 1B 4F 05 00 00 01 D8 A0 27 11 16 
    GMC = Game_GameMasterController(Outer);                                     //000B : 0F 00 00 AF 27 11 2E D0 1D 5B 01 01 00 E4 6B 0F 
    if (GMC == None) {                                                          //001B : 07 28 00 72 00 00 AF 27 11 2A 16 
      return False;                                                             //0026 : 04 28 
    }
    if (Pawn(mActorUnderMouse) != None) {                                       //0028 : 07 5F 00 77 2E 50 31 D4 00 01 D8 A0 27 11 2A 16 
      GMC.SpwnieControl.SetTarget(Editor_Spwnie(mTargetActor));                 //0038 : 19 19 00 00 AF 27 11 05 00 04 01 78 AF 27 11 10 00 00 1B 8D 0D 00 00 2E F8 BA 5E 01 01 C0 59 27 11 16 
      return True;                                                              //005A : 04 27 
    } else {                                                                    //005C : 06 7A 00 
      GMC.SpwnieControl.SetTarget(None);                                        //005F : 19 19 00 00 AF 27 11 05 00 04 01 78 AF 27 11 07 00 00 1B 8D 0D 00 00 2A 16 
      return False;                                                             //0078 : 04 28 
    }
    //1B 4F 05 00 00 01 D8 A0 27 11 16 0F 00 00 AF 27 11 2E D0 1D 5B 01 01 00 E4 6B 0F 07 28 00 72 00 
    //00 AF 27 11 2A 16 04 28 07 5F 00 77 2E 50 31 D4 00 01 D8 A0 27 11 2A 16 19 19 00 00 AF 27 11 05 
    //00 04 01 78 AF 27 11 10 00 00 1B 8D 0D 00 00 2E F8 BA 5E 01 01 C0 59 27 11 16 04 27 06 7A 00 19 
    //19 00 00 AF 27 11 05 00 04 01 78 AF 27 11 07 00 00 1B 8D 0D 00 00 2A 16 04 28 04 0B 47 
  }


  event cl_UpdateMousePosition(float aMouseX,float aMouseY,float aCenterX,float aCenterY) {
    local Actor currentActorUnderMouse;
    if (mIgnoreTrace) {                                                         //0000 : 07 12 00 2D 01 B0 92 27 11 
      mActorUnderMouse = None;                                                  //0009 : 0F 01 D8 A0 27 11 2A 
      return;                                                                   //0010 : 04 0B 
    }
    currentActorUnderMouse = mActorUnderMouse;                                  //0012 : 0F 00 30 12 34 0F 01 D8 A0 27 11 
    cl_TraceMouseCursor(aMouseX,aMouseY,aCenterX,aCenterY,mTargetLocation,mActorUnderMouse);//001D : 1B 1B 0F 00 00 00 B8 10 34 0F 00 A8 12 34 0F 00 20 13 34 0F 00 98 13 34 0F 01 38 0A 24 11 01 D8 A0 27 11 16 
    if (currentActorUnderMouse != None
      && mActorUnderMouse != currentActorUnderMouse) {//0041 : 07 6D 00 82 77 00 30 12 34 0F 2A 16 18 0D 00 77 01 D8 A0 27 11 00 30 12 34 0F 16 16 
      currentActorUnderMouse.cl_NotifyUnderCursor(False);                       //005D : 19 00 30 12 34 0F 07 00 00 1B 8B 0C 00 00 28 16 
    }
    if (mActorUnderMouse != None) {                                             //006D : 07 97 00 77 01 D8 A0 27 11 2A 16 
      mActorUnderMouse.cl_NotifyUnderCursor(GetDesktop().IsRadialInteractionPossible());//0078 : 19 01 D8 A0 27 11 16 00 00 1B 8B 0C 00 00 19 1C 40 E2 23 11 16 06 00 04 1B 3A 0D 00 00 16 16 
    }
    //07 12 00 2D 01 B0 92 27 11 0F 01 D8 A0 27 11 2A 04 0B 0F 00 30 12 34 0F 01 D8 A0 27 11 1B 1B 0F 
    //00 00 00 B8 10 34 0F 00 A8 12 34 0F 00 20 13 34 0F 00 98 13 34 0F 01 38 0A 24 11 01 D8 A0 27 11 
    //16 07 6D 00 82 77 00 30 12 34 0F 2A 16 18 0D 00 77 01 D8 A0 27 11 00 30 12 34 0F 16 16 19 00 30 
    //12 34 0F 07 00 00 1B 8B 0C 00 00 28 16 07 97 00 77 01 D8 A0 27 11 2A 16 19 01 D8 A0 27 11 16 00 
    //00 1B 8B 0C 00 00 19 1C 40 E2 23 11 16 06 00 04 1B 3A 0D 00 00 16 16 04 0B 47 
  }


  protected native function cl2sv_Resurrect_CallStub();


  event cl2sv_Resurrect() {
    Outer.sv_Resurrect();                                                       //0000 : 19 01 00 E4 6B 0F 06 00 00 1B 58 0C 00 00 16 
    //19 01 00 E4 6B 0F 06 00 00 1B 58 0C 00 00 16 04 0B 47 
  }


  final event UpdateViewRotation() {
    ViewRotation.Yaw = Outer.Pawn.Rotation.Yaw;                                 //0000 : 0F 36 20 BF 69 0F 01 50 16 34 0F 36 20 BF 69 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 00 84 6C 0F 
    ViewRotation.Pitch = Outer.CalcViewRotation.Pitch;                          //0027 : 0F 36 A8 BE 69 0F 01 50 16 34 0F 36 A8 BE 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 D8 72 71 0F 
    ViewRotation.Roll = 0;                                                      //0045 : 0F 36 98 BF 69 0F 01 50 16 34 0F 25 
    //0F 36 20 BF 69 0F 01 50 16 34 0F 36 20 BF 69 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 
    //00 0C 01 00 84 6C 0F 0F 36 A8 BE 69 0F 01 50 16 34 0F 36 A8 BE 69 0F 19 01 00 E4 6B 0F 05 00 0C 
    //01 D8 72 71 0F 0F 36 98 BF 69 0F 01 50 16 34 0F 25 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    Outer.UnPressButtons();                                                     //0006 : 19 01 00 E4 6B 0F 06 00 00 1B E6 11 00 00 16 
    if (mSelectionCircle == None) {                                             //0015 : 07 3C 00 72 01 08 44 27 11 2A 16 
      mSelectionCircle = Outer.Spawn(Class'Game_SelectionCircle',Outer);        //0020 : 0F 01 08 44 27 11 19 01 00 E4 6B 0F 0D 00 04 61 16 20 F8 ED 35 0F 01 00 E4 6B 0F 16 
    }
    UpdateViewRotation();                                                       //003C : 1C 10 59 27 11 16 
    mAutoRun = False;                                                           //0042 : 14 2D 01 20 F2 23 11 28 
    //1C E0 C4 19 11 16 19 01 00 E4 6B 0F 06 00 00 1B E6 11 00 00 16 07 3C 00 72 01 08 44 27 11 2A 16 
    //0F 01 08 44 27 11 19 01 00 E4 6B 0F 0D 00 04 61 16 20 F8 ED 35 0F 01 00 E4 6B 0F 16 1C 10 59 27 
    //11 16 14 2D 01 20 F2 23 11 28 04 0B 47 
  }


  delegate OnActivateSkillFailed();



