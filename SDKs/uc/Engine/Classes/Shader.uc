//==============================================================================
//  Shader
//==============================================================================

class Shader extends RenderedMaterial
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  enum EOutputBlending {
    OB_Normal ,
    OB_Masked ,
    OB_Modulate ,
    OB_Translucent ,
    OB_Invisible ,
    OB_Brighten ,
    OB_Darken 
  };

  var (Shader) editinline Material Diffuse;
  var (Shader) editinline Material Opacity;
  var (Shader) editinline Material Specular;
  var (Shader) editinline Material SpecularityMask;
  var (Shader) editinline Material SelfIllumination;
  var (Shader) editinline Material SelfIlluminationMask;
  var (Shader) editinline Material Detail;
  var (Shader) float DetailScale;
  var (Shader) bool ModulateOpacityWithDiffuseAlpha;
  var (Shader) byte OutputBlending;
  var (Shader) bool TwoSided;
  var (Shader) bool Wireframe;
  var bool ModulateStaticLighting2X;
  var (Shader) bool PerformLightingOnSpecularPass;
  var (Shader) bool ModulateSpecular2X;


  function Trigger(Actor Other,Actor EventInstigator) {
    if (Diffuse != None) {                                                      //0000 : 07 24 00 77 01 D0 5B 37 0F 2A 16 
      Diffuse.Trigger(Other,EventInstigator);                                   //000B : 19 01 D0 5B 37 0F 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 
    }
    if (Opacity != None) {                                                      //0024 : 07 48 00 77 01 58 44 2C 11 2A 16 
      Opacity.Trigger(Other,EventInstigator);                                   //002F : 19 01 58 44 2C 11 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 
    }
    if (Specular != None) {                                                     //0048 : 07 6C 00 77 01 B8 10 3A 11 2A 16 
      Specular.Trigger(Other,EventInstigator);                                  //0053 : 19 01 B8 10 3A 11 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 
    }
    if (SpecularityMask != None) {                                              //006C : 07 90 00 77 01 30 11 3A 11 2A 16 
      SpecularityMask.Trigger(Other,EventInstigator);                           //0077 : 19 01 30 11 3A 11 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 
    }
    if (SelfIllumination != None) {                                             //0090 : 07 B4 00 77 01 A8 11 3A 11 2A 16 
      SelfIllumination.Trigger(Other,EventInstigator);                          //009B : 19 01 A8 11 3A 11 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 
    }
    if (SelfIlluminationMask != None) {                                         //00B4 : 07 D8 00 77 01 20 12 3A 11 2A 16 
      SelfIlluminationMask.Trigger(Other,EventInstigator);                      //00BF : 19 01 20 12 3A 11 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 
    }
    if (FallbackMaterial != None) {                                             //00D8 : 07 FC 00 77 01 30 41 70 0F 2A 16 
      FallbackMaterial.Trigger(Other,EventInstigator);                          //00E3 : 19 01 30 41 70 0F 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 
    }
    //07 24 00 77 01 D0 5B 37 0F 2A 16 19 01 D0 5B 37 0F 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 
    //10 3A 11 16 07 48 00 77 01 58 44 2C 11 2A 16 19 01 58 44 2C 11 10 00 00 1B 32 01 00 00 00 40 0E 
    //3A 11 00 40 10 3A 11 16 07 6C 00 77 01 B8 10 3A 11 2A 16 19 01 B8 10 3A 11 10 00 00 1B 32 01 00 
    //00 00 40 0E 3A 11 00 40 10 3A 11 16 07 90 00 77 01 30 11 3A 11 2A 16 19 01 30 11 3A 11 10 00 00 
    //1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 07 B4 00 77 01 A8 11 3A 11 2A 16 19 01 A8 11 3A 
    //11 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 07 D8 00 77 01 20 12 3A 11 2A 16 19 
    //01 20 12 3A 11 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 07 FC 00 77 01 30 41 70 
    //0F 2A 16 19 01 30 41 70 0F 10 00 00 1B 32 01 00 00 00 40 0E 3A 11 00 40 10 3A 11 16 04 0B 47 
  }


  function Reset() {
    if (Diffuse != None) {                                                      //0000 : 07 1A 00 77 01 D0 5B 37 0F 2A 16 
      Diffuse.Reset();                                                          //000B : 19 01 D0 5B 37 0F 06 00 00 1B 53 12 00 00 16 
    }
    if (Opacity != None) {                                                      //001A : 07 34 00 77 01 58 44 2C 11 2A 16 
      Opacity.Reset();                                                          //0025 : 19 01 58 44 2C 11 06 00 00 1B 53 12 00 00 16 
    }
    if (Specular != None) {                                                     //0034 : 07 4E 00 77 01 B8 10 3A 11 2A 16 
      Specular.Reset();                                                         //003F : 19 01 B8 10 3A 11 06 00 00 1B 53 12 00 00 16 
    }
    if (SpecularityMask != None) {                                              //004E : 07 68 00 77 01 30 11 3A 11 2A 16 
      SpecularityMask.Reset();                                                  //0059 : 19 01 30 11 3A 11 06 00 00 1B 53 12 00 00 16 
    }
    if (SelfIllumination != None) {                                             //0068 : 07 82 00 77 01 A8 11 3A 11 2A 16 
      SelfIllumination.Reset();                                                 //0073 : 19 01 A8 11 3A 11 06 00 00 1B 53 12 00 00 16 
    }
    if (SelfIlluminationMask != None) {                                         //0082 : 07 9C 00 77 01 20 12 3A 11 2A 16 
      SelfIlluminationMask.Reset();                                             //008D : 19 01 20 12 3A 11 06 00 00 1B 53 12 00 00 16 
    }
    if (FallbackMaterial != None) {                                             //009C : 07 B6 00 77 01 30 41 70 0F 2A 16 
      FallbackMaterial.Reset();                                                 //00A7 : 19 01 30 41 70 0F 06 00 00 1B 53 12 00 00 16 
    }
    //07 1A 00 77 01 D0 5B 37 0F 2A 16 19 01 D0 5B 37 0F 06 00 00 1B 53 12 00 00 16 07 34 00 77 01 58 
    //44 2C 11 2A 16 19 01 58 44 2C 11 06 00 00 1B 53 12 00 00 16 07 4E 00 77 01 B8 10 3A 11 2A 16 19 
    //01 B8 10 3A 11 06 00 00 1B 53 12 00 00 16 07 68 00 77 01 30 11 3A 11 2A 16 19 01 30 11 3A 11 06 
    //00 00 1B 53 12 00 00 16 07 82 00 77 01 A8 11 3A 11 2A 16 19 01 A8 11 3A 11 06 00 00 1B 53 12 00 
    //00 16 07 9C 00 77 01 20 12 3A 11 2A 16 19 01 20 12 3A 11 06 00 00 1B 53 12 00 00 16 07 B6 00 77 
    //01 30 41 70 0F 2A 16 19 01 30 41 70 0F 06 00 00 1B 53 12 00 00 16 04 0B 47 
  }



