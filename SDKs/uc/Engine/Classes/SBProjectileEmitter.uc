//==============================================================================
//  SBProjectileEmitter
//==============================================================================

class SBProjectileEmitter extends Emitter
    dependsOn()
  ;

  var (Projectile) Actor TargetActor;
  var (Projectile) float TimeToTarget;
  var (Projectile) bool StartActive;
  var (Projectile) bool ResetableWhileActive;
  var transient Vector StartLocation;
  var transient bool Active;
  var transient float ProjectileTimer;


  function SetTargetActor(Actor anActor) {
    TargetActor = anActor;                                                      //0000 : 0F 01 18 24 F2 1C 00 80 55 EE 1C 
    //0F 01 18 24 F2 1C 00 80 55 EE 1C 04 0B 47 
  }


  function SetTimeToTarget(float aTime) {
    TimeToTarget = aTime;                                                       //0000 : 0F 01 28 3B F2 1C 00 68 FD F1 1C 
    //0F 01 28 3B F2 1C 00 68 FD F1 1C 04 0B 47 
  }


  function PrepareProjectile() {
    SetLocation(StartLocation);                                                 //0000 : 61 0B 01 F0 6A F2 1C 16 
    ProjectileTimer = 0.00000000;                                               //0008 : 0F 01 68 6B F2 1C 1E 00 00 00 00 
    //61 0B 01 F0 6A F2 1C 16 0F 01 68 6B F2 1C 1E 00 00 00 00 04 0B 47 
  }


  event cl_OnTick(float DeltaTime) {
    if (Active) {                                                               //0000 : 07 75 00 2D 01 50 80 F2 1C 
      ProjectileTimer += DeltaTime;                                             //0009 : B8 01 68 6B F2 1C 00 50 F3 F1 1C 16 
      if (ProjectileTimer <= TimeToTarget) {                                    //0015 : 07 54 00 B2 01 68 6B F2 1C 01 28 3B F2 1C 16 
        SetLocation(StartLocation + ProjectileTimer / TimeToTarget * (TargetActor.Location - StartLocation));//0024 : 61 0B D7 01 F0 6A F2 1C D5 AC 01 68 6B F2 1C 01 28 3B F2 1C 16 D8 19 01 18 24 F2 1C 05 00 0C 01 30 81 6C 0F 01 F0 6A F2 1C 16 16 16 16 
      } else {                                                                  //0051 : 06 75 00 
        SetLocation(TargetActor.Location);                                      //0054 : 61 0B 19 01 18 24 F2 1C 05 00 0C 01 30 81 6C 0F 16 
        UnTrigger(None,None);                                                   //0065 : 1B 33 01 00 00 2A 2A 16 
        Active = False;                                                         //006D : 14 2D 01 50 80 F2 1C 28 
      }
    }
    //07 75 00 2D 01 50 80 F2 1C B8 01 68 6B F2 1C 00 50 F3 F1 1C 16 07 54 00 B2 01 68 6B F2 1C 01 28 
    //3B F2 1C 16 61 0B D7 01 F0 6A F2 1C D5 AC 01 68 6B F2 1C 01 28 3B F2 1C 16 D8 19 01 18 24 F2 1C 
    //05 00 0C 01 30 81 6C 0F 01 F0 6A F2 1C 16 16 16 16 06 75 00 61 0B 19 01 18 24 F2 1C 05 00 0C 01 
    //30 81 6C 0F 16 1B 33 01 00 00 2A 2A 16 14 2D 01 50 80 F2 1C 28 04 0B 47 
  }


  event UnTrigger(Actor Other,Pawn EventInstigator) {
    PrepareProjectile();                                                        //0000 : 1B 6A 2B 00 00 16 
    Active = False;                                                             //0006 : 14 2D 01 50 80 F2 1C 28 
    Super.UnTrigger(Other,EventInstigator);                                     //000E : 1C B0 F2 7D 0F 00 08 55 EE 1C 00 38 E0 F1 1C 16 
    //1B 6A 2B 00 00 16 14 2D 01 50 80 F2 1C 28 1C B0 F2 7D 0F 00 08 55 EE 1C 00 38 E0 F1 1C 16 04 0B 
    //47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    Super.Trigger(Other,EventInstigator);                                       //0000 : 1C 50 F4 7D 0F 00 78 2A 7C 19 00 08 83 ED 1C 16 
    if (!Active || ResetableWhileActive) {                                      //0010 : 07 34 00 84 81 2D 01 50 80 F2 1C 16 18 07 00 2D 01 90 3F ED 1C 16 
      PrepareProjectile();                                                      //0026 : 1B 6A 2B 00 00 16 
      Active = True;                                                            //002C : 14 2D 01 50 80 F2 1C 27 
    }
    //1C 50 F4 7D 0F 00 78 2A 7C 19 00 08 83 ED 1C 16 07 34 00 84 81 2D 01 50 80 F2 1C 16 18 07 00 2D 
    //01 90 3F ED 1C 16 1B 6A 2B 00 00 16 14 2D 01 50 80 F2 1C 27 04 0B 47 
  }


  event BeginPlay() {
    StartLocation = Location;                                                   //0000 : 0F 01 F0 6A F2 1C 01 30 81 6C 0F 
    Active = StartActive;                                                       //000B : 14 2D 01 50 80 F2 1C 2D 01 A0 45 ED 1C 
    //0F 01 F0 6A F2 1C 01 30 81 6C 0F 14 2D 01 50 80 F2 1C 2D 01 A0 45 ED 1C 04 0B 47 
  }



