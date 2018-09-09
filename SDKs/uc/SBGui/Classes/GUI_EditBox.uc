//==============================================================================
//  GUI_EditBox
//==============================================================================

class GUI_EditBox extends GUI_Component
    native
    dependsOn()
    Transient
    Config(User)
  ;

  var int mEditBoxStyle;
  var const Font mFont;
  var float mFontScaleX;
  var float mFontScaleY;
  var string mText;
  var string mPrefix;
  var private float mScrollX;
  var private int mCaretPos;
  var private int mCaretPosPrev;
  var private float mCaretX;
  var private int mSelStart;
  var private int mSelEnd;
  var private bool mAllSelected;
  var private Color mColor;
  var private Color mPrefixColor;
  var private float mBorderOffsets[4];
  var int mMaxLength;
  var bool mIsReadOnly;
  var string mAllowedCharSet;
  var bool mIntOnly;
  var bool mFloatOnly;
  var bool mSigned;
  var float mClipX0;
  var float mClipX1;
  var float mClipY0;
  var float mClipY1;
  var private GUI_Image mCursorImage;
  var float mScrollDistance;
  var (null);
  var (null);


  delegate bool OnEnter(GUI_EditBox editBox);


  delegate bool OnTextChanged(GUI_EditBox editBox);


  event bool OnFocus(bool State) {
    if (State) {                                                                //0000 : 07 15 00 2D 00 00 CC A4 19 
      UpdateCaretPosition();                                                    //0009 : 1B 6E 99 00 00 16 
      Invalidate();                                                             //000F : 1B 1D 98 00 00 16 
    }
    return True;                                                                //0015 : 04 27 
    //07 15 00 2D 00 00 CC A4 19 1B 6E 99 00 00 16 1B 1D 98 00 00 16 04 27 04 0B 47 
  }


  native function UpdateCaretPosition();


  event TextChanged() {
    OnTextChanged(self);                                                        //0000 : 43 10 CF A4 19 26 97 00 00 17 16 
    //43 10 CF A4 19 26 97 00 00 17 16 04 0B 47 
  }


  function Clear() {
    mScrollX = 0.00000000;                                                      //0000 : 0F 01 A0 D0 A4 19 1E 00 00 00 00 
    mCaretPos = 0;                                                              //000B : 0F 01 18 D1 A4 19 25 
    mCaretPosPrev = 0;                                                          //0012 : 0F 01 90 D1 A4 19 25 
    mCaretX = 0.00000000;                                                       //0019 : 0F 01 08 D2 A4 19 1E 00 00 00 00 
    mText = "";                                                                 //0024 : 0F 01 80 D2 A4 19 1F 00 
    //0F 01 A0 D0 A4 19 1E 00 00 00 00 0F 01 18 D1 A4 19 25 0F 01 90 D1 A4 19 25 0F 01 08 D2 A4 19 1E 
    //00 00 00 00 0F 01 80 D2 A4 19 1F 00 04 0B 47 
  }


  function string GetText() {
    return mText;                                                               //0000 : 04 01 80 D2 A4 19 
    //04 01 80 D2 A4 19 04 0B 47 
  }


  native function SetText(string Text);


  function SetColor(float R,float G,float B) {
    mColor.R = R;                                                               //0000 : 0F 36 D0 90 6A 0F 01 58 D7 A4 19 39 43 00 68 D6 A4 19 
    mColor.G = G;                                                               //0012 : 0F 36 58 90 6A 0F 01 58 D7 A4 19 39 43 00 D0 D7 A4 19 
    mColor.B = B;                                                               //0024 : 0F 36 E0 8F 6A 0F 01 58 D7 A4 19 39 43 00 48 D8 A4 19 
    //0F 36 D0 90 6A 0F 01 58 D7 A4 19 39 43 00 68 D6 A4 19 0F 36 58 90 6A 0F 01 58 D7 A4 19 39 43 00 
    //D0 D7 A4 19 0F 36 E0 8F 6A 0F 01 58 D7 A4 19 39 43 00 48 D8 A4 19 04 0B 47 
  }


  native function Font GetFont();


  native function SetFont(string FontName);


  protected function UpdateNumericalLimitation() {
    if (mIntOnly || mFloatOnly) {                                               //0000 : 07 54 00 84 2D 01 D8 DC A4 19 18 07 00 2D 01 50 DD A4 19 16 
      mAllowedCharSet = "0123456789";                                           //0014 : 0F 01 C8 DD A4 19 1F 30 31 32 33 34 35 36 37 38 39 00 
      if (mFloatOnly) {                                                         //0026 : 07 3B 00 2D 01 50 DD A4 19 
      }
      if (mSigned) {                                                            //003B : 07 51 00 2D 01 40 DE A4 19 
      }
    } else {                                                                    //0051 : 06 5C 00 
      mAllowedCharSet = "";                                                     //0054 : 0F 01 C8 DD A4 19 1F 00 
    }
    //07 54 00 84 2D 01 D8 DC A4 19 18 07 00 2D 01 50 DD A4 19 16 0F 01 C8 DD A4 19 1F 30 31 32 33 34 
    //35 36 37 38 39 00 07 3B 00 2D 01 50 DD A4 19 0E 61 42 01 C8 DD A4 19 1F 2E 00 16 07 51 00 2D 01 
    //40 DE A4 19 0E 61 42 01 C8 DD A4 19 1F 2B 2D 00 16 06 5C 00 0F 01 C8 DD A4 19 1F 00 04 0B 47 
  }


  function SetNumericalLimitation(bool aIntOnly,bool aFloatOnly,bool aSigned) {
    mIntOnly = aIntOnly;                                                        //0000 : 14 2D 01 D8 DC A4 19 2D 00 68 DF A4 19 
    mFloatOnly = mFloatOnly;                                                    //000D : 14 2D 01 50 DD A4 19 2D 01 50 DD A4 19 
    mSigned = aSigned;                                                          //001A : 14 2D 01 40 DE A4 19 2D 00 50 E0 A4 19 
    UpdateNumericalLimitation();                                                //0027 : 1B 09 9A 00 00 16 
    //14 2D 01 D8 DC A4 19 2D 00 68 DF A4 19 14 2D 01 50 DD A4 19 2D 01 50 DD A4 19 14 2D 01 40 DE A4 
    //19 2D 00 50 E0 A4 19 1B 09 9A 00 00 16 04 0B 47 
  }


  event Initialize() {
    SetFont("SBFontsTX.Verdana11");                                             //0000 : 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 
    mCursorImage = CreateImage("windowminimizebutton","SBGuiTX.GUI_Styles","GUI_Styles");//001B : 0F 01 B8 E1 A4 19 1B 26 98 00 00 1F 77 69 6E 64 6F 77 6D 69 6E 69 6D 69 7A 65 62 75 74 74 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    UpdateNumericalLimitation();                                                //005D : 1B 09 9A 00 00 16 
    mAllSelected = True;                                                        //0063 : 14 2D 01 30 E2 A4 19 27 
    mCaretPos = -1;                                                             //006B : 0F 01 18 D1 A4 19 1D FF FF FF FF 
    SetBorder(3,3,3,3);                                                         //0076 : 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 16 
    //1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 0F 01 B8 E1 A4 
    //19 1B 26 98 00 00 1F 77 69 6E 64 6F 77 6D 69 6E 69 6D 69 7A 65 62 75 74 74 6F 6E 00 1F 53 42 47 
    //75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 1B 09 9A 
    //00 00 16 14 2D 01 30 E2 A4 19 27 0F 01 18 D1 A4 19 1D FF FF FF FF 1B 2B 98 00 00 2C 03 2C 03 2C 
    //03 2C 03 16 04 0B 47 
  }



