//==============================================================================
//  HUD
//==============================================================================

class HUD extends Actor
    native
    exportstructs
    dependsOn(HudOverlay,Class,DamageType,Player,Controller,ReachSpec,NavigationPoint,Console)
    Transient
    Config(User)
  ;

  struct ConsoleMessage {
      var string Text;
      var Color TextColor;
      var float MessageLife;

  };


  var (HUD) PlayerController PlayerOwner;
  var (HUD) Pawn PawnOwner;
  var (HUD) Console PlayerConsole;
  var Color WhiteColor;
  var Color RedColor;
  var Color GreenColor;
  var Color CyanColor;
  var Color BlueColor;
  var Color GoldColor;
  var Color PurpleColor;
  var Color TurqColor;
  var Color GrayColor;
  var Color BlackColor;
  var (HUD) globalconfig bool bHideHUD;
  var (HUD) bool bShowDebugInfo;
  var (HUD) globalconfig bool bMessageBeep;
  var globalconfig bool bNoEnemyNames;
  var bool bShowLocalStats;
  var (HUD) Color ConsoleColor;
  var (HUD) localized string ProgressFontName;
  var (HUD) Font ProgressFontFont;
  var (HUD) localized string OverrideConsoleFontName;
  var (HUD) Font OverrideConsoleFont;
  var (HUD) float ProgressFadeTime;
  var (HUD) globalconfig float HudScale;
  var (HUD) globalconfig float HudOpacity;
  var (HUD) globalconfig float HudCanvasScale;
  var (HUD) globalconfig int CrosshairStyle;
  var (HUD) globalconfig float CrosshairScale;
  var (HUD) globalconfig float CrosshairOpacity;
  var (HUD) globalconfig Color CrossHairColor;
  var transient float ResScaleX;
  var transient float ResScaleY;
  var globalconfig int ConsoleMessageCount;
  var globalconfig int ConsoleFontSize;
  var globalconfig int MessageFontOffset;
  var ConsoleMessage TextMessages[8];
  var (HUD) float ConsoleMessagePosX;
  var (HUD) float ConsoleMessagePosY;
  var localized string FontArrayNames[9];
  var Font FontArrayFonts[9];
  var int FontScreenWidthMedium[9];
  var int FontScreenWidthSmall[9];
  var const float LastVoiceGain;
  var const float LastVoiceGainTime;
  var int LastPlayerIDTalking;
  var const float LastPlayerIDTalkingTime;
  var SceneSubtitles SubTitles;
  var array<HudOverlay> Overlays;


  simulated function RemoveHudOverlay(HudOverlay Overlay) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 18 B5 78 0F 25 
    while (i < Overlays.Length) {                                               //0007 : 07 51 00 96 00 18 B5 78 0F 37 01 90 B5 78 0F 16 
      if (Overlays[i] == Overlay) {                                             //0017 : 07 47 00 72 10 00 18 B5 78 0F 01 90 B5 78 0F 00 00 B4 78 0F 16 
        Overlays.Remove(i,1);                                                   //002C : 41 01 90 B5 78 0F 00 18 B5 78 0F 26 
        Overlay.SetOwner(None);                                                 //0038 : 19 00 00 B4 78 0F 04 00 00 61 10 2A 16 
        return;                                                                 //0045 : 04 0B 
      }
      i++;                                                                      //0047 : A5 00 18 B5 78 0F 16 
    }
    //0F 00 18 B5 78 0F 25 07 51 00 96 00 18 B5 78 0F 37 01 90 B5 78 0F 16 07 47 00 72 10 00 18 B5 78 
    //0F 01 90 B5 78 0F 00 00 B4 78 0F 16 41 01 90 B5 78 0F 00 18 B5 78 0F 26 19 00 00 B4 78 0F 04 00 
    //00 61 10 2A 16 04 0B A5 00 18 B5 78 0F 16 06 07 00 04 0B 47 
  }


  simulated function AddHudOverlay(HudOverlay Overlay) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 70 BC 78 0F 25 
    while (i < Overlays.Length) {                                               //0007 : 07 38 00 96 00 70 BC 78 0F 37 01 90 B5 78 0F 16 
      if (Overlays[i] == Overlay) {                                             //0017 : 07 2E 00 72 10 00 70 BC 78 0F 01 90 B5 78 0F 00 F8 BB 78 0F 16 
        return;                                                                 //002C : 04 0B 
      }
      i++;                                                                      //002E : A5 00 70 BC 78 0F 16 
    }
    Overlays[Overlays.Length] = Overlay;                                        //0038 : 0F 10 37 01 90 B5 78 0F 01 90 B5 78 0F 00 F8 BB 78 0F 
    Overlay.SetOwner(self);                                                     //004A : 19 00 F8 BB 78 0F 04 00 00 61 10 17 16 
    //0F 00 70 BC 78 0F 25 07 38 00 96 00 70 BC 78 0F 37 01 90 B5 78 0F 16 07 2E 00 72 10 00 70 BC 78 
    //0F 01 90 B5 78 0F 00 F8 BB 78 0F 16 04 0B A5 00 70 BC 78 0F 16 06 07 00 0F 10 37 01 90 B5 78 0F 
    //01 90 B5 78 0F 00 F8 BB 78 0F 19 00 F8 BB 78 0F 04 00 00 61 10 17 16 04 0B 47 
  }


  function DisplayHit(Vector HitDir,int Damage,class<DamageType> DamageType) {
    if (PawnOwner != None && PawnOwner.ShieldStrength > 0) {                    //0000 : 07 47 00 82 77 01 08 60 7A 0F 2A 16 18 14 00 B1 19 01 08 60 7A 0F 05 00 04 01 50 D0 76 0F 39 3F 25 16 16 
      PlayerOwner.ClientFlash(0.50000000,vect(700.000000, 700.000000, 0.000000));//0023 : 19 01 80 60 7A 0F 18 00 00 1B 1D 2B 00 00 1E 00 00 00 3F 23 00 00 2F 44 00 00 2F 44 00 00 00 00 16 
    } else {                                                                    //0044 : 06 7D 00 
      if (Damage > 1) {                                                         //0047 : 07 7D 00 97 00 F8 60 7A 0F 26 16 
        PlayerOwner.ClientFlash(DamageType.default.FlashScale,DamageType.default.FlashFog);//0052 : 19 01 80 60 7A 0F 22 00 00 1B 1D 2B 00 00 12 00 70 61 7A 0F 05 00 04 02 68 93 71 0F 12 00 70 61 7A 0F 05 00 0C 02 18 94 71 0F 16 
      }
    }
    //07 47 00 82 77 01 08 60 7A 0F 2A 16 18 14 00 B1 19 01 08 60 7A 0F 05 00 04 01 50 D0 76 0F 39 3F 
    //25 16 16 19 01 80 60 7A 0F 18 00 00 1B 1D 2B 00 00 1E 00 00 00 3F 23 00 00 2F 44 00 00 2F 44 00 
    //00 00 00 16 06 7D 00 07 7D 00 97 00 F8 60 7A 0F 26 16 19 01 80 60 7A 0F 22 00 00 1B 1D 2B 00 00 
    //12 00 70 61 7A 0F 05 00 04 02 68 93 71 0F 12 00 70 61 7A 0F 05 00 0C 02 18 94 71 0F 16 04 0B 47 
    //
  }


  simulated function DrawTargeting(Canvas C);


  event AnnouncementPlayed(name AnnouncerSound,byte Switch);


  simulated function Font LoadProgressFont() {
    if (ProgressFontFont == None) {                                             //0000 : 07 79 00 72 01 40 66 7A 0F 2A 16 
      ProgressFontFont = Font(static.DynamicLoadObject(ProgressFontName,Class'Font'));//000B : 0F 01 40 66 7A 0F 2E 60 28 C3 00 1C 60 E7 69 0F 01 B8 66 7A 0F 20 60 28 C3 00 16 
      if (ProgressFontFont == None) {                                           //0026 : 07 79 00 72 01 40 66 7A 0F 2A 16 
        Log("Warning: " $ string(self)
          $ " Couldn't dynamically load font "
          $ ProgressFontName);//0031 : E7 70 70 70 1F 57 61 72 6E 69 6E 67 3A 20 00 39 56 17 16 1F 20 43 6F 75 6C 64 6E 27 74 20 64 79 6E 61 6D 69 63 61 6C 6C 79 20 6C 6F 61 64 20 66 6F 6E 74 20 00 16 01 B8 66 7A 0F 16 16 
        ProgressFontFont = Font'DefaultFont';                                   //006E : 0F 01 40 66 7A 0F 20 C0 95 77 0F 
      }
    }
    return ProgressFontFont;                                                    //0079 : 04 01 40 66 7A 0F 
    //07 79 00 72 01 40 66 7A 0F 2A 16 0F 01 40 66 7A 0F 2E 60 28 C3 00 1C 60 E7 69 0F 01 B8 66 7A 0F 
    //20 60 28 C3 00 16 07 79 00 72 01 40 66 7A 0F 2A 16 E7 70 70 70 1F 57 61 72 6E 69 6E 67 3A 20 00 
    //39 56 17 16 1F 20 43 6F 75 6C 64 6E 27 74 20 64 79 6E 61 6D 69 63 61 6C 6C 79 20 6C 6F 61 64 20 
    //66 6F 6E 74 20 00 16 01 B8 66 7A 0F 16 16 0F 01 40 66 7A 0F 20 C0 95 77 0F 04 01 40 66 7A 0F 04 
    //0B 47 
  }


  static function Font LargerFontThan(Font aFont) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 58 68 7A 0F 25 
    while (i < 7) {                                                             //0007 : 07 45 00 96 00 58 68 7A 0F 2C 07 16 
      if (LoadFontStatic(i) == aFont) {                                         //0013 : 07 3B 00 72 1B 8E 2A 00 00 00 58 68 7A 0F 16 00 E0 67 7A 0F 16 
        return LoadFontStatic(Max(0,i - 4));                                    //0028 : 04 1B 8E 2A 00 00 FA 25 93 00 58 68 7A 0F 2C 04 16 16 16 
      }
      i++;                                                                      //003B : A5 00 58 68 7A 0F 16 
    }
    return LoadFontStatic(5);                                                   //0045 : 04 1B 8E 2A 00 00 2C 05 16 
    //0F 00 58 68 7A 0F 25 07 45 00 96 00 58 68 7A 0F 2C 07 16 07 3B 00 72 1B 8E 2A 00 00 00 58 68 7A 
    //0F 16 00 E0 67 7A 0F 16 04 1B 8E 2A 00 00 FA 25 93 00 58 68 7A 0F 2C 04 16 16 16 A5 00 58 68 7A 
    //0F 16 06 07 00 04 1B 8E 2A 00 00 2C 05 16 04 0B 47 
  }


  function Font GetMediumFont(float Size) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 00 6B 7A 0F 25 
    while (i < 8) {                                                             //0007 : 07 40 00 96 00 00 6B 7A 0F 2C 08 16 
      if (default.FontScreenWidthMedium[i] <= Size) {                           //0013 : 07 36 00 B2 39 3F 1A 00 00 6B 7A 0F 02 78 6B 7A 0F 00 F8 69 7A 0F 16 
        return LoadFontStatic(i);                                               //002A : 04 1B 8E 2A 00 00 00 00 6B 7A 0F 16 
      }
      i++;                                                                      //0036 : A5 00 00 6B 7A 0F 16 
    }
    return LoadFontStatic(8);                                                   //0040 : 04 1B 8E 2A 00 00 2C 08 16 
    //0F 00 00 6B 7A 0F 25 07 40 00 96 00 00 6B 7A 0F 2C 08 16 07 36 00 B2 39 3F 1A 00 00 6B 7A 0F 02 
    //78 6B 7A 0F 00 F8 69 7A 0F 16 04 1B 8E 2A 00 00 00 00 6B 7A 0F 16 A5 00 00 6B 7A 0F 16 06 07 00 
    //04 1B 8E 2A 00 00 2C 08 16 04 0B 47 
  }


  static function Font GetMediumFontFor(Canvas Canvas) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 30 6E 7A 0F 25 
    while (i < 8) {                                                             //0007 : 07 49 00 96 00 30 6E 7A 0F 2C 08 16 
      if (default.FontScreenWidthMedium[i] <= Canvas.ClipX) {                   //0013 : 07 3F 00 B2 39 3F 1A 00 30 6E 7A 0F 02 78 6B 7A 0F 19 00 18 6D 7A 0F 05 00 04 01 90 20 77 0F 16 
        return LoadFontStatic(i);                                               //0033 : 04 1B 8E 2A 00 00 00 30 6E 7A 0F 16 
      }
      i++;                                                                      //003F : A5 00 30 6E 7A 0F 16 
    }
    return LoadFontStatic(8);                                                   //0049 : 04 1B 8E 2A 00 00 2C 08 16 
    //0F 00 30 6E 7A 0F 25 07 49 00 96 00 30 6E 7A 0F 2C 08 16 07 3F 00 B2 39 3F 1A 00 30 6E 7A 0F 02 
    //78 6B 7A 0F 19 00 18 6D 7A 0F 05 00 04 01 90 20 77 0F 16 04 1B 8E 2A 00 00 00 30 6E 7A 0F 16 A5 
    //00 30 6E 7A 0F 16 06 07 00 04 1B 8E 2A 00 00 2C 08 16 04 0B 47 
  }


  function Font GetFontSizeIndex(Canvas C,int FontSize) {
    if (C.ClipX >= 512) {                                                       //0000 : 07 21 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 00 02 00 00 16 
      FontSize++;                                                               //001A : A5 00 A8 71 7A 0F 16 
    }
    if (C.ClipX >= 640) {                                                       //0021 : 07 42 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 80 02 00 00 16 
      FontSize++;                                                               //003B : A5 00 A8 71 7A 0F 16 
    }
    if (C.ClipX >= 800) {                                                       //0042 : 07 63 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 20 03 00 00 16 
      FontSize++;                                                               //005C : A5 00 A8 71 7A 0F 16 
    }
    if (C.ClipX >= 1024) {                                                      //0063 : 07 84 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 00 04 00 00 16 
      FontSize++;                                                               //007D : A5 00 A8 71 7A 0F 16 
    }
    if (C.ClipX >= 1280) {                                                      //0084 : 07 A5 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 00 05 00 00 16 
      FontSize++;                                                               //009E : A5 00 A8 71 7A 0F 16 
    }
    if (C.ClipX >= 1600) {                                                      //00A5 : 07 C6 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 40 06 00 00 16 
      FontSize++;                                                               //00BF : A5 00 A8 71 7A 0F 16 
    }
    return LoadFont(Clamp(8 - FontSize,0,8));                                   //00C6 : 04 1B BD 2B 00 00 FB 93 2C 08 00 A8 71 7A 0F 16 25 2C 08 16 16 
    //07 21 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 00 02 00 00 16 A5 00 A8 71 7A 0F 
    //16 07 42 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 80 02 00 00 16 A5 00 A8 71 7A 
    //0F 16 07 63 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 20 03 00 00 16 A5 00 A8 71 
    //7A 0F 16 07 84 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 00 04 00 00 16 A5 00 A8 
    //71 7A 0F 16 07 A5 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 00 05 00 00 16 A5 00 
    //A8 71 7A 0F 16 07 C6 00 B3 19 00 D0 6F 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 40 06 00 00 16 A5 
    //00 A8 71 7A 0F 16 04 1B BD 2B 00 00 FB 93 2C 08 00 A8 71 7A 0F 16 25 2C 08 16 16 04 0B 47 
  }


  static function Font GetConsoleFont(Canvas C) {
    local int FontSize;
    if (default.OverrideConsoleFontName != "") {                                //0000 : 07 88 00 7B 02 B0 75 7A 0F 1F 00 16 
      if (default.OverrideConsoleFont != None) {                                //000C : 07 1D 00 77 02 28 76 7A 0F 2A 16 
        return default.OverrideConsoleFont;                                     //0017 : 04 02 28 76 7A 0F 
      }
      default.OverrideConsoleFont = Font(static.DynamicLoadObject(default.OverrideConsoleFontName,Class'Font'));//001D : 0F 02 28 76 7A 0F 2E 60 28 C3 00 1C 60 E7 69 0F 02 B0 75 7A 0F 20 60 28 C3 00 16 
      if (default.OverrideConsoleFont != None) {                                //0038 : 07 49 00 77 02 28 76 7A 0F 2A 16 
        return default.OverrideConsoleFont;                                     //0043 : 04 02 28 76 7A 0F 
      }
      Log("Warning: HUD couldn't dynamically load font "
        $ default.OverrideConsoleFontName);//0049 : E7 70 1F 57 61 72 6E 69 6E 67 3A 20 48 55 44 20 63 6F 75 6C 64 6E 27 74 20 64 79 6E 61 6D 69 63 61 6C 6C 79 20 6C 6F 61 64 20 66 6F 6E 74 20 00 02 B0 75 7A 0F 16 16 
      default.OverrideConsoleFontName = "";                                     //0080 : 0F 02 B0 75 7A 0F 1F 00 
    }
    FontSize = default.ConsoleFontSize;                                         //0088 : 0F 00 A0 76 7A 0F 02 18 77 7A 0F 
    if (C.ClipX < 640) {                                                        //0093 : 07 B4 00 B0 19 00 48 73 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 80 02 00 00 16 
      FontSize++;                                                               //00AD : A5 00 A0 76 7A 0F 16 
    }
    if (C.ClipX < 800) {                                                        //00B4 : 07 D5 00 B0 19 00 48 73 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 20 03 00 00 16 
      FontSize++;                                                               //00CE : A5 00 A0 76 7A 0F 16 
    }
    if (C.ClipX < 1024) {                                                       //00D5 : 07 F6 00 B0 19 00 48 73 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 00 04 00 00 16 
      FontSize++;                                                               //00EF : A5 00 A0 76 7A 0F 16 
    }
    if (C.ClipX < 1280) {                                                       //00F6 : 07 17 01 B0 19 00 48 73 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 00 05 00 00 16 
      FontSize++;                                                               //0110 : A5 00 A0 76 7A 0F 16 
    }
    if (C.ClipX < 1600) {                                                       //0117 : 07 38 01 B0 19 00 48 73 7A 0F 05 00 04 01 90 20 77 0F 39 3F 1D 40 06 00 00 16 
      FontSize++;                                                               //0131 : A5 00 A0 76 7A 0F 16 
    }
    return LoadFontStatic(Min(8,FontSize));                                     //0138 : 04 1B 8E 2A 00 00 F9 2C 08 00 A0 76 7A 0F 16 16 
    //07 88 00 7B 02 B0 75 7A 0F 1F 00 16 07 1D 00 77 02 28 76 7A 0F 2A 16 04 02 28 76 7A 0F 0F 02 28 
    //76 7A 0F 2E 60 28 C3 00 1C 60 E7 69 0F 02 B0 75 7A 0F 20 60 28 C3 00 16 07 49 00 77 02 28 76 7A 
    //0F 2A 16 04 02 28 76 7A 0F E7 70 1F 57 61 72 6E 69 6E 67 3A 20 48 55 44 20 63 6F 75 6C 64 6E 27 
    //74 20 64 79 6E 61 6D 69 63 61 6C 6C 79 20 6C 6F 61 64 20 66 6F 6E 74 20 00 02 B0 75 7A 0F 16 16 
    //0F 02 B0 75 7A 0F 1F 00 0F 00 A0 76 7A 0F 02 18 77 7A 0F 07 B4 00 B0 19 00 48 73 7A 0F 05 00 04 
    //01 90 20 77 0F 39 3F 1D 80 02 00 00 16 A5 00 A0 76 7A 0F 16 07 D5 00 B0 19 00 48 73 7A 0F 05 00 
    //04 01 90 20 77 0F 39 3F 1D 20 03 00 00 16 A5 00 A0 76 7A 0F 16 07 F6 00 B0 19 00 48 73 7A 0F 05 
    //00 04 01 90 20 77 0F 39 3F 1D 00 04 00 00 16 A5 00 A0 76 7A 0F 16 07 17 01 B0 19 00 48 73 7A 0F 
    //05 00 04 01 90 20 77 0F 39 3F 1D 00 05 00 00 16 A5 00 A0 76 7A 0F 16 07 38 01 B0 19 00 48 73 7A 
    //0F 05 00 04 01 90 20 77 0F 39 3F 1D 40 06 00 00 16 A5 00 A0 76 7A 0F 16 04 1B 8E 2A 00 00 F9 2C 
    //08 00 A0 76 7A 0F 16 16 04 0B 47 
  }


  simulated function Font LoadFont(int i) {
    if (FontArrayFonts[i] == None) {                                            //0000 : 07 8C 00 72 1A 00 B8 78 7A 0F 01 30 7A 7A 0F 2A 16 
      FontArrayFonts[i] = Font(static.DynamicLoadObject(FontArrayNames[i],Class'Font'));//0011 : 0F 1A 00 B8 78 7A 0F 01 30 7A 7A 0F 2E 60 28 C3 00 1C 60 E7 69 0F 1A 00 B8 78 7A 0F 01 A8 7A 7A 0F 20 60 28 C3 00 16 
      if (FontArrayFonts[i] == None) {                                          //0038 : 07 8C 00 72 1A 00 B8 78 7A 0F 01 30 7A 7A 0F 2A 16 
        Log("Warning: " $ string(self)
          $ " Couldn't dynamically load font "
          $ FontArrayNames[i]);//0049 : E7 70 70 70 1F 57 61 72 6E 69 6E 67 3A 20 00 39 56 17 16 1F 20 43 6F 75 6C 64 6E 27 74 20 64 79 6E 61 6D 69 63 61 6C 6C 79 20 6C 6F 61 64 20 66 6F 6E 74 20 00 16 1A 00 B8 78 7A 0F 01 A8 7A 7A 0F 16 16 
      }
    }
    return FontArrayFonts[i];                                                   //008C : 04 1A 00 B8 78 7A 0F 01 30 7A 7A 0F 
    //07 8C 00 72 1A 00 B8 78 7A 0F 01 30 7A 7A 0F 2A 16 0F 1A 00 B8 78 7A 0F 01 30 7A 7A 0F 2E 60 28 
    //C3 00 1C 60 E7 69 0F 1A 00 B8 78 7A 0F 01 A8 7A 7A 0F 20 60 28 C3 00 16 07 8C 00 72 1A 00 B8 78 
    //7A 0F 01 30 7A 7A 0F 2A 16 E7 70 70 70 1F 57 61 72 6E 69 6E 67 3A 20 00 39 56 17 16 1F 20 43 6F 
    //75 6C 64 6E 27 74 20 64 79 6E 61 6D 69 63 61 6C 6C 79 20 6C 6F 61 64 20 66 6F 6E 74 20 00 16 1A 
    //00 B8 78 7A 0F 01 A8 7A 7A 0F 16 16 04 1A 00 B8 78 7A 0F 01 30 7A 7A 0F 04 0B 47 
  }


  static function Font LoadFontStatic(int i) {
    if (default.FontArrayFonts[i] == None) {                                    //0000 : 07 90 00 72 1A 00 48 7C 7A 0F 02 30 7A 7A 0F 2A 16 
      default.FontArrayFonts[i] = Font(static.DynamicLoadObject(default.FontArrayNames[i],Class'Font'));//0011 : 0F 1A 00 48 7C 7A 0F 02 30 7A 7A 0F 2E 60 28 C3 00 1C 60 E7 69 0F 1A 00 48 7C 7A 0F 02 A8 7A 7A 0F 20 60 28 C3 00 16 
      if (default.FontArrayFonts[i] == None) {                                  //0038 : 07 90 00 72 1A 00 48 7C 7A 0F 02 30 7A 7A 0F 2A 16 
        Log("Warning: " $ string(default.Class)
          $ " Couldn't dynamically load font "
          $ default.FontArrayNames[i]);//0049 : E7 70 70 70 1F 57 61 72 6E 69 6E 67 3A 20 00 39 56 02 68 E5 6B 0F 16 1F 20 43 6F 75 6C 64 6E 27 74 20 64 79 6E 61 6D 69 63 61 6C 6C 79 20 6C 6F 61 64 20 66 6F 6E 74 20 00 16 1A 00 48 7C 7A 0F 02 A8 7A 7A 0F 16 16 
      }
    }
    return default.FontArrayFonts[i];                                           //0090 : 04 1A 00 48 7C 7A 0F 02 30 7A 7A 0F 
    //07 90 00 72 1A 00 48 7C 7A 0F 02 30 7A 7A 0F 2A 16 0F 1A 00 48 7C 7A 0F 02 30 7A 7A 0F 2E 60 28 
    //C3 00 1C 60 E7 69 0F 1A 00 48 7C 7A 0F 02 A8 7A 7A 0F 20 60 28 C3 00 16 07 90 00 72 1A 00 48 7C 
    //7A 0F 02 30 7A 7A 0F 2A 16 E7 70 70 70 1F 57 61 72 6E 69 6E 67 3A 20 00 39 56 02 68 E5 6B 0F 16 
    //1F 20 43 6F 75 6C 64 6E 27 74 20 64 79 6E 61 6D 69 63 61 6C 6C 79 20 6C 6F 61 64 20 66 6F 6E 74 
    //20 00 16 1A 00 48 7C 7A 0F 02 A8 7A 7A 0F 16 16 04 1A 00 48 7C 7A 0F 02 30 7A 7A 0F 04 0B 47 
  }


  simulated function SetCropping(bool Active);


  simulated function DrawCrosshair(Canvas C);


  simulated function SetTargeting(bool bShow,optional Vector TargetLocation,optional float Size);


  function FadeZoom();


  function DisplayMessages(Canvas C) {
    local int i;
    local int j;
    local int XPos;
    local int YPos;
    local int MessageCount;
    local float XL;
    local float YL;
    i = 0;                                                                      //0000 : 0F 00 38 89 7A 0F 25 
    while (i < ConsoleMessageCount) {                                           //0007 : 07 E6 00 96 00 38 89 7A 0F 01 B0 89 7A 0F 16 
      if (TextMessages[i].Text == "") {                                         //0016 : 07 33 00 7A 36 B0 8A 7A 0F 1A 00 38 89 7A 0F 01 28 8B 7A 0F 1F 00 16 
        break;                                                                  //002D : 06 E6 00 
      } else {                                                                  //0030 : 06 DC 00 
        if (TextMessages[i].MessageLife < Level.TimeSeconds) {                  //0033 : 07 D5 00 B0 36 A0 8B 7A 0F 1A 00 38 89 7A 0F 01 28 8B 7A 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 
          TextMessages[i].Text = "";                                            //0056 : 0F 36 B0 8A 7A 0F 1A 00 38 89 7A 0F 01 28 8B 7A 0F 1F 00 
          if (i < ConsoleMessageCount - 1) {                                    //0069 : 07 BC 00 96 00 38 89 7A 0F 93 01 B0 89 7A 0F 26 16 16 
            j = i;                                                              //007B : 0F 00 18 8C 7A 0F 00 38 89 7A 0F 
            while (j < ConsoleMessageCount - 1) {                               //0086 : 07 BC 00 96 00 18 8C 7A 0F 93 01 B0 89 7A 0F 26 16 16 
              TextMessages[j] = TextMessages[j + 1];                            //0098 : 0F 1A 00 18 8C 7A 0F 01 28 8B 7A 0F 1A 92 00 18 8C 7A 0F 26 16 01 28 8B 7A 0F 
              j++;                                                              //00B2 : A5 00 18 8C 7A 0F 16 
            }
          }
          TextMessages[j].Text = "";                                            //00BC : 0F 36 B0 8A 7A 0F 1A 00 18 8C 7A 0F 01 28 8B 7A 0F 1F 00 
          break;                                                                //00CF : 06 E6 00 
          goto jl00DC;                                                          //00D2 : 06 DC 00 
        }
        MessageCount++;                                                         //00D5 : A5 00 90 8C 7A 0F 16 
      }
      i++;                                                                      //00DC : A5 00 38 89 7A 0F 16 
    }
    XPos = ConsoleMessagePosX * HudCanvasScale * C.SizeX + (1.00000000 - HudCanvasScale) / 2.00000000 * C.SizeX;//00E6 : 0F 00 08 8D 7A 0F 39 44 AE 39 3F 39 44 AB AB 01 80 8D 7A 0F 01 F8 8D 7A 0F 16 39 3F 19 00 C8 84 7A 0F 05 00 04 01 78 12 77 0F 16 AB AC AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 40 16 39 3F 19 00 C8 84 7A 0F 05 00 04 01 78 12 77 0F 16 16 
    YPos = ConsoleMessagePosY * HudCanvasScale * C.SizeY + (1.00000000 - HudCanvasScale) / 2.00000000 * C.SizeY;//0137 : 0F 00 70 8E 7A 0F 39 44 AE 39 3F 39 44 AB AB 01 E8 8E 7A 0F 01 F8 8D 7A 0F 16 39 3F 19 00 C8 84 7A 0F 05 00 04 01 68 13 77 0F 16 AB AC AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 40 16 39 3F 19 00 C8 84 7A 0F 05 00 04 01 68 13 77 0F 16 16 
    C.Font = GetConsoleFont(C);                                                 //0188 : 0F 19 00 C8 84 7A 0F 05 00 04 01 F0 26 77 0F 1B FB 2A 00 00 00 C8 84 7A 0F 16 
    C.DrawColor = ConsoleColor;                                                 //01A2 : 0F 19 00 C8 84 7A 0F 05 00 04 01 90 96 6C 0F 01 60 8F 7A 0F 
    C.TextSize("A",XL,YL);                                                      //01B6 : 19 00 C8 84 7A 0F 10 00 00 61 D6 1F 41 00 00 D8 8F 7A 0F 00 50 90 7A 0F 16 
    YPos -= YL * MessageCount + 1;                                              //01CF : A2 00 70 8E 7A 0F 39 44 AE AB 00 50 90 7A 0F 39 3F 00 90 8C 7A 0F 16 39 3F 26 16 16 
    YPos -= YL;                                                                 //01EB : A2 00 70 8E 7A 0F 39 44 00 50 90 7A 0F 16 
    i = 0;                                                                      //01F9 : 0F 00 38 89 7A 0F 25 
    while (i < MessageCount) {                                                  //0200 : 07 C0 02 96 00 38 89 7A 0F 00 90 8C 7A 0F 16 
      if (TextMessages[i].Text == "") {                                         //020F : 07 29 02 7A 36 B0 8A 7A 0F 1A 00 38 89 7A 0F 01 28 8B 7A 0F 1F 00 16 
        goto jl02C0;                                                            //0226 : 06 C0 02 
      }
      C.StrLen(TextMessages[i].Text,XL,YL);                                     //0229 : 19 00 C8 84 7A 0F 1D 00 00 61 D0 36 B0 8A 7A 0F 1A 00 38 89 7A 0F 01 28 8B 7A 0F 00 D8 8F 7A 0F 00 50 90 7A 0F 16 
      C.SetPos(XPos,YPos);                                                      //024F : 19 00 C8 84 7A 0F 14 00 00 1C 80 90 6C 0F 39 3F 00 08 8D 7A 0F 39 3F 00 70 8E 7A 0F 16 
      C.DrawColor = TextMessages[i].TextColor;                                  //026C : 0F 19 00 C8 84 7A 0F 05 00 04 01 90 96 6C 0F 36 C8 90 7A 0F 1A 00 38 89 7A 0F 01 28 8B 7A 0F 
      C.DrawText(TextMessages[i].Text,False);                                   //028B : 19 00 C8 84 7A 0F 14 00 00 61 D1 36 B0 8A 7A 0F 1A 00 38 89 7A 0F 01 28 8B 7A 0F 28 16 
      YPos += YL;                                                               //02A8 : A1 00 70 8E 7A 0F 39 44 00 50 90 7A 0F 16 
      i++;                                                                      //02B6 : A5 00 38 89 7A 0F 16 
    }
    //0F 00 38 89 7A 0F 25 07 E6 00 96 00 38 89 7A 0F 01 B0 89 7A 0F 16 07 33 00 7A 36 B0 8A 7A 0F 1A 
    //00 38 89 7A 0F 01 28 8B 7A 0F 1F 00 16 06 E6 00 06 DC 00 07 D5 00 B0 36 A0 8B 7A 0F 1A 00 38 89 
    //7A 0F 01 28 8B 7A 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 0F 36 B0 8A 7A 0F 1A 00 38 89 
    //7A 0F 01 28 8B 7A 0F 1F 00 07 BC 00 96 00 38 89 7A 0F 93 01 B0 89 7A 0F 26 16 16 0F 00 18 8C 7A 
    //0F 00 38 89 7A 0F 07 BC 00 96 00 18 8C 7A 0F 93 01 B0 89 7A 0F 26 16 16 0F 1A 00 18 8C 7A 0F 01 
    //28 8B 7A 0F 1A 92 00 18 8C 7A 0F 26 16 01 28 8B 7A 0F A5 00 18 8C 7A 0F 16 06 86 00 0F 36 B0 8A 
    //7A 0F 1A 00 18 8C 7A 0F 01 28 8B 7A 0F 1F 00 06 E6 00 06 DC 00 A5 00 90 8C 7A 0F 16 A5 00 38 89 
    //7A 0F 16 06 07 00 0F 00 08 8D 7A 0F 39 44 AE 39 3F 39 44 AB AB 01 80 8D 7A 0F 01 F8 8D 7A 0F 16 
    //39 3F 19 00 C8 84 7A 0F 05 00 04 01 78 12 77 0F 16 AB AC AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 
    //00 00 00 40 16 39 3F 19 00 C8 84 7A 0F 05 00 04 01 78 12 77 0F 16 16 0F 00 70 8E 7A 0F 39 44 AE 
    //39 3F 39 44 AB AB 01 E8 8E 7A 0F 01 F8 8D 7A 0F 16 39 3F 19 00 C8 84 7A 0F 05 00 04 01 68 13 77 
    //0F 16 AB AC AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 40 16 39 3F 19 00 C8 84 7A 0F 05 00 
    //04 01 68 13 77 0F 16 16 0F 19 00 C8 84 7A 0F 05 00 04 01 F0 26 77 0F 1B FB 2A 00 00 00 C8 84 7A 
    //0F 16 0F 19 00 C8 84 7A 0F 05 00 04 01 90 96 6C 0F 01 60 8F 7A 0F 19 00 C8 84 7A 0F 10 00 00 61 
    //D6 1F 41 00 00 D8 8F 7A 0F 00 50 90 7A 0F 16 A2 00 70 8E 7A 0F 39 44 AE AB 00 50 90 7A 0F 39 3F 
    //00 90 8C 7A 0F 16 39 3F 26 16 16 A2 00 70 8E 7A 0F 39 44 00 50 90 7A 0F 16 0F 00 38 89 7A 0F 25 
    //07 C0 02 96 00 38 89 7A 0F 00 90 8C 7A 0F 16 07 29 02 7A 36 B0 8A 7A 0F 1A 00 38 89 7A 0F 01 28 
    //8B 7A 0F 1F 00 16 06 C0 02 19 00 C8 84 7A 0F 1D 00 00 61 D0 36 B0 8A 7A 0F 1A 00 38 89 7A 0F 01 
    //28 8B 7A 0F 00 D8 8F 7A 0F 00 50 90 7A 0F 16 19 00 C8 84 7A 0F 14 00 00 1C 80 90 6C 0F 39 3F 00 
    //08 8D 7A 0F 39 3F 00 70 8E 7A 0F 16 0F 19 00 C8 84 7A 0F 05 00 04 01 90 96 6C 0F 36 C8 90 7A 0F 
    //1A 00 38 89 7A 0F 01 28 8B 7A 0F 19 00 C8 84 7A 0F 14 00 00 61 D1 36 B0 8A 7A 0F 1A 00 38 89 7A 
    //0F 01 28 8B 7A 0F 28 16 A1 00 70 8E 7A 0F 39 44 00 50 90 7A 0F 16 A5 00 38 89 7A 0F 16 06 00 02 
    //04 0B 47 
  }


  simulated function Message(string Message,optional string sender,optional name Type,optional int Range) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 68 92 7A 0F 25 
    while (i < ConsoleMessageCount) {                                           //0007 : 07 3A 00 96 00 68 92 7A 0F 01 B0 89 7A 0F 16 
      if (TextMessages[i].Text == "") {                                         //0016 : 07 30 00 7A 36 B0 8A 7A 0F 1A 00 68 92 7A 0F 01 28 8B 7A 0F 1F 00 16 
        goto jl003A;                                                            //002D : 06 3A 00 
      }
      i++;                                                                      //0030 : A5 00 68 92 7A 0F 16 
    }
    if (i == ConsoleMessageCount) {                                             //003A : 07 86 00 9A 00 68 92 7A 0F 01 B0 89 7A 0F 16 
      i = 0;                                                                    //0049 : 0F 00 68 92 7A 0F 25 
      while (i < ConsoleMessageCount - 1) {                                     //0050 : 07 86 00 96 00 68 92 7A 0F 93 01 B0 89 7A 0F 26 16 16 
        TextMessages[i] = TextMessages[i + 1];                                  //0062 : 0F 1A 00 68 92 7A 0F 01 28 8B 7A 0F 1A 92 00 68 92 7A 0F 26 16 01 28 8B 7A 0F 
        i++;                                                                    //007C : A5 00 68 92 7A 0F 16 
      }
    }
    //0F 00 68 92 7A 0F 25 07 3A 00 96 00 68 92 7A 0F 01 B0 89 7A 0F 16 07 30 00 7A 36 B0 8A 7A 0F 1A 
    //00 68 92 7A 0F 01 28 8B 7A 0F 1F 00 16 06 3A 00 A5 00 68 92 7A 0F 16 06 07 00 07 86 00 9A 00 68 
    //92 7A 0F 01 B0 89 7A 0F 16 0F 00 68 92 7A 0F 25 07 86 00 96 00 68 92 7A 0F 93 01 B0 89 7A 0F 26 
    //16 16 0F 1A 00 68 92 7A 0F 01 28 8B 7A 0F 1A 92 00 68 92 7A 0F 26 16 01 28 8B 7A 0F A5 00 68 92 
    //7A 0F 16 06 50 00 04 0B 47 
  }


  simulated function LinkActors() {
    PlayerOwner = PlayerController(Owner);                                      //0000 : 0F 01 80 60 7A 0F 2E 58 34 C2 00 01 B0 9F 6C 0F 
    if (PlayerOwner == None) {                                                  //0010 : 07 2B 00 72 01 80 60 7A 0F 2A 16 
      PlayerConsole = None;                                                     //001B : 0F 01 F8 94 7A 0F 2A 
      PawnOwner = None;                                                         //0022 : 0F 01 08 60 7A 0F 2A 
      return;                                                                   //0029 : 04 0B 
    }
    if (PlayerOwner.Player != None) {                                           //002B : 07 5F 00 77 19 01 80 60 7A 0F 05 00 04 01 28 25 71 0F 2A 16 
      PlayerConsole = PlayerOwner.Player.Console;                               //003F : 0F 01 F8 94 7A 0F 19 19 01 80 60 7A 0F 05 00 04 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 
    } else {                                                                    //005C : 06 66 00 
      PlayerConsole = None;                                                     //005F : 0F 01 F8 94 7A 0F 2A 
    }
    if (Pawn(PlayerOwner.ViewTarget) != None
      && Pawn(PlayerOwner.ViewTarget).GetHealth() > 0) {//0066 : 07 C2 00 82 77 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 2A 16 18 23 00 B1 19 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 06 00 04 1B 12 10 00 00 16 39 3F 25 16 16 
      PawnOwner = Pawn(PlayerOwner.ViewTarget);                                 //00A6 : 0F 01 08 60 7A 0F 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 
    } else {                                                                    //00BF : 06 F4 00 
      if (PlayerOwner.Pawn != None) {                                           //00C2 : 07 ED 00 77 19 01 80 60 7A 0F 05 00 04 01 88 83 6C 0F 2A 16 
        PawnOwner = PlayerOwner.Pawn;                                           //00D6 : 0F 01 08 60 7A 0F 19 01 80 60 7A 0F 05 00 04 01 88 83 6C 0F 
      } else {                                                                  //00EA : 06 F4 00 
        PawnOwner = None;                                                       //00ED : 0F 01 08 60 7A 0F 2A 
      }
    }
    //0F 01 80 60 7A 0F 2E 58 34 C2 00 01 B0 9F 6C 0F 07 2B 00 72 01 80 60 7A 0F 2A 16 0F 01 F8 94 7A 
    //0F 2A 0F 01 08 60 7A 0F 2A 04 0B 07 5F 00 77 19 01 80 60 7A 0F 05 00 04 01 28 25 71 0F 2A 16 0F 
    //01 F8 94 7A 0F 19 19 01 80 60 7A 0F 05 00 04 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 06 66 00 0F 
    //01 F8 94 7A 0F 2A 07 C2 00 82 77 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 2A 16 
    //18 23 00 B1 19 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 06 00 04 1B 12 10 00 00 
    //16 39 3F 25 16 16 0F 01 08 60 7A 0F 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 06 
    //F4 00 07 ED 00 77 19 01 80 60 7A 0F 05 00 04 01 88 83 6C 0F 2A 16 0F 01 08 60 7A 0F 19 01 80 60 
    //7A 0F 05 00 04 01 88 83 6C 0F 06 F4 00 0F 01 08 60 7A 0F 2A 04 0B 47 
  }


  simulated function DrawTypingPrompt(Canvas C,string Text,optional int pos) {
    local float XPos;
    local float YPos;
    local float XL;
    local float YL;
    C.Font = GetConsoleFont(C);                                                 //0000 : 0F 19 00 20 96 7A 0F 05 00 04 01 F0 26 77 0F 1B FB 2A 00 00 00 20 96 7A 0F 16 
    C.Style = 5;                                                                //001A : 0F 19 00 20 96 7A 0F 05 00 01 01 60 04 6C 0F 24 05 
    C.DrawColor = ConsoleColor;                                                 //002B : 0F 19 00 20 96 7A 0F 05 00 04 01 90 96 6C 0F 01 60 8F 7A 0F 
    C.TextSize("A",XL,YL);                                                      //003F : 19 00 20 96 7A 0F 10 00 00 61 D6 1F 41 00 00 98 96 7A 0F 00 10 97 7A 0F 16 
    XPos = ConsoleMessagePosX * HudCanvasScale * C.SizeX + (1.00000000 - HudCanvasScale) * 0.50000000 * C.SizeX;//0058 : 0F 00 88 97 7A 0F AE AB AB 01 80 8D 7A 0F 01 F8 8D 7A 0F 16 39 3F 19 00 20 96 7A 0F 05 00 04 01 78 12 77 0F 16 AB AB AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 3F 16 39 3F 19 00 20 96 7A 0F 05 00 04 01 78 12 77 0F 16 16 
    YPos = ConsoleMessagePosY * HudCanvasScale * C.SizeY + (1.00000000 - HudCanvasScale) * 0.50000000 * C.SizeY - YL;//00A3 : 0F 00 00 98 7A 0F AF AE AB AB 01 E8 8E 7A 0F 01 F8 8D 7A 0F 16 39 3F 19 00 20 96 7A 0F 05 00 04 01 68 13 77 0F 16 AB AB AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 3F 16 39 3F 19 00 20 96 7A 0F 05 00 04 01 68 13 77 0F 16 16 00 10 97 7A 0F 16 
    C.SetPos(XPos,YPos);                                                        //00F5 : 19 00 20 96 7A 0F 10 00 00 1C 80 90 6C 0F 00 88 97 7A 0F 00 00 98 7A 0F 16 
    C.DrawTextClipped("(>" @ Left(Text,pos) $ Chr(4)
      $ Eval(pos < Len(Text),Mid(Text,pos),"_"),True);//010E : 19 00 20 96 7A 0F 3D 00 00 61 D5 70 70 A8 1F 28 3E 00 80 00 78 98 7A 0F 00 F0 98 7A 0F 16 16 EC 2C 04 16 16 CA 96 00 F0 98 7A 0F 7D 00 78 98 7A 0F 16 16 7F 00 78 98 7A 0F 00 F0 98 7A 0F 16 1F 5F 00 16 16 27 16 
    //0F 19 00 20 96 7A 0F 05 00 04 01 F0 26 77 0F 1B FB 2A 00 00 00 20 96 7A 0F 16 0F 19 00 20 96 7A 
    //0F 05 00 01 01 60 04 6C 0F 24 05 0F 19 00 20 96 7A 0F 05 00 04 01 90 96 6C 0F 01 60 8F 7A 0F 19 
    //00 20 96 7A 0F 10 00 00 61 D6 1F 41 00 00 98 96 7A 0F 00 10 97 7A 0F 16 0F 00 88 97 7A 0F AE AB 
    //AB 01 80 8D 7A 0F 01 F8 8D 7A 0F 16 39 3F 19 00 20 96 7A 0F 05 00 04 01 78 12 77 0F 16 AB AB AF 
    //1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 3F 16 39 3F 19 00 20 96 7A 0F 05 00 04 01 78 12 77 
    //0F 16 16 0F 00 00 98 7A 0F AF AE AB AB 01 E8 8E 7A 0F 01 F8 8D 7A 0F 16 39 3F 19 00 20 96 7A 0F 
    //05 00 04 01 68 13 77 0F 16 AB AB AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 3F 16 39 3F 19 
    //00 20 96 7A 0F 05 00 04 01 68 13 77 0F 16 16 00 10 97 7A 0F 16 19 00 20 96 7A 0F 10 00 00 1C 80 
    //90 6C 0F 00 88 97 7A 0F 00 00 98 7A 0F 16 19 00 20 96 7A 0F 3D 00 00 61 D5 70 70 A8 1F 28 3E 00 
    //80 00 78 98 7A 0F 00 F0 98 7A 0F 16 16 EC 2C 04 16 16 CA 96 00 F0 98 7A 0F 7D 00 78 98 7A 0F 16 
    //16 7F 00 78 98 7A 0F 00 F0 98 7A 0F 16 1F 5F 00 16 16 27 16 04 0B 47 
  }


  function bool IsInCinematic();


  function DisplayBadConnectionAlert(Canvas C);


  function bool DrawLevelAction(Canvas C);


  function DrawSpectatingHud(Canvas C);


  function DrawHUD(Canvas C);


  simulated function DisplayProgressMessages(Canvas C) {
    local int i;
    local int LineCount;
    local float FontDX;
    local float FontDY;
    local float X;
    local float Y;
    local int Alpha;
    local float TimeLeft;
    TimeLeft = PlayerOwner.ProgressTimeOut - Level.TimeSeconds;                 //0000 : 0F 00 70 A5 7A 0F AF 19 01 80 60 7A 0F 05 00 04 01 A0 42 72 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 
    if (TimeLeft >= ProgressFadeTime) {                                         //0024 : 07 3E 00 B3 00 70 A5 7A 0F 01 E8 A5 7A 0F 16 
      Alpha = 255;                                                              //0033 : 0F 00 60 A6 7A 0F 2C FF 
    } else {                                                                    //003B : 06 5C 00 
      Alpha = 255 * TimeLeft / ProgressFadeTime;                                //003E : 0F 00 60 A6 7A 0F 39 44 AC 39 3F 39 44 AB 39 3F 2C FF 00 70 A5 7A 0F 16 01 E8 A5 7A 0F 16 
    }
    LineCount = 0;                                                              //005C : 0F 00 D8 A6 7A 0F 25 
    i = 0;                                                                      //0063 : 0F 00 50 A7 7A 0F 25 
    while (i < 4) {                                                             //006A : 07 A5 00 96 00 50 A7 7A 0F 2C 04 16 
      if (PlayerOwner.ProgressMessage[i] == "") {                               //0076 : 07 94 00 7A 1A 00 50 A7 7A 0F 19 01 80 60 7A 0F 05 00 00 01 B0 41 72 0F 1F 00 16 
      } else {                                                                  //0091 : 06 9B 00 
        LineCount++;                                                            //0094 : A5 00 D8 A6 7A 0F 16 
      }
      i++;                                                                      //009B : A5 00 50 A7 7A 0F 16 
    }
    C.Font = LoadProgressFont();                                                //00A5 : 0F 19 00 48 A1 7A 0F 05 00 04 01 F0 26 77 0F 1B BE 2B 00 00 16 
    C.Style = 5;                                                                //00BA : 0F 19 00 48 A1 7A 0F 05 00 01 01 60 04 6C 0F 24 05 
    C.TextSize("A",FontDX,FontDY);                                              //00CB : 19 00 48 A1 7A 0F 10 00 00 61 D6 1F 41 00 00 C8 A7 7A 0F 00 40 A8 7A 0F 16 
    X = 0.50000000 * HudCanvasScale * C.SizeX + (1.00000000 - HudCanvasScale) / 2.00000000 * C.SizeX;//00E4 : 0F 00 B8 A8 7A 0F AE AB AB 1E 00 00 00 3F 01 F8 8D 7A 0F 16 39 3F 19 00 48 A1 7A 0F 05 00 04 01 78 12 77 0F 16 AB AC AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 40 16 39 3F 19 00 48 A1 7A 0F 05 00 04 01 78 12 77 0F 16 16 
    Y = 0.50000000 * HudCanvasScale * C.SizeY + (1.00000000 - HudCanvasScale) / 2.00000000 * C.SizeY;//012F : 0F 00 30 A9 7A 0F AE AB AB 1E 00 00 00 3F 01 F8 8D 7A 0F 16 39 3F 19 00 48 A1 7A 0F 05 00 04 01 68 13 77 0F 16 AB AC AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 40 16 39 3F 19 00 48 A1 7A 0F 05 00 04 01 68 13 77 0F 16 16 
    Y -= FontDY * LineCount / 2.00000000;                                       //017A : B9 00 30 A9 7A 0F AB 00 40 A8 7A 0F AC 39 3F 00 D8 A6 7A 0F 1E 00 00 00 40 16 16 16 
    i = 0;                                                                      //0196 : 0F 00 50 A7 7A 0F 25 
    while (i < 4) {                                                             //019D : 07 8C 02 96 00 50 A7 7A 0F 2C 04 16 
      if (PlayerOwner.ProgressMessage[i] == "") {                               //01A9 : 07 C7 01 7A 1A 00 50 A7 7A 0F 19 01 80 60 7A 0F 05 00 00 01 B0 41 72 0F 1F 00 16 
      } else {                                                                  //01C4 : 06 82 02 
        C.DrawColor = PlayerOwner.ProgressColor[i];                             //01C7 : 0F 19 00 48 A1 7A 0F 05 00 04 01 90 96 6C 0F 1A 00 50 A7 7A 0F 19 01 80 60 7A 0F 05 00 10 01 28 42 72 0F 
        C.DrawColor.A = Alpha;                                                  //01EA : 0F 36 48 91 6A 0F 19 00 48 A1 7A 0F 05 00 04 01 90 96 6C 0F 39 3D 00 60 A6 7A 0F 
        C.TextSize(PlayerOwner.ProgressMessage[i],FontDX,FontDY);               //0205 : 19 00 48 A1 7A 0F 21 00 00 61 D6 1A 00 50 A7 7A 0F 19 01 80 60 7A 0F 05 00 00 01 B0 41 72 0F 00 C8 A7 7A 0F 00 40 A8 7A 0F 16 
        C.SetPos(X - FontDX / 2.00000000,Y);                                    //022F : 19 00 48 A1 7A 0F 1E 00 00 1C 80 90 6C 0F AF 00 B8 A8 7A 0F AC 00 C8 A7 7A 0F 1E 00 00 00 40 16 16 00 30 A9 7A 0F 16 
        C.DrawText(PlayerOwner.ProgressMessage[i]);                             //0256 : 19 00 48 A1 7A 0F 17 00 00 61 D1 1A 00 50 A7 7A 0F 19 01 80 60 7A 0F 05 00 00 01 B0 41 72 0F 16 
        Y += FontDY;                                                            //0276 : B8 00 30 A9 7A 0F 00 40 A8 7A 0F 16 
      }
      i++;                                                                      //0282 : A5 00 50 A7 7A 0F 16 
    }
    //0F 00 70 A5 7A 0F AF 19 01 80 60 7A 0F 05 00 04 01 A0 42 72 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 
    //81 6C 0F 16 07 3E 00 B3 00 70 A5 7A 0F 01 E8 A5 7A 0F 16 0F 00 60 A6 7A 0F 2C FF 06 5C 00 0F 00 
    //60 A6 7A 0F 39 44 AC 39 3F 39 44 AB 39 3F 2C FF 00 70 A5 7A 0F 16 01 E8 A5 7A 0F 16 0F 00 D8 A6 
    //7A 0F 25 0F 00 50 A7 7A 0F 25 07 A5 00 96 00 50 A7 7A 0F 2C 04 16 07 94 00 7A 1A 00 50 A7 7A 0F 
    //19 01 80 60 7A 0F 05 00 00 01 B0 41 72 0F 1F 00 16 06 9B 00 A5 00 D8 A6 7A 0F 16 A5 00 50 A7 7A 
    //0F 16 06 6A 00 0F 19 00 48 A1 7A 0F 05 00 04 01 F0 26 77 0F 1B BE 2B 00 00 16 0F 19 00 48 A1 7A 
    //0F 05 00 01 01 60 04 6C 0F 24 05 19 00 48 A1 7A 0F 10 00 00 61 D6 1F 41 00 00 C8 A7 7A 0F 00 40 
    //A8 7A 0F 16 0F 00 B8 A8 7A 0F AE AB AB 1E 00 00 00 3F 01 F8 8D 7A 0F 16 39 3F 19 00 48 A1 7A 0F 
    //05 00 04 01 78 12 77 0F 16 AB AC AF 1E 00 00 80 3F 01 F8 8D 7A 0F 16 1E 00 00 00 40 16 39 3F 19 
    //00 48 A1 7A 0F 05 00 04 01 78 12 77 0F 16 16 0F 00 30 A9 7A 0F AE AB AB 1E 00 00 00 3F 01 F8 8D 
    //7A 0F 16 39 3F 19 00 48 A1 7A 0F 05 00 04 01 68 13 77 0F 16 AB AC AF 1E 00 00 80 3F 01 F8 8D 7A 
    //0F 16 1E 00 00 00 40 16 39 3F 19 00 48 A1 7A 0F 05 00 04 01 68 13 77 0F 16 16 B9 00 30 A9 7A 0F 
    //AB 00 40 A8 7A 0F AC 39 3F 00 D8 A6 7A 0F 1E 00 00 00 40 16 16 16 0F 00 50 A7 7A 0F 25 07 8C 02 
    //96 00 50 A7 7A 0F 2C 04 16 07 C7 01 7A 1A 00 50 A7 7A 0F 19 01 80 60 7A 0F 05 00 00 01 B0 41 72 
    //0F 1F 00 16 06 82 02 0F 19 00 48 A1 7A 0F 05 00 04 01 90 96 6C 0F 1A 00 50 A7 7A 0F 19 01 80 60 
    //7A 0F 05 00 10 01 28 42 72 0F 0F 36 48 91 6A 0F 19 00 48 A1 7A 0F 05 00 04 01 90 96 6C 0F 39 3D 
    //00 60 A6 7A 0F 19 00 48 A1 7A 0F 21 00 00 61 D6 1A 00 50 A7 7A 0F 19 01 80 60 7A 0F 05 00 00 01 
    //B0 41 72 0F 00 C8 A7 7A 0F 00 40 A8 7A 0F 16 19 00 48 A1 7A 0F 1E 00 00 1C 80 90 6C 0F AF 00 B8 
    //A8 7A 0F AC 00 C8 A7 7A 0F 1E 00 00 00 40 16 16 00 30 A9 7A 0F 16 19 00 48 A1 7A 0F 17 00 00 61 
    //D1 1A 00 50 A7 7A 0F 19 01 80 60 7A 0F 05 00 00 01 B0 41 72 0F 16 B8 00 30 A9 7A 0F 00 40 A8 7A 
    //0F 16 A5 00 50 A7 7A 0F 16 06 9D 01 04 0B 47 
  }


  simulated function DrawRoute() {
    local int i;
    local Controller C;
    local Vector Start;
    local Vector End;
    local Vector RealStart;
    local bool bPath;
    C = Pawn(PlayerOwner.ViewTarget).Controller;                                //0000 : 0F 00 78 B0 7A 0F 19 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 05 00 04 01 00 6E 6C 0F 
    if (C == None) {                                                            //0022 : 07 2F 00 72 00 78 B0 7A 0F 2A 16 
      return;                                                                   //002D : 04 0B 
    }
    if (C.CurrentPath != None) {                                                //002F : 07 6C 00 77 19 00 78 B0 7A 0F 05 00 04 01 B8 B4 70 0F 2A 16 
      Start = C.CurrentPath.Start.Location;                                     //0043 : 0F 00 F0 B0 7A 0F 19 19 19 00 78 B0 7A 0F 05 00 04 01 B8 B4 70 0F 05 00 04 01 58 18 7A 0F 05 00 0C 01 30 81 6C 0F 
    } else {                                                                    //0069 : 06 89 00 
      Start = PlayerOwner.ViewTarget.Location;                                  //006C : 0F 00 F0 B0 7A 0F 19 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F 
    }
    RealStart = Start;                                                          //0089 : 0F 00 68 B1 7A 0F 00 F0 B0 7A 0F 
    if (C.bAdjusting) {                                                         //0094 : 07 FE 00 19 00 78 B0 7A 0F 06 00 04 2D 01 F8 B0 70 0F 
      Draw3DLine(C.Pawn.Location,C.AdjustLoc,Class'Canvas'.static.MakeColor(255,0,255));//00A6 : 1C E0 B1 7A 0F 19 19 00 78 B0 7A 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 00 78 B0 7A 0F 05 00 0C 01 90 F4 70 0F 12 20 88 EE C2 00 10 00 04 1C 88 EB 76 0F 39 3D 2C FF 24 00 39 3D 2C FF 16 16 
      Start = C.AdjustLoc;                                                      //00EA : 0F 00 F0 B0 7A 0F 19 00 78 B0 7A 0F 05 00 0C 01 90 F4 70 0F 
    }
    if (C == PlayerOwner
      || C.MoveTarget == C.RouteCache[0]
      && C.MoveTarget != None) {//00FE : 07 DC 02 84 72 00 78 B0 7A 0F 01 80 60 7A 0F 16 18 37 00 82 72 19 00 78 B0 7A 0F 05 00 04 01 C8 B3 70 0F 1A 25 19 00 78 B0 7A 0F 05 00 40 01 80 03 71 0F 16 18 12 00 77 19 00 78 B0 7A 0F 05 00 04 01 C8 B3 70 0F 2A 16 16 16 
      if (C == PlayerOwner
        && C.Destination != vect(0.000000, 0.000000, 0.000000)) {//0148 : 07 F8 01 82 72 00 78 B0 7A 0F 01 80 60 7A 0F 16 18 1E 00 DA 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 16 
        if (C.PointReachable(C.Destination)) {                                  //0179 : 07 DE 01 19 00 78 B0 7A 0F 11 00 04 62 09 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 16 
          Draw3DLine(C.Pawn.Location,C.Destination,Class'Canvas'.static.MakeColor(255,255,255));//0196 : 1C E0 B1 7A 0F 19 19 00 78 B0 7A 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 12 20 88 EE C2 00 12 00 04 1C 88 EB 76 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 16 
          return;                                                               //01DC : 04 0B 
        }
        C.FindPathTo(C.Destination);                                            //01DE : 19 00 78 B0 7A 0F 11 00 04 62 06 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 16 
      }
      i = 0;                                                                    //01F8 : 0F 00 58 AA 7A 0F 25 
      while (i < 16) {                                                          //01FF : 07 9C 02 96 00 58 AA 7A 0F 2C 10 16 
        if (C.RouteCache[i] == None) {                                          //020B : 07 28 02 72 1A 00 58 AA 7A 0F 19 00 78 B0 7A 0F 05 00 40 01 80 03 71 0F 2A 16 
          goto jl029C;                                                          //0225 : 06 9C 02 
        }
        bPath = True;                                                           //0228 : 14 2D 00 90 B2 7A 0F 27 
        Draw3DLine(Start,C.RouteCache[i].Location,Class'Canvas'.static.MakeColor(0,255,0));//0230 : 1C E0 B1 7A 0F 00 F0 B0 7A 0F 19 1A 00 58 AA 7A 0F 19 00 78 B0 7A 0F 05 00 40 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 12 20 88 EE C2 00 0E 00 04 1C 88 EB 76 0F 24 00 39 3D 2C FF 24 00 16 16 
        Start = C.RouteCache[i].Location;                                       //026F : 0F 00 F0 B0 7A 0F 19 1A 00 58 AA 7A 0F 19 00 78 B0 7A 0F 05 00 40 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 
        i++;                                                                    //0292 : A5 00 58 AA 7A 0F 16 
      }
      if (bPath) {                                                              //029C : 07 D9 02 2D 00 90 B2 7A 0F 
        Draw3DLine(RealStart,C.Destination,Class'Canvas'.static.MakeColor(255,255,255));//02A5 : 1C E0 B1 7A 0F 00 68 B1 7A 0F 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 12 20 88 EE C2 00 12 00 04 1C 88 EB 76 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 16 
      }
      goto jl0339;                                                              //02D9 : 06 39 03 
    }
    if (PlayerOwner.ViewTarget.Velocity != vect(0.000000, 0.000000, 0.000000)) {//02DC : 07 39 03 DA 19 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      Draw3DLine(RealStart,C.Destination,Class'Canvas'.static.MakeColor(255,255,255));//0305 : 1C E0 B1 7A 0F 00 68 B1 7A 0F 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 12 20 88 EE C2 00 12 00 04 1C 88 EB 76 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 16 
    }
    if (C == PlayerOwner) {                                                     //0339 : 07 4A 03 72 00 78 B0 7A 0F 01 80 60 7A 0F 16 
      return;                                                                   //0348 : 04 0B 
    }
    if (C.Focus != None) {                                                      //034A : 07 7E 03 77 19 00 78 B0 7A 0F 05 00 04 01 A0 F8 70 0F 2A 16 
      End = C.Focus.Location;                                                   //035E : 0F 00 08 B3 7A 0F 19 19 00 78 B0 7A 0F 05 00 04 01 A0 F8 70 0F 05 00 0C 01 30 81 6C 0F 
    } else {                                                                    //037B : 06 92 03 
      End = C.FocalPoint;                                                       //037E : 0F 00 08 B3 7A 0F 19 00 78 B0 7A 0F 05 00 0C 01 E0 F7 70 0F 
    }
    Draw3DLine(PlayerOwner.ViewTarget.Location + Pawn(PlayerOwner.ViewTarget).BaseEyeHeight * vect(0.000000, 0.000000, 1.000000),End,Class'Canvas'.static.MakeColor(255,0,0));//0392 : 1C E0 B1 7A 0F D7 19 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F D5 19 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 05 00 04 01 10 BA 75 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 00 08 B3 7A 0F 12 20 88 EE C2 00 0E 00 04 1C 88 EB 76 0F 39 3D 2C FF 24 00 24 00 16 16 
    //0F 00 78 B0 7A 0F 19 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 05 00 04 01 00 6E 
    //6C 0F 07 2F 00 72 00 78 B0 7A 0F 2A 16 04 0B 07 6C 00 77 19 00 78 B0 7A 0F 05 00 04 01 B8 B4 70 
    //0F 2A 16 0F 00 F0 B0 7A 0F 19 19 19 00 78 B0 7A 0F 05 00 04 01 B8 B4 70 0F 05 00 04 01 58 18 7A 
    //0F 05 00 0C 01 30 81 6C 0F 06 89 00 0F 00 F0 B0 7A 0F 19 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 
    //0F 05 00 0C 01 30 81 6C 0F 0F 00 68 B1 7A 0F 00 F0 B0 7A 0F 07 FE 00 19 00 78 B0 7A 0F 06 00 04 
    //2D 01 F8 B0 70 0F 1C E0 B1 7A 0F 19 19 00 78 B0 7A 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 
    //6C 0F 19 00 78 B0 7A 0F 05 00 0C 01 90 F4 70 0F 12 20 88 EE C2 00 10 00 04 1C 88 EB 76 0F 39 3D 
    //2C FF 24 00 39 3D 2C FF 16 16 0F 00 F0 B0 7A 0F 19 00 78 B0 7A 0F 05 00 0C 01 90 F4 70 0F 07 DC 
    //02 84 72 00 78 B0 7A 0F 01 80 60 7A 0F 16 18 37 00 82 72 19 00 78 B0 7A 0F 05 00 04 01 C8 B3 70 
    //0F 1A 25 19 00 78 B0 7A 0F 05 00 40 01 80 03 71 0F 16 18 12 00 77 19 00 78 B0 7A 0F 05 00 04 01 
    //C8 B3 70 0F 2A 16 16 16 07 F8 01 82 72 00 78 B0 7A 0F 01 80 60 7A 0F 16 18 1E 00 DA 19 00 78 B0 
    //7A 0F 05 00 0C 01 20 F7 70 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 16 16 07 DE 01 19 00 78 B0 
    //7A 0F 11 00 04 62 09 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 16 1C E0 B1 7A 0F 19 19 00 78 B0 
    //7A 0F 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 
    //12 20 88 EE C2 00 12 00 04 1C 88 EB 76 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 16 04 0B 19 00 
    //78 B0 7A 0F 11 00 04 62 06 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 16 0F 00 58 AA 7A 0F 25 07 
    //9C 02 96 00 58 AA 7A 0F 2C 10 16 07 28 02 72 1A 00 58 AA 7A 0F 19 00 78 B0 7A 0F 05 00 40 01 80 
    //03 71 0F 2A 16 06 9C 02 14 2D 00 90 B2 7A 0F 27 1C E0 B1 7A 0F 00 F0 B0 7A 0F 19 1A 00 58 AA 7A 
    //0F 19 00 78 B0 7A 0F 05 00 40 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F 12 20 88 EE C2 00 0E 00 04 
    //1C 88 EB 76 0F 24 00 39 3D 2C FF 24 00 16 16 0F 00 F0 B0 7A 0F 19 1A 00 58 AA 7A 0F 19 00 78 B0 
    //7A 0F 05 00 40 01 80 03 71 0F 05 00 0C 01 30 81 6C 0F A5 00 58 AA 7A 0F 16 06 FF 01 07 D9 02 2D 
    //00 90 B2 7A 0F 1C E0 B1 7A 0F 00 68 B1 7A 0F 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 12 20 88 
    //EE C2 00 12 00 04 1C 88 EB 76 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 16 06 39 03 07 39 03 DA 
    //19 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 
    //00 00 00 00 16 1C E0 B1 7A 0F 00 68 B1 7A 0F 19 00 78 B0 7A 0F 05 00 0C 01 20 F7 70 0F 12 20 88 
    //EE C2 00 12 00 04 1C 88 EB 76 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 16 07 4A 03 72 00 78 B0 
    //7A 0F 01 80 60 7A 0F 16 04 0B 07 7E 03 77 19 00 78 B0 7A 0F 05 00 04 01 A0 F8 70 0F 2A 16 0F 00 
    //08 B3 7A 0F 19 19 00 78 B0 7A 0F 05 00 04 01 A0 F8 70 0F 05 00 0C 01 30 81 6C 0F 06 92 03 0F 00 
    //08 B3 7A 0F 19 00 78 B0 7A 0F 05 00 0C 01 E0 F7 70 0F 1C E0 B1 7A 0F D7 19 19 01 80 60 7A 0F 05 
    //00 04 01 10 83 6C 0F 05 00 0C 01 30 81 6C 0F D5 19 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 
    //10 83 6C 0F 05 00 04 01 10 BA 75 0F 23 00 00 00 00 00 00 00 00 00 00 80 3F 16 16 00 08 B3 7A 0F 
    //12 20 88 EE C2 00 0E 00 04 1C 88 EB 76 0F 39 3D 2C FF 24 00 24 00 16 16 04 0B 47 
  }


  function CanvasDrawActors(Canvas C,bool bClearedZBuffer) {
    //04 0B 47 
  }


  simulated function SetInstructionKeyText(string Text);


  simulated function SetInstructionText(string Text);


  simulated function DrawInstructionGfx(Canvas C);


  simulated function DrawCinematicHUD(Canvas C) {
    local int i;
    if (!bHideHUD) {                                                            //0000 : 07 0D 00 81 2D 01 10 BB 7A 0F 16 
      return;                                                                   //000B : 04 0B 
    }
    i = 0;                                                                      //000D : 0F 00 88 BB 7A 0F 25 
    while (i < Overlays.Length) {                                               //0014 : 07 48 00 96 00 88 BB 7A 0F 37 01 90 B5 78 0F 16 
      Overlays[i].Render(C);                                                    //0024 : 19 10 00 88 BB 7A 0F 01 90 B5 78 0F 0B 00 00 1B F6 12 00 00 00 08 BA 7A 0F 16 
      i++;                                                                      //003E : A5 00 88 BB 7A 0F 16 
    }
    //07 0D 00 81 2D 01 10 BB 7A 0F 16 04 0B 0F 00 88 BB 7A 0F 25 07 48 00 96 00 88 BB 7A 0F 37 01 90 
    //B5 78 0F 16 19 10 00 88 BB 7A 0F 01 90 B5 78 0F 0B 00 00 1B F6 12 00 00 00 08 BA 7A 0F 16 A5 00 
    //88 BB 7A 0F 16 06 14 00 04 0B 47 
  }


  simulated event PostRender(Canvas Canvas) {
    local float XPos;
    local float YPos;
    local Plane OldModulate;
    local Color OldColor;
    local int i;
    OldModulate = Canvas.ColorModulate;                                         //0000 : 0F 00 80 C2 7A 0F 19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F 
    OldColor = Canvas.DrawColor;                                                //0014 : 0F 00 F8 C2 7A 0F 19 00 B0 BC 7A 0F 05 00 04 01 90 96 6C 0F 
    Canvas.ColorModulate.X = 1.00000000;                                        //0028 : 0F 36 48 C4 69 0F 19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F 1E 00 00 80 3F 
    Canvas.ColorModulate.Y = 1.00000000;                                        //0041 : 0F 36 C0 C4 69 0F 19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F 1E 00 00 80 3F 
    Canvas.ColorModulate.Z = 1.00000000;                                        //005A : 0F 36 38 C5 69 0F 19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F 1E 00 00 80 3F 
    Canvas.ColorModulate.W = HudOpacity / 255;                                  //0073 : 0F 36 48 C9 6B 0F 19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F AC 01 70 C3 7A 0F 39 3F 2C FF 16 
    LinkActors();                                                               //0092 : 1B 7B 2B 00 00 16 
    ResScaleX = Canvas.SizeX / 640.00000000;                                    //0098 : 0F 01 E8 C3 7A 0F AC 39 3F 19 00 B0 BC 7A 0F 05 00 04 01 78 12 77 0F 1E 00 00 20 44 16 
    ResScaleY = Canvas.SizeY / 480.00000000;                                    //00B5 : 0F 01 60 C4 7A 0F AC 39 3F 19 00 B0 BC 7A 0F 05 00 04 01 68 13 77 0F 1E 00 00 F0 43 16 
    if (PawnOwner != None) {                                                    //00D2 : 07 0C 01 77 01 08 60 7A 0F 2A 16 
      if (!PlayerOwner.bBehindView) {                                           //00DD : 07 00 01 81 19 01 80 60 7A 0F 06 00 04 2D 01 A0 54 71 0F 16 
        CanvasDrawActors(Canvas,False);                                         //00F1 : 1B 7A 2B 00 00 00 B0 BC 7A 0F 28 16 
      } else {                                                                  //00FD : 06 0C 01 
        CanvasDrawActors(Canvas,False);                                         //0100 : 1B 7A 2B 00 00 00 B0 BC 7A 0F 28 16 
      }
    }
    if (PawnOwner != None && PawnOwner.bSpecialHUD) {                           //010C : 07 3F 01 82 77 01 08 60 7A 0F 2A 16 18 10 00 19 01 08 60 7A 0F 06 00 04 2D 01 E0 92 76 0F 16 
      PawnOwner.DrawHUD(Canvas);                                                //012B : 19 01 08 60 7A 0F 0B 00 00 1B 00 2B 00 00 00 B0 BC 7A 0F 16 
    }
    if (bShowDebugInfo) {                                                       //013F : 07 9B 02 2D 01 D8 C4 7A 0F 
      Canvas.Font = GetConsoleFont(Canvas);                                     //0148 : 0F 19 00 B0 BC 7A 0F 05 00 04 01 F0 26 77 0F 1B FB 2A 00 00 00 B0 BC 7A 0F 16 
      Canvas.Style = 5;                                                         //0162 : 0F 19 00 B0 BC 7A 0F 05 00 01 01 60 04 6C 0F 24 05 
      Canvas.DrawColor = ConsoleColor;                                          //0173 : 0F 19 00 B0 BC 7A 0F 05 00 04 01 90 96 6C 0F 01 60 8F 7A 0F 
      PlayerOwner.ViewTarget.DisplayDebug(Canvas,XPos,YPos);                    //0187 : 19 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 15 00 00 1B 94 2A 00 00 00 B0 BC 7A 0F 00 50 C5 7A 0F 00 C8 C5 7A 0F 16 
      if (PlayerOwner.ViewTarget != PlayerOwner
        && (Pawn(PlayerOwner.ViewTarget) == None
        || Pawn(PlayerOwner.ViewTarget).Controller == None)) {//01AE : 07 98 02 82 77 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 01 80 60 7A 0F 16 18 3B 00 84 72 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 2A 16 18 20 00 72 19 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 16 
        YPos += XPos * 2;                                                       //0205 : B8 00 C8 C5 7A 0F AB 00 50 C5 7A 0F 39 3F 2C 02 16 16 
        Canvas.SetPos(4.00000000,YPos);                                         //0217 : 19 00 B0 BC 7A 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 C8 C5 7A 0F 16 
        Canvas.DrawText("----- VIEWER INFO -----");                             //0230 : 19 00 B0 BC 7A 0F 1C 00 00 61 D1 1F 2D 2D 2D 2D 2D 20 56 49 45 57 45 52 20 49 4E 46 4F 20 2D 2D 2D 2D 2D 00 16 
        YPos += XPos;                                                           //0255 : B8 00 C8 C5 7A 0F 00 50 C5 7A 0F 16 
        Canvas.SetPos(4.00000000,YPos);                                         //0261 : 19 00 B0 BC 7A 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 C8 C5 7A 0F 16 
        PlayerOwner.DisplayDebug(Canvas,XPos,YPos);                             //027A : 19 01 80 60 7A 0F 15 00 00 1B 94 2A 00 00 00 B0 BC 7A 0F 00 50 C5 7A 0F 00 C8 C5 7A 0F 16 
      }
    } else {                                                                    //0298 : 06 24 03 
      if (!bHideHUD) {                                                          //029B : 07 0E 03 81 2D 01 10 BB 7A 0F 16 
        if (!PawnOwner.bHideRegularHUD) {                                       //02A6 : 07 C5 02 81 19 01 08 60 7A 0F 06 00 04 2D 01 90 91 76 0F 16 
          DrawHUD(Canvas);                                                      //02BA : 1B 00 2B 00 00 00 B0 BC 7A 0F 16 
        }
        i = 0;                                                                  //02C5 : 0F 00 40 C6 7A 0F 25 
        while (i < Overlays.Length) {                                           //02CC : 07 00 03 96 00 40 C6 7A 0F 37 01 90 B5 78 0F 16 
          Overlays[i].Render(Canvas);                                           //02DC : 19 10 00 40 C6 7A 0F 01 90 B5 78 0F 0B 00 00 1B F6 12 00 00 00 B0 BC 7A 0F 16 
          i++;                                                                  //02F6 : A5 00 40 C6 7A 0F 16 
        }
        DisplayMessages(Canvas);                                                //0300 : 1B BB 2B 00 00 00 B0 BC 7A 0F 16 
      } else {                                                                  //030B : 06 24 03 
        if (PawnOwner != None) {                                                //030E : 07 24 03 77 01 08 60 7A 0F 2A 16 
          DrawInstructionGfx(Canvas);                                           //0319 : 1B B3 2B 00 00 00 B0 BC 7A 0F 16 
        }
      }
    }
    PlayerOwner.RenderOverlays(Canvas);                                         //0324 : 19 01 80 60 7A 0F 0B 00 00 1B 29 2B 00 00 00 B0 BC 7A 0F 16 
    if (PlayerOwner.IsViewingCinematic()) {                                     //0338 : 07 55 03 19 01 80 60 7A 0F 06 00 04 1B 1F 0D 00 00 16 
      DrawCinematicHUD(Canvas);                                                 //034A : 1B B2 2B 00 00 00 B0 BC 7A 0F 16 
    }
    if (PlayerConsole != None && PlayerConsole.bTyping) {                       //0355 : 07 9B 03 82 77 01 F8 94 7A 0F 2A 16 18 10 00 19 01 F8 94 7A 0F 06 00 04 2D 01 B8 C6 7A 0F 16 
      DrawTypingPrompt(Canvas,PlayerConsole.TypedStr,PlayerConsole.TypedStrPos);//0374 : 1B B8 2B 00 00 00 B0 BC 7A 0F 19 01 F8 94 7A 0F 05 00 00 01 30 C7 7A 0F 19 01 F8 94 7A 0F 05 00 04 01 A8 C7 7A 0F 16 
    }
    Canvas.ColorModulate = OldModulate;                                         //039B : 0F 19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F 00 80 C2 7A 0F 
    Canvas.DrawColor = OldColor;                                                //03AF : 0F 19 00 B0 BC 7A 0F 05 00 04 01 90 96 6C 0F 00 F8 C2 7A 0F 
    //0F 00 80 C2 7A 0F 19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F 0F 00 F8 C2 7A 0F 19 00 B0 BC 7A 0F 
    //05 00 04 01 90 96 6C 0F 0F 36 48 C4 69 0F 19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F 1E 00 00 80 
    //3F 0F 36 C0 C4 69 0F 19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F 1E 00 00 80 3F 0F 36 38 C5 69 0F 
    //19 00 B0 BC 7A 0F 05 00 10 01 28 2B 77 0F 1E 00 00 80 3F 0F 36 48 C9 6B 0F 19 00 B0 BC 7A 0F 05 
    //00 10 01 28 2B 77 0F AC 01 70 C3 7A 0F 39 3F 2C FF 16 1B 7B 2B 00 00 16 0F 01 E8 C3 7A 0F AC 39 
    //3F 19 00 B0 BC 7A 0F 05 00 04 01 78 12 77 0F 1E 00 00 20 44 16 0F 01 60 C4 7A 0F AC 39 3F 19 00 
    //B0 BC 7A 0F 05 00 04 01 68 13 77 0F 1E 00 00 F0 43 16 07 0C 01 77 01 08 60 7A 0F 2A 16 07 00 01 
    //81 19 01 80 60 7A 0F 06 00 04 2D 01 A0 54 71 0F 16 1B 7A 2B 00 00 00 B0 BC 7A 0F 28 16 06 0C 01 
    //1B 7A 2B 00 00 00 B0 BC 7A 0F 28 16 07 3F 01 82 77 01 08 60 7A 0F 2A 16 18 10 00 19 01 08 60 7A 
    //0F 06 00 04 2D 01 E0 92 76 0F 16 19 01 08 60 7A 0F 0B 00 00 1B 00 2B 00 00 00 B0 BC 7A 0F 16 07 
    //9B 02 2D 01 D8 C4 7A 0F 0F 19 00 B0 BC 7A 0F 05 00 04 01 F0 26 77 0F 1B FB 2A 00 00 00 B0 BC 7A 
    //0F 16 0F 19 00 B0 BC 7A 0F 05 00 01 01 60 04 6C 0F 24 05 0F 19 00 B0 BC 7A 0F 05 00 04 01 90 96 
    //6C 0F 01 60 8F 7A 0F 19 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 15 00 00 1B 94 2A 00 00 00 B0 
    //BC 7A 0F 00 50 C5 7A 0F 00 C8 C5 7A 0F 16 07 98 02 82 77 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 
    //0F 01 80 60 7A 0F 16 18 3B 00 84 72 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 2A 
    //16 18 20 00 72 19 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 05 00 04 01 00 6E 6C 
    //0F 2A 16 16 16 B8 00 C8 C5 7A 0F AB 00 50 C5 7A 0F 39 3F 2C 02 16 16 19 00 B0 BC 7A 0F 10 00 00 
    //1C 80 90 6C 0F 1E 00 00 80 40 00 C8 C5 7A 0F 16 19 00 B0 BC 7A 0F 1C 00 00 61 D1 1F 2D 2D 2D 2D 
    //2D 20 56 49 45 57 45 52 20 49 4E 46 4F 20 2D 2D 2D 2D 2D 00 16 B8 00 C8 C5 7A 0F 00 50 C5 7A 0F 
    //16 19 00 B0 BC 7A 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 C8 C5 7A 0F 16 19 01 80 60 7A 0F 
    //15 00 00 1B 94 2A 00 00 00 B0 BC 7A 0F 00 50 C5 7A 0F 00 C8 C5 7A 0F 16 06 24 03 07 0E 03 81 2D 
    //01 10 BB 7A 0F 16 07 C5 02 81 19 01 08 60 7A 0F 06 00 04 2D 01 90 91 76 0F 16 1B 00 2B 00 00 00 
    //B0 BC 7A 0F 16 0F 00 40 C6 7A 0F 25 07 00 03 96 00 40 C6 7A 0F 37 01 90 B5 78 0F 16 19 10 00 40 
    //C6 7A 0F 01 90 B5 78 0F 0B 00 00 1B F6 12 00 00 00 B0 BC 7A 0F 16 A5 00 40 C6 7A 0F 16 06 CC 02 
    //1B BB 2B 00 00 00 B0 BC 7A 0F 16 06 24 03 07 24 03 77 01 08 60 7A 0F 2A 16 1B B3 2B 00 00 00 B0 
    //BC 7A 0F 16 19 01 80 60 7A 0F 0B 00 00 1B 29 2B 00 00 00 B0 BC 7A 0F 16 07 55 03 19 01 80 60 7A 
    //0F 06 00 04 1B 1F 0D 00 00 16 1B B2 2B 00 00 00 B0 BC 7A 0F 16 07 9B 03 82 77 01 F8 94 7A 0F 2A 
    //16 18 10 00 19 01 F8 94 7A 0F 06 00 04 2D 01 B8 C6 7A 0F 16 1B B8 2B 00 00 00 B0 BC 7A 0F 19 01 
    //F8 94 7A 0F 05 00 00 01 30 C7 7A 0F 19 01 F8 94 7A 0F 05 00 04 01 A8 C7 7A 0F 16 0F 19 00 B0 BC 
    //7A 0F 05 00 10 01 28 2B 77 0F 00 80 C2 7A 0F 0F 19 00 B0 BC 7A 0F 05 00 04 01 90 96 6C 0F 00 F8 
    //C2 7A 0F 04 0B 47 
  }


  function GetLocalStatsScreen();


  simulated event WorldSpaceOverlays() {
    if (bShowDebugInfo
      && Pawn(PlayerOwner.ViewTarget) != None) {         //0000 : 07 2A 00 82 2D 01 D8 C4 7A 0F 18 17 00 77 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 0F 2A 16 16 
      DrawRoute();                                                              //0024 : 1B B7 2B 00 00 16 
    }
    //07 2A 00 82 2D 01 D8 C4 7A 0F 18 17 00 77 2E 50 31 D4 00 19 01 80 60 7A 0F 05 00 04 01 10 83 6C 
    //0F 2A 16 16 1B B7 2B 00 00 16 04 0B 47 
  }


  simulated event Destroyed() {
    Super.Destroyed();                                                          //0000 : 1C 30 8A 6D 0F 16 
    //1C 30 8A 6D 0F 16 04 0B 47 
  }


  simulated function CreateKeyMenus();


  function Reset() {
    Super.Reset();                                                              //0000 : 1C A8 B4 34 0F 16 
    //1C A8 B4 34 0F 16 04 0B 47 
  }


  simulated event PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C D0 02 38 0F 16 
    LinkActors();                                                               //0006 : 1B 7B 2B 00 00 16 
    CreateKeyMenus();                                                           //000C : 1B B0 2B 00 00 16 
    foreach AllActors(Class'SceneSubtitles',SubTitles) {                        //0012 : 2F 61 30 20 A0 46 BD 00 01 D0 CD 7A 0F 16 26 00 
      goto jl0026;                                                              //0022 : 06 26 00 
    }
    //1C D0 02 38 0F 16 1B 7B 2B 00 00 16 1B B0 2B 00 00 16 2F 61 30 20 A0 46 BD 00 01 D0 CD 7A 0F 16 
    //26 00 06 26 00 31 30 04 0B 47 
  }


  final static native function StaticDrawCanvasLine(Canvas C,float X1,float Y1,float X2,float Y2,Color LineColor);


  final native function DrawCanvasLine(float X1,float Y1,float X2,float Y2,Color LineColor);


  final native function Draw3DLine(Vector Start,Vector End,Color LineColor);



