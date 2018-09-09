//==============================================================================
//  PhysicsVolume
//==============================================================================

class PhysicsVolume extends Volume
    native
    nativereplication
    dependsOn(ZoneInfo,Pawn,Controller,LevelInfo,Info)
  ;

  var (PhysicsVolume) Vector ZoneVelocity;
  var (PhysicsVolume) Vector Gravity;
  var Vector BACKUP_Gravity;
  var (PhysicsVolume) float GroundFriction;
  var (PhysicsVolume) float TerminalVelocity;
  var (PhysicsVolume) float DamagePerSec;
  var (PhysicsVolume) class<DamageType> DamageType;
  var (PhysicsVolume) int Priority;
  var (PhysicsVolume) Sound EntrySound;
  var (PhysicsVolume) Sound ExitSound;
  var (PhysicsVolume) editinline I3DL2Listener VolumeEffect;
  var (PhysicsVolume) class<Actor> EntryActor;
  var (PhysicsVolume) class<Actor> ExitActor;
  var (PhysicsVolume) class<Actor> PawnEntryActor;
  var (PhysicsVolume) float FluidFriction;
  var (PhysicsVolume) Vector ViewFlash;
  var (PhysicsVolume) Vector ViewFog;
  var (PhysicsVolume) bool bPainCausing;
  var bool BACKUP_bPainCausing;
  var (PhysicsVolume) bool bDestructive;
  var (PhysicsVolume) bool bNoInventory;
  var (PhysicsVolume) bool bMoveProjectiles;
  var (PhysicsVolume) bool bBounceVelocity;
  var (PhysicsVolume) bool bNeutralZone;
  var (PhysicsVolume) bool bWaterVolume;
  var (PhysicsVolume) bool bNoDecals;
  var (PhysicsVolume) bool bDamagesVehicles;
  var (VolumeFog) bool bDistanceFog;
  var (VolumeFog) float DistanceFogStart;
  var (VolumeFog) float DistanceFogEnd;
  var (VolumeFog) bool bDistanceFogColor;
  var (VolumeFog) Color DistanceFogColor;
  var (VolumeFog) float DistanceFogBlendTime;
  var (Karma) float KExtraLinearDamping;
  var (Karma) float KExtraAngularDamping;
  var (Karma) float KBuoyancy;
  var (LevelArea) string RespawnPoint;
  var Info PainTimer;
  var PhysicsVolume NextPhysicsVolume;


  function CausePainTo(Actor Other) {
    local float depth;
    local Pawn P;
    depth = 1.00000000;                                                         //0000 : 0F 00 D8 75 79 0F 1E 00 00 80 3F 
    P = Pawn(Other);                                                            //000B : 0F 00 50 76 79 0F 2E 50 31 D4 00 00 40 AA 30 0F 
    if (DamagePerSec > 0) {                                                     //001B : 07 CE 00 B1 01 08 AF 34 0F 39 3F 25 16 
      if (Region.Zone.bSoftKillZ && Other.Physics != 1) {                       //0028 : 07 5C 00 82 19 36 58 43 6E 0F 01 70 8A 6E 0F 06 00 04 2D 01 40 7F 72 0F 18 17 00 9B 39 3A 19 00 40 AA 30 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 01 16 16 
        return;                                                                 //005A : 04 0B 
      }
      Other.TakeDamage(DamagePerSec * depth,None,Location,vect(0.000000, 0.000000, 0.000000),DamageType);//005C : 19 00 40 AA 30 0F 2C 00 00 1B 5C 0C 00 00 39 44 AB 01 08 AF 34 0F 00 D8 75 79 0F 16 2A 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 01 68 09 38 0F 16 
      if (P != None && P.Controller != None) {                                  //0091 : 07 CB 00 82 77 00 50 76 79 0F 2A 16 18 12 00 77 19 00 50 76 79 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 
        P.Controller.PawnIsInPain(self);                                        //00B2 : 19 19 00 50 76 79 0F 05 00 04 01 00 6E 6C 0F 07 00 00 1B 16 2C 00 00 17 16 
      }
      goto jl00CE;                                                              //00CB : 06 CE 00 
    }
    //0F 00 D8 75 79 0F 1E 00 00 80 3F 0F 00 50 76 79 0F 2E 50 31 D4 00 00 40 AA 30 0F 07 CE 00 B1 01 
    //08 AF 34 0F 39 3F 25 16 07 5C 00 82 19 36 58 43 6E 0F 01 70 8A 6E 0F 06 00 04 2D 01 40 7F 72 0F 
    //18 17 00 9B 39 3A 19 00 40 AA 30 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 01 16 16 04 0B 19 00 40 AA 
    //30 0F 2C 00 00 1B 5C 0C 00 00 39 44 AB 01 08 AF 34 0F 00 D8 75 79 0F 16 2A 01 30 81 6C 0F 23 00 
    //00 00 00 00 00 00 00 00 00 00 00 01 68 09 38 0F 16 07 CB 00 82 77 00 50 76 79 0F 2A 16 18 12 00 
    //77 19 00 50 76 79 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 19 19 00 50 76 79 0F 05 00 04 01 00 6E 6C 
    //0F 07 00 00 1B 16 2C 00 00 17 16 06 CE 00 04 0B 47 
  }


  simulated function PlayExitSplash(Actor Other) {
    if (ExitSound != None) {                                                    //0000 : 07 2C 00 77 01 18 79 79 0F 2A 16 
      Other.PlaySound(ExitSound,3,Other.TransientSoundVolume);                  //000B : 19 00 A0 77 79 0F 18 00 00 61 08 01 18 79 79 0F 24 03 19 00 A0 77 79 0F 05 00 04 01 20 D4 6E 0F 16 
    }
    if (ExitActor != None && Level.NetMode != 1) {                              //002C : 07 96 00 82 77 01 10 AF 74 0F 2A 16 18 17 00 9B 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 16 
      Spawn(ExitActor,,,Other.Location - Other.CollisionHeight * vect(0.000000, 0.000000, 0.800000),rot(16384, 0, 0));//0052 : 61 16 01 10 AF 74 0F 0B 0B D8 19 00 A0 77 79 0F 05 00 0C 01 30 81 6C 0F D5 19 00 A0 77 79 0F 05 00 04 01 40 8A 6C 0F 23 00 00 00 00 00 00 00 00 CD CC 4C 3F 16 16 22 00 40 00 00 00 00 00 00 00 00 00 00 16 
    }
    //07 2C 00 77 01 18 79 79 0F 2A 16 19 00 A0 77 79 0F 18 00 00 61 08 01 18 79 79 0F 24 03 19 00 A0 
    //77 79 0F 05 00 04 01 20 D4 6E 0F 16 07 96 00 82 77 01 10 AF 74 0F 2A 16 18 17 00 9B 39 3A 19 01 
    //D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 16 61 16 01 10 AF 74 0F 0B 0B D8 19 00 A0 77 
    //79 0F 05 00 0C 01 30 81 6C 0F D5 19 00 A0 77 79 0F 05 00 04 01 40 8A 6C 0F 23 00 00 00 00 00 00 
    //00 00 CD CC 4C 3F 16 16 22 00 40 00 00 00 00 00 00 00 00 00 00 16 04 0B 47 
  }


  simulated event UnTouch(Actor Other) {
    if (bWaterVolume && Other.CanSplash()) {                                    //0000 : 07 28 00 82 2D 01 70 04 6F 0F 18 10 00 19 00 40 7A 79 0F 06 00 04 1B C4 2A 00 00 16 16 
      PlayExitSplash(Other);                                                    //001D : 1B B1 2B 00 00 00 40 7A 79 0F 16 
    }
    //07 28 00 82 2D 01 70 04 6F 0F 18 10 00 19 00 40 7A 79 0F 06 00 04 1B C4 2A 00 00 16 16 1B B1 2B 
    //00 00 00 40 7A 79 0F 16 04 0B 47 
  }


  simulated function PlayEntrySplash(Actor Other) {
    local Vector StartLoc;
    local Vector Vel2D;
    if (EntrySound != None) {                                                   //0000 : 07 48 00 77 01 08 7E 79 0F 2A 16 
      Other.PlaySound(EntrySound,3,Other.TransientSoundVolume);                 //000B : 19 00 D0 7B 79 0F 18 00 00 61 08 01 08 7E 79 0F 24 03 19 00 D0 7B 79 0F 05 00 04 01 20 D4 6E 0F 16 
      if (Other.Instigator != None) {                                           //002C : 07 48 00 77 19 00 D0 7B 79 0F 05 00 04 01 B8 80 6C 0F 2A 16 
        MakeNoise(1.00000000);                                                  //0040 : 62 00 1E 00 00 80 3F 16 
      }
    }
    if (EntryActor != None && Level.NetMode != 1) {                             //0048 : 07 22 01 82 77 01 80 7E 79 0F 2A 16 18 17 00 9B 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 16 
      StartLoc = Other.Location - Other.CollisionHeight * vect(0.000000, 0.000000, 0.800000);//006E : 0F 00 00 7F 79 0F D8 19 00 D0 7B 79 0F 05 00 0C 01 30 81 6C 0F D5 19 00 D0 7B 79 0F 05 00 04 01 40 8A 6C 0F 23 00 00 00 00 00 00 00 00 CD CC 4C 3F 16 16 
      if (Other.CollisionRadius > 0) {                                          //00A1 : 07 06 01 B1 19 00 D0 7B 79 0F 05 00 04 01 C8 89 6C 0F 39 3F 25 16 
        Vel2D = Other.Velocity;                                                 //00B7 : 0F 00 78 7F 79 0F 19 00 D0 7B 79 0F 05 00 0C 01 A0 95 6C 0F 
        Vel2D.Z = 0.00000000;                                                   //00CB : 0F 36 38 C5 69 0F 00 78 7F 79 0F 1E 00 00 00 00 
        if (VSize(Vel2D) > 100) {                                               //00DB : 07 06 01 B1 E1 00 78 7F 79 0F 16 39 3F 2C 64 16 
          StartLoc = StartLoc + Normal(Vel2D) * CollisionRadius;                //00EB : 0F 00 00 7F 79 0F D7 00 00 7F 79 0F D4 E2 00 78 7F 79 0F 16 01 C8 89 6C 0F 16 16 
        }
      }
      Spawn(EntryActor,,,StartLoc,rot(16384, 0, 0));                            //0106 : 61 16 01 80 7E 79 0F 0B 0B 00 00 7F 79 0F 22 00 40 00 00 00 00 00 00 00 00 00 00 16 
    }
    //07 48 00 77 01 08 7E 79 0F 2A 16 19 00 D0 7B 79 0F 18 00 00 61 08 01 08 7E 79 0F 24 03 19 00 D0 
    //7B 79 0F 05 00 04 01 20 D4 6E 0F 16 07 48 00 77 19 00 D0 7B 79 0F 05 00 04 01 B8 80 6C 0F 2A 16 
    //62 00 1E 00 00 80 3F 16 07 22 01 82 77 01 80 7E 79 0F 2A 16 18 17 00 9B 39 3A 19 01 D8 7E 6C 0F 
    //05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 16 0F 00 00 7F 79 0F D8 19 00 D0 7B 79 0F 05 00 0C 01 30 
    //81 6C 0F D5 19 00 D0 7B 79 0F 05 00 04 01 40 8A 6C 0F 23 00 00 00 00 00 00 00 00 CD CC 4C 3F 16 
    //16 07 06 01 B1 19 00 D0 7B 79 0F 05 00 04 01 C8 89 6C 0F 39 3F 25 16 0F 00 78 7F 79 0F 19 00 D0 
    //7B 79 0F 05 00 0C 01 A0 95 6C 0F 0F 36 38 C5 69 0F 00 78 7F 79 0F 1E 00 00 00 00 07 06 01 B1 E1 
    //00 78 7F 79 0F 16 39 3F 2C 64 16 0F 00 00 7F 79 0F D7 00 00 7F 79 0F D4 E2 00 78 7F 79 0F 16 01 
    //C8 89 6C 0F 16 16 61 16 01 80 7E 79 0F 0B 0B 00 00 7F 79 0F 22 00 40 00 00 00 00 00 00 00 00 00 
    //00 16 04 0B 47 
  }


  simulated event Touch(Actor Other) {
    local Pawn P;
    local bool bFoundPawn;
    Super.Touch(Other);                                                         //0000 : 1C 50 33 6D 0F 00 A0 80 79 0F 16 
    if (Other == None) {                                                        //000B : 07 18 00 72 00 A0 80 79 0F 2A 16 
      return;                                                                   //0016 : 04 0B 
    }
    if (Other.SBRole == 1 || Other.bNetTemporary) {                             //0018 : 07 48 01 84 9A 39 3A 19 00 A0 80 79 0F 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 18 10 00 19 00 A0 80 79 0F 06 00 04 2D 01 40 73 6E 0F 16 
      if (bPainCausing) {                                                       //0045 : 07 48 01 2D 01 90 AE 34 0F 
        if (Other.bDestroyInPainVolume) {                                       //004E : 07 6E 00 19 00 A0 80 79 0F 06 00 04 2D 01 B0 C2 6E 0F 
          Other.Destroy();                                                      //0060 : 19 00 A0 80 79 0F 03 00 04 61 17 16 
          return;                                                               //006C : 04 0B 
        }
        if (Other.bCanBeDamaged && !Other.bStatic) {                            //006E : 07 48 01 82 19 00 A0 80 79 0F 06 00 04 2D 01 60 C3 6E 0F 18 12 00 81 19 00 A0 80 79 0F 06 00 04 2D 01 40 00 38 0F 16 16 
          CausePainTo(Other);                                                   //0096 : 1B 12 2B 00 00 00 A0 80 79 0F 16 
          if (Other == None) {                                                  //00A1 : 07 AE 00 72 00 A0 80 79 0F 2A 16 
            return;                                                             //00AC : 04 0B 
          }
          if (SBRole == 1) {                                                    //00AE : 07 48 01 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
            if (PainTimer == None) {                                            //00BE : 07 DB 00 72 01 40 83 79 0F 2A 16 
              PainTimer = Spawn(Class'VolumeTimer',self);                       //00C9 : 0F 01 40 83 79 0F 61 16 20 F0 3E 6D 0F 17 16 
            } else {                                                            //00D8 : 06 48 01 
              if (Pawn(Other) != None) {                                        //00DB : 07 48 01 77 2E 50 31 D4 00 00 A0 80 79 0F 2A 16 
                foreach TouchingActors(Class'Pawn',P) {                         //00EB : 2F 61 33 20 50 31 D4 00 00 B8 83 79 0F 16 2A 01 
                  if (P != Other && P.bCanBeDamaged) {                          //00FB : 07 29 01 82 77 00 B8 83 79 0F 00 A0 80 79 0F 16 18 10 00 19 00 B8 83 79 0F 06 00 04 2D 01 60 C3 6E 0F 16 
                    bFoundPawn = True;                                          //011E : 14 2D 00 30 84 79 0F 27 
                  } else {                                                      //0126 : 06 2A 01 
                  }
                }
                if (!bFoundPawn) {                                              //012B : 07 48 01 81 2D 00 30 84 79 0F 16 
                  PainTimer.SetTimer(1.00000000,True);                          //0136 : 19 01 40 83 79 0F 09 00 00 61 18 1E 00 00 80 3F 27 16 
                }
              }
            }
          }
        }
      }
    }
    if (bWaterVolume && Other.CanSplash()) {                                    //0148 : 07 70 01 82 2D 01 70 04 6F 0F 18 10 00 19 00 A0 80 79 0F 06 00 04 1B C4 2A 00 00 16 16 
      PlayEntrySplash(Other);                                                   //0165 : 1B B4 2B 00 00 00 A0 80 79 0F 16 
    }
    //1C 50 33 6D 0F 00 A0 80 79 0F 16 07 18 00 72 00 A0 80 79 0F 2A 16 04 0B 07 48 01 84 9A 39 3A 19 
    //00 A0 80 79 0F 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 18 10 00 19 00 A0 80 79 0F 06 00 04 2D 01 
    //40 73 6E 0F 16 07 48 01 2D 01 90 AE 34 0F 07 6E 00 19 00 A0 80 79 0F 06 00 04 2D 01 B0 C2 6E 0F 
    //19 00 A0 80 79 0F 03 00 04 61 17 16 04 0B 07 48 01 82 19 00 A0 80 79 0F 06 00 04 2D 01 60 C3 6E 
    //0F 18 12 00 81 19 00 A0 80 79 0F 06 00 04 2D 01 40 00 38 0F 16 16 1B 12 2B 00 00 00 A0 80 79 0F 
    //16 07 AE 00 72 00 A0 80 79 0F 2A 16 04 0B 07 48 01 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 07 DB 
    //00 72 01 40 83 79 0F 2A 16 0F 01 40 83 79 0F 61 16 20 F0 3E 6D 0F 17 16 06 48 01 07 48 01 77 2E 
    //50 31 D4 00 00 A0 80 79 0F 2A 16 2F 61 33 20 50 31 D4 00 00 B8 83 79 0F 16 2A 01 07 29 01 82 77 
    //00 B8 83 79 0F 00 A0 80 79 0F 16 18 10 00 19 00 B8 83 79 0F 06 00 04 2D 01 60 C3 6E 0F 16 14 2D 
    //00 30 84 79 0F 27 06 2A 01 31 30 07 48 01 81 2D 00 30 84 79 0F 16 19 01 40 83 79 0F 09 00 00 61 
    //18 1E 00 00 80 3F 27 16 07 70 01 82 2D 01 70 04 6F 0F 18 10 00 19 00 A0 80 79 0F 06 00 04 1B C4 
    //2A 00 00 16 16 1B B4 2B 00 00 00 A0 80 79 0F 16 04 0B 47 
  }


  function Trigger(Actor Other,Pawn EventInstigator) {
    local Pawn P;
    if (DamagePerSec != 0) {                                                    //0000 : 07 5C 00 B5 01 08 AF 34 0F 39 3F 25 16 
      bPainCausing = !bPainCausing;                                             //000D : 14 2D 01 90 AE 34 0F 81 2D 01 90 AE 34 0F 16 
      if (bPainCausing) {                                                       //001C : 07 5C 00 2D 01 90 AE 34 0F 
        if (PainTimer == None) {                                                //0025 : 07 3F 00 72 01 40 83 79 0F 2A 16 
          PainTimer = Spawn(Class'VolumeTimer',self);                           //0030 : 0F 01 40 83 79 0F 61 16 20 F0 3E 6D 0F 17 16 
        }
        foreach TouchingActors(Class'Pawn',P) {                                 //003F : 2F 61 33 20 50 31 D4 00 00 80 86 79 0F 16 5B 00 
          CausePainTo(P);                                                       //004F : 1B 12 2B 00 00 00 80 86 79 0F 16 
        }
      }
    }
    //07 5C 00 B5 01 08 AF 34 0F 39 3F 25 16 14 2D 01 90 AE 34 0F 81 2D 01 90 AE 34 0F 16 07 5C 00 2D 
    //01 90 AE 34 0F 07 3F 00 72 01 40 83 79 0F 2A 16 0F 01 40 83 79 0F 61 16 20 F0 3E 6D 0F 17 16 2F 
    //61 33 20 50 31 D4 00 00 80 86 79 0F 16 5B 00 1B 12 2B 00 00 00 80 86 79 0F 16 31 30 04 0B 47 
  }


  function TimerPop(VolumeTimer t) {
    local Actor A;
    local bool bFound;
    if (t == PainTimer) {                                                       //0000 : 07 8C 00 72 00 20 88 79 0F 01 40 83 79 0F 16 
      if (!bPainCausing) {                                                      //000F : 07 28 00 81 2D 01 90 AE 34 0F 16 
        PainTimer.Destroy();                                                    //001A : 19 01 40 83 79 0F 03 00 04 61 17 16 
        return;                                                                 //0026 : 04 0B 
      }
      foreach TouchingActors(Class'Actor',A) {                                  //0028 : 2F 61 33 20 F8 8B C1 00 00 98 88 79 0F 16 74 00 
        if (A.bCanBeDamaged && !A.bStatic) {                                    //0038 : 07 73 00 82 19 00 98 88 79 0F 06 00 04 2D 01 60 C3 6E 0F 18 12 00 81 19 00 98 88 79 0F 06 00 04 2D 01 40 00 38 0F 16 16 
          CausePainTo(A);                                                       //0060 : 1B 12 2B 00 00 00 98 88 79 0F 16 
          bFound = True;                                                        //006B : 14 2D 00 10 89 79 0F 27 
        }
      }
      if (!bFound) {                                                            //0075 : 07 8C 00 81 2D 00 10 89 79 0F 16 
        PainTimer.Destroy();                                                    //0080 : 19 01 40 83 79 0F 03 00 04 61 17 16 
      }
    }
    //07 8C 00 72 00 20 88 79 0F 01 40 83 79 0F 16 07 28 00 81 2D 01 90 AE 34 0F 16 19 01 40 83 79 0F 
    //03 00 04 61 17 16 04 0B 2F 61 33 20 F8 8B C1 00 00 98 88 79 0F 16 74 00 07 73 00 82 19 00 98 88 
    //79 0F 06 00 04 2D 01 60 C3 6E 0F 18 12 00 81 19 00 98 88 79 0F 06 00 04 2D 01 40 00 38 0F 16 16 
    //1B 12 2B 00 00 00 98 88 79 0F 16 14 2D 00 10 89 79 0F 27 31 30 07 8C 00 81 2D 00 10 89 79 0F 16 
    //19 01 40 83 79 0F 03 00 04 61 17 16 04 0B 47 
  }


  singular event BaseChange() {
    if (Base != None) {                                                         //0000 : 07 13 00 77 01 B0 94 6C 0F 2A 16 
      bAlwaysRelevant = True;                                                   //000B : 14 2D 01 68 75 6E 0F 27 
    }
    //07 13 00 77 01 B0 94 6C 0F 2A 16 14 2D 01 68 75 6E 0F 27 04 0B 47 
  }


  function PlayerPawnDiedInVolume(Pawn Other) {
    UntriggerEvent(Event,self,Other);                                           //0000 : 1C 80 AF 34 0F 01 38 9F 6C 0F 17 00 E8 8A 79 0F 16 
    //1C 80 AF 34 0F 01 38 9F 6C 0F 17 00 E8 8A 79 0F 16 04 0B 47 
  }


  event PawnLeavingVolume(Pawn Other) {
    if (Other.IsPlayerPawn()) {                                                 //0000 : 07 23 00 19 00 58 8C 79 0F 06 00 04 1B B9 0C 00 00 16 
      UntriggerEvent(Event,self,Other);                                         //0012 : 1C 80 AF 34 0F 01 38 9F 6C 0F 17 00 58 8C 79 0F 16 
    }
    //07 23 00 19 00 58 8C 79 0F 06 00 04 1B B9 0C 00 00 16 1C 80 AF 34 0F 01 38 9F 6C 0F 17 00 58 8C 
    //79 0F 16 04 0B 47 
  }


  simulated event PawnEnteredVolume(Pawn Other) {
    local Vector HitLocation;
    local Vector HitNormal;
    local Actor SpawnedEntryActor;
    if (bWaterVolume
      && Level.TimeSeconds - Other.SplashTime > 0.30000001
      && PawnEntryActor != None
      && !Level.bDropDetail
      && Level.DetailMode != 0
      && EffectIsRelevant(Other.Location,False)) {//0000 : 07 20 01 82 82 82 82 82 2D 01 70 04 6F 0F 18 26 00 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 19 00 E0 8D 79 0F 05 00 04 01 20 B9 75 0F 16 1E 9A 99 99 3E 16 16 18 09 00 77 01 60 90 79 0F 2A 16 16 18 12 00 81 19 01 D8 7E 6C 0F 06 00 04 2D 01 F8 31 71 0F 16 16 18 17 00 9B 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 00 16 16 18 16 00 1B DA 2A 00 00 19 00 E0 8D 79 0F 05 00 0C 01 30 81 6C 0F 28 16 16 
      if (!TraceThisActor(HitLocation,HitNormal,Other.Location - Other.CollisionHeight * vect(0.000000, 0.000000, 1.000000),Other.Location + Other.CollisionHeight * vect(0.000000, 0.000000, 1.000000))) {//008B : 07 20 01 81 1C 48 0B 6D 0F 00 E0 90 79 0F 00 58 91 79 0F D8 19 00 E0 8D 79 0F 05 00 0C 01 30 81 6C 0F D5 19 00 E0 8D 79 0F 05 00 04 01 40 8A 6C 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 D7 19 00 E0 8D 79 0F 05 00 0C 01 30 81 6C 0F D5 19 00 E0 8D 79 0F 05 00 04 01 40 8A 6C 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 16 16 
        SpawnedEntryActor = Spawn(PawnEntryActor,Other,,HitLocation,rot(16384, 0, 0));//00FA : 0F 00 D0 91 79 0F 61 16 01 60 90 79 0F 00 E0 8D 79 0F 0B 00 E0 90 79 0F 22 00 40 00 00 00 00 00 00 00 00 00 00 16 
      }
    }
    if (SBRole == 1 && Other.IsPlayerPawn()) {                                  //0120 : 07 55 01 82 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 10 00 19 00 E0 8D 79 0F 06 00 04 1B B9 0C 00 00 16 16 
      TriggerEvent(Event,self,Other);                                           //0144 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 E0 8D 79 0F 16 
    }
    //07 20 01 82 82 82 82 82 2D 01 70 04 6F 0F 18 26 00 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 
    //0F 19 00 E0 8D 79 0F 05 00 04 01 20 B9 75 0F 16 1E 9A 99 99 3E 16 16 18 09 00 77 01 60 90 79 0F 
    //2A 16 16 18 12 00 81 19 01 D8 7E 6C 0F 06 00 04 2D 01 F8 31 71 0F 16 16 18 17 00 9B 39 3A 19 01 
    //D8 7E 6C 0F 05 00 01 01 20 B7 6C 0F 39 3A 24 00 16 16 18 16 00 1B DA 2A 00 00 19 00 E0 8D 79 0F 
    //05 00 0C 01 30 81 6C 0F 28 16 16 07 20 01 81 1C 48 0B 6D 0F 00 E0 90 79 0F 00 58 91 79 0F D8 19 
    //00 E0 8D 79 0F 05 00 0C 01 30 81 6C 0F D5 19 00 E0 8D 79 0F 05 00 04 01 40 8A 6C 0F 23 00 00 00 
    //00 00 00 00 00 00 00 80 3F 16 16 D7 19 00 E0 8D 79 0F 05 00 0C 01 30 81 6C 0F D5 19 00 E0 8D 79 
    //0F 05 00 04 01 40 8A 6C 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 16 16 0F 00 D0 91 79 0F 
    //61 16 01 60 90 79 0F 00 E0 8D 79 0F 0B 00 E0 90 79 0F 22 00 40 00 00 00 00 00 00 00 00 00 00 16 
    //07 55 01 82 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 18 10 00 19 00 E0 8D 79 0F 06 00 04 1B B9 0C 
    //00 00 16 16 1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 E0 8D 79 0F 16 04 0B 47 
  }


  event ActorLeavingVolume(Actor Other);


  event ActorEnteredVolume(Actor Other);


  event PhysicsChangedFor(Actor Other);


  function Reset() {
    Gravity = BACKUP_Gravity;                                                   //0000 : 0F 01 50 97 79 0F 01 C8 97 79 0F 
    bPainCausing = BACKUP_bPainCausing;                                         //000B : 14 2D 01 90 AE 34 0F 2D 01 40 98 79 0F 
    //0F 01 50 97 79 0F 01 C8 97 79 0F 14 2D 01 90 AE 34 0F 2D 01 40 98 79 0F 04 0B 47 
  }


  simulated function PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C 60 6B 79 0F 16 
    BACKUP_Gravity = Gravity;                                                   //0006 : 0F 01 C8 97 79 0F 01 50 97 79 0F 
    BACKUP_bPainCausing = bPainCausing;                                         //0011 : 14 2D 01 40 98 79 0F 2D 01 90 AE 34 0F 
    if (VolumeEffect == None && bWaterVolume) {                                 //001E : 07 50 00 82 72 01 08 9A 79 0F 2A 16 18 07 00 2D 01 70 04 6F 0F 16 
      VolumeEffect = new (Level.XLevel) Class'EFFECT_WaterVolume';              //0034 : 0F 01 08 9A 79 0F 11 19 01 D8 7E 6C 0F 05 00 04 01 E8 87 6E 0F 0B 0B 20 80 9A 79 0F 
    }
    //1C 60 6B 79 0F 16 0F 01 C8 97 79 0F 01 50 97 79 0F 14 2D 01 40 98 79 0F 2D 01 90 AE 34 0F 07 50 
    //00 82 72 01 08 9A 79 0F 2A 16 18 07 00 2D 01 70 04 6F 0F 16 0F 01 08 9A 79 0F 11 19 01 D8 7E 6C 
    //0F 05 00 04 01 E8 87 6E 0F 0B 0B 20 80 9A 79 0F 04 0B 47 
  }


  simulated function PreBeginPlay() {
    if (Base == None) {                                                         //0000 : 07 13 00 72 01 B0 94 6C 0F 2A 16 
      bAlwaysRelevant = False;                                                  //000B : 14 2D 01 68 75 6E 0F 28 
    }
    Super.PreBeginPlay();                                                       //0013 : 1C 18 B5 6C 0F 16 
    //07 13 00 72 01 B0 94 6C 0F 2A 16 14 2D 01 68 75 6E 0F 28 1C 18 B5 6C 0F 16 04 0B 47 
  }



