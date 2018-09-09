//==============================================================================
//  GUI_DefaultToolkit
//==============================================================================

class GUI_DefaultToolkit extends GUI_Toolkit
    native
    exportstructs
    dependsOn(Class,GUI_NPCDebugWindow,GUI_Desktop,GUI_Window,Player,PlayerController,LevelInfo)
  ;

  const TOOLKIT_EVENT_BLINK =  3;
  const TOOLKIT_EVENT_MOVER =  2;
  const TOOLKIT_EVENT_TIMER =  1;
  const GDT_MAX_DECORATIONS =  8;
  const GDT_SWIRLY_DECORATION_INDEX =  7;
  const GDT_SHADOW_BORDER_INDEX =  6;
  const GDT_TOP_ORNAMENT_BORDER_INDEX =  5;
  const GDT_FANCY_BODER_DECORATION =  4;
  const GDT_CHAT_BAR_DECORATION =  3;
  const GDT_BOTTOM_ORNAMENTS_BORDER =  2;
  const GDT_BIG_TOP_ORNAMENT_BORDER_INDEX =  1;
  const GDT_SIMPLE_BORDER_INDEX =  0;
  enum DefaultFontsEnum {
    DFE_Satanick16 ,
    DFE_Satanick18 ,
    DFE_Verdana10 ,
    DFE_Verdana11 ,
    DFE_Verdana12 ,
    DFE_MaxFonts 
  };

  struct BlinkStruct {
      var GUI_Component component;
      var float Cycle;
      var float TotalTime;
      var float StartTime;
      var Color Color1;
      var Color Color2;
      var GUI_Page Overlay;

  };


  struct ComponentMoverStruct {
      var float Timeout;
      var float TotalTime;
      var float X;
      var float Y;
      var float width;
      var float Height;
      var float deltaX;
      var float deltaY;
      var float deltaWidth;
      var float deltaHeight;
      var GUI_Component component;

  };


  struct ComponentTimerStruct {
      var float Timeout;
      var GUI_Component caller;

  };


  var Font mFonts[9];
  var string mFontNames[9];
  var array<FSkill_Type> mAvailableSkills;
  var private float mFadeTime;
  var private float mFadeAlpha;
  var private float mStartAlpha;
  var private float mDeltaTime;
  var array<ComponentTimerStruct> mTimeouts;
  var array<ComponentMoverStruct> mMovers;
  var array<BlinkStruct> mBlinkers;
  var array<GUI_Page> mOverlays;
  var GUI_NPCDebugWindow mNPCDebugWindow;


  native function string SetTextColor(string aText,byte R,byte G,byte B);


  native function MoveComponent(GUI_Component aComponent,float Time,float X,float Y,float W,float H);


  native function Font CreateFont(string FontName);


  native function float GetTextWidth(string aText,Font aFont,float aScale);


  native function RemoveBlinkComponent(GUI_Component aComponent,optional Color Color1);


  native function AddBlinkComponent(GUI_Component aComponent,Color Color1,Color Color2,float Cycle,float TotalTime,optional GUI_Page Overlay);


  event Flush() {
    mTimeouts.Length = 0;                                                       //0000 : 0F 37 01 10 B9 A1 19 25 
    mMovers.Length = 0;                                                         //0008 : 0F 37 01 88 B9 A1 19 25 
    mBlinkers.Length = 0;                                                       //0010 : 0F 37 01 00 BA A1 19 25 
    //0F 37 01 10 B9 A1 19 25 0F 37 01 88 B9 A1 19 25 0F 37 01 00 BA A1 19 25 04 0B 47 
  }


  function Initialize(GUI_Desktop aDesktop) {
    local int i;
    Super.Initialize(aDesktop);                                                 //0000 : 1C D0 A3 A1 19 00 28 BB A1 19 16 
    i = 0;                                                                      //000B : 0F 00 40 BC A1 19 25 
    while (i < Class'GUI_DefaultToolkit'.5) {                                   //0012 : 07 50 00 96 00 40 BC A1 19 39 3A 12 20 F0 D5 2E 1D 02 00 01 24 05 16 
      mFonts[i] = CreateFont(mFontNames[i]);                                    //0029 : 0F 1A 00 40 BC A1 19 01 B8 BC A1 19 1B 26 99 00 00 1A 00 40 BC A1 19 01 30 BD A1 19 16 
      i++;                                                                      //0046 : A5 00 40 BC A1 19 16 
    }
    //1C D0 A3 A1 19 00 28 BB A1 19 16 0F 00 40 BC A1 19 25 07 50 00 96 00 40 BC A1 19 39 3A 12 20 F0 
    //D5 2E 1D 02 00 01 24 05 16 0F 1A 00 40 BC A1 19 01 B8 BC A1 19 1B 26 99 00 00 1A 00 40 BC A1 19 
    //01 30 BD A1 19 16 A5 00 40 BC A1 19 16 06 12 00 04 0B 47 
  }


  function bool IsNPCDebugging() {
    return mNPCDebugWindow != None && mNPCDebugWindow.IsVisible();              //0000 : 04 82 77 01 28 BF A1 19 2A 16 18 10 00 19 01 28 BF A1 19 06 00 04 1C C0 E6 88 19 16 16 
    //04 82 77 01 28 BF A1 19 2A 16 18 10 00 19 01 28 BF A1 19 06 00 04 1C C0 E6 88 19 16 16 04 0B 47 
    //
  }


  function ToggleNPCDebugging() {
    local GUI_Window aWindow;
    if (mNPCDebugWindow == None) {                                              //0000 : 07 89 00 72 01 28 BF A1 19 2A 16 
      aWindow = mDesktop.GetWindow(mDesktop.CreateWindow("GUI_NPCDebugWindow",0,0,4194304,0,0,0,0));//000B : 0F 00 50 C0 A1 19 19 01 80 A4 A1 19 34 00 04 1B 1E 98 00 00 19 01 80 A4 A1 19 25 00 04 1B 4C 2D 00 00 1F 47 55 49 5F 4E 50 43 44 65 62 75 67 57 69 6E 64 6F 77 00 25 25 1D 00 00 40 00 25 25 25 25 16 16 
      mNPCDebugWindow = GUI_NPCDebugWindow(aWindow);                            //004E : 0F 01 28 BF A1 19 2E A8 BD 2F 1D 00 50 C0 A1 19 
      mDesktop.ShowWindow(mNPCDebugWindow.GetWindowHandle(),Class'GUI_Desktop'.1);//005E : 19 01 80 A4 A1 19 1F 00 00 1B 57 2D 00 00 19 01 28 BF A1 19 06 00 04 1B 9B 98 00 00 16 12 20 48 DB 2E 1D 01 00 04 26 16 
    } else {                                                                    //0086 : 06 B2 00 
      mDesktop.ShowWindow(mNPCDebugWindow.GetWindowHandle(),Class'GUI_Desktop'.4);//0089 : 19 01 80 A4 A1 19 20 00 00 1B 57 2D 00 00 19 01 28 BF A1 19 06 00 04 1B 9B 98 00 00 16 12 20 48 DB 2E 1D 02 00 04 2C 04 16 
    }
    //07 89 00 72 01 28 BF A1 19 2A 16 0F 00 50 C0 A1 19 19 01 80 A4 A1 19 34 00 04 1B 1E 98 00 00 19 
    //01 80 A4 A1 19 25 00 04 1B 4C 2D 00 00 1F 47 55 49 5F 4E 50 43 44 65 62 75 67 57 69 6E 64 6F 77 
    //00 25 25 1D 00 00 40 00 25 25 25 25 16 16 0F 01 28 BF A1 19 2E A8 BD 2F 1D 00 50 C0 A1 19 19 01 
    //80 A4 A1 19 1F 00 00 1B 57 2D 00 00 19 01 28 BF A1 19 06 00 04 1B 9B 98 00 00 16 12 20 48 DB 2E 
    //1D 01 00 04 26 16 06 B2 00 19 01 80 A4 A1 19 20 00 00 1B 57 2D 00 00 19 01 28 BF A1 19 06 00 04 
    //1B 9B 98 00 00 16 12 20 48 DB 2E 1D 02 00 04 2C 04 16 04 0B 47 
  }


  function string GetFontName(byte aFont) {
    return mFontNames[aFont];                                                   //0000 : 04 1A 39 3A 00 98 C2 A1 19 01 30 BD A1 19 
    //04 1A 39 3A 00 98 C2 A1 19 01 30 BD A1 19 04 0B 47 
  }


  function Center(GUI_Window aWindow) {
    if (aWindow != None) {                                                      //0000 : 07 76 00 77 00 C8 C4 A1 19 2A 16 
      aWindow.SetPosition(mDesktop.GetScreenWidth() / 2.00000000 - aWindow.GetClientWidth() / 2.00000000,mDesktop.GetScreenHeight() / 2.00000000 - aWindow.GetClientHeight() / 2.00000000);//000B : 19 00 C8 C4 A1 19 62 00 00 1B 23 98 00 00 AF AC 19 01 80 A4 A1 19 06 00 04 1B 31 98 00 00 16 1E 00 00 00 40 16 AC 19 00 C8 C4 A1 19 06 00 04 1B 17 98 00 00 16 1E 00 00 00 40 16 16 AF AC 19 01 80 A4 A1 19 06 00 04 1B 2E 98 00 00 16 1E 00 00 00 40 16 AC 19 00 C8 C4 A1 19 06 00 04 1B 1F 98 00 00 16 1E 00 00 00 40 16 16 16 
    }
    //07 76 00 77 00 C8 C4 A1 19 2A 16 19 00 C8 C4 A1 19 62 00 00 1B 23 98 00 00 AF AC 19 01 80 A4 A1 
    //19 06 00 04 1B 31 98 00 00 16 1E 00 00 00 40 16 AC 19 00 C8 C4 A1 19 06 00 04 1B 17 98 00 00 16 
    //1E 00 00 00 40 16 16 AF AC 19 01 80 A4 A1 19 06 00 04 1B 2E 98 00 00 16 1E 00 00 00 40 16 AC 19 
    //00 C8 C4 A1 19 06 00 04 1B 1F 98 00 00 16 1E 00 00 00 40 16 16 16 04 0B 47 
  }


  function AddTimeout(GUI_Component aComponent,float Time) {
    local ComponentTimerStruct aTimer;
    aTimer.caller = aComponent;                                                 //0000 : 0F 36 A0 C7 A1 19 00 18 C8 A1 19 00 F0 C5 A1 19 
    aTimer.Timeout = mDesktop.ViewportOwner.Actor.Level.TimeSeconds + Time;     //0010 : 0F 36 90 C8 A1 19 00 18 C8 A1 19 AE 19 19 19 19 01 80 A4 A1 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 00 08 C9 A1 19 16 
    mTimeouts[mTimeouts.Length] = aTimer;                                       //004B : 0F 10 37 01 10 B9 A1 19 01 10 B9 A1 19 00 18 C8 A1 19 
    //0F 36 A0 C7 A1 19 00 18 C8 A1 19 00 F0 C5 A1 19 0F 36 90 C8 A1 19 00 18 C8 A1 19 AE 19 19 19 19 
    //01 80 A4 A1 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 
    //01 A8 81 6C 0F 00 08 C9 A1 19 16 0F 10 37 01 10 B9 A1 19 01 10 B9 A1 19 00 18 C8 A1 19 04 0B 47 
    //
  }


  function EndFade() {
    ClearFade();                                                                //0000 : 1B 7E 9A 00 00 16 
    //1B 7E 9A 00 00 16 04 0B 47 
  }


  function ClearFade() {
    mFadeTime = -1.00000000;                                                    //0000 : 0F 01 58 CB A1 19 1E 00 00 80 BF 
    //0F 01 58 CB A1 19 1E 00 00 80 BF 04 0B 47 
  }


  function bool IsFading() {
    return mFadeTime != -1;                                                     //0000 : 04 B5 01 58 CB A1 19 39 3F 1D FF FF FF FF 16 
    //04 B5 01 58 CB A1 19 39 3F 1D FF FF FF FF 16 04 0B 47 
  }


  function Fade(float FadeTime,float fadeAlphaStart,float fadeAlphaEnd) {
    if (mFadeTime == -1 && mDesktop != None) {                                  //0000 : 07 75 00 82 B4 01 58 CB A1 19 39 3F 1D FF FF FF FF 16 18 09 00 77 01 80 A4 A1 19 2A 16 16 
      mFadeTime = mDesktop.ViewportOwner.Actor.Level.TimeSeconds + FadeTime;    //001E : 0F 01 58 CB A1 19 AE 19 19 19 19 01 80 A4 A1 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 00 C0 CD A1 19 16 
      mFadeAlpha = fadeAlphaEnd;                                                //0054 : 0F 01 48 FA A1 19 00 C0 FA A1 19 
      mStartAlpha = fadeAlphaStart;                                             //005F : 0F 01 38 FB A1 19 00 B0 FB A1 19 
      mDeltaTime = FadeTime;                                                    //006A : 0F 01 28 FC A1 19 00 C0 CD A1 19 
    }
    //07 75 00 82 B4 01 58 CB A1 19 39 3F 1D FF FF FF FF 16 18 09 00 77 01 80 A4 A1 19 2A 16 16 0F 01 
    //58 CB A1 19 AE 19 19 19 19 01 80 A4 A1 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 
    //04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 00 C0 CD A1 19 16 0F 01 48 FA A1 19 00 C0 FA A1 19 0F 
    //01 38 FB A1 19 00 B0 FB A1 19 0F 01 28 FC A1 19 00 C0 CD A1 19 04 0B 47 
  }



