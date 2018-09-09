//==============================================================================
//  PlayerController
//==============================================================================

class PlayerController extends Controller
    native
    nativereplication
    exportstructs
    dependsOn(PlayerInput,Player,BaseGUIController,PhysicsVolume,LevelInfo,CameraEffect,ZoneInfo,HUD,Console,InteractionMaster,Interaction)
    Config(User)
  ;

  const UNREAL_UNIT_PI =  32768;
  var const Player Player;
  var globalconfig bool bLookUpStairs;
  var globalconfig bool bSnapToLevel;
  var globalconfig bool bAlwaysMouseLook;
  var globalconfig bool bKeyboardLook;
  var bool bCenterView;
  var bool bBehindView;
  var bool bPressedJump;
  var bool bIsTyping;
  var bool bFixedCamera;
  var bool bUpdating;
  var bool bHideSpectatorBeacons;
  var bool bZooming;
  var bool bSetTurnRot;
  var bool bCheatFlying;
  var bool bFreeCamera;
  var bool bZeroRoll;
  var bool bCameraPositionLocked;
  var bool bViewBot;
  var bool UseFixedVisibility;
  var bool bFreeCam;
  var bool bFreeCamZoom;
  var bool bFreeCamSwivel;
  var bool bBlockCloseCamera;
  var bool bValidBehindCamera;
  var bool bForcePrecache;
  var bool bClientDemo;
  var const bool bAllActorsRelevant;
  var bool bShortConnectTimeOut;
  var bool bPendingDestroy;
  var bool bEnableAmbientShake;
  var Rotator ShakeRot;
  var Vector ShakeOffset;
  var globalconfig bool bLandingShake;
  var globalconfig bool bAimingHelp;
  var private bool bViewingMatineeCinematic;
  var bool bCustomListener;
  var bool bAcuteHearing;
  var float FOVBias;
  var Rotator currentClientView;
  var input byte bStrafe;
  var input byte bSnapLevel;
  var input byte bLook;
  var input byte bFreeLook;
  var input byte bTurn180;
  var input byte bTurnToNearest;
  var input byte bXAxis;
  var input byte bYAxis;
  var input float aBaseX;
  var input float aBaseY;
  var input float aBaseZ;
  var input float aMouseX;
  var input float aMouseY;
  var input float aForward;
  var input float aTurn;
  var input float aStrafe;
  var input float aUp;
  var input float aLookUp;
  var int ShowFlags;
  var int Misc1;
  var int Misc2;
  var int RendMap;
  var float OrthoZoom;
  var const Actor ViewTarget;
  var const Controller RealViewTarget;
  var PlayerController DemoViewer;
  var float CameraDist;
  var Range CameraDistRange;
  var Vector OldCameraLoc;
  var Rotator OldCameraRot;
  var transient array<CameraEffect> CameraEffects;
  var globalconfig float DesiredFOV;
  var globalconfig float DefaultFOV;
  var float ZoomLevel;
  var float DesiredZoomLevel;
  var globalconfig float CameraTiltAngle;
  var Vector ListenerLocation;
  var Rotator ListenerRotation;
  var Vector FixedLocation;
  var Rotator FixedRotation;
  var Matrix RenderWorldToCamera;
  var Vector FlashScale;
  var Vector FlashFog;
  var float ConstantGlowScale;
  var Vector ConstantGlowFog;
  var globalconfig float ScreenFlashScaling;
  var Color LastDistanceFogColor;
  var Color CurrentDistanceFogColor;
  var float LastDistanceFogStart;
  var float LastDistanceFogEnd;
  var float CurrentDistanceFogEnd;
  var float TimeSinceLastFogChange;
  var int LastZone;
  var PhysicsVolume LastVolume;
  var Rotator TargetViewRotation;
  var Rotator BlendedTargetViewRotation;
  var float TargetEyeHeight;
  var HUD myHUD;
  var float LastPlaySound;
  var float LastPlaySpeech;
  var string Song;
  var byte Transition;
  var float CurrentTimeStamp;
  var float lastUpdateTime;
  var float ServerTimeStamp;
  var float TimeMargin;
  var float ClientUpdateTime;
  var globalconfig float TimeMarginSlack;
  var string ProgressMessage[4];
  var Color ProgressColor[4];
  var float ProgressTimeOut;
  var globalconfig string StatsUsername;
  var globalconfig string StatsPassword;
  var float AmbientShakeFalloffStartTime;
  var float AmbientShakeFalloffTime;
  var Vector AmbientShakeOffsetMag;
  var float AmbientShakeOffsetFreq;
  var Rotator AmbientShakeRotMag;
  var float AmbientShakeRotFreq;
  var Pawn TurnTarget;
  var config int EnemyTurnSpeed;
  var int GroundPitch;
  var Rotator TurnRot180;
  var Vector OldFloor;
  var transient PlayerInput PlayerInput;
  var const Vector FailedPathStart;
  var float CameraDeltaYaw;
  var float CameraDeltaRad;
  var Rotator CameraSwivel;
  var int DemoViewPitch;
  var int DemoViewYaw;
  var Actor CalcViewActor;
  var Vector CalcViewActorLocation;
  var Vector CalcViewLocation;
  var Rotator CalcViewRotation;
  var float LastPlayerCalcView;
  var int mPreviousSimFrame;
  var float mNetDeltaSeconds;
  var int ShowDepartmentFlags;
  var int SBShowFlags;


  simulated event LostChild(Actor Other) {
    Super.LostChild(Other);                                                     //0000 : 1C 80 87 6D 0F 00 70 1C 71 0F 16 
    //1C 80 87 6D 0F 00 70 1C 71 0F 16 04 0B 47 
  }


  simulated event GainedChild(Actor Other) {
    Super.GainedChild(Other);                                                   //0000 : 1C D8 88 6D 0F 00 00 1E 71 0F 16 
    //1C D8 88 6D 0F 00 00 1E 71 0F 16 04 0B 47 
  }


  function InvertLook() {
    local bool Result;
    Result = PlayerInput.InvertLook();                                          //0000 : 14 2D 00 68 1F 71 0F 19 01 30 20 71 0F 06 00 04 1B 18 2B 00 00 16 
    //14 2D 00 68 1F 71 0F 19 01 30 20 71 0F 06 00 04 1B 18 2B 00 00 16 04 0B 47 
  }


  function InvertMouse(optional string Invert) {
    PlayerInput.InvertMouse(Invert);                                            //0000 : 19 01 30 20 71 0F 0B 00 00 1B 7D 2B 00 00 00 58 21 71 0F 16 
    //19 01 30 20 71 0F 0B 00 00 1B 7D 2B 00 00 00 58 21 71 0F 16 04 0B 47 
  }


  simulated function bool IsMouseInverted() {
    return PlayerInput.bInvertMouse;                                            //0000 : 04 19 01 30 20 71 0F 06 00 04 2D 01 88 23 71 0F 
    //04 19 01 30 20 71 0F 06 00 04 2D 01 88 23 71 0F 04 0B 47 
  }


  event ClientCloseMenu(optional bool bCloseAll,optional bool bCancel) {
    if (bCloseAll) {                                                            //0000 : 07 2B 00 2D 00 B0 24 71 0F 
      Player.GUIController.CloseAll(bCancel,True);                              //0009 : 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0D 00 00 1B D5 2B 00 00 2D 00 18 26 71 0F 27 16 
    } else {                                                                    //0028 : 06 49 00 
      Player.GUIController.CloseMenu(bCancel);                                  //002B : 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0C 00 04 1B D0 2B 00 00 2D 00 18 26 71 0F 16 
    }
    //07 2B 00 2D 00 B0 24 71 0F 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0D 00 00 1B D5 2B 00 00 
    //2D 00 18 26 71 0F 27 16 06 49 00 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0C 00 04 1B D0 2B 
    //00 00 2D 00 18 26 71 0F 16 04 0B 47 
  }


  event ClientReplaceMenu(string Menu,optional bool bDisconnect,optional string Msg1,optional string Msg2) {
    if (!Player.GUIController.bActive) {                                        //0000 : 07 52 00 81 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 06 00 04 2D 01 90 28 71 0F 16 
      if (!Player.GUIController.ReplaceMenu(Menu,Msg1,Msg2)) {                  //001D : 07 4F 00 81 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 15 00 04 1B 62 2B 00 00 00 40 27 71 0F 00 08 29 71 0F 00 80 29 71 0F 16 16 
        UnPressButtons();                                                       //0049 : 1B E6 11 00 00 16 
      }
    } else {                                                                    //004F : 06 79 00 
      Player.GUIController.ReplaceMenu(Menu,Msg1,Msg2);                         //0052 : 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 15 00 04 1B 62 2B 00 00 00 40 27 71 0F 00 08 29 71 0F 00 80 29 71 0F 16 
    }
    //07 52 00 81 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 06 00 04 2D 01 90 28 71 0F 16 07 4F 00 
    //81 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 15 00 04 1B 62 2B 00 00 00 40 27 71 0F 00 08 29 
    //71 0F 00 80 29 71 0F 16 16 1B E6 11 00 00 16 06 79 00 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 
    //0F 15 00 04 1B 62 2B 00 00 00 40 27 71 0F 00 08 29 71 0F 00 80 29 71 0F 16 04 0B 47 
  }


  event ClientOpenMenu(string Menu,optional string Msg1,optional string Msg2) {
    if (!Player.GUIController.OpenMenu(Menu,Msg1,Msg2)) {                       //0000 : 07 32 00 81 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 15 00 04 1B A0 2B 00 00 00 D0 4A 71 0F 00 B8 4B 71 0F 00 30 4C 71 0F 16 16 
      UnPressButtons();                                                         //002C : 1B E6 11 00 00 16 
    }
    //07 32 00 81 19 19 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 15 00 04 1B A0 2B 00 00 00 D0 4A 71 0F 
    //00 B8 4B 71 0F 00 30 4C 71 0F 16 16 1B E6 11 00 00 16 04 0B 47 
  }


  singular event UnPressButtons() {
    bFire = 0;                                                                  //0000 : 0F 01 28 F3 70 0F 24 00 
    bAltFire = 0;                                                               //0008 : 0F 01 A0 F3 70 0F 24 00 
    bDuck = 0;                                                                  //0010 : 0F 01 B0 F2 70 0F 24 00 
    bRun = 0;                                                                   //0018 : 0F 01 38 F2 70 0F 24 00 
    bVoiceTalk = 0;                                                             //0020 : 0F 01 18 F4 70 0F 24 00 
    ResetInput();                                                               //0028 : 1C C8 4D 71 0F 16 
    //0F 01 28 F3 70 0F 24 00 0F 01 A0 F3 70 0F 24 00 0F 01 B0 F2 70 0F 24 00 0F 01 38 F2 70 0F 24 00 
    //0F 01 18 F4 70 0F 24 00 1C C8 4D 71 0F 16 04 0B 47 
  }


  function ChangeAlwaysMouseLook(bool B) {
    bAlwaysMouseLook = B;                                                       //0000 : 14 2D 01 98 EE 6E 0F 2D 00 28 4F 71 0F 
    if (bAlwaysMouseLook) {                                                     //000D : 07 1E 00 2D 01 98 EE 6E 0F 
      bLookUpStairs = False;                                                    //0016 : 14 2D 01 10 EF 6E 0F 28 
    }
    //14 2D 01 98 EE 6E 0F 2D 00 28 4F 71 0F 07 1E 00 2D 01 98 EE 6E 0F 14 2D 01 10 EF 6E 0F 28 04 0B 
    //47 
  }


  function ChangeStairLook(bool B) {
    bLookUpStairs = B;                                                          //0000 : 14 2D 01 10 EF 6E 0F 2D 00 28 F4 6E 0F 
    if (bLookUpStairs) {                                                        //000D : 07 1E 00 2D 01 10 EF 6E 0F 
      bAlwaysMouseLook = False;                                                 //0016 : 14 2D 01 98 EE 6E 0F 28 
    }
    //14 2D 01 10 EF 6E 0F 2D 00 28 F4 6E 0F 07 1E 00 2D 01 10 EF 6E 0F 14 2D 01 98 EE 6E 0F 28 04 0B 
    //47 
  }


  function UpdateRotation(float DeltaTime,float maxPitch) {
    local Rotator ViewRotation;
    if (IsViewingCinematic()) {                                                 //0000 : 07 0B 00 1B 1F 0D 00 00 16 
      return;                                                                   //0009 : 04 0B 
    }
    ViewRotation = Rotation;                                                    //000B : 0F 00 B0 53 71 0F 01 00 84 6C 0F 
    if (bFreeCam && bBehindView) {                                              //0016 : 07 47 00 82 2D 01 28 54 71 0F 18 07 00 2D 01 A0 54 71 0F 16 
      CameraDeltaYaw += 32.00000000 * DeltaTime * aTurn;                        //002A : B8 01 18 55 71 0F AB AB 1E 00 00 00 42 00 98 51 71 0F 16 01 90 55 71 0F 16 16 
    } else {                                                                    //0044 : 06 73 00 
      DesiredRotation = ViewRotation;                                           //0047 : 0F 01 D0 E8 6E 0F 00 B0 53 71 0F 
      ViewRotation.Yaw += 32.00000000 * DeltaTime * aTurn;                      //0052 : A1 36 20 BF 69 0F 00 B0 53 71 0F 39 44 AB AB 1E 00 00 00 42 00 98 51 71 0F 16 01 90 55 71 0F 16 16 
    }
    ViewRotation.Pitch += 32.00000000 * DeltaTime * aLookUp;                    //0073 : A1 36 A8 BE 69 0F 00 B0 53 71 0F 39 44 AB AB 1E 00 00 00 42 00 98 51 71 0F 16 01 08 56 71 0F 16 16 
    if (bBehindView) {                                                          //0094 : 07 C4 00 2D 01 A0 54 71 0F 
      ViewRotation.Pitch = Pawn.LimitPitchBehindView(ViewRotation.Pitch);       //009D : 0F 36 A8 BE 69 0F 00 B0 53 71 0F 19 01 88 83 6C 0F 10 00 04 1B 8B 2C 00 00 36 A8 BE 69 0F 00 B0 53 71 0F 16 
    } else {                                                                    //00C1 : 06 E8 00 
      ViewRotation.Pitch = Pawn.LimitPitchFirstPersonView(ViewRotation.Pitch);  //00C4 : 0F 36 A8 BE 69 0F 00 B0 53 71 0F 19 01 88 83 6C 0F 10 00 04 1B 91 2B 00 00 36 A8 BE 69 0F 00 B0 53 71 0F 16 
    }
    SetRotation(ViewRotation);                                                  //00E8 : 1C 70 01 6E 0F 00 B0 53 71 0F 16 
    Pawn.FaceRotation(ViewRotation,DeltaTime);                                  //00F3 : 19 01 88 83 6C 0F 10 00 00 1B 92 2B 00 00 00 B0 53 71 0F 00 98 51 71 0F 16 
    //07 0B 00 1B 1F 0D 00 00 16 04 0B 0F 00 B0 53 71 0F 01 00 84 6C 0F 07 47 00 82 2D 01 28 54 71 0F 
    //18 07 00 2D 01 A0 54 71 0F 16 B8 01 18 55 71 0F AB AB 1E 00 00 00 42 00 98 51 71 0F 16 01 90 55 
    //71 0F 16 16 06 73 00 0F 01 D0 E8 6E 0F 00 B0 53 71 0F A1 36 20 BF 69 0F 00 B0 53 71 0F 39 44 AB 
    //AB 1E 00 00 00 42 00 98 51 71 0F 16 01 90 55 71 0F 16 16 A1 36 A8 BE 69 0F 00 B0 53 71 0F 39 44 
    //AB AB 1E 00 00 00 42 00 98 51 71 0F 16 01 08 56 71 0F 16 16 07 C4 00 2D 01 A0 54 71 0F 0F 36 A8 
    //BE 69 0F 00 B0 53 71 0F 19 01 88 83 6C 0F 10 00 04 1B 8B 2C 00 00 36 A8 BE 69 0F 00 B0 53 71 0F 
    //16 06 E8 00 0F 36 A8 BE 69 0F 00 B0 53 71 0F 19 01 88 83 6C 0F 10 00 04 1B 91 2B 00 00 36 A8 BE 
    //69 0F 00 B0 53 71 0F 16 1C 70 01 6E 0F 00 B0 53 71 0F 16 19 01 88 83 6C 0F 10 00 00 1B 92 2B 00 
    //00 00 B0 53 71 0F 00 98 51 71 0F 16 04 0B 47 
  }


  function TurnAround() {
    if (!bSetTurnRot) {                                                         //0000 : 07 2F 00 81 2D 01 50 58 71 0F 16 
      TurnRot180 = Rotation;                                                    //000B : 0F 01 C8 58 71 0F 01 00 84 6C 0F 
      TurnRot180.Yaw += 32768;                                                  //0016 : A1 36 20 BF 69 0F 01 C8 58 71 0F 1D 00 80 00 00 16 
      bSetTurnRot = True;                                                       //0027 : 14 2D 01 50 58 71 0F 27 
    }
    DesiredRotation = TurnRot180;                                               //002F : 0F 01 D0 E8 6E 0F 01 C8 58 71 0F 
    bRotateToDesired = DesiredRotation.Yaw != Rotation.Yaw;                     //003A : 14 2D 01 E8 E2 6E 0F 9B 36 20 BF 69 0F 01 D0 E8 6E 0F 36 20 BF 69 0F 01 00 84 6C 0F 16 
    //07 2F 00 81 2D 01 50 58 71 0F 16 0F 01 C8 58 71 0F 01 00 84 6C 0F A1 36 20 BF 69 0F 01 C8 58 71 
    //0F 1D 00 80 00 00 16 14 2D 01 50 58 71 0F 27 0F 01 D0 E8 6E 0F 01 C8 58 71 0F 14 2D 01 E8 E2 6E 
    //0F 9B 36 20 BF 69 0F 01 D0 E8 6E 0F 36 20 BF 69 0F 01 00 84 6C 0F 16 04 0B 47 
  }


  function bool TurnTowardNearestEnemy();


  function int BlendRot(float DeltaTime,int BlendC,int NewC) {
    if (Abs(BlendC - NewC) > 32767) {                                           //0000 : 07 46 00 B1 BA 39 3F 93 00 B0 5C 71 0F 00 28 5D 71 0F 16 16 39 3F 1D FF 7F 00 00 16 
      if (BlendC > NewC) {                                                      //001C : 07 3A 00 97 00 B0 5C 71 0F 00 28 5D 71 0F 16 
        NewC += 65536;                                                          //002B : A1 00 28 5D 71 0F 1D 00 00 01 00 16 
      } else {                                                                  //0037 : 06 46 00 
        BlendC += 65536;                                                        //003A : A1 00 B0 5C 71 0F 1D 00 00 01 00 16 
      }
    }
    if (Abs(BlendC - NewC) > 4096) {                                            //0046 : 07 70 00 B1 BA 39 3F 93 00 B0 5C 71 0F 00 28 5D 71 0F 16 16 39 3F 1D 00 10 00 00 16 
      BlendC = NewC;                                                            //0062 : 0F 00 B0 5C 71 0F 00 28 5D 71 0F 
    } else {                                                                    //006D : 06 A4 00 
      BlendC = BlendC + (NewC - BlendC) * FMin(1.00000000,24.00000000 * DeltaTime);//0070 : 0F 00 B0 5C 71 0F 39 44 AE 39 3F 00 B0 5C 71 0F AB 39 3F 93 00 28 5D 71 0F 00 B0 5C 71 0F 16 F4 1E 00 00 80 3F AB 1E 00 00 C0 41 00 18 5B 71 0F 16 16 16 16 
    }
    return BlendC & 65535;                                                      //00A4 : 04 9C 00 B0 5C 71 0F 1D FF FF 00 00 16 
    //07 46 00 B1 BA 39 3F 93 00 B0 5C 71 0F 00 28 5D 71 0F 16 16 39 3F 1D FF 7F 00 00 16 07 3A 00 97 
    //00 B0 5C 71 0F 00 28 5D 71 0F 16 A1 00 28 5D 71 0F 1D 00 00 01 00 16 06 46 00 A1 00 B0 5C 71 0F 
    //1D 00 00 01 00 16 07 70 00 B1 BA 39 3F 93 00 B0 5C 71 0F 00 28 5D 71 0F 16 16 39 3F 1D 00 10 00 
    //00 16 0F 00 B0 5C 71 0F 00 28 5D 71 0F 06 A4 00 0F 00 B0 5C 71 0F 39 44 AE 39 3F 00 B0 5C 71 0F 
    //AB 39 3F 93 00 28 5D 71 0F 00 B0 5C 71 0F 16 F4 1E 00 00 80 3F AB 1E 00 00 C0 41 00 18 5B 71 0F 
    //16 16 16 16 04 9C 00 B0 5C 71 0F 1D FF FF 00 00 16 04 0B 47 
  }


  function CalcFirstPersonView(out Vector CameraLocation,out Rotator CameraRotation) {
    local Vector X;
    local Vector Y;
    local Vector Z;
    local Vector AmbShakeOffset;
    local Rotator AmbShakeRot;
    local float FalloffScaling;
    GetAxes(Rotation,X,Y,Z);                                                    //0000 : E5 01 00 84 6C 0F 00 C0 61 71 0F 00 38 62 71 0F 00 B0 62 71 0F 16 
    if (bEnableAmbientShake) {                                                  //0016 : 07 25 01 2D 01 28 63 71 0F 
      if (AmbientShakeFalloffStartTime > 0
        && Level.TimeSeconds - AmbientShakeFalloffStartTime > AmbientShakeFalloffTime) {//001F : 07 58 00 82 B1 01 A0 63 71 0F 39 3F 25 16 18 1D 00 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 A0 63 71 0F 16 01 18 64 71 0F 16 16 
        bEnableAmbientShake = False;                                            //004D : 14 2D 01 28 63 71 0F 28 
      } else {                                                                  //0055 : 06 25 01 
        if (AmbientShakeFalloffStartTime > 0) {                                 //0058 : 07 A8 00 B1 01 A0 63 71 0F 39 3F 25 16 
          FalloffScaling = 1.00000000 - (Level.TimeSeconds - AmbientShakeFalloffStartTime) / AmbientShakeFalloffTime;//0065 : 0F 00 90 64 71 0F AF 1E 00 00 80 3F AC AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 A0 63 71 0F 16 01 18 64 71 0F 16 16 
          FalloffScaling = FClamp(FalloffScaling,0.00000000,1.00000000);        //008E : 0F 00 90 64 71 0F F6 00 90 64 71 0F 1E 00 00 00 00 1E 00 00 80 3F 16 
        } else {                                                                //00A5 : 06 B3 00 
          FalloffScaling = 1.00000000;                                          //00A8 : 0F 00 90 64 71 0F 1E 00 00 80 3F 
        }
        AmbShakeOffset = AmbientShakeOffsetMag * FalloffScaling * Sin(Level.TimeSeconds * AmbientShakeOffsetFreq * 2 * 3.14159274);//00B3 : 0F 00 08 65 71 0F D4 D4 01 80 65 71 0F 00 90 64 71 0F 16 BB AB AB AB 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 F8 65 71 0F 16 39 3F 2C 02 16 1E DB 0F 49 40 16 16 16 
        AmbShakeRot = AmbientShakeRotMag * FalloffScaling * Sin(Level.TimeSeconds * AmbientShakeRotFreq * 2 * 3.14159274);//00EB : 0F 00 70 66 71 0F 61 1F 61 1F 01 E8 66 71 0F 00 90 64 71 0F 16 BB AB AB AB 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 60 67 71 0F 16 39 3F 2C 02 16 1E DB 0F 49 40 16 16 16 
      }
    }
    CameraRotation = static.Normalize(Rotation + ShakeRot + AmbShakeRot);       //0125 : 0F 00 D8 67 71 0F 1C 90 94 6A 0F 61 3C 61 3C 01 00 84 6C 0F 01 50 68 71 0F 16 00 70 66 71 0F 16 16 
    CameraLocation = CameraLocation + Pawn.EyePosition() + Pawn.WalkBob + ShakeOffset.X * X + ShakeOffset.Y * Y + ShakeOffset.Z * Z + AmbShakeOffset;//0146 : 0F 00 C8 5E 71 0F D7 D7 D7 D7 D7 D7 00 C8 5E 71 0F 19 01 88 83 6C 0F 06 00 0C 1B 02 2B 00 00 16 16 19 01 88 83 6C 0F 05 00 0C 01 C8 68 71 0F 16 D5 36 48 C4 69 0F 01 40 69 71 0F 00 C0 61 71 0F 16 16 D5 36 C0 C4 69 0F 01 40 69 71 0F 00 38 62 71 0F 16 16 D5 36 38 C5 69 0F 01 40 69 71 0F 00 B0 62 71 0F 16 16 00 08 65 71 0F 16 
    //E5 01 00 84 6C 0F 00 C0 61 71 0F 00 38 62 71 0F 00 B0 62 71 0F 16 07 25 01 2D 01 28 63 71 0F 07 
    //58 00 82 B1 01 A0 63 71 0F 39 3F 25 16 18 1D 00 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    //01 A0 63 71 0F 16 01 18 64 71 0F 16 16 14 2D 01 28 63 71 0F 28 06 25 01 07 A8 00 B1 01 A0 63 71 
    //0F 39 3F 25 16 0F 00 90 64 71 0F AF 1E 00 00 80 3F AC AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 
    //0F 01 A0 63 71 0F 16 01 18 64 71 0F 16 16 0F 00 90 64 71 0F F6 00 90 64 71 0F 1E 00 00 00 00 1E 
    //00 00 80 3F 16 06 B3 00 0F 00 90 64 71 0F 1E 00 00 80 3F 0F 00 08 65 71 0F D4 D4 01 80 65 71 0F 
    //00 90 64 71 0F 16 BB AB AB AB 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 F8 65 71 0F 16 39 3F 
    //2C 02 16 1E DB 0F 49 40 16 16 16 0F 00 70 66 71 0F 61 1F 61 1F 01 E8 66 71 0F 00 90 64 71 0F 16 
    //BB AB AB AB 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 60 67 71 0F 16 39 3F 2C 02 16 1E DB 0F 
    //49 40 16 16 16 0F 00 D8 67 71 0F 1C 90 94 6A 0F 61 3C 61 3C 01 00 84 6C 0F 01 50 68 71 0F 16 00 
    //70 66 71 0F 16 16 0F 00 C8 5E 71 0F D7 D7 D7 D7 D7 D7 00 C8 5E 71 0F 19 01 88 83 6C 0F 06 00 0C 
    //1B 02 2B 00 00 16 16 19 01 88 83 6C 0F 05 00 0C 01 C8 68 71 0F 16 D5 36 48 C4 69 0F 01 40 69 71 
    //0F 00 C0 61 71 0F 16 16 D5 36 C0 C4 69 0F 01 40 69 71 0F 00 38 62 71 0F 16 16 D5 36 38 C5 69 0F 
    //01 40 69 71 0F 00 B0 62 71 0F 16 16 00 08 65 71 0F 16 04 0B 47 
  }


  event PlayerCalcView(out Actor ViewActor,out Vector CameraLocation,out Rotator CameraRotation) {
    local Pawn PTarget;
    if (LastPlayerCalcView == Level.TimeSeconds
      && CalcViewActor != None
      && CalcViewActor.Location == CalcViewActorLocation) {//0000 : 07 62 00 82 82 B4 01 08 70 71 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 18 09 00 77 01 80 70 71 0F 2A 16 16 18 16 00 D9 19 01 80 70 71 0F 05 00 0C 01 30 81 6C 0F 01 F8 70 71 0F 16 16 
      ViewActor = CalcViewActor;                                                //003F : 0F 00 68 6A 71 0F 01 80 70 71 0F 
      CameraLocation = CalcViewLocation;                                        //004A : 0F 00 70 71 71 0F 01 E8 71 71 0F 
      CameraRotation = CalcViewRotation;                                        //0055 : 0F 00 60 72 71 0F 01 D8 72 71 0F 
      return;                                                                   //0060 : 04 0B 
    }
    if (Pawn != None && Pawn.bSpecialCalcView
      && ViewTarget == Pawn) {    //0062 : 07 CA 00 82 82 77 01 88 83 6C 0F 2A 16 18 10 00 19 01 88 83 6C 0F 06 00 04 2D 01 50 73 71 0F 16 18 0D 00 72 01 10 83 6C 0F 01 88 83 6C 0F 16 16 
      if (Pawn.SpecialCalcView(ViewActor,CameraLocation,CameraRotation)) {      //0092 : 07 CA 00 19 01 88 83 6C 0F 15 00 04 1B 8C 12 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 
        CacheCalcView(ViewActor,CameraLocation,CameraRotation);                 //00B3 : 1B B6 2A 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 
        return;                                                                 //00C8 : 04 0B 
      }
    }
    if (ViewTarget == None || ViewTarget.bDeleteMe) {                           //00CA : 07 38 01 84 72 01 10 83 6C 0F 2A 16 18 10 00 19 01 10 83 6C 0F 06 00 04 2D 01 58 92 6C 0F 16 
      if (Pawn != None && !Pawn.bDeleteMe) {                                    //00E9 : 07 18 01 82 77 01 88 83 6C 0F 2A 16 18 12 00 81 19 01 88 83 6C 0F 06 00 04 2D 01 58 92 6C 0F 16 16 
        SetViewTarget(Pawn);                                                    //010A : 1C C8 73 71 0F 01 88 83 6C 0F 16 
      } else {                                                                  //0115 : 06 38 01 
        if (RealViewTarget != None) {                                           //0118 : 07 31 01 77 01 78 74 71 0F 2A 16 
          SetViewTarget(RealViewTarget);                                        //0123 : 1C C8 73 71 0F 01 78 74 71 0F 16 
        } else {                                                                //012E : 06 38 01 
          SetViewTarget(self);                                                  //0131 : 1C C8 73 71 0F 17 16 
        }
      }
    }
    ViewActor = ViewTarget;                                                     //0138 : 0F 00 68 6A 71 0F 01 10 83 6C 0F 
    CameraLocation = ViewTarget.Location;                                       //0143 : 0F 00 70 71 71 0F 19 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 
    if (ViewTarget == Pawn) {                                                   //0157 : 07 BE 01 72 01 10 83 6C 0F 01 88 83 6C 0F 16 
      if (bBehindView) {                                                        //0166 : 07 97 01 2D 01 A0 54 71 0F 
        CalcBehindView(CameraLocation,CameraRotation,CameraDist * Pawn.default.CollisionRadius);//016F : 1B BF 12 00 00 00 70 71 71 0F 00 60 72 71 0F AB 01 F0 74 71 0F 19 01 88 83 6C 0F 05 00 04 02 C8 89 6C 0F 16 16 
      } else {                                                                  //0194 : 06 A7 01 
        CalcFirstPersonView(CameraLocation,CameraRotation);                     //0197 : 1B C0 12 00 00 00 70 71 71 0F 00 60 72 71 0F 16 
      }
      CacheCalcView(ViewActor,CameraLocation,CameraRotation);                   //01A7 : 1B B6 2A 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 
      return;                                                                   //01BC : 04 0B 
    }
    if (ViewTarget == self) {                                                   //01BE : 07 EB 01 72 01 10 83 6C 0F 17 16 
      CameraRotation = Rotation;                                                //01C9 : 0F 00 60 72 71 0F 01 00 84 6C 0F 
      CacheCalcView(ViewActor,CameraLocation,CameraRotation);                   //01D4 : 1B B6 2A 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 
      return;                                                                   //01E9 : 04 0B 
    }
    CameraRotation = ViewTarget.Rotation;                                       //01EB : 0F 00 60 72 71 0F 19 01 10 83 6C 0F 05 00 0C 01 00 84 6C 0F 
    PTarget = Pawn(ViewTarget);                                                 //01FF : 0F 00 68 75 71 0F 2E 50 31 D4 00 01 10 83 6C 0F 
    if (PTarget != None) {                                                      //020F : 07 19 03 77 00 68 75 71 0F 2A 16 
      if (Level.NetMode == 3 || Level.NetMode != 0) {                           //021A : 07 84 02 84 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 03 16 18 17 00 9B 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 00 16 16 
        PTarget.SetViewRotation(TargetViewRotation);                            //024E : 19 00 68 75 71 0F 0B 00 00 1B 14 2B 00 00 01 E0 75 71 0F 16 
        CameraRotation = BlendedTargetViewRotation;                             //0262 : 0F 00 60 72 71 0F 01 58 76 71 0F 
        PTarget.EyeHeight = TargetEyeHeight;                                    //026D : 0F 19 00 68 75 71 0F 05 00 04 01 D0 76 71 0F 01 48 77 71 0F 
      } else {                                                                  //0281 : 06 AB 02 
        if (PTarget.IsPlayerPawn()) {                                           //0284 : 07 AB 02 19 00 68 75 71 0F 06 00 04 1B B9 0C 00 00 16 
          CameraRotation = PTarget.GetViewRotation();                           //0296 : 0F 00 60 72 71 0F 19 00 68 75 71 0F 06 00 0C 1B BC 2A 00 00 16 
        }
      }
      if (PTarget.bSpecialCalcView
        && PTarget.SpectatorSpecialCalcView(self,ViewActor,CameraLocation,CameraRotation)) {//02AB : 07 F8 02 82 19 00 68 75 71 0F 06 00 04 2D 01 50 73 71 0F 18 20 00 19 00 68 75 71 0F 16 00 04 1B A9 2B 00 00 17 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 16 
        CacheCalcView(ViewActor,CameraLocation,CameraRotation);                 //02E1 : 1B B6 2A 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 
        return;                                                                 //02F6 : 04 0B 
      }
      if (!bBehindView) {                                                       //02F8 : 07 19 03 81 2D 01 A0 54 71 0F 16 
        CameraLocation += PTarget.EyePosition();                                //0303 : DF 00 70 71 71 0F 19 00 68 75 71 0F 06 00 0C 1B 02 2B 00 00 16 16 
      }
    }
    if (bBehindView) {                                                          //0319 : 07 81 03 2D 01 A0 54 71 0F 
      CameraLocation = CameraLocation + (ViewTarget.default.CollisionHeight - ViewTarget.CollisionHeight) * vect(0.000000, 0.000000, 1.000000);//0322 : 0F 00 70 71 71 0F D7 00 70 71 71 0F D5 AF 19 01 10 83 6C 0F 05 00 04 02 40 8A 6C 0F 19 01 10 83 6C 0F 05 00 04 01 40 8A 6C 0F 16 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 
      CalcBehindView(CameraLocation,CameraRotation,CameraDist * ViewTarget.default.CollisionRadius);//035C : 1B BF 12 00 00 00 70 71 71 0F 00 60 72 71 0F AB 01 F0 74 71 0F 19 01 10 83 6C 0F 05 00 04 02 C8 89 6C 0F 16 16 
    }
    CacheCalcView(ViewActor,CameraLocation,CameraRotation);                     //0381 : 1B B6 2A 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 
    //07 62 00 82 82 B4 01 08 70 71 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 18 09 00 77 01 80 
    //70 71 0F 2A 16 16 18 16 00 D9 19 01 80 70 71 0F 05 00 0C 01 30 81 6C 0F 01 F8 70 71 0F 16 16 0F 
    //00 68 6A 71 0F 01 80 70 71 0F 0F 00 70 71 71 0F 01 E8 71 71 0F 0F 00 60 72 71 0F 01 D8 72 71 0F 
    //04 0B 07 CA 00 82 82 77 01 88 83 6C 0F 2A 16 18 10 00 19 01 88 83 6C 0F 06 00 04 2D 01 50 73 71 
    //0F 16 18 0D 00 72 01 10 83 6C 0F 01 88 83 6C 0F 16 16 07 CA 00 19 01 88 83 6C 0F 15 00 04 1B 8C 
    //12 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 1B B6 2A 00 00 00 68 6A 71 0F 00 70 71 
    //71 0F 00 60 72 71 0F 16 04 0B 07 38 01 84 72 01 10 83 6C 0F 2A 16 18 10 00 19 01 10 83 6C 0F 06 
    //00 04 2D 01 58 92 6C 0F 16 07 18 01 82 77 01 88 83 6C 0F 2A 16 18 12 00 81 19 01 88 83 6C 0F 06 
    //00 04 2D 01 58 92 6C 0F 16 16 1C C8 73 71 0F 01 88 83 6C 0F 16 06 38 01 07 31 01 77 01 78 74 71 
    //0F 2A 16 1C C8 73 71 0F 01 78 74 71 0F 16 06 38 01 1C C8 73 71 0F 17 16 0F 00 68 6A 71 0F 01 10 
    //83 6C 0F 0F 00 70 71 71 0F 19 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 07 BE 01 72 01 10 83 6C 0F 
    //01 88 83 6C 0F 16 07 97 01 2D 01 A0 54 71 0F 1B BF 12 00 00 00 70 71 71 0F 00 60 72 71 0F AB 01 
    //F0 74 71 0F 19 01 88 83 6C 0F 05 00 04 02 C8 89 6C 0F 16 16 06 A7 01 1B C0 12 00 00 00 70 71 71 
    //0F 00 60 72 71 0F 16 1B B6 2A 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 04 0B 07 EB 
    //01 72 01 10 83 6C 0F 17 16 0F 00 60 72 71 0F 01 00 84 6C 0F 1B B6 2A 00 00 00 68 6A 71 0F 00 70 
    //71 71 0F 00 60 72 71 0F 16 04 0B 0F 00 60 72 71 0F 19 01 10 83 6C 0F 05 00 0C 01 00 84 6C 0F 0F 
    //00 68 75 71 0F 2E 50 31 D4 00 01 10 83 6C 0F 07 19 03 77 00 68 75 71 0F 2A 16 07 84 02 84 9A 39 
    //3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 03 16 18 17 00 9B 39 3A 19 01 D8 7E 6C 0F 
    //05 00 01 01 50 7F 6C 0F 39 3A 24 00 16 16 19 00 68 75 71 0F 0B 00 00 1B 14 2B 00 00 01 E0 75 71 
    //0F 16 0F 00 60 72 71 0F 01 58 76 71 0F 0F 19 00 68 75 71 0F 05 00 04 01 D0 76 71 0F 01 48 77 71 
    //0F 06 AB 02 07 AB 02 19 00 68 75 71 0F 06 00 04 1B B9 0C 00 00 16 0F 00 60 72 71 0F 19 00 68 75 
    //71 0F 06 00 0C 1B BC 2A 00 00 16 07 F8 02 82 19 00 68 75 71 0F 06 00 04 2D 01 50 73 71 0F 18 20 
    //00 19 00 68 75 71 0F 16 00 04 1B A9 2B 00 00 17 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 
    //16 1B B6 2A 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 04 0B 07 19 03 81 2D 01 A0 54 
    //71 0F 16 DF 00 70 71 71 0F 19 00 68 75 71 0F 06 00 0C 1B 02 2B 00 00 16 16 07 81 03 2D 01 A0 54 
    //71 0F 0F 00 70 71 71 0F D7 00 70 71 71 0F D5 AF 19 01 10 83 6C 0F 05 00 04 02 40 8A 6C 0F 19 01 
    //10 83 6C 0F 05 00 04 01 40 8A 6C 0F 16 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 1B BF 12 00 
    //00 00 70 71 71 0F 00 60 72 71 0F AB 01 F0 74 71 0F 19 01 10 83 6C 0F 05 00 04 02 C8 89 6C 0F 16 
    //16 1B B6 2A 00 00 00 68 6A 71 0F 00 70 71 71 0F 00 60 72 71 0F 16 04 0B 47 
  }


  function CacheCalcView(Actor ViewActor,Vector CameraLocation,Rotator CameraRotation) {
    CalcViewActor = ViewActor;                                                  //0000 : 0F 01 80 70 71 0F 00 70 78 71 0F 
    if (ViewActor != None) {                                                    //000B : 07 2A 00 77 00 70 78 71 0F 2A 16 
      CalcViewActorLocation = ViewActor.Location;                               //0016 : 0F 01 F8 70 71 0F 19 00 70 78 71 0F 05 00 0C 01 30 81 6C 0F 
    }
    CalcViewLocation = CameraLocation;                                          //002A : 0F 01 E8 71 71 0F 00 E8 78 71 0F 
    CalcViewRotation = CameraRotation;                                          //0035 : 0F 01 D8 72 71 0F 00 60 79 71 0F 
    LastPlayerCalcView = Level.TimeSeconds;                                     //0040 : 0F 01 08 70 71 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    //0F 01 80 70 71 0F 00 70 78 71 0F 07 2A 00 77 00 70 78 71 0F 2A 16 0F 01 F8 70 71 0F 19 00 70 78 
    //71 0F 05 00 0C 01 30 81 6C 0F 0F 01 E8 71 71 0F 00 E8 78 71 0F 0F 01 D8 72 71 0F 00 60 79 71 0F 
    //0F 01 08 70 71 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 04 0B 47 
  }


  simulated function Rotator GetViewRotation() {
    if (bBehindView && Pawn != None) {                                          //0000 : 07 25 00 82 2D 01 A0 54 71 0F 18 09 00 77 01 88 83 6C 0F 2A 16 16 
      return Pawn.Rotation;                                                     //0016 : 04 19 01 88 83 6C 0F 05 00 0C 01 00 84 6C 0F 
    }
    return Rotation;                                                            //0025 : 04 01 00 84 6C 0F 
    //07 25 00 82 2D 01 A0 54 71 0F 18 09 00 77 01 88 83 6C 0F 2A 16 16 04 19 01 88 83 6C 0F 05 00 0C 
    //01 00 84 6C 0F 04 01 00 84 6C 0F 04 0B 47 
  }


  function RemoveAllCameraEffects() {
    while (CameraEffects.Length > 0) {                                          //0000 : 07 17 00 97 37 01 00 7C 71 0F 25 16 
      CameraEffects.Remove(0,1);                                                //000C : 41 01 00 7C 71 0F 25 26 
    }
    //07 17 00 97 37 01 00 7C 71 0F 25 16 41 01 00 7C 71 0F 25 26 06 00 00 04 0B 47 
  }


  function CreateCameraEffect(class<CameraEffect> EffectClass) {
    local CameraEffect effect;
    effect = new EffectClass;                                                   //0000 : 0F 00 90 7D 71 0F 11 0B 0B 0B 00 78 33 36 0F 
    if (effect == None) {                                                       //000F : 07 1D 00 72 00 90 7D 71 0F 2A 16 
    } else {                                                                    //001A : 06 29 00 
      AddCameraEffect(effect,True);                                             //001D : 1B E7 2B 00 00 00 90 7D 71 0F 27 16 
    }
    //0F 00 90 7D 71 0F 11 0B 0B 0B 00 78 33 36 0F 07 1D 00 72 00 90 7D 71 0F 2A 16 06 29 00 1B E7 2B 
    //00 00 00 90 7D 71 0F 27 16 04 0B 47 
  }


  event RemoveCameraEffect(CameraEffect ExEffect) {
    local int EffectIndex;
    EffectIndex = 0;                                                            //0000 : 0F 00 50 D4 71 0F 25 
    while (EffectIndex < CameraEffects.Length) {                                //0007 : 07 56 00 96 00 50 D4 71 0F 37 01 00 7C 71 0F 16 
      if (CameraEffects[EffectIndex].Class == ExEffect.Class) {                 //0017 : 07 4C 00 72 19 10 00 50 D4 71 0F 01 00 7C 71 0F 05 00 04 01 68 E5 6B 0F 19 00 30 D3 71 0F 05 00 04 01 68 E5 6B 0F 16 
        CameraEffects.Remove(EffectIndex,1);                                    //003E : 41 01 00 7C 71 0F 00 50 D4 71 0F 26 
        return;                                                                 //004A : 04 0B 
      }
      EffectIndex++;                                                            //004C : A5 00 50 D4 71 0F 16 
    }
    //0F 00 50 D4 71 0F 25 07 56 00 96 00 50 D4 71 0F 37 01 00 7C 71 0F 16 07 4C 00 72 19 10 00 50 D4 
    //71 0F 01 00 7C 71 0F 05 00 04 01 68 E5 6B 0F 19 00 30 D3 71 0F 05 00 04 01 68 E5 6B 0F 16 41 01 
    //00 7C 71 0F 00 50 D4 71 0F 26 04 0B A5 00 50 D4 71 0F 16 06 07 00 04 0B 47 
  }


  event AddCameraEffect(CameraEffect NewEffect,optional bool RemoveExisting) {
    if (NewEffect == None) {                                                    //0000 : 07 0D 00 72 00 78 D5 71 0F 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    if (RemoveExisting) {                                                       //000D : 07 21 00 2D 00 F0 D5 71 0F 
      RemoveCameraEffect(NewEffect);                                            //0016 : 1B 8B 2B 00 00 00 78 D5 71 0F 16 
    }
    CameraEffects.Length = CameraEffects.Length + 1;                            //0021 : 0F 37 01 00 7C 71 0F 92 37 01 00 7C 71 0F 26 16 
    CameraEffects[CameraEffects.Length - 1] = NewEffect;                        //0031 : 0F 10 93 37 01 00 7C 71 0F 26 16 01 00 7C 71 0F 00 78 D5 71 0F 
    //07 0D 00 72 00 78 D5 71 0F 2A 16 04 0B 07 21 00 2D 00 F0 D5 71 0F 1B 8B 2B 00 00 00 78 D5 71 0F 
    //16 0F 37 01 00 7C 71 0F 92 37 01 00 7C 71 0F 26 16 0F 10 93 37 01 00 7C 71 0F 26 16 01 00 7C 71 
    //0F 00 78 D5 71 0F 04 0B 47 
  }


  function CalcBehindView(out Vector CameraLocation,out Rotator CameraRotation,float dist) {
    local Vector View;
    local Vector HitLocation;
    local Vector HitNormal;
    local float ViewDist;
    local float RealDist;
    local Vector globalX;
    local Vector globalY;
    local Vector globalZ;
    local Vector localX;
    local Vector localY;
    local Vector localZ;
    CameraRotation = Rotation;                                                  //0000 : 0F 00 90 D7 71 0F 01 00 84 6C 0F 
    CameraRotation.Roll = 0;                                                    //000B : 0F 36 98 BF 69 0F 00 90 D7 71 0F 25 
    CameraRotation.Yaw += CameraDeltaYaw;                                       //0017 : A1 36 20 BF 69 0F 00 90 D7 71 0F 39 44 01 18 55 71 0F 16 
    View = vect(1.000000, 0.000000, 0.000000) >> CameraRotation;                //002A : 0F 00 08 D8 71 0F 61 14 23 00 00 80 3F 00 00 00 00 00 00 00 00 00 90 D7 71 0F 16 
    RealDist = dist;                                                            //0045 : 0F 00 80 D8 71 0F 00 F8 D8 71 0F 
    dist += CameraDeltaRad;                                                     //0050 : B8 00 F8 D8 71 0F 01 70 D9 71 0F 16 
    if (Trace(HitLocation,HitNormal,CameraLocation - dist * vector(CameraRotation),CameraLocation,False,vect(16.000000, 16.000000, 16.000000)) != None) {//005C : 07 BA 00 77 61 15 00 E8 D9 71 0F 00 60 DA 71 0F D8 00 18 D7 71 0F D5 00 F8 D8 71 0F 39 39 00 90 D7 71 0F 16 16 00 18 D7 71 0F 28 23 00 00 80 41 00 00 80 41 00 00 80 41 16 2A 16 
      ViewDist = FMin((CameraLocation - HitLocation) Dot View,dist);            //0097 : 0F 00 D8 DA 71 0F F4 DB D8 00 18 D7 71 0F 00 E8 D9 71 0F 16 00 08 D8 71 0F 16 00 F8 D8 71 0F 16 
    } else {                                                                    //00B7 : 06 C5 00 
      ViewDist = dist;                                                          //00BA : 0F 00 D8 DA 71 0F 00 F8 D8 71 0F 
    }
    if (!bBlockCloseCamera || !bValidBehindCamera
      || ViewDist > 16 + FMax(ViewTarget.CollisionRadius,ViewTarget.CollisionHeight)) {//00C5 : 07 3C 01 84 84 81 2D 01 50 DB 71 0F 16 18 09 00 81 2D 01 C8 DB 71 0F 16 16 18 2C 00 B1 00 D8 DA 71 0F AE 39 3F 2C 10 F5 19 01 10 83 6C 0F 05 00 04 01 C8 89 6C 0F 19 01 10 83 6C 0F 05 00 04 01 40 8A 6C 0F 16 16 16 16 
      bValidBehindCamera = True;                                                //010D : 14 2D 01 C8 DB 71 0F 27 
      OldCameraLoc = CameraLocation - ViewDist * View;                          //0115 : 0F 01 40 DC 71 0F D8 00 18 D7 71 0F D5 00 D8 DA 71 0F 00 08 D8 71 0F 16 16 
      OldCameraRot = CameraRotation;                                            //012E : 0F 01 B8 DC 71 0F 00 90 D7 71 0F 
    } else {                                                                    //0139 : 06 47 01 
      SetRotation(OldCameraRot);                                                //013C : 1C 70 01 6E 0F 01 B8 DC 71 0F 16 
    }
    CameraLocation = OldCameraLoc + Pawn.EyePosition();                         //0147 : 0F 00 18 D7 71 0F D7 01 40 DC 71 0F 19 01 88 83 6C 0F 06 00 0C 1B 02 2B 00 00 16 16 
    CameraRotation = OldCameraRot;                                              //0163 : 0F 00 90 D7 71 0F 01 B8 DC 71 0F 
    CameraRotation.Pitch += CameraTiltAngle;                                    //016E : A1 36 A8 BE 69 0F 00 90 D7 71 0F 39 44 01 30 DD 71 0F 16 
    GetAxes(CameraSwivel,globalX,globalY,globalZ);                              //0181 : E5 01 A8 DD 71 0F 00 20 DE 71 0F 00 98 DE 71 0F 00 10 DF 71 0F 16 
    localX = globalX >> CameraRotation;                                         //0197 : 0F 00 88 DF 71 0F 61 14 00 20 DE 71 0F 00 90 D7 71 0F 16 
    localY = globalY >> CameraRotation;                                         //01AA : 0F 00 40 4A 6D 0F 61 14 00 98 DE 71 0F 00 90 D7 71 0F 16 
    localZ = globalZ >> CameraRotation;                                         //01BD : 0F 00 B8 4A 6D 0F 61 14 00 10 DF 71 0F 00 90 D7 71 0F 16 
    CameraRotation = static.OrthoRotation(localX,localY,localZ);                //01D0 : 0F 00 90 D7 71 0F 1C E0 96 6A 0F 00 88 DF 71 0F 00 40 4A 6D 0F 00 B8 4A 6D 0F 16 
    //0F 00 90 D7 71 0F 01 00 84 6C 0F 0F 36 98 BF 69 0F 00 90 D7 71 0F 25 A1 36 20 BF 69 0F 00 90 D7 
    //71 0F 39 44 01 18 55 71 0F 16 0F 00 08 D8 71 0F 61 14 23 00 00 80 3F 00 00 00 00 00 00 00 00 00 
    //90 D7 71 0F 16 0F 00 80 D8 71 0F 00 F8 D8 71 0F B8 00 F8 D8 71 0F 01 70 D9 71 0F 16 07 BA 00 77 
    //61 15 00 E8 D9 71 0F 00 60 DA 71 0F D8 00 18 D7 71 0F D5 00 F8 D8 71 0F 39 39 00 90 D7 71 0F 16 
    //16 00 18 D7 71 0F 28 23 00 00 80 41 00 00 80 41 00 00 80 41 16 2A 16 0F 00 D8 DA 71 0F F4 DB D8 
    //00 18 D7 71 0F 00 E8 D9 71 0F 16 00 08 D8 71 0F 16 00 F8 D8 71 0F 16 06 C5 00 0F 00 D8 DA 71 0F 
    //00 F8 D8 71 0F 07 3C 01 84 84 81 2D 01 50 DB 71 0F 16 18 09 00 81 2D 01 C8 DB 71 0F 16 16 18 2C 
    //00 B1 00 D8 DA 71 0F AE 39 3F 2C 10 F5 19 01 10 83 6C 0F 05 00 04 01 C8 89 6C 0F 19 01 10 83 6C 
    //0F 05 00 04 01 40 8A 6C 0F 16 16 16 16 14 2D 01 C8 DB 71 0F 27 0F 01 40 DC 71 0F D8 00 18 D7 71 
    //0F D5 00 D8 DA 71 0F 00 08 D8 71 0F 16 16 0F 01 B8 DC 71 0F 00 90 D7 71 0F 06 47 01 1C 70 01 6E 
    //0F 01 B8 DC 71 0F 16 0F 00 18 D7 71 0F D7 01 40 DC 71 0F 19 01 88 83 6C 0F 06 00 0C 1B 02 2B 00 
    //00 16 16 0F 00 90 D7 71 0F 01 B8 DC 71 0F A1 36 A8 BE 69 0F 00 90 D7 71 0F 39 44 01 30 DD 71 0F 
    //16 E5 01 A8 DD 71 0F 00 20 DE 71 0F 00 98 DE 71 0F 00 10 DF 71 0F 16 0F 00 88 DF 71 0F 61 14 00 
    //20 DE 71 0F 00 90 D7 71 0F 16 0F 00 40 4A 6D 0F 61 14 00 98 DE 71 0F 00 90 D7 71 0F 16 0F 00 B8 
    //4A 6D 0F 61 14 00 10 DF 71 0F 00 90 D7 71 0F 16 0F 00 90 D7 71 0F 1C E0 96 6A 0F 00 88 DF 71 0F 
    //00 40 4A 6D 0F 00 B8 4A 6D 0F 16 04 0B 47 
  }


  function bool NotifyLanded(Vector HitNormal) {
    return bUpdating;                                                           //0000 : 04 2D 01 58 4C 6D 0F 
    //04 2D 01 58 4C 6D 0F 04 0B 47 
  }


  simulated function ClientSetHUD(class<HUD> newHUDClass) {
    //04 0B 47 
  }


  function BehindView(bool B) {
    ClientSetBehindView(B);                                                     //0000 : 1B 39 2C 00 00 2D 00 60 0B 38 0F 16 
    bBehindView = B;                                                            //000C : 14 2D 01 A0 54 71 0F 2D 00 60 0B 38 0F 
    //1B 39 2C 00 00 2D 00 60 0B 38 0F 16 14 2D 01 A0 54 71 0F 2D 00 60 0B 38 0F 04 0B 47 
  }


  function EnterStartState() {
    local name newState;
    if (Pawn.PhysicsVolume.bWaterVolume) {                                      //0000 : 07 6A 00 19 19 01 88 83 6C 0F 05 00 04 01 38 94 6C 0F 06 00 04 2D 01 70 04 6F 0F 
      if (Pawn.HeadVolume.bWaterVolume) {                                       //001B : 07 53 00 19 19 01 88 83 6C 0F 05 00 04 01 50 0D 38 0F 06 00 04 2D 01 70 04 6F 0F 
        Pawn.BreathTime = Pawn.UnderWaterTime;                                  //0036 : 0F 19 01 88 83 6C 0F 05 00 04 01 C8 0D 38 0F 19 01 88 83 6C 0F 05 00 04 01 40 0E 38 0F 
      }
      newState = Pawn.WaterMovementState;                                       //0053 : 0F 00 D8 0C 38 0F 19 01 88 83 6C 0F 05 00 04 01 F8 4F 71 0F 
    } else {                                                                    //0067 : 06 7E 00 
      newState = Pawn.LandMovementState;                                        //006A : 0F 00 D8 0C 38 0F 19 01 88 83 6C 0F 05 00 04 01 B8 0E 38 0F 
    }
    if (IsInState(newState)) {                                                  //007E : 07 92 00 61 19 00 D8 0C 38 0F 16 
      BeginState();                                                             //0089 : 1B 3C 01 00 00 16 
    } else {                                                                    //008F : 06 99 00 
      GotoState(newState);                                                      //0092 : 71 00 D8 0C 38 0F 16 
    }
    //07 6A 00 19 19 01 88 83 6C 0F 05 00 04 01 38 94 6C 0F 06 00 04 2D 01 70 04 6F 0F 07 53 00 19 19 
    //01 88 83 6C 0F 05 00 04 01 50 0D 38 0F 06 00 04 2D 01 70 04 6F 0F 0F 19 01 88 83 6C 0F 05 00 04 
    //01 C8 0D 38 0F 19 01 88 83 6C 0F 05 00 04 01 40 0E 38 0F 0F 00 D8 0C 38 0F 19 01 88 83 6C 0F 05 
    //00 04 01 F8 4F 71 0F 06 7E 00 0F 00 D8 0C 38 0F 19 01 88 83 6C 0F 05 00 04 01 B8 0E 38 0F 07 92 
    //00 61 19 00 D8 0C 38 0F 16 1B 3C 01 00 00 16 06 99 00 71 00 D8 0C 38 0F 16 04 0B 47 
  }


  function Typing(bool bTyping) {
    bIsTyping = bTyping;                                                        //0000 : 14 2D 01 F0 4E 6D 0F 2D 00 78 4E 6D 0F 
    if (Pawn != None && !Pawn.bTearOff) {                                       //000D : 07 44 00 82 77 01 88 83 6C 0F 2A 16 18 12 00 81 19 01 88 83 6C 0F 06 00 04 2D 01 48 93 6C 0F 16 16 
      Pawn.bIsTyping = bIsTyping;                                               //002E : 14 19 01 88 83 6C 0F 06 00 04 2D 01 68 4F 6D 0F 2D 01 F0 4E 6D 0F 
    }
    //14 2D 01 F0 4E 6D 0F 2D 00 78 4E 6D 0F 07 44 00 82 77 01 88 83 6C 0F 2A 16 18 12 00 81 19 01 88 
    //83 6C 0F 06 00 04 2D 01 48 93 6C 0F 16 16 14 19 01 88 83 6C 0F 06 00 04 2D 01 68 4F 6D 0F 2D 01 
    //F0 4E 6D 0F 04 0B 47 
  }


  function DamageAttitudeTo(Pawn Other,float Damage) {
    if (Other != None && Other != Pawn && Damage > 0) {                         //0000 : 07 36 00 82 82 77 00 90 50 6D 0F 2A 16 18 0D 00 77 00 90 50 6D 0F 01 88 83 6C 0F 16 16 18 0B 00 B1 00 80 51 6D 0F 39 3F 25 16 16 
      Enemy = Other;                                                            //002B : 0F 01 90 AF 70 0F 00 90 50 6D 0F 
    }
    //07 36 00 82 82 77 00 90 50 6D 0F 2A 16 18 0D 00 77 00 90 50 6D 0F 01 88 83 6C 0F 16 16 18 0B 00 
    //B1 00 80 51 6D 0F 39 3F 25 16 16 0F 01 90 AF 70 0F 00 90 50 6D 0F 04 0B 47 
  }


  function ClientAdjustGlow(float Scale,Vector fog) {
    ConstantGlowScale += Scale;                                                 //0000 : B8 01 78 53 6D 0F 00 A8 52 6D 0F 16 
    ConstantGlowFog += 0.00100000 * fog;                                        //000C : DF 01 F0 53 6D 0F D5 1E 6F 12 83 3A 00 68 54 6D 0F 16 16 
    //B8 01 78 53 6D 0F 00 A8 52 6D 0F 16 DF 01 F0 53 6D 0F D5 1E 6F 12 83 3A 00 68 54 6D 0F 16 16 04 
    //0B 47 
  }


  function ClientFlash(float Scale,Vector fog) {
    FlashScale = (Scale + (1 - ScreenFlashScaling) * (1 - Scale)) * vect(1.000000, 1.000000, 1.000000);//0000 : 0F 01 08 56 6D 0F D5 AE 00 90 55 6D 0F AB AF 39 3F 26 01 80 56 6D 0F 16 AF 39 3F 26 00 90 55 6D 0F 16 16 16 23 00 00 80 3F 00 00 80 3F 00 00 80 3F 16 
    FlashFog = ScreenFlashScaling * 0.00100000 * fog;                           //0032 : 0F 01 F8 56 6D 0F D5 AB 01 80 56 6D 0F 1E 6F 12 83 3A 16 00 70 57 6D 0F 16 
    //0F 01 08 56 6D 0F D5 AE 00 90 55 6D 0F AB AF 39 3F 26 01 80 56 6D 0F 16 AF 39 3F 26 00 90 55 6D 
    //0F 16 16 16 23 00 00 80 3F 00 00 80 3F 00 00 80 3F 16 0F 01 F8 56 6D 0F D5 AB 01 80 56 6D 0F 1E 
    //6F 12 83 3A 16 00 70 57 6D 0F 16 04 0B 47 
  }


  function SetFOVAngle(float newFOV) {
    FovAngle = newFOV;                                                          //0000 : 0F 01 10 E4 70 0F 00 98 58 6D 0F 
    //0F 01 10 E4 70 0F 00 98 58 6D 0F 04 0B 47 
  }


  function HandleWalking() {
    if (Pawn != None) {                                                         //0000 : 07 41 00 77 01 88 83 6C 0F 2A 16 
      Pawn.SetWalking(bRun != 0
        && !Region.Zone.IsA('WarpZoneInfo'));   //000B : 19 01 88 83 6C 0F 2D 00 00 1B 9B 2B 00 00 82 9B 39 3A 01 38 F2 70 0F 25 16 18 19 00 81 19 36 58 43 6E 0F 01 70 8A 6E 0F 08 00 04 61 2F 21 B1 0B 00 00 16 16 16 16 
    }
    //07 41 00 77 01 88 83 6C 0F 2A 16 19 01 88 83 6C 0F 2D 00 00 1B 9B 2B 00 00 82 9B 39 3A 01 38 F2 
    //70 0F 25 16 18 19 00 81 19 36 58 43 6E 0F 01 70 8A 6E 0F 08 00 04 61 2F 21 B1 0B 00 00 16 16 16 
    //16 04 0B 47 
  }


  function int CompressAccel(int C) {
    if (C >= 0) {                                                               //0000 : 07 1D 00 99 00 70 5A 6D 0F 25 16 
      C = Min(C,127);                                                           //000B : 0F 00 70 5A 6D 0F F9 00 70 5A 6D 0F 2C 7F 16 
    } else {                                                                    //001A : 06 36 00 
      C = Min(Abs(C),127) + 128;                                                //001D : 0F 00 70 5A 6D 0F 92 F9 39 44 BA 39 3F 00 70 5A 6D 0F 16 2C 7F 16 2C 80 16 
    }
    return C;                                                                   //0036 : 04 00 70 5A 6D 0F 
    //07 1D 00 99 00 70 5A 6D 0F 25 16 0F 00 70 5A 6D 0F F9 00 70 5A 6D 0F 2C 7F 16 06 36 00 0F 00 70 
    //5A 6D 0F 92 F9 39 44 BA 39 3F 00 70 5A 6D 0F 16 2C 7F 16 2C 80 16 04 00 70 5A 6D 0F 04 0B 47 
  }


  function int DetermineMaxPitchMultiplier() {
    if (Pawn.Physics == 3 || Pawn.Physics == 4) {                               //0000 : 07 37 00 84 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 03 16 18 17 00 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 04 16 16 
      return 2;                                                                 //0034 : 04 2C 02 
    }
    return 0;                                                                   //0037 : 04 25 
    //07 37 00 84 9A 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 03 16 18 17 00 9A 39 3A 
    //19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 04 16 16 04 2C 02 04 25 04 0B 47 
  }


  function ForceDeathUpdate() {
    lastUpdateTime = Level.TimeSeconds - 10;                                    //0000 : 0F 01 38 5E 6D 0F AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 39 3F 2C 0A 16 
    //0F 01 38 5E 6D 0F AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 39 3F 2C 0A 16 04 0B 47 
  }


  function ClientSetBehindView(bool B) {
    local bool bWasBehindView;
    bWasBehindView = bBehindView;                                               //0000 : 14 2D 00 58 60 6D 0F 2D 01 A0 54 71 0F 
    bBehindView = B;                                                            //000D : 14 2D 01 A0 54 71 0F 2D 00 60 5F 6D 0F 
    if (bBehindView != bWasBehindView) {                                        //001A : 07 3C 00 F3 2D 01 A0 54 71 0F 2D 00 58 60 6D 0F 16 
      ViewTarget.POVChanged(self,True);                                         //002B : 19 01 10 83 6C 0F 08 00 00 1B 2C 2B 00 00 17 27 16 
    }
    //14 2D 00 58 60 6D 0F 2D 01 A0 54 71 0F 14 2D 01 A0 54 71 0F 2D 00 60 5F 6D 0F 07 3C 00 F3 2D 01 
    //A0 54 71 0F 2D 00 58 60 6D 0F 16 19 01 10 83 6C 0F 08 00 00 1B 2C 2B 00 00 17 27 16 04 0B 47 
  }


  function ClientSetFixedCamera(bool B) {
    bFixedCamera = B;                                                           //0000 : 14 2D 01 38 62 6D 0F 2D 00 80 61 6D 0F 
    //14 2D 01 38 62 6D 0F 2D 00 80 61 6D 0F 04 0B 47 
  }


  event bool IsDead() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function SetMouseAccel(float F) {
    PlayerInput.UpdateAccel(F);                                                 //0000 : 19 01 30 20 71 0F 0B 00 00 1B D7 2B 00 00 00 B8 64 6D 0F 16 
    //19 01 30 20 71 0F 0B 00 00 1B D7 2B 00 00 00 B8 64 6D 0F 16 04 0B 47 
  }


  function SetMouseSmoothing(int Mode) {
    PlayerInput.UpdateSmoothing(Mode);                                          //0000 : 19 01 30 20 71 0F 0B 00 00 1B D2 2B 00 00 00 28 66 6D 0F 16 
    //19 01 30 20 71 0F 0B 00 00 1B D2 2B 00 00 00 28 66 6D 0F 16 04 0B 47 
  }


  function SetSensitivity(float F) {
    PlayerInput.UpdateSensitivity(F);                                           //0000 : 19 01 30 20 71 0F 0B 00 00 1B D8 2B 00 00 00 98 67 6D 0F 16 
    //19 01 30 20 71 0F 0B 00 00 1B D8 2B 00 00 00 98 67 6D 0F 16 04 0B 47 
  }


  simulated function FixFOV() {
    FovAngle = default.DefaultFOV;                                              //0000 : 0F 01 10 E4 70 0F 02 68 69 6D 0F 
    DesiredFOV = default.DefaultFOV;                                            //000B : 0F 01 E0 69 6D 0F 02 68 69 6D 0F 
    DefaultFOV = default.DefaultFOV;                                            //0016 : 0F 01 68 69 6D 0F 02 68 69 6D 0F 
    //0F 01 10 E4 70 0F 02 68 69 6D 0F 0F 01 E0 69 6D 0F 02 68 69 6D 0F 0F 01 68 69 6D 0F 02 68 69 6D 
    //0F 04 0B 47 
  }


  function EndZoom() {
    if (DesiredFOV != DefaultFOV) {                                             //0000 : 07 1E 00 B5 01 E0 69 6D 0F 01 68 69 6D 0F 16 
      myHUD.FadeZoom();                                                         //000F : 19 01 78 6B 6D 0F 06 00 00 1B 7E 2B 00 00 16 
    }
    bZooming = False;                                                           //001E : 14 2D 01 F0 6B 6D 0F 28 
    DesiredFOV = DefaultFOV;                                                    //0026 : 0F 01 E0 69 6D 0F 01 68 69 6D 0F 
    //07 1E 00 B5 01 E0 69 6D 0F 01 68 69 6D 0F 16 19 01 78 6B 6D 0F 06 00 00 1B 7E 2B 00 00 16 14 2D 
    //01 F0 6B 6D 0F 28 0F 01 E0 69 6D 0F 01 68 69 6D 0F 04 0B 47 
  }


  function StopZoom() {
    bZooming = False;                                                           //0000 : 14 2D 01 F0 6B 6D 0F 28 
    //14 2D 01 F0 6B 6D 0F 28 04 0B 47 
  }


  function StartZoom() {
    StartZoomWithMax(0.89999998);                                               //0000 : 1B 5A 2B 00 00 1E 66 66 66 3F 16 
    //1B 5A 2B 00 00 1E 66 66 66 3F 16 04 0B 47 
  }


  function ToggleZoom() {
    //04 0B 47 
  }


  function StartZoomWithMax(float MaxZoomLevel) {
    DesiredZoomLevel = MaxZoomLevel;                                            //0000 : 0F 01 B8 70 6D 0F 00 D0 6F 6D 0F 
    myHUD.FadeZoom();                                                           //000B : 19 01 78 6B 6D 0F 06 00 00 1B 7E 2B 00 00 16 
    ZoomLevel = 0.00000000;                                                     //001A : 0F 01 30 71 6D 0F 1E 00 00 00 00 
    bZooming = True;                                                            //0025 : 14 2D 01 F0 6B 6D 0F 27 
    //0F 01 B8 70 6D 0F 00 D0 6F 6D 0F 19 01 78 6B 6D 0F 06 00 00 1B 7E 2B 00 00 16 0F 01 30 71 6D 0F 
    //1E 00 00 00 00 14 2D 01 F0 6B 6D 0F 27 04 0B 47 
  }


  function ToggleZoomWithMax(float MaxZoomLevel) {
    if (DefaultFOV != DesiredFOV) {                                             //0000 : 07 18 00 B5 01 68 69 6D 0F 01 E0 69 6D 0F 16 
      EndZoom();                                                                //000F : 1B 6D 2C 00 00 16 
    } else {                                                                    //0015 : 06 23 00 
      StartZoomWithMax(MaxZoomLevel);                                           //0018 : 1B 5A 2B 00 00 00 58 72 6D 0F 16 
    }
    //07 18 00 B5 01 68 69 6D 0F 01 E0 69 6D 0F 16 1B 6D 2C 00 00 16 06 23 00 1B 5A 2B 00 00 00 58 72 
    //6D 0F 16 04 0B 47 
  }


  function ClientSetInitialMusic(string NewSong,byte NewTransition) {
    local string SongName;
    if (Song != "") {                                                           //0000 : 07 0E 00 7B 01 20 75 6D 0F 1F 00 16 
      return;                                                                   //000C : 04 0B 
    }
    SongName = NewSong;                                                         //000E : 0F 00 98 75 6D 0F 00 E0 73 6D 0F 
    if (Player != None && Player.Console != None) {                             //0019 : 07 5D 00 82 77 01 28 25 71 0F 2A 16 18 12 00 77 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 2A 16 16 
      SongName = Player.Console.SetInitialMusic(NewSong);                       //003A : 0F 00 98 75 6D 0F 19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 0B 00 00 1B C4 2B 00 00 00 E0 73 6D 0F 16 
    }
    ClientSetMusic(SongName,NewTransition);                                     //005D : 1B 74 2C 00 00 00 98 75 6D 0F 00 88 76 6D 0F 16 
    //07 0E 00 7B 01 20 75 6D 0F 1F 00 16 04 0B 0F 00 98 75 6D 0F 00 E0 73 6D 0F 07 5D 00 82 77 01 28 
    //25 71 0F 2A 16 18 12 00 77 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 2A 16 16 0F 00 98 75 6D 0F 
    //19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 0B 00 00 1B C4 2B 00 00 00 E0 73 6D 0F 16 1B 74 2C 
    //00 00 00 98 75 6D 0F 00 88 76 6D 0F 16 04 0B 47 
  }


  function ClientSetMusic(string NewSong,byte NewTransition) {
    local float FadeIn;
    local float FadeOut;
    switch (NewTransition) {                                                    //0000 : 05 01 00 B0 79 6D 0F 
      case 2 :                                                                  //0007 : 0A 25 00 24 02 
        FadeIn = 7.00000000;                                                    //000C : 0F 00 28 7A 6D 0F 1E 00 00 E0 40 
        FadeOut = 3.00000000;                                                   //0017 : 0F 00 A0 7A 6D 0F 1E 00 00 40 40 
        break;                                                                  //0022 : 06 82 00 
      case 3 :                                                                  //0025 : 0A 43 00 24 03 
        FadeIn = 3.00000000;                                                    //002A : 0F 00 28 7A 6D 0F 1E 00 00 40 40 
        FadeOut = 3.00000000;                                                   //0035 : 0F 00 A0 7A 6D 0F 1E 00 00 40 40 
        break;                                                                  //0040 : 06 82 00 
      case 4 :                                                                  //0043 : 0A 61 00 24 04 
        FadeIn = 1.00000000;                                                    //0048 : 0F 00 28 7A 6D 0F 1E 00 00 80 3F 
        FadeOut = 1.00000000;                                                   //0053 : 0F 00 A0 7A 6D 0F 1E 00 00 80 3F 
        break;                                                                  //005E : 06 82 00 
      case 5 :                                                                  //0061 : 0A 7F 00 24 05 
        FadeIn = 5.00000000;                                                    //0066 : 0F 00 28 7A 6D 0F 1E 00 00 A0 40 
        FadeOut = 5.00000000;                                                   //0071 : 0F 00 A0 7A 6D 0F 1E 00 00 A0 40 
        break;                                                                  //007C : 06 82 00 
      default:                                                                  //007F : 0A FF FF 
    }
    StopAllMusic(FadeOut);                                                      //0082 : 1C 40 8E 6D 0F 00 A0 7A 6D 0F 16 
    if (NewSong != "") {                                                        //008D : 07 A9 00 7B 00 B0 77 6D 0F 1F 00 16 
      PlayMusic(NewSong,FadeIn);                                                //0099 : 1C 68 78 6B 0F 00 B0 77 6D 0F 00 28 7A 6D 0F 16 
    }
    Song = NewSong;                                                             //00A9 : 0F 01 20 75 6D 0F 00 B0 77 6D 0F 
    Transition = NewTransition;                                                 //00B4 : 0F 01 18 7B 6D 0F 00 B0 79 6D 0F 
    if (Player != None && Player.Console != None) {                             //00BF : 07 FD 00 82 77 01 28 25 71 0F 2A 16 18 12 00 77 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 2A 16 16 
      Player.Console.SetMusic(NewSong);                                         //00E0 : 19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 0B 00 00 1B C5 2B 00 00 00 B0 77 6D 0F 16 
    }
    //05 01 00 B0 79 6D 0F 0A 25 00 24 02 0F 00 28 7A 6D 0F 1E 00 00 E0 40 0F 00 A0 7A 6D 0F 1E 00 00 
    //40 40 06 82 00 0A 43 00 24 03 0F 00 28 7A 6D 0F 1E 00 00 40 40 0F 00 A0 7A 6D 0F 1E 00 00 40 40 
    //06 82 00 0A 61 00 24 04 0F 00 28 7A 6D 0F 1E 00 00 80 3F 0F 00 A0 7A 6D 0F 1E 00 00 80 3F 06 82 
    //00 0A 7F 00 24 05 0F 00 28 7A 6D 0F 1E 00 00 A0 40 0F 00 A0 7A 6D 0F 1E 00 00 A0 40 06 82 00 0A 
    //FF FF 1C 40 8E 6D 0F 00 A0 7A 6D 0F 16 07 A9 00 7B 00 B0 77 6D 0F 1F 00 16 1C 68 78 6B 0F 00 B0 
    //77 6D 0F 00 28 7A 6D 0F 16 0F 01 20 75 6D 0F 00 B0 77 6D 0F 0F 01 18 7B 6D 0F 00 B0 79 6D 0F 07 
    //FD 00 82 77 01 28 25 71 0F 2A 16 18 12 00 77 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 2A 16 16 
    //19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 0B 00 00 1B C5 2B 00 00 00 B0 77 6D 0F 16 04 0B 47 
    //
  }


  simulated event Destroyed() {
    if (Pawn != None) {                                                         //0000 : 07 2E 00 77 01 88 83 6C 0F 2A 16 
      TakeDamage(99999,None,Location,vect(0.000000, 0.000000, 0.000000),Class'DamageType');//000B : 1B 5C 0C 00 00 1D 9F 86 01 00 2A 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 44 C2 00 16 
    }
    if (myHUD != None) {                                                        //002E : 07 45 00 77 01 78 6B 6D 0F 2A 16 
      myHUD.Destroy();                                                          //0039 : 19 01 78 6B 6D 0F 03 00 04 61 17 16 
    }
    Super.Destroyed();                                                          //0045 : 1C A8 89 70 0F 16 
    //07 2E 00 77 01 88 83 6C 0F 2A 16 1B 5C 0C 00 00 1D 9F 86 01 00 2A 01 30 81 6C 0F 23 00 00 00 00 
    //00 00 00 00 00 00 00 00 20 18 44 C2 00 16 07 45 00 77 01 78 6B 6D 0F 2A 16 19 01 78 6B 6D 0F 03 
    //00 04 61 17 16 1C A8 89 70 0F 16 04 0B 47 
  }


  simulated function ClientReliablePlaySound(Sound ASound,optional bool bVolumeControl) {
    ClientPlaySound(ASound,bVolumeControl);                                     //0000 : 1B 75 2C 00 00 00 88 7D 6D 0F 2D 00 48 7E 6D 0F 16 
    //1B 75 2C 00 00 00 88 7D 6D 0F 2D 00 48 7E 6D 0F 16 04 0B 47 
  }


  simulated function ClientPlaySound(Sound ASound,optional bool bVolumeControl,optional float inAtten,optional byte Slot) {
    local float atten;
    atten = 1.00000000;                                                         //0000 : 0F 00 90 80 6D 0F 1E 00 00 80 3F 
    if (bVolumeControl) {                                                       //000B : 07 2B 00 2D 00 08 81 6D 0F 
      atten = FClamp(inAtten,0.00000000,2.00000000);                            //0014 : 0F 00 90 80 6D 0F F6 00 80 81 6D 0F 1E 00 00 00 00 1E 00 00 00 40 16 
    }
    if (ViewTarget != None) {                                                   //002B : 07 55 00 77 01 10 83 6C 0F 2A 16 
      ViewTarget.PlaySound(ASound,Slot,atten,,,,False);                         //0036 : 19 01 10 83 6C 0F 16 00 00 61 08 00 70 7F 6D 0F 00 F8 81 6D 0F 00 90 80 6D 0F 0B 0B 0B 28 16 
    }
    //0F 00 90 80 6D 0F 1E 00 00 80 3F 07 2B 00 2D 00 08 81 6D 0F 0F 00 90 80 6D 0F F6 00 80 81 6D 0F 
    //1E 00 00 00 00 1E 00 00 00 40 16 07 55 00 77 01 10 83 6C 0F 2A 16 19 01 10 83 6C 0F 16 00 00 61 
    //08 00 70 7F 6D 0F 00 F8 81 6D 0F 00 90 80 6D 0F 0B 0B 0B 28 16 04 0B 47 
  }


  function ViewFlash(float DeltaTime) {
    local Vector goalFog;
    local float goalscale;
    local float delta;
    local float Step;
    local PhysicsVolume ViewVolume;
    delta = FMin(0.10000000,DeltaTime);                                         //0000 : 0F 00 98 83 6D 0F F4 1E CD CC CC 3D 00 20 83 6D 0F 16 
    goalscale = 1.00000000;                                                     //0012 : 0F 00 10 84 6D 0F 1E 00 00 80 3F 
    goalFog = vect(0.000000, 0.000000, 0.000000);                               //001D : 0F 00 88 84 6D 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    if (Pawn != None) {                                                         //0030 : 07 A4 00 77 01 88 83 6C 0F 2A 16 
      if (bBehindView) {                                                        //003B : 07 61 00 2D 01 A0 54 71 0F 
        ViewVolume = Level.GetPhysicsVolume(CalcViewLocation);                  //0044 : 0F 00 00 85 6D 0F 19 01 D8 7E 6C 0F 0B 00 04 1B 76 2C 00 00 01 E8 71 71 0F 16 
      } else {                                                                  //005E : 06 75 00 
        ViewVolume = Pawn.HeadVolume;                                           //0061 : 0F 00 00 85 6D 0F 19 01 88 83 6C 0F 05 00 04 01 50 0D 38 0F 
      }
      goalscale += ViewVolume.ViewFlash.X;                                      //0075 : B8 00 10 84 6D 0F 36 48 C4 69 0F 19 00 00 85 6D 0F 05 00 0C 01 78 85 6D 0F 16 
      goalFog += ViewVolume.ViewFog;                                            //008F : DF 00 88 84 6D 0F 19 00 00 85 6D 0F 05 00 0C 01 F0 85 6D 0F 16 
    }
    Step = 0.60000002 * delta * ScreenFlashScaling;                             //00A4 : 0F 00 68 86 6D 0F AB AB 1E 9A 99 19 3F 00 98 83 6D 0F 16 01 80 56 6D 0F 16 
    FlashScale.X = UpdateFlashComponent(FlashScale.X,Step,goalscale);           //00BD : 0F 36 48 C4 69 0F 01 08 56 6D 0F 1C 70 82 6D 0F 36 48 C4 69 0F 01 08 56 6D 0F 00 68 86 6D 0F 00 10 84 6D 0F 16 
    FlashScale = FlashScale.X * vect(1.000000, 1.000000, 1.000000);             //00E2 : 0F 01 08 56 6D 0F D5 36 48 C4 69 0F 01 08 56 6D 0F 23 00 00 80 3F 00 00 80 3F 00 00 80 3F 16 
    FlashFog.X = UpdateFlashComponent(FlashFog.X,Step,goalFog.X);               //0101 : 0F 36 48 C4 69 0F 01 F8 56 6D 0F 1C 70 82 6D 0F 36 48 C4 69 0F 01 F8 56 6D 0F 00 68 86 6D 0F 36 48 C4 69 0F 00 88 84 6D 0F 16 
    FlashFog.Y = UpdateFlashComponent(FlashFog.Y,Step,goalFog.Y);               //012B : 0F 36 C0 C4 69 0F 01 F8 56 6D 0F 1C 70 82 6D 0F 36 C0 C4 69 0F 01 F8 56 6D 0F 00 68 86 6D 0F 36 C0 C4 69 0F 00 88 84 6D 0F 16 
    FlashFog.Z = UpdateFlashComponent(FlashFog.Z,Step,goalFog.Z);               //0155 : 0F 36 38 C5 69 0F 01 F8 56 6D 0F 1C 70 82 6D 0F 36 38 C5 69 0F 01 F8 56 6D 0F 00 68 86 6D 0F 36 38 C5 69 0F 00 88 84 6D 0F 16 
    //0F 00 98 83 6D 0F F4 1E CD CC CC 3D 00 20 83 6D 0F 16 0F 00 10 84 6D 0F 1E 00 00 80 3F 0F 00 88 
    //84 6D 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 07 A4 00 77 01 88 83 6C 0F 2A 16 07 61 00 2D 01 
    //A0 54 71 0F 0F 00 00 85 6D 0F 19 01 D8 7E 6C 0F 0B 00 04 1B 76 2C 00 00 01 E8 71 71 0F 16 06 75 
    //00 0F 00 00 85 6D 0F 19 01 88 83 6C 0F 05 00 04 01 50 0D 38 0F B8 00 10 84 6D 0F 36 48 C4 69 0F 
    //19 00 00 85 6D 0F 05 00 0C 01 78 85 6D 0F 16 DF 00 88 84 6D 0F 19 00 00 85 6D 0F 05 00 0C 01 F0 
    //85 6D 0F 16 0F 00 68 86 6D 0F AB AB 1E 9A 99 19 3F 00 98 83 6D 0F 16 01 80 56 6D 0F 16 0F 36 48 
    //C4 69 0F 01 08 56 6D 0F 1C 70 82 6D 0F 36 48 C4 69 0F 01 08 56 6D 0F 00 68 86 6D 0F 00 10 84 6D 
    //0F 16 0F 01 08 56 6D 0F D5 36 48 C4 69 0F 01 08 56 6D 0F 23 00 00 80 3F 00 00 80 3F 00 00 80 3F 
    //16 0F 36 48 C4 69 0F 01 F8 56 6D 0F 1C 70 82 6D 0F 36 48 C4 69 0F 01 F8 56 6D 0F 00 68 86 6D 0F 
    //36 48 C4 69 0F 00 88 84 6D 0F 16 0F 36 C0 C4 69 0F 01 F8 56 6D 0F 1C 70 82 6D 0F 36 C0 C4 69 0F 
    //01 F8 56 6D 0F 00 68 86 6D 0F 36 C0 C4 69 0F 00 88 84 6D 0F 16 0F 36 38 C5 69 0F 01 F8 56 6D 0F 
    //1C 70 82 6D 0F 36 38 C5 69 0F 01 F8 56 6D 0F 00 68 86 6D 0F 36 38 C5 69 0F 00 88 84 6D 0F 16 04 
    //0B 47 
  }


  final function float UpdateFlashComponent(float current,float Step,float Goal) {
    if (Goal > current) {                                                       //0000 : 07 26 00 B1 00 B0 E1 71 0F 00 B8 E0 71 0F 16 
      return FMin(current + Step,Goal);                                         //000F : 04 F4 AE 00 B8 E0 71 0F 00 28 E2 71 0F 16 00 B0 E1 71 0F 16 
    } else {                                                                    //0023 : 06 3A 00 
      return FMax(current - Step,Goal);                                         //0026 : 04 F5 AF 00 B8 E0 71 0F 00 28 E2 71 0F 16 00 B0 E1 71 0F 16 
    }
    //07 26 00 B1 00 B0 E1 71 0F 00 B8 E0 71 0F 16 04 F4 AE 00 B8 E0 71 0F 00 28 E2 71 0F 16 00 B0 E1 
    //71 0F 16 06 3A 00 04 F5 AF 00 B8 E0 71 0F 00 28 E2 71 0F 16 00 B0 E1 71 0F 16 04 0B 47 
  }


  function int GetFacingDirection() {
    local Vector X;
    local Vector Y;
    local Vector Z;
    local Vector dir;
    GetAxes(Pawn.Rotation,X,Y,Z);                                               //0000 : E5 19 01 88 83 6C 0F 05 00 0C 01 00 84 6C 0F 00 30 E5 71 0F 00 A8 E5 71 0F 00 20 E6 71 0F 16 
    dir = Normal(Pawn.Acceleration);                                            //001F : 0F 00 98 E6 71 0F E2 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 16 
    if (Y Dot dir > 0) {                                                        //0035 : 07 6D 00 B1 DB 00 A8 E5 71 0F 00 98 E6 71 0F 16 39 3F 25 16 
      return 49152 + 16384 * X Dot dir;                                         //0049 : 04 39 44 AE 39 3F 1D 00 C0 00 00 AB 39 3F 1D 00 40 00 00 DB 00 30 E5 71 0F 00 98 E6 71 0F 16 16 16 
    } else {                                                                    //006A : 06 8E 00 
      return 16384 - 16384 * X Dot dir;                                         //006D : 04 39 44 AF 39 3F 1D 00 40 00 00 AB 39 3F 1D 00 40 00 00 DB 00 30 E5 71 0F 00 98 E6 71 0F 16 16 16 
    }
    //E5 19 01 88 83 6C 0F 05 00 0C 01 00 84 6C 0F 00 30 E5 71 0F 00 A8 E5 71 0F 00 20 E6 71 0F 16 0F 
    //00 98 E6 71 0F E2 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 16 07 6D 00 B1 DB 00 A8 E5 71 0F 00 
    //98 E6 71 0F 16 39 3F 25 16 04 39 44 AE 39 3F 1D 00 C0 00 00 AB 39 3F 1D 00 40 00 00 DB 00 30 E5 
    //71 0F 00 98 E6 71 0F 16 16 16 06 8E 00 04 39 44 AF 39 3F 1D 00 40 00 00 AB 39 3F 1D 00 40 00 00 
    //DB 00 30 E5 71 0F 00 98 E6 71 0F 16 16 16 04 0B 47 
  }


  function ClientGotoState(name newState,name NewLabel) {
    GotoState(newState,NewLabel);                                               //0000 : 71 00 C0 E7 71 0F 00 38 E8 71 0F 16 
    //71 00 C0 E7 71 0F 00 38 E8 71 0F 16 04 0B 47 
  }


  event InitInputSystem() {
    PlayerInput = new (self) Class'PlayerInput';                                //0000 : 0F 01 30 20 71 0F 11 17 0B 0B 20 30 F4 C2 00 
    //0F 01 30 20 71 0F 11 17 0B 0B 20 30 F4 C2 00 04 0B 47 
  }


  function SpawnDefaultHUD() {
    myHUD = Spawn(Class'HUD',self);                                             //0000 : 0F 01 78 6B 6D 0F 61 16 20 18 1A C2 00 17 16 
    //0F 01 78 6B 6D 0F 61 16 20 18 1A C2 00 17 16 04 0B 47 
  }


  function ServerVerifyViewTarget() {
    if (ViewTarget == self) {                                                   //0000 : 07 0D 00 72 01 10 83 6C 0F 17 16 
      return;                                                                   //000B : 04 0B 
    }
    if (ViewTarget == None) {                                                   //000D : 07 1A 00 72 01 10 83 6C 0F 2A 16 
      return;                                                                   //0018 : 04 0B 
    }
    ClientSetViewTarget(ViewTarget);                                            //001A : 1B D6 2B 00 00 01 10 83 6C 0F 16 
    //07 0D 00 72 01 10 83 6C 0F 17 16 04 0B 07 1A 00 72 01 10 83 6C 0F 2A 16 04 0B 1B D6 2B 00 00 01 
    //10 83 6C 0F 16 04 0B 47 
  }


  event ClientSetViewTarget(Actor A) {
    local bool bNewViewTarget;
    if (A == None) {                                                            //0000 : 07 27 00 72 00 50 EC 71 0F 2A 16 
      if (ViewTarget != self) {                                                 //000B : 07 1E 00 77 01 10 83 6C 0F 17 16 
        SetLocation(CalcViewLocation);                                          //0016 : 61 0B 01 E8 71 71 0F 16 
      }
      ServerVerifyViewTarget();                                                 //001E : 1B 77 2C 00 00 16 
    } else {                                                                    //0024 : 06 5F 00 
      bNewViewTarget = ViewTarget != A;                                         //0027 : 14 2D 00 78 ED 71 0F 77 01 10 83 6C 0F 00 50 EC 71 0F 16 
      SetViewTarget(A);                                                         //003A : 1C C8 73 71 0F 00 50 EC 71 0F 16 
      if (bNewViewTarget) {                                                     //0045 : 07 5F 00 2D 00 78 ED 71 0F 
        A.POVChanged(self,False);                                               //004E : 19 00 50 EC 71 0F 08 00 00 1B 2C 2B 00 00 17 28 16 
      }
    }
    //07 27 00 72 00 50 EC 71 0F 2A 16 07 1E 00 77 01 10 83 6C 0F 17 16 61 0B 01 E8 71 71 0F 16 1B 77 
    //2C 00 00 16 06 5F 00 14 2D 00 78 ED 71 0F 77 01 10 83 6C 0F 00 50 EC 71 0F 16 1C C8 73 71 0F 00 
    //50 EC 71 0F 16 07 5F 00 2D 00 78 ED 71 0F 19 00 50 EC 71 0F 08 00 00 1B 2C 2B 00 00 17 28 16 04 
    //0B 47 
  }


  function ClientSetClassicView() {
    Level.bClassicView = True;                                                  //0000 : 14 19 01 D8 7E 6C 0F 06 00 04 2D 01 E8 EE 71 0F 27 
    //14 19 01 D8 7E 6C 0F 06 00 04 2D 01 E8 EE 71 0F 27 04 0B 47 
  }


  exec function DSM() {
    DecreaseScreenShotMode();                                                   //0000 : 1B 87 2C 00 00 16 
    //1B 87 2C 00 00 16 04 0B 47 
  }


  exec function DecreaseScreenShotMode() {
    if (Player.InteractionMaster.ScreenshotMode > 0) {                          //0000 : 07 36 00 97 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 25 16 
      Player.InteractionMaster.ScreenshotMode--;                                //001D : A6 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 16 
    }
    //07 36 00 97 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 25 16 A6 19 19 
    //01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 16 04 0B 47 
  }


  exec function ISM() {
    IncreaseScreenShotMode();                                                   //0000 : 1B C1 2B 00 00 16 
    //1B C1 2B 00 00 16 04 0B 47 
  }


  exec function IncreaseScreenShotMode() {
    if (Player.InteractionMaster.ScreenshotMode < 2) {                          //0000 : 07 37 00 96 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 2C 02 16 
      Player.InteractionMaster.ScreenshotMode++;                                //001E : A5 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 16 
    }
    //07 37 00 96 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 2C 02 16 A5 19 
    //19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 16 04 0B 47 
  }


  exec function TSM() {
    ToggleScreenShotMode();                                                     //0000 : 1B 88 2C 00 00 16 
    //1B 88 2C 00 00 16 04 0B 47 
  }


  exec function ToggleScreenShotMode() {
    if (Player.InteractionMaster.ScreenshotMode != 0) {                         //0000 : 07 39 00 9B 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 25 16 
      Player.InteractionMaster.ScreenshotMode = 0;                              //001D : 0F 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 25 
    } else {                                                                    //0036 : 06 53 00 
      Player.InteractionMaster.ScreenshotMode = 2;                              //0039 : 0F 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 2C 02 
    }
    //07 39 00 9B 19 19 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 25 16 0F 19 19 
    //01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 25 06 53 00 0F 19 19 01 28 25 71 
    //0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 2C 02 04 0B 47 
  }


  simulated event StreamFinished(int StreamHandle,byte Reason) {
    local int i;
    if (Player != None) {                                                       //0000 : 07 77 00 77 01 28 25 71 0F 2A 16 
      i = 0;                                                                    //000B : 0F 00 90 F8 71 0F 25 
      while (i < Player.LocalInteractions.Length) {                             //0012 : 07 77 00 96 00 90 F8 71 0F 37 19 01 28 25 71 0F 05 00 00 01 08 F9 71 0F 16 
        if (Player.LocalInteractions[i] != None) {                              //002B : 07 6D 00 77 10 00 90 F8 71 0F 19 01 28 25 71 0F 05 00 00 01 08 F9 71 0F 2A 16 
          Player.LocalInteractions[i].StreamFinished(StreamHandle,Reason);      //0045 : 19 10 00 90 F8 71 0F 19 01 28 25 71 0F 05 00 00 01 08 F9 71 0F 10 00 00 1B 0E 2B 00 00 00 48 F7 71 0F 00 80 F9 71 0F 16 
        }
        i++;                                                                    //006D : A5 00 90 F8 71 0F 16 
      }
    }
    //07 77 00 77 01 28 25 71 0F 2A 16 0F 00 90 F8 71 0F 25 07 77 00 96 00 90 F8 71 0F 37 19 01 28 25 
    //71 0F 05 00 00 01 08 F9 71 0F 16 07 6D 00 77 10 00 90 F8 71 0F 19 01 28 25 71 0F 05 00 00 01 08 
    //F9 71 0F 2A 16 19 10 00 90 F8 71 0F 19 01 28 25 71 0F 05 00 00 01 08 F9 71 0F 10 00 00 1B 0E 2B 
    //00 00 00 48 F7 71 0F 00 80 F9 71 0F 16 A5 00 90 F8 71 0F 16 06 12 00 04 0B 47 
  }


  function Actor GetPathTo(Actor Dest) {
    local int i;
    local Actor Best;
    local Vector dir;
    if (Dest == None) {                                                         //0000 : 07 11 00 72 00 A8 FA 71 0F 2A 16 
      return Dest;                                                              //000B : 04 00 A8 FA 71 0F 
    }
    if (Pawn.Physics != 2
      && (RouteGoal != Dest
      || Level.TimeSeconds - LastRouteFind > 1 + FRand())) {//0011 : 07 7E 00 82 9B 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 02 16 18 30 00 84 77 01 30 B5 70 0F 00 A8 FA 71 0F 16 18 1F 00 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 10 06 71 0F 16 AE 39 3F 26 C3 16 16 16 16 16 
      MoveTarget = FindPathToward(Dest,False);                                  //005E : 0F 01 C8 B3 70 0F 62 05 00 A8 FA 71 0F 28 16 
      if (MoveTarget == None) {                                                 //006D : 07 7E 00 72 01 C8 B3 70 0F 2A 16 
        return Dest;                                                            //0078 : 04 00 A8 FA 71 0F 
      }
    }
    if (RouteCache[0] == None) {                                                //007E : 07 91 00 72 1A 25 01 80 03 71 0F 2A 16 
      return Dest;                                                              //008B : 04 00 A8 FA 71 0F 
    }
    if (RouteCache[1] == None) {                                                //0091 : 07 A6 00 72 1A 26 01 80 03 71 0F 2A 16 
      return RouteCache[0];                                                     //009E : 04 1A 25 01 80 03 71 0F 
    }
    Best = RouteCache[0];                                                       //00A6 : 0F 00 20 FB 71 0F 1A 25 01 80 03 71 0F 
    dir = Normal(RouteCache[1].Location - RouteCache[0].Location);              //00B3 : 0F 00 98 FB 71 0F E2 D8 19 1A 26 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 19 1A 25 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 16 16 
    i = 0;                                                                      //00DD : 0F 00 10 FC 71 0F 25 
    while (i < 5) {                                                             //00E4 : 07 9F 01 96 00 10 FC 71 0F 2C 05 16 
      if (RouteCache[i] == None
        || VSize(Pawn.Location - RouteCache[i].Location) > 2000) {//00F0 : 07 38 01 84 72 1A 00 10 FC 71 0F 01 80 03 71 0F 2A 16 18 30 00 B1 E1 D8 19 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 1A 00 10 FC 71 0F 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 16 16 39 3F 1D D0 07 00 00 16 16 
        goto jl019F;                                                            //0135 : 06 9F 01 
      }
      if (Normal(RouteCache[i].Location - RouteCache[0].Location) Dot dir > 0.69999999
        && LineOfSightTo(RouteCache[i])) {//0138 : 07 95 01 82 B1 DB E2 D8 19 1A 00 10 FC 71 0F 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 19 1A 25 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 16 16 00 98 FB 71 0F 16 1E 33 33 33 3F 16 18 0F 00 62 02 1A 00 10 FC 71 0F 01 80 03 71 0F 16 16 
        Best = RouteCache[i];                                                   //0184 : 0F 00 20 FB 71 0F 1A 00 10 FC 71 0F 01 80 03 71 0F 
      }
      i++;                                                                      //0195 : A5 00 10 FC 71 0F 16 
    }
    return Best;                                                                //019F : 04 00 20 FB 71 0F 
    //07 11 00 72 00 A8 FA 71 0F 2A 16 04 00 A8 FA 71 0F 07 7E 00 82 9B 39 3A 19 01 88 83 6C 0F 05 00 
    //01 01 C0 93 6C 0F 39 3A 24 02 16 18 30 00 84 77 01 30 B5 70 0F 00 A8 FA 71 0F 16 18 1F 00 B1 AF 
    //19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 10 06 71 0F 16 AE 39 3F 26 C3 16 16 16 16 16 0F 01 
    //C8 B3 70 0F 62 05 00 A8 FA 71 0F 28 16 07 7E 00 72 01 C8 B3 70 0F 2A 16 04 00 A8 FA 71 0F 07 91 
    //00 72 1A 25 01 80 03 71 0F 2A 16 04 00 A8 FA 71 0F 07 A6 00 72 1A 26 01 80 03 71 0F 2A 16 04 1A 
    //25 01 80 03 71 0F 0F 00 20 FB 71 0F 1A 25 01 80 03 71 0F 0F 00 98 FB 71 0F E2 D8 19 1A 26 01 80 
    //03 71 0F 05 00 0C 01 30 81 6C 0F 19 1A 25 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 16 16 0F 00 10 
    //FC 71 0F 25 07 9F 01 96 00 10 FC 71 0F 2C 05 16 07 38 01 84 72 1A 00 10 FC 71 0F 01 80 03 71 0F 
    //2A 16 18 30 00 B1 E1 D8 19 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 1A 00 10 FC 71 0F 01 80 03 
    //71 0F 05 00 0C 01 30 81 6C 0F 16 16 39 3F 1D D0 07 00 00 16 16 06 9F 01 07 95 01 82 B1 DB E2 D8 
    //19 1A 00 10 FC 71 0F 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 19 1A 25 01 80 03 71 0F 05 00 0C 01 
    //30 81 6C 0F 16 16 00 98 FB 71 0F 16 1E 33 33 33 3F 16 18 0F 00 62 02 1A 00 10 FC 71 0F 01 80 03 
    //71 0F 16 16 0F 00 20 FB 71 0F 1A 00 10 FC 71 0F 01 80 03 71 0F A5 00 10 FC 71 0F 16 06 E4 00 04 
    //00 20 FB 71 0F 04 0B 47 
  }


  simulated function bool BeyondViewDistance(Vector OtherLocation,float CullDistance) {
    local float dist;
    if (ViewTarget == None) {                                                   //0000 : 07 0D 00 72 01 10 83 6C 0F 2A 16 
      return True;                                                              //000B : 04 27 
    }
    dist = VSize(OtherLocation - ViewTarget.Location);                          //000D : 0F 00 10 FF 71 0F E1 D8 00 B0 FD 71 0F 19 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 16 16 
    if (CullDistance > 0 && CullDistance < dist * FOVBias) {                    //002A : 07 51 00 82 B1 00 88 FF 71 0F 39 3F 25 16 18 14 00 B0 00 88 FF 71 0F AB 00 10 FF 71 0F 01 08 00 72 0F 16 16 16 
      return True;                                                              //004F : 04 27 
    }
    return Region.Zone.bDistanceFog
      && dist > Region.Zone.DistanceFogEnd; //0051 : 04 82 19 36 58 43 6E 0F 01 70 8A 6E 0F 06 00 04 2D 01 80 00 72 0F 18 1B 00 B1 00 10 FF 71 0F 19 36 58 43 6E 0F 01 70 8A 6E 0F 05 00 04 01 F8 00 72 0F 16 16 
    //07 0D 00 72 01 10 83 6C 0F 2A 16 04 27 0F 00 10 FF 71 0F E1 D8 00 B0 FD 71 0F 19 01 10 83 6C 0F 
    //05 00 0C 01 30 81 6C 0F 16 16 07 51 00 82 B1 00 88 FF 71 0F 39 3F 25 16 18 14 00 B0 00 88 FF 71 
    //0F AB 00 10 FF 71 0F 01 08 00 72 0F 16 16 16 04 27 04 82 19 36 58 43 6E 0F 01 70 8A 6E 0F 06 00 
    //04 2D 01 80 00 72 0F 18 1B 00 B1 00 10 FF 71 0F 19 36 58 43 6E 0F 01 70 8A 6E 0F 05 00 04 01 F8 
    //00 72 0F 16 16 04 0B 47 
  }


  simulated event PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C 78 8B 70 0F 16 
    FixFOV();                                                                   //0006 : 1B 47 2C 00 00 16 
    SetViewTarget(self);                                                        //000C : 1C C8 73 71 0F 17 16 
    bForcePrecache = SBRole != 1 && SBRole != 9;                                //0013 : 14 2D 01 18 03 72 0F 82 9B 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 0E 00 9B 39 3A 01 40 B2 6C 0F 39 3A 24 09 16 16 
    //1C 78 8B 70 0F 16 1B 47 2C 00 00 16 1C C8 73 71 0F 17 16 14 2D 01 18 03 72 0F 82 9B 39 3A 01 40 
    //B2 6C 0F 39 3A 24 01 16 18 0E 00 9B 39 3A 01 40 B2 6C 0F 39 3A 24 09 16 16 04 0B 47 
  }


  native event int ClientHearSBSound(Actor Actor,Sound s,Vector SoundLocation,float Volume,float Pitch,float Radius,int AudioType,bool Attenuate);


  native event ClientHearSound(Actor Actor,int Id,Sound s,Vector SoundLocation,Vector Parameters,bool Attenuate);


  final native(524) function int FindStairRotation(float DeltaTime);


  native function string PasteFromClipboard();


  native function CopyToClipboard(string Text);


  final native function SetViewTarget(Actor NewViewTarget);


  private final native function ResetInput();


  final native(544) function ResetKeyboard();


  native function string ConsoleCommand(string Command,optional bool bWriteToLog);


  event bool IsViewingCinematic() {
    return bViewingMatineeCinematic;                                            //0000 : 04 2D 01 88 16 72 0F 
    //04 2D 01 88 16 72 0F 04 0B 47 
  }


  function SetViewingCinematic(bool aViewingFlag) {
    bViewingMatineeCinematic = aViewingFlag;                                    //0000 : 14 2D 01 88 16 72 0F 2D 00 B0 17 72 0F 
    if (bViewingMatineeCinematic) {                                             //000D : 07 1F 00 2D 01 88 16 72 0F 
      cl_OnSceneStarted();                                                      //0016 : 1B F6 11 00 00 16 
    } else {                                                                    //001C : 06 25 00 
      cl_OnSceneEnded();                                                        //001F : 1B F7 11 00 00 16 
    }
    //14 2D 01 88 16 72 0F 2D 00 B0 17 72 0F 07 1F 00 2D 01 88 16 72 0F 1B F6 11 00 00 16 06 25 00 1B 
    //F7 11 00 00 16 04 0B 47 
  }


  event cl_OnSceneEnded();


  event cl_OnSceneStarted();


  event SV_PlayerTick(float DeltaTime);


  event cl_OnPlayerTick(float delta);


  state PlayerFlying {

      function BeginState() {
        Pawn.SetPhysics(4);                                                     //0000 : 19 01 88 83 6C 0F 05 00 00 6F 82 24 04 16 
        //19 01 88 83 6C 0F 05 00 00 6F 82 24 04 16 04 0B 47 
      }


      function PlayerMove(float DeltaTime) {
        local Vector X;
        local Vector Y;
        local Vector Z;
        GetAxes(Rotation,X,Y,Z);                                                //0000 : E5 01 00 84 6C 0F 00 70 FB 6E 0F 00 E8 FB 6E 0F 00 60 FC 6E 0F 16 
        Pawn.Acceleration = aForward * X + aStrafe * Y;                         //0016 : 0F 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F D7 D5 01 D8 FC 6E 0F 00 70 FB 6E 0F 16 D5 01 50 FD 6E 0F 00 E8 FB 6E 0F 16 16 
        if (VSize(Pawn.Acceleration) < 1.00000000) {                            //003F : 07 75 00 B0 E1 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 16 1E 00 00 80 3F 16 
          Pawn.Acceleration = vect(0.000000, 0.000000, 0.000000);               //0059 : 0F 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
        }
        if (bCheatFlying
          && Pawn.Acceleration == vect(0.000000, 0.000000, 0.000000)) {//0075 : 07 BC 00 82 2D 01 C8 FD 6E 0F 18 1E 00 D9 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 16 
          Pawn.Velocity = vect(0.000000, 0.000000, 0.000000);                   //00A0 : 0F 19 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
        }
        UpdateRotation(DeltaTime,2.00000000);                                   //00BC : 1B C1 12 00 00 00 F8 FA 6E 0F 1E 00 00 00 40 16 
        //E5 01 00 84 6C 0F 00 70 FB 6E 0F 00 E8 FB 6E 0F 00 60 FC 6E 0F 16 0F 19 01 88 83 6C 0F 05 00 0C 
        //01 18 96 6C 0F D7 D5 01 D8 FC 6E 0F 00 70 FB 6E 0F 16 D5 01 50 FD 6E 0F 00 E8 FB 6E 0F 16 16 07 
        //75 00 B0 E1 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 16 1E 00 00 80 3F 16 0F 19 01 88 83 6C 0F 
        //05 00 0C 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 07 BC 00 82 2D 01 C8 FD 6E 0F 18 
        //1E 00 D9 19 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 16 
        //0F 19 01 88 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 1B C1 12 00 
        //00 00 F8 FA 6E 0F 1E 00 00 00 40 16 04 0B 47 
      }


    //08 47 

  }


  state PlayerWalking {

      function EndState() {
        GroundPitch = 0;                                                        //0000 : 0F 01 08 01 6F 0F 25 
        if (Pawn != None && bDuck == 0) {                                       //0007 : 07 31 00 82 77 01 88 83 6C 0F 2A 16 18 0B 00 9A 39 3A 01 B0 F2 70 0F 25 16 16 
          Pawn.ShouldCrouch(False);                                             //0021 : 19 01 88 83 6C 0F 07 00 00 1B 69 2B 00 00 28 16 
        }
        //0F 01 08 01 6F 0F 25 07 31 00 82 77 01 88 83 6C 0F 2A 16 18 0B 00 9A 39 3A 01 B0 F2 70 0F 25 16 
        //16 19 01 88 83 6C 0F 07 00 00 1B 69 2B 00 00 28 16 04 0B 47 
      }


      function BeginState() {
        bPressedJump = False;                                                   //0000 : 14 2D 01 20 03 6F 0F 28 
        GroundPitch = 0;                                                        //0008 : 0F 01 08 01 6F 0F 25 
        if (Pawn != None) {                                                     //000F : 07 8F 00 77 01 88 83 6C 0F 2A 16 
          if (Pawn.Mesh == None) {                                              //001A : 07 3D 00 72 19 01 88 83 6C 0F 05 00 04 01 D8 99 6C 0F 2A 16 
            Pawn.SetMesh();                                                     //002E : 19 01 88 83 6C 0F 06 00 00 1B 65 2B 00 00 16 
          }
          Pawn.ShouldCrouch(False);                                             //003D : 19 01 88 83 6C 0F 07 00 00 1B 69 2B 00 00 28 16 
          if (Pawn.Physics != 2 && Pawn.Physics != 13) {                        //004D : 07 8F 00 82 9B 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 02 16 18 17 00 9B 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 0D 16 16 
            Pawn.SetPhysics(1);                                                 //0081 : 19 01 88 83 6C 0F 05 00 00 6F 82 24 01 16 
          }
        }
        //14 2D 01 20 03 6F 0F 28 0F 01 08 01 6F 0F 25 07 8F 00 77 01 88 83 6C 0F 2A 16 07 3D 00 72 19 01 
        //88 83 6C 0F 05 00 04 01 D8 99 6C 0F 2A 16 19 01 88 83 6C 0F 06 00 00 1B 65 2B 00 00 16 19 01 88 
        //83 6C 0F 07 00 00 1B 69 2B 00 00 28 16 07 8F 00 82 9B 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 
        //6C 0F 39 3A 24 02 16 18 17 00 9B 39 3A 19 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 0D 16 
        //16 19 01 88 83 6C 0F 05 00 00 6F 82 24 01 16 04 0B 47 
      }


      function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume) {
        if (NewVolume.bWaterVolume) {                                           //0000 : 07 22 00 19 00 98 03 6F 0F 06 00 04 2D 01 70 04 6F 0F 
          GotoState(Pawn.WaterMovementState);                                   //0012 : 71 19 01 88 83 6C 0F 05 00 04 01 F8 4F 71 0F 16 
        }
        return False;                                                           //0022 : 04 28 
        //07 22 00 19 00 98 03 6F 0F 06 00 04 2D 01 70 04 6F 0F 71 19 01 88 83 6C 0F 05 00 04 01 F8 4F 71 
        //0F 16 04 28 04 0B 47 
      }


  Begin:
    //08 0B 0B 0C 64 00 00 00 00 00 00 00 00 00 00 00 FF FF 00 00 47 

  }



