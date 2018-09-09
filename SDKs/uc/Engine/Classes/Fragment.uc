//==============================================================================
//  Fragment
//==============================================================================

class Fragment extends Effects
    dependsOn(LevelInfo,PhysicsVolume)
  ;

  var (Fragment) Mesh Fragments[11];
  var int numFragmentTypes;
  var bool bFirstHit;
  var (Fragment) Sound ImpactSound;
  var (Fragment) Sound AltImpactSound;
  var (Fragment) float SplashTime;


  final simulated function RandSpin(float spinRate) {
    DesiredRotation = RotRand();                                                //0000 : 0F 01 D0 E8 6E 0F 61 40 16 
    RotationRate.Yaw = spinRate * 2 * FRand() - spinRate;                       //0009 : 0F 36 20 BF 69 0F 01 30 E8 6E 0F 39 44 AF AB AB 00 68 0D 3C 19 39 3F 2C 02 16 C3 16 16 00 68 0D 3C 19 16 
    RotationRate.Pitch = spinRate * 2 * FRand() - spinRate;                     //002C : 0F 36 A8 BE 69 0F 01 30 E8 6E 0F 39 44 AF AB AB 00 68 0D 3C 19 39 3F 2C 02 16 C3 16 16 00 68 0D 3C 19 16 
    RotationRate.Roll = spinRate * 2 * FRand() - spinRate;                      //004F : 0F 36 98 BF 69 0F 01 30 E8 6E 0F 39 44 AF AB AB 00 68 0D 3C 19 39 3F 2C 02 16 C3 16 16 00 68 0D 3C 19 16 
    //0F 01 D0 E8 6E 0F 61 40 16 0F 36 20 BF 69 0F 01 30 E8 6E 0F 39 44 AF AB AB 00 68 0D 3C 19 39 3F 
    //2C 02 16 C3 16 16 00 68 0D 3C 19 16 0F 36 A8 BE 69 0F 01 30 E8 6E 0F 39 44 AF AB AB 00 68 0D 3C 
    //19 39 3F 2C 02 16 C3 16 16 00 68 0D 3C 19 16 0F 36 98 BF 69 0F 01 30 E8 6E 0F 39 44 AF AB AB 00 
    //68 0D 3C 19 39 3F 2C 02 16 C3 16 16 00 68 0D 3C 19 16 04 0B 47 
  }


  simulated function HitWall(Vector HitNormal,Actor HitWall) {
    local float speed;
    Velocity = 0.50000000 * (Velocity Dot HitNormal * HitNormal * -2.00000000 + Velocity);//0000 : 0F 01 A0 95 6C 0F D5 1E 00 00 00 3F D7 D4 D5 DB 01 A0 95 6C 0F 00 58 0F 3C 19 16 00 58 0F 3C 19 16 1E 00 00 00 C0 16 01 A0 95 6C 0F 16 16 
    speed = VSize(Velocity);                                                    //002E : 0F 00 D0 0F 3C 19 E1 01 A0 95 6C 0F 16 
    if (bFirstHit && speed < 400) {                                             //003B : 07 9F 00 82 2D 01 40 0C 3C 19 18 0F 00 B0 00 D0 0F 3C 19 39 3F 1D 90 01 00 00 16 16 
      bFirstHit = False;                                                        //0057 : 14 2D 01 40 0C 3C 19 28 
      bRotateToDesired = True;                                                  //005F : 14 2D 01 E8 E2 6E 0F 27 
      bFixedRotationDir = False;                                                //0067 : 14 2D 01 28 E2 6E 0F 28 
      DesiredRotation.Pitch = 0;                                                //006F : 0F 36 A8 BE 69 0F 01 D0 E8 6E 0F 25 
      DesiredRotation.Yaw = FRand() * 65536;                                    //007B : 0F 36 20 BF 69 0F 01 D0 E8 6E 0F 39 44 AB C3 16 39 3F 1D 00 00 01 00 16 
      DesiredRotation.Roll = 0;                                                 //0093 : 0F 36 98 BF 69 0F 01 D0 E8 6E 0F 25 
    }
    RotationRate.Yaw = RotationRate.Yaw * 0.75000000;                           //009F : 0F 36 20 BF 69 0F 01 30 E8 6E 0F 39 44 AB 39 3F 36 20 BF 69 0F 01 30 E8 6E 0F 1E 00 00 40 3F 16 
    RotationRate.Roll = RotationRate.Roll * 0.75000000;                         //00BF : 0F 36 98 BF 69 0F 01 30 E8 6E 0F 39 44 AB 39 3F 36 98 BF 69 0F 01 30 E8 6E 0F 1E 00 00 40 3F 16 
    RotationRate.Pitch = RotationRate.Pitch * 0.75000000;                       //00DF : 0F 36 A8 BE 69 0F 01 30 E8 6E 0F 39 44 AB 39 3F 36 A8 BE 69 0F 01 30 E8 6E 0F 1E 00 00 40 3F 16 
    if (speed < 60 && HitNormal.Z > 0.69999999) {                               //00FF : 07 3A 01 82 B0 00 D0 0F 3C 19 39 3F 2C 3C 16 18 12 00 B1 36 38 C5 69 0F 00 58 0F 3C 19 1E 33 33 33 3F 16 16 
      SetPhysics(0);                                                            //0123 : 6F 82 24 00 16 
      bBounce = False;                                                          //0128 : 14 2D 01 28 95 6C 0F 28 
      GotoState('Dying');                                                       //0130 : 71 21 DD 2A 00 00 16 
    } else {                                                                    //0137 : 06 9B 01 
      if (speed > 80) {                                                         //013A : 07 9B 01 B1 00 D0 0F 3C 19 39 3F 2C 50 16 
        if (FRand() < 0.50000000) {                                             //0148 : 07 79 01 B0 C3 16 1E 00 00 00 3F 16 
          PlaySound(ImpactSound,0,,,300.00000000,0.85000002 + FRand() * 0.30000001,True);//0154 : 61 08 01 48 10 3C 19 24 00 0B 0B 1E 00 00 96 43 AE 1E 9A 99 59 3F AB C3 16 1E 9A 99 99 3E 16 16 27 16 
        } else {                                                                //0176 : 06 9B 01 
          PlaySound(AltImpactSound,0,,,300.00000000,0.85000002 + FRand() * 0.30000001,True);//0179 : 61 08 01 C0 10 3C 19 24 00 0B 0B 1E 00 00 96 43 AE 1E 9A 99 59 3F AB C3 16 1E 9A 99 99 3E 16 16 27 16 
        }
      }
    }
    //0F 01 A0 95 6C 0F D5 1E 00 00 00 3F D7 D4 D5 DB 01 A0 95 6C 0F 00 58 0F 3C 19 16 00 58 0F 3C 19 
    //16 1E 00 00 00 C0 16 01 A0 95 6C 0F 16 16 0F 00 D0 0F 3C 19 E1 01 A0 95 6C 0F 16 07 9F 00 82 2D 
    //01 40 0C 3C 19 18 0F 00 B0 00 D0 0F 3C 19 39 3F 1D 90 01 00 00 16 16 14 2D 01 40 0C 3C 19 28 14 
    //2D 01 E8 E2 6E 0F 27 14 2D 01 28 E2 6E 0F 28 0F 36 A8 BE 69 0F 01 D0 E8 6E 0F 25 0F 36 20 BF 69 
    //0F 01 D0 E8 6E 0F 39 44 AB C3 16 39 3F 1D 00 00 01 00 16 0F 36 98 BF 69 0F 01 D0 E8 6E 0F 25 0F 
    //36 20 BF 69 0F 01 30 E8 6E 0F 39 44 AB 39 3F 36 20 BF 69 0F 01 30 E8 6E 0F 1E 00 00 40 3F 16 0F 
    //36 98 BF 69 0F 01 30 E8 6E 0F 39 44 AB 39 3F 36 98 BF 69 0F 01 30 E8 6E 0F 1E 00 00 40 3F 16 0F 
    //36 A8 BE 69 0F 01 30 E8 6E 0F 39 44 AB 39 3F 36 A8 BE 69 0F 01 30 E8 6E 0F 1E 00 00 40 3F 16 07 
    //3A 01 82 B0 00 D0 0F 3C 19 39 3F 2C 3C 16 18 12 00 B1 36 38 C5 69 0F 00 58 0F 3C 19 1E 33 33 33 
    //3F 16 16 6F 82 24 00 16 14 2D 01 28 95 6C 0F 28 71 21 DD 2A 00 00 16 06 9B 01 07 9B 01 B1 00 D0 
    //0F 3C 19 39 3F 2C 50 16 07 79 01 B0 C3 16 1E 00 00 00 3F 16 61 08 01 48 10 3C 19 24 00 0B 0B 1E 
    //00 00 96 43 AE 1E 9A 99 59 3F AB C3 16 1E 9A 99 99 3E 16 16 27 16 06 9B 01 61 08 01 C0 10 3C 19 
    //24 00 0B 0B 1E 00 00 96 43 AE 1E 9A 99 59 3F AB C3 16 1E 9A 99 99 3E 16 16 27 16 04 0B 47 
  }


  simulated function CalcVelocity(Vector Momentum) {
    local float ExplosionSize;
    ExplosionSize = 0.01100000 * VSize(Momentum);                               //0000 : 0F 00 D8 12 3C 19 AB 1E 58 39 34 3C E1 00 60 12 3C 19 16 16 
    Velocity = 0.00330000 * Momentum + 0.69999999 * VRand() * (ExplosionSize + FRand() * 100.00000000 + 100.00000000);//0014 : 0F 01 A0 95 6C 0F D7 D5 1E D0 44 58 3B 00 60 12 3C 19 16 D4 D5 1E 33 33 33 3F FC 16 16 AE AE 00 D8 12 3C 19 AB C3 16 1E 00 00 C8 42 16 16 1E 00 00 C8 42 16 16 16 
    Velocity.Z += 0.50000000 * ExplosionSize;                                   //004A : B8 36 38 C5 69 0F 01 A0 95 6C 0F AB 1E 00 00 00 3F 00 D8 12 3C 19 16 16 
    //0F 00 D8 12 3C 19 AB 1E 58 39 34 3C E1 00 60 12 3C 19 16 16 0F 01 A0 95 6C 0F D7 D5 1E D0 44 58 
    //3B 00 60 12 3C 19 16 D4 D5 1E 33 33 33 3F FC 16 16 AE AE 00 D8 12 3C 19 AB C3 16 1E 00 00 C8 42 
    //16 16 1E 00 00 C8 42 16 16 16 B8 36 38 C5 69 0F 01 A0 95 6C 0F AB 1E 00 00 00 3F 00 D8 12 3C 19 
    //16 16 04 0B 47 
  }


  function bool CanSplash() {
    if (Level.TimeSeconds - SplashTime > 0.25000000
      && Physics == 2
      && Abs(Velocity.Z) > 100) {//0000 : 07 5E 00 82 82 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 78 14 3C 19 16 1E 00 00 80 3E 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 02 16 16 18 13 00 B1 BA 36 38 C5 69 0F 01 A0 95 6C 0F 16 39 3F 2C 64 16 16 
      SplashTime = Level.TimeSeconds;                                           //0048 : 0F 01 78 14 3C 19 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      return True;                                                              //005C : 04 27 
    }
    return False;                                                               //005E : 04 28 
    //07 5E 00 82 82 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 78 14 3C 19 16 1E 00 00 80 3E 
    //16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 02 16 16 18 13 00 B1 BA 36 38 C5 69 0F 01 A0 95 6C 
    //0F 16 39 3F 2C 64 16 16 0F 01 78 14 3C 19 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 04 27 04 28 
    //04 0B 47 
  }


  state Dying {

      simulated function BeginState() {
        SetTimer(1.00000000 + FRand(),True);                                    //0000 : 61 18 AE 1E 00 00 80 3F C3 16 16 27 16 
        SetCollision(True,False);                                               //000D : 61 06 27 28 16 
        //61 18 AE 1E 00 00 80 3F C3 16 16 27 16 61 06 27 28 16 04 0B 47 
      }


      simulated function Timer() {
        if (!PlayerCanSeeMe()) {                                                //0000 : 07 0B 00 81 62 14 16 16 
          Destroy();                                                            //0008 : 61 17 16 
        }
        //07 0B 00 81 62 14 16 16 61 17 16 04 0B 47 
      }


      function TakeDamage(int Dam,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
        Destroy();                                                              //0000 : 61 17 16 
        //61 17 16 04 0B 47 
      }


    //08 47 

  }


  auto state Flying {

      simulated function BeginState() {
        RandSpin(125000.00000000);                                              //0000 : 1C D8 05 3C 19 1E 00 24 F4 47 16 
        if (Abs(RotationRate.Pitch) < 10000) {                                  //000B : 07 35 00 B0 BA 39 3F 36 A8 BE 69 0F 01 30 E8 6E 0F 16 39 3F 1D 10 27 00 00 16 
          RotationRate.Pitch = 10000;                                           //0025 : 0F 36 A8 BE 69 0F 01 30 E8 6E 0F 1D 10 27 00 00 
        }
        if (Abs(RotationRate.Roll) < 10000) {                                   //0035 : 07 5F 00 B0 BA 39 3F 36 98 BF 69 0F 01 30 E8 6E 0F 16 39 3F 1D 10 27 00 00 16 
          RotationRate.Roll = 10000;                                            //004F : 0F 36 98 BF 69 0F 01 30 E8 6E 0F 1D 10 27 00 00 
        }
        LinkMesh(Fragments[FRand() * numFragmentTypes]);                        //005F : 1C F0 C6 6D 0F 1A 39 44 AB C3 16 39 3F 01 38 09 3C 19 16 01 B0 09 3C 19 16 
        if (Level.NetMode == 0) {                                               //0078 : 07 A6 00 9A 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 00 16 
          LifeSpan = 20.00000000 + 40 * FRand();                                //0091 : 0F 01 A0 A0 6C 0F AE 1E 00 00 A0 41 AB 39 3F 2C 28 C3 16 16 16 
        }
        SetTimer(5.00000000,True);                                              //00A6 : 61 18 1E 00 00 A0 40 27 16 
        //1C D8 05 3C 19 1E 00 24 F4 47 16 07 35 00 B0 BA 39 3F 36 A8 BE 69 0F 01 30 E8 6E 0F 16 39 3F 1D 
        //10 27 00 00 16 0F 36 A8 BE 69 0F 01 30 E8 6E 0F 1D 10 27 00 00 07 5F 00 B0 BA 39 3F 36 98 BF 69 
        //0F 01 30 E8 6E 0F 16 39 3F 1D 10 27 00 00 16 0F 36 98 BF 69 0F 01 30 E8 6E 0F 1D 10 27 00 00 1C 
        //F0 C6 6D 0F 1A 39 44 AB C3 16 39 3F 01 38 09 3C 19 16 01 B0 09 3C 19 16 07 A6 00 9A 39 3A 19 01 
        //D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 00 16 0F 01 A0 A0 6C 0F AE 1E 00 00 A0 41 AB 39 3F 
        //2C 28 C3 16 16 16 61 18 1E 00 00 A0 40 27 16 04 0B 47 
      }


      singular simulated function PhysicsVolumeChange(PhysicsVolume NewVolume) {
        if (NewVolume.bWaterVolume) {                                           //0000 : 07 8F 00 19 00 D8 0A 3C 19 06 00 04 2D 01 70 04 6F 0F 
          Velocity = 0.20000000 * Velocity;                                     //0012 : 0F 01 A0 95 6C 0F D5 1E CD CC 4C 3E 01 A0 95 6C 0F 16 
          if (bFirstHit) {                                                      //0024 : 07 75 00 2D 01 40 0C 3C 19 
            bFirstHit = False;                                                  //002D : 14 2D 01 40 0C 3C 19 28 
            bRotateToDesired = True;                                            //0035 : 14 2D 01 E8 E2 6E 0F 27 
            bFixedRotationDir = False;                                          //003D : 14 2D 01 28 E2 6E 0F 28 
            DesiredRotation.Pitch = 0;                                          //0045 : 0F 36 A8 BE 69 0F 01 D0 E8 6E 0F 25 
            DesiredRotation.Yaw = FRand() * 65536;                              //0051 : 0F 36 20 BF 69 0F 01 D0 E8 6E 0F 39 44 AB C3 16 39 3F 1D 00 00 01 00 16 
            DesiredRotation.Roll = 0;                                           //0069 : 0F 36 98 BF 69 0F 01 D0 E8 6E 0F 25 
          }
          RotationRate = 0.20000000 * RotationRate;                             //0075 : 0F 01 30 E8 6E 0F 61 20 1E CD CC 4C 3E 01 30 E8 6E 0F 16 
          GotoState('Dying');                                                   //0088 : 71 21 DD 2A 00 00 16 
        }
        //07 8F 00 19 00 D8 0A 3C 19 06 00 04 2D 01 70 04 6F 0F 0F 01 A0 95 6C 0F D5 1E CD CC 4C 3E 01 A0 
        //95 6C 0F 16 07 75 00 2D 01 40 0C 3C 19 14 2D 01 40 0C 3C 19 28 14 2D 01 E8 E2 6E 0F 27 14 2D 01 
        //28 E2 6E 0F 28 0F 36 A8 BE 69 0F 01 D0 E8 6E 0F 25 0F 36 20 BF 69 0F 01 D0 E8 6E 0F 39 44 AB C3 
        //16 39 3F 1D 00 00 01 00 16 0F 36 98 BF 69 0F 01 D0 E8 6E 0F 25 0F 01 30 E8 6E 0F 61 20 1E CD CC 
        //4C 3E 01 30 E8 6E 0F 16 71 21 DD 2A 00 00 16 04 0B 47 
      }


      simulated function Timer() {
        GotoState('Dying');                                                     //0000 : 71 21 DD 2A 00 00 16 
        //71 21 DD 2A 00 00 16 04 0B 47 
      }


    //08 47 

  }



