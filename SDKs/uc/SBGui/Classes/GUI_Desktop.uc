//==============================================================================
//  GUI_Desktop
//==============================================================================

class GUI_Desktop extends Game_Desktop
    native
    dependsOn(HUD_OnScreenMessages,GUI_Window,Class,Game_Chat,SBGuiStrings,HUD_Chat,HUD_HelpTutorial,HUD_SkillDeck,Game_Pawn,Game_CombatStats,Player,PlayerController,Engine,SBAudioManager,GED_Editor,HUD_RulesWindow,HUD_Minimap,GUI_DnDInfo,GUI_Page,GUI_Toolkit)
    Transient
    Config(User)
  ;

  const GUI_ITEM_SIZE =  40;
  const GUI_MESSAGEBOX_H =  225;
  const GUI_MESSAGEBOX_W =  400;
  const GUI_LABEL_HEIGHT =  24;
  const GUI_BUTTON_PANE_H =  42;
  const GUI_BUTTON_H =  24;
  const GUI_BUTTON_W =  105;
  const GUI_MARGIN_TOP =  21;
  const GUI_DOUBLE_MARGIN =  12;
  const GUI_MARGIN =  6;
  const GUI_DOUBLE_BORDER =  6;
  const GUI_BORDER =  3;
  const SB_MOUSE_CURSOR_RMODE_ACTION_OUR =  32;
  const SB_MOUSE_CURSOR_RMODE_RADIAL_OUR =  31;
  const SB_MOUSE_CURSOR_RMODE_CHAT_OUR =  30;
  const SB_MOUSE_CURSOR_RMODE_DISABLED =  29;
  const SB_MOUSE_CURSOR_RMODE_ACTION =  28;
  const SB_MOUSE_CURSOR_RMODE_RADIAL =  27;
  const SB_MOUSE_CURSOR_RMODE_CHAT =  26;
  const SB_MOUSE_CURSOR_RMODE_CURSOR =  25;
  const SB_MOUSE_CURSOR_ARROW_ACTION_OUR =  24;
  const SB_MOUSE_CURSOR_ARROW_RADIAL_OUR =  23;
  const SB_MOUSE_CURSOR_ARROW_CHAT_OUR =  22;
  const SB_MOUSE_CURSOR_ARROW_DISABLED =  21;
  const SB_MOUSE_CURSOR_ARROW_ACTION =  20;
  const SB_MOUSE_CURSOR_ARROW_CONTEXT =  19;
  const SB_MOUSE_CURSOR_ARROW_RADIAL =  18;
  const SB_MOUSE_CURSOR_ARROW_CHAT =  17;
  const SB_MOUSE_CURSOR_RETICULE_PAINT_INVALID =  16;
  const SB_MOUSE_CURSOR_RETICULE_INVALID =  15;
  const SB_MOUSE_CURSOR_RETICULE_PAINT =  14;
  const SB_MOUSE_CURSOR_RETICULE_DISABLED =  13;
  const SB_MOUSE_CURSOR_DROP_CHARACTER =  12;
  const SB_MOUSE_CURSOR_DRAG_CHARACTER =  11;
  const SB_MOUSE_CURSOR_DRAG_FALSE =  10;
  const SB_MOUSE_CURSOR_DRAG =  9;
  const SB_MOUSE_CURSOR_DROP =  8;
  const SB_MOUSE_CURSOR_RETICULE_NORMAL =  7;
  const SB_MOUSE_CURSOR_CARRET =  6;
  const SB_MOUSE_CURSOR_SIZE_WE =  5;
  const SB_MOUSE_CURSOR_SIZE_NW_SE =  4;
  const SB_MOUSE_CURSOR_SIZE_NS =  3;
  const SB_MOUSE_CURSOR_SIZE_NE_SW =  2;
  const SB_MOUSE_CURSOR_SIZEALL =  1;
  const SB_MOUSE_CURSOR_ARROW =  0;
  const SNAP_REGION_SIZE =  10;
  const DOCK_REGION_SIZE =  10;
  const DESKTOP_DEBUG_TRACE_DRAW_TIME =  2;
  const DESKTOP_DEBUG_TRACE_FOCUS =  1;
  enum GUI_BackgroundRenderMode {
    GUIBRM_Normal ,
    GUIBRM_KeepMaterialAR 
  };

  var private bool mFullScreen;
  var private bool mWasDesktopActive;
  var private bool mTempActiveFromTempReticule;
  var private float mLastDeltaTime;
  var int mDebug;
  var private GUI_Window mModalWindow;
  var private GUI_Window mModalOverlay;
  var private Material mBackgroundMaterial;
  var private byte mBackgroundRenderMode;
  var private Material mFadeInMaterial;
  var private bool mFadeIn;
  var private float mFadeInAlpha;
  var private GUI_Window mHiliteWindow;
  var private GUI_Window mFocusWindow;
  var private GUI_Window mMoveWindow;
  var private GUI_Window mSizeWindow;
  var private int mSizeDirection;
  var private float mLastClickTime;
  var private GUI_Component mLastClickedComponent;
  var private array<string> mStdWindowClasses;
  var private array<int> mStdWindowStyles;
  var private array<int> mStdPageStyles;
  var private array<int> mStdWindowHandles;
  var private array<string> mStdWindowTitles;
  var private byte mLastKeyDown;
  var private float mLastKeyDownTime;
  var private float mLastKeyDownDelta;
  var private float mKeyRepeatDelay;
  var float mBlinkAlpha;
  var float mBlinkTime;
  var private byte mKeyStates[255];
  var private int mTabWindowIndex;
  var private GUI_Component mHiliteComponent;
  var private GUI_Component mMouseCaptureComponent;
  var private GUI_Component mMouseOwner;
  var private float mMouseSensitivity;
  var private float mMouseX;
  var private float mMouseY;
  var private float mMouseXPrev;
  var private float mMouseYPrev;
  var private int mMouseButtonStates;
  var private int mMouseButtonStatesPrev;
  var private array<Texture> mMouseCursors;
  var private array<Vector> mMouseCursorOffsets;
  var globalconfig float mMouseDragThreshold;
  var float mMouseDownX;
  var float mMouseDownY;
  var int mMouseCursorIndex;
  var private Vector mPreviousMousePosition;
  var private GUI_DnDInfo mDnDInfo;
  var Plane mColorModifier;
  var class<GUI_Toolkit> mToolkitClass;
  var GUI_Toolkit mToolkit;
  var GUI_Tooltip mTooltipWindow;
  var HUD_TimerWindow mTimerWindow;
  var private Material mLoadingScreenMaterial;
  var private array<int> mOpenWindowHandles;
  var private string mRequestedVideo;
  var private float mDrawConnectionWarningIcon;
  var private Material mDisconnectedIcon;
  var private Object mInput;
  var globalconfig float TrackingRange;
  var globalconfig bool ShowNameAboveHeadsOnSelectedTarget;
  var globalconfig bool ShowNameAboveHeadsOnHoveredTarget;
  var globalconfig bool ShowNameAboveHeads;
  var globalconfig float NameTrackingRange;
  var globalconfig bool ShowPermanentHealthBarsOnSelectedTarget;
  var globalconfig bool ShowPermanentHealthBarsOnHoveredTarget;
  var globalconfig bool ShowPermanentHealthBarsOnEnemies;
  var globalconfig bool ShowPopupHealthBarsOnHitTargets;
  var globalconfig bool ShowPopupHealthBarsOnHitSources;
  var globalconfig float PermanentHealthBarOnEnemiesRange;
  var globalconfig float PopupHealthBarPeriod;
  var globalconfig float HealthBarBlinkingPeriod;
  var globalconfig float HealthBarBlinkingFrequency;
  var globalconfig bool ShowHealthBarPercentage;
  var globalconfig float WindowBackgroundAlpha;
  var private int mData;
  var private transient int mReticule;


  native function string GetWorldName(int aWorldID);


  native function string GetBindingKey(string Binding);


  event AddScreenMessage(string aMessage,optional Color aColour) {
    local HUD_OnScreenMessages osMessage;
    osMessage = HUD_OnScreenMessages(GetStdWindow(76));                         //0000 : 0F 00 98 DD 96 19 2E 08 F6 31 1D 1B 1B 98 00 00 2C 4C 16 
    if (osMessage != None) {                                                    //0013 : 07 37 00 77 00 98 DD 96 19 2A 16 
      osMessage.AddOnScreenMessage(aMessage,aColour);                           //001E : 19 00 98 DD 96 19 10 00 00 1B AC 96 00 00 00 A8 DC 96 19 00 A0 DE 96 19 16 
    }
    //0F 00 98 DD 96 19 2E 08 F6 31 1D 1B 1B 98 00 00 2C 4C 16 07 37 00 77 00 98 DD 96 19 2A 16 19 00 
    //98 DD 96 19 10 00 00 1B AC 96 00 00 00 A8 DC 96 19 00 A0 DE 96 19 16 04 0B 47 
  }


  native function bool IsPlayingVideo();


  native function StopVideo(string fileName);


  native function PlayVideo(string fileName,bool fadeInWhenStopped);


  native function float GetTimeSeconds();


  native function Engine GetEngine();


  native function Level GetLevel();


  native function NativeTick(float delta);


  event AddMessage(string aSender,string aMessage,int aChannel) {
    local HUD_Chat chatWindow;
    chatWindow = HUD_Chat(GetStdWindow(13));                                    //0000 : 0F 00 10 EB 96 19 2E F8 71 31 1D 1B 1B 98 00 00 2C 0D 16 
    if (aChannel == Class'Game_Chat'.8) {                                       //0013 : 07 5F 00 9A 00 88 EB 96 19 39 3A 12 20 A8 8A 60 01 02 00 01 24 08 16 
      CreateTrayBox("GUI_TrayBox",Class'SBGuiStrings'.default.System_Message.Text,aMessage,1,0,chatWindow);//002A : 1B 7C 99 00 00 1F 47 55 49 5F 54 72 61 79 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 EC 96 19 00 78 EC 96 19 26 25 00 10 EB 96 19 16 
    } else {                                                                    //005C : 06 7D 00 
      chatWindow.AddChatMessage(aSender,aMessage,aChannel);                     //005F : 19 00 10 EB 96 19 15 00 00 1B E8 9A 00 00 00 C0 E9 96 19 00 78 EC 96 19 00 88 EB 96 19 16 
    }
    //0F 00 10 EB 96 19 2E F8 71 31 1D 1B 1B 98 00 00 2C 0D 16 07 5F 00 9A 00 88 EB 96 19 39 3A 12 20 
    //A8 8A 60 01 02 00 01 24 08 16 1B 7C 99 00 00 1F 47 55 49 5F 54 72 61 79 42 6F 78 00 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 00 EC 96 19 00 78 EC 96 19 26 25 00 10 EB 96 19 16 06 7D 00 19 
    //00 10 EB 96 19 15 00 00 1B E8 9A 00 00 00 C0 E9 96 19 00 78 EC 96 19 00 88 EB 96 19 16 04 0B 47 
    //
  }


  event ProcessMessage(string aMessage,int aChannel) {
    HUD_Chat(GetStdWindow(13)).ProcessInput(aMessage,aChannel);                 //0000 : 19 2E F8 71 31 1D 1B 1B 98 00 00 2C 0D 16 10 00 00 1B E4 9A 00 00 00 A0 ED 96 19 00 78 EE 96 19 16 
    //19 2E F8 71 31 1D 1B 1B 98 00 00 2C 0D 16 10 00 00 1B E4 9A 00 00 00 A0 ED 96 19 00 78 EE 96 19 
    //16 04 0B 47 
  }


  event OnRankUp(int newRank) {
    AddScreenMessage(Class'SBGuiStrings'.default.Your_pep_rank_increased.Text); //0000 : 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 86 89 19 16 
    //1B EF 0B 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 86 89 19 16 04 0B 47 
  }


  event OnLevelUp(int aNewLevel) {
    local HUD_HelpTutorial helpTutorialWindow;
    local HUD_SkillDeck skillDeckWindow;
    AddScreenMessage(Class'SBGuiStrings'.default.Your_fame_level_increased.Text);//0000 : 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 88 89 19 16 
    helpTutorialWindow = HUD_HelpTutorial(GetStdWindow(69));                    //0019 : 0F 00 68 89 89 19 2E 88 EB 31 1D 1B 1B 98 00 00 2C 45 16 
    if (helpTutorialWindow.GetTutorialsActive()) {                              //002C : 07 76 00 19 00 68 89 89 19 06 00 04 1B C4 98 00 00 16 
      if (helpTutorialWindow.SetTutorialByTag("LevelUp" $ string(aNewLevel))) { //003E : 07 76 00 19 00 68 89 89 19 18 00 04 1B 47 9B 00 00 70 1F 4C 65 76 65 6C 55 70 00 39 53 00 60 87 89 19 16 16 
        StartTrayWindow(helpTutorialWindow);                                    //0062 : 1B 16 99 00 00 00 68 89 89 19 16 
        ShowStdWindow(69,1);                                                    //006D : 1B DF 0B 00 00 2C 45 26 16 
      }
    }
    skillDeckWindow = HUD_SkillDeck(GetStdWindow(16));                          //0076 : 0F 00 08 E1 88 19 2E 80 E1 88 19 1B 1B 98 00 00 2C 10 16 
    if (skillDeckWindow.IsVisible()) {                                          //0089 : 07 AA 00 19 00 08 E1 88 19 06 00 04 1C C0 E6 88 19 16 
      skillDeckWindow.UpdateSkillPages();                                       //009B : 19 00 08 E1 88 19 06 00 00 1B 9F 98 00 00 16 
    }
    //1B EF 0B 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 88 89 19 16 0F 00 68 89 89 19 2E 
    //88 EB 31 1D 1B 1B 98 00 00 2C 45 16 07 76 00 19 00 68 89 89 19 06 00 04 1B C4 98 00 00 16 07 76 
    //00 19 00 68 89 89 19 18 00 04 1B 47 9B 00 00 70 1F 4C 65 76 65 6C 55 70 00 39 53 00 60 87 89 19 
    //16 16 1B 16 99 00 00 00 68 89 89 19 16 1B DF 0B 00 00 2C 45 26 16 0F 00 08 E1 88 19 2E 80 E1 88 
    //19 1B 1B 98 00 00 2C 10 16 07 AA 00 19 00 08 E1 88 19 06 00 04 1C C0 E6 88 19 16 19 00 08 E1 88 
    //19 06 00 00 1B 9F 98 00 00 16 04 0B 47 
  }


  native event InvalidateFunctionPtrs();


  event bool IsPlayerBusy(Game_Pawn Pawn) {
    return Pawn.CombatStats.InCombat();                                         //0000 : 04 19 19 00 D0 E8 88 19 05 00 04 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 
    //04 19 19 00 D0 E8 88 19 05 00 04 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 04 0B 47 
  }


  native event bool InLoadingScreen();


  event StopLoadingScreen() {
    SetLoadingFinished();                                                       //0000 : 1B 9D 9B 00 00 16 
    SetLoadingHook(False);                                                      //0006 : 1B 17 9A 00 00 28 16 
    ShowStdWindow(47,2);                                                        //000D : 1B DF 0B 00 00 2C 2F 2C 02 16 
    //1B 9D 9B 00 00 16 1B 17 9A 00 00 28 16 1B DF 0B 00 00 2C 2F 2C 02 16 04 0B 47 
  }


  event UpdateLoadingScreen(float percentage,string Text) {
    ShowStdWindow(47,1);                                                        //0000 : 1B DF 0B 00 00 2C 2F 26 16 
    UpdateStdWindow(47,percentage * 1000);                                      //0009 : 1B 02 0C 00 00 2C 2F 39 44 AB 00 E8 EC 88 19 39 3F 1D E8 03 00 00 16 16 
    //1B DF 0B 00 00 2C 2F 26 16 1B 02 0C 00 00 2C 2F 39 44 AB 00 E8 EC 88 19 39 3F 1D E8 03 00 00 16 
    //16 04 0B 47 
  }


  function StartLoadingScreen(string loadingTexture) {
    local Texture loadingMaterial;
    HideAllWindows();                                                           //0033 : 1B 49 0F 00 00 16 
    ShowStdWindow(47,1);                                                        //0039 : 1B DF 0B 00 00 2C 2F 26 16 
    SetLoadingHook(True);                                                       //0042 : 1B 17 9A 00 00 27 16 
    if (Len(loadingTexture) == 0) {                                             //0049 : 07 64 00 9A 7D 00 E8 EE 88 19 16 25 16 
      loadingMaterial = Texture'LoadingDeadspell';                              //0056 : 0F 00 60 EF 88 19 20 28 F0 88 19 
    } else {                                                                    //0061 : 06 7F 00 
      loadingMaterial = Texture(static.DynamicLoadObject(loadingTexture,Class'Texture'));//0064 : 0F 00 60 EF 88 19 2E B8 3A D6 00 1C 60 E7 69 0F 00 E8 EE 88 19 20 B8 3A D6 00 16 
    }
    if (loadingMaterial == None) {                                              //007F : 07 95 00 72 00 60 EF 88 19 2A 16 
      loadingMaterial = Texture'LoadingDeadspell';                              //008A : 0F 00 60 EF 88 19 20 28 F0 88 19 
    }
    SetLoadingScreenMaterial(loadingMaterial);                                  //0095 : 1B 9C 9B 00 00 00 60 EF 88 19 16 
    //0E 19 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 20 00 00 1B 65 0C 00 00 1F 73 74 61 72 74 6D 75 
    //73 69 63 20 6D 75 73 69 63 5F 6C 75 6C 6C 61 62 79 00 16 1B 49 0F 00 00 16 1B DF 0B 00 00 2C 2F 
    //26 16 1B 17 9A 00 00 27 16 07 64 00 9A 7D 00 E8 EE 88 19 16 25 16 0F 00 60 EF 88 19 20 28 F0 88 
    //19 06 7F 00 0F 00 60 EF 88 19 2E B8 3A D6 00 1C 60 E7 69 0F 00 E8 EE 88 19 20 B8 3A D6 00 16 07 
    //95 00 72 00 60 EF 88 19 2A 16 0F 00 60 EF 88 19 20 28 F0 88 19 1B 9C 9B 00 00 00 60 EF 88 19 16 
    //04 0B 47 
  }


  native function SetLoadingFinished();


  native function SetLoadingScreenMaterial(Material loadingScreenMaterial);


  native function SetLoadingHook(bool setHook);


  function PlaySound(Sound s) {
    GetEngine().AudioManager.PlayInterfaceSound(s,1.00000000);                  //0000 : 19 19 1B 4E 98 00 00 16 05 00 04 01 C8 E8 6B 0F 10 00 04 1C 50 1D 75 0F 00 78 F5 88 19 1E 00 00 80 3F 16 
    //19 19 1B 4E 98 00 00 16 05 00 04 01 C8 E8 6B 0F 10 00 04 1C 50 1D 75 0F 00 78 F5 88 19 1E 00 00 
    //80 3F 16 04 0B 47 
  }


  function ResetBackgroundRenderMode() {
    mBackgroundRenderMode = 0;                                                  //0000 : 0F 01 38 F7 88 19 24 00 
    //0F 01 38 F7 88 19 24 00 04 0B 47 
  }


  function SetBackgroundRenderMode(byte aRendMode) {
    mBackgroundRenderMode = aRendMode;                                          //0000 : 0F 01 38 F7 88 19 00 60 F8 88 19 
    //0F 01 38 F7 88 19 00 60 F8 88 19 04 0B 47 
  }


  native function SetBackgroundMaterial(Material aMaterial);


  function GUI_Window GetModalWindow() {
    return mModalWindow;                                                        //0000 : 04 01 28 FC 88 19 
    //04 01 28 FC 88 19 04 0B 47 
  }


  native function SetModalWindow(GUI_Window aWindow);


  function PreviousTabStop() {
    //04 0B 47 
  }


  native function NextTabStop();


  final native function GUI_Window GetRenderWindow(int Index);


  final function GUI_DnDInfo GetDnDInfo() {
    return mDnDInfo;                                                            //0000 : 04 01 F8 02 89 19 
    //04 01 F8 02 89 19 04 0B 47 
  }


  final native function UpdateWindowPositioning(GUI_Window Target);


  final function GUI_Component GetMouseCaptureComponent() {
    return mMouseCaptureComponent;                                              //0000 : 04 01 30 06 89 19 
    //04 01 30 06 89 19 04 0B 47 
  }


  final function GUI_Component GetMouseOwner() {
    return mMouseOwner;                                                         //0000 : 04 01 08 08 89 19 
    //04 01 08 08 89 19 04 0B 47 
  }


  final function GUI_Window GetFocusedWindow() {
    return mFocusWindow;                                                        //0000 : 04 01 E0 09 89 19 
    //04 01 E0 09 89 19 04 0B 47 
  }


  final function GUI_Component GetFocusedComponent() {
    if (mFocusWindow != None) {                                                 //0000 : 07 1E 00 77 01 E0 09 89 19 2A 16 
      return mFocusWindow.GetLastFocusedComponent();                            //000B : 04 19 01 E0 09 89 19 06 00 04 1B 7A 9B 00 00 16 
    } else {                                                                    //001B : 06 20 00 
      return None;                                                              //001E : 04 2A 
    }
    //07 1E 00 77 01 E0 09 89 19 2A 16 04 19 01 E0 09 89 19 06 00 04 1B 7A 9B 00 00 16 06 20 00 04 2A 
    //04 0B 47 
  }


  function bool HasHiliteComponent() {
    return mHiliteComponent != None;                                            //0000 : 04 77 01 38 0D 89 19 2A 16 
    //04 77 01 38 0D 89 19 2A 16 04 0B 47 
  }


  final function GUI_Window GetHiliteWindow() {
    return mHiliteWindow;                                                       //0000 : 04 01 10 0F 89 19 
    //04 01 10 0F 89 19 04 0B 47 
  }


  final function GUI_Component GetHiliteComponent() {
    return mHiliteComponent;                                                    //0000 : 04 01 38 0D 89 19 
    //04 01 38 0D 89 19 04 0B 47 
  }


  final native function CloseContextWindows(optional GUI_Component aClickedComponent);


  final native function GUI_ContextWindow CreateContextWindow(GUI_Component aWatchedComponent,string aGEDFile,string aGEDContextWindowComponent);


  final native function bool IsKeyDown(byte keyCode);


  event ParseEditorString(string editorString) {
    if (GED_Editor(GetWindow(mStdWindowHandles[45])) == None) {                 //0000 : 07 22 00 72 2E D8 2F 32 1D 1B 1E 98 00 00 10 2C 2D 01 90 F4 96 19 16 2A 16 
      ShowStdWindow(45,1);                                                      //0019 : 1B DF 0B 00 00 2C 2D 26 16 
    }
    if (GED_Editor(GetWindow(mStdWindowHandles[45])) != None) {                 //0022 : 07 60 00 77 2E D8 2F 32 1D 1B 1E 98 00 00 10 2C 2D 01 90 F4 96 19 16 2A 16 
      GED_Editor(GetWindow(mStdWindowHandles[45])).Parse(editorString);         //003B : 19 2E D8 2F 32 1D 1B 1E 98 00 00 10 2C 2D 01 90 F4 96 19 16 0B 00 00 1B 2F 0D 00 00 00 68 F3 96 19 16 
      goto jl0060;                                                              //005D : 06 60 00 
    }
    //07 22 00 72 2E D8 2F 32 1D 1B 1E 98 00 00 10 2C 2D 01 90 F4 96 19 16 2A 16 1B DF 0B 00 00 2C 2D 
    //26 16 07 60 00 77 2E D8 2F 32 1D 1B 1E 98 00 00 10 2C 2D 01 90 F4 96 19 16 2A 16 19 2E D8 2F 32 
    //1D 1B 1E 98 00 00 10 2C 2D 01 90 F4 96 19 16 0B 00 00 1B 2F 0D 00 00 00 68 F3 96 19 16 06 60 00 
    //04 0B 47 
  }


  event UpdateStdWindow(int windowType,optional int intParam,optional Object objParam,optional string stringParam,optional int intParam2) {
    local GUI_Window Window;
    Window = GetStdWindow(windowType);                                          //0000 : 0F 00 B8 F6 96 19 1B 1B 98 00 00 00 B8 F5 96 19 16 
    if (Window != None) {                                                       //0011 : 07 42 00 77 00 B8 F6 96 19 2A 16 
      Window.OnUpdate(intParam,objParam,stringParam,intParam2);                 //001C : 19 00 B8 F6 96 19 1A 00 00 1B 56 98 00 00 00 30 F7 96 19 00 A8 F7 96 19 00 20 F8 96 19 00 98 F8 96 19 16 
      goto jl0042;                                                              //003F : 06 42 00 
    }
    //0F 00 B8 F6 96 19 1B 1B 98 00 00 00 B8 F5 96 19 16 07 42 00 77 00 B8 F6 96 19 2A 16 19 00 B8 F6 
    //96 19 1A 00 00 1B 56 98 00 00 00 30 F7 96 19 00 A8 F7 96 19 00 20 F8 96 19 00 98 F8 96 19 16 06 
    //42 00 04 0B 47 
  }


  event ShowRulesWindow(int articleID) {
    local HUD_RulesWindow aWindow;
    aWindow = HUD_RulesWindow(GetStdWindow(79));                                //0000 : 0F 00 B0 FA 96 19 2E 28 FB 96 19 1B 1B 98 00 00 2C 4F 16 
    if (aWindow.SetTutorialByID(articleID)) {                                   //0013 : 07 33 00 19 00 B0 FA 96 19 0B 00 04 1B 54 99 00 00 00 C0 F9 96 19 16 
      ShowStdWindow(79,1);                                                      //002A : 1B DF 0B 00 00 2C 4F 26 16 
    }
    //0F 00 B0 FA 96 19 2E 28 FB 96 19 1B 1B 98 00 00 2C 4F 16 07 33 00 19 00 B0 FA 96 19 0B 00 04 1B 
    //54 99 00 00 00 C0 F9 96 19 16 1B DF 0B 00 00 2C 4F 26 16 04 0B 47 
  }


  event ShowTutorialWindow(int articleID) {
    local HUD_HelpTutorial aWindow;
    aWindow = HUD_HelpTutorial(GetStdWindow(69));                               //0000 : 0F 00 90 01 97 19 2E 88 EB 31 1D 1B 1B 98 00 00 2C 45 16 
    if (aWindow.GetTutorialsActive()) {                                         //0013 : 07 50 00 19 00 90 01 97 19 06 00 04 1B C4 98 00 00 16 
      if (aWindow.SetTutorialByID(articleID)) {                                 //0025 : 07 50 00 19 00 90 01 97 19 0B 00 04 1B 54 99 00 00 00 18 01 97 19 16 
        StartTrayWindow(aWindow);                                               //003C : 1B 16 99 00 00 00 90 01 97 19 16 
        ShowStdWindow(69,1);                                                    //0047 : 1B DF 0B 00 00 2C 45 26 16 
      }
    }
    //0F 00 90 01 97 19 2E 88 EB 31 1D 1B 1B 98 00 00 2C 45 16 07 50 00 19 00 90 01 97 19 06 00 04 1B 
    //C4 98 00 00 16 07 50 00 19 00 90 01 97 19 0B 00 04 1B 54 99 00 00 00 18 01 97 19 16 1B 16 99 00 
    //00 00 90 01 97 19 16 1B DF 0B 00 00 2C 45 26 16 04 0B 47 
  }


  event ShowMessageBox(string Title,string Message) {
    CreateMessageBox("GUI_MessageBox",Title,Message,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,0,mModalOverlay);//0000 : 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 00 B8 02 97 19 00 B0 03 97 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 01 28 04 97 19 16 
    //1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 00 B8 02 97 19 00 B0 03 97 19 9E 
    //12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 01 28 04 97 19 16 04 0B 47 
    //
  }


  event ShowPartyTravelConfirmation() {
    ShowStdWindow(83,1);                                                        //0000 : 1B DF 0B 00 00 2C 53 26 16 
    //1B DF 0B 00 00 2C 53 26 16 04 0B 47 
  }


  event ShowPartyTravelOverview() {
    ShowStdWindow(82,1);                                                        //0000 : 1B DF 0B 00 00 2C 52 26 16 
    //1B DF 0B 00 00 2C 52 26 16 04 0B 47 
  }


  event ShowLevelAreaName(string aName,bool newArea) {
    local HUD_OnScreenMessages messages;
    local HUD_Minimap Minimap;
    local Color TextColor;
    TextColor.R = 227;                                                          //0000 : 0F 36 D0 90 6A 0F 00 98 07 97 19 24 E3 
    TextColor.G = 211;                                                          //000D : 0F 36 58 90 6A 0F 00 98 07 97 19 24 D3 
    TextColor.B = 191;                                                          //001A : 0F 36 E0 8F 6A 0F 00 98 07 97 19 24 BF 
    TextColor.A = 255;                                                          //0027 : 0F 36 48 91 6A 0F 00 98 07 97 19 39 3D 2C FF 
    messages = HUD_OnScreenMessages(GetStdWindow(76));                          //0036 : 0F 00 10 08 97 19 2E 08 F6 31 1D 1B 1B 98 00 00 2C 4C 16 
    if (messages != None) {                                                     //0049 : 07 B2 00 77 00 10 08 97 19 2A 16 
      messages.AddOnScreenMessage(aName,TextColor);                             //0054 : 19 00 10 08 97 19 10 00 00 1B AC 96 00 00 00 20 07 97 19 00 98 07 97 19 16 
      if (newArea) {                                                            //006D : 07 B2 00 2D 00 88 08 97 19 
        messages.AddOnScreenMessage(Class'SBGuiStrings'.default.You_have_discovered_a_new_area.Text,TextColor,"SBFontsTX.Verdana12");//0076 : 19 00 10 08 97 19 33 00 00 1B AC 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 09 97 19 00 98 07 97 19 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 32 00 16 
      }
    }
    Minimap = HUD_Minimap(GetStdWindow(0));                                     //00B2 : 0F 00 78 09 97 19 2E B0 F3 30 1D 1B 1B 98 00 00 25 16 
    Minimap.SetAreaName(aName);                                                 //00C4 : 19 00 78 09 97 19 0B 00 00 1B 38 9A 00 00 00 20 07 97 19 16 
    //0F 36 D0 90 6A 0F 00 98 07 97 19 24 E3 0F 36 58 90 6A 0F 00 98 07 97 19 24 D3 0F 36 E0 8F 6A 0F 
    //00 98 07 97 19 24 BF 0F 36 48 91 6A 0F 00 98 07 97 19 39 3D 2C FF 0F 00 10 08 97 19 2E 08 F6 31 
    //1D 1B 1B 98 00 00 2C 4C 16 07 B2 00 77 00 10 08 97 19 2A 16 19 00 10 08 97 19 10 00 00 1B AC 96 
    //00 00 00 20 07 97 19 00 98 07 97 19 16 07 B2 00 2D 00 88 08 97 19 19 00 10 08 97 19 33 00 00 1B 
    //AC 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 09 97 19 00 98 07 97 19 1F 53 42 46 
    //6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 32 00 16 0F 00 78 09 97 19 2E B0 F3 30 1D 1B 1B 98 
    //00 00 25 16 19 00 78 09 97 19 0B 00 00 1B 38 9A 00 00 00 20 07 97 19 16 04 0B 47 
  }


  native function int ShowStdWindow(int wndType,int flags);


  native function Clear();


  native function BringToBottom(GUI_Window Window);


  native function BringToTop(GUI_Window Window);


  native function FocusComponent(GUI_Component component);


  native function FocusWindow(GUI_Window Window);


  native function ClearSavedWindows();


  native function RestoreSavedWindows();


  native function SaveOpenWindows();


  native function CancelAction();


  native function HideAllWindows();


  native function PreLogin();


  native function OnLogin();


  native function StartTrayWindow(GUI_Window aWindow);


  native function StopTrayWindow(GUI_Window aWindow);


  native function StartAutoWindow(GUI_Window aWindow);


  native function StopAutoWindow(GUI_Window aWindow);


  native function ShowWindow(int windowHandle,int ShowFlags);


  native function ShowGUIWindow(GUI_Window aWindow,int ShowFlags);


  function string GetWindowTitle(int windowHandle) {
    return mStdWindowTitles[windowHandle];                                      //0000 : 04 10 00 48 1E 97 19 01 00 1F 97 19 
    //04 10 00 48 1E 97 19 01 00 1F 97 19 04 0B 47 
  }


  function bool IsStdWindowVisible(int windowID) {
    local GUI_Window aWindow;
    aWindow = GetStdWindow(windowID);                                           //0000 : 0F 00 18 21 97 19 1B 1B 98 00 00 00 A0 20 97 19 16 
    if (aWindow != None) {                                                      //0011 : 07 2C 00 77 00 18 21 97 19 2A 16 
      return aWindow.IsVisible();                                               //001C : 04 19 00 18 21 97 19 06 00 04 1C C0 E6 88 19 16 
    }
    return False;                                                               //002C : 04 28 
    //0F 00 18 21 97 19 1B 1B 98 00 00 00 A0 20 97 19 16 07 2C 00 77 00 18 21 97 19 2A 16 04 19 00 18 
    //21 97 19 06 00 04 1C C0 E6 88 19 16 04 28 04 0B 47 
  }


  function bool IsWindowVisible(int windowHandle) {
    local GUI_Window aWindow;
    aWindow = GetWindow(windowHandle);                                          //0000 : 0F 00 A0 23 97 19 1B 1E 98 00 00 00 B8 22 97 19 16 
    if (aWindow != None) {                                                      //0011 : 07 2C 00 77 00 A0 23 97 19 2A 16 
      return aWindow.IsVisible();                                               //001C : 04 19 00 A0 23 97 19 06 00 04 1C C0 E6 88 19 16 
    }
    return False;                                                               //002C : 04 28 
    //0F 00 A0 23 97 19 1B 1E 98 00 00 00 B8 22 97 19 16 07 2C 00 77 00 A0 23 97 19 2A 16 04 19 00 A0 
    //23 97 19 06 00 04 1C C0 E6 88 19 16 04 28 04 0B 47 
  }


  native function bool IsStdWindowInitialized(int windowTag);


  native function GUI_Window GetStdWindow(int windowTag);


  native function GUI_Window GetWindow(int windowHandle);


  native function int FindWindow(string windowTitle);


  native function DestroyWindow(int windowHandle);


  native function int CreateWindow(string windowClass,int componentStyle,int pageStyle,int windowStyle,int Left,int top,int width,int Height,optional string windowTitle);


  native function int CreateTrayBox(string trayBoxClass,string caption,string Text,int messageBoxStyle,int Tag,GUI_Component Owner);


  native function int CreateMessageBox(string messageBoxClass,string caption,string Text,int messageBoxStyle,int Tag,GUI_Component Owner);


  native function bool IsRadialInteractionPossible();


  native function bool IsMouseInsideWindow();


  native function SetDockingStyle(int windowHandle,int dockingStyle);


  native function SetMousePosition(float X,float Y);


  native function float GetRelMouseY(GUI_Component relTo);


  native function float GetRelMouseX(GUI_Component relTo);


  function float GetMouseY() {
    return mMouseY;                                                             //0000 : 04 01 88 4C 97 19 
    //04 01 88 4C 97 19 04 0B 47 
  }


  function float GetMouseX() {
    return mMouseX;                                                             //0000 : 04 01 60 4E 97 19 
    //04 01 60 4E 97 19 04 0B 47 
  }


  function bool IsFullscreen() {
    return mFullScreen;                                                         //0000 : 04 2D 01 40 50 97 19 
    //04 2D 01 40 50 97 19 04 0B 47 
  }


  native function float GetScreenHeight();


  native function float GetScreenWidth();


  function bool IsDragging() {
    return mDnDInfo.IsDragging();                                               //0000 : 04 19 01 F8 02 89 19 06 00 04 1B 67 98 00 00 16 
    //04 19 01 F8 02 89 19 06 00 04 1B 67 98 00 00 16 04 0B 47 
  }


  function bool IsTempInactive() {
    return !mDesktopActive && mWasDesktopActive;                                //0000 : 04 82 81 2D 01 38 A3 77 0F 16 18 07 00 2D 01 00 56 97 19 16 
    //04 82 81 2D 01 38 A3 77 0F 16 18 07 00 2D 01 00 56 97 19 16 04 0B 47 
  }


  function bool IsTempActive() {
    return mDesktopActive && !mWasDesktopActive;                                //0000 : 04 82 2D 01 38 A3 77 0F 18 09 00 81 2D 01 00 56 97 19 16 16 
    //04 82 2D 01 38 A3 77 0F 18 09 00 81 2D 01 00 56 97 19 16 16 04 0B 47 
  }


  function bool IsActive() {
    return mDesktopActive;                                                      //0000 : 04 2D 01 38 A3 77 0F 
    //04 2D 01 38 A3 77 0F 04 0B 47 
  }


  native function SetTempInactive(bool OnOff);


  native function SetTempActive(bool OnOff);


  native function ForceActive();


  native function ToggleActive();


  native function RecreateStdWindows();


  event Shutdown() {
    //04 0B 47 
  }


  event frame() {
    //04 0B 47 
  }


  event Test() {
    ShowStdWindow(52,1);                                                        //0000 : 1B DF 0B 00 00 2C 34 26 16 
    //1B DF 0B 00 00 2C 34 26 16 04 0B 47 
  }


  event CreateDefaultWindows() {
    local GUI_Page page;
    mTooltipWindow = GUI_Tooltip(GetWindow(CreateWindow("GUI_Tooltip",524288,0,4096 | 4194304,0,0,0,0,"tooltip")));//0000 : 0F 01 78 62 97 19 2E 08 D8 2F 1D 1B 1E 98 00 00 1B 4C 2D 00 00 1F 47 55 49 5F 54 6F 6F 6C 74 69 70 00 1D 00 00 08 00 25 9E 1D 00 10 00 00 1D 00 00 40 00 16 25 25 25 25 1F 74 6F 6F 6C 74 69 70 00 16 16 
    mModalOverlay = GetWindow(CreateWindow("GUI_Window",524288,0,4096,0,0,GetScreenWidth(),GetScreenHeight(),"overlay"));//0043 : 0F 01 28 04 97 19 1B 1E 98 00 00 1B 4C 2D 00 00 1F 47 55 49 5F 57 69 6E 64 6F 77 00 1D 00 00 08 00 25 1D 00 10 00 00 25 25 39 44 1B 31 98 00 00 16 39 44 1B 2E 98 00 00 16 1F 6F 76 65 72 6C 61 79 00 16 16 
    page = mModalOverlay.CreatePage("GUI_Page",524288,0,0,0,mModalOverlay.GetClientWidth(),mModalOverlay.GetClientHeight());//0087 : 0F 00 00 62 97 19 19 01 28 04 97 19 3A 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 25 25 39 44 19 01 28 04 97 19 06 00 04 1B 17 98 00 00 16 39 44 19 01 28 04 97 19 06 00 04 1B 1F 98 00 00 16 16 
    page.SetAnchors(0.00000000,0.00000000,1.00000000,1.00000000);               //00D0 : 19 00 00 62 97 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 
    page.SetSolidBackground(0.00000000,0.00000000,0.00000000,128.00000000);     //00F3 : 19 00 00 62 97 19 1A 00 00 1B 52 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 43 16 
    //0F 01 78 62 97 19 2E 08 D8 2F 1D 1B 1E 98 00 00 1B 4C 2D 00 00 1F 47 55 49 5F 54 6F 6F 6C 74 69 
    //70 00 1D 00 00 08 00 25 9E 1D 00 10 00 00 1D 00 00 40 00 16 25 25 25 25 1F 74 6F 6F 6C 74 69 70 
    //00 16 16 0F 01 28 04 97 19 1B 1E 98 00 00 1B 4C 2D 00 00 1F 47 55 49 5F 57 69 6E 64 6F 77 00 1D 
    //00 00 08 00 25 1D 00 10 00 00 25 25 39 44 1B 31 98 00 00 16 39 44 1B 2E 98 00 00 16 1F 6F 76 65 
    //72 6C 61 79 00 16 16 0F 00 00 62 97 19 19 01 28 04 97 19 3A 00 04 1B 16 98 00 00 1F 47 55 49 5F 
    //50 61 67 65 00 1D 00 00 08 00 25 25 25 39 44 19 01 28 04 97 19 06 00 04 1B 17 98 00 00 16 39 44 
    //19 01 28 04 97 19 06 00 04 1B 1F 98 00 00 16 16 19 00 00 62 97 19 1A 00 00 1B 24 98 00 00 1E 00 
    //00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 19 00 00 62 97 19 1A 00 00 1B 52 98 00 
    //00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 43 16 04 0B 47 
  }


  event Init() {
    mStdWindowClasses.Length = 88;                                              //0000 : 0F 37 01 40 87 97 19 2C 58 
    mStdWindowStyles.Length = 88;                                               //0009 : 0F 37 01 B8 87 97 19 2C 58 
    mStdPageStyles.Length = 88;                                                 //0012 : 0F 37 01 30 88 97 19 2C 58 
    mStdWindowTitles.Length = 88;                                               //001B : 0F 37 01 00 1F 97 19 2C 58 
    mStdWindowClasses[0] = "HUD_Minimap";                                       //0024 : 0F 10 25 01 40 87 97 19 1F 48 55 44 5F 4D 69 6E 69 6D 61 70 00 
    mStdWindowStyles[0] = 64 | 524288 | 65536 | 4096;                           //0039 : 0F 10 25 01 B8 87 97 19 9E 9E 9E 2C 40 1D 00 00 08 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 
    mStdWindowClasses[1] = "HUD_PlayerAvatar";                                  //0058 : 0F 10 26 01 40 87 97 19 1F 48 55 44 5F 50 6C 61 79 65 72 41 76 61 74 61 72 00 
    mStdWindowStyles[1] = 64 | 4 | 1048576 | 131072 | 65536 | 4096;             //0072 : 0F 10 26 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 40 2C 04 16 1D 00 00 10 00 16 1D 00 00 02 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 
    mStdWindowClasses[2] = "HUD_TargetAvatar";                                  //009C : 0F 10 2C 02 01 40 87 97 19 1F 48 55 44 5F 54 61 72 67 65 74 41 76 61 74 61 72 00 
    mStdWindowStyles[2] = 64 | 4 | 1048576 | -16777216 | 4096;                  //00B7 : 0F 10 2C 02 01 B8 87 97 19 9E 9E 9E 9E 2C 40 2C 04 16 1D 00 00 10 00 16 1D 00 00 00 FF 16 1D 00 10 00 00 16 
    mStdWindowClasses[3] = "HUD_CombatBar";                                     //00DB : 0F 10 2C 03 01 40 87 97 19 1F 48 55 44 5F 43 6F 6D 62 61 74 42 61 72 00 
    mStdWindowStyles[3] = 64 | 262144 | 4194304 | 65536 | 4096;                 //00F3 : 0F 10 2C 03 01 B8 87 97 19 9E 9E 9E 9E 2C 40 1D 00 00 04 00 16 1D 00 00 40 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 
    mStdWindowClasses[4] = "HUD_GameMenu";                                      //011A : 0F 10 2C 04 01 40 87 97 19 1F 48 55 44 5F 47 61 6D 65 4D 65 6E 75 00 
    mStdWindowStyles[4] = 64 | 4 | 4194304 | 524288 | 65536 | 4096;             //0131 : 0F 10 2C 04 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 40 2C 04 16 1D 00 00 40 00 16 1D 00 00 08 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 
    mStdWindowClasses[5] = "HUD_SystemMenu";                                    //015C : 0F 10 2C 05 01 40 87 97 19 1F 48 55 44 5F 53 79 73 74 65 6D 4D 65 6E 75 00 
    mStdWindowStyles[5] = 1 | 262144 | 2097152 | 65536 | 256 | 8388608 | 32;    //0175 : 0F 10 2C 05 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 26 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 1D 00 00 80 00 16 2C 20 16 
    mStdWindowTitles[5] = Class'SBGuiStrings'.default.Main_Menu.Text;           //01A6 : 0F 10 2C 05 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 88 97 19 
    mStdWindowClasses[6] = "HUD_QuestLog";                                      //01C2 : 0F 10 2C 06 01 40 87 97 19 1F 48 55 44 5F 51 75 65 73 74 4C 6F 67 00 
    mStdWindowStyles[6] = 128 | 8192 | 1 | 4 | 16646144 | 256;                  //01D9 : 0F 10 2C 06 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[6] = Class'SBGuiStrings'.default.Quest_Log.Text;           //0200 : 0F 10 2C 06 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 89 97 19 
    mStdWindowClasses[7] = "HUD_Conversation";                                  //021C : 0F 10 2C 07 01 40 87 97 19 1F 48 55 44 5F 43 6F 6E 76 65 72 73 61 74 69 6F 6E 00 
    mStdWindowStyles[7] = 128 | 8192 | 1 | 4 | 16646144 | 256;                  //0237 : 0F 10 2C 07 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[7] = Class'SBGuiStrings'.default.Conversation.Text;        //025E : 0F 10 2C 07 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 89 97 19 
    mStdWindowClasses[8] = "HUD_BugReport";                                     //027A : 0F 10 2C 08 01 40 87 97 19 1F 48 55 44 5F 42 75 67 52 65 70 6F 72 74 00 
    mStdWindowStyles[8] = 1 | 16646144 | -16777216 | 256 | 8 | 4;               //0292 : 0F 10 2C 08 01 B8 87 97 19 9E 9E 9E 9E 9E 26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 2C 08 16 2C 04 16 
    mStdWindowTitles[8] = Class'SBGuiStrings'.default.Support.Text;             //02B9 : 0F 10 2C 08 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 8A 97 19 
    mStdWindowClasses[9] = "HUD_Inventory";                                     //02D5 : 0F 10 2C 09 01 40 87 97 19 1F 48 55 44 5F 49 6E 76 65 6E 74 6F 72 79 00 
    mStdWindowStyles[9] = 128 | 8192 | 1 | 4 | 16646144 | 256;                  //02ED : 0F 10 2C 09 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[9] = Class'SBGuiStrings'.default.Inventory.Text;           //0314 : 0F 10 2C 09 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 8A 97 19 
    mStdWindowClasses[10] = "HUD_Equipment";                                    //0330 : 0F 10 2C 0A 01 40 87 97 19 1F 48 55 44 5F 45 71 75 69 70 6D 65 6E 74 00 
    mStdWindowStyles[10] = 128 | 8192 | 1 | 4 | 16646144 | 256;                 //0348 : 0F 10 2C 0A 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[10] = Class'SBGuiStrings'.default.Equipment.Text;          //036F : 0F 10 2C 0A 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 8B 97 19 
    mStdWindowClasses[11] = "HUD_Friends";                                      //038B : 0F 10 2C 0B 01 40 87 97 19 1F 48 55 44 5F 46 72 69 65 6E 64 73 00 
    mStdWindowStyles[11] = 1 | 16646144 | -16777216 | 256 | 128 | 4 | 8388608;  //03A1 : 0F 10 2C 0B 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 2C 80 16 2C 04 16 1D 00 00 80 00 16 
    mStdWindowTitles[11] = Class'SBGuiStrings'.default.Friends.Text;            //03CF : 0F 10 2C 0B 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 8B 97 19 
    mStdWindowClasses[12] = "HUD_Team";                                         //03EB : 0F 10 2C 0C 01 40 87 97 19 1F 48 55 44 5F 54 65 61 6D 00 
    mStdWindowStyles[12] = 64 | 4 | 4096 | 4194304;                             //03FE : 0F 10 2C 0C 01 B8 87 97 19 9E 9E 9E 2C 40 2C 04 16 1D 00 10 00 00 16 1D 00 00 40 00 16 
    mStdWindowClasses[77] = "HUD_Pet";                                          //041B : 0F 10 2C 4D 01 40 87 97 19 1F 48 55 44 5F 50 65 74 00 
    mStdWindowStyles[77] = 64 | 4 | 4096 | 4194304;                             //042D : 0F 10 2C 4D 01 B8 87 97 19 9E 9E 9E 2C 40 2C 04 16 1D 00 10 00 00 16 1D 00 00 40 00 16 
    mStdWindowClasses[13] = "HUD_Chat";                                         //044A : 0F 10 2C 0D 01 40 87 97 19 1F 48 55 44 5F 43 68 61 74 00 
    mStdWindowStyles[13] = 2 | 64 | 8 | 4194304 | 131072 | 65536 | 2048 | 4096; //045D : 0F 10 2C 0D 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 9E 2C 02 2C 40 16 2C 08 16 1D 00 00 40 00 16 1D 00 00 02 00 16 1D 00 00 01 00 16 1D 00 08 00 00 16 1D 00 10 00 00 16 
    mStdWindowClasses[14] = "HUD_NetStats";                                     //0493 : 0F 10 2C 0E 01 40 87 97 19 1F 48 55 44 5F 4E 65 74 53 74 61 74 73 00 
    mStdWindowStyles[14] = 64 | 4 | 16646144 | -16777216;                       //04AA : 0F 10 2C 0E 01 B8 87 97 19 9E 9E 9E 2C 40 2C 04 16 1D 00 00 FE 00 16 1D 00 00 00 FF 16 
    mStdWindowClasses[17] = "HUD_SkillBook";                                    //04C7 : 0F 10 2C 11 01 40 87 97 19 1F 48 55 44 5F 53 6B 69 6C 6C 42 6F 6F 6B 00 
    mStdWindowStyles[17] = 128 | 8192 | 1 | 4 | 16646144 | 256;                 //04DF : 0F 10 2C 11 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    mStdPageStyles[17] = 0;                                                     //0506 : 0F 10 2C 11 01 30 88 97 19 25 
    mStdWindowTitles[17] = Class'SBGuiStrings'.default.Skill_Book.Text;         //0510 : 0F 10 2C 11 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 8B 97 19 
    mStdWindowClasses[16] = "HUD_SkillDeck";                                    //052C : 0F 10 2C 10 01 40 87 97 19 1F 48 55 44 5F 53 6B 69 6C 6C 44 65 63 6B 00 
    mStdWindowStyles[16] = 128 | 8192 | 1 | 4 | 16646144 | 256;                 //0544 : 0F 10 2C 10 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    mStdPageStyles[16] = 0;                                                     //056B : 0F 10 2C 10 01 30 88 97 19 25 
    mStdWindowTitles[16] = Class'SBGuiStrings'.default.Skill_Deck.Text;         //0575 : 0F 10 2C 10 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 8C 97 19 
    mStdWindowClasses[15] = "HUD_DeathRespawn";                                 //0591 : 0F 10 2C 0F 01 40 87 97 19 1F 48 55 44 5F 44 65 61 74 68 52 65 73 70 61 77 6E 00 
    mStdWindowStyles[15] = 1 | 4 | 32 | 256 | 2 | 4096;                         //05AC : 0F 10 2C 0F 01 B8 87 97 19 9E 9E 9E 9E 9E 26 2C 04 16 2C 20 16 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdPageStyles[15] = 0;                                                     //05D0 : 0F 10 2C 0F 01 30 88 97 19 25 
    mStdWindowClasses[18] = "HUD_RadialMenu";                                   //05DA : 0F 10 2C 12 01 40 87 97 19 1F 48 55 44 5F 52 61 64 69 61 6C 4D 65 6E 75 00 
    mStdWindowStyles[18] = 64 | 16 | 32;                                        //05F3 : 0F 10 2C 12 01 B8 87 97 19 9E 9E 2C 40 2C 10 16 2C 20 16 
    mStdWindowTitles[18] = "Radial Menu";                                       //0606 : 0F 10 2C 12 01 00 1F 97 19 1F 52 61 64 69 61 6C 20 4D 65 6E 75 00 
    mStdWindowClasses[80] = "HUD_ItemContextMenu";                              //061C : 0F 10 2C 50 01 40 87 97 19 1F 48 55 44 5F 49 74 65 6D 43 6F 6E 74 65 78 74 4D 65 6E 75 00 
    mStdWindowStyles[80] = 64 | 16;                                             //063A : 0F 10 2C 50 01 B8 87 97 19 9E 2C 40 2C 10 16 
    mStdWindowTitles[80] = "Item Context Menu";                                 //0649 : 0F 10 2C 50 01 00 1F 97 19 1F 49 74 65 6D 20 43 6F 6E 74 65 78 74 20 4D 65 6E 75 00 
    mStdWindowClasses[19] = "HUD_Options";                                      //0665 : 0F 10 2C 13 01 40 87 97 19 1F 48 55 44 5F 4F 70 74 69 6F 6E 73 00 
    mStdWindowStyles[19] = 1 | 16646144 | -16777216 | 256 | 32;                 //067B : 0F 10 2C 13 01 B8 87 97 19 9E 9E 9E 9E 26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 2C 20 16 
    mStdWindowTitles[19] = Class'SBGuiStrings'.default.Options.Text;            //069E : 0F 10 2C 13 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 8C 97 19 
    mStdWindowClasses[20] = "HUD_Login";                                        //06BA : 0F 10 2C 14 01 40 87 97 19 1F 48 55 44 5F 4C 6F 67 69 6E 00 
    mStdWindowStyles[20] = 1 | 16646144 | -16777216 | 256 | 512 | 2 | 1024 | 4096;//06CE : 0F 10 2C 14 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 9E 26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 1D 00 02 00 00 16 2C 02 16 1D 00 04 00 00 16 1D 00 10 00 00 16 
    mStdWindowTitles[20] = Class'SBGuiStrings'.default.Login.Text;              //0706 : 0F 10 2C 14 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 8D 97 19 
    mStdWindowClasses[21] = "HUD_UniverseSelection";                            //0722 : 0F 10 2C 15 01 40 87 97 19 1F 48 55 44 5F 55 6E 69 76 65 72 73 65 53 65 6C 65 63 74 69 6F 6E 00 
    mStdWindowStyles[21] = 1 | 16646144 | -16777216 | 256 | 512 | 2 | 1024 | 4096;//0742 : 0F 10 2C 15 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 9E 26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 1D 00 02 00 00 16 2C 02 16 1D 00 04 00 00 16 1D 00 10 00 00 16 
    mStdWindowTitles[21] = Class'SBGuiStrings'.default.Universe_Selection.Text; //077A : 0F 10 2C 15 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 8D 97 19 
    mStdWindowClasses[22] = "HUD_CharacterSelection";                           //0796 : 0F 10 2C 16 01 40 87 97 19 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 65 6C 65 63 74 69 6F 6E 00 
    mStdWindowStyles[22] = 64 | 16646144 | -16777216 | 256 | 4096;              //07B7 : 0F 10 2C 16 01 B8 87 97 19 9E 9E 9E 9E 2C 40 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 1D 00 10 00 00 16 
    mStdWindowTitles[22] = Class'SBGuiStrings'.default.Character_Selection.Text;//07DE : 0F 10 2C 16 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 8E 97 19 
    mStdWindowClasses[37] = "HUD_CharacterDeleteConfirmation";                  //07FA : 0F 10 2C 25 01 40 87 97 19 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 44 65 6C 65 74 65 43 6F 6E 66 69 72 6D 61 74 69 6F 6E 00 
    mStdWindowStyles[37] = 4096 | 2 | 32 | 1 | 262144 | 2097152 | 65536;        //0824 : 0F 10 2C 25 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 1D 00 10 00 00 2C 02 16 2C 20 16 26 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 
    mStdWindowTitles[37] = Class'SBGuiStrings'.default.Are_you_sure_you_want_to_delete_this_character_.Text;//0852 : 0F 10 2C 25 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 8E 97 19 
    mStdWindowClasses[24] = "HUD_WorldMap";                                     //086E : 0F 10 2C 18 01 40 87 97 19 1F 48 55 44 5F 57 6F 72 6C 64 4D 61 70 00 
    mStdWindowStyles[24] = 8192 | 1 | 256 | 8388608;                            //0885 : 0F 10 2C 18 01 B8 87 97 19 9E 9E 9E 1D 00 20 00 00 26 16 1D 00 01 00 00 16 1D 00 00 80 00 16 
    mStdWindowTitles[24] = Class'SBGuiStrings'.default.Shard_Map.Text;          //08A4 : 0F 10 2C 18 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 8F 97 19 
    mStdWindowClasses[25] = "HUD_CC_Main";                                      //08C0 : 0F 10 2C 19 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 4D 61 69 6E 00 
    mStdWindowStyles[25] = 64 | 256 | 2 | 4096;                                 //08D6 : 0F 10 2C 19 01 B8 87 97 19 9E 9E 9E 2C 40 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[25] = Class'SBGuiStrings'.default.Character_Creation.Text; //08F3 : 0F 10 2C 19 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 8F 97 19 
    mStdWindowClasses[27] = "HUD_CC_ClassInfo";                                 //090F : 0F 10 2C 1B 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 43 6C 61 73 73 49 6E 66 6F 00 
    mStdWindowStyles[27] = 1 | 256 | 2 | 4096;                                  //092A : 0F 10 2C 1B 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[27] = Class'SBGuiStrings'.default.Main_Class_Information.Text;//0946 : 0F 10 2C 1B 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 90 97 19 
    mStdWindowClasses[26] = "HUD_CC_SelectSkills";                              //0962 : 0F 10 2C 1A 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 53 65 6C 65 63 74 53 6B 69 6C 6C 73 00 
    mStdWindowStyles[26] = 1 | 256 | 2 | 4096;                                  //0980 : 0F 10 2C 1A 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[26] = Class'SBGuiStrings'.default.Select_Skills.Text;      //099C : 0F 10 2C 1A 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 90 97 19 
    mStdWindowClasses[28] = "HUD_CC_ChooseClass";                               //09B8 : 0F 10 2C 1C 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 43 68 6F 6F 73 65 43 6C 61 73 73 00 
    mStdWindowStyles[28] = 256 | 4096;                                          //09D5 : 0F 10 2C 1C 01 B8 87 97 19 9E 1D 00 01 00 00 1D 00 10 00 00 16 
    mStdWindowClasses[29] = "HUD_CC_Body";                                      //09EA : 0F 10 2C 1D 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 42 6F 64 79 00 
    mStdWindowStyles[29] = 1 | 256 | 2 | 4096;                                  //0A00 : 0F 10 2C 1D 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[29] = Class'SBGuiStrings'.default.Body.Text;               //0A1C : 0F 10 2C 1D 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 91 97 19 
    mStdWindowClasses[30] = "HUD_CC_Head";                                      //0A38 : 0F 10 2C 1E 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 48 65 61 64 00 
    mStdWindowStyles[30] = 1 | 256 | 2 | 4096;                                  //0A4E : 0F 10 2C 1E 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[30] = Class'SBGuiStrings'.default.Head_Selection.Text;     //0A6A : 0F 10 2C 1E 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 91 97 19 
    mStdWindowClasses[31] = "HUD_CC_Tattoos";                                   //0A86 : 0F 10 2C 1F 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 54 61 74 74 6F 6F 73 00 
    mStdWindowStyles[31] = 1 | 256 | 2 | 4096;                                  //0A9F : 0F 10 2C 1F 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[31] = Class'SBGuiStrings'.default.Tattoos.Text;            //0ABB : 0F 10 2C 1F 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 92 97 19 
    mStdWindowClasses[32] = "HUD_CC_Clothing";                                  //0AD7 : 0F 10 2C 20 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 43 6C 6F 74 68 69 6E 67 00 
    mStdWindowStyles[32] = 1 | 256 | 2 | 4096;                                  //0AF1 : 0F 10 2C 20 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[32] = Class'SBGuiStrings'.default.clothing.Text;           //0B0D : 0F 10 2C 20 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 92 97 19 
    mStdWindowClasses[33] = "HUD_CC_Armour";                                    //0B29 : 0F 10 2C 21 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 41 72 6D 6F 75 72 00 
    mStdWindowStyles[33] = 1 | 256 | 2 | 4096;                                  //0B41 : 0F 10 2C 21 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[33] = Class'SBGuiStrings'.default.Armour.Text;             //0B5D : 0F 10 2C 21 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 92 97 19 
    mStdWindowClasses[34] = "HUD_CC_Name";                                      //0B79 : 0F 10 2C 22 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 4E 61 6D 65 00 
    mStdWindowStyles[34] = 1 | 256 | 2 | 4096;                                  //0B8F : 0F 10 2C 22 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[34] = Class'SBGuiStrings'.default.CharName.Text;           //0BAB : 0F 10 2C 22 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 93 97 19 
    mStdWindowClasses[35] = "HUD_CC_Create";                                    //0BC7 : 0F 10 2C 23 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 43 72 65 61 74 65 00 
    mStdWindowStyles[35] = 1 | 256 | 2 | 4096;                                  //0BDF : 0F 10 2C 23 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[35] = Class'SBGuiStrings'.default.Create.Text;             //0BFB : 0F 10 2C 23 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 93 97 19 
    mStdWindowClasses[38] = "HUD_CharacterStatistics";                          //0C17 : 0F 10 2C 26 01 40 87 97 19 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 00 
    mStdWindowStyles[38] = 128 | 8192 | 1 | 4 | 16646144 | 256;                 //0C39 : 0F 10 2C 26 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[38] = Class'SBGuiStrings'.default.Character_Statistics.Text;//0C60 : 0F 10 2C 26 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 94 97 19 
    mStdWindowClasses[36] = "HUD_CC_StatusWindow";                              //0C7C : 0F 10 2C 24 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 53 74 61 74 75 73 57 69 6E 64 6F 77 00 
    mStdWindowStyles[36] = 1 | 256 | 2 | 4096;                                  //0C9A : 0F 10 2C 24 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 
    mStdWindowTitles[36] = Class'SBGuiStrings'.default.Status.Text;             //0CB6 : 0F 10 2C 24 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 94 97 19 
    mStdWindowClasses[39] = "HUD_NewLoot";                                      //0CD2 : 0F 10 2C 27 01 40 87 97 19 1F 48 55 44 5F 4E 65 77 4C 6F 6F 74 00 
    mStdWindowStyles[39] = 64 | 4194304 | 524288 | 65536 | 4096;                //0CE8 : 0F 10 2C 27 01 B8 87 97 19 9E 9E 9E 9E 2C 40 1D 00 00 40 00 16 1D 00 00 08 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 
    mStdWindowTitles[39] = "";                                                  //0D0F : 0F 10 2C 27 01 00 1F 97 19 1F 00 
    mStdWindowClasses[40] = "HUD_SingleLoot";                                   //0D1A : 0F 10 2C 28 01 40 87 97 19 1F 48 55 44 5F 53 69 6E 67 6C 65 4C 6F 6F 74 00 
    mStdWindowStyles[40] = 4 | 1 | 16646144 | -16777216 | 8;                    //0D33 : 0F 10 2C 28 01 B8 87 97 19 9E 9E 9E 9E 2C 04 26 16 1D 00 00 FE 00 16 1D 00 00 00 FF 16 2C 08 16 
    mStdWindowTitles[40] = Class'SBGuiStrings'.default.Loot.Text;               //0D53 : 0F 10 2C 28 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 95 97 19 
    mStdWindowClasses[41] = "HUD_GroupLoot";                                    //0D6F : 0F 10 2C 29 01 40 87 97 19 1F 48 55 44 5F 47 72 6F 75 70 4C 6F 6F 74 00 
    mStdWindowStyles[41] = 4 | 1 | 16646144 | -16777216 | 8;                    //0D87 : 0F 10 2C 29 01 B8 87 97 19 9E 9E 9E 9E 2C 04 26 16 1D 00 00 FE 00 16 1D 00 00 00 FF 16 2C 08 16 
    mStdWindowTitles[41] = Class'SBGuiStrings'.default.Group_Loot.Text;         //0DA7 : 0F 10 2C 29 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 95 97 19 
    mStdWindowClasses[42] = "HUD_MasterLoot";                                   //0DC3 : 0F 10 2C 2A 01 40 87 97 19 1F 48 55 44 5F 4D 61 73 74 65 72 4C 6F 6F 74 00 
    mStdWindowStyles[42] = 4 | 1 | 16646144 | -16777216 | 8;                    //0DDC : 0F 10 2C 2A 01 B8 87 97 19 9E 9E 9E 9E 2C 04 26 16 1D 00 00 FE 00 16 1D 00 00 00 FF 16 2C 08 16 
    mStdWindowTitles[42] = Class'SBGuiStrings'.default.Master_Loot.Text;        //0DFC : 0F 10 2C 2A 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 96 97 19 
    mStdWindowClasses[45] = "GED_Editor";                                       //0E18 : 0F 10 2C 2D 01 40 87 97 19 1F 47 45 44 5F 45 64 69 74 6F 72 00 
    mStdWindowStyles[45] = 1 | 256 | 8 | 4;                                     //0E2D : 0F 10 2C 2D 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 08 16 2C 04 16 
    mStdWindowTitles[45] = "Editor";                                            //0E46 : 0F 10 2C 2D 01 00 1F 97 19 1F 45 64 69 74 6F 72 00 
    mStdWindowClasses[44] = "HUD_SkillDebugLog";                                //0E57 : 0F 10 2C 2C 01 40 87 97 19 1F 48 55 44 5F 53 6B 69 6C 6C 44 65 62 75 67 4C 6F 67 00 
    mStdWindowStyles[44] = 4 | 8 | 1 | 16646144 | -16777216 | 256;              //0E73 : 0F 10 2C 2C 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 04 2C 08 16 26 16 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 
    mStdWindowTitles[44] = "Skill debug log";                                   //0E9A : 0F 10 2C 2C 01 00 1F 97 19 1F 53 6B 69 6C 6C 20 64 65 62 75 67 20 6C 6F 67 00 
    mStdWindowClasses[43] = "HUD_NDAWindow";                                    //0EB4 : 0F 10 2C 2B 01 40 87 97 19 1F 48 55 44 5F 4E 44 41 57 69 6E 64 6F 77 00 
    mStdWindowStyles[43] = 4096 | 2 | 1 | 262144 | 2097152 | 65536 | 256;       //0ECC : 0F 10 2C 2B 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 1D 00 10 00 00 2C 02 16 26 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[43] = Class'SBGuiStrings'.default.Spellborn_NDA.Text;      //0EFD : 0F 10 2C 2B 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 96 97 19 
    mStdWindowClasses[46] = "HUD_TeamNotification";                             //0F19 : 0F 10 2C 2E 01 40 87 97 19 1F 48 55 44 5F 54 65 61 6D 4E 6F 74 69 66 69 63 61 74 69 6F 6E 00 
    mStdWindowStyles[46] = 64;                                                  //0F38 : 0F 10 2C 2E 01 B8 87 97 19 2C 40 
    mStdWindowTitles[46] = "";                                                  //0F43 : 0F 10 2C 2E 01 00 1F 97 19 1F 00 
    mStdWindowClasses[47] = "HUD_LoadingScreen";                                //0F4E : 0F 10 2C 2F 01 40 87 97 19 1F 48 55 44 5F 4C 6F 61 64 69 6E 67 53 63 72 65 65 6E 00 
    mStdWindowStyles[47] = 64 | 4096;                                           //0F6A : 0F 10 2C 2F 01 B8 87 97 19 9E 2C 40 1D 00 10 00 00 16 
    mStdWindowTitles[47] = "";                                                  //0F7C : 0F 10 2C 2F 01 00 1F 97 19 1F 00 
    mStdWindowClasses[51] = "HUD_Travel";                                       //0F87 : 0F 10 2C 33 01 40 87 97 19 1F 48 55 44 5F 54 72 61 76 65 6C 00 
    mStdWindowStyles[51] = 2 | 1 | 262144 | 2097152 | 65536 | 256;              //0F9C : 0F 10 2C 33 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 02 26 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[51] = Class'SBGuiStrings'.default.Traveling_to.Text;       //0FC6 : 0F 10 2C 33 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 97 97 19 
    mStdWindowClasses[52] = "HUD_MailBox";                                      //0FE2 : 0F 10 2C 34 01 40 87 97 19 1F 48 55 44 5F 4D 61 69 6C 42 6F 78 00 
    mStdWindowStyles[52] = 2 | 1 | 4 | 262144 | 2097152 | 256;                  //0FF8 : 0F 10 2C 34 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 02 26 16 2C 04 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[52] = Class'SBGuiStrings'.default.Mail.Text;               //101F : 0F 10 2C 34 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 97 97 19 
    mStdWindowClasses[48] = "HUD_RequestTrading";                               //103B : 0F 10 2C 30 01 40 87 97 19 1F 48 55 44 5F 52 65 71 75 65 73 74 54 72 61 64 69 6E 67 00 
    mStdWindowStyles[48] = 1 | 4 | 4096 | 2;                                    //1058 : 0F 10 2C 30 01 B8 87 97 19 9E 9E 9E 26 2C 04 16 1D 00 10 00 00 16 2C 02 16 
    mStdWindowTitles[48] = Class'SBGuiStrings'.default.Trade.Text;              //1071 : 0F 10 2C 30 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 98 97 19 
    mStdWindowClasses[49] = "HUD_Trading";                                      //108D : 0F 10 2C 31 01 40 87 97 19 1F 48 55 44 5F 54 72 61 64 69 6E 67 00 
    mStdWindowStyles[49] = 1 | 256 | 4 | 2 | 8192;                              //10A3 : 0F 10 2C 31 01 B8 87 97 19 9E 9E 9E 9E 26 1D 00 01 00 00 16 2C 04 16 2C 02 16 1D 00 20 00 00 16 
    mStdWindowTitles[49] = Class'SBGuiStrings'.default.Trading.Text;            //10C3 : 0F 10 2C 31 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 98 97 19 
    mStdWindowClasses[53] = "HUD_Shop_Buying";                                  //10DF : 0F 10 2C 35 01 40 87 97 19 1F 48 55 44 5F 53 68 6F 70 5F 42 75 79 69 6E 67 00 
    mStdWindowStyles[53] = 1 | 8192 | 4 | 256;                                  //10F9 : 0F 10 2C 35 01 B8 87 97 19 9E 9E 9E 26 1D 00 20 00 00 16 2C 04 16 1D 00 01 00 00 16 
    mStdWindowTitles[53] = Class'SBGuiStrings'.default.Shop.Text;               //1115 : 0F 10 2C 35 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 99 97 19 
    mStdWindowClasses[54] = "HUD_Shop_Crafting";                                //1131 : 0F 10 2C 36 01 40 87 97 19 1F 48 55 44 5F 53 68 6F 70 5F 43 72 61 66 74 69 6E 67 00 
    mStdWindowStyles[54] = 1 | 8192 | 4 | 256;                                  //114D : 0F 10 2C 36 01 B8 87 97 19 9E 9E 9E 26 1D 00 20 00 00 16 2C 04 16 1D 00 01 00 00 16 
    mStdWindowTitles[54] = Class'SBGuiStrings'.default.Shop.Text;               //1169 : 0F 10 2C 36 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 99 97 19 
    mStdWindowClasses[56] = "HUD_Shop_Painting";                                //1185 : 0F 10 2C 38 01 40 87 97 19 1F 48 55 44 5F 53 68 6F 70 5F 50 61 69 6E 74 69 6E 67 00 
    mStdWindowStyles[56] = 1 | 8192 | 4 | 256;                                  //11A1 : 0F 10 2C 38 01 B8 87 97 19 9E 9E 9E 26 1D 00 20 00 00 16 2C 04 16 1D 00 01 00 00 16 
    mStdWindowTitles[56] = Class'SBGuiStrings'.default.Shop.Text;               //11BD : 0F 10 2C 38 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 99 97 19 
    mStdWindowClasses[57] = "HUD_BodySlotWindow";                               //11D9 : 0F 10 2C 39 01 40 87 97 19 1F 48 55 44 5F 42 6F 64 79 53 6C 6F 74 57 69 6E 64 6F 77 00 
    mStdWindowStyles[57] = 4096 | 2 | 524288 | 1048576 | 65536;                 //11F6 : 0F 10 2C 39 01 B8 87 97 19 9E 9E 9E 9E 1D 00 10 00 00 2C 02 16 1D 00 00 08 00 16 1D 00 00 10 00 16 1D 00 00 01 00 16 
    mStdWindowTitles[57] = Class'SBGuiStrings'.default.Body_Slots.Text;         //121D : 0F 10 2C 39 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 99 97 19 
    mStdWindowClasses[59] = "HUD_ConfirmSkillSelectionWindow";                  //1239 : 0F 10 2C 3B 01 40 87 97 19 1F 48 55 44 5F 43 6F 6E 66 69 72 6D 53 6B 69 6C 6C 53 65 6C 65 63 74 69 6F 6E 57 69 6E 64 6F 77 00 
    mStdWindowStyles[59] = 4096 | 2 | 32 | 1;                                   //1263 : 0F 10 2C 3B 01 B8 87 97 19 9E 9E 9E 1D 00 10 00 00 2C 02 16 2C 20 16 26 16 
    mStdWindowTitles[59] = Class'SBGuiStrings'.default.Confirm_Skill_Selection.Text;//127C : 0F 10 2C 3B 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 9A 97 19 
    mStdWindowClasses[60] = "HUD_SheathWeaponWindow";                           //1298 : 0F 10 2C 3C 01 40 87 97 19 1F 48 55 44 5F 53 68 65 61 74 68 57 65 61 70 6F 6E 57 69 6E 64 6F 77 00 
    mStdWindowStyles[60] = 4096 | 2;                                            //12B9 : 0F 10 2C 3C 01 B8 87 97 19 9E 1D 00 10 00 00 2C 02 16 
    mStdWindowTitles[60] = "Sheath weapon";                                     //12CB : 0F 10 2C 3C 01 00 1F 97 19 1F 53 68 65 61 74 68 20 77 65 61 70 6F 6E 00 
    mStdWindowClasses[84] = "HUD_SkillLibrary";                                 //12E3 : 0F 10 2C 54 01 40 87 97 19 1F 48 55 44 5F 53 6B 69 6C 6C 4C 69 62 72 61 72 79 00 
    mStdWindowStyles[84] = 4 | 1;                                               //12FE : 0F 10 2C 54 01 B8 87 97 19 9E 2C 04 26 16 
    mStdWindowTitles[84] = Class'SBGuiStrings'.default.Skill_library.Text;      //130C : 0F 10 2C 54 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 9A 97 19 
    mStdWindowClasses[85] = "HUD_LearnSkillWindow";                             //1328 : 0F 10 2C 55 01 40 87 97 19 1F 48 55 44 5F 4C 65 61 72 6E 53 6B 69 6C 6C 57 69 6E 64 6F 77 00 
    mStdWindowStyles[85] = 4 | 1;                                               //1347 : 0F 10 2C 55 01 B8 87 97 19 9E 2C 04 26 16 
    mStdWindowTitles[85] = Class'SBGuiStrings'.default.Learn_a_new_skill.Text;  //1355 : 0F 10 2C 55 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 9A 97 19 
    mStdWindowClasses[86] = "HUD_UpgradeSkillWindow";                           //1371 : 0F 10 2C 56 01 40 87 97 19 1F 48 55 44 5F 55 70 67 72 61 64 65 53 6B 69 6C 6C 57 69 6E 64 6F 77 00 
    mStdWindowStyles[86] = 4 | 1;                                               //1392 : 0F 10 2C 56 01 B8 87 97 19 9E 2C 04 26 16 
    mStdWindowTitles[86] = Class'SBGuiStrings'.default.Upgrade_a_skill.Text;    //13A0 : 0F 10 2C 56 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 30 97 19 
    mStdWindowClasses[70] = "SBMiniGamesGui.MGame_MiniGamesList";               //13BC : 0F 10 2C 46 01 40 87 97 19 1F 53 42 4D 69 6E 69 47 61 6D 65 73 47 75 69 2E 4D 47 61 6D 65 5F 4D 69 6E 69 47 61 6D 65 73 4C 69 73 74 00 
    mStdWindowStyles[70] = 2 | 1 | 262144 | 2097152 | 65536 | 256;              //13E9 : 0F 10 2C 46 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 02 26 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[70] = Class'SBGuiStrings'.default.MiniGames.Text;          //1413 : 0F 10 2C 46 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 31 97 19 
    mStdWindowClasses[71] = "SBMiniGamesGUI.MGame_InvitationWindow";            //142F : 0F 10 2C 47 01 40 87 97 19 1F 53 42 4D 69 6E 69 47 61 6D 65 73 47 55 49 2E 4D 47 61 6D 65 5F 49 6E 76 69 74 61 74 69 6F 6E 57 69 6E 64 6F 77 00 
    mStdWindowStyles[71] = 2 | 1;                                               //145F : 0F 10 2C 47 01 B8 87 97 19 9E 2C 02 26 16 
    mStdWindowTitles[71] = Class'SBGuiStrings'.default.MiniGame_Invitation.Text;//146D : 0F 10 2C 47 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 31 97 19 
    mStdWindowClasses[72] = "SBMiniGamesGUI.MGame_MiniGameSettings";            //1489 : 0F 10 2C 48 01 40 87 97 19 1F 53 42 4D 69 6E 69 47 61 6D 65 73 47 55 49 2E 4D 47 61 6D 65 5F 4D 69 6E 69 47 61 6D 65 53 65 74 74 69 6E 67 73 00 
    mStdWindowStyles[72] = 2 | 1 | 262144 | 2097152 | 65536 | 256;              //14B9 : 0F 10 2C 48 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 02 26 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[72] = Class'SBGuiStrings'.default.MiniGame_Settings.Text;  //14E3 : 0F 10 2C 48 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 32 97 19 
    mStdWindowClasses[73] = "SBMiniGamesGUI.MGame_MiniGameWindow";              //14FF : 0F 10 2C 49 01 40 87 97 19 1F 53 42 4D 69 6E 69 47 61 6D 65 73 47 55 49 2E 4D 47 61 6D 65 5F 4D 69 6E 69 47 61 6D 65 57 69 6E 64 6F 77 00 
    mStdWindowStyles[73] = 2 | 1 | 262144 | 2097152 | 65536 | 256 | 4096;       //152D : 0F 10 2C 49 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 2C 02 26 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 1D 00 10 00 00 16 
    mStdWindowTitles[73] = Class'SBGuiStrings'.default.MiniGames.Text;          //155E : 0F 10 2C 49 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 31 97 19 
    mStdWindowClasses[65] = "HUD_Create_Guild";                                 //157A : 0F 10 2C 41 01 40 87 97 19 1F 48 55 44 5F 43 72 65 61 74 65 5F 47 75 69 6C 64 00 
    mStdWindowStyles[65] = 4 | 1 | 32;                                          //1595 : 0F 10 2C 41 01 B8 87 97 19 9E 9E 2C 04 26 16 2C 20 16 
    mStdWindowTitles[65] = Class'SBGuiStrings'.default.Create_Guild.Text;       //15A7 : 0F 10 2C 41 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 32 97 19 
    mStdWindowClasses[66] = "HUD_Join_Guild";                                   //15C3 : 0F 10 2C 42 01 40 87 97 19 1F 48 55 44 5F 4A 6F 69 6E 5F 47 75 69 6C 64 00 
    mStdWindowStyles[66] = 4 | 1 | 1024;                                        //15DC : 0F 10 2C 42 01 B8 87 97 19 9E 9E 2C 04 26 16 1D 00 04 00 00 16 
    mStdWindowTitles[66] = Class'SBGuiStrings'.default.Join_Guild.Text;         //15F1 : 0F 10 2C 42 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 33 97 19 
    mStdWindowClasses[67] = "HUD_GuildList";                                    //160D : 0F 10 2C 43 01 40 87 97 19 1F 48 55 44 5F 47 75 69 6C 64 4C 69 73 74 00 
    mStdWindowStyles[67] = 128 | 8192 | 1 | 4 | 16646144 | 256;                 //1625 : 0F 10 2C 43 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[67] = Class'SBGuiStrings'.default.Guild.Text;              //164C : 0F 10 2C 43 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 33 97 19 
    mStdWindowClasses[78] = "HUD_FriendIgnoreList";                             //1668 : 0F 10 2C 4E 01 40 87 97 19 1F 48 55 44 5F 46 72 69 65 6E 64 49 67 6E 6F 72 65 4C 69 73 74 00 
    mStdWindowStyles[78] = 128 | 8192 | 1 | 4 | 16646144 | 256;                 //1687 : 0F 10 2C 4E 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    mStdWindowTitles[78] = Class'SBGuiStrings'.default.Friend_Ignore_List.Text; //16AE : 0F 10 2C 4E 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 34 97 19 
    mStdWindowClasses[68] = "HUD_HelpKnowledgeBase";                            //16CA : 0F 10 2C 44 01 40 87 97 19 1F 48 55 44 5F 48 65 6C 70 4B 6E 6F 77 6C 65 64 67 65 42 61 73 65 00 
    mStdWindowStyles[68] = 8192 | 1 | 16646144 | -16777216 | 256 | 4;           //16EA : 0F 10 2C 44 01 B8 87 97 19 9E 9E 9E 9E 9E 1D 00 20 00 00 26 16 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 2C 04 16 
    mStdWindowTitles[68] = Class'SBGuiStrings'.default.help.Text;               //1714 : 0F 10 2C 44 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 34 97 19 
    mStdWindowClasses[69] = "HUD_HelpTutorial";                                 //1730 : 0F 10 2C 45 01 40 87 97 19 1F 48 55 44 5F 48 65 6C 70 54 75 74 6F 72 69 61 6C 00 
    mStdWindowStyles[69] = 1 | 4;                                               //174B : 0F 10 2C 45 01 B8 87 97 19 9E 26 2C 04 16 
    mStdWindowTitles[69] = Class'SBGuiStrings'.default.Tutorial.Text;           //1759 : 0F 10 2C 45 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 34 97 19 
    mStdWindowClasses[79] = "HUD_RulesWindow";                                  //1775 : 0F 10 2C 4F 01 40 87 97 19 1F 48 55 44 5F 52 75 6C 65 73 57 69 6E 64 6F 77 00 
    mStdWindowStyles[79] = 1 | 16646144 | -16777216 | 256 | 4;                  //178F : 0F 10 2C 4F 01 B8 87 97 19 9E 9E 9E 9E 26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 2C 04 16 
    mStdWindowTitles[79] = Class'SBGuiStrings'.default.Rules.Text;              //17B2 : 0F 10 2C 4F 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 35 97 19 
    mStdWindowClasses[75] = "HUD_CreditsWindow";                                //17CE : 0F 10 2C 4B 01 40 87 97 19 1F 48 55 44 5F 43 72 65 64 69 74 73 57 69 6E 64 6F 77 00 
    mStdWindowStyles[75] = 32;                                                  //17EA : 0F 10 2C 4B 01 B8 87 97 19 2C 20 
    mStdWindowTitles[75] = Class'SBGuiStrings'.default.The_Chronicles_of_Spellborn_Credits.Text;//17F5 : 0F 10 2C 4B 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 A3 97 19 
    mStdWindowClasses[76] = "HUD_OnScreenMessages";                             //1811 : 0F 10 2C 4C 01 40 87 97 19 1F 48 55 44 5F 4F 6E 53 63 72 65 65 6E 4D 65 73 73 61 67 65 73 00 
    mStdWindowStyles[76] = 64 | 262144 | 2097152 | 65536;                       //1830 : 0F 10 2C 4C 01 B8 87 97 19 9E 9E 9E 2C 40 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 
    mStdWindowTitles[76] = "On Screen Messages";                                //1850 : 0F 10 2C 4C 01 00 1F 97 19 1F 4F 6E 20 53 63 72 65 65 6E 20 4D 65 73 73 61 67 65 73 00 
    mStdWindowClasses[74] = "HUD_TimerWindow";                                  //186D : 0F 10 2C 4A 01 40 87 97 19 1F 48 55 44 5F 54 69 6D 65 72 57 69 6E 64 6F 77 00 
    mStdWindowStyles[74] = 4096 | 1048576 | 4194304;                            //1887 : 0F 10 2C 4A 01 B8 87 97 19 9E 9E 1D 00 10 00 00 1D 00 00 10 00 16 1D 00 00 40 00 16 
    mStdWindowTitles[74] = Class'SBGuiStrings'.default.Timers.Text;             //18A3 : 0F 10 2C 4A 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 A3 97 19 
    mStdWindowClasses[81] = "HUD_PingWindow";                                   //18BF : 0F 10 2C 51 01 40 87 97 19 1F 48 55 44 5F 50 69 6E 67 57 69 6E 64 6F 77 00 
    mStdWindowStyles[81] = 1 | 524288 | 65536;                                  //18D8 : 0F 10 2C 51 01 B8 87 97 19 9E 9E 26 1D 00 00 08 00 16 1D 00 00 01 00 16 
    mStdWindowTitles[81] = "Ping";                                              //18F0 : 0F 10 2C 51 01 00 1F 97 19 1F 50 69 6E 67 00 
    mStdWindowClasses[82] = "HUD_PartyTravelOverview";                          //18FF : 0F 10 2C 52 01 40 87 97 19 1F 48 55 44 5F 50 61 72 74 79 54 72 61 76 65 6C 4F 76 65 72 76 69 65 77 00 
    mStdWindowStyles[82] = 1 | 4;                                               //1921 : 0F 10 2C 52 01 B8 87 97 19 9E 26 2C 04 16 
    mStdWindowTitles[82] = "Party Travel";                                      //192F : 0F 10 2C 52 01 00 1F 97 19 1F 50 61 72 74 79 20 54 72 61 76 65 6C 00 
    mStdWindowClasses[83] = "HUD_PartyTravelConfirmation";                      //1946 : 0F 10 2C 53 01 40 87 97 19 1F 48 55 44 5F 50 61 72 74 79 54 72 61 76 65 6C 43 6F 6E 66 69 72 6D 61 74 69 6F 6E 00 
    mStdWindowStyles[83] = 1 | 4;                                               //196C : 0F 10 2C 53 01 B8 87 97 19 9E 26 2C 04 16 
    mStdWindowTitles[83] = "Party Travel";                                      //197A : 0F 10 2C 53 01 00 1F 97 19 1F 50 61 72 74 79 20 54 72 61 76 65 6C 00 
    mStdWindowClasses[87] = "HUD_Progress";                                     //1991 : 0F 10 2C 57 01 40 87 97 19 1F 48 55 44 5F 50 72 6F 67 72 65 73 73 00 
    mStdWindowStyles[87] = 64 | 4096;                                           //19A8 : 0F 10 2C 57 01 B8 87 97 19 9E 2C 40 1D 00 10 00 00 16 
    mStdWindowTitles[87] = "Progress";                                          //19BA : 0F 10 2C 57 01 00 1F 97 19 1F 50 72 6F 67 72 65 73 73 00 
    mDnDInfo = new Class'GUI_DnDInfo';                                          //19CD : 0F 01 F8 02 89 19 11 0B 0B 0B 20 98 E0 2E 1D 
    mDnDInfo.mDesktop = self;                                                   //19DC : 0F 19 01 F8 02 89 19 05 00 04 01 40 A4 97 19 17 
    mToolkit = new mToolkitClass;                                               //19EC : 0F 01 B8 A4 97 19 11 0B 0B 0B 01 30 A5 97 19 
    mToolkit.Initialize(self);                                                  //19FB : 19 01 B8 A4 97 19 07 00 00 1B 38 04 00 00 17 16 
    CreateDefaultWindows();                                                     //1A0B : 1B B7 96 00 00 16 
    //0F 37 01 40 87 97 19 2C 58 0F 37 01 B8 87 97 19 2C 58 0F 37 01 30 88 97 19 2C 58 0F 37 01 00 1F 
    //97 19 2C 58 0F 10 25 01 40 87 97 19 1F 48 55 44 5F 4D 69 6E 69 6D 61 70 00 0F 10 25 01 B8 87 97 
    //19 9E 9E 9E 2C 40 1D 00 00 08 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 0F 10 26 01 40 87 97 19 
    //1F 48 55 44 5F 50 6C 61 79 65 72 41 76 61 74 61 72 00 0F 10 26 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 
    //40 2C 04 16 1D 00 00 10 00 16 1D 00 00 02 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 0F 10 2C 02 
    //01 40 87 97 19 1F 48 55 44 5F 54 61 72 67 65 74 41 76 61 74 61 72 00 0F 10 2C 02 01 B8 87 97 19 
    //9E 9E 9E 9E 2C 40 2C 04 16 1D 00 00 10 00 16 1D 00 00 00 FF 16 1D 00 10 00 00 16 0F 10 2C 03 01 
    //40 87 97 19 1F 48 55 44 5F 43 6F 6D 62 61 74 42 61 72 00 0F 10 2C 03 01 B8 87 97 19 9E 9E 9E 9E 
    //2C 40 1D 00 00 04 00 16 1D 00 00 40 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 0F 10 2C 04 01 40 
    //87 97 19 1F 48 55 44 5F 47 61 6D 65 4D 65 6E 75 00 0F 10 2C 04 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 
    //40 2C 04 16 1D 00 00 40 00 16 1D 00 00 08 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 0F 10 2C 05 
    //01 40 87 97 19 1F 48 55 44 5F 53 79 73 74 65 6D 4D 65 6E 75 00 0F 10 2C 05 01 B8 87 97 19 9E 9E 
    //9E 9E 9E 9E 26 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 1D 00 00 
    //80 00 16 2C 20 16 0F 10 2C 05 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 88 
    //97 19 0F 10 2C 06 01 40 87 97 19 1F 48 55 44 5F 51 75 65 73 74 4C 6F 67 00 0F 10 2C 06 01 B8 87 
    //97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    //0F 10 2C 06 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 89 97 19 0F 10 2C 07 
    //01 40 87 97 19 1F 48 55 44 5F 43 6F 6E 76 65 72 73 61 74 69 6F 6E 00 0F 10 2C 07 01 B8 87 97 19 
    //9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 0F 10 
    //2C 07 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 89 97 19 0F 10 2C 08 01 40 
    //87 97 19 1F 48 55 44 5F 42 75 67 52 65 70 6F 72 74 00 0F 10 2C 08 01 B8 87 97 19 9E 9E 9E 9E 9E 
    //26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 2C 08 16 2C 04 16 0F 10 2C 08 01 00 1F 
    //97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 8A 97 19 0F 10 2C 09 01 40 87 97 19 1F 48 
    //55 44 5F 49 6E 76 65 6E 74 6F 72 79 00 0F 10 2C 09 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 
    //00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 0F 10 2C 09 01 00 1F 97 19 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 8A 97 19 0F 10 2C 0A 01 40 87 97 19 1F 48 55 44 5F 45 71 
    //75 69 70 6D 65 6E 74 00 0F 10 2C 0A 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 
    //2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 0F 10 2C 0A 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 00 8B 97 19 0F 10 2C 0B 01 40 87 97 19 1F 48 55 44 5F 46 72 69 65 6E 64 73 
    //00 0F 10 2C 0B 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 
    //00 00 16 2C 80 16 2C 04 16 1D 00 00 80 00 16 0F 10 2C 0B 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 78 8B 97 19 0F 10 2C 0C 01 40 87 97 19 1F 48 55 44 5F 54 65 61 6D 00 0F 10 
    //2C 0C 01 B8 87 97 19 9E 9E 9E 2C 40 2C 04 16 1D 00 10 00 00 16 1D 00 00 40 00 16 0F 10 2C 4D 01 
    //40 87 97 19 1F 48 55 44 5F 50 65 74 00 0F 10 2C 4D 01 B8 87 97 19 9E 9E 9E 2C 40 2C 04 16 1D 00 
    //10 00 00 16 1D 00 00 40 00 16 0F 10 2C 0D 01 40 87 97 19 1F 48 55 44 5F 43 68 61 74 00 0F 10 2C 
    //0D 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 9E 2C 02 2C 40 16 2C 08 16 1D 00 00 40 00 16 1D 00 00 02 00 
    //16 1D 00 00 01 00 16 1D 00 08 00 00 16 1D 00 10 00 00 16 0F 10 2C 0E 01 40 87 97 19 1F 48 55 44 
    //5F 4E 65 74 53 74 61 74 73 00 0F 10 2C 0E 01 B8 87 97 19 9E 9E 9E 2C 40 2C 04 16 1D 00 00 FE 00 
    //16 1D 00 00 00 FF 16 0F 10 2C 11 01 40 87 97 19 1F 48 55 44 5F 53 6B 69 6C 6C 42 6F 6F 6B 00 0F 
    //10 2C 11 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 
    //1D 00 01 00 00 16 0F 10 2C 11 01 30 88 97 19 25 0F 10 2C 11 01 00 1F 97 19 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 F0 8B 97 19 0F 10 2C 10 01 40 87 97 19 1F 48 55 44 5F 53 6B 69 6C 6C 44 
    //65 63 6B 00 0F 10 2C 10 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 
    //00 00 FE 00 16 1D 00 01 00 00 16 0F 10 2C 10 01 30 88 97 19 25 0F 10 2C 10 01 00 1F 97 19 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 8C 97 19 0F 10 2C 0F 01 40 87 97 19 1F 48 55 44 5F 44 
    //65 61 74 68 52 65 73 70 61 77 6E 00 0F 10 2C 0F 01 B8 87 97 19 9E 9E 9E 9E 9E 26 2C 04 16 2C 20 
    //16 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 0F 01 30 88 97 19 25 0F 10 2C 12 01 40 
    //87 97 19 1F 48 55 44 5F 52 61 64 69 61 6C 4D 65 6E 75 00 0F 10 2C 12 01 B8 87 97 19 9E 9E 2C 40 
    //2C 10 16 2C 20 16 0F 10 2C 12 01 00 1F 97 19 1F 52 61 64 69 61 6C 20 4D 65 6E 75 00 0F 10 2C 50 
    //01 40 87 97 19 1F 48 55 44 5F 49 74 65 6D 43 6F 6E 74 65 78 74 4D 65 6E 75 00 0F 10 2C 50 01 B8 
    //87 97 19 9E 2C 40 2C 10 16 0F 10 2C 50 01 00 1F 97 19 1F 49 74 65 6D 20 43 6F 6E 74 65 78 74 20 
    //4D 65 6E 75 00 0F 10 2C 13 01 40 87 97 19 1F 48 55 44 5F 4F 70 74 69 6F 6E 73 00 0F 10 2C 13 01 
    //B8 87 97 19 9E 9E 9E 9E 26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 2C 20 16 0F 10 
    //2C 13 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 8C 97 19 0F 10 2C 14 01 40 
    //87 97 19 1F 48 55 44 5F 4C 6F 67 69 6E 00 0F 10 2C 14 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 9E 26 1D 
    //00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 1D 00 02 00 00 16 2C 02 16 1D 00 04 00 00 16 
    //1D 00 10 00 00 16 0F 10 2C 14 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 8D 
    //97 19 0F 10 2C 15 01 40 87 97 19 1F 48 55 44 5F 55 6E 69 76 65 72 73 65 53 65 6C 65 63 74 69 6F 
    //6E 00 0F 10 2C 15 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 9E 26 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 
    //00 01 00 00 16 1D 00 02 00 00 16 2C 02 16 1D 00 04 00 00 16 1D 00 10 00 00 16 0F 10 2C 15 01 00 
    //1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 8D 97 19 0F 10 2C 16 01 40 87 97 19 1F 
    //48 55 44 5F 43 68 61 72 61 63 74 65 72 53 65 6C 65 63 74 69 6F 6E 00 0F 10 2C 16 01 B8 87 97 19 
    //9E 9E 9E 9E 2C 40 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 1D 00 10 00 00 16 0F 10 
    //2C 16 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 8E 97 19 0F 10 2C 25 01 40 
    //87 97 19 1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 44 65 6C 65 74 65 43 6F 6E 66 69 72 6D 61 74 
    //69 6F 6E 00 0F 10 2C 25 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 1D 00 10 00 00 2C 02 16 2C 20 16 26 16 
    //1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 0F 10 2C 25 01 00 1F 97 19 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 C0 8E 97 19 0F 10 2C 18 01 40 87 97 19 1F 48 55 44 5F 57 6F 72 6C 
    //64 4D 61 70 00 0F 10 2C 18 01 B8 87 97 19 9E 9E 9E 1D 00 20 00 00 26 16 1D 00 01 00 00 16 1D 00 
    //00 80 00 16 0F 10 2C 18 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 8F 97 19 
    //0F 10 2C 19 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 4D 61 69 6E 00 0F 10 2C 19 01 B8 87 97 19 9E 
    //9E 9E 2C 40 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 19 01 00 1F 97 19 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 B0 8F 97 19 0F 10 2C 1B 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 
    //43 6C 61 73 73 49 6E 66 6F 00 0F 10 2C 1B 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 
    //1D 00 10 00 00 16 0F 10 2C 1B 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 90 
    //97 19 0F 10 2C 1A 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 53 65 6C 65 63 74 53 6B 69 6C 6C 73 00 
    //0F 10 2C 1A 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 1A 
    //01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 90 97 19 0F 10 2C 1C 01 40 87 97 
    //19 1F 48 55 44 5F 43 43 5F 43 68 6F 6F 73 65 43 6C 61 73 73 00 0F 10 2C 1C 01 B8 87 97 19 9E 1D 
    //00 01 00 00 1D 00 10 00 00 16 0F 10 2C 1D 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 42 6F 64 79 00 
    //0F 10 2C 1D 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 1D 
    //01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 91 97 19 0F 10 2C 1E 01 40 87 97 
    //19 1F 48 55 44 5F 43 43 5F 48 65 61 64 00 0F 10 2C 1E 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 
    //16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 1E 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 
    //0C 02 90 91 97 19 0F 10 2C 1F 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 54 61 74 74 6F 6F 73 00 0F 
    //10 2C 1F 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 1F 01 
    //00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 92 97 19 0F 10 2C 20 01 40 87 97 19 
    //1F 48 55 44 5F 43 43 5F 43 6C 6F 74 68 69 6E 67 00 0F 10 2C 20 01 B8 87 97 19 9E 9E 9E 26 1D 00 
    //01 00 00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 20 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 80 92 97 19 0F 10 2C 21 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 41 72 6D 6F 75 72 
    //00 0F 10 2C 21 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 
    //21 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 92 97 19 0F 10 2C 22 01 40 87 
    //97 19 1F 48 55 44 5F 43 43 5F 4E 61 6D 65 00 0F 10 2C 22 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 
    //00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 22 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 
    //00 0C 02 70 93 97 19 0F 10 2C 23 01 40 87 97 19 1F 48 55 44 5F 43 43 5F 43 72 65 61 74 65 00 0F 
    //10 2C 23 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 23 01 
    //00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 93 97 19 0F 10 2C 26 01 40 87 97 19 
    //1F 48 55 44 5F 43 68 61 72 61 63 74 65 72 53 74 61 74 69 73 74 69 63 73 00 0F 10 2C 26 01 B8 87 
    //97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 
    //0F 10 2C 26 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 94 97 19 0F 10 2C 24 
    //01 40 87 97 19 1F 48 55 44 5F 43 43 5F 53 74 61 74 75 73 57 69 6E 64 6F 77 00 0F 10 2C 24 01 B8 
    //87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 2C 02 16 1D 00 10 00 00 16 0F 10 2C 24 01 00 1F 97 19 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 94 97 19 0F 10 2C 27 01 40 87 97 19 1F 48 55 44 5F 
    //4E 65 77 4C 6F 6F 74 00 0F 10 2C 27 01 B8 87 97 19 9E 9E 9E 9E 2C 40 1D 00 00 40 00 16 1D 00 00 
    //08 00 16 1D 00 00 01 00 16 1D 00 10 00 00 16 0F 10 2C 27 01 00 1F 97 19 1F 00 0F 10 2C 28 01 40 
    //87 97 19 1F 48 55 44 5F 53 69 6E 67 6C 65 4C 6F 6F 74 00 0F 10 2C 28 01 B8 87 97 19 9E 9E 9E 9E 
    //2C 04 26 16 1D 00 00 FE 00 16 1D 00 00 00 FF 16 2C 08 16 0F 10 2C 28 01 00 1F 97 19 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 50 95 97 19 0F 10 2C 29 01 40 87 97 19 1F 48 55 44 5F 47 72 6F 
    //75 70 4C 6F 6F 74 00 0F 10 2C 29 01 B8 87 97 19 9E 9E 9E 9E 2C 04 26 16 1D 00 00 FE 00 16 1D 00 
    //00 00 FF 16 2C 08 16 0F 10 2C 29 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 
    //95 97 19 0F 10 2C 2A 01 40 87 97 19 1F 48 55 44 5F 4D 61 73 74 65 72 4C 6F 6F 74 00 0F 10 2C 2A 
    //01 B8 87 97 19 9E 9E 9E 9E 2C 04 26 16 1D 00 00 FE 00 16 1D 00 00 00 FF 16 2C 08 16 0F 10 2C 2A 
    //01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 96 97 19 0F 10 2C 2D 01 40 87 97 
    //19 1F 47 45 44 5F 45 64 69 74 6F 72 00 0F 10 2C 2D 01 B8 87 97 19 9E 9E 9E 26 1D 00 01 00 00 16 
    //2C 08 16 2C 04 16 0F 10 2C 2D 01 00 1F 97 19 1F 45 64 69 74 6F 72 00 0F 10 2C 2C 01 40 87 97 19 
    //1F 48 55 44 5F 53 6B 69 6C 6C 44 65 62 75 67 4C 6F 67 00 0F 10 2C 2C 01 B8 87 97 19 9E 9E 9E 9E 
    //9E 2C 04 2C 08 16 26 16 1D 00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 0F 10 2C 2C 01 00 
    //1F 97 19 1F 53 6B 69 6C 6C 20 64 65 62 75 67 20 6C 6F 67 00 0F 10 2C 2B 01 40 87 97 19 1F 48 55 
    //44 5F 4E 44 41 57 69 6E 64 6F 77 00 0F 10 2C 2B 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 1D 00 10 00 00 
    //2C 02 16 26 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 0F 10 2C 
    //2B 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 96 97 19 0F 10 2C 2E 01 40 87 
    //97 19 1F 48 55 44 5F 54 65 61 6D 4E 6F 74 69 66 69 63 61 74 69 6F 6E 00 0F 10 2C 2E 01 B8 87 97 
    //19 2C 40 0F 10 2C 2E 01 00 1F 97 19 1F 00 0F 10 2C 2F 01 40 87 97 19 1F 48 55 44 5F 4C 6F 61 64 
    //69 6E 67 53 63 72 65 65 6E 00 0F 10 2C 2F 01 B8 87 97 19 9E 2C 40 1D 00 10 00 00 16 0F 10 2C 2F 
    //01 00 1F 97 19 1F 00 0F 10 2C 33 01 40 87 97 19 1F 48 55 44 5F 54 72 61 76 65 6C 00 0F 10 2C 33 
    //01 B8 87 97 19 9E 9E 9E 9E 9E 2C 02 26 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 
    //1D 00 01 00 00 16 0F 10 2C 33 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 97 
    //97 19 0F 10 2C 34 01 40 87 97 19 1F 48 55 44 5F 4D 61 69 6C 42 6F 78 00 0F 10 2C 34 01 B8 87 97 
    //19 9E 9E 9E 9E 9E 2C 02 26 16 2C 04 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 01 00 00 16 0F 
    //10 2C 34 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 97 97 19 0F 10 2C 30 01 
    //40 87 97 19 1F 48 55 44 5F 52 65 71 75 65 73 74 54 72 61 64 69 6E 67 00 0F 10 2C 30 01 B8 87 97 
    //19 9E 9E 9E 26 2C 04 16 1D 00 10 00 00 16 2C 02 16 0F 10 2C 30 01 00 1F 97 19 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 20 98 97 19 0F 10 2C 31 01 40 87 97 19 1F 48 55 44 5F 54 72 61 64 69 
    //6E 67 00 0F 10 2C 31 01 B8 87 97 19 9E 9E 9E 9E 26 1D 00 01 00 00 16 2C 04 16 2C 02 16 1D 00 20 
    //00 00 16 0F 10 2C 31 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 98 97 19 0F 
    //10 2C 35 01 40 87 97 19 1F 48 55 44 5F 53 68 6F 70 5F 42 75 79 69 6E 67 00 0F 10 2C 35 01 B8 87 
    //97 19 9E 9E 9E 26 1D 00 20 00 00 16 2C 04 16 1D 00 01 00 00 16 0F 10 2C 35 01 00 1F 97 19 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 99 97 19 0F 10 2C 36 01 40 87 97 19 1F 48 55 44 5F 53 
    //68 6F 70 5F 43 72 61 66 74 69 6E 67 00 0F 10 2C 36 01 B8 87 97 19 9E 9E 9E 26 1D 00 20 00 00 16 
    //2C 04 16 1D 00 01 00 00 16 0F 10 2C 36 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 10 99 97 19 0F 10 2C 38 01 40 87 97 19 1F 48 55 44 5F 53 68 6F 70 5F 50 61 69 6E 74 69 6E 67 
    //00 0F 10 2C 38 01 B8 87 97 19 9E 9E 9E 26 1D 00 20 00 00 16 2C 04 16 1D 00 01 00 00 16 0F 10 2C 
    //38 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 99 97 19 0F 10 2C 39 01 40 87 
    //97 19 1F 48 55 44 5F 42 6F 64 79 53 6C 6F 74 57 69 6E 64 6F 77 00 0F 10 2C 39 01 B8 87 97 19 9E 
    //9E 9E 9E 1D 00 10 00 00 2C 02 16 1D 00 00 08 00 16 1D 00 00 10 00 16 1D 00 00 01 00 16 0F 10 2C 
    //39 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 99 97 19 0F 10 2C 3B 01 40 87 
    //97 19 1F 48 55 44 5F 43 6F 6E 66 69 72 6D 53 6B 69 6C 6C 53 65 6C 65 63 74 69 6F 6E 57 69 6E 64 
    //6F 77 00 0F 10 2C 3B 01 B8 87 97 19 9E 9E 9E 1D 00 10 00 00 2C 02 16 2C 20 16 26 16 0F 10 2C 3B 
    //01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 9A 97 19 0F 10 2C 3C 01 40 87 97 
    //19 1F 48 55 44 5F 53 68 65 61 74 68 57 65 61 70 6F 6E 57 69 6E 64 6F 77 00 0F 10 2C 3C 01 B8 87 
    //97 19 9E 1D 00 10 00 00 2C 02 16 0F 10 2C 3C 01 00 1F 97 19 1F 53 68 65 61 74 68 20 77 65 61 70 
    //6F 6E 00 0F 10 2C 54 01 40 87 97 19 1F 48 55 44 5F 53 6B 69 6C 6C 4C 69 62 72 61 72 79 00 0F 10 
    //2C 54 01 B8 87 97 19 9E 2C 04 26 16 0F 10 2C 54 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 78 9A 97 19 0F 10 2C 55 01 40 87 97 19 1F 48 55 44 5F 4C 65 61 72 6E 53 6B 69 6C 6C 
    //57 69 6E 64 6F 77 00 0F 10 2C 55 01 B8 87 97 19 9E 2C 04 26 16 0F 10 2C 55 01 00 1F 97 19 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 9A 97 19 0F 10 2C 56 01 40 87 97 19 1F 48 55 44 5F 55 
    //70 67 72 61 64 65 53 6B 69 6C 6C 57 69 6E 64 6F 77 00 0F 10 2C 56 01 B8 87 97 19 9E 2C 04 26 16 
    //0F 10 2C 56 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 30 97 19 0F 10 2C 46 
    //01 40 87 97 19 1F 53 42 4D 69 6E 69 47 61 6D 65 73 47 75 69 2E 4D 47 61 6D 65 5F 4D 69 6E 69 47 
    //61 6D 65 73 4C 69 73 74 00 0F 10 2C 46 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 02 26 16 1D 00 00 04 00 
    //16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 0F 10 2C 46 01 00 1F 97 19 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 38 31 97 19 0F 10 2C 47 01 40 87 97 19 1F 53 42 4D 69 6E 69 47 
    //61 6D 65 73 47 55 49 2E 4D 47 61 6D 65 5F 49 6E 76 69 74 61 74 69 6F 6E 57 69 6E 64 6F 77 00 0F 
    //10 2C 47 01 B8 87 97 19 9E 2C 02 26 16 0F 10 2C 47 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 B0 31 97 19 0F 10 2C 48 01 40 87 97 19 1F 53 42 4D 69 6E 69 47 61 6D 65 73 47 55 
    //49 2E 4D 47 61 6D 65 5F 4D 69 6E 69 47 61 6D 65 53 65 74 74 69 6E 67 73 00 0F 10 2C 48 01 B8 87 
    //97 19 9E 9E 9E 9E 9E 2C 02 26 16 1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 
    //00 00 16 0F 10 2C 48 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 32 97 19 0F 
    //10 2C 49 01 40 87 97 19 1F 53 42 4D 69 6E 69 47 61 6D 65 73 47 55 49 2E 4D 47 61 6D 65 5F 4D 69 
    //6E 69 47 61 6D 65 57 69 6E 64 6F 77 00 0F 10 2C 49 01 B8 87 97 19 9E 9E 9E 9E 9E 9E 2C 02 26 16 
    //1D 00 00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 1D 00 01 00 00 16 1D 00 10 00 00 16 0F 10 
    //2C 49 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 31 97 19 0F 10 2C 41 01 40 
    //87 97 19 1F 48 55 44 5F 43 72 65 61 74 65 5F 47 75 69 6C 64 00 0F 10 2C 41 01 B8 87 97 19 9E 9E 
    //2C 04 26 16 2C 20 16 0F 10 2C 41 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 
    //32 97 19 0F 10 2C 42 01 40 87 97 19 1F 48 55 44 5F 4A 6F 69 6E 5F 47 75 69 6C 64 00 0F 10 2C 42 
    //01 B8 87 97 19 9E 9E 2C 04 26 16 1D 00 04 00 00 16 0F 10 2C 42 01 00 1F 97 19 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 18 33 97 19 0F 10 2C 43 01 40 87 97 19 1F 48 55 44 5F 47 75 69 6C 64 
    //4C 69 73 74 00 0F 10 2C 43 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 04 16 
    //1D 00 00 FE 00 16 1D 00 01 00 00 16 0F 10 2C 43 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 90 33 97 19 0F 10 2C 4E 01 40 87 97 19 1F 48 55 44 5F 46 72 69 65 6E 64 49 67 6E 6F 
    //72 65 4C 69 73 74 00 0F 10 2C 4E 01 B8 87 97 19 9E 9E 9E 9E 9E 2C 80 1D 00 20 00 00 16 26 16 2C 
    //04 16 1D 00 00 FE 00 16 1D 00 01 00 00 16 0F 10 2C 4E 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 
    //32 1D 05 00 0C 02 08 34 97 19 0F 10 2C 44 01 40 87 97 19 1F 48 55 44 5F 48 65 6C 70 4B 6E 6F 77 
    //6C 65 64 67 65 42 61 73 65 00 0F 10 2C 44 01 B8 87 97 19 9E 9E 9E 9E 9E 1D 00 20 00 00 26 16 1D 
    //00 00 FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 2C 04 16 0F 10 2C 44 01 00 1F 97 19 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 34 97 19 0F 10 2C 45 01 40 87 97 19 1F 48 55 44 5F 48 65 
    //6C 70 54 75 74 6F 72 69 61 6C 00 0F 10 2C 45 01 B8 87 97 19 9E 26 2C 04 16 0F 10 2C 45 01 00 1F 
    //97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 34 97 19 0F 10 2C 4F 01 40 87 97 19 1F 48 
    //55 44 5F 52 75 6C 65 73 57 69 6E 64 6F 77 00 0F 10 2C 4F 01 B8 87 97 19 9E 9E 9E 9E 26 1D 00 00 
    //FE 00 16 1D 00 00 00 FF 16 1D 00 01 00 00 16 2C 04 16 0F 10 2C 4F 01 00 1F 97 19 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 70 35 97 19 0F 10 2C 4B 01 40 87 97 19 1F 48 55 44 5F 43 72 65 64 
    //69 74 73 57 69 6E 64 6F 77 00 0F 10 2C 4B 01 B8 87 97 19 2C 20 0F 10 2C 4B 01 00 1F 97 19 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 A3 97 19 0F 10 2C 4C 01 40 87 97 19 1F 48 55 44 5F 4F 
    //6E 53 63 72 65 65 6E 4D 65 73 73 61 67 65 73 00 0F 10 2C 4C 01 B8 87 97 19 9E 9E 9E 2C 40 1D 00 
    //00 04 00 16 1D 00 00 20 00 16 1D 00 00 01 00 16 0F 10 2C 4C 01 00 1F 97 19 1F 4F 6E 20 53 63 72 
    //65 65 6E 20 4D 65 73 73 61 67 65 73 00 0F 10 2C 4A 01 40 87 97 19 1F 48 55 44 5F 54 69 6D 65 72 
    //57 69 6E 64 6F 77 00 0F 10 2C 4A 01 B8 87 97 19 9E 9E 1D 00 10 00 00 1D 00 00 10 00 16 1D 00 00 
    //40 00 16 0F 10 2C 4A 01 00 1F 97 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 A3 97 19 0F 
    //10 2C 51 01 40 87 97 19 1F 48 55 44 5F 50 69 6E 67 57 69 6E 64 6F 77 00 0F 10 2C 51 01 B8 87 97 
    //19 9E 9E 26 1D 00 00 08 00 16 1D 00 00 01 00 16 0F 10 2C 51 01 00 1F 97 19 1F 50 69 6E 67 00 0F 
    //10 2C 52 01 40 87 97 19 1F 48 55 44 5F 50 61 72 74 79 54 72 61 76 65 6C 4F 76 65 72 76 69 65 77 
    //00 0F 10 2C 52 01 B8 87 97 19 9E 26 2C 04 16 0F 10 2C 52 01 00 1F 97 19 1F 50 61 72 74 79 20 54 
    //72 61 76 65 6C 00 0F 10 2C 53 01 40 87 97 19 1F 48 55 44 5F 50 61 72 74 79 54 72 61 76 65 6C 43 
    //6F 6E 66 69 72 6D 61 74 69 6F 6E 00 0F 10 2C 53 01 B8 87 97 19 9E 26 2C 04 16 0F 10 2C 53 01 00 
    //1F 97 19 1F 50 61 72 74 79 20 54 72 61 76 65 6C 00 0F 10 2C 57 01 40 87 97 19 1F 48 55 44 5F 50 
    //72 6F 67 72 65 73 73 00 0F 10 2C 57 01 B8 87 97 19 9E 2C 40 1D 00 10 00 00 16 0F 10 2C 57 01 00 
    //1F 97 19 1F 50 72 6F 67 72 65 73 73 00 0F 01 F8 02 89 19 11 0B 0B 0B 20 98 E0 2E 1D 0F 19 01 F8 
    //02 89 19 05 00 04 01 40 A4 97 19 17 0F 01 B8 A4 97 19 11 0B 0B 0B 01 30 A5 97 19 19 01 B8 A4 97 
    //19 07 00 00 1B 38 04 00 00 17 16 1B B7 96 00 00 16 04 0B 47 
  }



