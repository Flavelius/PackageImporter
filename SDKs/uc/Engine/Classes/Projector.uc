//==============================================================================
//  Projector
//==============================================================================

class Projector extends Actor
    native
    dependsOn()
    Placeable
  ;

  enum EProjectorBlending {
    PB_None ,
    PB_Modulate ,
    PB_AlphaBlend ,
    PB_Add 
  };

  var (Projector) byte MaterialBlendingOp;
  var (Projector) byte FrameBufferBlendingOp;
  var (Projector) Material ProjTexture;
  var (Projector) int FOV;
  var (Projector) int MaxTraceDistance;
  var (Projector) bool bProjectBSP;
  var (Projector) bool bProjectTerrain;
  var (Projector) bool bProjectStaticMesh;
  var (Projector) bool bProjectParticles;
  var (Projector) bool bProjectActor;
  var (Projector) bool bLevelStatic;
  var (Projector) bool bClipBSP;
  var (Projector) bool bClipStaticMesh;
  var (Projector) bool bProjectOnUnlit;
  var (Projector) bool bGradient;
  var (Projector) bool bProjectOnBackfaces;
  var (Projector) bool bProjectOnAlpha;
  var (Projector) bool bProjectOnParallelBSP;
  var (Projector) name ProjectTag;
  var (Projector) bool bDynamicAttach;
  var (Projector) bool bNoProjectOnOwner;
  var (Projector) bool bProjectOnHidden;
  var float FadeInTime;
  var (Projector) bool bScaleWithTexture;
  var (Projector) bool bIsEnabled;
  var float ExpireTime;
  var Texture GradientTexture;
  var const transient Plane FrustumPlanes[6];
  var const transient Vector FrustumVertices[8];
  var const transient Box Box;
  var const transient ProjectorRenderInfoPtr RenderInfo;
  var transient Matrix GradientMatrix;
  var transient Matrix Matrix;
  var transient Vector OldLocation;


  simulated event UnTouch(Actor Other) {
    DetachActor(Other);                                                         //0000 : 1B A3 2B 00 00 00 C0 7D 7E 0F 16 
    //1B A3 2B 00 00 00 C0 7D 7E 0F 16 04 0B 47 
  }


  simulated event Touch(Actor Other) {
    if (Other == None) {                                                        //0000 : 07 0D 00 72 00 28 7F 7E 0F 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    if (Other.bAcceptsProjectors
      && (ProjectTag == 'None' || Other.Tag == ProjectTag)
      && (bProjectStaticMesh || Other.StaticMesh == None)
      && (bProjectOnHidden || !Other.bHidden)
      && !Other.bStatic && bStatic && Other.StaticMesh != None) {//000D : 07 CE 00 82 82 82 82 19 00 28 7F 7E 0F 06 00 04 2D 01 48 6B 6E 0F 18 27 00 84 FE 01 A0 7F 7E 0F 21 00 00 00 00 16 18 16 00 FE 19 00 28 7F 7E 0F 05 00 04 01 C0 9E 6C 0F 01 A0 7F 7E 0F 16 16 16 18 1D 00 84 2D 01 18 80 7E 0F 18 12 00 72 19 00 28 7F 7E 0F 05 00 04 01 30 01 38 0F 2A 16 16 16 18 1D 00 84 2D 01 90 80 7E 0F 18 12 00 81 19 00 28 7F 7E 0F 06 00 04 2D 01 48 5E 6E 0F 16 16 16 18 33 00 81 82 82 19 00 28 7F 7E 0F 06 00 04 2D 01 40 00 38 0F 18 07 00 2D 01 40 00 38 0F 16 18 12 00 77 19 00 28 7F 7E 0F 05 00 04 01 30 01 38 0F 2A 16 16 16 16 
      AttachActor(Other);                                                       //00C3 : 1B A4 2B 00 00 00 28 7F 7E 0F 16 
    }
    //07 0D 00 72 00 28 7F 7E 0F 2A 16 04 0B 07 CE 00 82 82 82 82 19 00 28 7F 7E 0F 06 00 04 2D 01 48 
    //6B 6E 0F 18 27 00 84 FE 01 A0 7F 7E 0F 21 00 00 00 00 16 18 16 00 FE 19 00 28 7F 7E 0F 05 00 04 
    //01 C0 9E 6C 0F 01 A0 7F 7E 0F 16 16 16 18 1D 00 84 2D 01 18 80 7E 0F 18 12 00 72 19 00 28 7F 7E 
    //0F 05 00 04 01 30 01 38 0F 2A 16 16 16 18 1D 00 84 2D 01 90 80 7E 0F 18 12 00 81 19 00 28 7F 7E 
    //0F 06 00 04 2D 01 48 5E 6E 0F 16 16 16 18 33 00 81 82 82 19 00 28 7F 7E 0F 06 00 04 2D 01 40 00 
    //38 0F 18 07 00 2D 01 40 00 38 0F 16 18 12 00 77 19 00 28 7F 7E 0F 05 00 04 01 30 01 38 0F 2A 16 
    //16 16 16 1B A4 2B 00 00 00 28 7F 7E 0F 16 04 0B 47 
  }


  simulated event PostBeginPlay() {
    if (Level.NetMode == 1) {                                                   //0000 : 07 22 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 
      GotoState('NoProjection');                                                //0019 : 71 21 B9 2A 00 00 16 
      return;                                                                   //0020 : 04 0B 
    }
    AttachProjector(FadeInTime);                                                //0022 : 1B 9F 2A 00 00 01 50 82 7E 0F 16 
    if (bLevelStatic) {                                                         //002D : 07 3F 00 2D 01 C8 82 7E 0F 
      AbandonProjector();                                                       //0036 : 1B A6 2B 00 00 16 
      Destroy();                                                                //003C : 61 17 16 
    }
    if (bProjectActor) {                                                        //003F : 07 4D 00 2D 01 40 83 7E 0F 
      SetCollision(True,False);                                                 //0048 : 61 06 27 28 16 
    }
    //07 22 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 71 21 B9 2A 00 00 16 
    //04 0B 1B 9F 2A 00 00 01 50 82 7E 0F 16 07 3F 00 2D 01 C8 82 7E 0F 1B A6 2B 00 00 16 61 17 16 07 
    //4D 00 2D 01 40 83 7E 0F 61 06 27 28 16 04 0B 47 
  }


  function SetEnabled(bool IsEnabled) {
    bIsEnabled = IsEnabled;                                                     //0000 : 14 2D 01 20 85 7E 0F 2D 00 68 84 7E 0F 
    //14 2D 01 20 85 7E 0F 2D 00 68 84 7E 0F 04 0B 47 
  }


  native function DetachActor(Actor A);


  native function AttachActor(Actor A);


  native function AbandonProjector(optional float Lifetime);


  native function DetachProjector(optional bool Force);


  native function AttachProjector(optional float FadeInTime);


  state NoProjection {

      function BeginState() {
        Disable('Tick');                                                        //0000 : 76 21 50 01 00 00 16 
        //76 21 50 01 00 00 16 04 0B 47 
      }


    //08 47 

  }



