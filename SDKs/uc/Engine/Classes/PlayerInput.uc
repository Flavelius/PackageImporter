//==============================================================================
//  PlayerInput
//==============================================================================

class PlayerInput extends Object within PlayerController
    native
    dependsOn(PlayerController,Class)
    Transient
    Config(User)
  ;

  var globalconfig bool bInvertMouse;
  var bool bAdjustSampling;
  var globalconfig byte MouseSmoothingMode;
  var globalconfig float MouseSmoothingStrength;
  var globalconfig float MouseSensitivity;
  var globalconfig float MouseSamplingTime;
  var globalconfig float MouseAccelThreshold;
  var float SmoothedMouse[2];
  var float ZeroTime[2];
  var float SamplingTime[2];
  var float MaybeTime[2];
  var float OldSamples[4];
  var int MouseSamples[2];
  var private bool mInputFrozen;


  function ChangeSnapView(bool B) {
    Outer.bSnapToLevel = B;                                                     //0000 : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 48 1C 72 0F 2D 00 F0 1D 7A 0F 
    //14 19 01 00 E4 6B 0F 06 00 04 2D 01 48 1C 72 0F 2D 00 F0 1D 7A 0F 04 0B 47 
  }


  function InvertMouse(optional string Invert) {
    if (Invert != "") {                                                         //0000 : 07 1D 00 7B 00 18 1F 7A 0F 1F 00 16 
      bInvertMouse = bool(Invert);                                              //000C : 14 2D 01 88 23 71 0F 39 4B 00 18 1F 7A 0F 
    } else {                                                                    //001A : 06 2C 00 
      bInvertMouse = !bInvertMouse;                                             //001D : 14 2D 01 88 23 71 0F 81 2D 01 88 23 71 0F 16 
    }
    SaveConfig();                                                               //002C : 62 18 16 
    default.bInvertMouse = bInvertMouse;                                        //002F : 14 2D 02 88 23 71 0F 2D 01 88 23 71 0F 
    //07 1D 00 7B 00 18 1F 7A 0F 1F 00 16 14 2D 01 88 23 71 0F 39 4B 00 18 1F 7A 0F 06 2C 00 14 2D 01 
    //88 23 71 0F 81 2D 01 88 23 71 0F 16 62 18 16 14 2D 02 88 23 71 0F 2D 01 88 23 71 0F 04 0B 47 
  }


  function UpdateSmoothing(int Mode) {
    MouseSmoothingMode = Mode;                                                  //0000 : 0F 01 A0 21 7A 0F 39 3D 00 C0 20 7A 0F 
    default.MouseSmoothingMode = MouseSmoothingMode;                            //000D : 0F 02 A0 21 7A 0F 01 A0 21 7A 0F 
    Class'PlayerInput'.static.StaticSaveConfig();                               //0018 : 12 20 30 F4 C2 00 06 00 00 1C 98 A8 69 0F 16 
    //0F 01 A0 21 7A 0F 39 3D 00 C0 20 7A 0F 0F 02 A0 21 7A 0F 01 A0 21 7A 0F 12 20 30 F4 C2 00 06 00 
    //00 1C 98 A8 69 0F 16 04 0B 47 
  }


  function UpdateAccel(float F) {
    MouseAccelThreshold = FMax(0.00000000,F);                                   //0000 : 0F 01 A8 23 7A 0F F5 1E 00 00 00 00 00 C8 22 7A 0F 16 
    default.MouseAccelThreshold = MouseAccelThreshold;                          //0012 : 0F 02 A8 23 7A 0F 01 A8 23 7A 0F 
    Class'PlayerInput'.static.StaticSaveConfig();                               //001D : 12 20 30 F4 C2 00 06 00 00 1C 98 A8 69 0F 16 
    //0F 01 A8 23 7A 0F F5 1E 00 00 00 00 00 C8 22 7A 0F 16 0F 02 A8 23 7A 0F 01 A8 23 7A 0F 12 20 30 
    //F4 C2 00 06 00 00 1C 98 A8 69 0F 16 04 0B 47 
  }


  function UpdateSensitivity(float F) {
    MouseSensitivity = FMax(0.00000000,F);                                      //0000 : 0F 01 B0 25 7A 0F F5 1E 00 00 00 00 00 D0 24 7A 0F 16 
    default.MouseSensitivity = MouseSensitivity;                                //0012 : 0F 02 B0 25 7A 0F 01 B0 25 7A 0F 
    Class'PlayerInput'.static.StaticSaveConfig();                               //001D : 12 20 30 F4 C2 00 06 00 00 1C 98 A8 69 0F 16 
    //0F 01 B0 25 7A 0F F5 1E 00 00 00 00 00 D0 24 7A 0F 16 0F 02 B0 25 7A 0F 01 B0 25 7A 0F 12 20 30 
    //F4 C2 00 06 00 00 1C 98 A8 69 0F 16 04 0B 47 
  }


  function float SmoothMouse(float aMouse,float DeltaTime,out byte SampleCount,int Index) {
    local int i;
    local int sum;
    if (MouseSmoothingMode == 0) {                                              //0000 : 07 13 00 9A 39 3A 01 A0 21 7A 0F 25 16 
      return aMouse;                                                            //000D : 04 00 D8 26 7A 0F 
    }
    if (aMouse == 0) {                                                          //0013 : 07 1B 01 B4 00 D8 26 7A 0F 39 3F 25 16 
      ZeroTime[Index] += DeltaTime;                                             //0020 : B8 1A 00 C8 2B 7A 0F 01 40 2C 7A 0F 00 B8 2C 7A 0F 16 
      if (ZeroTime[Index] < MouseSamplingTime) {                                //0032 : 07 7F 00 B0 1A 00 C8 2B 7A 0F 01 40 2C 7A 0F 01 30 2D 7A 0F 16 
        SamplingTime[Index] += DeltaTime;                                       //0047 : B8 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F 00 B8 2C 7A 0F 16 
        MaybeTime[Index] += DeltaTime;                                          //0059 : B8 1A 00 C8 2B 7A 0F 01 20 2E 7A 0F 00 B8 2C 7A 0F 16 
        aMouse = SmoothedMouse[Index];                                          //006B : 0F 00 D8 26 7A 0F 1A 00 C8 2B 7A 0F 01 98 2E 7A 0F 
      } else {                                                                  //007C : 06 18 01 
        if (bAdjustSampling && MouseSamples[Index] > 9) {                       //007F : 07 E9 00 82 2D 01 10 2F 7A 0F 18 10 00 97 1A 00 C8 2B 7A 0F 01 88 2F 7A 0F 2C 09 16 16 
          SamplingTime[Index] -= MaybeTime[Index];                              //009C : B9 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F 1A 00 C8 2B 7A 0F 01 20 2E 7A 0F 16 
          MouseSamplingTime = 0.89999998 * MouseSamplingTime + 0.10000000 * SamplingTime[Index] / MouseSamples[Index];//00B4 : 0F 01 30 2D 7A 0F AE AB 1E 66 66 66 3F 01 30 2D 7A 0F 16 AC AB 1E CD CC CC 3D 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F 16 39 3F 1A 00 C8 2B 7A 0F 01 88 2F 7A 0F 16 16 
        }
        SamplingTime[Index] = 0.00000000;                                       //00E9 : 0F 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F 1E 00 00 00 00 
        SmoothedMouse[Index] = 0.00000000;                                      //00FA : 0F 1A 00 C8 2B 7A 0F 01 98 2E 7A 0F 1E 00 00 00 00 
        MouseSamples[Index] = 0;                                                //010B : 0F 1A 00 C8 2B 7A 0F 01 88 2F 7A 0F 25 
      }
    } else {                                                                    //0118 : 06 08 02 
      MaybeTime[Index] = 0.00000000;                                            //011B : 0F 1A 00 C8 2B 7A 0F 01 20 2E 7A 0F 1E 00 00 00 00 
      if (SmoothedMouse[Index] != 0) {                                          //012C : 07 C5 01 B5 1A 00 C8 2B 7A 0F 01 98 2E 7A 0F 39 3F 25 16 
        MouseSamples[Index] += SampleCount;                                     //013F : A1 1A 00 C8 2B 7A 0F 01 88 2F 7A 0F 39 3A 00 08 30 7A 0F 16 
        if (DeltaTime > MouseSamplingTime * (SampleCount + 1)) {                //0153 : 07 8E 01 B1 00 B8 2C 7A 0F AB 01 30 2D 7A 0F 39 3F 92 39 3A 00 08 30 7A 0F 26 16 16 16 
          SamplingTime[Index] += MouseSamplingTime * SampleCount;               //0170 : B8 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F AB 01 30 2D 7A 0F 39 3C 00 08 30 7A 0F 16 16 
        } else {                                                                //018B : 06 C2 01 
          SamplingTime[Index] += DeltaTime;                                     //018E : B8 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F 00 B8 2C 7A 0F 16 
          aMouse = aMouse * DeltaTime / MouseSamplingTime * SampleCount;        //01A0 : 0F 00 D8 26 7A 0F AC AB 00 D8 26 7A 0F 00 B8 2C 7A 0F 16 AB 01 30 2D 7A 0F 39 3C 00 08 30 7A 0F 16 16 
        }
      } else {                                                                  //01C2 : 06 DD 01 
        SamplingTime[Index] = 0.50000000 * MouseSamplingTime;                   //01C5 : 0F 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F AB 1E 00 00 00 3F 01 30 2D 7A 0F 16 
      }
      SmoothedMouse[Index] = aMouse / SampleCount;                              //01DD : 0F 1A 00 C8 2B 7A 0F 01 98 2E 7A 0F AC 00 D8 26 7A 0F 39 3C 00 08 30 7A 0F 16 
      ZeroTime[Index] = 0.00000000;                                             //01F7 : 0F 1A 00 C8 2B 7A 0F 01 40 2C 7A 0F 1E 00 00 00 00 
    }
    SampleCount = 0;                                                            //0208 : 0F 00 08 30 7A 0F 24 00 
    if (MouseSmoothingMode > 1) {                                               //0210 : 07 1A 03 97 39 3A 01 A0 21 7A 0F 26 16 
      if (aMouse == 0) {                                                        //021D : 07 9E 02 B4 00 D8 26 7A 0F 39 3F 25 16 
        i = 0;                                                                  //022A : 0F 00 80 30 7A 0F 25 
        while (i < 3) {                                                         //0231 : 07 8D 02 96 00 80 30 7A 0F 2C 03 16 
          sum += (i + 1) * 0.10000000;                                          //023D : A1 00 F8 30 7A 0F 39 44 AB 39 3F 92 00 80 30 7A 0F 26 16 1E CD CC CC 3D 16 16 
          aMouse += sum * OldSamples[i];                                        //0257 : B8 00 D8 26 7A 0F AB 39 3F 00 F8 30 7A 0F 1A 00 80 30 7A 0F 01 70 31 7A 0F 16 16 
          OldSamples[i] = 0.00000000;                                           //0272 : 0F 1A 00 80 30 7A 0F 01 70 31 7A 0F 1E 00 00 00 00 
          i++;                                                                  //0283 : A5 00 80 30 7A 0F 16 
        }
        OldSamples[3] = 0.00000000;                                             //028D : 0F 1A 2C 03 01 70 31 7A 0F 1E 00 00 00 00 
      } else {                                                                  //029B : 06 1A 03 
        aMouse = 0.40000001 * aMouse;                                           //029E : 0F 00 D8 26 7A 0F AB 1E CD CC CC 3E 00 D8 26 7A 0F 16 
        OldSamples[3] = aMouse;                                                 //02B0 : 0F 1A 2C 03 01 70 31 7A 0F 00 D8 26 7A 0F 
        i = 0;                                                                  //02BE : 0F 00 80 30 7A 0F 25 
        while (i < 3) {                                                         //02C5 : 07 1A 03 96 00 80 30 7A 0F 2C 03 16 
          aMouse += (i + 1) * 0.10000000 * OldSamples[i];                       //02D1 : B8 00 D8 26 7A 0F AB AB 39 3F 92 00 80 30 7A 0F 26 16 1E CD CC CC 3D 16 1A 00 80 30 7A 0F 01 70 31 7A 0F 16 16 
          OldSamples[i] = OldSamples[i + 1];                                    //02F6 : 0F 1A 00 80 30 7A 0F 01 70 31 7A 0F 1A 92 00 80 30 7A 0F 26 16 01 70 31 7A 0F 
          i++;                                                                  //0310 : A5 00 80 30 7A 0F 16 
        }
      }
    }
    return aMouse;                                                              //031A : 04 00 D8 26 7A 0F 
    //07 13 00 9A 39 3A 01 A0 21 7A 0F 25 16 04 00 D8 26 7A 0F 07 1B 01 B4 00 D8 26 7A 0F 39 3F 25 16 
    //B8 1A 00 C8 2B 7A 0F 01 40 2C 7A 0F 00 B8 2C 7A 0F 16 07 7F 00 B0 1A 00 C8 2B 7A 0F 01 40 2C 7A 
    //0F 01 30 2D 7A 0F 16 B8 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F 00 B8 2C 7A 0F 16 B8 1A 00 C8 2B 7A 0F 
    //01 20 2E 7A 0F 00 B8 2C 7A 0F 16 0F 00 D8 26 7A 0F 1A 00 C8 2B 7A 0F 01 98 2E 7A 0F 06 18 01 07 
    //E9 00 82 2D 01 10 2F 7A 0F 18 10 00 97 1A 00 C8 2B 7A 0F 01 88 2F 7A 0F 2C 09 16 16 B9 1A 00 C8 
    //2B 7A 0F 01 A8 2D 7A 0F 1A 00 C8 2B 7A 0F 01 20 2E 7A 0F 16 0F 01 30 2D 7A 0F AE AB 1E 66 66 66 
    //3F 01 30 2D 7A 0F 16 AC AB 1E CD CC CC 3D 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F 16 39 3F 1A 00 C8 2B 
    //7A 0F 01 88 2F 7A 0F 16 16 0F 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F 1E 00 00 00 00 0F 1A 00 C8 2B 7A 
    //0F 01 98 2E 7A 0F 1E 00 00 00 00 0F 1A 00 C8 2B 7A 0F 01 88 2F 7A 0F 25 06 08 02 0F 1A 00 C8 2B 
    //7A 0F 01 20 2E 7A 0F 1E 00 00 00 00 07 C5 01 B5 1A 00 C8 2B 7A 0F 01 98 2E 7A 0F 39 3F 25 16 A1 
    //1A 00 C8 2B 7A 0F 01 88 2F 7A 0F 39 3A 00 08 30 7A 0F 16 07 8E 01 B1 00 B8 2C 7A 0F AB 01 30 2D 
    //7A 0F 39 3F 92 39 3A 00 08 30 7A 0F 26 16 16 16 B8 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F AB 01 30 2D 
    //7A 0F 39 3C 00 08 30 7A 0F 16 16 06 C2 01 B8 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F 00 B8 2C 7A 0F 16 
    //0F 00 D8 26 7A 0F AC AB 00 D8 26 7A 0F 00 B8 2C 7A 0F 16 AB 01 30 2D 7A 0F 39 3C 00 08 30 7A 0F 
    //16 16 06 DD 01 0F 1A 00 C8 2B 7A 0F 01 A8 2D 7A 0F AB 1E 00 00 00 3F 01 30 2D 7A 0F 16 0F 1A 00 
    //C8 2B 7A 0F 01 98 2E 7A 0F AC 00 D8 26 7A 0F 39 3C 00 08 30 7A 0F 16 0F 1A 00 C8 2B 7A 0F 01 40 
    //2C 7A 0F 1E 00 00 00 00 0F 00 08 30 7A 0F 24 00 07 1A 03 97 39 3A 01 A0 21 7A 0F 26 16 07 9E 02 
    //B4 00 D8 26 7A 0F 39 3F 25 16 0F 00 80 30 7A 0F 25 07 8D 02 96 00 80 30 7A 0F 2C 03 16 A1 00 F8 
    //30 7A 0F 39 44 AB 39 3F 92 00 80 30 7A 0F 26 16 1E CD CC CC 3D 16 16 B8 00 D8 26 7A 0F AB 39 3F 
    //00 F8 30 7A 0F 1A 00 80 30 7A 0F 01 70 31 7A 0F 16 16 0F 1A 00 80 30 7A 0F 01 70 31 7A 0F 1E 00 
    //00 00 00 A5 00 80 30 7A 0F 16 06 31 02 0F 1A 2C 03 01 70 31 7A 0F 1E 00 00 00 00 06 1A 03 0F 00 
    //D8 26 7A 0F AB 1E CD CC CC 3E 00 D8 26 7A 0F 16 0F 1A 2C 03 01 70 31 7A 0F 00 D8 26 7A 0F 0F 00 
    //80 30 7A 0F 25 07 1A 03 96 00 80 30 7A 0F 2C 03 16 B8 00 D8 26 7A 0F AB AB 39 3F 92 00 80 30 7A 
    //0F 26 16 1E CD CC CC 3D 16 1A 00 80 30 7A 0F 01 70 31 7A 0F 16 16 0F 1A 00 80 30 7A 0F 01 70 31 
    //7A 0F 1A 92 00 80 30 7A 0F 26 16 01 70 31 7A 0F A5 00 80 30 7A 0F 16 06 C5 02 04 00 D8 26 7A 0F 
    //04 0B 47 
  }


  function float AccelerateMouse(float aMouse) {
    local float Accel;
    if (Abs(aMouse) == 0) {                                                     //0000 : 07 15 00 B4 BA 00 10 33 7A 0F 16 39 3F 25 16 
      return 0.00000000;                                                        //000F : 04 1E 00 00 00 00 
    }
    Accel = MouseAccelThreshold * MouseSensitivity;                             //0015 : 0F 00 38 53 7A 0F AB 01 A8 23 7A 0F 01 B0 25 7A 0F 16 
    if (Abs(aMouse) < Accel) {                                                  //0027 : 07 7A 00 B0 BA 00 10 33 7A 0F 16 00 38 53 7A 0F 16 
      if (Abs(aMouse) < 0.10000000 * Accel) {                                   //0038 : 07 5F 00 B0 BA 00 10 33 7A 0F 16 AB 1E CD CC CC 3D 00 38 53 7A 0F 16 16 
        aMouse *= 0.10000000;                                                   //0050 : B6 00 10 33 7A 0F 1E CD CC CC 3D 16 
      } else {                                                                  //005C : 06 7A 00 
        aMouse = aMouse * Abs(aMouse) / Accel;                                  //005F : 0F 00 10 33 7A 0F AC AB 00 10 33 7A 0F BA 00 10 33 7A 0F 16 16 00 38 53 7A 0F 16 
      }
    }
    return aMouse;                                                              //007A : 04 00 10 33 7A 0F 
    //07 15 00 B4 BA 00 10 33 7A 0F 16 39 3F 25 16 04 1E 00 00 00 00 0F 00 38 53 7A 0F AB 01 A8 23 7A 
    //0F 01 B0 25 7A 0F 16 07 7A 00 B0 BA 00 10 33 7A 0F 16 00 38 53 7A 0F 16 07 5F 00 B0 BA 00 10 33 
    //7A 0F 16 AB 1E CD CC CC 3D 00 38 53 7A 0F 16 16 B6 00 10 33 7A 0F 1E CD CC CC 3D 16 06 7A 00 0F 
    //00 10 33 7A 0F AC AB 00 10 33 7A 0F BA 00 10 33 7A 0F 16 16 00 38 53 7A 0F 16 04 00 10 33 7A 0F 
    //04 0B 47 
  }


  event PlayerInput(float DeltaTime) {
    local float FOVScale;
    local float MouseScale;
    if (mInputFrozen) {                                                         //0000 : 07 0B 00 2D 01 A0 5A 7A 0F 
      return;                                                                   //0009 : 04 0B 
    }
    FOVScale = Outer.DesiredFOV * 0.01111000;                                   //000B : 0F 00 18 5B 7A 0F AB 19 01 00 E4 6B 0F 05 00 04 01 E0 69 6D 0F 1E B8 06 36 3C 16 
    MouseScale = MouseSensitivity * FOVScale;                                   //0026 : 0F 00 90 5B 7A 0F AB 01 B0 25 7A 0F 00 18 5B 7A 0F 16 
    Outer.aMouseX = SmoothMouse(Outer.aMouseX * MouseScale,DeltaTime,Outer.bXAxis,0);//0038 : 0F 19 01 00 E4 6B 0F 05 00 04 01 60 30 72 0F 1B 3F 2B 00 00 AB 19 01 00 E4 6B 0F 05 00 04 01 60 30 72 0F 00 90 5B 7A 0F 16 00 D8 54 7A 0F 19 01 00 E4 6B 0F 05 00 01 01 08 2E 72 0F 25 16 
    Outer.aMouseY = SmoothMouse(Outer.aMouseY * MouseScale,DeltaTime,Outer.bYAxis,1);//0076 : 0F 19 01 00 E4 6B 0F 05 00 04 01 D8 30 72 0F 1B 3F 2B 00 00 AB 19 01 00 E4 6B 0F 05 00 04 01 D8 30 72 0F 00 90 5B 7A 0F 16 00 D8 54 7A 0F 19 01 00 E4 6B 0F 05 00 01 01 80 2E 72 0F 26 16 
    Outer.aMouseX = AccelerateMouse(Outer.aMouseX);                             //00B4 : 0F 19 01 00 E4 6B 0F 05 00 04 01 60 30 72 0F 1B 3E 2B 00 00 19 01 00 E4 6B 0F 05 00 04 01 60 30 72 0F 16 
    Outer.aMouseY = AccelerateMouse(Outer.aMouseY);                             //00D7 : 0F 19 01 00 E4 6B 0F 05 00 04 01 D8 30 72 0F 1B 3E 2B 00 00 19 01 00 E4 6B 0F 05 00 04 01 D8 30 72 0F 16 
    Outer.aLookUp *= FOVScale;                                                  //00FA : B6 19 01 00 E4 6B 0F 05 00 04 01 08 56 71 0F 00 18 5B 7A 0F 16 
    Outer.aTurn *= FOVScale;                                                    //010F : B6 19 01 00 E4 6B 0F 05 00 04 01 90 55 71 0F 00 18 5B 7A 0F 16 
    if (Outer.bStrafe != 0) {                                                   //0124 : 07 72 01 9B 39 3A 19 01 00 E4 6B 0F 05 00 01 01 38 2B 72 0F 25 16 
      Outer.aStrafe += Outer.aBaseX * 7.50000000 + Outer.aMouseX;               //013A : B8 19 01 00 E4 6B 0F 05 00 04 01 50 FD 6E 0F AE AB 19 01 00 E4 6B 0F 05 00 04 01 F8 2E 72 0F 1E 00 00 F0 40 16 19 01 00 E4 6B 0F 05 00 04 01 60 30 72 0F 16 16 
    } else {                                                                    //016F : 06 A7 01 
      Outer.aTurn += Outer.aBaseX * FOVScale + Outer.aMouseX;                   //0172 : B8 19 01 00 E4 6B 0F 05 00 04 01 90 55 71 0F AE AB 19 01 00 E4 6B 0F 05 00 04 01 F8 2E 72 0F 00 18 5B 7A 0F 16 19 01 00 E4 6B 0F 05 00 04 01 60 30 72 0F 16 16 
    }
    Outer.aBaseX = 0.00000000;                                                  //01A7 : 0F 19 01 00 E4 6B 0F 05 00 04 01 F8 2E 72 0F 1E 00 00 00 00 
    if (Outer.bStrafe == 0
      && (Outer.bAlwaysMouseLook || Outer.bLook != 0)) {//01BB : 07 48 02 82 9A 39 3A 19 01 00 E4 6B 0F 05 00 01 01 38 2B 72 0F 25 16 18 28 00 84 19 01 00 E4 6B 0F 06 00 04 2D 01 98 EE 6E 0F 18 14 00 9B 39 3A 19 01 00 E4 6B 0F 05 00 01 01 28 2C 72 0F 25 16 16 16 
      if (bInvertMouse) {                                                       //01FD : 07 27 02 2D 01 88 23 71 0F 
        Outer.aLookUp -= Outer.aMouseY;                                         //0206 : B9 19 01 00 E4 6B 0F 05 00 04 01 08 56 71 0F 19 01 00 E4 6B 0F 05 00 04 01 D8 30 72 0F 16 
      } else {                                                                  //0224 : 06 45 02 
        Outer.aLookUp += Outer.aMouseY;                                         //0227 : B8 19 01 00 E4 6B 0F 05 00 04 01 08 56 71 0F 19 01 00 E4 6B 0F 05 00 04 01 D8 30 72 0F 16 
      }
    } else {                                                                    //0245 : 06 66 02 
      Outer.aForward += Outer.aMouseY;                                          //0248 : B8 19 01 00 E4 6B 0F 05 00 04 01 D8 FC 6E 0F 19 01 00 E4 6B 0F 05 00 04 01 D8 30 72 0F 16 
    }
    if (Outer.bSnapLevel != 0) {                                                //0266 : 07 A1 02 9B 39 3A 19 01 00 E4 6B 0F 05 00 01 01 B0 2B 72 0F 25 16 
      Outer.bCenterView = True;                                                 //027C : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 E8 1D 72 0F 27 
      Outer.bKeyboardLook = False;                                              //028D : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 70 1D 72 0F 28 
    } else {                                                                    //029E : 06 26 03 
      if (Outer.aLookUp != 0) {                                                 //02A1 : 07 DC 02 B5 19 01 00 E4 6B 0F 05 00 04 01 08 56 71 0F 39 3F 25 16 
        Outer.bCenterView = False;                                              //02B7 : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 E8 1D 72 0F 28 
        Outer.bKeyboardLook = True;                                             //02C8 : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 70 1D 72 0F 27 
      } else {                                                                  //02D9 : 06 26 03 
        if (Outer.bSnapToLevel && !Outer.bAlwaysMouseLook) {                    //02DC : 07 26 03 82 19 01 00 E4 6B 0F 06 00 04 2D 01 48 1C 72 0F 18 12 00 81 19 01 00 E4 6B 0F 06 00 04 2D 01 98 EE 6E 0F 16 16 
          Outer.bCenterView = True;                                             //0304 : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 E8 1D 72 0F 27 
          Outer.bKeyboardLook = False;                                          //0315 : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 70 1D 72 0F 28 
        }
      }
    }
    if (Outer.bFreeLook != 0) {                                                 //0326 : 07 7C 03 9B 39 3A 19 01 00 E4 6B 0F 05 00 01 01 A0 2C 72 0F 25 16 
      Outer.bKeyboardLook = True;                                               //033C : 14 19 01 00 E4 6B 0F 06 00 04 2D 01 70 1D 72 0F 27 
      Outer.aLookUp += 0.50000000 * Outer.aBaseY * FOVScale;                    //034D : B8 19 01 00 E4 6B 0F 05 00 04 01 08 56 71 0F AB AB 1E 00 00 00 3F 19 01 00 E4 6B 0F 05 00 04 01 70 2F 72 0F 16 00 18 5B 7A 0F 16 16 
    } else {                                                                    //0379 : 06 9A 03 
      Outer.aForward += Outer.aBaseY;                                           //037C : B8 19 01 00 E4 6B 0F 05 00 04 01 D8 FC 6E 0F 19 01 00 E4 6B 0F 05 00 04 01 70 2F 72 0F 16 
    }
    Outer.aBaseY = 0.00000000;                                                  //039A : 0F 19 01 00 E4 6B 0F 05 00 04 01 70 2F 72 0F 1E 00 00 00 00 
    Outer.HandleWalking();                                                      //03AE : 19 01 00 E4 6B 0F 06 00 00 1B 35 2C 00 00 16 
    //07 0B 00 2D 01 A0 5A 7A 0F 04 0B 0F 00 18 5B 7A 0F AB 19 01 00 E4 6B 0F 05 00 04 01 E0 69 6D 0F 
    //1E B8 06 36 3C 16 0F 00 90 5B 7A 0F AB 01 B0 25 7A 0F 00 18 5B 7A 0F 16 0F 19 01 00 E4 6B 0F 05 
    //00 04 01 60 30 72 0F 1B 3F 2B 00 00 AB 19 01 00 E4 6B 0F 05 00 04 01 60 30 72 0F 00 90 5B 7A 0F 
    //16 00 D8 54 7A 0F 19 01 00 E4 6B 0F 05 00 01 01 08 2E 72 0F 25 16 0F 19 01 00 E4 6B 0F 05 00 04 
    //01 D8 30 72 0F 1B 3F 2B 00 00 AB 19 01 00 E4 6B 0F 05 00 04 01 D8 30 72 0F 00 90 5B 7A 0F 16 00 
    //D8 54 7A 0F 19 01 00 E4 6B 0F 05 00 01 01 80 2E 72 0F 26 16 0F 19 01 00 E4 6B 0F 05 00 04 01 60 
    //30 72 0F 1B 3E 2B 00 00 19 01 00 E4 6B 0F 05 00 04 01 60 30 72 0F 16 0F 19 01 00 E4 6B 0F 05 00 
    //04 01 D8 30 72 0F 1B 3E 2B 00 00 19 01 00 E4 6B 0F 05 00 04 01 D8 30 72 0F 16 B6 19 01 00 E4 6B 
    //0F 05 00 04 01 08 56 71 0F 00 18 5B 7A 0F 16 B6 19 01 00 E4 6B 0F 05 00 04 01 90 55 71 0F 00 18 
    //5B 7A 0F 16 07 72 01 9B 39 3A 19 01 00 E4 6B 0F 05 00 01 01 38 2B 72 0F 25 16 B8 19 01 00 E4 6B 
    //0F 05 00 04 01 50 FD 6E 0F AE AB 19 01 00 E4 6B 0F 05 00 04 01 F8 2E 72 0F 1E 00 00 F0 40 16 19 
    //01 00 E4 6B 0F 05 00 04 01 60 30 72 0F 16 16 06 A7 01 B8 19 01 00 E4 6B 0F 05 00 04 01 90 55 71 
    //0F AE AB 19 01 00 E4 6B 0F 05 00 04 01 F8 2E 72 0F 00 18 5B 7A 0F 16 19 01 00 E4 6B 0F 05 00 04 
    //01 60 30 72 0F 16 16 0F 19 01 00 E4 6B 0F 05 00 04 01 F8 2E 72 0F 1E 00 00 00 00 07 48 02 82 9A 
    //39 3A 19 01 00 E4 6B 0F 05 00 01 01 38 2B 72 0F 25 16 18 28 00 84 19 01 00 E4 6B 0F 06 00 04 2D 
    //01 98 EE 6E 0F 18 14 00 9B 39 3A 19 01 00 E4 6B 0F 05 00 01 01 28 2C 72 0F 25 16 16 16 07 27 02 
    //2D 01 88 23 71 0F B9 19 01 00 E4 6B 0F 05 00 04 01 08 56 71 0F 19 01 00 E4 6B 0F 05 00 04 01 D8 
    //30 72 0F 16 06 45 02 B8 19 01 00 E4 6B 0F 05 00 04 01 08 56 71 0F 19 01 00 E4 6B 0F 05 00 04 01 
    //D8 30 72 0F 16 06 66 02 B8 19 01 00 E4 6B 0F 05 00 04 01 D8 FC 6E 0F 19 01 00 E4 6B 0F 05 00 04 
    //01 D8 30 72 0F 16 07 A1 02 9B 39 3A 19 01 00 E4 6B 0F 05 00 01 01 B0 2B 72 0F 25 16 14 19 01 00 
    //E4 6B 0F 06 00 04 2D 01 E8 1D 72 0F 27 14 19 01 00 E4 6B 0F 06 00 04 2D 01 70 1D 72 0F 28 06 26 
    //03 07 DC 02 B5 19 01 00 E4 6B 0F 05 00 04 01 08 56 71 0F 39 3F 25 16 14 19 01 00 E4 6B 0F 06 00 
    //04 2D 01 E8 1D 72 0F 28 14 19 01 00 E4 6B 0F 06 00 04 2D 01 70 1D 72 0F 27 06 26 03 07 26 03 82 
    //19 01 00 E4 6B 0F 06 00 04 2D 01 48 1C 72 0F 18 12 00 81 19 01 00 E4 6B 0F 06 00 04 2D 01 98 EE 
    //6E 0F 16 16 14 19 01 00 E4 6B 0F 06 00 04 2D 01 E8 1D 72 0F 27 14 19 01 00 E4 6B 0F 06 00 04 2D 
    //01 70 1D 72 0F 28 07 7C 03 9B 39 3A 19 01 00 E4 6B 0F 05 00 01 01 A0 2C 72 0F 25 16 14 19 01 00 
    //E4 6B 0F 06 00 04 2D 01 70 1D 72 0F 27 B8 19 01 00 E4 6B 0F 05 00 04 01 08 56 71 0F AB AB 1E 00 
    //00 00 3F 19 01 00 E4 6B 0F 05 00 04 01 70 2F 72 0F 16 00 18 5B 7A 0F 16 16 06 9A 03 B8 19 01 00 
    //E4 6B 0F 05 00 04 01 D8 FC 6E 0F 19 01 00 E4 6B 0F 05 00 04 01 70 2F 72 0F 16 0F 19 01 00 E4 6B 
    //0F 05 00 04 01 70 2F 72 0F 1E 00 00 00 00 19 01 00 E4 6B 0F 06 00 00 1B 35 2C 00 00 16 04 0B 47 
    //
  }


  event FreezeInput(bool InputFrozen) {
    mInputFrozen = InputFrozen;                                                 //0000 : 14 2D 01 A0 5A 7A 0F 2D 00 B8 5C 7A 0F 
    //14 2D 01 A0 5A 7A 0F 2D 00 B8 5C 7A 0F 04 0B 47 
  }


  function bool InvertLook();



