//==============================================================================
//  SBProjector
//==============================================================================

class SBProjector extends Actor
    native
    dependsOn()
    Placeable
  ;

  var (SBProjector) int FOV;
  var (SBProjector) int MaxTraceDistance;
  var (SBProjector) byte BlendingOp;
  var int ProjWidth;
  var int ProjHeight;
  var const transient Plane FrustumPlanes[6];
  var const transient Vector FrustumVertices[8];
  var const transient Vector FrustumOrigin;
  var const transient Box Box;
  var const transient int TextureInterface;
  var const transient array<Actor> InfluencedActors;
  var transient Vector OldLocation;
  var transient Matrix Matrix;


  simulated event PostBeginPlay() {
    if (Level.NetMode == 1) {                                                   //0000 : 07 22 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 
      GotoState('NoProjection');                                                //0019 : 71 21 B9 2A 00 00 16 
      return;                                                                   //0020 : 04 0B 
    }
    AttachProjector();                                                          //0022 : 1B 9F 2A 00 00 16 
    //07 22 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 71 21 B9 2A 00 00 16 
    //04 0B 1B 9F 2A 00 00 16 04 0B 47 
  }


  native function DetachProjector();


  native function AttachProjector();


  state NoProjection {

      function BeginState() {
        Disable('Tick');                                                        //0000 : 76 21 50 01 00 00 16 
        //76 21 50 01 00 00 16 04 0B 47 
      }


    //08 47 

  }



