//==============================================================================
//  GUI_BaseDesktop
//==============================================================================

class GUI_BaseDesktop extends Interaction
    native
    dependsOn()
  ;

  const GUI_MBS_WHEEL_DOWN = 16;
  const GUI_MBS_WHEEL_UP = 8;
  const GUI_MBS_CENTER = 4;
  const GUI_MBS_RIGHT = 2;
  const GUI_MBS_LEFT = 1;
  const GUI_SW_RESTORE = 32;
  const GUI_SW_MINIMIZE = 16;
  const GUI_SW_MAXIMIZE = 8;
  const GUI_SW_TOGGLE = 4;
  const GUI_SW_HIDE = 2;
  const GUI_SW_SHOWNORMAL = 1;
  const GUI_WDS_SNAP_ALL = -16777216;
  const GUI_WDS_SNAP_BOTTOM = 134217728;
  const GUI_WDS_SNAP_RIGHT = 67108864;
  const GUI_WDS_SNAP_TOP = 33554432;
  const GUI_WDS_SNAP_LEFT = 16777216;
  const GUI_WDS_DOCK_ALL = 16646144;
  const GUI_WDS_DOCK_BOTTOM = 4194304;
  const GUI_WDS_DOCK_CENTER_Y = 2097152;
  const GUI_WDS_DOCK_TOP = 1048576;
  const GUI_WDS_DOCK_RIGHT = 524288;
  const GUI_WDS_DOCK_CENTER_X = 262144;
  const GUI_WDS_DOCK_LEFT = 131072;
  const GUI_WDS_FORCE_DOCKING = 65536;
  const GUI_WS_OVERLAPPED = 12;
  const GUI_WS_SOUND_ON_SHOW = 8388608;
  const GUI_WS_SELF_REVEAL = 4194304;
  const GUI_WS_ATTACH_AUTO_Y = 2097152;
  const GUI_WS_ATTACH_AUTO_X = 1048576;
  const GUI_WS_ATTACH_BOTTOM = 524288;
  const GUI_WS_ATTACH_TOP = 262144;
  const GUI_WS_ATTACH_RIGHT = 131072;
  const GUI_WS_ATTACH_LEFT = 65536;
  const GUI_WS_TEMP_MODAL = 32768;
  const GUI_WS_NO_FOCUS = 16384;
  const GUI_WS_AUTO_POS = 8192;
  const GUI_WS_NOCLOSE = 4096;
  const GUI_WS_BARE_WINDOW = 2048;
  const GUI_WS_FANCY_BORDER = 1024;
  const GUI_WS_LARGE_ORNAMENT = 512;
  const GUI_WS_ACTIVATE_DESKTOP = 256;
  const GUI_WS_PERSISTENT_POS = 128;
  const GUI_WS_CUSTOM = 64;
  const GUI_WS_MODAL = 32;
  const GUI_WS_TOPMOST = 16;
  const GUI_WS_SIZEABLE = 8;
  const GUI_WS_MOVABLE = 4;
  const GUI_WS_NOMINIMIZE = 2;
  const GUI_WS_TITLEBAR = 1;
  const GUI_MB_MODAL = 32;
  const GUI_MB_HELP = 16;
  const GUI_MB_NO = 8;
  const GUI_MB_YES = 4;
  const GUI_MB_CANCEL = 2;
  const GUI_MB_OK = 1;
  const GUI_PS_CONTROL_SCROLL_SURFACE = 16;
  const GUI_PS_ALWAYS_VSCROLL = 8;
  const GUI_PS_ALWAYS_HSCROLL = 4;
  const GUI_PS_VSCROLL = 2;
  const GUI_PS_HSCROLL = 1;
  const GUI_CBS_DROPDOWN =  1;
  const GUI_BS_MENU_CHECKBOX = 4194304;
  const GUI_BS_SUBMENU = 2097152;
  const GUI_BS_MENU_ITEM = 1048576;
  const GUI_BS_SHADOW = 65536;
  const GUI_BS_TOGGLE = 4096;
  const GUI_BS_CONVERSATION = 16;
  const GUI_BS_RADIO = 8;
  const GUI_BS_CHECKBOX = 4;
  const GUI_BS_DEFAULT = 2;
  const GUI_BS_CUSTOM = 1;
  const GUI_LS_PASSWORD = 8192;
  const GUI_LS_SHADOW = 4096;
  const GUI_LS_ALIGN_MIDDLE = 2048;
  const GUI_LS_ALIGN_RIGHT = 1024;
  const GUI_LS_ALIGN_CENTER = 512;
  const GUI_LS_ALIGN_LEFT = 256;
  const GUI_LS_WORD_WRAP = 4;
  const GUI_LS_AUTO_HEIGHT = 2;
  const GUI_LS_AUTO_WIDTH = 1;
  const GUI_CS_TABSTOP = 4194304;
  const GUI_CS_DRAGNDROP = 2097152;
  const GUI_CS_CAN_PRESS = 1048576;
  const GUI_CS_NO_FOCUS = 524288;
  const GUI_CS_NO_HILITE = 262144;
  const GUI_CS_CAN_DISABLE = 131072;
  const GUI_CS_CAN_NORMAL = 65536;
  const GUI_CS_SELF_VALIDATE = 4096;
  const GUI_CS_OWNER_DRAW = 2048;
  const GUI_CS_OWNER_VALIDATE = 1024;
  const GUI_CS_OWNER_EVENTS = 768;
  const GUI_CS_OWNER_KEY_EVENTS = 512;
  const GUI_CS_OWNER_MOUSE_EVENTS = 256;
  const GUI_ICON_MATERIAL =  5;
  const GUI_ICON_CLOSE =  4;
  const GUI_ICON_MAZIMIZE =  3;
  const GUI_ICON_MINIMIZE =  2;
  const GUI_ICON_CUSTOM =  1;
  const GUI_ICON_NONE =  0;
  const GUI_BORDER_SIZABLE =  4;
  const GUI_BORDER_TICK =  3;
  const GUI_BORDER_THIN =  2;
  const GUI_BORDER_CUSTOM =  1;
  const GUI_BORDER_NONE =  0;
  const GUI_BACKGROUND_POPUP =  9;
  const GUI_BACKGROUND_CUSTOM_SCALED =  8;
  const GUI_BACKGROUND_PANE =  7;
  const GUI_BACKGROUND_CUSTOM_TILED =  6;
  const GUI_BACKGROUND_TITLE =  5;
  const GUI_BACKGROUND_CALIGRAPH =  4;
  const GUI_BACKGROUND_PAPER_OVERLAPPED =  3;
  const GUI_BACKGROUND_PAPER =  2;
  const GUI_BACKGROUND_CUSTOM =  1;
  const GUI_BACKGROUND_NONE =  0;
  const GUI_STATE_COUNT =  6;
  const GUI_STATE_DRAGGED =  5;
  const GUI_STATE_PRESSED =  4;
  const GUI_STATE_FOCUSSED =  3;
  const GUI_STATE_HILITED =  2;
  const GUI_STATE_DISABLED =  1;
  const GUI_STATE_NORMAL =  0;
  const GUI_WND_COUNT =  88;
  const GUI_WND_PROGRESS =  87;
  const GUI_WND_UPGRADE_SKILL_WINDOW =  86;
  const GUI_WND_LEARN_SKILL_WINDOW =  85;
  const GUI_WND_SKILL_LIBRARY =  84;
  const GUI_WND_PARTY_TRAVEL_CONFIRMATION =  83;
  const GUI_WND_PARTY_TRAVEL_OVERVIEW =  82;
  const GUI_WND_PING =  81;
  const GUI_WND_ITEMCONTEXTMENU =  80;
  const GUI_WND_RULES =  79;
  const GUI_WND_FRIENDIGNORE_LIST =  78;
  const GUI_WND_PET =  77;
  const GUI_WND_ONSCREENMESSAGES =  76;
  const GUI_WND_CREDITSWINDOW =  75;
  const GUI_WND_TIMER =  74;
  const GUI_WND_MINIGAME_GAMEWINDOW =  73;
  const GUI_WND_MINIGAME_SETTINGS =  72;
  const GUI_WND_MINIGAME_INVITATION =  71;
  const GUI_WND_MINIGAMEWINDOW =  70;
  const GUI_WND_TUTORIAL =  69;
  const GUI_WND_HELP =  68;
  const GUI_WND_GUILD_LIST =  67;
  const GUI_WND_GUILD_JOIN =  66;
  const GUI_WND_GUILD_CREATE =  65;
  const GUI_WND_ARENASCOREWINDOW =  64;
  const GUI_WND_ARENASTATUSWINDOW =  63;
  const GUI_WND_ARENALISTENER =  62;
  const GUI_WND_ARENAWINDOW =  61;
  const GUI_WND_SHEATH_WEAPON_WINDOW =  60;
  const GUI_WND_CONFIRM_SKILL_SELECTION =  59;
  const GUI_WND_QUEST_COMPLETED =  58;
  const GUI_WND_BODY_SLOTS =  57;
  const GUI_WND_SHOP_PAINTING =  56;
  const GUI_WND_SHOP_CRAFTING =  54;
  const GUI_WND_SHOP_BUYING =  53;
  const GUI_WND_MAILBOX =  52;
  const GUI_WND_TRAVEL =  51;
  const GUI_WND_TRADING =  49;
  const GUI_WND_REQUEST_TRADING =  48;
  const GUI_WND_LOADING_SCREEN =  47;
  const GUI_WND_TEAM_NOTIFICATION =  46;
  const GUI_WND_EDITOR =  45;
  const GUI_WND_SKILL_DEBUG_LOG =  44;
  const GUI_WND_NDA =  43;
  const GUI_WND_MASTER_LOOT =  42;
  const GUI_WND_GROUP_LOOT =  41;
  const GUI_WND_SINGLE_LOOT =  40;
  const GUI_WND_NEW_LOOT =  39;
  const GUI_WND_CHARACTER_STATS =  38;
  const GUI_WND_CS_DELETE_CONFIRMATION =  37;
  const _GUI_WND_CC_LAST =  36;
  const GUI_WND_CC_STATUS =  36;
  const GUI_WND_CC_CREATE =  35;
  const GUI_WND_CC_NAME =  34;
  const GUI_WND_CC_ARMOUR =  33;
  const GUI_WND_CC_CLOTHING =  32;
  const GUI_WND_CC_TATTOOS =  31;
  const GUI_WND_CC_HEAD =  30;
  const GUI_WND_CC_BODY =  29;
  const GUI_WND_CC_CHOOSECLASS =  28;
  const GUI_WND_CC_CLASSINFO =  27;
  const GUI_WND_CC_SELECTSKILLS =  26;
  const GUI_WND_CHARACTERCREATION =  25;
  const _GUI_WND_CC_FIRST =  25;
  const GUI_WND_MAP =  24;
  const GUI_WND_CHARACTERSELECTION =  22;
  const GUI_WND_UNIVERSESELECTION =  21;
  const GUI_WND_LOGIN =  20;
  const GUI_WND_OPTIONS =  19;
  const GUI_WND_RADIALMENU =  18;
  const GUI_WND_SKILLBOOK =  17;
  const GUI_WND_SKILLDECK =  16;
  const GUI_WND_DEATHRESPAWN =  15;
  const GUI_WND_NETSTATS =  14;
  const GUI_WND_CHAT =  13;
  const GUI_WND_TEAM =  12;
  const GUI_WND_FRIENDS =  11;
  const GUI_WND_EQUIPMENT =  10;
  const GUI_WND_INVENTORY =  9;
  const GUI_WND_BUGREPORT =  8;
  const GUI_WND_CONVERSATION =  7;
  const GUI_WND_QUESTLOG =  6;
  const GUI_WND_SYSTEMMENU =  5;
  const GUI_WND_GAMEMENU =  4;
  const GUI_WND_COMBATBAR =  3;
  const GUI_WND_TARGETAVATAR =  2;
  const GUI_WND_PLAYERAVATAR =  1;
  const GUI_WND_MINIMAP =  0;
  var Material mDefaultPens[3];
  var bool mDesktopActive;


  function bool IsMouseInsideWindow();


  function bool HasHiliteComponent();


  function bool IsRadialInteractionPossible();


  event AddScreenMessage(string aMessage,optional Color aColour);


  event bool IsPlayingVideo();


  event StopVideo(string fileName);


  event PlayVideo(string fileName,optional bool fadeInWhenStopped);


  function CancelAction();


  function Clear();


  event bool InLoadingScreen();


  event StopLoadingScreen();


  event UpdateLoadingScreen(float percentage,string Text);


  event StartLoadingScreen(string loadingTexture);


  event ParseEditorString(string editorString);


  event ToggleMap();


  event ShowMessageBox(string Title,string Message);


  event ShowTutorialWindow(int articleID);


  event ShowPartyTravelConfirmation();


  event ShowPartyTravelOverview();


  event ShowLevelAreaName(string aName,bool newArea);


  event ClearSavedWindows();


  event RestoreSavedWindows();


  event SaveOpenWindows();


  event HideAllWindows();


  event OnLogin();


  event PreLogin();


  event UpdateStdWindow(int windowType,optional int intParam,optional Object objParam,optional string stringParam,optional int intParam2);


  event int ShowStdWindow(int wndType,int flags);


  function ShowWindow(int windowHandle,int flags);


  function bool IsStdWindowVisible(int windowID);


  function bool IsWindowVisible(int windowHandle);


  function int FindWindow(string windowTitle);


  function DestroyWindow(int windowHandle);


  function int CreateWindow(string windowClass,int componentStyle,int pageStyle,int windowStyle,int Left,int top,int width,int Height,optional string windowTitle);


  function PreviousTabStop();


  function NextTabStop();


  function bool IsTempInactive();


  function bool IsTempActive();


  function bool IsActive();


  function SetTempInactive(bool OnOff);


  function SetTempActive(bool OnOff);


  function ForceActive();


  function ToggleActive();


  event Shutdown();


  event frame();


  event Test();


  event Init();



