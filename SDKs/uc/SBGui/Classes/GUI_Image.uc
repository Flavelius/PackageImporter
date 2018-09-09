//==============================================================================
//  GUI_Image
//==============================================================================

class GUI_Image extends Object
    native
    dependsOn(GUI_Component,TexRotator)
  ;

  var const float mTexWidth;
  var const float mTexHeight;
  var const bool mCustomClipping;
  var float mColor[4];
  var const GUI_Component mParent;
  var TexRotator mTextureRotator;
  var Rotator mRotation;
  var Rotator mRotationPerSecond;
  var bool mVisible;
  var int mImageID;
  var int mData;


  function SetVisible(bool B) {
    mVisible = B;                                                               //0000 : 14 2D 01 B0 62 A6 19 2D 00 38 62 A6 19 
    //14 2D 01 B0 62 A6 19 2D 00 38 62 A6 19 04 0B 47 
  }


  event SetImageRotation(Rotator aRotation) {
    if (mParent != None) {                                                      //0000 : 07 40 00 77 01 00 65 A6 19 2A 16 
      if (mTextureRotator == None) {                                            //000B : 07 2C 00 72 01 78 65 A6 19 2A 16 
        mTextureRotator = mParent.CreateRotator(self);                          //0016 : 0F 01 78 65 A6 19 19 01 00 65 A6 19 07 00 04 1B 12 99 00 00 17 16 
      }
      mTextureRotator.Rotation = aRotation;                                     //002C : 0F 19 01 78 65 A6 19 05 00 0C 01 88 1F 3A 11 00 00 64 A6 19 
    }
    //07 40 00 77 01 00 65 A6 19 2A 16 07 2C 00 72 01 78 65 A6 19 2A 16 0F 01 78 65 A6 19 19 01 00 65 
    //A6 19 07 00 04 1B 12 99 00 00 17 16 0F 19 01 78 65 A6 19 05 00 0C 01 88 1F 3A 11 00 00 64 A6 19 
    //04 0B 47 
  }


  native function string GetProperty(string aKey);


  native function SetProperty(string aKey,string aValue);


  native function int GetTexTop();


  native function int GetTexLeft();


  native function ResetClipping();


  native function SetClipping(float Left,float top,optional float width,optional float Height);


  native function SetMaterial(Material aMaterial);


  native function Material GetMaterial();



