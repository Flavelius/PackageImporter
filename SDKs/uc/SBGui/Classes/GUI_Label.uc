//==============================================================================
//  GUI_Label
//==============================================================================

class GUI_Label extends GUI_Component
    native
    dependsOn()
    Transient
    Config(User)
  ;

  var int mLabelStyle;
  var const Font mFont;
  var float mFontScaleX;
  var float mFontScaleY;
  var const string mText;
  var const string mDisplayedText;
  var Color mColor;
  var Color mShadowColor;
  var bool mSelected;
  var bool mHovered;
  var float mTextBorders[4];


  native function SetTextBorder(float Left,float top,optional float Right,optional float Bottom);


  native function SetFontScale(float scaleX,float scaleY);


  function Color GetColor() {
    return mColor;                                                              //0000 : 04 01 A0 D2 A1 19 
    //04 01 A0 D2 A1 19 04 0B 47 
  }


  native function SetColor(int R,int G,int B,optional int A);


  native function SetText(string Text);


  native function Font GetFont();


  native function SetFont(string FontName);


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 70 DD 9D 19 16 
    SetFont("SBFontsTX.Verdana11");                                             //0006 : 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 
    //1C 70 DD 9D 19 16 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 
    //16 04 0B 47 
  }



