//==============================================================================
//  GUI_RadialButton
//==============================================================================

class GUI_RadialButton extends GUI_Button
    native
    dependsOn(Texture)
    Transient
    Config(User)
  ;

  var private Material mCurrentMaterial;
  var private Texture mIconMaskTexture;
  var private Texture mShaderMaskTexture;
  var private Texture mNormalTexture;
  var private Texture mHilitedTexture;
  var private Texture mPressedTexture;


  event Initialize() {
    mTexWidth = mIconMaskTexture.MaterialUSize();                               //0000 : 0F 01 F0 8A 31 16 39 3F 19 01 18 18 B9 1C 06 00 04 1B D6 12 00 00 16 
    mTexHeight = mIconMaskTexture.MaterialVSize();                              //0017 : 0F 01 E0 8B 31 16 39 3F 19 01 18 18 B9 1C 06 00 04 1B D6 2C 00 00 16 
    Super.Initialize();                                                         //002E : 1C 28 EB A1 19 16 
    //0F 01 F0 8A 31 16 39 3F 19 01 18 18 B9 1C 06 00 04 1B D6 12 00 00 16 0F 01 E0 8B 31 16 39 3F 19 
    //01 18 18 B9 1C 06 00 04 1B D6 2C 00 00 16 1C 28 EB A1 19 16 04 0B 47 
  }



