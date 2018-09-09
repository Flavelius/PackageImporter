//==============================================================================
//  ScriptedProjectile
//==============================================================================

class ScriptedProjectile extends Game_Actor
    exportstructs
    dependsOn(NavigationPoint)
  ;

  enum ProjectileStates {
    STATE_LOADED ,
    STATE_FIRED ,
    STATE_EXPLODED 
  };

  var (Projectile) const array<NavigationPoint> Targets;
  var (Projectile) const float ReloadTimeout;
  var (Projectile) const float LaunchTimeoutMax;
  var (Projectile) const float LaunchTimeoutMin;
  var (Projectile) const float ParabolaScale;
  var (Projectile) const float MinFlightTime;
  var (Projectile) const float MaxFlightTime;
  var (Projectile) const bool StopSmokeEffectOnImpact;
  var (Projectile) const bool HiddenWhileIdle;
  var (Projectile) const bool TriggerAble;
  var (Projectile) const bool FireOnlyOnce;
  var (Projectile) const editinline array<FSkill_EffectClass_AudioVisual> Effects_Smoke;
  var (Projectile) const editinline array<FSkill_EffectClass_AudioVisual> Effects_Explosion;
  var byte ProjectileState;
  var float ProjectileTimer;
  var Vector StartLocation;
  var Rotator StartRotation;
  var Vector TargetLocation;
  var Vector ProjectileSpeed;
  var Vector ProjLocation;
  var float LaunchTimeout;
  var float FlightDist;
  var Vector ProjSpeed;
  var Rotator ProjRot;
  var array<int> SmokeEffectHandles;
  var array<int> ExplosionEffectHandles;
  var float ParabolaHeight;
  var bool Triggered;
  var bool HasFired;


  function StopEffects(out array<int> aEffectHandleArray) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 E8 A0 56 22 25 
    while (i < aEffectHandleArray.Length) {                                     //0007 : 07 4C 00 96 00 E8 A0 56 22 37 00 E8 F6 7C 19 16 
      if (aEffectHandleArray[i] != 0) {                                         //0017 : 07 42 00 9B 10 00 E8 A0 56 22 00 E8 F6 7C 19 25 16 
        Effects.cl_Stop(aEffectHandleArray[i]);                                 //0028 : 19 01 B8 F3 1E 11 11 00 04 1C D8 65 34 0F 10 00 E8 A0 56 22 00 E8 F6 7C 19 16 
      }
      i++;                                                                      //0042 : A5 00 E8 A0 56 22 16 
    }
    aEffectHandleArray.Length = 0;                                              //004C : 0F 37 00 E8 F6 7C 19 25 
    //0F 00 E8 A0 56 22 25 07 4C 00 96 00 E8 A0 56 22 37 00 E8 F6 7C 19 16 07 42 00 9B 10 00 E8 A0 56 
    //22 00 E8 F6 7C 19 25 16 19 01 B8 F3 1E 11 11 00 04 1C D8 65 34 0F 10 00 E8 A0 56 22 00 E8 F6 7C 
    //19 16 A5 00 E8 A0 56 22 16 06 07 00 0F 37 00 E8 F6 7C 19 25 04 0B 47 
  }


  function StartEffects(array<FSkill_EffectClass_AudioVisual> aEffects,out array<int> aEffectHandleArray) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 88 9B EE 22 25 
    while (i < aEffects.Length) {                                               //0007 : 07 91 00 96 00 88 9B EE 22 37 00 10 10 6A 22 16 
      if (aEffects[i] != None) {                                                //0017 : 07 87 00 77 10 00 88 9B EE 22 00 10 10 6A 22 2A 16 
        aEffectHandleArray[aEffectHandleArray.Length] = Effects.cl_Start(aEffects[i],Class'Game_Effects'.-1073741824,Class'Game_Effects'.-1073741824.00000000,Class'Game_Effects'.-1073741824.00000000,Class'FSkill_EffectClass_AudioVisual'.-1.00000000);//0028 : 0F 10 37 00 B0 15 6A 22 00 B0 15 6A 22 19 01 B8 F3 1E 11 49 00 04 1C 28 65 34 0F 10 00 88 9B EE 22 00 10 10 6A 22 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 
      }
      i++;                                                                      //0087 : A5 00 88 9B EE 22 16 
    }
    //0F 00 88 9B EE 22 25 07 91 00 96 00 88 9B EE 22 37 00 10 10 6A 22 16 07 87 00 77 10 00 88 9B EE 
    //22 00 10 10 6A 22 2A 16 0F 10 37 00 B0 15 6A 22 00 B0 15 6A 22 19 01 B8 F3 1E 11 49 00 04 1C 28 
    //65 34 0F 10 00 88 9B EE 22 00 10 10 6A 22 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 
    //5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 00 
    //04 1E 00 00 80 BF 16 A5 00 88 9B EE 22 16 06 07 00 04 0B 47 
  }


  event cl_OnTick(float delta) {
    local Vector TempLocation;
    local float FlightTime;
    Super.cl_OnTick(delta);                                                     //0000 : 1C B8 8C 2A 11 00 F8 F5 7C 19 16 
    if (FireOnlyOnce && HasFired) {                                             //000B : 07 21 00 82 2D 01 98 8E 61 22 18 07 00 2D 01 58 13 6A 22 16 
      return;                                                                   //001F : 04 0B 
    }
    if (Triggered || !TriggerAble) {                                            //0021 : 07 AD 02 84 2D 01 60 FE 7C 19 18 09 00 81 2D 01 10 8F 61 22 16 16 
      ProjectileTimer += delta;                                                 //0037 : B8 01 68 FC 62 22 00 F8 F5 7C 19 16 
      switch (ProjectileState) {                                                //0043 : 05 01 01 78 9C EE 22 
        case 0 :                                                                //004A : 0A 31 01 24 00 
          if (ProjectileTimer > LaunchTimeout) {                                //004F : 07 2E 01 B1 01 68 FC 62 22 01 E0 FA 7C 19 16 
            if (Targets.Length > 0) {                                           //005E : 07 2E 01 97 37 01 00 F9 7C 19 25 16 
              TargetLocation = Targets[Rand(Targets.Length)].Location;          //006A : 0F 01 E0 F7 62 22 19 10 A7 37 01 00 F9 7C 19 16 01 00 F9 7C 19 05 00 0C 01 30 81 6C 0F 
              FlightTime = static.FRandRange(MinFlightTime,MaxFlightTime);      //0087 : 0F 00 38 15 6A 22 1C E0 F0 6A 0F 01 78 90 61 22 01 00 90 61 22 16 
              ProjLocation = Location;                                          //009D : 0F 01 90 30 63 22 01 30 81 6C 0F 
              ProjectileSpeed = (TargetLocation - Location) / FlightTime;       //00A8 : 0F 01 68 FA 7C 19 D6 D8 01 E0 F7 62 22 01 30 81 6C 0F 16 00 38 15 6A 22 16 
              FlightDist = VSize(TargetLocation - Location);                    //00C1 : 0F 01 00 9C EE 22 E1 D8 01 E0 F7 62 22 01 30 81 6C 0F 16 16 
              if (FlightDist == 0) {                                            //00D5 : 07 ED 00 B4 01 00 9C EE 22 39 3F 25 16 
                FlightDist = 1.00000000;                                        //00E2 : 0F 01 00 9C EE 22 1E 00 00 80 3F 
              }
              ParabolaHeight = FlightDist / 10 * ParabolaScale;                 //00ED : 0F 01 E0 12 6A 22 AB AC 01 00 9C EE 22 39 3F 2C 0A 16 01 F0 90 61 22 16 
              StartEffects(Effects_Smoke,SmokeEffectHandles);                   //0105 : 1B 5F 0D 00 00 01 20 8E 61 22 01 58 FB 7C 19 16 
              ProjectileState = 1;                                              //0115 : 0F 01 78 9C EE 22 24 01 
              if (HiddenWhileIdle) {                                            //011D : 07 2E 01 2D 01 00 11 6A 22 
                bHidden = False;                                                //0126 : 14 2D 01 48 5E 6E 0F 28 
              }
            }
          }
          break;                                                                //012E : 06 AD 02 
        case 1 :                                                                //0131 : 0A 28 02 24 01 
          ProjLocation = ProjLocation + ProjectileSpeed * delta;                //0136 : 0F 01 90 30 63 22 D7 01 90 30 63 22 D4 01 68 FA 7C 19 00 F8 F5 7C 19 16 16 
          if (VSize(TargetLocation - ProjLocation) < VSize(ProjectileSpeed * delta * 1.50000000)) {//014F : 07 CD 01 B0 E1 D8 01 E0 F7 62 22 01 90 30 63 22 16 16 E1 D4 D4 01 68 FA 7C 19 00 F8 F5 7C 19 16 1E 00 00 C0 3F 16 16 16 
            SetRotation(rotator(TargetLocation - Location));                    //0177 : 1C 70 01 6E 0F 39 50 D8 01 E0 F7 62 22 01 30 81 6C 0F 16 16 
            SetLocation(TargetLocation);                                        //018B : 61 0B 01 E0 F7 62 22 16 
            ProjectileTimer = 0.00000000;                                       //0193 : 0F 01 68 FC 62 22 1E 00 00 00 00 
            ProjectileState = 2;                                                //019E : 0F 01 78 9C EE 22 24 02 
            if (StopSmokeEffectOnImpact) {                                      //01A6 : 07 BA 01 2D 01 88 8F 61 22 
              StopEffects(SmokeEffectHandles);                                  //01AF : 1B D4 0C 00 00 01 58 FB 7C 19 16 
            }
            StartEffects(Effects_Explosion,ExplosionEffectHandles);             //01BA : 1B 5F 0D 00 00 01 98 1F 6A 22 01 68 12 6A 22 16 
          } else {                                                              //01CA : 06 25 02 
            TempLocation = ProjLocation;                                        //01CD : 0F 00 70 F6 7C 19 01 90 30 63 22 
            TempLocation.Z += Sin(VSize(ProjLocation - TargetLocation) / FlightDist * 3.14159274) * ParabolaHeight;//01D8 : B8 36 38 C5 69 0F 00 70 F6 7C 19 AB BB AB AC E1 D8 01 90 30 63 22 01 E0 F7 62 22 16 16 01 00 9C EE 22 16 1E DB 0F 49 40 16 16 01 E0 12 6A 22 16 16 
            SetRotation(rotator(TempLocation - Location));                      //0209 : 1C 70 01 6E 0F 39 50 D8 00 70 F6 7C 19 01 30 81 6C 0F 16 16 
            SetLocation(TempLocation);                                          //021D : 61 0B 00 70 F6 7C 19 16 
          }
          break;                                                                //0225 : 06 AD 02 
        case 2 :                                                                //0228 : 0A AA 02 24 02 
          if (ProjectileTimer > ReloadTimeout) {                                //022D : 07 A7 02 B1 01 68 FC 62 22 01 68 91 61 22 16 
            ProjectileTimer = 0.00000000;                                       //023C : 0F 01 68 FC 62 22 1E 00 00 00 00 
            SetLocation(StartLocation);                                         //0247 : 61 0B 01 78 11 6A 22 16 
            SetRotation(StartRotation);                                         //024F : 1C 70 01 6E 0F 01 F0 11 6A 22 16 
            LaunchTimeout = static.FRandRange(LaunchTimeoutMin,LaunchTimeoutMax);//025A : 0F 01 E0 FA 7C 19 1C E0 F0 6A 0F 01 78 F9 7C 19 01 88 10 6A 22 16 
            StopEffects(SmokeEffectHandles);                                    //0270 : 1B D4 0C 00 00 01 58 FB 7C 19 16 
            StopEffects(ExplosionEffectHandles);                                //027B : 1B D4 0C 00 00 01 68 12 6A 22 16 
            if (HiddenWhileIdle) {                                              //0286 : 07 97 02 2D 01 00 11 6A 22 
              bHidden = True;                                                   //028F : 14 2D 01 48 5E 6E 0F 27 
            }
            HasFired = True;                                                    //0297 : 14 2D 01 58 13 6A 22 27 
            ProjectileState = 0;                                                //029F : 0F 01 78 9C EE 22 24 00 
          }
          break;                                                                //02A7 : 06 AD 02 
        default:                                                                //02AA : 0A FF FF 
      }
    }
    //1C B8 8C 2A 11 00 F8 F5 7C 19 16 07 21 00 82 2D 01 98 8E 61 22 18 07 00 2D 01 58 13 6A 22 16 04 
    //0B 07 AD 02 84 2D 01 60 FE 7C 19 18 09 00 81 2D 01 10 8F 61 22 16 16 B8 01 68 FC 62 22 00 F8 F5 
    //7C 19 16 05 01 01 78 9C EE 22 0A 31 01 24 00 07 2E 01 B1 01 68 FC 62 22 01 E0 FA 7C 19 16 07 2E 
    //01 97 37 01 00 F9 7C 19 25 16 0F 01 E0 F7 62 22 19 10 A7 37 01 00 F9 7C 19 16 01 00 F9 7C 19 05 
    //00 0C 01 30 81 6C 0F 0F 00 38 15 6A 22 1C E0 F0 6A 0F 01 78 90 61 22 01 00 90 61 22 16 0F 01 90 
    //30 63 22 01 30 81 6C 0F 0F 01 68 FA 7C 19 D6 D8 01 E0 F7 62 22 01 30 81 6C 0F 16 00 38 15 6A 22 
    //16 0F 01 00 9C EE 22 E1 D8 01 E0 F7 62 22 01 30 81 6C 0F 16 16 07 ED 00 B4 01 00 9C EE 22 39 3F 
    //25 16 0F 01 00 9C EE 22 1E 00 00 80 3F 0F 01 E0 12 6A 22 AB AC 01 00 9C EE 22 39 3F 2C 0A 16 01 
    //F0 90 61 22 16 1B 5F 0D 00 00 01 20 8E 61 22 01 58 FB 7C 19 16 0F 01 78 9C EE 22 24 01 07 2E 01 
    //2D 01 00 11 6A 22 14 2D 01 48 5E 6E 0F 28 06 AD 02 0A 28 02 24 01 0F 01 90 30 63 22 D7 01 90 30 
    //63 22 D4 01 68 FA 7C 19 00 F8 F5 7C 19 16 16 07 CD 01 B0 E1 D8 01 E0 F7 62 22 01 90 30 63 22 16 
    //16 E1 D4 D4 01 68 FA 7C 19 00 F8 F5 7C 19 16 1E 00 00 C0 3F 16 16 16 1C 70 01 6E 0F 39 50 D8 01 
    //E0 F7 62 22 01 30 81 6C 0F 16 16 61 0B 01 E0 F7 62 22 16 0F 01 68 FC 62 22 1E 00 00 00 00 0F 01 
    //78 9C EE 22 24 02 07 BA 01 2D 01 88 8F 61 22 1B D4 0C 00 00 01 58 FB 7C 19 16 1B 5F 0D 00 00 01 
    //98 1F 6A 22 01 68 12 6A 22 16 06 25 02 0F 00 70 F6 7C 19 01 90 30 63 22 B8 36 38 C5 69 0F 00 70 
    //F6 7C 19 AB BB AB AC E1 D8 01 90 30 63 22 01 E0 F7 62 22 16 16 01 00 9C EE 22 16 1E DB 0F 49 40 
    //16 16 01 E0 12 6A 22 16 16 1C 70 01 6E 0F 39 50 D8 00 70 F6 7C 19 01 30 81 6C 0F 16 16 61 0B 00 
    //70 F6 7C 19 16 06 AD 02 0A AA 02 24 02 07 A7 02 B1 01 68 FC 62 22 01 68 91 61 22 16 0F 01 68 FC 
    //62 22 1E 00 00 00 00 61 0B 01 78 11 6A 22 16 1C 70 01 6E 0F 01 F0 11 6A 22 16 0F 01 E0 FA 7C 19 
    //1C E0 F0 6A 0F 01 78 F9 7C 19 01 88 10 6A 22 16 1B D4 0C 00 00 01 58 FB 7C 19 16 1B D4 0C 00 00 
    //01 68 12 6A 22 16 07 97 02 2D 01 00 11 6A 22 14 2D 01 48 5E 6E 0F 27 14 2D 01 58 13 6A 22 27 0F 
    //01 78 9C EE 22 24 00 06 AD 02 0A FF FF 04 0B 47 
  }


  event UnTrigger(Actor Other,Pawn EventInstigator) {
    Triggered = False;                                                          //0000 : 14 2D 01 60 FE 7C 19 28 
    //14 2D 01 60 FE 7C 19 28 04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    Triggered = True;                                                           //0000 : 14 2D 01 60 FE 7C 19 27 
    //14 2D 01 60 FE 7C 19 27 04 0B 47 
  }


  event BeginPlay() {
    SetPhysics(4);                                                              //0000 : 6F 82 24 04 16 
    StartLocation = Location;                                                   //0005 : 0F 01 78 11 6A 22 01 30 81 6C 0F 
    StartRotation = Rotation;                                                   //0010 : 0F 01 F0 11 6A 22 01 00 84 6C 0F 
    ProjectileState = 0;                                                        //001B : 0F 01 78 9C EE 22 24 00 
    ProjectileTimer = 0.00000000;                                               //0023 : 0F 01 68 FC 62 22 1E 00 00 00 00 
    LaunchTimeout = static.FRandRange(LaunchTimeoutMin,Max(LaunchTimeoutMax,LaunchTimeoutMin));//002E : 0F 01 E0 FA 7C 19 1C E0 F0 6A 0F 01 78 F9 7C 19 39 3F FA 39 44 01 88 10 6A 22 39 44 01 78 F9 7C 19 16 16 
    //6F 82 24 04 16 0F 01 78 11 6A 22 01 30 81 6C 0F 0F 01 F0 11 6A 22 01 00 84 6C 0F 0F 01 78 9C EE 
    //22 24 00 0F 01 68 FC 62 22 1E 00 00 00 00 0F 01 E0 FA 7C 19 1C E0 F0 6A 0F 01 78 F9 7C 19 39 3F 
    //FA 39 44 01 88 10 6A 22 39 44 01 78 F9 7C 19 16 16 04 0B 47 
  }



