//==============================================================================
//  SceneManager
//==============================================================================

class SceneManager extends Info
    native
    dependsOn(PlayerController,HUD,Class,GameEngine,Pawn)
    Placeable
    Config(System)
  ;

  enum EAffect {
    AFFECT_ViewportCamera ,
    AFFECT_Actor 
  };

  struct Interpolator {
      var (Interpolator) int bDone;
      var (Interpolator) float _value;
      var (Interpolator) float _remainingTime;
      var (Interpolator) float _totalTime;
      var (Interpolator) float _speed;
      var (Interpolator) float _acceleration;

  };


  struct Orientation {
      var (Orientation) byte CamOrientation;
      var (Orientation) Actor LookAt;
      var (Orientation) Actor DollyWith;
      var (Orientation) float EaseIntime;
      var (Orientation) int bReversePitch;
      var (Orientation) int bReverseYaw;
      var (Orientation) int bReverseRoll;
      var transient int MA;
      var float PctInStart;
      var float PctInEnd;
      var float PctInDuration;
      var Rotator StartingRotation;

  };


  var (SceneManager) export editinline array<MatAction> Actions;
  var (SceneManager) config byte Affect;
  var (SceneManager) Actor AffectedActor;
  var (SceneManager) bool bLooping;
  var (SceneManager) bool bCinematicView;
  var (SceneManager) name PlayerScriptTag;
  var (SceneManager) name NextSceneTag;
  var (SceneManager) name EventStart;
  var (SceneManager) name EventEnd;
  var (SceneManager) bool bHideHUD;
  var transient float PctSceneComplete;
  var transient MatAction CurrentAction;
  var transient float SceneSpeed;
  var transient float TotalSceneTime;
  var transient Actor Viewer;
  var transient Pawn OldPawn;
  var transient bool bIsRunning;
  var transient bool bIsSceneStarted;
  var transient float CurrentTime;
  var transient array<Vector> SampleLocations;
  var transient array<MatSubAction> SubActions;
  var transient Orientation CamOrientation;
  var transient Orientation PrevOrientation;
  var transient Interpolator RotInterpolator;
  var transient Vector CameraShake;
  var transient Vector DollyOffset;
  var transient bool bAbortCinematic;
  var float OffsetStartFactor;


  event cl_OnTick(float delta) {
    Super.cl_OnTick(delta);                                                     //0000 : 1C 98 2A 6E 0F 00 00 C8 36 19 16 
    TickScene(delta);                                                           //000B : 1B CF 2B 00 00 00 00 C8 36 19 16 
    //1C 98 2A 6E 0F 00 00 C8 36 19 16 1B CF 2B 00 00 00 00 C8 36 19 16 04 0B 47 
  }


  event SceneEnded() {
    bIsSceneStarted = False;                                                    //0000 : 14 2D 01 40 2D 37 0F 28 
    if (Affect == 0) {                                                          //0008 : 07 A4 00 9A 39 3A 01 B8 CA 36 19 39 3A 24 00 16 
      if (PlayerController(Viewer) != None) {                                   //0018 : 07 A4 00 77 2E 58 34 C2 00 01 B0 C4 36 19 2A 16 
        PlayerController(Viewer).Pawn = OldPawn;                                //0028 : 0F 19 2E 58 34 C2 00 01 B0 C4 36 19 05 00 04 01 88 83 6C 0F 01 30 CB 36 19 
        PlayerController(Viewer).SetViewTarget(OldPawn);                        //0041 : 19 2E 58 34 C2 00 01 B0 C4 36 19 0B 00 00 1C C8 73 71 0F 01 30 CB 36 19 16 
        PlayerController(Viewer).bInterpolating = False;                        //005A : 14 19 2E 58 34 C2 00 01 B0 C4 36 19 06 00 04 2D 01 D8 E8 35 0F 28 
        PlayerController(Viewer).myHUD.bHideHUD = False;                        //0070 : 14 19 19 2E 58 34 C2 00 01 B0 C4 36 19 05 00 04 01 78 6B 6D 0F 06 00 04 2D 01 10 BB 7A 0F 28 
        PlayerController(Viewer).SetViewingCinematic(False);                    //008F : 19 2E 58 34 C2 00 01 B0 C4 36 19 07 00 00 1B 5B 2B 00 00 28 16 
      }
    }
    Viewer.FinishedInterpolation();                                             //00A4 : 19 01 B0 C4 36 19 06 00 00 1B 4C 2B 00 00 16 
    Enable('Trigger');                                                          //00B3 : 75 21 32 01 00 00 16 
    TriggerEvent(EventEnd,self,None);                                           //00BA : 1C F8 B1 34 0F 01 A8 CB 36 19 17 2A 16 
    //14 2D 01 40 2D 37 0F 28 07 A4 00 9A 39 3A 01 B8 CA 36 19 39 3A 24 00 16 07 A4 00 77 2E 58 34 C2 
    //00 01 B0 C4 36 19 2A 16 0F 19 2E 58 34 C2 00 01 B0 C4 36 19 05 00 04 01 88 83 6C 0F 01 30 CB 36 
    //19 19 2E 58 34 C2 00 01 B0 C4 36 19 0B 00 00 1C C8 73 71 0F 01 30 CB 36 19 16 14 19 2E 58 34 C2 
    //00 01 B0 C4 36 19 06 00 04 2D 01 D8 E8 35 0F 28 14 19 19 2E 58 34 C2 00 01 B0 C4 36 19 05 00 04 
    //01 78 6B 6D 0F 06 00 04 2D 01 10 BB 7A 0F 28 19 2E 58 34 C2 00 01 B0 C4 36 19 07 00 00 1B 5B 2B 
    //00 00 28 16 19 01 B0 C4 36 19 06 00 00 1B 4C 2B 00 00 16 75 21 32 01 00 00 16 1C F8 B1 34 0F 01 
    //A8 CB 36 19 17 2A 16 04 0B 47 
  }


  event SceneStarted() {
    local GameEngine Engine;
    local PlayerController Controller;
    Viewer = None;                                                              //0000 : 0F 01 B0 C4 36 19 2A 
    Engine = Class'Actor'.static.GetGameEngine();                               //0007 : 0F 00 D0 CC 36 19 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
    if (Affect == 1) {                                                          //001C : 07 3A 00 9A 39 3A 01 B8 CA 36 19 39 3A 24 01 16 
      Viewer = AffectedActor;                                                   //002C : 0F 01 B0 C4 36 19 01 50 CF 36 19 
    } else {                                                                    //0037 : 06 3E 01 
      if (Engine != None) {                                                     //003A : 07 3E 01 77 00 D0 CC 36 19 2A 16 
        Controller = Engine.GetPlayerController();                              //0045 : 0F 00 C8 CF 36 19 19 00 D0 CC 36 19 06 00 04 1C 60 3E 6C 0F 16 
        if (Controller != None) {                                               //005A : 07 2E 01 77 00 C8 CF 36 19 2A 16 
          Viewer = Controller;                                                  //0065 : 0F 01 B0 C4 36 19 00 C8 CF 36 19 
          OldPawn = Controller.Pawn;                                            //0070 : 0F 01 30 CB 36 19 19 00 C8 CF 36 19 05 00 04 01 88 83 6C 0F 
          if (OldPawn != None) {                                                //0084 : 07 C7 00 77 01 30 CB 36 19 2A 16 
            OldPawn.Velocity = vect(0.000000, 0.000000, 0.000000);              //008F : 0F 19 01 30 CB 36 19 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
            OldPawn.Acceleration = vect(0.000000, 0.000000, 0.000000);          //00AB : 0F 19 01 30 CB 36 19 05 00 0C 01 18 96 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
          }
          Controller.SetViewTarget(Viewer);                                     //00C7 : 19 00 C8 CF 36 19 0B 00 00 1C C8 73 71 0F 01 B0 C4 36 19 16 
          Controller.SetViewingCinematic(True);                                 //00DB : 19 00 C8 CF 36 19 07 00 00 1B 5B 2B 00 00 27 16 
          Controller.StartInterpolation();                                      //00EB : 19 00 C8 CF 36 19 06 00 00 1B F7 2A 00 00 16 
          Controller.myHUD.bHideHUD = bHideHUD;                                 //00FA : 14 19 19 00 C8 CF 36 19 05 00 04 01 78 6B 6D 0F 06 00 04 2D 01 10 BB 7A 0F 2D 01 40 D0 36 19 
          CurrentTime = OffsetStartFactor * TotalSceneTime;                     //0119 : 0F 01 78 04 36 0F AB 01 B8 2D 37 0F 01 F0 04 36 0F 16 
        } else {                                                                //012B : 06 3E 01 
          bIsRunning = False;                                                   //012E : 14 2D 01 C8 2C 37 0F 28 
          bIsSceneStarted = False;                                              //0136 : 14 2D 01 40 2D 37 0F 28 
        }
      }
    }
    Viewer.StartInterpolation();                                                //013E : 19 01 B0 C4 36 19 06 00 00 1B F7 2A 00 00 16 
    TriggerEvent(EventStart,self,None);                                         //014D : 1C F8 B1 34 0F 01 B8 D0 36 19 17 2A 16 
    //0F 01 B0 C4 36 19 2A 0F 00 D0 CC 36 19 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 07 3A 00 9A 
    //39 3A 01 B8 CA 36 19 39 3A 24 01 16 0F 01 B0 C4 36 19 01 50 CF 36 19 06 3E 01 07 3E 01 77 00 D0 
    //CC 36 19 2A 16 0F 00 C8 CF 36 19 19 00 D0 CC 36 19 06 00 04 1C 60 3E 6C 0F 16 07 2E 01 77 00 C8 
    //CF 36 19 2A 16 0F 01 B0 C4 36 19 00 C8 CF 36 19 0F 01 30 CB 36 19 19 00 C8 CF 36 19 05 00 04 01 
    //88 83 6C 0F 07 C7 00 77 01 30 CB 36 19 2A 16 0F 19 01 30 CB 36 19 05 00 0C 01 A0 95 6C 0F 23 00 
    //00 00 00 00 00 00 00 00 00 00 00 0F 19 01 30 CB 36 19 05 00 0C 01 18 96 6C 0F 23 00 00 00 00 00 
    //00 00 00 00 00 00 00 19 00 C8 CF 36 19 0B 00 00 1C C8 73 71 0F 01 B0 C4 36 19 16 19 00 C8 CF 36 
    //19 07 00 00 1B 5B 2B 00 00 27 16 19 00 C8 CF 36 19 06 00 00 1B F7 2A 00 00 16 14 19 19 00 C8 CF 
    //36 19 05 00 04 01 78 6B 6D 0F 06 00 04 2D 01 10 BB 7A 0F 2D 01 40 D0 36 19 0F 01 78 04 36 0F AB 
    //01 B8 2D 37 0F 01 F0 04 36 0F 16 06 3E 01 14 2D 01 C8 2C 37 0F 28 14 2D 01 40 2D 37 0F 28 19 01 
    //B0 C4 36 19 06 00 00 1B F7 2A 00 00 16 1C F8 B1 34 0F 01 B8 D0 36 19 17 2A 16 04 0B 47 
  }


  function Trigger(Actor Other,Pawn EventInstigator) {
    return;                                                                     //0000 : 04 0B 
    bIsRunning = True;                                                          //0002 : 14 2D 01 C8 2C 37 0F 27 
    bIsSceneStarted = False;                                                    //000A : 14 2D 01 40 2D 37 0F 28 
    Disable('Trigger');                                                         //0012 : 76 21 32 01 00 00 16 
    //04 0B 14 2D 01 C8 2C 37 0F 27 14 2D 01 40 2D 37 0F 28 76 21 32 01 00 00 16 04 0B 47 
  }


  simulated event Destroyed() {
    //04 0B 47 
  }


  simulated function BeginPlay() {
    Super.BeginPlay();                                                          //0000 : 1C F0 E4 6C 0F 16 
    if (Affect == 1 && AffectedActor == None) {                                 //0006 : 07 4D 00 82 9A 39 3A 01 B8 CA 36 19 39 3A 24 01 16 18 09 00 72 01 50 CF 36 19 2A 16 16 
      Log("SceneManager : Affected actor is NULL!");                            //0023 : E7 1F 53 63 65 6E 65 4D 61 6E 61 67 65 72 20 3A 20 41 66 66 65 63 74 65 64 20 61 63 74 6F 72 20 69 73 20 4E 55 4C 4C 21 00 16 
    }
    TotalSceneTime = GetTotalSceneTime();                                       //004D : 0F 01 F0 04 36 0F 1B CE 2B 00 00 16 
    bIsRunning = False;                                                         //0059 : 14 2D 01 C8 2C 37 0F 28 
    bIsSceneStarted = False;                                                    //0061 : 14 2D 01 40 2D 37 0F 28 
    //1C F0 E4 6C 0F 16 07 4D 00 82 9A 39 3A 01 B8 CA 36 19 39 3A 24 01 16 18 09 00 72 01 50 CF 36 19 
    //2A 16 16 E7 1F 53 63 65 6E 65 4D 61 6E 61 67 65 72 20 3A 20 41 66 66 65 63 74 65 64 20 61 63 74 
    //6F 72 20 69 73 20 4E 55 4C 4C 21 00 16 0F 01 F0 04 36 0F 1B CE 2B 00 00 16 14 2D 01 C8 2C 37 0F 
    //28 14 2D 01 40 2D 37 0F 28 04 0B 47 
  }


  function SceneStart() {
    bIsRunning = True;                                                          //0000 : 14 2D 01 C8 2C 37 0F 27 
    bIsSceneStarted = False;                                                    //0008 : 14 2D 01 40 2D 37 0F 28 
    //14 2D 01 C8 2C 37 0F 27 14 2D 01 40 2D 37 0F 28 04 0B 47 
  }


  native function TickScene(float delta);


  native function AbortScene();


  native function float GetTotalSceneTime();



