//==============================================================================
//  xProcMesh
//==============================================================================

class xProcMesh extends Actor
    native
    exportstructs
    dependsOn()
    Placeable
  ;

  enum EProcMeshType {
    MT_Water ,
    MT_Deform 
  };

  struct ProcMeshVertex {
      var Vector Position;
      var Vector Normal;
      var Color Color;
      var float U;
      var float V;

  };


  var const array<ProcMeshVertex> Vertices;
  var const array<int> SectionOffsets;
  var (xProcMesh) float Dampening;
  var (xProcMesh) Range DampeningRange;
  var (xProcMesh) Range MovementClamp;
  var (xProcMesh) Range ForceClamp;
  var (xProcMesh) float ForceAttenuation;
  var (xProcMesh) float Tension;
  var (xProcMesh) float RestTension;
  var (xProcMesh) bool CheckCollision;
  var (xProcMesh) float Noise;
  var (xProcMesh) Range NoiseForce;
  var (xProcMesh) Range NoiseTimer;
  var transient float NoiseCounter;
  var (xProcMesh) byte ProcType;
  var (Force) bool bForceAffected;
  var (xProcMesh) bool bRigidEdges;
  var const transient int pProcData;
  var (xProcMesh) class<Effects> HitEffect;
  var (xProcMesh) class<Effects> BigHitEffect;
  var (xProcMesh) float BigMomentumThreshold;
  var (xProcMesh) float BigTouchThreshold;
  var (xProcMesh) float ShootStrength;
  var (xProcMesh) float TouchStrength;
  var (xProcMesh) float InfluenceRadius;


  simulated function Touch(Actor Other) {
    local Vector touchLocation;
    local Vector EffectNormal;
    local Vector EffectLocation;
    local float touchValue;
    Super.Touch(Other);                                                         //0000 : 1C 50 33 6D 0F 00 08 6D 38 0F 16 
    if (Other == None || !Other.bDisturbFluidSurface) {                         //000B : 07 2E 00 84 72 00 08 6D 38 0F 2A 16 18 12 00 81 19 00 08 6D 38 0F 06 00 04 2D 01 58 C9 6E 0F 16 16 
      return;                                                                   //002C : 04 0B 
    }
    touchLocation = Other.Location;                                             //002E : 0F 00 80 6D 38 0F 19 00 08 6D 38 0F 05 00 0C 01 30 81 6C 0F 
    touchValue = VSize(Velocity);                                               //0042 : 0F 00 F8 6D 38 0F E1 01 A0 95 6C 0F 16 
    ProcPling(touchLocation,TouchStrength,Other.CollisionRadius,EffectLocation,EffectNormal);//004F : 1C 70 6E 38 0F 00 80 6D 38 0F 01 20 6F 38 0F 19 00 08 6D 38 0F 05 00 04 01 C8 89 6C 0F 00 98 6F 38 0F 00 88 51 3C 19 16 
    if (touchValue > BigTouchThreshold && BigHitEffect != None) {               //0077 : 07 AC 00 82 B1 00 F8 6D 38 0F 01 00 52 3C 19 16 18 09 00 77 01 78 52 3C 19 2A 16 16 
      Spawn(BigHitEffect,self,,EffectLocation,rotator(EffectNormal));           //0093 : 61 16 01 78 52 3C 19 17 0B 00 98 6F 38 0F 39 50 00 88 51 3C 19 16 
    } else {                                                                    //00A9 : 06 CD 00 
      if (HitEffect != None) {                                                  //00AC : 07 CD 00 77 01 F8 52 3C 19 2A 16 
        Spawn(HitEffect,self,,EffectLocation,rotator(EffectNormal));            //00B7 : 61 16 01 F8 52 3C 19 17 0B 00 98 6F 38 0F 39 50 00 88 51 3C 19 16 
      }
    }
    //1C 50 33 6D 0F 00 08 6D 38 0F 16 07 2E 00 84 72 00 08 6D 38 0F 2A 16 18 12 00 81 19 00 08 6D 38 
    //0F 06 00 04 2D 01 58 C9 6E 0F 16 16 04 0B 0F 00 80 6D 38 0F 19 00 08 6D 38 0F 05 00 0C 01 30 81 
    //6C 0F 0F 00 F8 6D 38 0F E1 01 A0 95 6C 0F 16 1C 70 6E 38 0F 00 80 6D 38 0F 01 20 6F 38 0F 19 00 
    //08 6D 38 0F 05 00 04 01 C8 89 6C 0F 00 98 6F 38 0F 00 88 51 3C 19 16 07 AC 00 82 B1 00 F8 6D 38 
    //0F 01 00 52 3C 19 16 18 09 00 77 01 78 52 3C 19 2A 16 16 61 16 01 78 52 3C 19 17 0B 00 98 6F 38 
    //0F 39 50 00 88 51 3C 19 16 06 CD 00 07 CD 00 77 01 F8 52 3C 19 2A 16 61 16 01 F8 52 3C 19 17 0B 
    //00 98 6F 38 0F 39 50 00 88 51 3C 19 16 04 0B 47 
  }


  simulated function TakeDamage(int Damage,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    local Vector EffectNormal;
    local Vector EffectLocation;
    ProcPling(HitLocation,ShootStrength,0.00000000,EffectLocation,EffectNormal);//0000 : 1C 70 6E 38 0F 00 C0 54 3C 19 01 38 55 3C 19 1E 00 00 00 00 00 B0 55 3C 19 00 28 56 3C 19 16 
    if (VSize(Momentum) > BigMomentumThreshold
      && BigHitEffect != None) { //001F : 07 56 00 82 B1 E1 00 A0 56 3C 19 16 01 18 57 3C 19 16 18 09 00 77 01 78 52 3C 19 2A 16 16 
      Spawn(BigHitEffect,self,,EffectLocation,rotator(EffectNormal));           //003D : 61 16 01 78 52 3C 19 17 0B 00 B0 55 3C 19 39 50 00 28 56 3C 19 16 
    } else {                                                                    //0053 : 06 77 00 
      if (HitEffect != None) {                                                  //0056 : 07 77 00 77 01 F8 52 3C 19 2A 16 
        Spawn(HitEffect,self,,EffectLocation,rotator(EffectNormal));            //0061 : 61 16 01 F8 52 3C 19 17 0B 00 B0 55 3C 19 39 50 00 28 56 3C 19 16 
      }
    }
    //1C 70 6E 38 0F 00 C0 54 3C 19 01 38 55 3C 19 1E 00 00 00 00 00 B0 55 3C 19 00 28 56 3C 19 16 07 
    //56 00 82 B1 E1 00 A0 56 3C 19 16 01 18 57 3C 19 16 18 09 00 77 01 78 52 3C 19 2A 16 16 61 16 01 
    //78 52 3C 19 17 0B 00 B0 55 3C 19 39 50 00 28 56 3C 19 16 06 77 00 07 77 00 77 01 F8 52 3C 19 2A 
    //16 61 16 01 F8 52 3C 19 17 0B 00 B0 55 3C 19 39 50 00 28 56 3C 19 16 04 0B 47 
  }


  final native function ProcPling(Vector Position,float Strength,float Radius,out Vector EffectLocation,out Vector EffectNormal);



