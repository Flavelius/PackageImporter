//==============================================================================
//  xMaterialController
//==============================================================================

class xMaterialController extends Actor
    dependsOn(Material,Shader,ConstantColor)
    Placeable
  ;

  enum EMatTickFunc {
    MTF_PulseConstantColor ,
    MTF_FadeConstantColor ,
    MTF_NoAction 
  };

  enum EMatAction {
    MTA_SwapShaderDiffuse ,
    MTA_SwapShaderSelfIllum ,
    MTA_SwapShaderSpecular ,
    MTA_SwapCombinerMat1 ,
    MTA_SwapCombinerMat2 ,
    MTA_NoAction 
  };

  var (xMaterialController) Material Target;
  var (xMaterialController) Material SwapMaterialA;
  var (xMaterialController) Material SwapMaterialB;
  var (xMaterialController) byte MatTriggerAction;
  var (xMaterialController) byte MatTickFunc;
  var (xMaterialController) float MatTickValue;
  var transient float tickAccum;
  var transient float tickPtA;
  var transient float tickPtB;
  var transient bool triggerOn;


  simulated event Trigger(Actor Other,Pawn EventInstigator) {
    local Material tmp;
    if (MatTriggerAction == 5) {                                                //0000 : 07 12 00 9A 39 3A 01 80 06 F2 1C 39 3A 24 05 16 
      return;                                                                   //0010 : 04 0B 
    }
    tmp = SwapMaterialA;                                                        //0012 : 0F 00 B0 22 F2 1C 01 88 3F F2 1C 
    SwapMaterialA = SwapMaterialB;                                              //001D : 0F 01 88 3F F2 1C 01 48 03 F2 1C 
    SwapMaterialB = tmp;                                                        //0028 : 0F 01 48 03 F2 1C 00 B0 22 F2 1C 
    triggerOn = !triggerOn;                                                     //0033 : 14 2D 01 48 3A F2 1C 81 2D 01 48 3A F2 1C 16 
    if (Target.IsA('Shader')) {                                                 //0042 : 07 69 00 19 01 F8 8C B7 1C 08 00 04 61 2F 21 71 0B 00 00 16 
      ShaderAction(Shader(Target));                                             //0056 : 1B D1 2B 00 00 2E 00 88 C3 00 01 F8 8C B7 1C 16 
    } else {                                                                    //0066 : 06 C2 00 
      if (Target.IsA('Combiner')) {                                             //0069 : 07 90 00 19 01 F8 8C B7 1C 08 00 04 61 2F 21 70 0B 00 00 16 
        CombinerAction(Combiner(Target));                                       //007D : 1B D3 2B 00 00 2E 40 8D C3 00 01 F8 8C B7 1C 16 
      } else {                                                                  //008D : 06 C2 00 
        Log("Incompatible material in xMaterialTrigger",'Warning');             //0090 : E7 1F 49 6E 63 6F 6D 70 61 74 69 62 6C 65 20 6D 61 74 65 72 69 61 6C 20 69 6E 20 78 4D 61 74 65 72 69 61 6C 54 72 69 67 67 65 72 00 21 FF 02 00 00 16 
      }
    }
    if (Target.IsA('Shader')
      && Shader(Target).SpecularityMask.IsA('ConstantColor')) {//00C2 : 07 A1 01 82 19 01 F8 8C B7 1C 08 00 04 61 2F 21 71 0B 00 00 16 18 20 00 19 19 2E 00 88 C3 00 01 F8 8C B7 1C 05 00 04 01 30 11 3A 11 08 00 04 61 2F 21 6F 0B 00 00 16 16 
      if (triggerOn) {                                                          //00FA : 07 3F 01 2D 01 48 3A F2 1C 
        tickPtA = ConstantColor(Shader(Target).SpecularityMask).Color.A;        //0103 : 0F 01 A0 8A F2 1C 39 3C 36 48 91 6A 0F 19 2E C0 97 C3 00 19 2E 00 88 C3 00 01 F8 8C B7 1C 05 00 04 01 30 11 3A 11 05 00 04 01 78 23 2C 11 
        tickPtB = 255.00000000;                                                 //0131 : 0F 01 C8 88 F2 1C 1E 00 00 7F 43 
      } else {                                                                  //013C : 06 78 01 
        tickPtA = ConstantColor(Shader(Target).SpecularityMask).Color.A;        //013F : 0F 01 A0 8A F2 1C 39 3C 36 48 91 6A 0F 19 2E C0 97 C3 00 19 2E 00 88 C3 00 01 F8 8C B7 1C 05 00 04 01 30 11 3A 11 05 00 04 01 78 23 2C 11 
        tickPtB = 0.00000000;                                                   //016D : 0F 01 C8 88 F2 1C 1E 00 00 00 00 
      }
      tickAccum = 0.00000000;                                                   //0178 : 0F 01 78 A5 F2 1C 1E 00 00 00 00 
      switch (MatTickFunc) {                                                    //0183 : 05 01 01 E0 6B F2 1C 
        case 1 :                                                                //018A : 0A 8F 01 24 01 
        case 0 :                                                                //018F : 0A 9E 01 24 00 
          Enable('Tick');                                                       //0194 : 75 21 50 01 00 00 16 
          break;                                                                //019B : 06 A1 01 
        default:                                                                //019E : 0A FF FF 
      }
    }
    //07 12 00 9A 39 3A 01 80 06 F2 1C 39 3A 24 05 16 04 0B 0F 00 B0 22 F2 1C 01 88 3F F2 1C 0F 01 88 
    //3F F2 1C 01 48 03 F2 1C 0F 01 48 03 F2 1C 00 B0 22 F2 1C 14 2D 01 48 3A F2 1C 81 2D 01 48 3A F2 
    //1C 16 07 69 00 19 01 F8 8C B7 1C 08 00 04 61 2F 21 71 0B 00 00 16 1B D1 2B 00 00 2E 00 88 C3 00 
    //01 F8 8C B7 1C 16 06 C2 00 07 90 00 19 01 F8 8C B7 1C 08 00 04 61 2F 21 70 0B 00 00 16 1B D3 2B 
    //00 00 2E 40 8D C3 00 01 F8 8C B7 1C 16 06 C2 00 E7 1F 49 6E 63 6F 6D 70 61 74 69 62 6C 65 20 6D 
    //61 74 65 72 69 61 6C 20 69 6E 20 78 4D 61 74 65 72 69 61 6C 54 72 69 67 67 65 72 00 21 FF 02 00 
    //00 16 07 A1 01 82 19 01 F8 8C B7 1C 08 00 04 61 2F 21 71 0B 00 00 16 18 20 00 19 19 2E 00 88 C3 
    //00 01 F8 8C B7 1C 05 00 04 01 30 11 3A 11 08 00 04 61 2F 21 6F 0B 00 00 16 16 07 3F 01 2D 01 48 
    //3A F2 1C 0F 01 A0 8A F2 1C 39 3C 36 48 91 6A 0F 19 2E C0 97 C3 00 19 2E 00 88 C3 00 01 F8 8C B7 
    //1C 05 00 04 01 30 11 3A 11 05 00 04 01 78 23 2C 11 0F 01 C8 88 F2 1C 1E 00 00 7F 43 06 78 01 0F 
    //01 A0 8A F2 1C 39 3C 36 48 91 6A 0F 19 2E C0 97 C3 00 19 2E 00 88 C3 00 01 F8 8C B7 1C 05 00 04 
    //01 30 11 3A 11 05 00 04 01 78 23 2C 11 0F 01 C8 88 F2 1C 1E 00 00 00 00 0F 01 78 A5 F2 1C 1E 00 
    //00 00 00 05 01 01 E0 6B F2 1C 0A 8F 01 24 01 0A 9E 01 24 00 75 21 50 01 00 00 16 06 A1 01 0A FF 
    //FF 04 0B 47 
  }


  simulated function CombinerAction(Combiner cb) {
    //04 0B 47 
  }


  simulated function ShaderAction(Shader sh) {
    switch (MatTriggerAction) {                                                 //0000 : 05 01 01 80 06 F2 1C 
      case 2 :                                                                  //0007 : 0A 23 00 24 02 
        sh.Specular = SwapMaterialA;                                            //000C : 0F 19 00 B8 44 ED 1C 05 00 04 01 B8 10 3A 11 01 88 3F F2 1C 
        break;                                                                  //0020 : 06 26 00 
      default:                                                                  //0023 : 0A FF FF 
    }
    //05 01 01 80 06 F2 1C 0A 23 00 24 02 0F 19 00 B8 44 ED 1C 05 00 04 01 B8 10 3A 11 01 88 3F F2 1C 
    //06 26 00 0A FF FF 04 0B 47 
  }


  simulated function Tick(float t) {
    Super.Tick(t);                                                              //0000 : 1C 90 49 6D 0F 00 C0 27 F2 1C 16 
    if (MatTickFunc == 2) {                                                     //000B : 07 1D 00 9A 39 3A 01 E0 6B F2 1C 39 3A 24 02 16 
      return;                                                                   //001B : 04 0B 
    }
    if (Target.IsA('Shader')
      && Shader(Target).SpecularityMask.IsA('ConstantColor')) {//001D : 07 7B 00 82 19 01 F8 8C B7 1C 08 00 04 61 2F 21 71 0B 00 00 16 18 20 00 19 19 2E 00 88 C3 00 01 F8 8C B7 1C 05 00 04 01 30 11 3A 11 08 00 04 61 2F 21 6F 0B 00 00 16 16 
      TickConstantColor(ConstantColor(Shader(Target).SpecularityMask),t);       //0055 : 1B 43 2B 00 00 2E C0 97 C3 00 19 2E 00 88 C3 00 01 F8 8C B7 1C 05 00 04 01 30 11 3A 11 00 C0 27 F2 1C 16 
    } else {                                                                    //0078 : 06 A4 00 
      if (Target.IsA('ConstantColor')) {                                        //007B : 07 A4 00 19 01 F8 8C B7 1C 08 00 04 61 2F 21 6F 0B 00 00 16 
        TickConstantColor(ConstantColor(Target),t);                             //008F : 1B 43 2B 00 00 2E C0 97 C3 00 01 F8 8C B7 1C 00 C0 27 F2 1C 16 
      }
    }
    //1C 90 49 6D 0F 00 C0 27 F2 1C 16 07 1D 00 9A 39 3A 01 E0 6B F2 1C 39 3A 24 02 16 04 0B 07 7B 00 
    //82 19 01 F8 8C B7 1C 08 00 04 61 2F 21 71 0B 00 00 16 18 20 00 19 19 2E 00 88 C3 00 01 F8 8C B7 
    //1C 05 00 04 01 30 11 3A 11 08 00 04 61 2F 21 6F 0B 00 00 16 16 1B 43 2B 00 00 2E C0 97 C3 00 19 
    //2E 00 88 C3 00 01 F8 8C B7 1C 05 00 04 01 30 11 3A 11 00 C0 27 F2 1C 16 06 A4 00 07 A4 00 19 01 
    //F8 8C B7 1C 08 00 04 61 2F 21 6F 0B 00 00 16 1B 43 2B 00 00 2E C0 97 C3 00 01 F8 8C B7 1C 00 C0 
    //27 F2 1C 16 04 0B 47 
  }


  simulated function TickConstantColor(ConstantColor cc,float t) {
    local float F;
    local float Alpha;
    tickAccum += t;                                                             //0000 : B8 01 78 A5 F2 1C 00 08 F7 ED 1C 16 
    if (tickAccum >= 1.00000000) {                                              //000C : 07 26 00 B3 01 78 A5 F2 1C 1E 00 00 80 3F 16 
      tickAccum = 1.00000000;                                                   //001B : 0F 01 78 A5 F2 1C 1E 00 00 80 3F 
    }
    if (MatTickFunc == 1) {                                                     //0026 : 07 6F 00 9A 39 3A 01 E0 6B F2 1C 39 3A 24 01 16 
      if (tickAccum >= 1.00000000) {                                            //0036 : 07 4C 00 B3 01 78 A5 F2 1C 1E 00 00 80 3F 16 
        Disable('Tick');                                                        //0045 : 76 21 50 01 00 00 16 
      }
      Alpha = tickPtA + tickAccum * (tickPtB - tickPtA);                        //004C : 0F 00 68 74 F2 1C AE 01 A0 8A F2 1C AB 01 78 A5 F2 1C AF 01 C8 88 F2 1C 01 A0 8A F2 1C 16 16 16 
    } else {                                                                    //006C : 06 E8 00 
      if (MatTickFunc == 0) {                                                   //006F : 07 E8 00 9A 39 3A 01 E0 6B F2 1C 39 3A 24 00 16 
        Alpha = tickPtA + tickAccum * (tickPtB - tickPtA);                      //007F : 0F 00 68 74 F2 1C AE 01 A0 8A F2 1C AB 01 78 A5 F2 1C AF 01 C8 88 F2 1C 01 A0 8A F2 1C 16 16 16 
        F = Level.TimeSeconds * MatTickValue;                                   //009F : 0F 00 D0 6D F2 1C AB 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 F8 83 ED 1C 16 
        F = F - F;                                                              //00BA : 0F 00 D0 6D F2 1C AF 00 D0 6D F2 1C 39 3F 39 44 00 D0 6D F2 1C 16 
        Alpha = Pulse(F) * Alpha;                                               //00D0 : 0F 00 68 74 F2 1C AB 1B CD 2B 00 00 00 D0 6D F2 1C 16 00 68 74 F2 1C 16 
      }
    }
    cc.Color.A = Alpha;                                                         //00E8 : 0F 36 48 91 6A 0F 19 00 80 83 ED 1C 05 00 04 01 78 23 2C 11 39 43 00 68 74 F2 1C 
    //B8 01 78 A5 F2 1C 00 08 F7 ED 1C 16 07 26 00 B3 01 78 A5 F2 1C 1E 00 00 80 3F 16 0F 01 78 A5 F2 
    //1C 1E 00 00 80 3F 07 6F 00 9A 39 3A 01 E0 6B F2 1C 39 3A 24 01 16 07 4C 00 B3 01 78 A5 F2 1C 1E 
    //00 00 80 3F 16 76 21 50 01 00 00 16 0F 00 68 74 F2 1C AE 01 A0 8A F2 1C AB 01 78 A5 F2 1C AF 01 
    //C8 88 F2 1C 01 A0 8A F2 1C 16 16 16 06 E8 00 07 E8 00 9A 39 3A 01 E0 6B F2 1C 39 3A 24 00 16 0F 
    //00 68 74 F2 1C AE 01 A0 8A F2 1C AB 01 78 A5 F2 1C AF 01 C8 88 F2 1C 01 A0 8A F2 1C 16 16 16 0F 
    //00 D0 6D F2 1C AB 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 F8 83 ED 1C 16 0F 00 D0 6D F2 1C 
    //AF 00 D0 6D F2 1C 39 3F 39 44 00 D0 6D F2 1C 16 0F 00 68 74 F2 1C AB 1B CD 2B 00 00 00 D0 6D F2 
    //1C 16 00 68 74 F2 1C 16 0F 36 48 91 6A 0F 19 00 80 83 ED 1C 05 00 04 01 78 23 2C 11 39 43 00 68 
    //74 F2 1C 04 0B 47 
  }


  simulated function PostBeginPlay() {
    tickPtA = 255.00000000;                                                     //0000 : 0F 01 A0 8A F2 1C 1E 00 00 7F 43 
    tickPtB = 255.00000000;                                                     //000B : 0F 01 C8 88 F2 1C 1E 00 00 7F 43 
    //0F 01 A0 8A F2 1C 1E 00 00 7F 43 0F 01 C8 88 F2 1C 1E 00 00 7F 43 04 0B 47 
  }


  simulated function float Pulse(float X) {
    if (X < 0.50000000) {                                                       //0000 : 07 3B 00 B0 00 48 A8 F2 1C 1E 00 00 00 3F 16 
      return 2.00000000 * X * X * (3.00000000 - 2.00000000 * X);                //000F : 04 AB 1E 00 00 00 40 AB AB 00 48 A8 F2 1C 00 48 A8 F2 1C 16 AF 1E 00 00 40 40 AB 1E 00 00 00 40 00 48 A8 F2 1C 16 16 16 16 
    } else {                                                                    //0038 : 06 6B 00 
      return 2.00000000 * (1.00000000 - X * X * (3.00000000 - 2.00000000 * X)); //003B : 04 AB 1E 00 00 00 40 AF 1E 00 00 80 3F AB AB 00 48 A8 F2 1C 00 48 A8 F2 1C 16 AF 1E 00 00 40 40 AB 1E 00 00 00 40 00 48 A8 F2 1C 16 16 16 16 16 
    }
    //07 3B 00 B0 00 48 A8 F2 1C 1E 00 00 00 3F 16 04 AB 1E 00 00 00 40 AB AB 00 48 A8 F2 1C 00 48 A8 
    //F2 1C 16 AF 1E 00 00 40 40 AB 1E 00 00 00 40 00 48 A8 F2 1C 16 16 16 16 06 6B 00 04 AB 1E 00 00 
    //00 40 AF 1E 00 00 80 3F AB AB 00 48 A8 F2 1C 00 48 A8 F2 1C 16 AF 1E 00 00 40 40 AB 1E 00 00 00 
    //40 00 48 A8 F2 1C 16 16 16 16 16 04 0B 47 
  }



