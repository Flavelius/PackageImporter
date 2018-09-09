//==============================================================================
//  HUD_LoadingScreen
//==============================================================================

class HUD_LoadingScreen extends GUI_Window
    dependsOn(TexScaler)
    Transient
    Config(User)
  ;

  const SPINNER_OFFSET_Y =  24;
  const SPINNER_HEIGHT =  32;
  const SPINNER_WIDTH =  32;
  const PROGRESS_BAR_OFFSET_Y =  4;
  const PROGRESS_BAR_HEIGHT =  64;
  const PROGRESS_BAR_WIDTH =  256;
  const DEFAULT_SCREEN_HEIGHT =  768;
  const DEFAULT_SCREEN_WIDTH =  1027;
  var private int mClockCoordinateX[16];
  var private int mClockCoordinateY[16];
  var private TexScaler mClockScaler;
  var private int mClockIndex;
  var private GUI_Page mBracketPage;
  var private Material backgroundMaterial;
  var private Material spinnerMaterial;


  private function PrecalculateClockCoordinates() {
    local int clockIndex;
    local int X;
    local int Y;
    clockIndex = 0;                                                             //0000 : 0F 00 A8 D2 05 1B 25 
    Y = 0;                                                                      //0007 : 0F 00 98 D3 05 1B 25 
    while (Y < 4) {                                                             //000E : 07 72 00 96 00 98 D3 05 1B 2C 04 16 
      X = 0;                                                                    //001A : 0F 00 20 D3 05 1B 25 
      while (X < 4) {                                                           //0021 : 07 68 00 96 00 20 D3 05 1B 2C 04 16 
        mClockCoordinateX[clockIndex] = X * 32;                                 //002D : 0F 1A 00 A8 D2 05 1B 01 A0 89 33 26 90 00 20 D3 05 1B 2C 20 16 
        mClockCoordinateY[clockIndex] = Y * 32;                                 //0042 : 0F 1A 00 A8 D2 05 1B 01 10 87 33 26 90 00 98 D3 05 1B 2C 20 16 
        clockIndex++;                                                           //0057 : A5 00 A8 D2 05 1B 16 
        X++;                                                                    //005E : A5 00 20 D3 05 1B 16 
      }
      Y++;                                                                      //0068 : A5 00 98 D3 05 1B 16 
    }
    //0F 00 A8 D2 05 1B 25 0F 00 98 D3 05 1B 25 07 72 00 96 00 98 D3 05 1B 2C 04 16 0F 00 20 D3 05 1B 
    //25 07 68 00 96 00 20 D3 05 1B 2C 04 16 0F 1A 00 A8 D2 05 1B 01 A0 89 33 26 90 00 20 D3 05 1B 2C 
    //20 16 0F 1A 00 A8 D2 05 1B 01 10 87 33 26 90 00 98 D3 05 1B 2C 20 16 A5 00 A8 D2 05 1B 16 A5 00 
    //20 D3 05 1B 16 06 21 00 A5 00 98 D3 05 1B 16 06 0E 00 04 0B 47 
  }


  event OnUpdate(optional int intParam,optional Object objParam,optional string stringParam,optional int intParam2) {
    mClockIndex = mClockIndex + 1;                                              //0000 : 0F 01 80 F1 2C 26 92 01 80 F1 2C 26 26 16 
    if (mClockIndex > 31) {                                                     //000E : 07 21 00 97 01 80 F1 2C 26 2C 1F 16 
      mClockIndex = 0;                                                          //001A : 0F 01 80 F1 2C 26 25 
    }
    mClockScaler.UOffset = mClockCoordinateX[mClockIndex / 2];                  //0021 : 0F 19 01 78 5F 2C 26 05 00 04 01 38 27 2C 11 39 3F 1A 91 01 80 F1 2C 26 2C 02 16 01 A0 89 33 26 
    mClockScaler.VOffset = mClockCoordinateY[mClockIndex / 2];                  //0041 : 0F 19 01 78 5F 2C 26 05 00 04 01 B0 27 2C 11 39 3F 1A 91 01 80 F1 2C 26 2C 02 16 01 10 87 33 26 
    Invalidate();                                                               //0061 : 1B 1D 98 00 00 16 
    //0F 01 80 F1 2C 26 92 01 80 F1 2C 26 26 16 07 21 00 97 01 80 F1 2C 26 2C 1F 16 0F 01 80 F1 2C 26 
    //25 0F 19 01 78 5F 2C 26 05 00 04 01 38 27 2C 11 39 3F 1A 91 01 80 F1 2C 26 2C 02 16 01 A0 89 33 
    //26 0F 19 01 78 5F 2C 26 05 00 04 01 B0 27 2C 11 39 3F 1A 91 01 80 F1 2C 26 2C 02 16 01 10 87 33 
    //26 1B 1D 98 00 00 16 04 0B 47 
  }


  event ResolutionChanged(int ResX,int ResY) {
    if (ResX > 0 && ResY > 0) {                                                 //0000 : 07 5F 00 82 97 00 50 26 34 26 25 16 18 09 00 97 00 C8 26 34 26 25 16 16 
      mLeft = mDesktop.GetScreenWidth() / 2 - 256 / 2;                          //0018 : 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 39 3F 91 1D 00 01 00 00 2C 02 16 16 
      mTop = mDesktop.GetScreenHeight() - 64 + 4;                               //0040 : 0F 01 80 86 31 16 AF 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 92 2C 40 2C 04 16 16 
    }
    //07 5F 00 82 97 00 50 26 34 26 25 16 18 09 00 97 00 C8 26 34 26 25 16 16 0F 01 08 86 31 16 AF AC 
    //19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 39 3F 91 1D 00 01 00 00 2C 02 16 16 
    //0F 01 80 86 31 16 AF 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 92 2C 40 2C 04 16 16 04 
    //0B 47 
  }


  event Initialize() {
    local int screenWidth;
    local int screenHeight;
    screenWidth = mDesktop.GetScreenWidth();                                    //0000 : 0F 00 08 D1 05 1B 39 44 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 
    if (screenWidth == 0) {                                                     //0017 : 07 2D 00 9A 00 08 D1 05 1B 25 16 
      screenWidth = 1027;                                                       //0022 : 0F 00 08 D1 05 1B 1D 03 04 00 00 
    }
    screenHeight = mDesktop.GetScreenHeight();                                  //002D : 0F 00 80 D1 05 1B 39 44 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 
    if (screenHeight == 0) {                                                    //0044 : 07 5A 00 9A 00 80 D1 05 1B 25 16 
      screenHeight = 768;                                                       //004F : 0F 00 80 D1 05 1B 1D 00 03 00 00 
    }
    mLeft = screenWidth / 2 - 256 / 2;                                          //005A : 0F 01 08 86 31 16 39 3F 93 91 00 08 D1 05 1B 2C 02 16 91 1D 00 01 00 00 2C 02 16 16 
    mTop = screenHeight - 64 + 4;                                               //0076 : 0F 01 80 86 31 16 39 3F 93 00 80 D1 05 1B 92 2C 40 2C 04 16 16 
    mWidth = 256.00000000;                                                      //008B : 0F 01 60 87 31 16 1E 00 00 80 43 
    mHeight = 64.00000000;                                                      //0096 : 0F 01 40 88 31 16 1E 00 00 80 42 
    Super.Initialize();                                                         //00A1 : 1C 28 9E 9E 19 16 
    PrecalculateClockCoordinates();                                             //00A7 : 1B CC 98 00 00 16 
    mClockScaler = new Class'TexScaler';                                        //00AD : 0F 01 78 5F 2C 26 11 0B 0B 0B 20 80 BC C3 00 
    mClockScaler.UScale = 4.00000000;                                           //00BC : 0F 19 01 78 5F 2C 26 05 00 04 01 48 26 2C 11 1E 00 00 80 40 
    mClockScaler.VScale = 4.00000000;                                           //00D0 : 0F 19 01 78 5F 2C 26 05 00 04 01 C0 26 2C 11 1E 00 00 80 40 
    mClockScaler.UOffset = 0.00000000;                                          //00E4 : 0F 19 01 78 5F 2C 26 05 00 04 01 38 27 2C 11 1E 00 00 00 00 
    mClockScaler.VOffset = 0.00000000;                                          //00F8 : 0F 19 01 78 5F 2C 26 05 00 04 01 B0 27 2C 11 1E 00 00 00 00 
    mClockScaler.Material = spinnerMaterial;                                    //010C : 0F 19 01 78 5F 2C 26 05 00 04 01 28 28 2C 11 01 28 25 34 26 
    SetIconMaterial(mClockScaler,256.00000000 / 2 - 32 / 2,24.00000000,32.00000000,32.00000000);//0120 : 1B 34 98 00 00 01 78 5F 2C 26 AF AC 1E 00 00 80 43 39 3F 2C 02 16 39 3F 91 2C 20 2C 02 16 16 1E 00 00 C0 41 1E 00 00 00 42 1E 00 00 00 42 16 
    mBracketPage = CreatePage("GUI_Page",0,0,0,0,256,256);                      //014F : 0F 01 30 85 33 26 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 1D 00 01 00 00 1D 00 01 00 00 16 
    mBracketPage.SetIconMaterial(backgroundMaterial,0.00000000,0.00000000,256.00000000,64.00000000);//0173 : 19 01 30 85 33 26 1F 00 00 1B 34 98 00 00 01 C0 23 34 26 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 43 1E 00 00 80 42 16 
    mClockIndex = 0;                                                            //019B : 0F 01 80 F1 2C 26 25 
    //0F 00 08 D1 05 1B 39 44 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 07 2D 00 9A 00 08 D1 05 1B 
    //25 16 0F 00 08 D1 05 1B 1D 03 04 00 00 0F 00 80 D1 05 1B 39 44 19 01 48 0C 9D 19 06 00 04 1B 2E 
    //98 00 00 16 07 5A 00 9A 00 80 D1 05 1B 25 16 0F 00 80 D1 05 1B 1D 00 03 00 00 0F 01 08 86 31 16 
    //39 3F 93 91 00 08 D1 05 1B 2C 02 16 91 1D 00 01 00 00 2C 02 16 16 0F 01 80 86 31 16 39 3F 93 00 
    //80 D1 05 1B 92 2C 40 2C 04 16 16 0F 01 60 87 31 16 1E 00 00 80 43 0F 01 40 88 31 16 1E 00 00 80 
    //42 1C 28 9E 9E 19 16 1B CC 98 00 00 16 0F 01 78 5F 2C 26 11 0B 0B 0B 20 80 BC C3 00 0F 19 01 78 
    //5F 2C 26 05 00 04 01 48 26 2C 11 1E 00 00 80 40 0F 19 01 78 5F 2C 26 05 00 04 01 C0 26 2C 11 1E 
    //00 00 80 40 0F 19 01 78 5F 2C 26 05 00 04 01 38 27 2C 11 1E 00 00 00 00 0F 19 01 78 5F 2C 26 05 
    //00 04 01 B0 27 2C 11 1E 00 00 00 00 0F 19 01 78 5F 2C 26 05 00 04 01 28 28 2C 11 01 28 25 34 26 
    //1B 34 98 00 00 01 78 5F 2C 26 AF AC 1E 00 00 80 43 39 3F 2C 02 16 39 3F 91 2C 20 2C 02 16 16 1E 
    //00 00 C0 41 1E 00 00 00 42 1E 00 00 00 42 16 0F 01 30 85 33 26 1B 16 98 00 00 1F 47 55 49 5F 50 
    //61 67 65 00 25 25 25 25 1D 00 01 00 00 1D 00 01 00 00 16 19 01 30 85 33 26 1F 00 00 1B 34 98 00 
    //00 01 C0 23 34 26 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 43 1E 00 00 80 42 16 0F 01 80 F1 2C 
    //26 25 04 0B 47 
  }



