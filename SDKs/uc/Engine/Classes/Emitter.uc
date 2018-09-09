//==============================================================================
//  Emitter
//==============================================================================

class Emitter extends Actor
    native
    dependsOn(ParticleEmitter)
    Placeable
  ;

  var (Emitter) export editinline array<ParticleEmitter> Emitters;
  var (Global) RangeVector GlobalOffsetRange;
  var (Global) Range TimeTillResetRange;
  var (Global) bool AutoDestroy;
  var (Global) bool AutoReset;
  var (Global) bool DisableFogging;
  var (Size) float LocalDrawScale;
  var (Size) bool AddEffectScaleFromBase;
  var transient Vector OldLocation;
  var transient Vector GlobalOffset;
  var transient Vector AbsoluteVelocity;
  var transient int Initialized;
  var transient Box BoundingBox;
  var transient float EmitterRadius;
  var transient float EmitterHeight;
  var transient float TimeTillReset;
  var transient bool UseParticleProjectors;
  var transient bool DeleteParticleEmitters;
  var transient bool ActorForcesEnabled;
  var transient ParticleMaterial ParticleMaterial;
  var transient float KillDuration;
  var transient float KillTimer;


  simulated function Reset() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 C0 F1 7D 0F 25 
    while (i < Emitters.Length) {                                               //0007 : 07 47 00 96 00 C0 F1 7D 0F 37 01 38 F2 7D 0F 16 
      if (Emitters[i] != None) {                                                //0017 : 07 3D 00 77 10 00 C0 F1 7D 0F 01 38 F2 7D 0F 2A 16 
        Emitters[i].Reset();                                                    //0028 : 19 10 00 C0 F1 7D 0F 01 38 F2 7D 0F 06 00 00 1B 53 12 00 00 16 
      }
      i++;                                                                      //003D : A5 00 C0 F1 7D 0F 16 
    }
    //0F 00 C0 F1 7D 0F 25 07 47 00 96 00 C0 F1 7D 0F 37 01 38 F2 7D 0F 16 07 3D 00 77 10 00 C0 F1 7D 
    //0F 01 38 F2 7D 0F 2A 16 19 10 00 C0 F1 7D 0F 01 38 F2 7D 0F 06 00 00 1B 53 12 00 00 16 A5 00 C0 
    //F1 7D 0F 16 06 07 00 04 0B 47 
  }


  simulated event SpawnParticle(int Amount) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 D8 F3 7D 0F 25 
    while (i < Emitters.Length) {                                               //0007 : 07 4C 00 96 00 D8 F3 7D 0F 37 01 38 F2 7D 0F 16 
      if (Emitters[i] != None) {                                                //0017 : 07 42 00 77 10 00 D8 F3 7D 0F 01 38 F2 7D 0F 2A 16 
        Emitters[i].SpawnParticle(Amount);                                      //0028 : 19 10 00 D8 F3 7D 0F 01 38 F2 7D 0F 0B 00 00 1B 72 2B 00 00 00 60 F3 7D 0F 16 
      }
      i++;                                                                      //0042 : A5 00 D8 F3 7D 0F 16 
    }
    //0F 00 D8 F3 7D 0F 25 07 4C 00 96 00 D8 F3 7D 0F 37 01 38 F2 7D 0F 16 07 42 00 77 10 00 D8 F3 7D 
    //0F 01 38 F2 7D 0F 2A 16 19 10 00 D8 F3 7D 0F 01 38 F2 7D 0F 0B 00 00 1B 72 2B 00 00 00 60 F3 7D 
    //0F 16 A5 00 D8 F3 7D 0F 16 06 07 00 04 0B 47 
  }


  simulated event UnTrigger(Actor Other,Pawn EventInstigator) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 F0 FD 7D 0F 25 
    while (i < Emitters.Length) {                                               //0007 : 07 47 00 96 00 F0 FD 7D 0F 37 01 38 F2 7D 0F 16 
      if (Emitters[i] != None) {                                                //0017 : 07 3D 00 77 10 00 F0 FD 7D 0F 01 38 F2 7D 0F 2A 16 
        Emitters[i].UnTrigger();                                                //0028 : 19 10 00 F0 FD 7D 0F 01 38 F2 7D 0F 06 00 00 1B 33 01 00 00 16 
      }
      i++;                                                                      //003D : A5 00 F0 FD 7D 0F 16 
    }
    //0F 00 F0 FD 7D 0F 25 07 47 00 96 00 F0 FD 7D 0F 37 01 38 F2 7D 0F 16 07 3D 00 77 10 00 F0 FD 7D 
    //0F 01 38 F2 7D 0F 2A 16 19 10 00 F0 FD 7D 0F 01 38 F2 7D 0F 06 00 00 1B 33 01 00 00 16 A5 00 F0 
    //FD 7D 0F 16 06 07 00 04 0B 47 
  }


  simulated event Trigger(Actor Other,Pawn EventInstigator) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 A0 88 75 0F 25 
    while (i < Emitters.Length) {                                               //0007 : 07 47 00 96 00 A0 88 75 0F 37 01 38 F2 7D 0F 16 
      if (Emitters[i] != None) {                                                //0017 : 07 3D 00 77 10 00 A0 88 75 0F 01 38 F2 7D 0F 2A 16 
        Emitters[i].Trigger();                                                  //0028 : 19 10 00 A0 88 75 0F 01 38 F2 7D 0F 06 00 00 1B 32 01 00 00 16 
      }
      i++;                                                                      //003D : A5 00 A0 88 75 0F 16 
    }
    //0F 00 A0 88 75 0F 25 07 47 00 96 00 A0 88 75 0F 37 01 38 F2 7D 0F 16 07 3D 00 77 10 00 A0 88 75 
    //0F 01 38 F2 7D 0F 2A 16 19 10 00 A0 88 75 0F 01 38 F2 7D 0F 06 00 00 1B 32 01 00 00 16 A5 00 A0 
    //88 75 0F 16 06 07 00 04 0B 47 
  }


  simulated function UpdatePrecacheMaterials() {
    local int i;
    Super.UpdatePrecacheMaterials();                                            //0000 : 1C 90 FF 37 0F 16 
    i = 0;                                                                      //0006 : 0F 00 40 8A 75 0F 25 
    while (i < Emitters.Length) {                                               //000D : 07 75 00 96 00 40 8A 75 0F 37 01 38 F2 7D 0F 16 
      if (Emitters[i] != None) {                                                //001D : 07 6B 00 77 10 00 40 8A 75 0F 01 38 F2 7D 0F 2A 16 
        if (Emitters[i].Texture != None) {                                      //002E : 07 6B 00 77 19 10 00 40 8A 75 0F 01 38 F2 7D 0F 05 00 04 01 88 63 75 0F 2A 16 
          Level.AddPrecacheMaterial(Emitters[i].Texture);                       //0048 : 19 01 D8 7E 6C 0F 1A 00 00 1B 88 2A 00 00 19 10 00 40 8A 75 0F 01 38 F2 7D 0F 05 00 04 01 88 63 75 0F 16 
        }
      }
      i++;                                                                      //006B : A5 00 40 8A 75 0F 16 
    }
    //1C 90 FF 37 0F 16 0F 00 40 8A 75 0F 25 07 75 00 96 00 40 8A 75 0F 37 01 38 F2 7D 0F 16 07 6B 00 
    //77 10 00 40 8A 75 0F 01 38 F2 7D 0F 2A 16 07 6B 00 77 19 10 00 40 8A 75 0F 01 38 F2 7D 0F 05 00 
    //04 01 88 63 75 0F 2A 16 19 01 D8 7E 6C 0F 1A 00 00 1B 88 2A 00 00 19 10 00 40 8A 75 0F 01 38 F2 
    //7D 0F 05 00 04 01 88 63 75 0F 16 A5 00 40 8A 75 0F 16 06 0D 00 04 0B 47 
  }


  native function RenderScaleFactor(float aScale);


  function ScaleFactor(float aScale) {
    local int i;
    if (aScale > 0.00000000) {                                                  //0000 : 07 5B 00 B1 00 E8 8C 75 0F 1E 00 00 00 00 16 
      i = 0;                                                                    //000F : 0F 00 68 01 7E 0F 25 
      while (i < Emitters.Length) {                                             //0016 : 07 5B 00 96 00 68 01 7E 0F 37 01 38 F2 7D 0F 16 
        if (Emitters[i] != None) {                                              //0026 : 07 51 00 77 10 00 68 01 7E 0F 01 38 F2 7D 0F 2A 16 
          Emitters[i].ScaleFactor(aScale);                                      //0037 : 19 10 00 68 01 7E 0F 01 38 F2 7D 0F 0B 00 00 1B 76 2B 00 00 00 E8 8C 75 0F 16 
        }
        ++i;                                                                    //0051 : A3 00 68 01 7E 0F 16 
      }
    }
    //07 5B 00 B1 00 E8 8C 75 0F 1E 00 00 00 00 16 0F 00 68 01 7E 0F 25 07 5B 00 96 00 68 01 7E 0F 37 
    //01 38 F2 7D 0F 16 07 51 00 77 10 00 68 01 7E 0F 01 38 F2 7D 0F 2A 16 19 10 00 68 01 7E 0F 01 38 
    //F2 7D 0F 0B 00 00 1B 76 2B 00 00 00 E8 8C 75 0F 16 A3 00 68 01 7E 0F 16 06 16 00 04 0B 47 
  }


  native function Kill(optional float aDuration);



