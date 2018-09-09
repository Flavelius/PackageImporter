//==============================================================================
//  GUI_TextCtrl
//==============================================================================

class GUI_TextCtrl extends GUI_Page
    native
    dependsOn()
    Transient
    Config(User)
  ;

  enum EAlphaDeltaMode {
    ADM_None ,
    ADM_FrontToBack ,
    ADM_BackToFront 
  };

  var int mLabelStyle;
  var const Font mFont;
  var float mFontScaleX;
  var float mFontScaleY;
  var int mBufferSize;
  var bool mBufferSizeBlock;
  var int mScrollbackSize;
  var float mPreviousWidth;
  var float mPreviousHeight;
  var Color mColor;
  var Color mShadowColor;
  var bool mUseColorCodes;
  var bool mTextChanged;
  var byte mAlphaDeltaMode;
  var float mAlphaDeltaStart;
  var float mAlphaDelta;
  var int mTextCtrlData;


  native function int GetLineHeight();


  function bool GetUseColorCodes(bool aUseColorCodes) {
    return mUseColorCodes;                                                      //0000 : 04 2D 01 C8 F4 A4 19 
    //04 2D 01 C8 F4 A4 19 04 0B 47 
  }


  function SetUseColorCodes(bool aUseColorCodes) {
    mUseColorCodes = aUseColorCodes;                                            //0000 : 14 2D 01 C8 F4 A4 19 2D 00 68 F6 A4 19 
    //14 2D 01 C8 F4 A4 19 2D 00 68 F6 A4 19 04 0B 47 
  }


  native function ExportToFile(optional string fileName);


  native function Empty();


  native function bool IsEmpty();


  function Color GetShadowColor() {
    return mShadowColor;                                                        //0000 : 04 01 18 FC A4 19 
    //04 01 18 FC A4 19 04 0B 47 
  }


  native function SetShadowColor(int R,int G,int B,optional int A);


  function Color GetColor() {
    return mColor;                                                              //0000 : 04 01 C8 00 A5 19 
    //04 01 C8 00 A5 19 04 0B 47 
  }


  native function SetColor(int R,int G,int B,optional int A);


  native function AddText(string Text,optional bool newline);


  native function SetText(string Text);


  native function Font GetFont();


  native function SetFont(string FontName);


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    SetFont("SBFontsTX.Verdana11");                                             //0006 : 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 
    //1C 40 5B 9E 19 16 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 
    //16 04 0B 47 
  }



