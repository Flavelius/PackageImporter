//==============================================================================
//  FluidSurfaceInfo
//==============================================================================

class FluidSurfaceInfo extends Info
    native
    noexport
    dependsOn(Class,DamageType)
    Placeable
  ;

  enum EFluidGridType {
    FGT_Square ,
    FGT_Hexagonal 
  };

  var (FluidSurfaceInfo) byte FluidGridType;
  var (FluidSurfaceInfo) float FluidGridSpacing;
  var (FluidSurfaceInfo) int FluidXSize;
  var (FluidSurfaceInfo) int FluidYSize;
  var (FluidSurfaceInfo) float FluidHeightScale;
  var (FluidSurfaceInfo) float FluidSpeed;
  var (FluidSurfaceInfo) float FluidTimeScale;
  var (FluidSurfaceInfo) float FluidDamping;
  var (FluidSurfaceInfo) float FluidNoiseFrequency;
  var (FluidSurfaceInfo) Range FluidNoiseStrength;
  var (FluidSurfaceInfo) bool TestRipple;
  var (FluidSurfaceInfo) float TestRippleSpeed;
  var (FluidSurfaceInfo) float TestRippleStrength;
  var (FluidSurfaceInfo) float TestRippleRadius;
  var (FluidSurfaceInfo) float UTiles;
  var (FluidSurfaceInfo) float UOffset;
  var (FluidSurfaceInfo) float VTiles;
  var (FluidSurfaceInfo) float VOffset;
  var (FluidSurfaceInfo) float AlphaCurveScale;
  var (FluidSurfaceInfo) float AlphaHeightScale;
  var (FluidSurfaceInfo) byte AlphaMax;
  var (FluidSurfaceInfo) float ShootStrength;
  var (FluidSurfaceInfo) float ShootRadius;
  var (FluidSurfaceInfo) float RippleVelocityFactor;
  var (FluidSurfaceInfo) float TouchStrength;
  var (FluidSurfaceInfo) class<Actor> ShootEffect;
  var (FluidSurfaceInfo) bool OrientShootEffect;
  var (FluidSurfaceInfo) class<Actor> TouchEffect;
  var (FluidSurfaceInfo) bool OrientTouchEffect;
  var const array<int> ClampBitmap;
  var (FluidSurfaceInfo) edfindable TerrainInfo ClampTerrain;
  var (FluidSurfaceInfo) bool bShowBoundingBox;
  var (FluidSurfaceInfo) bool bUseNoRenderZ;
  var (FluidSurfaceInfo) float NoRenderZ;
  var (FluidSurfaceInfo) float WarmUpTime;
  var (FluidSurfaceInfo) float UpdateRate;
  var (FluidSurfaceInfo) Color FluidColor;
  var const transient array<float> Verts0;
  var const transient array<float> Verts1;
  var const transient array<byte> VertAlpha;
  var const transient int LatestVerts;
  var const transient Box FluidBoundingBox;
  var const transient Vector FluidOrigin;
  var const transient float TimeRollover;
  var const transient float TestRippleAng;
  var const transient FluidSurfacePrimitive Primitive;
  var const transient array<FluidSurfaceOscillator> Oscillators;
  var const transient bool bHasWarmedUp;


  simulated function Touch(Actor Other) {
    local Vector touchLocation;
    Super.Touch(Other);                                                         //0000 : 1C 50 33 6D 0F 00 C8 FA 3A 19 16 
    if (Other == None || !Other.bDisturbFluidSurface) {                         //000B : 07 2E 00 84 72 00 C8 FA 3A 19 2A 16 18 12 00 81 19 00 C8 FA 3A 19 06 00 04 2D 01 58 C9 6E 0F 16 16 
      return;                                                                   //002C : 04 0B 
    }
    touchLocation = Other.Location;                                             //002E : 0F 00 A0 FC 3A 19 19 00 C8 FA 3A 19 05 00 0C 01 30 81 6C 0F 
    Pling(touchLocation,ShootStrength * Other.FluidSurfaceShootStrengthMod,Other.CollisionRadius);//0042 : 1C 18 FD 3A 19 00 A0 FC 3A 19 AB 01 C8 FD 3A 19 19 00 C8 FA 3A 19 05 00 04 01 D8 CF 6E 0F 16 19 00 C8 FA 3A 19 05 00 04 01 C8 89 6C 0F 16 
    touchLocation.Z = Location.Z;                                               //0070 : 0F 36 38 C5 69 0F 00 A0 FC 3A 19 36 38 C5 69 0F 01 30 81 6C 0F 
    if (TouchEffect != None
      && EffectIsRelevant(touchLocation,False)) {   //0085 : 07 DB 00 82 77 01 F8 D7 3A 19 2A 16 18 0D 00 1B DA 2A 00 00 00 A0 FC 3A 19 28 16 16 
      if (OrientTouchEffect) {                                                  //00A1 : 07 CC 00 2D 01 40 FE 3A 19 
        Spawn(TouchEffect,self,,touchLocation,rotator(Other.Velocity));         //00AA : 61 16 01 F8 D7 3A 19 17 0B 00 A0 FC 3A 19 39 50 19 00 C8 FA 3A 19 05 00 0C 01 A0 95 6C 0F 16 
      } else {                                                                  //00C9 : 06 DB 00 
        Spawn(TouchEffect,self,,touchLocation);                                 //00CC : 61 16 01 F8 D7 3A 19 17 0B 00 A0 FC 3A 19 16 
      }
    }
    //1C 50 33 6D 0F 00 C8 FA 3A 19 16 07 2E 00 84 72 00 C8 FA 3A 19 2A 16 18 12 00 81 19 00 C8 FA 3A 
    //19 06 00 04 2D 01 58 C9 6E 0F 16 16 04 0B 0F 00 A0 FC 3A 19 19 00 C8 FA 3A 19 05 00 0C 01 30 81 
    //6C 0F 1C 18 FD 3A 19 00 A0 FC 3A 19 AB 01 C8 FD 3A 19 19 00 C8 FA 3A 19 05 00 04 01 D8 CF 6E 0F 
    //16 19 00 C8 FA 3A 19 05 00 04 01 C8 89 6C 0F 16 0F 36 38 C5 69 0F 00 A0 FC 3A 19 36 38 C5 69 0F 
    //01 30 81 6C 0F 07 DB 00 82 77 01 F8 D7 3A 19 2A 16 18 0D 00 1B DA 2A 00 00 00 A0 FC 3A 19 28 16 
    //16 07 CC 00 2D 01 40 FE 3A 19 61 16 01 F8 D7 3A 19 17 0B 00 A0 FC 3A 19 39 50 19 00 C8 FA 3A 19 
    //05 00 0C 01 A0 95 6C 0F 16 06 DB 00 61 16 01 F8 D7 3A 19 17 0B 00 A0 FC 3A 19 16 04 0B 47 
  }


  simulated function TakeDamage(int Damage,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    if (DamageType.default.FluidSurfaceShootStrengthMod ~= 0) {                 //0000 : 07 18 00 D2 12 00 48 00 3B 19 05 00 04 02 D8 CF 6E 0F 39 3F 25 16 
      return;                                                                   //0016 : 04 0B 
    }
    Pling(HitLocation,ShootStrength * DamageType.default.FluidSurfaceShootStrengthMod,ShootRadius);//0018 : 1C 18 FD 3A 19 00 C8 00 3B 19 AB 01 C8 FD 3A 19 12 00 48 00 3B 19 05 00 04 02 D8 CF 6E 0F 16 01 40 01 3B 19 16 
    if (ShootEffect != None
      && EffectIsRelevant(HitLocation,False)) {     //003D : 07 8A 00 82 77 01 B8 01 3B 19 2A 16 18 0D 00 1B DA 2A 00 00 00 C8 00 3B 19 28 16 16 
      if (OrientShootEffect) {                                                  //0059 : 07 7B 00 2D 01 38 02 3B 19 
        Spawn(ShootEffect,self,,HitLocation,rotator(Momentum));                 //0062 : 61 16 01 B8 01 3B 19 17 0B 00 C8 00 3B 19 39 50 00 B0 02 3B 19 16 
      } else {                                                                  //0078 : 06 8A 00 
        Spawn(ShootEffect,self,,HitLocation);                                   //007B : 61 16 01 B8 01 3B 19 17 0B 00 C8 00 3B 19 16 
      }
    }
    //07 18 00 D2 12 00 48 00 3B 19 05 00 04 02 D8 CF 6E 0F 39 3F 25 16 04 0B 1C 18 FD 3A 19 00 C8 00 
    //3B 19 AB 01 C8 FD 3A 19 12 00 48 00 3B 19 05 00 04 02 D8 CF 6E 0F 16 01 40 01 3B 19 16 07 8A 00 
    //82 77 01 B8 01 3B 19 2A 16 18 0D 00 1B DA 2A 00 00 00 C8 00 3B 19 28 16 16 07 7B 00 2D 01 38 02 
    //3B 19 61 16 01 B8 01 3B 19 17 0B 00 C8 00 3B 19 39 50 00 B0 02 3B 19 16 06 8A 00 61 16 01 B8 01 
    //3B 19 17 0B 00 C8 00 3B 19 16 04 0B 47 
  }


  final native function Pling(Vector Position,float Strength,optional float Radius);



