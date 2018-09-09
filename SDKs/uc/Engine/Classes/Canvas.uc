//==============================================================================
//  Canvas
//==============================================================================

class Canvas extends Object
    native
    noexport
    dependsOn(Texture)
  ;

  enum EFillStyle {
    FSTY_Normal ,
    FSTY_Stretched ,
    FSTY_Scaled ,
    FSTY_Bound ,
    FSTY_Justified ,
    FSTY_PartialScaled ,
    FSTY_Tiled 
  };

  var Font Font;
  var float FontScaleX;
  var float FontScaleY;
  var float SpaceX;
  var float SpaceY;
  var float OrgX;
  var float OrgY;
  var float ClipX;
  var float ClipY;
  var float CurX;
  var float CurY;
  var float Z;
  var byte Style;
  var float CurYL;
  var Color DrawColor;
  var bool bCenter;
  var bool bNoSmooth;
  var bool bIgnoreTextColorCodes;
  var const int SizeX;
  var const int SizeY;
  var Plane ColorModulate;
  var bool bForceAlpha;
  var float ForcedAlpha;
  var bool bRenderLevel;
  var Font TinyFont;
  var Font SmallFont;
  var Font MedFont;
  var localized string TinyFontName;
  var localized string SmallFontName;
  var localized string MedFontName;
  var const Viewport Viewport;
  var const transient int pCanvasUtil;
  var byte LastStyle;
  var Material LastMaterial;


  simulated function DrawScreenText(string Text,float X,float Y,byte Pivot) {
    local int TextScreenWidth;
    local int TextScreenHeight;
    local float UL;
    local float VL;
    X *= SizeX;                                                                 //0000 : B6 00 00 12 77 0F 39 3F 01 78 12 77 0F 16 
    Y *= SizeY;                                                                 //000E : B6 00 F0 12 77 0F 39 3F 01 68 13 77 0F 16 
    TextSize(Text,UL,VL);                                                       //001C : 61 D6 00 88 11 77 0F 00 E0 13 77 0F 00 58 14 77 0F 16 
    TextScreenWidth = UL;                                                       //002E : 0F 00 D0 14 77 0F 39 44 00 E0 13 77 0F 
    TextScreenHeight = VL;                                                      //003B : 0F 00 48 15 77 0F 39 44 00 58 14 77 0F 
    switch (Pivot) {                                                            //0048 : 05 01 00 C0 15 77 0F 
      case 0 :                                                                  //004F : 0A 57 00 24 00 
        break;                                                                  //0054 : 06 5A 01 
      case 1 :                                                                  //0057 : 0A 71 00 24 01 
        X -= TextScreenWidth / 2;                                               //005C : B9 00 00 12 77 0F 39 3F 91 00 D0 14 77 0F 2C 02 16 16 
        break;                                                                  //006E : 06 5A 01 
      case 2 :                                                                  //0071 : 0A 87 00 24 02 
        X -= TextScreenWidth;                                                   //0076 : B9 00 00 12 77 0F 39 3F 00 D0 14 77 0F 16 
        break;                                                                  //0084 : 06 5A 01 
      case 3 :                                                                  //0087 : 0A AF 00 24 03 
        X -= TextScreenWidth;                                                   //008C : B9 00 00 12 77 0F 39 3F 00 D0 14 77 0F 16 
        Y -= TextScreenHeight / 2;                                              //009A : B9 00 F0 12 77 0F 39 3F 91 00 48 15 77 0F 2C 02 16 16 
        break;                                                                  //00AC : 06 5A 01 
      case 4 :                                                                  //00AF : 0A D3 00 24 04 
        X -= TextScreenWidth;                                                   //00B4 : B9 00 00 12 77 0F 39 3F 00 D0 14 77 0F 16 
        Y -= TextScreenHeight;                                                  //00C2 : B9 00 F0 12 77 0F 39 3F 00 48 15 77 0F 16 
        break;                                                                  //00D0 : 06 5A 01 
      case 5 :                                                                  //00D3 : 0A FB 00 24 05 
        X -= TextScreenWidth / 2;                                               //00D8 : B9 00 00 12 77 0F 39 3F 91 00 D0 14 77 0F 2C 02 16 16 
        Y -= TextScreenHeight;                                                  //00EA : B9 00 F0 12 77 0F 39 3F 00 48 15 77 0F 16 
        break;                                                                  //00F8 : 06 5A 01 
      case 6 :                                                                  //00FB : 0A 11 01 24 06 
        Y -= TextScreenHeight;                                                  //0100 : B9 00 F0 12 77 0F 39 3F 00 48 15 77 0F 16 
        break;                                                                  //010E : 06 5A 01 
      case 7 :                                                                  //0111 : 0A 2B 01 24 07 
        Y -= TextScreenHeight / 2;                                              //0116 : B9 00 F0 12 77 0F 39 3F 91 00 48 15 77 0F 2C 02 16 16 
        break;                                                                  //0128 : 06 5A 01 
      case 8 :                                                                  //012B : 0A 57 01 24 08 
        X -= TextScreenWidth / 2;                                               //0130 : B9 00 00 12 77 0F 39 3F 91 00 D0 14 77 0F 2C 02 16 16 
        Y -= TextScreenHeight / 2;                                              //0142 : B9 00 F0 12 77 0F 39 3F 91 00 48 15 77 0F 2C 02 16 16 
        break;                                                                  //0154 : 06 5A 01 
      default:                                                                  //0157 : 0A FF FF 
    }
    SetPos(X,Y);                                                                //015A : 1C 80 90 6C 0F 00 00 12 77 0F 00 F0 12 77 0F 16 
    DrawTextClipped(Text);                                                      //016A : 61 D5 00 88 11 77 0F 16 
    //B6 00 00 12 77 0F 39 3F 01 78 12 77 0F 16 B6 00 F0 12 77 0F 39 3F 01 68 13 77 0F 16 61 D6 00 88 
    //11 77 0F 00 E0 13 77 0F 00 58 14 77 0F 16 0F 00 D0 14 77 0F 39 44 00 E0 13 77 0F 0F 00 48 15 77 
    //0F 39 44 00 58 14 77 0F 05 01 00 C0 15 77 0F 0A 57 00 24 00 06 5A 01 0A 71 00 24 01 B9 00 00 12 
    //77 0F 39 3F 91 00 D0 14 77 0F 2C 02 16 16 06 5A 01 0A 87 00 24 02 B9 00 00 12 77 0F 39 3F 00 D0 
    //14 77 0F 16 06 5A 01 0A AF 00 24 03 B9 00 00 12 77 0F 39 3F 00 D0 14 77 0F 16 B9 00 F0 12 77 0F 
    //39 3F 91 00 48 15 77 0F 2C 02 16 16 06 5A 01 0A D3 00 24 04 B9 00 00 12 77 0F 39 3F 00 D0 14 77 
    //0F 16 B9 00 F0 12 77 0F 39 3F 00 48 15 77 0F 16 06 5A 01 0A FB 00 24 05 B9 00 00 12 77 0F 39 3F 
    //91 00 D0 14 77 0F 2C 02 16 16 B9 00 F0 12 77 0F 39 3F 00 48 15 77 0F 16 06 5A 01 0A 11 01 24 06 
    //B9 00 F0 12 77 0F 39 3F 00 48 15 77 0F 16 06 5A 01 0A 2B 01 24 07 B9 00 F0 12 77 0F 39 3F 91 00 
    //48 15 77 0F 2C 02 16 16 06 5A 01 0A 57 01 24 08 B9 00 00 12 77 0F 39 3F 91 00 D0 14 77 0F 2C 02 
    //16 16 B9 00 F0 12 77 0F 39 3F 91 00 48 15 77 0F 2C 02 16 16 06 5A 01 0A FF FF 1C 80 90 6C 0F 00 
    //00 12 77 0F 00 F0 12 77 0F 16 61 D5 00 88 11 77 0F 16 04 0B 47 
  }


  final simulated function DrawBox(Canvas Canvas,float width,float Height) {
    DrawHorizontal(CurY,width);                                                 //0000 : 1C F8 17 77 0F 01 A8 18 77 0F 00 20 19 77 0F 16 
    DrawHorizontal(CurY + Height,width);                                        //0010 : 1C F8 17 77 0F AE 01 A8 18 77 0F 00 98 19 77 0F 16 00 20 19 77 0F 16 
    DrawVertical(CurX,Height);                                                  //0027 : 1C 10 1A 77 0F 01 C0 1A 77 0F 00 98 19 77 0F 16 
    DrawVertical(CurX + width,Height);                                          //0037 : 1C 10 1A 77 0F AE 01 C0 1A 77 0F 00 20 19 77 0F 16 00 98 19 77 0F 16 
    //1C F8 17 77 0F 01 A8 18 77 0F 00 20 19 77 0F 16 1C F8 17 77 0F AE 01 A8 18 77 0F 00 98 19 77 0F 
    //16 00 20 19 77 0F 16 1C 10 1A 77 0F 01 C0 1A 77 0F 00 98 19 77 0F 16 1C 10 1A 77 0F AE 01 C0 1A 
    //77 0F 00 20 19 77 0F 16 00 98 19 77 0F 16 04 0B 47 
  }


  final simulated function DrawBracket(float width,float Height,float bracket_size) {
    local float X;
    local float Y;
    width = Max(width,5);                                                       //0000 : 0F 00 E8 1B 77 0F 39 3F FA 39 44 00 E8 1B 77 0F 2C 05 16 
    Height = Max(Height,5);                                                     //0013 : 0F 00 00 1E 77 0F 39 3F FA 39 44 00 00 1E 77 0F 2C 05 16 
    X = CurX;                                                                   //0026 : 0F 00 78 1E 77 0F 01 C0 1A 77 0F 
    Y = CurY;                                                                   //0031 : 0F 00 F0 1E 77 0F 01 A8 18 77 0F 
    DrawHorizontal(CurY,bracket_size);                                          //003C : 1C F8 17 77 0F 01 A8 18 77 0F 00 68 1F 77 0F 16 
    DrawHorizontal(CurY + Height,bracket_size);                                 //004C : 1C F8 17 77 0F AE 01 A8 18 77 0F 00 00 1E 77 0F 16 00 68 1F 77 0F 16 
    DrawVertical(CurX,bracket_size);                                            //0063 : 1C 10 1A 77 0F 01 C0 1A 77 0F 00 68 1F 77 0F 16 
    DrawVertical(CurX + width,bracket_size);                                    //0073 : 1C 10 1A 77 0F AE 01 C0 1A 77 0F 00 E8 1B 77 0F 16 00 68 1F 77 0F 16 
    CurY = Y + Height - bracket_size;                                           //008A : 0F 01 A8 18 77 0F AF AE 00 F0 1E 77 0F 00 00 1E 77 0F 16 00 68 1F 77 0F 16 
    DrawVertical(CurX,bracket_size);                                            //00A3 : 1C 10 1A 77 0F 01 C0 1A 77 0F 00 68 1F 77 0F 16 
    DrawVertical(CurX + width,bracket_size);                                    //00B3 : 1C 10 1A 77 0F AE 01 C0 1A 77 0F 00 E8 1B 77 0F 16 00 68 1F 77 0F 16 
    CurX = X + width - bracket_size;                                            //00CA : 0F 01 C0 1A 77 0F AF AE 00 78 1E 77 0F 00 E8 1B 77 0F 16 00 68 1F 77 0F 16 
    DrawHorizontal(Y,bracket_size);                                             //00E3 : 1C F8 17 77 0F 00 F0 1E 77 0F 00 68 1F 77 0F 16 
    DrawHorizontal(Y + Height,bracket_size);                                    //00F3 : 1C F8 17 77 0F AE 00 F0 1E 77 0F 00 00 1E 77 0F 16 00 68 1F 77 0F 16 
    //0F 00 E8 1B 77 0F 39 3F FA 39 44 00 E8 1B 77 0F 2C 05 16 0F 00 00 1E 77 0F 39 3F FA 39 44 00 00 
    //1E 77 0F 2C 05 16 0F 00 78 1E 77 0F 01 C0 1A 77 0F 0F 00 F0 1E 77 0F 01 A8 18 77 0F 1C F8 17 77 
    //0F 01 A8 18 77 0F 00 68 1F 77 0F 16 1C F8 17 77 0F AE 01 A8 18 77 0F 00 00 1E 77 0F 16 00 68 1F 
    //77 0F 16 1C 10 1A 77 0F 01 C0 1A 77 0F 00 68 1F 77 0F 16 1C 10 1A 77 0F AE 01 C0 1A 77 0F 00 E8 
    //1B 77 0F 16 00 68 1F 77 0F 16 0F 01 A8 18 77 0F AF AE 00 F0 1E 77 0F 00 00 1E 77 0F 16 00 68 1F 
    //77 0F 16 1C 10 1A 77 0F 01 C0 1A 77 0F 00 68 1F 77 0F 16 1C 10 1A 77 0F AE 01 C0 1A 77 0F 00 E8 
    //1B 77 0F 16 00 68 1F 77 0F 16 0F 01 C0 1A 77 0F AF AE 00 78 1E 77 0F 00 E8 1B 77 0F 16 00 68 1F 
    //77 0F 16 1C F8 17 77 0F 00 F0 1E 77 0F 00 68 1F 77 0F 16 1C F8 17 77 0F AE 00 F0 1E 77 0F 00 00 
    //1E 77 0F 16 00 68 1F 77 0F 16 04 0B 47 
  }


  final function DrawLine(int direction,float Size) {
    local float cX;
    local float cY;
    cX = CurX;                                                                  //0000 : 0F 00 90 E7 76 0F 01 C0 1A 77 0F 
    cY = CurY;                                                                  //000B : 0F 00 08 E8 76 0F 01 A8 18 77 0F 
    switch (direction) {                                                        //0016 : 05 04 00 00 E6 76 0F 
      case 0 :                                                                  //001D : 0A 40 00 25 
        CurY -= Size;                                                           //0021 : B9 01 A8 18 77 0F 00 80 E8 76 0F 16 
        DrawVertical(CurX,Size);                                                //002D : 1C 10 1A 77 0F 01 C0 1A 77 0F 00 80 E8 76 0F 16 
        break;                                                                  //003D : 06 96 00 
      case 1 :                                                                  //0040 : 0A 57 00 26 
        DrawVertical(CurX,Size);                                                //0044 : 1C 10 1A 77 0F 01 C0 1A 77 0F 00 80 E8 76 0F 16 
        break;                                                                  //0054 : 06 96 00 
      case 2 :                                                                  //0057 : 0A 7B 00 2C 02 
        CurX -= Size;                                                           //005C : B9 01 C0 1A 77 0F 00 80 E8 76 0F 16 
        DrawHorizontal(CurY,Size);                                              //0068 : 1C F8 17 77 0F 01 A8 18 77 0F 00 80 E8 76 0F 16 
        break;                                                                  //0078 : 06 96 00 
      case 3 :                                                                  //007B : 0A 93 00 2C 03 
        DrawHorizontal(CurY,Size);                                              //0080 : 1C F8 17 77 0F 01 A8 18 77 0F 00 80 E8 76 0F 16 
        break;                                                                  //0090 : 06 96 00 
      default:                                                                  //0093 : 0A FF FF 
    }
    CurX = cX;                                                                  //0096 : 0F 01 C0 1A 77 0F 00 90 E7 76 0F 
    CurY = cY;                                                                  //00A1 : 0F 01 A8 18 77 0F 00 08 E8 76 0F 
    //0F 00 90 E7 76 0F 01 C0 1A 77 0F 0F 00 08 E8 76 0F 01 A8 18 77 0F 05 04 00 00 E6 76 0F 0A 40 00 
    //25 B9 01 A8 18 77 0F 00 80 E8 76 0F 16 1C 10 1A 77 0F 01 C0 1A 77 0F 00 80 E8 76 0F 16 06 96 00 
    //0A 57 00 26 1C 10 1A 77 0F 01 C0 1A 77 0F 00 80 E8 76 0F 16 06 96 00 0A 7B 00 2C 02 B9 01 C0 1A 
    //77 0F 00 80 E8 76 0F 16 1C F8 17 77 0F 01 A8 18 77 0F 00 80 E8 76 0F 16 06 96 00 0A 93 00 2C 03 
    //1C F8 17 77 0F 01 A8 18 77 0F 00 80 E8 76 0F 16 06 96 00 0A FF FF 0F 01 C0 1A 77 0F 00 90 E7 76 
    //0F 0F 01 A8 18 77 0F 00 08 E8 76 0F 04 0B 47 
  }


  final function DrawHorizontal(float Y,float width) {
    local float cX;
    local float cY;
    cX = CurX;                                                                  //0000 : 0F 00 20 EA 76 0F 01 C0 1A 77 0F 
    cY = CurY;                                                                  //000B : 0F 00 98 EA 76 0F 01 A8 18 77 0F 
    CurY = Y;                                                                   //0016 : 0F 01 A8 18 77 0F 00 F8 E8 76 0F 
    DrawTile(Texture'WhiteSquareTexture',width,2.00000000,0.00000000,0.00000000,2.00000000,2.00000000);//0021 : 61 D2 20 08 F5 74 0F 00 10 EB 76 0F 1E 00 00 00 40 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 40 1E 00 00 00 40 16 
    CurX = cX;                                                                  //0047 : 0F 01 C0 1A 77 0F 00 20 EA 76 0F 
    CurY = cY;                                                                  //0052 : 0F 01 A8 18 77 0F 00 98 EA 76 0F 
    //0F 00 20 EA 76 0F 01 C0 1A 77 0F 0F 00 98 EA 76 0F 01 A8 18 77 0F 0F 01 A8 18 77 0F 00 F8 E8 76 
    //0F 61 D2 20 08 F5 74 0F 00 10 EB 76 0F 1E 00 00 00 40 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 
    //40 1E 00 00 00 40 16 0F 01 C0 1A 77 0F 00 20 EA 76 0F 0F 01 A8 18 77 0F 00 98 EA 76 0F 04 0B 47 
    //
  }


  final function DrawVertical(float X,float Height) {
    local float cX;
    local float cY;
    cX = CurX;                                                                  //0000 : 0F 00 60 ED 76 0F 01 C0 1A 77 0F 
    cY = CurY;                                                                  //000B : 0F 00 D8 ED 76 0F 01 A8 18 77 0F 
    CurX = X;                                                                   //0016 : 0F 01 C0 1A 77 0F 00 38 EC 76 0F 
    DrawTile(Texture'WhiteSquareTexture',2.00000000,Height,0.00000000,0.00000000,2.00000000,2.00000000);//0021 : 61 D2 20 08 F5 74 0F 1E 00 00 00 40 00 50 EE 76 0F 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 40 1E 00 00 00 40 16 
    CurX = cX;                                                                  //0047 : 0F 01 C0 1A 77 0F 00 60 ED 76 0F 
    CurY = cY;                                                                  //0052 : 0F 01 A8 18 77 0F 00 D8 ED 76 0F 
    //0F 00 60 ED 76 0F 01 C0 1A 77 0F 0F 00 D8 ED 76 0F 01 A8 18 77 0F 0F 01 C0 1A 77 0F 00 38 EC 76 
    //0F 61 D2 20 08 F5 74 0F 1E 00 00 00 40 00 50 EE 76 0F 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 
    //40 1E 00 00 00 40 16 0F 01 C0 1A 77 0F 00 60 ED 76 0F 0F 01 A8 18 77 0F 00 D8 ED 76 0F 04 0B 47 
    //
  }


  final static function Color MakeColor(byte R,byte G,byte B,optional byte A) {
    local Color C;
    C.R = R;                                                                    //0000 : 0F 36 D0 90 6A 0F 00 F0 EF 76 0F 00 C8 EE 76 0F 
    C.G = G;                                                                    //0010 : 0F 36 58 90 6A 0F 00 F0 EF 76 0F 00 68 F0 76 0F 
    C.B = B;                                                                    //0020 : 0F 36 E0 8F 6A 0F 00 F0 EF 76 0F 00 E0 F0 76 0F 
    if (A == 0) {                                                               //0030 : 07 47 00 9A 39 3A 00 58 F1 76 0F 25 16 
      A = 255;                                                                  //003D : 0F 00 58 F1 76 0F 39 3D 2C FF 
    }
    C.A = A;                                                                    //0047 : 0F 36 48 91 6A 0F 00 F0 EF 76 0F 00 58 F1 76 0F 
    return C;                                                                   //0057 : 04 00 F0 EF 76 0F 
    //0F 36 D0 90 6A 0F 00 F0 EF 76 0F 00 C8 EE 76 0F 0F 36 58 90 6A 0F 00 F0 EF 76 0F 00 68 F0 76 0F 
    //0F 36 E0 8F 6A 0F 00 F0 EF 76 0F 00 E0 F0 76 0F 07 47 00 9A 39 3A 00 58 F1 76 0F 25 16 0F 00 58 
    //F1 76 0F 39 3D 2C FF 0F 36 48 91 6A 0F 00 F0 EF 76 0F 00 58 F1 76 0F 04 00 F0 EF 76 0F 04 0B 47 
    //
  }


  final function SetDrawColor(byte R,byte G,byte B,optional byte A) {
    local Color C;
    C.R = R;                                                                    //0000 : 0F 36 D0 90 6A 0F 00 70 F3 76 0F 00 F8 F2 76 0F 
    C.G = G;                                                                    //0010 : 0F 36 58 90 6A 0F 00 70 F3 76 0F 00 E8 F3 76 0F 
    C.B = B;                                                                    //0020 : 0F 36 E0 8F 6A 0F 00 70 F3 76 0F 00 60 F4 76 0F 
    if (A == 0) {                                                               //0030 : 07 47 00 9A 39 3A 00 D8 F4 76 0F 25 16 
      A = 255;                                                                  //003D : 0F 00 D8 F4 76 0F 39 3D 2C FF 
    }
    C.A = A;                                                                    //0047 : 0F 36 48 91 6A 0F 00 70 F3 76 0F 00 D8 F4 76 0F 
    DrawColor = C;                                                              //0057 : 0F 01 90 96 6C 0F 00 70 F3 76 0F 
    //0F 36 D0 90 6A 0F 00 70 F3 76 0F 00 F8 F2 76 0F 0F 36 58 90 6A 0F 00 70 F3 76 0F 00 E8 F3 76 0F 
    //0F 36 E0 8F 6A 0F 00 70 F3 76 0F 00 60 F4 76 0F 07 47 00 9A 39 3A 00 D8 F4 76 0F 25 16 0F 00 D8 
    //F4 76 0F 39 3D 2C FF 0F 36 48 91 6A 0F 00 70 F3 76 0F 00 D8 F4 76 0F 0F 01 90 96 6C 0F 00 70 F3 
    //76 0F 04 0B 47 
  }


  final function DrawRect(Texture Tex,float RectX,float RectY) {
    DrawTile(Tex,RectX,RectY,0.00000000,0.00000000,Tex.USize,Tex.VSize);        //0000 : 61 D2 00 00 F6 76 0F 00 78 F6 76 0F 00 F0 F6 76 0F 1E 00 00 00 00 1E 00 00 00 00 39 3F 19 00 00 F6 76 0F 05 00 04 01 08 4B 70 0F 39 3F 19 00 00 F6 76 0F 05 00 04 01 80 4B 70 0F 16 
    //61 D2 00 00 F6 76 0F 00 78 F6 76 0F 00 F0 F6 76 0F 1E 00 00 00 00 1E 00 00 00 00 39 3F 19 00 00 
    //F6 76 0F 05 00 04 01 08 4B 70 0F 39 3F 19 00 00 F6 76 0F 05 00 04 01 80 4B 70 0F 16 04 0B 47 
  }


  final function DrawIcon(Texture Tex,float Scale) {
    if (Tex != None) {                                                          //0000 : 07 6B 00 77 00 18 F8 76 0F 2A 16 
      DrawTile(Tex,Tex.USize * Scale,Tex.VSize * Scale,0.00000000,0.00000000,Tex.USize,Tex.VSize);//000B : 61 D2 00 18 F8 76 0F AB 39 3F 19 00 18 F8 76 0F 05 00 04 01 08 4B 70 0F 00 50 F9 76 0F 16 AB 39 3F 19 00 18 F8 76 0F 05 00 04 01 80 4B 70 0F 00 50 F9 76 0F 16 1E 00 00 00 00 1E 00 00 00 00 39 3F 19 00 18 F8 76 0F 05 00 04 01 08 4B 70 0F 39 3F 19 00 18 F8 76 0F 05 00 04 01 80 4B 70 0F 16 
    }
    //07 6B 00 77 00 18 F8 76 0F 2A 16 61 D2 00 18 F8 76 0F AB 39 3F 19 00 18 F8 76 0F 05 00 04 01 08 
    //4B 70 0F 00 50 F9 76 0F 16 AB 39 3F 19 00 18 F8 76 0F 05 00 04 01 80 4B 70 0F 00 50 F9 76 0F 16 
    //1E 00 00 00 00 1E 00 00 00 00 39 3F 19 00 18 F8 76 0F 05 00 04 01 08 4B 70 0F 39 3F 19 00 18 F8 
    //76 0F 05 00 04 01 80 4B 70 0F 16 04 0B 47 
  }


  final function DrawPattern(Material Tex,float XL,float YL,float Scale) {
    DrawTile(Tex,XL,YL,(CurX - OrgX) * Scale,(CurY - OrgY) * Scale,XL * Scale,YL * Scale);//0000 : 61 D2 00 78 FA 76 0F 00 90 FB 76 0F 00 08 FC 76 0F AB AF 01 C0 1A 77 0F 01 80 FC 76 0F 16 00 F8 FC 76 0F 16 AB AF 01 A8 18 77 0F 01 70 FD 76 0F 16 00 F8 FC 76 0F 16 AB 00 90 FB 76 0F 00 F8 FC 76 0F 16 AB 00 08 FC 76 0F 00 F8 FC 76 0F 16 16 
    //61 D2 00 78 FA 76 0F 00 90 FB 76 0F 00 08 FC 76 0F AB AF 01 C0 1A 77 0F 01 80 FC 76 0F 16 00 F8 
    //FC 76 0F 16 AB AF 01 A8 18 77 0F 01 70 FD 76 0F 16 00 F8 FC 76 0F 16 AB 00 90 FB 76 0F 00 F8 FC 
    //76 0F 16 AB 00 08 FC 76 0F 00 F8 FC 76 0F 16 16 04 0B 47 
  }


  final function SetClip(float X,float Y) {
    ClipX = X;                                                                  //0000 : 0F 01 90 20 77 0F 00 E8 FD 76 0F 
    ClipY = Y;                                                                  //000B : 0F 01 08 21 77 0F 00 80 21 77 0F 
    //0F 01 90 20 77 0F 00 E8 FD 76 0F 0F 01 08 21 77 0F 00 80 21 77 0F 04 0B 47 
  }


  final function SetOrigin(float X,float Y) {
    OrgX = X;                                                                   //0000 : 0F 01 80 FC 76 0F 00 F8 21 77 0F 
    OrgY = Y;                                                                   //000B : 0F 01 70 FD 76 0F 00 C0 22 77 0F 
    //0F 01 80 FC 76 0F 00 F8 21 77 0F 0F 01 70 FD 76 0F 00 C0 22 77 0F 04 0B 47 
  }


  final function SetPos(float X,float Y) {
    CurX = X;                                                                   //0000 : 0F 01 C0 1A 77 0F 00 E8 23 77 0F 
    CurY = Y;                                                                   //000B : 0F 01 A8 18 77 0F 00 B0 24 77 0F 
    //0F 01 C0 1A 77 0F 00 E8 23 77 0F 0F 01 A8 18 77 0F 00 B0 24 77 0F 04 0B 47 
  }


  event Reset() {
    Font = default.Font;                                                        //0000 : 0F 01 F0 26 77 0F 02 F0 26 77 0F 
    FontScaleX = default.FontScaleX;                                            //000B : 0F 01 68 27 77 0F 02 68 27 77 0F 
    FontScaleY = default.FontScaleY;                                            //0016 : 0F 01 E0 27 77 0F 02 E0 27 77 0F 
    SpaceX = default.SpaceX;                                                    //0021 : 0F 01 58 28 77 0F 02 58 28 77 0F 
    SpaceY = default.SpaceY;                                                    //002C : 0F 01 D0 28 77 0F 02 D0 28 77 0F 
    OrgX = default.OrgX;                                                        //0037 : 0F 01 80 FC 76 0F 02 80 FC 76 0F 
    OrgY = default.OrgY;                                                        //0042 : 0F 01 70 FD 76 0F 02 70 FD 76 0F 
    CurX = default.CurX;                                                        //004D : 0F 01 C0 1A 77 0F 02 C0 1A 77 0F 
    CurY = default.CurY;                                                        //0058 : 0F 01 A8 18 77 0F 02 A8 18 77 0F 
    Style = default.Style;                                                      //0063 : 0F 01 60 04 6C 0F 02 60 04 6C 0F 
    DrawColor = default.DrawColor;                                              //006E : 0F 01 90 96 6C 0F 02 90 96 6C 0F 
    CurYL = default.CurYL;                                                      //0079 : 0F 01 48 29 77 0F 02 48 29 77 0F 
    bCenter = False;                                                            //0084 : 14 2D 01 C0 29 77 0F 28 
    bNoSmooth = False;                                                          //008C : 14 2D 01 38 2A 77 0F 28 
    Z = 1.00000000;                                                             //0094 : 0F 01 B0 2A 77 0F 1E 00 00 80 3F 
    ColorModulate = default.ColorModulate;                                      //009F : 0F 01 28 2B 77 0F 02 28 2B 77 0F 
    //0F 01 F0 26 77 0F 02 F0 26 77 0F 0F 01 68 27 77 0F 02 68 27 77 0F 0F 01 E0 27 77 0F 02 E0 27 77 
    //0F 0F 01 58 28 77 0F 02 58 28 77 0F 0F 01 D0 28 77 0F 02 D0 28 77 0F 0F 01 80 FC 76 0F 02 80 FC 
    //76 0F 0F 01 70 FD 76 0F 02 70 FD 76 0F 0F 01 C0 1A 77 0F 02 C0 1A 77 0F 0F 01 A8 18 77 0F 02 A8 
    //18 77 0F 0F 01 60 04 6C 0F 02 60 04 6C 0F 0F 01 90 96 6C 0F 02 90 96 6C 0F 0F 01 48 29 77 0F 02 
    //48 29 77 0F 14 2D 01 C0 29 77 0F 28 14 2D 01 38 2A 77 0F 28 0F 01 B0 2A 77 0F 1E 00 00 80 3F 0F 
    //01 28 2B 77 0F 02 28 2B 77 0F 04 0B 47 
  }


  final native function DrawActorClipped(Actor A,bool Wireframe,float Left,float top,float width,float Height,optional bool ClearZ,optional float DisplayFOV);


  final native function DrawTextJustified(coerce string String,byte Justification,float X1,float Y1,float X2,float Y2);


  final native function DrawTileScaled(Material mat,float XScale,float YScale);


  final native function DrawTileJustified(Material mat,byte Justification,float XL,float YL);


  final native function DrawTileStretchedEx(Material mat,float XL,float YL,float UL,float UT,float UW,float UH);


  final native function DrawTileStretched(Material mat,float XL,float YL);


  final native function DrawTilePartialStretched(Material mat,float XL,float YL);


  final static native function WrapText(out string Text,out string Line,float dx,Font F,float FontScaleX);


  final native function WrapStringToArray(string Text,out array<string> OutArray,float dx,optional string EOL);


  final native function Clear(optional bool ClearRGB,optional bool ClearZ);


  final native function DrawScreenActor(Actor A,optional float FOV,optional bool Wireframe,optional bool ClearZ);


  final native function SetScreenProjector(int Index,Vector Position,Color Color,float Radius,Texture Tex);


  final native function SetScreenLight(int Index,Vector Position,Color LightColor,float Radius);


  final native function GetCameraLocation(out Vector CameraLocation,out Rotator CameraRotation);


  final native function Vector WorldToScreen(Vector WorldLoc);


  final native(480) function DrawPortal(int X,int Y,int width,int Height,Actor CamActor,Vector CamLocation,Rotator CamRotation,optional int FOV,optional bool ClearZ);


  final native(470) function TextSize(coerce string String,out float XL,out float YL);


  final native(469) function DrawTextClipped(coerce string Text,optional bool bCheckHotKey);


  final native(468) function DrawTileClipped(Material mat,float XL,float YL,float U,float V,float UL,float VL);


  native function DrawPositionedActorWithCameraEffects(Actor A,float Distance,bool Wireframe,array<CameraEffect> CameraEffects,optional bool ClearZ,optional float DisplayFOV,optional Rotator cameraRot);


  native function DrawPositionedActor(Actor A,float Distance,bool Wireframe,optional bool ClearZ,optional float DisplayFOV,optional Rotator cameraRot);


  final native(467) function DrawActor(Actor A,bool Wireframe,optional bool ClearZ,optional float DisplayFOV);


  final native function DrawTilePixelClamped(Material mat,float XL,float YL,float U,float V,float UL,float VL);


  final native function DrawTileClamped(Material mat,float XL,float YL,float U,float V,float UL,float VL);


  final native(466) function DrawTile(Material mat,float XL,float YL,float U,float V,float UL,float VL);


  final native(465) function DrawText(coerce string Text,optional bool CR);


  final native(464) function StrLen(coerce string String,out float XL,out float YL);



