//==============================================================================
//  Game_GUI
//==============================================================================

class Game_GUI extends Base_Component within Game_PlayerController
    native
    dependsOn(Game_PlayerController,Player,GUI_BaseDesktop,BaseGUIController,Game_PlayerInput,Game_Pawn,Game_CombatState,Game_PlayerPawn)
  ;

  var string mStartMenuClass;
  var string mSystemMenuClass;
  var string mVideoSettingsClass;
  var string mAdvancedVideoSettingsClass;
  var string mAudioSettingsClass;
  var string mControlSettingsClass;
  var string mKeyBindingClass;
  var string mBugToolClass;
  var string mInventoryClass;
  var string mEquipmentClass;
  var string mCombatBarClass;
  var string mPlayerAvatarClass;
  var string mMinimapClass;
  var string mChatClass;
  var string mTeamClass;
  var string mFriendsClass;
  var string mCharacterCreationClass;
  var string mConversationClass;
  var string mQuestsClass;
  var string mQuestInfoClass;
  var string mSkillBookClass;
  var string mSkillDeckClass;
  var string mDeathRespawnClass;
  var string mTradeClass;
  var string mEnterArenaClass;
  var string mTargetAvatarClass;
  var string mNetworkStatsClass;
  var string mDateTimeClass;
  var string mNewLootClass;
  var int StartMenuHandle;
  var int SystemMenuHandle;
  var int VideoSettingsHandle;
  var int AdvancedVideoSettingsHandle;
  var int AudioSettingsHandle;
  var int ControlSettingsHandle;
  var int KeyBindingHandle;
  var int BugToolHandle;
  var int InventoryHandle;
  var int EquipmentHandle;
  var int CombatBarHandle;
  var int PlayerAvatarHandle;
  var int MinimapHandle;
  var int ChatHandle;
  var int TeamHandle;
  var int FriendsHandle;
  var int CharacterCreationHandle;
  var int DialogueHandle;
  var int QuestsHandle;
  var int QuestInfoHandle;
  var int SkillBookHandle;
  var int SkillDeckHandle;
  var int RuntimeStatsDebugHandle;
  var int DeathRespawnHandle;
  var int TradeHandle;
  var int EnterArenaHandle;
  var int TargetAvatarHandle;
  var int NetworkStatsHandle;
  var int DateTimeHandle;
  var private array<int> mToggledWindowHandles;
  var private bool mIsToggleSet;


  exec function TogglePing() {
    Outer.Player.GUIDesktop.ShowStdWindow(81,4);                                //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 2C 51 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 
    //2C 51 2C 04 16 04 0B 47 
  }


  function HidePing() {
    Outer.Player.GUIDesktop.ShowStdWindow(81,2);                                //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 2C 51 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 
    //2C 51 2C 02 16 04 0B 47 
  }


  function ShowPing() {
    Outer.Player.GUIDesktop.ShowStdWindow(81,1);                                //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 51 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 
    //2C 51 26 16 04 0B 47 
  }


  function HandleDeath() {
    ShowDeathRespawn();                                                         //0000 : 1B C1 0E 00 00 16 
    //1B C1 0E 00 00 16 04 0B 47 
  }


  function ToggleCreditsWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.75,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4B 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4B 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideCreditsWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.75,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4B 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4B 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowCreditsWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.75,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4B 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4B 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function HideMiniGameWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.73,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 49 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 49 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowMiniGameWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.73,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 49 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 49 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function HideMiniGameSettingsWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.72,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 48 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 48 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowMiniGameSettingsWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.72,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 48 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 48 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function HideMiniGameInvitationWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.71,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 47 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 47 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowMiniGameInvitationWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.71,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 47 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 47 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function InitMiniGameInvitationWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.71,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 47 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 47 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function HideMiniGameListWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.70,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 46 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 46 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowMiniGameListWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.70,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 46 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 46 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function InitMiniGameListWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.70,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 46 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 46 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ToggleArenaScoreWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.64,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 40 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 40 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideArenaScoreWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.64,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 40 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 40 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowArenaScoreWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.64,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 40 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 40 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleArenaStatusWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.63,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 3F 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 3F 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideArenaStatusWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.63,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 3F 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 3F 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowArenaStatusWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.63,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 3F 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 3F 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleArenaWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.61,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 3D 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 3D 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideArenaWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.61,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 3D 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 3D 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowArenaWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.61,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 3D 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 3D 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleDateTime() {
    if (QuestsHandle == 0) {                                                    //0000 : 07 14 00 9A 01 10 BD 2E 11 25 16 
      ShowDateTime();                                                           //000B : 1B 9A 0D 00 00 16 
    } else {                                                                    //0011 : 06 1A 00 
      HideDateTime();                                                           //0014 : 1B C7 0E 00 00 16 
    }
    //07 14 00 9A 01 10 BD 2E 11 25 16 1B 9A 0D 00 00 16 06 1A 00 1B C7 0E 00 00 16 04 0B 47 
  }


  function HideDateTime() {
    if (Outer != None && Outer.Player != None
      && Outer.Player.GUIController != None) {//0000 : 07 78 00 82 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 2A 16 16 18 1B 00 77 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 2A 16 16 
      if (DateTimeHandle != 0) {                                                //0040 : 07 78 00 9B 01 10 BF 2E 11 25 16 
        Outer.Player.GUIController.CloseWindow(DateTimeHandle);                 //004B : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 01 10 BF 2E 11 16 
        DateTimeHandle = 0;                                                     //0071 : 0F 01 10 BF 2E 11 25 
      }
    }
    //07 78 00 82 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 2A 
    //16 16 18 1B 00 77 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 2A 16 16 
    //07 78 00 9B 01 10 BF 2E 11 25 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 
    //25 71 0F 0B 00 00 1B 50 0C 00 00 01 10 BF 2E 11 16 0F 01 10 BF 2E 11 25 04 0B 47 
  }


  function ShowDateTime() {
    if (Outer != None && Outer.Player != None
      && Outer.Player.GUIController != None) {//0000 : 07 77 00 82 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 2A 16 16 18 1B 00 77 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 2A 16 16 
      if (DateTimeHandle == 0) {                                                //0040 : 07 77 00 9A 01 10 BF 2E 11 25 16 
        DateTimeHandle = Outer.Player.GUIController.OpenWindow(mDateTimeClass); //004B : 0F 01 10 BF 2E 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 04 1B 51 0C 00 00 01 08 C1 2E 11 16 
      }
    }
    //07 77 00 82 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 2A 
    //16 16 18 1B 00 77 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 2A 16 16 
    //07 77 00 9A 01 10 BF 2E 11 25 16 0F 01 10 BF 2E 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 
    //0F 05 00 04 01 A0 25 71 0F 0B 00 04 1B 51 0C 00 00 01 08 C1 2E 11 16 04 0B 47 
  }


  function TargetActorChanged() {
    if (Outer.Input.cl_GetTargetPawn() != None) {                               //0000 : 07 57 00 77 19 19 01 00 E4 6B 0F 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 2A 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.2,Class'GUI_BaseDesktop'.1);//001E : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 02 12 20 00 68 D7 00 01 00 04 26 16 
    } else {                                                                    //0054 : 06 8E 00 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.2,Class'GUI_BaseDesktop'.2);//0057 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 02 12 20 00 68 D7 00 02 00 04 2C 02 16 
    }
    //07 57 00 77 19 19 01 00 E4 6B 0F 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 2A 16 19 19 
    //19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 
    //00 68 D7 00 02 00 04 2C 02 12 20 00 68 D7 00 01 00 04 26 16 06 8E 00 19 19 19 01 00 E4 6B 0F 05 
    //00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 
    //2C 02 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function HideTravel() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.51,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 33 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 33 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowTravel(string travelNPCName) {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.51,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 33 12 20 00 68 D7 00 01 00 04 26 16 
    Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.51,0,None,travelNPCName);//0036 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 33 25 2A 00 F8 C4 2E 11 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 33 12 20 00 68 D7 00 01 00 04 26 16 19 19 19 01 00 E4 6B 0F 05 00 
    //04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 
    //33 25 2A 00 F8 C4 2E 11 16 04 0B 47 
  }


  function ShowShop(Shop_Base aShop,byte aOption) {
    switch (aOption) {                                                          //0000 : 05 01 00 E0 C8 2E 11 
      case 20 :                                                                 //0007 : 0A 0C 00 24 14 
      case 21 :                                                                 //000C : 0A 11 00 24 15 
      case 22 :                                                                 //0011 : 0A 16 00 24 16 
      case 23 :                                                                 //0016 : 0A 1B 00 24 17 
      case 24 :                                                                 //001B : 0A 20 00 24 18 
      case 25 :                                                                 //0020 : 0A 25 00 24 19 
      case 26 :                                                                 //0025 : 0A 5E 00 24 1A 
        Outer.Player.GUIDesktop.UpdateStdWindow(53,aOption,aShop,"");           //002A : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 16 00 00 1B 02 0C 00 00 2C 35 39 3A 00 E0 C8 2E 11 00 E0 C6 2E 11 1F 00 16 
        break;                                                                  //005B : 06 F9 00 
      case 27 :                                                                 //005E : 0A 63 00 24 1B 
      case 31 :                                                                 //0063 : 0A 68 00 24 1F 
      case 32 :                                                                 //0068 : 0A 6D 00 24 20 
      case 34 :                                                                 //006D : 0A A6 00 24 22 
        Outer.Player.GUIDesktop.UpdateStdWindow(54,aOption,aShop,"");           //0072 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 16 00 00 1B 02 0C 00 00 2C 36 39 3A 00 E0 C8 2E 11 00 E0 C6 2E 11 1F 00 16 
        break;                                                                  //00A3 : 06 F9 00 
      case 33 :                                                                 //00A6 : 0A DF 00 24 21 
        Outer.Player.GUIDesktop.UpdateStdWindow(56,aOption,aShop,"");           //00AB : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 16 00 00 1B 02 0C 00 00 2C 38 39 3A 00 E0 C8 2E 11 00 E0 C6 2E 11 1F 00 16 
        break;                                                                  //00DC : 06 F9 00 
      case 28 :                                                                 //00DF : 0A E4 00 24 1C 
      case 29 :                                                                 //00E4 : 0A E9 00 24 1D 
      case 30 :                                                                 //00E9 : 0A EE 00 24 1E 
      case 35 :                                                                 //00EE : 0A F3 00 24 23 
      default:                                                                  //00F3 : 0A FF FF 
        break;                                                                  //00F6 : 06 F9 00 
    }
    //05 01 00 E0 C8 2E 11 0A 0C 00 24 14 0A 11 00 24 15 0A 16 00 24 16 0A 1B 00 24 17 0A 20 00 24 18 
    //0A 25 00 24 19 0A 5E 00 24 1A 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 
    //79 0F 16 00 00 1B 02 0C 00 00 2C 35 39 3A 00 E0 C8 2E 11 00 E0 C6 2E 11 1F 00 16 06 F9 00 0A 63 
    //00 24 1B 0A 68 00 24 1F 0A 6D 00 24 20 0A A6 00 24 22 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 
    //71 0F 05 00 04 01 90 C0 79 0F 16 00 00 1B 02 0C 00 00 2C 36 39 3A 00 E0 C8 2E 11 00 E0 C6 2E 11 
    //1F 00 16 06 F9 00 0A DF 00 24 21 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 
    //C0 79 0F 16 00 00 1B 02 0C 00 00 2C 38 39 3A 00 E0 C8 2E 11 00 E0 C6 2E 11 1F 00 16 06 F9 00 0A 
    //E4 00 24 1C 0A E9 00 24 1D 0A EE 00 24 1E 0A F3 00 24 23 0A FF FF 06 F9 00 04 0B 47 
  }


  function UpdateMasterLoot() {
    Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.42,0,None,"");//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 15 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 2A 25 2A 1F 00 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 15 00 00 1B 02 0C 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 2A 25 2A 1F 00 16 04 0B 47 
  }


  function UpdateGroupLoot() {
    Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.41,0,None,"");//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 15 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 29 25 2A 1F 00 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 15 00 00 1B 02 0C 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 29 25 2A 1F 00 16 04 0B 47 
  }


  function UpdateSingleLoot() {
    Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.40,0,None,"");//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 15 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 28 25 2A 1F 00 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 15 00 00 1B 02 0C 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 28 25 2A 1F 00 16 04 0B 47 
  }


  function ToggleNewLoot() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.39,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 27 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 27 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideNewLoot() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.39,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 27 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 27 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowNewLoot() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.39,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 27 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 27 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function HideTrade() {
    HideInventory();                                                            //0000 : 1B 54 0E 00 00 16 
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.49,Class'GUI_BaseDesktop'.2);//0006 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 31 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //1B 54 0E 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 
    //04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 31 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
    //
  }


  function ShowTrade() {
    ShowInventory();                                                            //0000 : 1B 3F 0E 00 00 16 
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.49,Class'GUI_BaseDesktop'.1);//0006 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 31 12 20 00 68 D7 00 01 00 04 26 16 
    //1B 3F 0E 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 
    //04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 31 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function HideTradeRequest() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.48,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 30 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 30 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowTradeRequest() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.48,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 30 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 30 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleCombatSetup() {
    local int i;
    if (mIsToggleSet) {                                                         //0000 : 07 73 00 2D 01 88 D5 2E 11 
      i = 0;                                                                    //0009 : 0F 00 10 D5 2E 11 25 
      while (i < mToggledWindowHandles.Length) {                                //0010 : 07 60 00 96 00 10 D5 2E 11 37 01 00 D6 2E 11 16 
        Outer.Player.GUIDesktop.ShowStdWindow(mToggledWindowHandles[i],Class'GUI_BaseDesktop'.1);//0020 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 10 00 10 D5 2E 11 01 00 D6 2E 11 12 20 00 68 D7 00 01 00 04 26 16 
        ++i;                                                                    //0056 : A3 00 10 D5 2E 11 16 
      }
      mIsToggleSet = False;                                                     //0060 : 14 2D 01 88 D5 2E 11 28 
      mToggledWindowHandles.Length = 0;                                         //0068 : 0F 37 01 00 D6 2E 11 25 
    } else {                                                                    //0070 : 06 7A 01 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.49);                         //0073 : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 31 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.48);                         //0084 : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 30 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.39);                         //0095 : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 27 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.40);                         //00A6 : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 28 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.42);                         //00B7 : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 2A 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.5);                          //00C8 : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 05 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.9);                          //00D9 : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 09 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.10);                         //00EA : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 0A 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.38);                         //00FB : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 26 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.11);                         //010C : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 0B 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.17);                         //011D : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 11 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.16);                         //012E : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 10 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.7);                          //013F : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 07 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.6);                          //0150 : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 06 16 
      AddToCombatToggleList(Class'GUI_BaseDesktop'.24);                         //0161 : 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 18 16 
      mIsToggleSet = True;                                                      //0172 : 14 2D 01 88 D5 2E 11 27 
    }
    //07 73 00 2D 01 88 D5 2E 11 0F 00 10 D5 2E 11 25 07 60 00 96 00 10 D5 2E 11 37 01 00 D6 2E 11 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //10 00 10 D5 2E 11 01 00 D6 2E 11 12 20 00 68 D7 00 01 00 04 26 16 A3 00 10 D5 2E 11 16 06 10 00 
    //14 2D 01 88 D5 2E 11 28 0F 37 01 00 D6 2E 11 25 06 7A 01 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 
    //04 2C 31 16 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 30 16 1B 00 0C 00 00 12 20 00 68 D7 00 
    //02 00 04 2C 27 16 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 28 16 1B 00 0C 00 00 12 20 00 68 
    //D7 00 02 00 04 2C 2A 16 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 05 16 1B 00 0C 00 00 12 20 
    //00 68 D7 00 02 00 04 2C 09 16 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 0A 16 1B 00 0C 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 26 16 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 0B 16 1B 00 0C 
    //00 00 12 20 00 68 D7 00 02 00 04 2C 11 16 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 10 16 1B 
    //00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 07 16 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 06 
    //16 1B 00 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 18 16 14 2D 01 88 D5 2E 11 27 04 0B 47 
  }


  function AddToCombatToggleList(int stdWindowID) {
    if (Outer.Player.GUIDesktop.IsStdWindowVisible(stdWindowID)) {              //0000 : 07 7F 00 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 04 1B A5 12 00 00 00 28 D7 2E 11 16 
      mToggledWindowHandles.Length = mToggledWindowHandles.Length + 1;          //0029 : 0F 37 01 00 D6 2E 11 92 37 01 00 D6 2E 11 26 16 
      mToggledWindowHandles[mToggledWindowHandles.Length - 1] = stdWindowID;    //0039 : 0F 10 93 37 01 00 D6 2E 11 26 16 01 00 D6 2E 11 00 28 D7 2E 11 
      Outer.Player.GUIDesktop.ShowStdWindow(stdWindowID,Class'GUI_BaseDesktop'.2);//004E : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 16 00 04 1B DF 0B 00 00 00 28 D7 2E 11 12 20 00 68 D7 00 02 00 04 2C 02 16 
    }
    //07 7F 00 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 04 1B A5 
    //12 00 00 00 28 D7 2E 11 16 0F 37 01 00 D6 2E 11 92 37 01 00 D6 2E 11 26 16 0F 10 93 37 01 00 D6 
    //2E 11 26 16 01 00 D6 2E 11 00 28 D7 2E 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 
    //04 01 90 C0 79 0F 16 00 04 1B DF 0B 00 00 00 28 D7 2E 11 12 20 00 68 D7 00 02 00 04 2C 02 16 04 
    //0B 47 
  }


  protected native function sv2cl_HideEnterArena_CallStub();


  event sv2cl_HideEnterArena() {
    HideEnterArena();                                                           //0000 : 1B C5 0E 00 00 16 
    //1B C5 0E 00 00 16 04 0B 47 
  }


  function HideEnterArena() {
    Outer.Player.GUIController.CloseWindow(EnterArenaHandle);                   //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 01 38 DB 2E 11 16 
    EnterArenaHandle = 0;                                                       //0026 : 0F 01 38 DB 2E 11 25 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 
    //01 38 DB 2E 11 16 0F 01 38 DB 2E 11 25 04 0B 47 
  }


  protected native function sv2cl_ShowEnterArena_CallStub();


  event sv2cl_ShowEnterArena() {
    EnterArenaHandle = Outer.Player.GUIController.OpenWindow(mEnterArenaClass); //0000 : 0F 01 38 DB 2E 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 04 1B 51 0C 00 00 01 78 DD 2E 11 16 
    //0F 01 38 DB 2E 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 
    //04 1B 51 0C 00 00 01 78 DD 2E 11 16 04 0B 47 
  }


  function HideDeathRespawn() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.15,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0F 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0F 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowDeathRespawn() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.15,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0F 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0F 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleWorldmap() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.24,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 18 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 18 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideWorldmap() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.24,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 18 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 18 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowWorldmap() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.24,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 18 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 18 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function UpdateQuestlog() {
    if (QuestsHandle != 0) {                                                    //0000 : 07 31 00 9B 01 10 BD 2E 11 25 16 
      Outer.Player.GUIController.UpdateWindow(QuestsHandle);                    //000B : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B E4 11 00 00 01 10 BD 2E 11 16 
    }
    //07 31 00 9B 01 10 BD 2E 11 25 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 
    //25 71 0F 0B 00 00 1B E4 11 00 00 01 10 BD 2E 11 16 04 0B 47 
  }


  exec function ToggleQuestlog() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.6,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 06 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 06 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideQuestlog() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.6,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 06 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 06 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowQuestlog() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.6,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 06 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 06 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function HideDialogue() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.7,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 07 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 07 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowDialogue(Game_ConversationState conv) {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.7,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 07 12 20 00 68 D7 00 01 00 04 26 16 
    Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.7,0,conv);   //0036 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 17 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 07 25 00 48 EA 2E 11 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 07 12 20 00 68 D7 00 01 00 04 26 16 19 19 19 01 00 E4 6B 0F 05 00 
    //04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 17 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 
    //07 25 00 48 EA 2E 11 16 04 0B 47 
  }


  exec function ToggleSkillDeck() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.16,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 10 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 10 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideSkillDeck() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.16,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 10 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 10 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowSkillDeck() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.16,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 10 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 10 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleUpgradeSkillWindow() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.86,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 56 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 56 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideUpgradeSkillWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.86,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 56 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 56 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowUpgradeSkillWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.86,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 56 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 56 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function InitUpgradeSkillWindow() {
    HideUpgradeSkillWindow();                                                   //0000 : 1B B7 0E 00 00 16 
    //1B B7 0E 00 00 16 04 0B 47 
  }


  exec function ToggleLearnSkillWindow() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.85,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 55 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 55 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideLearnSkillWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.85,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 55 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 55 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowLearnSkillWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.85,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 55 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 55 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function InitLearnSkillWindow() {
    HideLearnSkillWindow();                                                     //0000 : 1B B0 0E 00 00 16 
    //1B B0 0E 00 00 16 04 0B 47 
  }


  exec function ToggleSkillLibrary() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.84,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 54 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 54 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideSkillLibrary() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.84,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 54 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 54 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowSkillLibrary() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.84,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 54 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 54 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function InitSkillLibrary() {
    HideSkillLibrary();                                                         //0000 : 1B 9B 0E 00 00 16 
    //1B 9B 0E 00 00 16 04 0B 47 
  }


  exec function ToggleSkillBook() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.17,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 11 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 11 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideSkillBook() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.17,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 11 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 11 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowSkillBook() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.17,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 11 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 11 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleFriends() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.11,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0B 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0B 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideFriends() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.11,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0B 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0B 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowFriends() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.11,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0B 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0B 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleCharacterStats() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.38,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 26 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 26 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideCharacterStats() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.38,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 26 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 26 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowCharacterStats() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.38,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 26 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 26 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleTeam() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideTeam() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowTeam() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function InitQuestLogWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.6,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 06 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 06 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function InitTimerWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.74,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4A 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4A 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function InitOnScreenMessagesWindow() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.76,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4C 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4C 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ToggleChat() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.13,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0D 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0D 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideChat() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.13,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0D 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0D 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowChat() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.13,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0D 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0D 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleNetworkStats() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.14,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0E 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0E 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideNetworkStats() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.14,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0E 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0E 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowNetworkStats() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.14,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0E 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0E 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ActivateBodySlot(int Index) {
    if (Index >= 0 && Index < 5) {                                              //0000 : 07 4A 00 82 99 00 70 15 2F 11 25 16 18 0A 00 96 00 70 15 2F 11 2C 05 16 16 
      Outer.Player.GUIDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.57,Index); //0019 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 16 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 39 00 70 15 2F 11 16 
    }
    //07 4A 00 82 99 00 70 15 2F 11 25 16 18 0A 00 96 00 70 15 2F 11 2C 05 16 16 19 19 19 01 00 E4 6B 
    //0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 16 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 
    //00 04 2C 39 00 70 15 2F 11 16 04 0B 47 
  }


  exec function ToggleFriendIgnoreList() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.78,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4E 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4E 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideFriendIgnoreList() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.78,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4E 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4E 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowFriendIgnoreList() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.78,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4E 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4E 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleGuildList() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.67,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 43 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 43 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideGuildList() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.67,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 43 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 43 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowGuildList() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.67,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 43 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 43 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleGuildJoin() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.66,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 42 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 42 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideGuildJoin() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.66,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 42 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 42 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowGuildJoin() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.66,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 42 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 42 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleGuildCreate() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.65,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 41 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 41 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideGuildCreate() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.65,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 41 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 41 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowGuildCreate() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.65,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 41 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 41 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleBodySlots() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.57,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 39 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 39 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideBodySlots() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.57,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 39 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 39 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowBodyslots() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.57,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 39 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 39 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleMinimap() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.0,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 01 00 04 25 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 01 00 04 25 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideMinimap() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.0,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 01 00 04 25 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 01 00 04 25 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowMinimap() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.0,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1A 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 01 00 04 25 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1A 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 01 00 04 25 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function TogglePlayerAvatar() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.1,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HidePlayerAvatar() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.1,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowPlayerAvatar() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.1,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1A 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1A 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function TogglePet() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.77,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4D 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4D 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HidePet() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.77,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4D 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4D 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowPet() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.77,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4D 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 4D 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleTeamMembers() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideTeamMembers() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowTeamMembers() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.12,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0C 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleCombatBar() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.3,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 03 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 03 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideCombatBar() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.3,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 03 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 03 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowCombatBar() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.3,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 03 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 03 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleEquipment() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.10,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0A 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0A 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideEquipment() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.10,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0A 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0A 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowEquipment() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.10,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 0A 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 0A 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleInventory() {
    if (IsAlive()) {                                                            //0000 : 07 40 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.9,Class'GUI_BaseDesktop'.4);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 09 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    //07 40 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 09 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //04 0B 47 
  }


  function HideInventory() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.9,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 09 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 09 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowInventory() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.9,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 09 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 09 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleBugTool() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.8,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 08 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 08 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideBugTool() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.8,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 08 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 08 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowBugTool() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.8,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 08 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 08 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleKeyBinding() {
    if (KeyBindingHandle == 0) {                                                //0000 : 07 14 00 9A 01 80 48 2F 11 25 16 
      ShowKeyBinding();                                                         //000B : 1B 39 0E 00 00 16 
    } else {                                                                    //0011 : 06 1A 00 
      HideKeyBinding();                                                         //0014 : 1B 3D 0E 00 00 16 
    }
    //07 14 00 9A 01 80 48 2F 11 25 16 1B 39 0E 00 00 16 06 1A 00 1B 3D 0E 00 00 16 04 0B 47 
  }


  function HideKeyBinding() {
    Outer.Player.GUIController.CloseWindow(KeyBindingHandle);                   //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 01 80 48 2F 11 16 
    KeyBindingHandle = 0;                                                       //0026 : 0F 01 80 48 2F 11 25 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 
    //01 80 48 2F 11 16 0F 01 80 48 2F 11 25 04 0B 47 
  }


  function ShowKeyBinding() {
    KeyBindingHandle = Outer.Player.GUIController.OpenWindow(mKeyBindingClass); //0000 : 0F 01 80 48 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 04 1B 51 0C 00 00 01 30 4B 2F 11 16 
    //0F 01 80 48 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 
    //04 1B 51 0C 00 00 01 30 4B 2F 11 16 04 0B 47 
  }


  function ToggleControlSettings() {
    if (ControlSettingsHandle == 0) {                                           //0000 : 07 14 00 9A 01 A8 4C 2F 11 25 16 
      ShowControlSettings();                                                    //000B : 1B 2F 0E 00 00 16 
    } else {                                                                    //0011 : 06 1A 00 
      HideControlSettings();                                                    //0014 : 1B 30 0E 00 00 16 
    }
    //07 14 00 9A 01 A8 4C 2F 11 25 16 1B 2F 0E 00 00 16 06 1A 00 1B 30 0E 00 00 16 04 0B 47 
  }


  function HideControlSettings() {
    Outer.Player.GUIController.CloseWindow(ControlSettingsHandle);              //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 01 A8 4C 2F 11 16 
    ControlSettingsHandle = 0;                                                  //0026 : 0F 01 A8 4C 2F 11 25 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 
    //01 A8 4C 2F 11 16 0F 01 A8 4C 2F 11 25 04 0B 47 
  }


  function ShowControlSettings() {
    ControlSettingsHandle = Outer.Player.GUIController.OpenWindow(mControlSettingsClass);//0000 : 0F 01 A8 4C 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 04 1B 51 0C 00 00 01 58 4F 2F 11 16 
    //0F 01 A8 4C 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 
    //04 1B 51 0C 00 00 01 58 4F 2F 11 16 04 0B 47 
  }


  function ToggleAudioSettings() {
    if (AudioSettingsHandle == 0) {                                             //0000 : 07 14 00 9A 01 D0 50 2F 11 25 16 
      ShowAudioSettings();                                                      //000B : 1B 2B 0E 00 00 16 
    } else {                                                                    //0011 : 06 1A 00 
      HideAudioSettings();                                                      //0014 : 1B 2C 0E 00 00 16 
    }
    //07 14 00 9A 01 D0 50 2F 11 25 16 1B 2B 0E 00 00 16 06 1A 00 1B 2C 0E 00 00 16 04 0B 47 
  }


  function HideAudioSettings() {
    Outer.Player.GUIController.CloseWindow(AudioSettingsHandle);                //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 01 D0 50 2F 11 16 
    AudioSettingsHandle = 0;                                                    //0026 : 0F 01 D0 50 2F 11 25 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 
    //01 D0 50 2F 11 16 0F 01 D0 50 2F 11 25 04 0B 47 
  }


  function ShowAudioSettings() {
    AudioSettingsHandle = Outer.Player.GUIController.OpenWindow(mAudioSettingsClass);//0000 : 0F 01 D0 50 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 04 1B 51 0C 00 00 01 80 53 2F 11 16 
    //0F 01 D0 50 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 
    //04 1B 51 0C 00 00 01 80 53 2F 11 16 04 0B 47 
  }


  function ToggleAdvancedVideoSettings() {
    if (AdvancedVideoSettingsHandle == 0) {                                     //0000 : 07 14 00 9A 01 F8 54 2F 11 25 16 
      ShowAdvancedVideoSettings();                                              //000B : 1B 23 0E 00 00 16 
    } else {                                                                    //0011 : 06 1A 00 
      HideAdvancedVideoSettings();                                              //0014 : 1B 2A 0E 00 00 16 
    }
    //07 14 00 9A 01 F8 54 2F 11 25 16 1B 23 0E 00 00 16 06 1A 00 1B 2A 0E 00 00 16 04 0B 47 
  }


  function HideAdvancedVideoSettings() {
    Outer.Player.GUIController.CloseWindow(AdvancedVideoSettingsHandle);        //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 01 F8 54 2F 11 16 
    AdvancedVideoSettingsHandle = 0;                                            //0026 : 0F 01 F8 54 2F 11 25 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 
    //01 F8 54 2F 11 16 0F 01 F8 54 2F 11 25 04 0B 47 
  }


  function ShowAdvancedVideoSettings() {
    AdvancedVideoSettingsHandle = Outer.Player.GUIController.OpenWindow(mAdvancedVideoSettingsClass);//0000 : 0F 01 F8 54 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 04 1B 51 0C 00 00 01 A8 57 2F 11 16 
    //0F 01 F8 54 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 
    //04 1B 51 0C 00 00 01 A8 57 2F 11 16 04 0B 47 
  }


  function ToggleVideoSettings() {
    if (VideoSettingsHandle == 0) {                                             //0000 : 07 14 00 9A 01 20 59 2F 11 25 16 
      ShowVideoSettings();                                                      //000B : 1B 1C 0E 00 00 16 
    } else {                                                                    //0011 : 06 1A 00 
      HideVideoSettings();                                                      //0014 : 1B 22 0E 00 00 16 
    }
    //07 14 00 9A 01 20 59 2F 11 25 16 1B 1C 0E 00 00 16 06 1A 00 1B 22 0E 00 00 16 04 0B 47 
  }


  function HideVideoSettings() {
    Outer.Player.GUIController.CloseWindow(VideoSettingsHandle);                //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 01 20 59 2F 11 16 
    VideoSettingsHandle = 0;                                                    //0026 : 0F 01 20 59 2F 11 25 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 00 1B 50 0C 00 00 
    //01 20 59 2F 11 16 0F 01 20 59 2F 11 25 04 0B 47 
  }


  function ShowVideoSettings() {
    VideoSettingsHandle = Outer.Player.GUIController.OpenWindow(mVideoSettingsClass);//0000 : 0F 01 20 59 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 04 1B 51 0C 00 00 01 D0 5B 2F 11 16 
    //0F 01 20 59 2F 11 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 0B 00 
    //04 1B 51 0C 00 00 01 D0 5B 2F 11 16 04 0B 47 
  }


  exec function ToggleSkillDebugLog() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.44,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 2C 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 2C 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideSkillDebugLog() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.44,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 2C 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 2C 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowSkillDebugLog() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.44,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 2C 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 2C 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function ToggleSystemMenu() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.5,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 05 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 05 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideSystemMenu() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.5,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 05 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 05 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowSystemMenu() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.5,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 05 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 05 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  exec function ToggleStartMenu() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.4,Class'GUI_BaseDesktop'.4);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 04 16 04 0B 47 
  }


  function HideStartMenu() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.4,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function ShowStartMenu() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.4,Class'GUI_BaseDesktop'.1);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 01 00 04 26 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 01 00 04 26 16 04 0B 47 
  }


  function CloseRadialMenu() {
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.18,Class'GUI_BaseDesktop'.2);//0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 12 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 12 12 20 00 68 D7 00 02 00 04 2C 02 16 04 0B 47 
  }


  function OpenRadialMenu() {
    if (IsAlive()) {                                                            //0000 : 07 3F 00 1B 05 0C 00 00 16 
      Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.18,Class'GUI_BaseDesktop'.1);//0009 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 12 12 20 00 68 D7 00 01 00 04 26 16 
    }
    //07 3F 00 1B 05 0C 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 12 12 20 00 68 D7 00 01 00 04 26 16 04 
    //0B 47 
  }


  exec function PreviousTabStop() {
    Outer.Player.GUIDesktop.PreviousTabStop();                                  //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B FD 0E 00 00 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B FD 0E 00 00 
    //16 04 0B 47 
  }


  exec function NextTabStop() {
    Outer.Player.GUIDesktop.NextTabStop();                                      //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B 37 0D 00 00 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B 37 0D 00 00 
    //16 04 0B 47 
  }


  protected native function sv2cl_ShowPartyTravelConfirmation_CallStub();


  event sv2cl_ShowPartyTravelConfirmation() {
    Outer.Player.GUIDesktop.ShowPartyTravelConfirmation();                      //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B EB 11 00 00 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B EB 11 00 00 
    //16 04 0B 47 
  }


  protected native function sv2cl_ShowPartyTravelOverview_CallStub();


  event sv2cl_ShowPartyTravelOverview() {
    Outer.Player.GUIDesktop.ShowPartyTravelOverview();                          //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B E9 11 00 00 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B E9 11 00 00 
    //16 04 0B 47 
  }


  protected native function sv2cl_ShowTutorial_CallStub();


  event sv2cl_ShowTutorial(int articleID) {
    Outer.Player.GUIDesktop.ShowTutorialWindow(articleID);                      //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B E7 11 00 00 00 10 70 2F 11 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B E7 11 00 00 
    //00 10 70 2F 11 16 04 0B 47 
  }


  event ShowLevelArea(string aName,bool newArea) {
    Outer.Player.GUIDesktop.ShowLevelAreaName(aName,newArea);                   //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 11 00 00 1B EC 11 00 00 00 98 71 2F 11 2D 00 78 72 2F 11 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 11 00 00 1B EC 11 00 00 
    //00 98 71 2F 11 2D 00 78 72 2F 11 16 04 0B 47 
  }


  function OnTravelFailed(string Reason) {
    Outer.Player.GUIDesktop.AddScreenMessage(Reason);                           //0000 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B EF 0B 00 00 00 A0 73 2F 11 16 
    //19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B EF 0B 00 00 
    //00 A0 73 2F 11 16 04 0B 47 
  }


  function bool IsAlive() {
    return !Game_Pawn(Outer.Pawn).IsDead();                                     //0000 : 04 81 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C D8 52 34 0F 16 16 
    //04 81 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C D8 52 34 0F 16 16 
    //04 0B 47 
  }


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    ShowStartMenu();                                                            //0006 : 1B 17 0E 00 00 16 
    if (Game_Pawn(Outer.Pawn).combatState.CombatReady()) {                      //000C : 07 3E 00 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 
      ShowCombatBar();                                                          //0035 : 1B 79 0D 00 00 16 
    } else {                                                                    //003B : 06 44 00 
      HideCombatBar();                                                          //003E : 1B FF 0C 00 00 16 
    }
    ShowPlayerAvatar();                                                         //0044 : 1B 5F 0E 00 00 16 
    ShowTeam();                                                                 //004A : 1B 90 0E 00 00 16 
    ShowMinimap();                                                              //0050 : 1B 72 0E 00 00 16 
    ShowBodyslots();                                                            //0056 : 1B 76 0E 00 00 16 
    ShowChat();                                                                 //005C : 1B FB 0C 00 00 16 
    ShowDateTime();                                                             //0062 : 1B 9A 0D 00 00 16 
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.67,Class'GUI_BaseDesktop'.2);//0068 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 43 12 20 00 68 D7 00 02 00 04 2C 02 16 
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.78,Class'GUI_BaseDesktop'.2);//009F : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 4E 12 20 00 68 D7 00 02 00 04 2C 02 16 
    Outer.Player.GUIDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.60,Class'GUI_BaseDesktop'.1);//00D6 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 3C 12 20 00 68 D7 00 01 00 04 26 16 
    HideNewLoot();                                                              //010C : 1B D2 0E 00 00 16 
    if (Game_PlayerPawn(Outer.Pawn).MiniGameProxy != None) {                    //0112 : 07 43 01 77 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 30 5D 83 0F 2A 16 
      InitMiniGameListWindow();                                                 //0134 : 1B C2 0E 00 00 16 
      InitMiniGameInvitationWindow();                                           //013A : 1B C0 0E 00 00 16 
      goto jl0143;                                                              //0140 : 06 43 01 
    }
    InitSkillLibrary();                                                         //0143 : 1B 96 0E 00 00 16 
    InitLearnSkillWindow();                                                     //0149 : 1B A2 0E 00 00 16 
    InitUpgradeSkillWindow();                                                   //014F : 1B B6 0E 00 00 16 
    InitOnScreenMessagesWindow();                                               //0155 : 1B 8B 0E 00 00 16 
    InitTimerWindow();                                                          //015B : 1B 8D 0E 00 00 16 
    InitQuestLogWindow();                                                       //0161 : 1B 8E 0E 00 00 16 
    if (Outer.Player.GUIController != None) {                                   //0167 : 07 A6 01 77 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 2A 16 
      Outer.Player.GUIController.FocusWindow(0);                                //0184 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 07 00 00 1B F3 11 00 00 25 16 
    }
    //1C E0 C4 19 11 16 1B 17 0E 00 00 16 07 3E 00 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 
    //88 83 6C 0F 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 1B 79 0D 00 00 16 06 44 00 1B FF 
    //0C 00 00 16 1B 5F 0E 00 00 16 1B 90 0E 00 00 16 1B 72 0E 00 00 16 1B 76 0E 00 00 16 1B FB 0C 00 
    //00 16 1B 9A 0D 00 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
    //1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 43 12 20 00 68 D7 00 02 00 04 2C 02 16 19 
    //19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1C 00 04 1B DF 0B 00 00 12 
    //20 00 68 D7 00 02 00 04 2C 4E 12 20 00 68 D7 00 02 00 04 2C 02 16 19 19 19 01 00 E4 6B 0F 05 00 
    //04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 
    //3C 12 20 00 68 D7 00 01 00 04 26 16 1B D2 0E 00 00 16 07 43 01 77 19 2E F0 47 5B 01 19 01 00 E4 
    //6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 30 5D 83 0F 2A 16 1B C2 0E 00 00 16 1B C0 0E 00 00 16 
    //06 43 01 1B 96 0E 00 00 16 1B A2 0E 00 00 16 1B B6 0E 00 00 16 1B 8B 0E 00 00 16 1B 8D 0E 00 00 
    //16 1B 8E 0E 00 00 16 07 A6 01 77 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 
    //71 0F 2A 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 A0 25 71 0F 07 00 00 1B 
    //F3 11 00 00 25 16 04 0B 47 
  }



