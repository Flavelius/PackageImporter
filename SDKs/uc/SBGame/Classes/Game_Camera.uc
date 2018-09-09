//==============================================================================
//  Game_Camera
//==============================================================================

class Game_Camera extends Base_Component within Game_PlayerController
    native
    dependsOn(Game_PlayerController,Actor,Pawn,LevelInfo,Game_CameraEnvironmentEffect,EnvironmentManager)
    Config(User)
  ;

  const HEAD_RADIUS =  1.0;
  var config int MaxZoomOut;
  var config float CameraDisplacement;
  var config int CameraRotationSpeed;
  var config float CameraDisplacementSpeed;
  var float BlurScreenAmount;
  var float SunlightsBrightness;
  var float AmbientAmount;
  var byte AmbientBrightness;
  var byte AmbientHue;
  var byte AmbientSaturation;
  var float FogDensity;
  var float FogColorAmount;
  var Color FogColor;
  var private float mDesiredCameraDist;
  var private bool mAutoRotateCamera;
  var private float mRotateSpeedFactor;
  var Vector ShakeOffsetRate;
  var Vector ShakeOffsetTime;
  var Vector ShakeOffsetMax;
  var Vector ShakeRotRate;
  var Vector ShakeRotMax;
  var Vector ShakeRotTime;
  var private Vector mShakeMin;
  var private Vector mShakeMax;
  var private Vector mCurrentShake;
  var private float mTransitionDuration;
  var private float mTransitionStart;
  var private float mShakeStart;
  var private float mShakeDuration;
  var private bool mFreeCamLock;
  var private Vector mPreviousDisplacement;
  var private Game_CameraEnvironmentEffect mEnvironmentEffect;


  private function CheckShake(out float MaxOffset,out float Offset,out float Rate,out float Time,float dt) {
    if (Abs(Offset) < Abs(MaxOffset)) {                                         //0000 : 07 15 00 B0 BA 00 08 12 29 11 16 BA 00 90 11 29 11 16 16 
      return;                                                                   //0013 : 04 0B 
    }
    Offset = MaxOffset;                                                         //0015 : 0F 00 08 12 29 11 00 90 11 29 11 
    if (Time > 1) {                                                             //0020 : 07 94 00 B1 00 80 12 29 11 39 3F 26 16 
      if (Time * Abs(MaxOffset / Rate) <= 1) {                                  //002D : 07 69 00 B2 AB 00 80 12 29 11 BA AC 00 90 11 29 11 00 F8 12 29 11 16 16 16 39 3F 26 16 
        MaxOffset = MaxOffset * (1 / Time - 1);                                 //004A : 0F 00 90 11 29 11 AB 00 90 11 29 11 AF AC 39 3F 26 00 80 12 29 11 16 39 3F 26 16 16 
      } else {                                                                  //0066 : 06 77 00 
        MaxOffset *= -1;                                                        //0069 : B6 00 90 11 29 11 39 3F 1D FF FF FF FF 16 
      }
      Time -= dt;                                                               //0077 : B9 00 80 12 29 11 00 70 13 29 11 16 
      Rate *= -1;                                                               //0083 : B6 00 F8 12 29 11 39 3F 1D FF FF FF FF 16 
    } else {                                                                    //0091 : 06 B5 00 
      MaxOffset = 0.00000000;                                                   //0094 : 0F 00 90 11 29 11 1E 00 00 00 00 
      Offset = 0.00000000;                                                      //009F : 0F 00 08 12 29 11 1E 00 00 00 00 
      Rate = 0.00000000;                                                        //00AA : 0F 00 F8 12 29 11 1E 00 00 00 00 
    }
    //07 15 00 B0 BA 00 08 12 29 11 16 BA 00 90 11 29 11 16 16 04 0B 0F 00 08 12 29 11 00 90 11 29 11 
    //07 94 00 B1 00 80 12 29 11 39 3F 26 16 07 69 00 B2 AB 00 80 12 29 11 BA AC 00 90 11 29 11 00 F8 
    //12 29 11 16 16 16 39 3F 26 16 0F 00 90 11 29 11 AB 00 90 11 29 11 AF AC 39 3F 26 00 80 12 29 11 
    //16 39 3F 26 16 16 06 77 00 B6 00 90 11 29 11 39 3F 1D FF FF FF FF 16 B9 00 80 12 29 11 00 70 13 
    //29 11 16 B6 00 F8 12 29 11 39 3F 1D FF FF FF FF 16 06 B5 00 0F 00 90 11 29 11 1E 00 00 00 00 0F 
    //00 08 12 29 11 1E 00 00 00 00 0F 00 F8 12 29 11 1E 00 00 00 00 04 0B 47 
  }


  private function UpdateShakeRotComponent(out float Max,out int current,out float Rate,out float Time,float dt) {
    local float fCurrent;
    current = (current & 65535) + Rate * dt & 65535;                            //0000 : 0F 00 F0 15 29 11 9C 39 44 AE 39 3F 9C 00 F0 15 29 11 1D FF FF 00 00 16 AB 00 68 16 29 11 00 E0 16 29 11 16 16 1D FF FF 00 00 16 
    if (current > 32768) {                                                      //002B : 07 46 00 97 00 F0 15 29 11 1D 00 80 00 00 16 
      current -= 65536;                                                         //003A : A2 00 F0 15 29 11 1D 00 00 01 00 16 
    }
    fCurrent = current;                                                         //0046 : 0F 00 58 17 29 11 39 3F 00 F0 15 29 11 
    CheckShake(Max,fCurrent,Rate,Time,dt);                                      //0053 : 1B 97 0C 00 00 00 98 14 29 11 00 58 17 29 11 00 68 16 29 11 00 D0 17 29 11 00 E0 16 29 11 16 
    current = fCurrent;                                                         //0072 : 0F 00 F0 15 29 11 39 44 00 58 17 29 11 
    //0F 00 F0 15 29 11 9C 39 44 AE 39 3F 9C 00 F0 15 29 11 1D FF FF 00 00 16 AB 00 68 16 29 11 00 E0 
    //16 29 11 16 16 1D FF FF 00 00 16 07 46 00 97 00 F0 15 29 11 1D 00 80 00 00 16 A2 00 F0 15 29 11 
    //1D 00 00 01 00 16 0F 00 58 17 29 11 39 3F 00 F0 15 29 11 1B 97 0C 00 00 00 98 14 29 11 00 58 17 
    //29 11 00 68 16 29 11 00 D0 17 29 11 00 E0 16 29 11 16 0F 00 F0 15 29 11 39 44 00 58 17 29 11 04 
    //0B 47 
  }


  private function ViewShake(float DeltaTime) {
    if (ShakeOffsetRate != vect(0.000000, 0.000000, 0.000000)) {                //0000 : 07 3D 01 DA 01 70 19 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      Outer.ShakeOffset.X += DeltaTime * ShakeOffsetRate.X;                     //0017 : B8 36 48 C4 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 40 69 71 0F AB 00 F8 18 29 11 36 48 C4 69 0F 01 70 19 29 11 16 16 
      CheckShake(ShakeOffsetMax.X,Outer.ShakeOffset.X,ShakeOffsetRate.X,ShakeOffsetTime.X,DeltaTime);//003D : 1B 97 0C 00 00 36 48 C4 69 0F 01 E8 19 29 11 36 48 C4 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 40 69 71 0F 36 48 C4 69 0F 01 70 19 29 11 36 48 C4 69 0F 01 60 1A 29 11 00 F8 18 29 11 16 
      Outer.ShakeOffset.Y += DeltaTime * ShakeOffsetRate.Y;                     //0079 : B8 36 C0 C4 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 40 69 71 0F AB 00 F8 18 29 11 36 C0 C4 69 0F 01 70 19 29 11 16 16 
      CheckShake(ShakeOffsetMax.Y,Outer.ShakeOffset.Y,ShakeOffsetRate.Y,ShakeOffsetTime.Y,DeltaTime);//009F : 1B 97 0C 00 00 36 C0 C4 69 0F 01 E8 19 29 11 36 C0 C4 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 40 69 71 0F 36 C0 C4 69 0F 01 70 19 29 11 36 C0 C4 69 0F 01 60 1A 29 11 00 F8 18 29 11 16 
      Outer.ShakeOffset.Z += DeltaTime * ShakeOffsetRate.Z;                     //00DB : B8 36 38 C5 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 40 69 71 0F AB 00 F8 18 29 11 36 38 C5 69 0F 01 70 19 29 11 16 16 
      CheckShake(ShakeOffsetMax.Z,Outer.ShakeOffset.Z,ShakeOffsetRate.Z,ShakeOffsetTime.Z,DeltaTime);//0101 : 1B 97 0C 00 00 36 38 C5 69 0F 01 E8 19 29 11 36 38 C5 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 40 69 71 0F 36 38 C5 69 0F 01 70 19 29 11 36 38 C5 69 0F 01 60 1A 29 11 00 F8 18 29 11 16 
    }
    if (ShakeRotRate != vect(0.000000, 0.000000, 0.000000)) {                   //013D : 07 08 02 DA 01 D8 1A 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      UpdateShakeRotComponent(ShakeRotMax.X,Outer.ShakeRot.Pitch,ShakeRotRate.X,ShakeRotTime.X,DeltaTime);//0154 : 1B E3 0C 00 00 36 48 C4 69 0F 01 50 1B 29 11 36 A8 BE 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 50 68 71 0F 36 48 C4 69 0F 01 D8 1A 29 11 36 48 C4 69 0F 01 C8 1B 29 11 00 F8 18 29 11 16 
      UpdateShakeRotComponent(ShakeRotMax.Y,Outer.ShakeRot.Yaw,ShakeRotRate.Y,ShakeRotTime.Y,DeltaTime);//0190 : 1B E3 0C 00 00 36 C0 C4 69 0F 01 50 1B 29 11 36 20 BF 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 50 68 71 0F 36 C0 C4 69 0F 01 D8 1A 29 11 36 C0 C4 69 0F 01 C8 1B 29 11 00 F8 18 29 11 16 
      UpdateShakeRotComponent(ShakeRotMax.Z,Outer.ShakeRot.Roll,ShakeRotRate.Z,ShakeRotTime.Z,DeltaTime);//01CC : 1B E3 0C 00 00 36 38 C5 69 0F 01 50 1B 29 11 36 98 BF 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 50 68 71 0F 36 38 C5 69 0F 01 D8 1A 29 11 36 38 C5 69 0F 01 C8 1B 29 11 00 F8 18 29 11 16 
    }
    //07 3D 01 DA 01 70 19 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 16 B8 36 48 C4 69 0F 19 01 00 
    //E4 6B 0F 05 00 0C 01 40 69 71 0F AB 00 F8 18 29 11 36 48 C4 69 0F 01 70 19 29 11 16 16 1B 97 0C 
    //00 00 36 48 C4 69 0F 01 E8 19 29 11 36 48 C4 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 40 69 71 0F 36 
    //48 C4 69 0F 01 70 19 29 11 36 48 C4 69 0F 01 60 1A 29 11 00 F8 18 29 11 16 B8 36 C0 C4 69 0F 19 
    //01 00 E4 6B 0F 05 00 0C 01 40 69 71 0F AB 00 F8 18 29 11 36 C0 C4 69 0F 01 70 19 29 11 16 16 1B 
    //97 0C 00 00 36 C0 C4 69 0F 01 E8 19 29 11 36 C0 C4 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 40 69 71 
    //0F 36 C0 C4 69 0F 01 70 19 29 11 36 C0 C4 69 0F 01 60 1A 29 11 00 F8 18 29 11 16 B8 36 38 C5 69 
    //0F 19 01 00 E4 6B 0F 05 00 0C 01 40 69 71 0F AB 00 F8 18 29 11 36 38 C5 69 0F 01 70 19 29 11 16 
    //16 1B 97 0C 00 00 36 38 C5 69 0F 01 E8 19 29 11 36 38 C5 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 40 
    //69 71 0F 36 38 C5 69 0F 01 70 19 29 11 36 38 C5 69 0F 01 60 1A 29 11 00 F8 18 29 11 16 07 08 02 
    //DA 01 D8 1A 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 16 1B E3 0C 00 00 36 48 C4 69 0F 01 50 
    //1B 29 11 36 A8 BE 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 50 68 71 0F 36 48 C4 69 0F 01 D8 1A 29 11 
    //36 48 C4 69 0F 01 C8 1B 29 11 00 F8 18 29 11 16 1B E3 0C 00 00 36 C0 C4 69 0F 01 50 1B 29 11 36 
    //20 BF 69 0F 19 01 00 E4 6B 0F 05 00 0C 01 50 68 71 0F 36 C0 C4 69 0F 01 D8 1A 29 11 36 C0 C4 69 
    //0F 01 C8 1B 29 11 00 F8 18 29 11 16 1B E3 0C 00 00 36 38 C5 69 0F 01 50 1B 29 11 36 98 BF 69 0F 
    //19 01 00 E4 6B 0F 05 00 0C 01 50 68 71 0F 36 38 C5 69 0F 01 D8 1A 29 11 36 38 C5 69 0F 01 C8 1B 
    //29 11 00 F8 18 29 11 16 04 0B 47 
  }


  private event ShakeViewEvent(Vector shRotMag,Vector shRotRate,float shRotTime,Vector shOffsetMag,Vector shOffsetRate,float shOffsetTime) {
    ShakeView(shRotMag,shRotRate,shRotTime,shOffsetMag,shOffsetRate,shOffsetTime);//0000 : 1B 2C 0D 00 00 00 F0 1C 29 11 00 C8 1D 29 11 00 40 1E 29 11 00 B8 1E 29 11 00 30 1F 29 11 00 A8 1F 29 11 16 
    //1B 2C 0D 00 00 00 F0 1C 29 11 00 C8 1D 29 11 00 40 1E 29 11 00 B8 1E 29 11 00 30 1F 29 11 00 A8 
    //1F 29 11 16 04 0B 47 
  }


  private event SetAmbientShake(float FalloffStartTime,float FalloffTime,Vector OffsetMag,float OffsetFreq,Rotator RotMag,float RotFreq) {
    Outer.bEnableAmbientShake = True;                                           //0000 : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 28 63 71 0F 27 
    Outer.AmbientShakeFalloffStartTime = FalloffStartTime;                      //0011 : 0F 19 01 00 E4 6B 0F 05 00 04 01 A0 63 71 0F 00 D0 20 29 11 
    Outer.AmbientShakeFalloffTime = FalloffTime;                                //0025 : 0F 19 01 00 E4 6B 0F 05 00 04 01 18 64 71 0F 00 30 22 29 11 
    Outer.AmbientShakeOffsetMag = OffsetMag;                                    //0039 : 0F 19 01 00 E4 6B 0F 05 00 0C 01 80 65 71 0F 00 A8 22 29 11 
    Outer.AmbientShakeOffsetFreq = OffsetFreq;                                  //004D : 0F 19 01 00 E4 6B 0F 05 00 04 01 F8 65 71 0F 00 20 23 29 11 
    Outer.AmbientShakeRotMag = RotMag;                                          //0061 : 0F 19 01 00 E4 6B 0F 05 00 0C 01 E8 66 71 0F 00 98 23 29 11 
    Outer.AmbientShakeRotFreq = RotFreq;                                        //0075 : 0F 19 01 00 E4 6B 0F 05 00 04 01 60 67 71 0F 00 10 24 29 11 
    //14 19 01 00 E4 6B 0F 06 00 04 2D 01 28 63 71 0F 27 0F 19 01 00 E4 6B 0F 05 00 04 01 A0 63 71 0F 
    //00 D0 20 29 11 0F 19 01 00 E4 6B 0F 05 00 04 01 18 64 71 0F 00 30 22 29 11 0F 19 01 00 E4 6B 0F 
    //05 00 0C 01 80 65 71 0F 00 A8 22 29 11 0F 19 01 00 E4 6B 0F 05 00 04 01 F8 65 71 0F 00 20 23 29 
    //11 0F 19 01 00 E4 6B 0F 05 00 0C 01 E8 66 71 0F 00 98 23 29 11 0F 19 01 00 E4 6B 0F 05 00 04 01 
    //60 67 71 0F 00 10 24 29 11 04 0B 47 
  }


  private function ShakeView(Vector shRotMag,Vector shRotRate,float shRotTime,Vector shOffsetMag,Vector shOffsetRate,float shOffsetTime) {
    if (VSize(shRotMag) > VSize(ShakeRotMax)) {                                 //0000 : 07 43 00 B1 E1 00 38 25 29 11 16 E1 01 50 1B 29 11 16 16 
      ShakeRotMax = shRotMag;                                                   //0013 : 0F 01 50 1B 29 11 00 38 25 29 11 
      ShakeRotRate = shRotRate;                                                 //001E : 0F 01 D8 1A 29 11 00 98 26 29 11 
      ShakeRotTime = shRotTime * vect(1.000000, 1.000000, 1.000000);            //0029 : 0F 01 C8 1B 29 11 D5 00 10 27 29 11 23 00 00 80 3F 00 00 80 3F 00 00 80 3F 16 
    }
    if (VSize(shOffsetMag) > VSize(ShakeOffsetMax)) {                           //0043 : 07 86 00 B1 E1 00 88 27 29 11 16 E1 01 E8 19 29 11 16 16 
      ShakeOffsetMax = shOffsetMag;                                             //0056 : 0F 01 E8 19 29 11 00 88 27 29 11 
      ShakeOffsetRate = shOffsetRate;                                           //0061 : 0F 01 70 19 29 11 00 00 28 29 11 
      ShakeOffsetTime = shOffsetTime * vect(1.000000, 1.000000, 1.000000);      //006C : 0F 01 60 1A 29 11 D5 00 78 28 29 11 23 00 00 80 3F 00 00 80 3F 00 00 80 3F 16 
    }
    //07 43 00 B1 E1 00 38 25 29 11 16 E1 01 50 1B 29 11 16 16 0F 01 50 1B 29 11 00 38 25 29 11 0F 01 
    //D8 1A 29 11 00 98 26 29 11 0F 01 C8 1B 29 11 D5 00 10 27 29 11 23 00 00 80 3F 00 00 80 3F 00 00 
    //80 3F 16 07 86 00 B1 E1 00 88 27 29 11 16 E1 01 E8 19 29 11 16 16 0F 01 E8 19 29 11 00 88 27 29 
    //11 0F 01 70 19 29 11 00 00 28 29 11 0F 01 60 1A 29 11 D5 00 78 28 29 11 23 00 00 80 3F 00 00 80 
    //3F 00 00 80 3F 16 04 0B 47 
  }


  private function ClientDamageShake(int Damage) {
    ShakeView(vect(0.000000, 0.000000, 0.000000),vect(0.000000, 0.000000, 0.000000),0.00000000,Damage * vect(-0.600000, 0.000000, 0.000000),vect(100.000000, 100.000000, 100.000000),0.20000000);//0000 : 1B 2C 0D 00 00 23 00 00 00 00 00 00 00 00 00 00 00 00 23 00 00 00 00 00 00 00 00 00 00 00 00 1E 00 00 00 00 D5 39 3F 00 A0 29 29 11 23 9A 99 19 BF 00 00 00 00 00 00 00 00 16 23 00 00 C8 42 00 00 C8 42 00 00 C8 42 1E CD CC 4C 3E 16 
    //1B 2C 0D 00 00 23 00 00 00 00 00 00 00 00 00 00 00 00 23 00 00 00 00 00 00 00 00 00 00 00 00 1E 
    //00 00 00 00 D5 39 3F 00 A0 29 29 11 23 9A 99 19 BF 00 00 00 00 00 00 00 00 16 23 00 00 C8 42 00 
    //00 C8 42 00 00 C8 42 1E CD CC 4C 3E 16 04 0B 47 
  }


  protected function DamageShake(int Damage) {
    ClientDamageShake(Damage);                                                  //0000 : 1B 7B 0F 00 00 00 60 2B 29 11 16 
    //1B 7B 0F 00 00 00 60 2B 29 11 16 04 0B 47 
  }


  protected function cl_MoveTomDesiredCameraDist(float DeltaSeconds) {
    if (Outer.CameraDist < mDesiredCameraDist) {                                //0000 : 07 63 00 B0 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 16 
      Outer.CameraDist += DeltaSeconds * CameraDisplacementSpeed;               //0018 : B8 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F AB 00 C8 2C 29 11 01 58 2F 29 11 16 16 
      if (Outer.CameraDist > mDesiredCameraDist) {                              //0034 : 07 60 00 B1 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 16 
        Outer.CameraDist = mDesiredCameraDist;                                  //004C : 0F 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 
      }
    } else {                                                                    //0060 : 06 C3 00 
      if (Outer.CameraDist > mDesiredCameraDist) {                              //0063 : 07 C3 00 B1 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 16 
        Outer.CameraDist -= DeltaSeconds * CameraDisplacementSpeed;             //007B : B9 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F AB 00 C8 2C 29 11 01 58 2F 29 11 16 16 
        if (Outer.CameraDist < mDesiredCameraDist) {                            //0097 : 07 C3 00 B0 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 16 
          Outer.CameraDist = mDesiredCameraDist;                                //00AF : 0F 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 
        }
      }
    }
    if (Outer.CameraDist >= 1.00000000) {                                       //00C3 : 07 EE 00 B3 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 1E 00 00 80 3F 16 
      Outer.BehindView(True);                                                   //00DB : 19 01 00 E4 6B 0F 07 00 00 1B EE 0E 00 00 27 16 
    } else {                                                                    //00EB : 06 0D 01 
      if (mDesiredCameraDist < 1.00000000) {                                    //00EE : 07 0D 01 B0 01 E0 2E 29 11 1E 00 00 80 3F 16 
        Outer.BehindView(False);                                                //00FD : 19 01 00 E4 6B 0F 07 00 00 1B EE 0E 00 00 28 16 
      }
    }
    //07 63 00 B0 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 16 B8 19 01 00 E4 6B 0F 05 
    //00 04 01 F0 74 71 0F AB 00 C8 2C 29 11 01 58 2F 29 11 16 16 07 60 00 B1 19 01 00 E4 6B 0F 05 00 
    //04 01 F0 74 71 0F 01 E0 2E 29 11 16 0F 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 
    //06 C3 00 07 C3 00 B1 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 16 B9 19 01 00 E4 
    //6B 0F 05 00 04 01 F0 74 71 0F AB 00 C8 2C 29 11 01 58 2F 29 11 16 16 07 C3 00 B0 19 01 00 E4 6B 
    //0F 05 00 04 01 F0 74 71 0F 01 E0 2E 29 11 16 0F 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 01 E0 
    //2E 29 11 07 EE 00 B3 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 1E 00 00 80 3F 16 19 01 00 E4 6B 
    //0F 07 00 00 1B EE 0E 00 00 27 16 06 0D 01 07 0D 01 B0 01 E0 2E 29 11 1E 00 00 80 3F 16 19 01 00 
    //E4 6B 0F 07 00 00 1B EE 0E 00 00 28 16 04 0B 47 
  }


  protected function cl_RotateCameraBack(float DeltaSeconds) {
    if (mAutoRotateCamera) {                                                    //0000 : 07 30 00 2D 01 18 33 29 11 
      Outer.CameraDeltaYaw += CameraRotationSpeed * DeltaSeconds * mRotateSpeedFactor;//0009 : B8 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F AB AB 39 3F 01 90 33 29 11 00 80 30 29 11 16 01 08 34 29 11 16 16 
      return;                                                                   //002E : 04 0B 
    }
    if (Outer.CameraDeltaYaw >= 32768) {                                        //0030 : 07 64 00 B3 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 1D 00 80 00 00 16 
      Outer.CameraDeltaYaw -= 65536;                                            //004A : B9 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 1D 00 00 01 00 16 
    } else {                                                                    //0061 : 06 95 00 
      if (Outer.CameraDeltaYaw <= -32768) {                                     //0064 : 07 95 00 B2 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 1D 00 80 FF FF 16 
        Outer.CameraDeltaYaw += 65536;                                          //007E : B8 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 1D 00 00 01 00 16 
      }
    }
    if (!Outer.bFreeCam) {                                                      //0095 : 07 68 01 81 19 01 00 E4 6B 0F 06 00 04 2D 01 28 54 71 0F 16 
      if (Outer.CameraDeltaYaw >= 0) {                                          //00A9 : 07 0A 01 B3 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 25 16 
        Outer.CameraDeltaYaw -= CameraRotationSpeed * DeltaSeconds;             //00BF : B9 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F AB 39 3F 01 90 33 29 11 00 80 30 29 11 16 16 
        if (Outer.CameraDeltaYaw < 0) {                                         //00DD : 07 07 01 B0 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 25 16 
          Outer.CameraDeltaYaw = 0.00000000;                                    //00F3 : 0F 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 1E 00 00 00 00 
        }
      } else {                                                                  //0107 : 06 68 01 
        if (Outer.CameraDeltaYaw <= 0) {                                        //010A : 07 68 01 B2 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 25 16 
          Outer.CameraDeltaYaw += CameraRotationSpeed * DeltaSeconds;           //0120 : B8 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F AB 39 3F 01 90 33 29 11 00 80 30 29 11 16 16 
          if (Outer.CameraDeltaYaw > 0) {                                       //013E : 07 68 01 B1 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 25 16 
            Outer.CameraDeltaYaw = 0.00000000;                                  //0154 : 0F 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 1E 00 00 00 00 
          }
        }
      }
    }
    //07 30 00 2D 01 18 33 29 11 B8 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F AB AB 39 3F 01 90 33 29 
    //11 00 80 30 29 11 16 01 08 34 29 11 16 16 04 0B 07 64 00 B3 19 01 00 E4 6B 0F 05 00 04 01 18 55 
    //71 0F 39 3F 1D 00 80 00 00 16 B9 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 1D 00 00 01 00 
    //16 06 95 00 07 95 00 B2 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 1D 00 80 FF FF 16 B8 19 
    //01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 1D 00 00 01 00 16 07 68 01 81 19 01 00 E4 6B 0F 06 
    //00 04 2D 01 28 54 71 0F 16 07 0A 01 B3 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 25 16 B9 
    //19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F AB 39 3F 01 90 33 29 11 00 80 30 29 11 16 16 07 07 01 
    //B0 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 25 16 0F 19 01 00 E4 6B 0F 05 00 04 01 18 55 
    //71 0F 1E 00 00 00 00 06 68 01 07 68 01 B2 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 25 16 
    //B8 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F AB 39 3F 01 90 33 29 11 00 80 30 29 11 16 16 07 68 
    //01 B1 19 01 00 E4 6B 0F 05 00 04 01 18 55 71 0F 39 3F 25 16 0F 19 01 00 E4 6B 0F 05 00 04 01 18 
    //55 71 0F 1E 00 00 00 00 04 0B 47 
  }


  function StopViewShaking() {
    ShakeRotMax = vect(0.000000, 0.000000, 0.000000);                           //0000 : 0F 01 50 1B 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 
    ShakeRotRate = vect(0.000000, 0.000000, 0.000000);                          //0013 : 0F 01 D8 1A 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 
    ShakeRotTime = vect(0.000000, 0.000000, 0.000000);                          //0026 : 0F 01 C8 1B 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 
    ShakeOffsetMax = vect(0.000000, 0.000000, 0.000000);                        //0039 : 0F 01 E8 19 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 
    ShakeOffsetRate = vect(0.000000, 0.000000, 0.000000);                       //004C : 0F 01 70 19 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 
    ShakeOffsetTime = vect(0.000000, 0.000000, 0.000000);                       //005F : 0F 01 60 1A 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 
    //0F 01 50 1B 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 0F 01 D8 1A 29 11 23 00 00 00 00 00 00 
    //00 00 00 00 00 00 0F 01 C8 1B 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 0F 01 E8 19 29 11 23 
    //00 00 00 00 00 00 00 00 00 00 00 00 0F 01 70 19 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 0F 
    //01 60 1A 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 04 0B 47 
  }


  function ShakeCamera(out Actor ViewActor,out Vector CameraLocation,out Rotator CameraRotation) {
    local float transitionDelta;
    local Vector tempVector;
    ViewActor = Outer.ViewTarget;                                               //0000 : 0F 00 A8 36 29 11 19 01 00 E4 6B 0F 05 00 04 01 10 83 6C 0F 
    CameraLocation = Outer.ViewTarget.Location;                                 //0014 : 0F 00 60 3A 29 11 19 19 01 00 E4 6B 0F 05 00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 
    if (Outer.bBehindView) {                                                    //0031 : 07 86 00 19 01 00 E4 6B 0F 06 00 04 2D 01 A0 54 71 0F 
      Outer.CalcBehindView(CameraLocation,CameraRotation,Outer.CameraDist * Outer.Pawn.default.CollisionRadius);//0043 : 19 01 00 E4 6B 0F 37 00 00 1B BF 12 00 00 00 60 3A 29 11 00 D8 3A 29 11 AB 19 01 00 E4 6B 0F 05 00 04 01 F0 74 71 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 02 C8 89 6C 0F 16 16 
    } else {                                                                    //0083 : 06 9F 00 
      Outer.CalcFirstPersonView(CameraLocation,CameraRotation);                 //0086 : 19 01 00 E4 6B 0F 10 00 00 1B C0 12 00 00 00 60 3A 29 11 00 D8 3A 29 11 16 
    }
    if (mShakeStart < 0.00000000) {                                             //009F : 07 06 01 B0 01 50 3B 29 11 1E 00 00 00 00 16 
      mShakeStart = Outer.Level.TimeSeconds;                                    //00AE : 0F 01 50 3B 29 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      mTransitionStart = Outer.Level.TimeSeconds;                               //00CB : 0F 01 C8 3B 29 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      transitionDelta = 0.00000000;                                             //00E8 : 0F 00 40 3C 29 11 1E 00 00 00 00 
      mPreviousDisplacement = vect(0.000000, 0.000000, 0.000000);               //00F3 : 0F 01 B8 3C 29 11 23 00 00 00 00 00 00 00 00 00 00 00 00 
    }
    if (Outer.Level.TimeSeconds - mShakeStart > mShakeDuration) {               //0106 : 07 56 01 B1 AF 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 50 3B 29 11 16 01 08 00 1F 11 16 
      Outer.Pawn.bSpecialCalcView = False;                                      //012E : 14 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 2D 01 50 73 71 0F 28 
      mShakeStart = -1.00000000;                                                //0148 : 0F 01 50 3B 29 11 1E 00 00 80 BF 
    } else {                                                                    //0153 : 06 3B 02 
      transitionDelta = Outer.Level.TimeSeconds - mTransitionStart;             //0156 : 0F 00 40 3C 29 11 AF 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 C8 3B 29 11 16 
      if (transitionDelta > mTransitionDuration) {                              //017A : 07 D9 01 B1 00 40 3C 29 11 01 80 00 1F 11 16 
        transitionDelta = 0.00000000;                                           //0189 : 0F 00 40 3C 29 11 1E 00 00 00 00 
        mTransitionStart = Outer.Level.TimeSeconds;                             //0194 : 0F 01 C8 3B 29 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
        if (mCurrentShake == mShakeMax) {                                       //01B1 : 07 CE 01 D9 01 F8 00 1F 11 01 70 01 1F 11 16 
          mCurrentShake = mShakeMin;                                            //01C0 : 0F 01 F8 00 1F 11 01 E8 01 1F 11 
        } else {                                                                //01CB : 06 D9 01 
          mCurrentShake = mShakeMax;                                            //01CE : 0F 01 F8 00 1F 11 01 70 01 1F 11 
        }
      }
      tempVector = VSize(mCurrentShake) * vector((rotator(mCurrentShake) + CameraRotation));//01D9 : 0F 00 60 02 1F 11 D5 E1 01 F8 00 1F 11 16 39 39 61 3C 39 50 01 F8 00 1F 11 00 D8 3A 29 11 16 16 
      CameraLocation = static.LerpVector(CameraLocation - mPreviousDisplacement,CameraLocation - mPreviousDisplacement + tempVector,transitionDelta / mTransitionDuration);//01F9 : 0F 00 60 3A 29 11 1C B8 F8 6A 0F D8 00 60 3A 29 11 01 B8 3C 29 11 16 D7 D8 00 60 3A 29 11 01 B8 3C 29 11 16 00 60 02 1F 11 16 AC 00 40 3C 29 11 01 80 00 1F 11 16 16 
      mPreviousDisplacement = tempVector;                                       //0230 : 0F 01 B8 3C 29 11 00 60 02 1F 11 
    }
    //0F 00 A8 36 29 11 19 01 00 E4 6B 0F 05 00 04 01 10 83 6C 0F 0F 00 60 3A 29 11 19 19 01 00 E4 6B 
    //0F 05 00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 07 86 00 19 01 00 E4 6B 0F 06 00 04 2D 01 A0 
    //54 71 0F 19 01 00 E4 6B 0F 37 00 00 1B BF 12 00 00 00 60 3A 29 11 00 D8 3A 29 11 AB 19 01 00 E4 
    //6B 0F 05 00 04 01 F0 74 71 0F 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 02 C8 89 6C 
    //0F 16 16 06 9F 00 19 01 00 E4 6B 0F 10 00 00 1B C0 12 00 00 00 60 3A 29 11 00 D8 3A 29 11 16 07 
    //06 01 B0 01 50 3B 29 11 1E 00 00 00 00 16 0F 01 50 3B 29 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 
    //7E 6C 0F 05 00 04 01 A8 81 6C 0F 0F 01 C8 3B 29 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 
    //05 00 04 01 A8 81 6C 0F 0F 00 40 3C 29 11 1E 00 00 00 00 0F 01 B8 3C 29 11 23 00 00 00 00 00 00 
    //00 00 00 00 00 00 07 56 01 B1 AF 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 
    //6C 0F 01 50 3B 29 11 16 01 08 00 1F 11 16 14 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 
    //04 2D 01 50 73 71 0F 28 0F 01 50 3B 29 11 1E 00 00 80 BF 06 3B 02 0F 00 40 3C 29 11 AF 19 19 01 
    //00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 C8 3B 29 11 16 07 D9 01 B1 00 40 
    //3C 29 11 01 80 00 1F 11 16 0F 00 40 3C 29 11 1E 00 00 00 00 0F 01 C8 3B 29 11 19 19 01 00 E4 6B 
    //0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 07 CE 01 D9 01 F8 00 1F 11 01 70 01 1F 11 16 
    //0F 01 F8 00 1F 11 01 E8 01 1F 11 06 D9 01 0F 01 F8 00 1F 11 01 70 01 1F 11 0F 00 60 02 1F 11 D5 
    //E1 01 F8 00 1F 11 16 39 39 61 3C 39 50 01 F8 00 1F 11 00 D8 3A 29 11 16 16 0F 00 60 3A 29 11 1C 
    //B8 F8 6A 0F D8 00 60 3A 29 11 01 B8 3C 29 11 16 D7 D8 00 60 3A 29 11 01 B8 3C 29 11 16 00 60 02 
    //1F 11 16 AC 00 40 3C 29 11 01 80 00 1F 11 16 16 0F 01 B8 3C 29 11 00 60 02 1F 11 04 0B 47 
  }


  function SetCameraShake(Vector minVector,Vector maxVector,float Duration,float TransitionTime) {
    mShakeStart = -1.00000000;                                                  //0000 : 0F 01 50 3B 29 11 1E 00 00 80 BF 
    mShakeDuration = Duration;                                                  //000B : 0F 01 08 00 1F 11 00 A0 04 1F 11 
    mTransitionDuration = TransitionTime;                                       //0016 : 0F 01 80 00 1F 11 00 80 27 1E 11 
    mShakeMin = minVector;                                                      //0021 : 0F 01 E8 01 1F 11 00 88 03 1F 11 
    mShakeMax = maxVector;                                                      //002C : 0F 01 70 01 1F 11 00 F8 27 1E 11 
    Outer.Pawn.bSpecialCalcView = True;                                         //0037 : 14 19 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 2D 01 50 73 71 0F 27 
    //0F 01 50 3B 29 11 1E 00 00 80 BF 0F 01 08 00 1F 11 00 A0 04 1F 11 0F 01 80 00 1F 11 00 80 27 1E 
    //11 0F 01 E8 01 1F 11 00 88 03 1F 11 0F 01 70 01 1F 11 00 F8 27 1E 11 14 19 19 01 00 E4 6B 0F 05 
    //00 04 01 88 83 6C 0F 06 00 04 2D 01 50 73 71 0F 27 04 0B 47 
  }


  exec function ZoomOut() {
    if (mDesiredCameraDist < MaxZoomOut) {                                      //0000 : 07 1D 00 B0 01 E0 2E 29 11 39 3F 01 C0 29 1E 11 16 
      mDesiredCameraDist += CameraDisplacement;                                 //0011 : B8 01 E0 2E 29 11 01 38 2A 1E 11 16 
    }
    if (mDesiredCameraDist > 350) {                                             //001D : 07 39 00 B1 01 E0 2E 29 11 39 3F 1D 5E 01 00 00 16 
      mDesiredCameraDist = 350.00000000;                                        //002E : 0F 01 E0 2E 29 11 1E 00 00 AF 43 
    }
    if (mDesiredCameraDist < 1.00000000) {                                      //0039 : 07 53 00 B0 01 E0 2E 29 11 1E 00 00 80 3F 16 
      mDesiredCameraDist = 1.00000000;                                          //0048 : 0F 01 E0 2E 29 11 1E 00 00 80 3F 
    }
    //07 1D 00 B0 01 E0 2E 29 11 39 3F 01 C0 29 1E 11 16 B8 01 E0 2E 29 11 01 38 2A 1E 11 16 07 39 00 
    //B1 01 E0 2E 29 11 39 3F 1D 5E 01 00 00 16 0F 01 E0 2E 29 11 1E 00 00 AF 43 07 53 00 B0 01 E0 2E 
    //29 11 1E 00 00 80 3F 16 0F 01 E0 2E 29 11 1E 00 00 80 3F 04 0B 47 
  }


  exec function ZoomIn() {
    if (mDesiredCameraDist >= CameraDisplacement) {                             //0000 : 07 1B 00 B3 01 E0 2E 29 11 01 38 2A 1E 11 16 
      mDesiredCameraDist -= CameraDisplacement;                                 //000F : B9 01 E0 2E 29 11 01 38 2A 1E 11 16 
    }
    if (mDesiredCameraDist < 1.00000000) {                                      //001B : 07 35 00 B0 01 E0 2E 29 11 1E 00 00 80 3F 16 
      mDesiredCameraDist = 0.00000000;                                          //002A : 0F 01 E0 2E 29 11 1E 00 00 00 00 
    }
    //07 1B 00 B3 01 E0 2E 29 11 01 38 2A 1E 11 16 B9 01 E0 2E 29 11 01 38 2A 1E 11 16 07 35 00 B0 01 
    //E0 2E 29 11 1E 00 00 80 3F 16 0F 01 E0 2E 29 11 1E 00 00 00 00 04 0B 47 
  }


  protected native function sv2cl_SetFreeCam_CallStub();


  event sv2cl_SetFreeCam(bool free) {
    SetFreeCam(free);                                                           //0000 : 1B 20 0D 00 00 2D 00 38 2D 1E 11 16 
    //1B 20 0D 00 00 2D 00 38 2D 1E 11 16 04 0B 47 
  }


  function bool IsFreeCamLocked() {
    return mFreeCamLock;                                                        //0000 : 04 2D 01 50 2F 1E 11 
    //04 2D 01 50 2F 1E 11 04 0B 47 
  }


  function LockFreeCam(bool aLock) {
    mFreeCamLock = aLock;                                                       //0000 : 14 2D 01 50 2F 1E 11 2D 00 48 6F 2A 11 
    //14 2D 01 50 2F 1E 11 2D 00 48 6F 2A 11 04 0B 47 
  }


  function bool UsingFreeCam() {
    return Outer.bFreeCam;                                                      //0000 : 04 19 01 00 E4 6B 0F 06 00 04 2D 01 28 54 71 0F 
    //04 19 01 00 E4 6B 0F 06 00 04 2D 01 28 54 71 0F 04 0B 47 
  }


  function SetFreeCam(bool free) {
    if (!mFreeCamLock) {                                                        //0000 : 07 21 00 81 2D 01 50 2F 1E 11 16 
      Outer.bFreeCam = free;                                                    //000B : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 28 54 71 0F 2D 00 E0 71 2A 11 
    }
    //07 21 00 81 2D 01 50 2F 1E 11 16 14 19 01 00 E4 6B 0F 06 00 04 2D 01 28 54 71 0F 2D 00 E0 71 2A 
    //11 04 0B 47 
  }


  function cl_Tick(float DeltaSeconds) {
    cl_RotateCameraBack(DeltaSeconds);                                          //0000 : 1B 2F 0F 00 00 00 68 73 2A 11 16 
    cl_MoveTomDesiredCameraDist(DeltaSeconds);                                  //000B : 1B 9F 0F 00 00 00 68 73 2A 11 16 
    ViewShake(DeltaSeconds);                                                    //0016 : 1B 65 0F 00 00 00 68 73 2A 11 16 
    //1B 2F 0F 00 00 00 68 73 2A 11 16 1B 9F 0F 00 00 00 68 73 2A 11 16 1B 65 0F 00 00 00 68 73 2A 11 
    //16 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    mEnvironmentEffect = new Class'Game_CameraEnvironmentEffect';               //0006 : 0F 01 E0 74 2A 11 11 0B 0B 0B 20 F0 AF 60 01 
    mEnvironmentEffect.SetController(Outer);                                    //0015 : 19 01 E0 74 2A 11 0B 00 00 1B F3 0E 00 00 01 00 E4 6B 0F 16 
    Outer.Level.GetEnvironmentManager().AddEffect(mEnvironmentEffect);          //0029 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 06 00 04 1B D4 12 00 00 16 0B 00 00 1C 70 9C 7C 0F 01 E0 74 2A 11 16 
    //1C E0 C4 19 11 16 0F 01 E0 74 2A 11 11 0B 0B 0B 20 F0 AF 60 01 19 01 E0 74 2A 11 0B 00 00 1B F3 
    //0E 00 00 01 00 E4 6B 0F 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 06 00 04 1B D4 12 00 
    //00 16 0B 00 00 1C 70 9C 7C 0F 01 E0 74 2A 11 16 04 0B 47 
  }



