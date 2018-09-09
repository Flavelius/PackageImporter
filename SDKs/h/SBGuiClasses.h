#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName SBGUI_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif

AUTOGENERATE_NAME(AddFootnotes)
AUTOGENERATE_NAME(AddLine)
AUTOGENERATE_NAME(AddOnScreenMessage)
AUTOGENERATE_NAME(AddQuestItem)
AUTOGENERATE_NAME(AddText)
AUTOGENERATE_NAME(AdjustTextCtrlDimensions)
AUTOGENERATE_NAME(ApplySettings)
AUTOGENERATE_NAME(CancelSettings)
AUTOGENERATE_NAME(ChangeChannel)
AUTOGENERATE_NAME(ChangeChatTitle)
AUTOGENERATE_NAME(ChangeWindow)
AUTOGENERATE_NAME(CloseMenu)
AUTOGENERATE_NAME(CollectTargetOptions)
AUTOGENERATE_NAME(CreateChatTab)
AUTOGENERATE_NAME(CreateDefaultWindows)
AUTOGENERATE_NAME(DefaultSettings)
AUTOGENERATE_NAME(DeregisterChatPage)
AUTOGENERATE_NAME(DestroySelectedTab)
AUTOGENERATE_NAME(DoShowWindow)
AUTOGENERATE_NAME(DropPage)
AUTOGENERATE_NAME(EnableClose)
AUTOGENERATE_NAME(EnableMinimize)
AUTOGENERATE_NAME(EnableMove)
AUTOGENERATE_NAME(EnableMovement)
AUTOGENERATE_NAME(FadeIn)
AUTOGENERATE_NAME(FadeOut)
AUTOGENERATE_NAME(Flush)
AUTOGENERATE_NAME(GetItem)
AUTOGENERATE_NAME(GetLocationID)
AUTOGENERATE_NAME(GetLocationSlot)
AUTOGENERATE_NAME(GetLocationType)
AUTOGENERATE_NAME(GetMoney)
AUTOGENERATE_NAME(GetPalette)
AUTOGENERATE_NAME(GetPetControlTexture)
AUTOGENERATE_NAME(GetSourceContainer)
AUTOGENERATE_NAME(GetTooltipObjectPageClassName)
AUTOGENERATE_NAME(HandleKeyEvent)
AUTOGENERATE_NAME(HandleKeyType)
AUTOGENERATE_NAME(HandleMessage)
AUTOGENERATE_NAME(HiliteHandler)
AUTOGENERATE_NAME(Initialize)
AUTOGENERATE_NAME(InitializeMenu)
AUTOGENERATE_NAME(InvalidateFunctionPtrs)
AUTOGENERATE_NAME(IsLocked)
AUTOGENERATE_NAME(IsPlayerBusy)
AUTOGENERATE_NAME(IsSelected)
AUTOGENERATE_NAME(LoadConsole)
AUTOGENERATE_NAME(LoadStaticMesh)
AUTOGENERATE_NAME(MakeMeshActorWhenNeeded)
AUTOGENERATE_NAME(OnActivate)
AUTOGENERATE_NAME(OnButton)
AUTOGENERATE_NAME(OnButtonChecked)
AUTOGENERATE_NAME(OnButtonGroupChanged)
AUTOGENERATE_NAME(OnCapturedMouseMove)
AUTOGENERATE_NAME(OnChange)
AUTOGENERATE_NAME(OnCheck)
AUTOGENERATE_NAME(OnClassChanged)
AUTOGENERATE_NAME(OnClick)
AUTOGENERATE_NAME(OnClose)
AUTOGENERATE_NAME(OnCloseClick)
AUTOGENERATE_NAME(OnColorClicked)
AUTOGENERATE_NAME(OnColourSelected)
AUTOGENERATE_NAME(OnColumnHeaderClick)
AUTOGENERATE_NAME(OnColumnHeaderDblClick)
AUTOGENERATE_NAME(OnCompletion)
AUTOGENERATE_NAME(OnComponentClick)
AUTOGENERATE_NAME(OnComponentDestroyed)
AUTOGENERATE_NAME(OnComponentHidden)
AUTOGENERATE_NAME(OnComponentShown)
AUTOGENERATE_NAME(OnDblClick)
AUTOGENERATE_NAME(OnDeActivate)
AUTOGENERATE_NAME(OnDeHilite)
AUTOGENERATE_NAME(OnDoubleClick)
AUTOGENERATE_NAME(OnDrag)
AUTOGENERATE_NAME(OnDrop)
AUTOGENERATE_NAME(OnEndDrag)
AUTOGENERATE_NAME(OnEndMoving)
AUTOGENERATE_NAME(OnEnter)
AUTOGENERATE_NAME(OnFocus)
AUTOGENERATE_NAME(OnFocusChanged)
AUTOGENERATE_NAME(OnFocusLost)
AUTOGENERATE_NAME(OnForge)
AUTOGENERATE_NAME(OnGetPalette)
AUTOGENERATE_NAME(OnGetTooltipObject)
AUTOGENERATE_NAME(OnGetTooltipText)
AUTOGENERATE_NAME(OnHeightChanged)
AUTOGENERATE_NAME(OnHide)
AUTOGENERATE_NAME(OnHilite)
AUTOGENERATE_NAME(OnHitTest)
AUTOGENERATE_NAME(OnHover)
AUTOGENERATE_NAME(OnItemAppliedToPawn)
AUTOGENERATE_NAME(OnItemChange)
AUTOGENERATE_NAME(OnItemRemovedFromPawn)
AUTOGENERATE_NAME(OnItemSelect)
AUTOGENERATE_NAME(OnItemSet)
AUTOGENERATE_NAME(OnKeyEvent)
AUTOGENERATE_NAME(OnKeyType)
AUTOGENERATE_NAME(OnLeft)
AUTOGENERATE_NAME(OnLogin)
AUTOGENERATE_NAME(OnMBClick)
AUTOGENERATE_NAME(OnMessageReceived)
AUTOGENERATE_NAME(OnMirror)
AUTOGENERATE_NAME(OnMouseDown)
AUTOGENERATE_NAME(OnMouseMove)
AUTOGENERATE_NAME(OnMousePressed)
AUTOGENERATE_NAME(OnMouseRelease)
AUTOGENERATE_NAME(OnMouseUp)
AUTOGENERATE_NAME(OnMouseWheel)
AUTOGENERATE_NAME(OnNext)
AUTOGENERATE_NAME(OnOpenPicker)
AUTOGENERATE_NAME(OnPageDock)
AUTOGENERATE_NAME(OnPageUndocked)
AUTOGENERATE_NAME(OnPostDraw)
AUTOGENERATE_NAME(OnPreDraw)
AUTOGENERATE_NAME(OnPreviousStage)
AUTOGENERATE_NAME(OnRender)
AUTOGENERATE_NAME(OnRendered)
AUTOGENERATE_NAME(OnRight)
AUTOGENERATE_NAME(OnRightClick)
AUTOGENERATE_NAME(OnRowClick)
AUTOGENERATE_NAME(OnRowDblClick)
AUTOGENERATE_NAME(OnRowRightClick)
AUTOGENERATE_NAME(OnScroll)
AUTOGENERATE_NAME(OnScrollOffsetChanged)
AUTOGENERATE_NAME(OnSelectionChange)
AUTOGENERATE_NAME(OnSelectionChanged)
AUTOGENERATE_NAME(OnSetColor)
AUTOGENERATE_NAME(OnSetSelected)
AUTOGENERATE_NAME(OnShow)
AUTOGENERATE_NAME(OnSubButtonSelected)
AUTOGENERATE_NAME(OnTabChanged)
AUTOGENERATE_NAME(OnTextChanged)
AUTOGENERATE_NAME(OnTick)
AUTOGENERATE_NAME(OnTimeout)
AUTOGENERATE_NAME(OnTimer)
AUTOGENERATE_NAME(OnTimerEnd)
AUTOGENERATE_NAME(OnTravel)
AUTOGENERATE_NAME(OnValueChanged)
AUTOGENERATE_NAME(OnWatch)
AUTOGENERATE_NAME(OnWhileMouseDown)
AUTOGENERATE_NAME(OnWindowClosed)
AUTOGENERATE_NAME(OpenMenu)
AUTOGENERATE_NAME(PlaceItem)
AUTOGENERATE_NAME(PlayButtonSound)
AUTOGENERATE_NAME(PositionChanged)
AUTOGENERATE_NAME(PreLogin)
AUTOGENERATE_NAME(ReleaseFocus)
AUTOGENERATE_NAME(RemoveItem)
AUTOGENERATE_NAME(ResetToolTipObject)
AUTOGENERATE_NAME(ResetTooltip)
AUTOGENERATE_NAME(ResetTooltipMode)
AUTOGENERATE_NAME(ResetValues)
AUTOGENERATE_NAME(ResolutionChanged)
AUTOGENERATE_NAME(ResolveShortkeyNames)
AUTOGENERATE_NAME(SelectChatPage)
AUTOGENERATE_NAME(SellItem)
AUTOGENERATE_NAME(SetActorRotation)
AUTOGENERATE_NAME(SetActorTranslation)
AUTOGENERATE_NAME(SetAvatarPawn)
AUTOGENERATE_NAME(SetButtonText)
AUTOGENERATE_NAME(SetChatPage)
AUTOGENERATE_NAME(SetCheckPurse)
AUTOGENERATE_NAME(SetChecked)
AUTOGENERATE_NAME(SetComponentTitle)
AUTOGENERATE_NAME(SetDBLocked)
AUTOGENERATE_NAME(SetDelegates)
AUTOGENERATE_NAME(SetDescription)
AUTOGENERATE_NAME(SetFontSize)
AUTOGENERATE_NAME(SetGUILocked)
AUTOGENERATE_NAME(SetHasFadeOut)
AUTOGENERATE_NAME(SetImageRotation)
AUTOGENERATE_NAME(SetItem)
AUTOGENERATE_NAME(SetItemLocation)
AUTOGENERATE_NAME(SetMoney)
AUTOGENERATE_NAME(SetObject)
AUTOGENERATE_NAME(SetSelected)
AUTOGENERATE_NAME(SetShadow)
AUTOGENERATE_NAME(SetStackSize)
AUTOGENERATE_NAME(SetStaticMesh)
AUTOGENERATE_NAME(SetTextColour)
AUTOGENERATE_NAME(SetTextFont)
AUTOGENERATE_NAME(SetTooltipObject)
AUTOGENERATE_NAME(SetTooltipObjectPageClassName)
AUTOGENERATE_NAME(SetTooltipText)
AUTOGENERATE_NAME(SetWhisperTarget)
AUTOGENERATE_NAME(SetWindow)
AUTOGENERATE_NAME(SettingsChanged)
AUTOGENERATE_NAME(SetupListener)
AUTOGENERATE_NAME(ShouldUpdate)
AUTOGENERATE_NAME(ShowInfoWindows)
AUTOGENERATE_NAME(ShowMesh)
AUTOGENERATE_NAME(ShowObjectTooltip)
AUTOGENERATE_NAME(ShowRulesWindow)
AUTOGENERATE_NAME(TextChanged)
AUTOGENERATE_NAME(TryCloseWindow)
AUTOGENERATE_NAME(UpdateColours)
AUTOGENERATE_NAME(UpdateCompassButtonState)
AUTOGENERATE_NAME(UpdateComponent)
AUTOGENERATE_NAME(UpdateLearnPage)
AUTOGENERATE_NAME(UpdateLocked)
AUTOGENERATE_NAME(UpdateMenuItems)
AUTOGENERATE_NAME(UpdateQuest)
AUTOGENERATE_NAME(UpdateSettings)
AUTOGENERATE_NAME(UpdateShortCutKeys)
AUTOGENERATE_NAME(UpdateTokenSlotsMaterial)
AUTOGENERATE_NAME(UpdateTooltips)
AUTOGENERATE_NAME(UpdateUseCooldown)
AUTOGENERATE_NAME(UpdateZoomButtonState)
AUTOGENERATE_NAME(WindowClosed)

//------------------------------------------------------------------------------
//  SBGuiStrings
//------------------------------------------------------------------------------

// USBGuiStrings 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT USBGuiStrings : public UObject {
  public:
    struct FLocalizedString Human;  // 28 400000 CPF_NeedCtorLink
    struct FLocalizedString Daevi;  // 34 400000 CPF_NeedCtorLink
    struct FLocalizedString Quarterstone;  // 40 400000 CPF_NeedCtorLink
    struct FLocalizedString Gloves;  // 4C 400000 CPF_NeedCtorLink
    struct FLocalizedString Shoes;  // 58 400000 CPF_NeedCtorLink
    struct FLocalizedString Friends;  // 64 400000 CPF_NeedCtorLink
    struct FLocalizedString team;  // 70 400000 CPF_NeedCtorLink
    struct FLocalizedString Guild;  // 7C 400000 CPF_NeedCtorLink
    struct FLocalizedString Local;  // 88 400000 CPF_NeedCtorLink
    struct FLocalizedString Login;  // 94 400000 CPF_NeedCtorLink
    struct FLocalizedString Logout;  // A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Username;  // AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Password;  // B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Exit_game;  // C4 400000 CPF_NeedCtorLink
    struct FLocalizedString Credits;  // D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Cancel;  // DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Confirm;  // E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Yes;  // F4 400000 CPF_NeedCtorLink
    struct FLocalizedString No;  // 100 400000 CPF_NeedCtorLink
    struct FLocalizedString Disable_;  // 10C 400000 CPF_NeedCtorLink
    struct FLocalizedString Friend_List;  // 118 400000 CPF_NeedCtorLink
    struct FLocalizedString Male;  // 124 400000 CPF_NeedCtorLink
    struct FLocalizedString Female;  // 130 400000 CPF_NeedCtorLink
    struct FLocalizedString Chest;  // 13C 400000 CPF_NeedCtorLink
    struct FLocalizedString Jump;  // 148 400000 CPF_NeedCtorLink
    struct FLocalizedString Shoulder;  // 154 400000 CPF_NeedCtorLink
    struct FLocalizedString Gauntlet;  // 160 400000 CPF_NeedCtorLink
    struct FLocalizedString Combat;  // 16C 400000 CPF_NeedCtorLink
    struct FLocalizedString CharName;  // 178 400000 CPF_NeedCtorLink
    struct FLocalizedString Class;  // 184 400000 CPF_NeedCtorLink
    struct FLocalizedString Body;  // 190 400000 CPF_NeedCtorLink
    struct FLocalizedString Bodytype;  // 19C 400000 CPF_NeedCtorLink
    struct FLocalizedString Head_Selection;  // 1A8 400000 CPF_NeedCtorLink
    struct FLocalizedString Tattoos;  // 1B4 400000 CPF_NeedCtorLink
    struct FLocalizedString clothing;  // 1C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Armour;  // 1CC 400000 CPF_NeedCtorLink
    struct FLocalizedString Create;  // 1D8 400000 CPF_NeedCtorLink
    struct FLocalizedString Player;  // 1E4 400000 CPF_NeedCtorLink
    struct FLocalizedString Distance;  // 1F0 400000 CPF_NeedCtorLink
    struct FLocalizedString Equipment;  // 1FC 400000 CPF_NeedCtorLink
    struct FLocalizedString Support;  // 208 400000 CPF_NeedCtorLink
    struct FLocalizedString Inventory;  // 214 400000 CPF_NeedCtorLink
    struct FLocalizedString Inventory_Filtered;  // 220 400000 CPF_NeedCtorLink
    struct FLocalizedString Messages_from_the_friends;  // 22C 400000 CPF_NeedCtorLink
    struct FLocalizedString Interface_Sensitivity;  // 238 400000 CPF_NeedCtorLink
    struct FLocalizedString Options;  // 244 400000 CPF_NeedCtorLink
    struct FLocalizedString View;  // 250 400000 CPF_NeedCtorLink
    struct FLocalizedString Heavy;  // 25C 400000 CPF_NeedCtorLink
    struct FLocalizedString We_re_sorry__but_logout_is_not_yet_implemented;  // 268 400000 CPF_NeedCtorLink
    struct FLocalizedString Your_new_character_has_been_created_successfully__;  // 274 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_Selected_Spellcaster;  // 280 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_Selected_Warrior;  // 28C 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_Selected_Rogue;  // 298 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_To_Select_A_Class;  // 2A4 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_Selected_2_Skills;  // 2B0 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_To_Select_1_More_Skill;  // 2BC 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_To_Select_2_Skills;  // 2C8 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_To_Select_A_Melee_And_Ranged_Weapon;  // 2D4 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_Selected_A_Melee_And_Ranged_Weapon;  // 2E0 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_To_Select_A_Melee_Weapon;  // 2EC 400000 CPF_NeedCtorLink
    struct FLocalizedString CC_You_Have_To_Select_A_Ranged_Weapon;  // 2F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Apply_color_to_all;  // 304 400000 CPF_NeedCtorLink
    struct FLocalizedString Choose_one_of_these_reward_items;  // 310 400000 CPF_NeedCtorLink
    struct FLocalizedString FX_volume;  // 31C 400000 CPF_NeedCtorLink
    struct FLocalizedString two_skills_remaining;  // 328 400000 CPF_NeedCtorLink
    struct FLocalizedString Skills_Left;  // 334 400000 CPF_NeedCtorLink
    struct FLocalizedString One_Skill_Left;  // 340 400000 CPF_NeedCtorLink
    struct FLocalizedString Learn_a_new_skill;  // 34C 400000 CPF_NeedCtorLink
    struct FLocalizedString Press_Learn_Button_To_Learn_Selected_Skills;  // 358 400000 CPF_NeedCtorLink
    struct FLocalizedString Select_A_Character;  // 364 400000 CPF_NeedCtorLink
    struct FLocalizedString Status;  // 370 400000 CPF_NeedCtorLink
    struct FLocalizedString User_name_or_password_incorrect;  // 37C 400000 CPF_NeedCtorLink
    struct FLocalizedString Invalid_protocol_version;  // 388 400000 CPF_NeedCtorLink
    struct FLocalizedString Wrong_client_version;  // 394 400000 CPF_NeedCtorLink
    struct FLocalizedString Chat;  // 3A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Game;  // 3AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Normal_;  // 3B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Backward;  // 3C4 400000 CPF_NeedCtorLink
    struct FLocalizedString Hair_Type;  // 3D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Faction;  // 3DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Universe_Selection;  // 3E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Universe_Name;  // 3F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Language;  // 400 400000 CPF_NeedCtorLink
    struct FLocalizedString UniverseType;  // 40C 400000 CPF_NeedCtorLink
    struct FLocalizedString Population;  // 418 400000 CPF_NeedCtorLink
    struct FLocalizedString No_universes_available_at_this_time;  // 424 400000 CPF_NeedCtorLink
    struct FLocalizedString Torso;  // 430 400000 CPF_NeedCtorLink
    struct FLocalizedString Video_Settings;  // 43C 400000 CPF_NeedCtorLink
    struct FLocalizedString Smooth_Mouse;  // 448 400000 CPF_NeedCtorLink
    struct FLocalizedString Hardware_Mouse_Cursor;  // 454 400000 CPF_NeedCtorLink
    struct FLocalizedString Archetype_Information;  // 460 400000 CPF_NeedCtorLink
    struct FLocalizedString Advanced_Display_Settings;  // 46C 400000 CPF_NeedCtorLink
    struct FLocalizedString Invert_Mouse;  // 478 400000 CPF_NeedCtorLink
    struct FLocalizedString Enable_post_processing_the_scene;  // 484 400000 CPF_NeedCtorLink
    struct FLocalizedString Controls;  // 490 400000 CPF_NeedCtorLink
    struct FLocalizedString Enter_Universe;  // 49C 400000 CPF_NeedCtorLink
    struct FLocalizedString Bloom_Strength;  // 4A8 400000 CPF_NeedCtorLink
    struct FLocalizedString Main_Class_Information;  // 4B4 400000 CPF_NeedCtorLink
    struct FLocalizedString Pawn_Shadows;  // 4C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Voice;  // 4CC 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_reset_to_defaults_;  // 4D8 400000 CPF_NeedCtorLink
    struct FLocalizedString Ringfell;  // 4E4 400000 CPF_NeedCtorLink
    struct FLocalizedString death;  // 4F0 400000 CPF_NeedCtorLink
    struct FLocalizedString Ancestral_Death;  // 4FC 400000 CPF_NeedCtorLink
    struct FLocalizedString Display_Settings;  // 508 400000 CPF_NeedCtorLink
    struct FLocalizedString Full_Screen;  // 514 400000 CPF_NeedCtorLink
    struct FLocalizedString Global_Detail;  // 520 400000 CPF_NeedCtorLink
    struct FLocalizedString View_Distance;  // 52C 400000 CPF_NeedCtorLink
    struct FLocalizedString Terrain_Decorations;  // 538 400000 CPF_NeedCtorLink
    struct FLocalizedString Mesh_Detail;  // 544 400000 CPF_NeedCtorLink
    struct FLocalizedString Use_HQSun;  // 550 400000 CPF_NeedCtorLink
    struct FLocalizedString Use_HQFog;  // 55C 400000 CPF_NeedCtorLink
    struct FLocalizedString MultiSampleLevel;  // 568 400000 CPF_NeedCtorLink
    struct FLocalizedString OnlyInFullScreenMode;  // 574 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Settings;  // 580 400000 CPF_NeedCtorLink
    struct FLocalizedString Basic_Settings;  // 58C 400000 CPF_NeedCtorLink
    struct FLocalizedString Main_Volume;  // 598 400000 CPF_NeedCtorLink
    struct FLocalizedString MUTE_ALL;  // 5A4 400000 CPF_NeedCtorLink
    struct FLocalizedString Mute_Music;  // 5B0 400000 CPF_NeedCtorLink
    struct FLocalizedString Mute_Fx;  // 5BC 400000 CPF_NeedCtorLink
    struct FLocalizedString Mute_Ambient_Stream;  // 5C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Mute_Ambient_Fx;  // 5D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Mute_Footsteps;  // 5E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Mute_Voices;  // 5EC 400000 CPF_NeedCtorLink
    struct FLocalizedString Mute_Monsters;  // 5F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Hardware_Acceleration;  // 604 400000 CPF_NeedCtorLink
    struct FLocalizedString Reverse_Stereo;  // 610 400000 CPF_NeedCtorLink
    struct FLocalizedString Mute_Interface;  // 61C 400000 CPF_NeedCtorLink
    struct FLocalizedString Advanced_Settings;  // 628 400000 CPF_NeedCtorLink
    struct FLocalizedString Ambient_Stream_Volume;  // 634 400000 CPF_NeedCtorLink
    struct FLocalizedString Ambient_FX_Volume;  // 640 400000 CPF_NeedCtorLink
    struct FLocalizedString Interface_Volume;  // 64C 400000 CPF_NeedCtorLink
    struct FLocalizedString Voices;  // 658 400000 CPF_NeedCtorLink
    struct FLocalizedString Footsteps;  // 664 400000 CPF_NeedCtorLink
    struct FLocalizedString Effects;  // 670 400000 CPF_NeedCtorLink
    struct FLocalizedString Wildlife;  // 67C 400000 CPF_NeedCtorLink
    struct FLocalizedString Monster;  // 688 400000 CPF_NeedCtorLink
    struct FLocalizedString Default;  // 694 400000 CPF_NeedCtorLink
    struct FLocalizedString Never;  // 6A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Rarely;  // 6AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Sometimes;  // 6B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Regularly;  // 6C4 400000 CPF_NeedCtorLink
    struct FLocalizedString Often;  // 6D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Always;  // 6DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Control_Settings;  // 6E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Swap_Mousebuttons;  // 6F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Mouse_Settings;  // 700 400000 CPF_NeedCtorLink
    struct FLocalizedString Mouse_Sensitivity;  // 70C 400000 CPF_NeedCtorLink
    struct FLocalizedString Mouse_Options;  // 718 400000 CPF_NeedCtorLink
    struct FLocalizedString Cursor_Mode;  // 724 400000 CPF_NeedCtorLink
    struct FLocalizedString Mouselook_Mode;  // 730 400000 CPF_NeedCtorLink
    struct FLocalizedString Camera;  // 73C 400000 CPF_NeedCtorLink
    struct FLocalizedString Recenter_Speed;  // 748 400000 CPF_NeedCtorLink
    struct FLocalizedString Interface_Settings;  // 754 400000 CPF_NeedCtorLink
    struct FLocalizedString Health_Bars;  // 760 400000 CPF_NeedCtorLink
    struct FLocalizedString Show_On_Near_Enemies;  // 76C 400000 CPF_NeedCtorLink
    struct FLocalizedString Near_Enemy_Distance;  // 778 400000 CPF_NeedCtorLink
    struct FLocalizedString Show_On_Hover;  // 784 400000 CPF_NeedCtorLink
    struct FLocalizedString Show_On_Selection;  // 790 400000 CPF_NeedCtorLink
    struct FLocalizedString Popup_On_Hit_Targets;  // 79C 400000 CPF_NeedCtorLink
    struct FLocalizedString Popup_On_Attackers;  // 7A8 400000 CPF_NeedCtorLink
    struct FLocalizedString Popup_Duration;  // 7B4 400000 CPF_NeedCtorLink
    struct FLocalizedString Show_Percentage;  // 7C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Hit_Blink_Duration;  // 7CC 400000 CPF_NeedCtorLink
    struct FLocalizedString Hit_Blink_Frequency;  // 7D8 400000 CPF_NeedCtorLink
    struct FLocalizedString Names;  // 7E4 400000 CPF_NeedCtorLink
    struct FLocalizedString Show_Names;  // 7F0 400000 CPF_NeedCtorLink
    struct FLocalizedString Name_Distance;  // 7FC 400000 CPF_NeedCtorLink
    struct FLocalizedString Names_On_Selected_Targets;  // 808 400000 CPF_NeedCtorLink
    struct FLocalizedString Names_On_Hovered_Targets;  // 814 400000 CPF_NeedCtorLink
    struct FLocalizedString Tooltips;  // 820 400000 CPF_NeedCtorLink
    struct FLocalizedString Fade_in_Duration;  // 82C 400000 CPF_NeedCtorLink
    struct FLocalizedString Appearance_Delay;  // 838 400000 CPF_NeedCtorLink
    struct FLocalizedString Join_the_Crew;  // 844 400000 CPF_NeedCtorLink
    struct FLocalizedString Rent_a_Cabin;  // 850 400000 CPF_NeedCtorLink
    struct FLocalizedString Interact_With_Target;  // 85C 400000 CPF_NeedCtorLink
    struct FLocalizedString Player_has_disconnected_;  // 868 400000 CPF_NeedCtorLink
    struct FLocalizedString Rewarded_items;  // 874 400000 CPF_NeedCtorLink
    struct FLocalizedString Random;  // 880 400000 CPF_NeedCtorLink
    struct FLocalizedString Reset;  // 88C 400000 CPF_NeedCtorLink
    struct FLocalizedString Randomize_the_current_selection;  // 898 400000 CPF_NeedCtorLink
    struct FLocalizedString Reset_the_current_selection;  // 8A4 400000 CPF_NeedCtorLink
    struct FLocalizedString Enable_the_bloom_effect_in_the_scene;  // 8B0 400000 CPF_NeedCtorLink
    struct FLocalizedString Free_Camera_Mode;  // 8BC 400000 CPF_NeedCtorLink
    struct FLocalizedString Toggle_Free_Camera_Mode;  // 8C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Toggle_Mouselook_Mode;  // 8D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Voice_Volume;  // 8E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Low;  // 8EC 400000 CPF_NeedCtorLink
    struct FLocalizedString Mind;  // 8F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Upper_Arm;  // 904 400000 CPF_NeedCtorLink
    struct FLocalizedString Accept;  // 910 400000 CPF_NeedCtorLink
    struct FLocalizedString Greetings;  // 91C 400000 CPF_NeedCtorLink
    struct FLocalizedString Complete;  // 928 400000 CPF_NeedCtorLink
    struct FLocalizedString Quest_Complete;  // 934 400000 CPF_NeedCtorLink
    struct FLocalizedString Quest_Log;  // 940 400000 CPF_NeedCtorLink
    struct FLocalizedString Tattoos_Selection;  // 94C 400000 CPF_NeedCtorLink
    struct FLocalizedString helmet;  // 958 400000 CPF_NeedCtorLink
    struct FLocalizedString Level;  // 964 400000 CPF_NeedCtorLink
    struct FLocalizedString Level_Header;  // 970 400000 CPF_NeedCtorLink
    struct FLocalizedString Magic;  // 97C 400000 CPF_NeedCtorLink
    struct FLocalizedString Defaults;  // 988 400000 CPF_NeedCtorLink
    struct FLocalizedString Smooth_the_mouse_movement_in_the_view_port;  // 994 400000 CPF_NeedCtorLink
    struct FLocalizedString Race;  // 9A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Skinny;  // 9AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Trying_to_create_your_character_;  // 9B8 400000 CPF_NeedCtorLink
    struct FLocalizedString one_skill_remaining;  // 9C4 400000 CPF_NeedCtorLink
    struct FLocalizedString Player_Texture_Detail;  // 9D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Success_;  // 9DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Set;  // 9E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Local_messages;  // 9F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Mount_of_Heroes;  // A00 400000 CPF_NeedCtorLink
    struct FLocalizedString Dead_Spell_Storm;  // A0C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sounds_good__I_ll_get_right_on_it_;  // A18 400000 CPF_NeedCtorLink
    struct FLocalizedString Where_do_I_start_;  // A24 400000 CPF_NeedCtorLink
    struct FLocalizedString Shin;  // A30 400000 CPF_NeedCtorLink
    struct FLocalizedString Focus;  // A3C 400000 CPF_NeedCtorLink
    struct FLocalizedString Gamma;  // A48 400000 CPF_NeedCtorLink
    struct FLocalizedString Brightness;  // A54 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_go_back_to_the_universe_sele;  // A60 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_change_to_the_selected_resolution;  // A6C 400000 CPF_NeedCtorLink
    struct FLocalizedString zero_skills_remaining;  // A78 400000 CPF_NeedCtorLink
    struct FLocalizedString Movement;  // A84 400000 CPF_NeedCtorLink
    struct FLocalizedString Set_the_strength_of_the_bloom_effect;  // A90 400000 CPF_NeedCtorLink
    struct FLocalizedString Music_Volume;  // A9C 400000 CPF_NeedCtorLink
    struct FLocalizedString Reject;  // AA8 400000 CPF_NeedCtorLink
    struct FLocalizedString Ancestral_Quests;  // AB4 400000 CPF_NeedCtorLink
    struct FLocalizedString weapon;  // AC0 400000 CPF_NeedCtorLink
    struct FLocalizedString Strafe_Right;  // ACC 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_proceed;  // AD8 400000 CPF_NeedCtorLink
    struct FLocalizedString Emotions;  // AE4 400000 CPF_NeedCtorLink
    struct FLocalizedString Apply_settings;  // AF0 400000 CPF_NeedCtorLink
    struct FLocalizedString Ultra_high;  // AFC 400000 CPF_NeedCtorLink
    struct FLocalizedString Load_sound_preset;  // B08 400000 CPF_NeedCtorLink
    struct FLocalizedString Strafe_Left;  // B14 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_on;  // B20 400000 CPF_NeedCtorLink
    struct FLocalizedString Shard_Quests;  // B2C 400000 CPF_NeedCtorLink
    struct FLocalizedString The_family_name_you_entered_is_already_in_use__Ple;  // B38 400000 CPF_NeedCtorLink
    struct FLocalizedString tier;  // B44 400000 CPF_NeedCtorLink
    struct FLocalizedString Thigh;  // B50 400000 CPF_NeedCtorLink
    struct FLocalizedString back;  // B5C 400000 CPF_NeedCtorLink
    struct FLocalizedString Close;  // B68 400000 CPF_NeedCtorLink
    struct FLocalizedString Spirit;  // B74 400000 CPF_NeedCtorLink
    struct FLocalizedString Quit_Game;  // B80 400000 CPF_NeedCtorLink
    struct FLocalizedString Geometric_Detail;  // B8C 400000 CPF_NeedCtorLink
    struct FLocalizedString An_internal_errors_has_occured__Please_try_again__;  // B98 400000 CPF_NeedCtorLink
    struct FLocalizedString Save_sound_settings;  // BA4 400000 CPF_NeedCtorLink
    struct FLocalizedString Universes_;  // BB0 400000 CPF_NeedCtorLink
    struct FLocalizedString Body_Selection;  // BBC 400000 CPF_NeedCtorLink
    struct FLocalizedString Enable_the_player_model_to_cast_shadows_on_the_env;  // BC8 400000 CPF_NeedCtorLink
    struct FLocalizedString Decline;  // BD4 400000 CPF_NeedCtorLink
    struct FLocalizedString Forward;  // BE0 400000 CPF_NeedCtorLink
    struct FLocalizedString Forward_Mail;  // BEC 400000 CPF_NeedCtorLink
    struct FLocalizedString The_family_name_you_entered_is_not_allowed__Please;  // BF8 400000 CPF_NeedCtorLink
    struct FLocalizedString Main_Menu;  // C04 400000 CPF_NeedCtorLink
    struct FLocalizedString Creating_Character;  // C10 400000 CPF_NeedCtorLink
    struct FLocalizedString Athletic;  // C1C 400000 CPF_NeedCtorLink
    struct FLocalizedString Select_Skill;  // C28 400000 CPF_NeedCtorLink
    struct FLocalizedString You_can_t_have_more_than_X_characters_per_universe;  // C34 400000 CPF_NeedCtorLink
    struct FLocalizedString Menus;  // C40 400000 CPF_NeedCtorLink
    struct FLocalizedString Mouse;  // C4C 400000 CPF_NeedCtorLink
    struct FLocalizedString Contrast;  // C58 400000 CPF_NeedCtorLink
    struct FLocalizedString Character_Statistics;  // C64 400000 CPF_NeedCtorLink
    struct FLocalizedString Rewards;  // C70 400000 CPF_NeedCtorLink
    struct FLocalizedString Resolution;  // C7C 400000 CPF_NeedCtorLink
    struct FLocalizedString World_Texture_Detail;  // C88 400000 CPF_NeedCtorLink
    struct FLocalizedString Interface;  // C94 400000 CPF_NeedCtorLink
    struct FLocalizedString world;  // CA0 400000 CPF_NeedCtorLink
    struct FLocalizedString Zoom_In;  // CAC 400000 CPF_NeedCtorLink
    struct FLocalizedString Zoom_Out_Next_Skill;  // CB8 400000 CPF_NeedCtorLink
    struct FLocalizedString Zoom_In_Previous_Skill;  // CC4 400000 CPF_NeedCtorLink
    struct FLocalizedString Select_Next_Skill;  // CD0 400000 CPF_NeedCtorLink
    struct FLocalizedString Select_Previous_Skill;  // CDC 400000 CPF_NeedCtorLink
    struct FLocalizedString High;  // CE8 400000 CPF_NeedCtorLink
    struct FLocalizedString Accepted;  // CF4 400000 CPF_NeedCtorLink
    struct FLocalizedString Error_during_connect;  // D00 400000 CPF_NeedCtorLink
    struct FLocalizedString Failed_to_connect;  // D0C 400000 CPF_NeedCtorLink
    struct FLocalizedString Gateway_failed_to_respond;  // D18 400000 CPF_NeedCtorLink
    struct FLocalizedString Error_during_authentication;  // D24 400000 CPF_NeedCtorLink
    struct FLocalizedString No_response_from_login_server;  // D30 400000 CPF_NeedCtorLink
    struct FLocalizedString No_response_from_universe_server;  // D3C 400000 CPF_NeedCtorLink
    struct FLocalizedString No_response_from_server;  // D48 400000 CPF_NeedCtorLink
    struct FLocalizedString You_are_already_logged_in_continue;  // D54 400000 CPF_NeedCtorLink
    struct FLocalizedString Failed_to_close_existing_connection_retry;  // D60 400000 CPF_NeedCtorLink
    struct FLocalizedString Failed_to_close_existing_connection;  // D6C 400000 CPF_NeedCtorLink
    struct FLocalizedString Connection_closed;  // D78 400000 CPF_NeedCtorLink
    struct FLocalizedString You_will_be_logged_out;  // D84 400000 CPF_NeedCtorLink
    struct FLocalizedString You_have_been_logged_out;  // D90 400000 CPF_NeedCtorLink
    struct FLocalizedString Appraisals;  // D9C 400000 CPF_NeedCtorLink
    struct FLocalizedString Display;  // DA8 400000 CPF_NeedCtorLink
    struct FLocalizedString Detail_Settings;  // DB4 400000 CPF_NeedCtorLink
    struct FLocalizedString Mouse_look_Mode;  // DC0 400000 CPF_NeedCtorLink
    struct FLocalizedString Guild_List;  // DCC 400000 CPF_NeedCtorLink
    struct FLocalizedString Change_the_mouse_interface_sensitivity;  // DD8 400000 CPF_NeedCtorLink
    struct FLocalizedString soul;  // DE4 400000 CPF_NeedCtorLink
    struct FLocalizedString Next_level;  // DF0 400000 CPF_NeedCtorLink
    struct FLocalizedString Default_settings;  // DFC 400000 CPF_NeedCtorLink
    struct FLocalizedString Talking_to;  // E08 400000 CPF_NeedCtorLink
    struct FLocalizedString Enter_your_name_;  // E14 400000 CPF_NeedCtorLink
    struct FLocalizedString Carnyx;  // E20 400000 CPF_NeedCtorLink
    struct FLocalizedString Activate_Selected_Skill;  // E2C 400000 CPF_NeedCtorLink
    struct FLocalizedString Ranged;  // E38 400000 CPF_NeedCtorLink
    struct FLocalizedString Quit;  // E44 400000 CPF_NeedCtorLink
    struct FLocalizedString Bloom_Effects;  // E50 400000 CPF_NeedCtorLink
    struct FLocalizedString Attack_Resistance;  // E5C 400000 CPF_NeedCtorLink
    struct FLocalizedString Please_wait___;  // E68 400000 CPF_NeedCtorLink
    struct FLocalizedString Messages_from_the_world;  // E74 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_revert_your_changes_;  // E80 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_quit_;  // E8C 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_delete_this_character_;  // E98 400000 CPF_NeedCtorLink
    struct FLocalizedString Deleting_character;  // EA4 400000 CPF_NeedCtorLink
    struct FLocalizedString The_character_name_you_entered_is_not_allowed__Ple;  // EB0 400000 CPF_NeedCtorLink
    struct FLocalizedString Apply;  // EBC 400000 CPF_NeedCtorLink
    struct FLocalizedString Retry;  // EC8 400000 CPF_NeedCtorLink
    struct FLocalizedString Enter_World;  // ED4 400000 CPF_NeedCtorLink
    struct FLocalizedString Click_Next_to_continue;  // EE0 400000 CPF_NeedCtorLink
    struct FLocalizedString Continue;  // EEC 400000 CPF_NeedCtorLink
    struct FLocalizedString System_Menu;  // EF8 400000 CPF_NeedCtorLink
    struct FLocalizedString Clear_Key;  // F04 400000 CPF_NeedCtorLink
    struct FLocalizedString Quick_select_an_Emote;  // F10 400000 CPF_NeedCtorLink
    struct FLocalizedString Quick_select_a_Channel_Filter;  // F1C 400000 CPF_NeedCtorLink
    struct FLocalizedString Login_failed;  // F28 400000 CPF_NeedCtorLink
    struct FLocalizedString Skill_Deck;  // F34 400000 CPF_NeedCtorLink
    struct FLocalizedString Change_the_mouse_sensitivity;  // F40 400000 CPF_NeedCtorLink
    struct FLocalizedString In_Game_Sensitivity;  // F4C 400000 CPF_NeedCtorLink
    struct FLocalizedString Clothing_Selection;  // F58 400000 CPF_NeedCtorLink
    struct FLocalizedString Zoom_Out;  // F64 400000 CPF_NeedCtorLink
    struct FLocalizedString Parliament;  // F70 400000 CPF_NeedCtorLink
    struct FLocalizedString Cancel_settings;  // F7C 400000 CPF_NeedCtorLink
    struct FLocalizedString Gender;  // F88 400000 CPF_NeedCtorLink
    struct FLocalizedString Delete;  // F94 400000 CPF_NeedCtorLink
    struct FLocalizedString Armour_Selection;  // FA0 400000 CPF_NeedCtorLink
    struct FLocalizedString Error_;  // FAC 400000 CPF_NeedCtorLink
    struct FLocalizedString Log_out;  // FB8 400000 CPF_NeedCtorLink
    struct FLocalizedString Melee;  // FC4 400000 CPF_NeedCtorLink
    struct FLocalizedString The_character_name_you_entered_is_already_in_use__;  // FD0 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound;  // FDC 400000 CPF_NeedCtorLink
    struct FLocalizedString Enter_your_family_name_;  // FE8 400000 CPF_NeedCtorLink
    struct FLocalizedString Ok;  // FF4 400000 CPF_NeedCtorLink
    struct FLocalizedString Experience;  // 1000 400000 CPF_NeedCtorLink
    struct FLocalizedString Post_Effects;  // 100C 400000 CPF_NeedCtorLink
    struct FLocalizedString Texture_Filtering;  // 1018 400000 CPF_NeedCtorLink
    struct FLocalizedString Leader_Player_has_disconnected_;  // 1024 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_exit_The_Chronicles_of_Sp;  // 1030 400000 CPF_NeedCtorLink
    struct FLocalizedString help;  // 103C 400000 CPF_NeedCtorLink
    struct FLocalizedString Skill_Book;  // 1048 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_apply_the_new_settings_;  // 1054 400000 CPF_NeedCtorLink
    struct FLocalizedString Footstep_volume;  // 1060 400000 CPF_NeedCtorLink
    struct FLocalizedString Hulky;  // 106C 400000 CPF_NeedCtorLink
    struct FLocalizedString Responses;  // 1078 400000 CPF_NeedCtorLink
    struct FLocalizedString Press_this_button_to_change_the_chat_channel;  // 1084 400000 CPF_NeedCtorLink
    struct FLocalizedString Please_fill_in_username_and_password;  // 1090 400000 CPF_NeedCtorLink
    struct FLocalizedString Create_New_Character;  // 109C 400000 CPF_NeedCtorLink
    struct FLocalizedString Head_Type;  // 10A8 400000 CPF_NeedCtorLink
    struct FLocalizedString Magic_Affinity;  // 10B4 400000 CPF_NeedCtorLink
    struct FLocalizedString Music_on;  // 10C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Whistle;  // 10CC 400000 CPF_NeedCtorLink
    struct FLocalizedString End_Conversation;  // 10D8 400000 CPF_NeedCtorLink
    struct FLocalizedString Rune;  // 10E4 400000 CPF_NeedCtorLink
    struct FLocalizedString Invert_vertical_mouse_controls;  // 10F0 400000 CPF_NeedCtorLink
    struct FLocalizedString Completed;  // 10FC 400000 CPF_NeedCtorLink
    struct FLocalizedString Create_Character;  // 1108 400000 CPF_NeedCtorLink
    struct FLocalizedString Directions;  // 1114 400000 CPF_NeedCtorLink
    struct FLocalizedString Specializing_Class_Info;  // 1120 400000 CPF_NeedCtorLink
    struct FLocalizedString Refresh;  // 112C 400000 CPF_NeedCtorLink
    struct FLocalizedString Spellborn_NDA;  // 1138 400000 CPF_NeedCtorLink
    struct FLocalizedString Nothing_selected;  // 1144 400000 CPF_NeedCtorLink
    struct FLocalizedString Enable_Lightmaps;  // 1150 400000 CPF_NeedCtorLink
    struct FLocalizedString Warning;  // 115C 400000 CPF_NeedCtorLink
    struct FLocalizedString This_change_requires_the_game_to_restart;  // 1168 400000 CPF_NeedCtorLink
    struct FLocalizedString World_Map;  // 1174 400000 CPF_NeedCtorLink
    struct FLocalizedString Recipe_Book;  // 1180 400000 CPF_NeedCtorLink
    struct FLocalizedString Friends_List;  // 118C 400000 CPF_NeedCtorLink
    struct FLocalizedString Equipped_Items;  // 1198 400000 CPF_NeedCtorLink
    struct FLocalizedString Settings_changed;  // 11A4 400000 CPF_NeedCtorLink
    struct FLocalizedString Shard;  // 11B0 400000 CPF_NeedCtorLink
    struct FLocalizedString Shard_Destinations;  // 11BC 400000 CPF_NeedCtorLink
    struct FLocalizedString Mission;  // 11C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Mission_Destinations;  // 11D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Send;  // 11E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Mail;  // 11EC 400000 CPF_NeedCtorLink
    struct FLocalizedString ArenaWindow;  // 11F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Outbox;  // 1204 400000 CPF_NeedCtorLink
    struct FLocalizedString Inbox;  // 1210 400000 CPF_NeedCtorLink
    struct FLocalizedString Unread_Mail;  // 121C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sent_Items;  // 1228 400000 CPF_NeedCtorLink
    struct FLocalizedString New_Message;  // 1234 400000 CPF_NeedCtorLink
    struct FLocalizedString Send_Mail;  // 1240 400000 CPF_NeedCtorLink
    struct FLocalizedString Sending;  // 124C 400000 CPF_NeedCtorLink
    struct FLocalizedString Mail_sent;  // 1258 400000 CPF_NeedCtorLink
    struct FLocalizedString Recipient_unknown;  // 1264 400000 CPF_NeedCtorLink
    struct FLocalizedString Error_while_sending;  // 1270 400000 CPF_NeedCtorLink
    struct FLocalizedString Error_not_enough_money_for_sending;  // 127C 400000 CPF_NeedCtorLink
    struct FLocalizedString Subject;  // 1288 400000 CPF_NeedCtorLink
    struct FLocalizedString From;  // 1294 400000 CPF_NeedCtorLink
    struct FLocalizedString To;  // 12A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Date;  // 12AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Time;  // 12B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_delete_this_mail;  // 12C4 400000 CPF_NeedCtorLink
    struct FLocalizedString No_destinations_available;  // 12D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Shard_ship_leaving_in;  // 12DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Waiting_for_departure;  // 12E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Boarding;  // 12F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Bilinear;  // 1300 400000 CPF_NeedCtorLink
    struct FLocalizedString Trilinear;  // 130C 400000 CPF_NeedCtorLink
    struct FLocalizedString Create_new_chat_window;  // 1318 400000 CPF_NeedCtorLink
    struct FLocalizedString Change_the_channel_filters;  // 1324 400000 CPF_NeedCtorLink
    struct FLocalizedString Global;  // 1330 400000 CPF_NeedCtorLink
    struct FLocalizedString Universe;  // 133C 400000 CPF_NeedCtorLink
    struct FLocalizedString Zone;  // 1348 400000 CPF_NeedCtorLink
    struct FLocalizedString Private;  // 1354 400000 CPF_NeedCtorLink
    struct FLocalizedString System;  // 1360 400000 CPF_NeedCtorLink
    struct FLocalizedString System_Message;  // 136C 400000 CPF_NeedCtorLink
    struct FLocalizedString ranking;  // 1378 400000 CPF_NeedCtorLink
    struct FLocalizedString Location;  // 1384 400000 CPF_NeedCtorLink
    struct FLocalizedString On_offline;  // 1390 400000 CPF_NeedCtorLink
    struct FLocalizedString Online;  // 139C 400000 CPF_NeedCtorLink
    struct FLocalizedString Offline;  // 13A8 400000 CPF_NeedCtorLink
    struct FLocalizedString Remove_player;  // 13B4 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_remove_this_player;  // 13C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Leave_Shop;  // 13CC 400000 CPF_NeedCtorLink
    struct FLocalizedString Forge_Service_Tooltip;  // 13D8 400000 CPF_NeedCtorLink
    struct FLocalizedString Tailor_Service_Tooltip;  // 13E4 400000 CPF_NeedCtorLink
    struct FLocalizedString PotionShop_Service_Tooltip;  // 13F0 400000 CPF_NeedCtorLink
    struct FLocalizedString Buy_Items_Tooltip;  // 13FC 400000 CPF_NeedCtorLink
    struct FLocalizedString Buy_Items;  // 1408 400000 CPF_NeedCtorLink
    struct FLocalizedString Buy_Item;  // 1414 400000 CPF_NeedCtorLink
    struct FLocalizedString Weapon_Selection;  // 1420 400000 CPF_NeedCtorLink
    struct FLocalizedString Primary_Weapon;  // 142C 400000 CPF_NeedCtorLink
    struct FLocalizedString Offhand_Weapon;  // 1438 400000 CPF_NeedCtorLink
    struct FLocalizedString Potions;  // 1444 400000 CPF_NeedCtorLink
    struct FLocalizedString Potion_Selection;  // 1450 400000 CPF_NeedCtorLink
    struct FLocalizedString Jackets;  // 145C 400000 CPF_NeedCtorLink
    struct FLocalizedString Jackets_Jerkins;  // 1468 400000 CPF_NeedCtorLink
    struct FLocalizedString Glove_Selection;  // 1474 400000 CPF_NeedCtorLink
    struct FLocalizedString Shoe_Selection;  // 1480 400000 CPF_NeedCtorLink
    struct FLocalizedString Spirit_Selection;  // 148C 400000 CPF_NeedCtorLink
    struct FLocalizedString Rune_Selection;  // 1498 400000 CPF_NeedCtorLink
    struct FLocalizedString Soul_Selection;  // 14A4 400000 CPF_NeedCtorLink
    struct FLocalizedString Food;  // 14B0 400000 CPF_NeedCtorLink
    struct FLocalizedString Food_Selection;  // 14BC 400000 CPF_NeedCtorLink
    struct FLocalizedString Drink;  // 14C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Drink_Selection;  // 14D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Weapons;  // 14E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Helmet_Selection;  // 14EC 400000 CPF_NeedCtorLink
    struct FLocalizedString Chest_Piece_Selection;  // 14F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Gauntlet_Selection;  // 1504 400000 CPF_NeedCtorLink
    struct FLocalizedString Shoulder_Piece_Selection;  // 1510 400000 CPF_NeedCtorLink
    struct FLocalizedString Shin_Piece_Selection;  // 151C 400000 CPF_NeedCtorLink
    struct FLocalizedString Thigh_Plate_Selection;  // 1528 400000 CPF_NeedCtorLink
    struct FLocalizedString Belt_Selection;  // 1534 400000 CPF_NeedCtorLink
    struct FLocalizedString Craft_Items_Tooltip;  // 1540 400000 CPF_NeedCtorLink
    struct FLocalizedString Craft_Item;  // 154C 400000 CPF_NeedCtorLink
    struct FLocalizedString Craft_Info;  // 1558 400000 CPF_NeedCtorLink
    struct FLocalizedString Craft_Recipe;  // 1564 400000 CPF_NeedCtorLink
    struct FLocalizedString Add_Sigils_Tooltip;  // 1570 400000 CPF_NeedCtorLink
    struct FLocalizedString Remove_Sigil;  // 157C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sigil_Crafting;  // 1588 400000 CPF_NeedCtorLink
    struct FLocalizedString Paint_Items_Tooltip;  // 1594 400000 CPF_NeedCtorLink
    struct FLocalizedString Dye_Clothing_Tooltip;  // 15A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Sell_Item;  // 15AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Sell_Items;  // 15B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Sell_Items2;  // 15C4 400000 CPF_NeedCtorLink
    struct FLocalizedString Sell_directly;  // 15D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Add_to_sell_list;  // 15DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Place_item_to_sell_here;  // 15E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Place_item_to_dye_here;  // 15F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Price;  // 1600 400000 CPF_NeedCtorLink
    struct FLocalizedString Sell_Price;  // 160C 400000 CPF_NeedCtorLink
    struct FLocalizedString Total_Cost;  // 1618 400000 CPF_NeedCtorLink
    struct FLocalizedString Paint_Items;  // 1624 400000 CPF_NeedCtorLink
    struct FLocalizedString Paint_Tool;  // 1630 400000 CPF_NeedCtorLink
    struct FLocalizedString Paint_Selection;  // 163C 400000 CPF_NeedCtorLink
    struct FLocalizedString Apply_to_all_items;  // 1648 400000 CPF_NeedCtorLink
    struct FLocalizedString Item_Cost;  // 1654 400000 CPF_NeedCtorLink
    struct FLocalizedString cost;  // 1660 400000 CPF_NeedCtorLink
    struct FLocalizedString Cost_Header;  // 166C 400000 CPF_NeedCtorLink
    struct FLocalizedString Removal_Cost;  // 1678 400000 CPF_NeedCtorLink
    struct FLocalizedString worth;  // 1684 400000 CPF_NeedCtorLink
    struct FLocalizedString Preview_Items;  // 1690 400000 CPF_NeedCtorLink
    struct FLocalizedString Preview_Colors;  // 169C 400000 CPF_NeedCtorLink
    struct FLocalizedString Armour_Shown;  // 16A8 400000 CPF_NeedCtorLink
    struct FLocalizedString Cloth_Shown;  // 16B4 400000 CPF_NeedCtorLink
    struct FLocalizedString All_Hidden;  // 16C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Reset_Changes;  // 16CC 400000 CPF_NeedCtorLink
    struct FLocalizedString Reset_Preview;  // 16D8 400000 CPF_NeedCtorLink
    struct FLocalizedString Show_Armour;  // 16E4 400000 CPF_NeedCtorLink
    struct FLocalizedString Show_Clothing;  // 16F0 400000 CPF_NeedCtorLink
    struct FLocalizedString Drop_Items_Here;  // 16FC 400000 CPF_NeedCtorLink
    struct FLocalizedString Vendor;  // 1708 400000 CPF_NeedCtorLink
    struct FLocalizedString Blacksmith;  // 1714 400000 CPF_NeedCtorLink
    struct FLocalizedString Tailor;  // 1720 400000 CPF_NeedCtorLink
    struct FLocalizedString RuneStone_Vendor;  // 172C 400000 CPF_NeedCtorLink
    struct FLocalizedString FoodDrinks_Vendor;  // 1738 400000 CPF_NeedCtorLink
    struct FLocalizedString Potion_Vendor;  // 1744 400000 CPF_NeedCtorLink
    struct FLocalizedString Soul_Vendor;  // 1750 400000 CPF_NeedCtorLink
    struct FLocalizedString Spirit_Vendor;  // 175C 400000 CPF_NeedCtorLink
    struct FLocalizedString Resources_Vendor;  // 1768 400000 CPF_NeedCtorLink
    struct FLocalizedString Item_Information;  // 1774 400000 CPF_NeedCtorLink
    struct FLocalizedString No_Item_Information;  // 1780 400000 CPF_NeedCtorLink
    struct FLocalizedString No_Item_Selected;  // 178C 400000 CPF_NeedCtorLink
    struct FLocalizedString Required_Resources;  // 1798 400000 CPF_NeedCtorLink
    struct FLocalizedString Place_your_recipe_here;  // 17A4 400000 CPF_NeedCtorLink
    struct FLocalizedString Place_your_damaged_item_here;  // 17B0 400000 CPF_NeedCtorLink
    struct FLocalizedString Drag_Sale_Item;  // 17BC 400000 CPF_NeedCtorLink
    struct FLocalizedString Drag_Weapon_Jewellery;  // 17C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Drag_Sigil;  // 17D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Description;  // 17E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Display_Channel_Name;  // 17EC 400000 CPF_NeedCtorLink
    struct FLocalizedString Display_Time;  // 17F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Looting;  // 1804 400000 CPF_NeedCtorLink
    struct FLocalizedString Group_Loot;  // 1810 400000 CPF_NeedCtorLink
    struct FLocalizedString Master_Loot;  // 181C 400000 CPF_NeedCtorLink
    struct FLocalizedString Free_For_All;  // 1828 400000 CPF_NeedCtorLink
    struct FLocalizedString Pass_all;  // 1834 400000 CPF_NeedCtorLink
    struct FLocalizedString Loot_All;  // 1840 400000 CPF_NeedCtorLink
    struct FLocalizedString Greed_All;  // 184C 400000 CPF_NeedCtorLink
    struct FLocalizedString Assign;  // 1858 400000 CPF_NeedCtorLink
    struct FLocalizedString Assign_All;  // 1864 400000 CPF_NeedCtorLink
    struct FLocalizedString End_Looting;  // 1870 400000 CPF_NeedCtorLink
    struct FLocalizedString End_Loot_Confirm_Query;  // 187C 400000 CPF_NeedCtorLink
    struct FLocalizedString End_Group_Loot_Confirm_Query;  // 1888 400000 CPF_NeedCtorLink
    struct FLocalizedString Leave_Team;  // 1894 400000 CPF_NeedCtorLink
    struct FLocalizedString Disband_Team;  // 18A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Promote_Team_Member;  // 18AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Kick_Team_Member;  // 18B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Team_Invitation;  // 18C4 400000 CPF_NeedCtorLink
    struct FLocalizedString You_have_been_invited_to_join_a_team_by;  // 18D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Team_Kick;  // 18DC 400000 CPF_NeedCtorLink
    struct FLocalizedString You_have_been_kicked_from_the_team;  // 18E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Team_disband;  // 18F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Your_team_has_disbanded;  // 1900 400000 CPF_NeedCtorLink
    struct FLocalizedString Drag_the_items_you_wish_to_trade_in_here;  // 190C 400000 CPF_NeedCtorLink
    struct FLocalizedString Add_money_you_wish_to_trade;  // 1918 400000 CPF_NeedCtorLink
    struct FLocalizedString Make_Offer;  // 1924 400000 CPF_NeedCtorLink
    struct FLocalizedString Accept_Offer;  // 1930 400000 CPF_NeedCtorLink
    struct FLocalizedString Trade_with;  // 193C 400000 CPF_NeedCtorLink
    struct FLocalizedString Preparing_offer;  // 1948 400000 CPF_NeedCtorLink
    struct FLocalizedString Offer_made;  // 1954 400000 CPF_NeedCtorLink
    struct FLocalizedString Remove_Item;  // 1960 400000 CPF_NeedCtorLink
    struct FLocalizedString Remove_All;  // 196C 400000 CPF_NeedCtorLink
    struct FLocalizedString Trade_request;  // 1978 400000 CPF_NeedCtorLink
    struct FLocalizedString Requesting_trade_with;  // 1984 400000 CPF_NeedCtorLink
    struct FLocalizedString Has_requested_a_trade;  // 1990 400000 CPF_NeedCtorLink
    struct FLocalizedString Do_you_wish_to_accept_this_offer_;  // 199C 400000 CPF_NeedCtorLink
    struct FLocalizedString The_request_has_been_rejected;  // 19A8 400000 CPF_NeedCtorLink
    struct FLocalizedString You_rejected_the_trade_request;  // 19B4 400000 CPF_NeedCtorLink
    struct FLocalizedString has_rejected_your_offer;  // 19C0 400000 CPF_NeedCtorLink
    struct FLocalizedString You_rejected_the_trade_offer;  // 19CC 400000 CPF_NeedCtorLink
    struct FLocalizedString You_cancelled_the_trade;  // 19D8 400000 CPF_NeedCtorLink
    struct FLocalizedString N_has_cancelled_the_trade;  // 19E4 400000 CPF_NeedCtorLink
    struct FLocalizedString N_has_cancelled_the_trade_invitation;  // 19F0 400000 CPF_NeedCtorLink
    struct FLocalizedString You_cancelled_the_trade_invitation;  // 19FC 400000 CPF_NeedCtorLink
    struct FLocalizedString This_is_the_name_of_the_area_you_re_currently_in_;  // 1A08 400000 CPF_NeedCtorLink
    struct FLocalizedString Open_worldmap;  // 1A14 400000 CPF_NeedCtorLink
    struct FLocalizedString Show_compass;  // 1A20 400000 CPF_NeedCtorLink
    struct FLocalizedString Show_minimap;  // 1A2C 400000 CPF_NeedCtorLink
    struct FLocalizedString You_have_discovered_a_new_area;  // 1A38 400000 CPF_NeedCtorLink
    struct FLocalizedString Lock_Window;  // 1A44 400000 CPF_NeedCtorLink
    struct FLocalizedString Unlock_Window;  // 1A50 400000 CPF_NeedCtorLink
    struct FLocalizedString Transparency;  // 1A5C 400000 CPF_NeedCtorLink
    struct FLocalizedString Autoplace;  // 1A68 400000 CPF_NeedCtorLink
    struct FLocalizedString Channel;  // 1A74 400000 CPF_NeedCtorLink
    struct FLocalizedString Create_new_channel;  // 1A80 400000 CPF_NeedCtorLink
    struct FLocalizedString Rename_current_channel;  // 1A8C 400000 CPF_NeedCtorLink
    struct FLocalizedString Enter_channel_name;  // 1A98 400000 CPF_NeedCtorLink
    struct FLocalizedString Delete_current_channel;  // 1AA4 400000 CPF_NeedCtorLink
    struct FLocalizedString Emotes;  // 1AB0 400000 CPF_NeedCtorLink
    struct FLocalizedString filter;  // 1ABC 400000 CPF_NeedCtorLink
    struct FLocalizedString Fade_Out;  // 1AC8 400000 CPF_NeedCtorLink
    struct FLocalizedString Press_Next_to_continue;  // 1AD4 400000 CPF_NeedCtorLink
    struct FLocalizedString You_can_select_your_Facial_Features_and_Hair_Style_here;  // 1AE0 400000 CPF_NeedCtorLink
    struct FLocalizedString You_can_select_your_Armour_here;  // 1AEC 400000 CPF_NeedCtorLink
    struct FLocalizedString You_can_select_your_clothing_here;  // 1AF8 400000 CPF_NeedCtorLink
    struct FLocalizedString You_can_select_your_Race_Gender_and_Body_here;  // 1B04 400000 CPF_NeedCtorLink
    struct FLocalizedString You_can_select_Tattoos_here;  // 1B10 400000 CPF_NeedCtorLink
    struct FLocalizedString You_can_chose_a_name_for_your_character_here;  // 1B1C 400000 CPF_NeedCtorLink
    struct FLocalizedString Your_fame_level_increased;  // 1B28 400000 CPF_NeedCtorLink
    struct FLocalizedString Your_pep_rank_increased;  // 1B34 400000 CPF_NeedCtorLink
    struct FLocalizedString Conversation;  // 1B40 400000 CPF_NeedCtorLink
    struct FLocalizedString Character_Selection;  // 1B4C 400000 CPF_NeedCtorLink
    struct FLocalizedString Level_Area;  // 1B58 400000 CPF_NeedCtorLink
    struct FLocalizedString Shard_Map;  // 1B64 400000 CPF_NeedCtorLink
    struct FLocalizedString Character_Creation;  // 1B70 400000 CPF_NeedCtorLink
    struct FLocalizedString Select_Skills;  // 1B7C 400000 CPF_NeedCtorLink
    struct FLocalizedString Traveling_to;  // 1B88 400000 CPF_NeedCtorLink
    struct FLocalizedString Trade;  // 1B94 400000 CPF_NeedCtorLink
    struct FLocalizedString Trading;  // 1BA0 400000 CPF_NeedCtorLink
    struct FLocalizedString Trade_Status;  // 1BAC 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop;  // 1BB8 400000 CPF_NeedCtorLink
    struct FLocalizedString Body_Slots;  // 1BC4 400000 CPF_NeedCtorLink
    struct FLocalizedString Quest_Completed;  // 1BD0 400000 CPF_NeedCtorLink
    struct FLocalizedString Confirm_Skill_Selection;  // 1BDC 400000 CPF_NeedCtorLink
    struct FLocalizedString Arena_Status;  // 1BE8 400000 CPF_NeedCtorLink
    struct FLocalizedString Arena_Score;  // 1BF4 400000 CPF_NeedCtorLink
    struct FLocalizedString MiniGames;  // 1C00 400000 CPF_NeedCtorLink
    struct FLocalizedString MiniGame_Invitation;  // 1C0C 400000 CPF_NeedCtorLink
    struct FLocalizedString MiniGame_Settings;  // 1C18 400000 CPF_NeedCtorLink
    struct FLocalizedString Create_Guild;  // 1C24 400000 CPF_NeedCtorLink
    struct FLocalizedString Join_Guild;  // 1C30 400000 CPF_NeedCtorLink
    struct FLocalizedString Friend_Ignore_List;  // 1C3C 400000 CPF_NeedCtorLink
    struct FLocalizedString Target_Information;  // 1C48 400000 CPF_NeedCtorLink
    struct FLocalizedString Tutorial;  // 1C54 400000 CPF_NeedCtorLink
    struct FLocalizedString Rules;  // 1C60 400000 CPF_NeedCtorLink
    struct FLocalizedString The_Chronicles_of_Spellborn_Credits;  // 1C6C 400000 CPF_NeedCtorLink
    struct FLocalizedString Timers;  // 1C78 400000 CPF_NeedCtorLink
    struct FLocalizedString Draw_Weapon;  // 1C84 400000 CPF_NeedCtorLink
    struct FLocalizedString Sheath_Weapon;  // 1C90 400000 CPF_NeedCtorLink
    struct FLocalizedString Melee_Resistance;  // 1C9C 400000 CPF_NeedCtorLink
    struct FLocalizedString Resistance;  // 1CA8 400000 CPF_NeedCtorLink
    struct FLocalizedString Melee_resistance_description;  // 1CB4 400000 CPF_NeedCtorLink
    struct FLocalizedString Magic_Resistance;  // 1CC0 400000 CPF_NeedCtorLink
    struct FLocalizedString Magic_Resistance_description;  // 1CCC 400000 CPF_NeedCtorLink
    struct FLocalizedString Ranged_Resistance;  // 1CD8 400000 CPF_NeedCtorLink
    struct FLocalizedString Ranged_Resistance_description;  // 1CE4 400000 CPF_NeedCtorLink
    struct FLocalizedString Rune_Affinity;  // 1CF0 400000 CPF_NeedCtorLink
    struct FLocalizedString Affinity;  // 1CFC 400000 CPF_NeedCtorLink
    struct FLocalizedString Rune_Affinity_description;  // 1D08 400000 CPF_NeedCtorLink
    struct FLocalizedString Spirit_Affinity;  // 1D14 400000 CPF_NeedCtorLink
    struct FLocalizedString Spirit_Affinity_description;  // 1D20 400000 CPF_NeedCtorLink
    struct FLocalizedString Soul_Affinity;  // 1D2C 400000 CPF_NeedCtorLink
    struct FLocalizedString Soul_Affinity_description;  // 1D38 400000 CPF_NeedCtorLink
    struct FLocalizedString Attack_Resistance_description1;  // 1D44 400000 CPF_NeedCtorLink
    struct FLocalizedString Attack_Resistance_description2;  // 1D50 400000 CPF_NeedCtorLink
    struct FLocalizedString Magic_Affinity_description1;  // 1D5C 400000 CPF_NeedCtorLink
    struct FLocalizedString Magic_Affinity_description2;  // 1D68 400000 CPF_NeedCtorLink
    struct FLocalizedString Magic_Affinity_description3;  // 1D74 400000 CPF_NeedCtorLink
    struct FLocalizedString Attribute;  // 1D80 400000 CPF_NeedCtorLink
    struct FLocalizedString Body_description;  // 1D8C 400000 CPF_NeedCtorLink
    struct FLocalizedString Body_line1;  // 1D98 400000 CPF_NeedCtorLink
    struct FLocalizedString Body_line2;  // 1DA4 400000 CPF_NeedCtorLink
    struct FLocalizedString Body_line3;  // 1DB0 400000 CPF_NeedCtorLink
    struct FLocalizedString Focus_description1;  // 1DBC 400000 CPF_NeedCtorLink
    struct FLocalizedString Focus_line1;  // 1DC8 400000 CPF_NeedCtorLink
    struct FLocalizedString Focus_line2;  // 1DD4 400000 CPF_NeedCtorLink
    struct FLocalizedString Focus_line3;  // 1DE0 400000 CPF_NeedCtorLink
    struct FLocalizedString Mind_description1;  // 1DEC 400000 CPF_NeedCtorLink
    struct FLocalizedString Mind_line1;  // 1DF8 400000 CPF_NeedCtorLink
    struct FLocalizedString Mind_line2;  // 1E04 400000 CPF_NeedCtorLink
    struct FLocalizedString Mind_line3;  // 1E10 400000 CPF_NeedCtorLink
    struct FLocalizedString Cratered;  // 1E1C 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_Sigil_Slot;  // 1E28 400000 CPF_NeedCtorLink
    struct FLocalizedString Opener;  // 1E34 400000 CPF_NeedCtorLink
    struct FLocalizedString Finisher;  // 1E40 400000 CPF_NeedCtorLink
    struct FLocalizedString None_;  // 1E4C 400000 CPF_NeedCtorLink
    struct FLocalizedString Legal_Sigils;  // 1E58 400000 CPF_NeedCtorLink
    struct FLocalizedString Equip;  // 1E64 400000 CPF_NeedCtorLink
    struct FLocalizedString Unequip;  // 1E70 400000 CPF_NeedCtorLink
    struct FLocalizedString Breakdown;  // 1E7C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sell;  // 1E88 400000 CPF_NeedCtorLink
    struct FLocalizedString Info;  // 1E94 400000 CPF_NeedCtorLink
    struct FLocalizedString Use;  // 1EA0 400000 CPF_NeedCtorLink
    struct FLocalizedString Enter;  // 1EAC 400000 CPF_NeedCtorLink
    struct FLocalizedString Open;  // 1EB8 400000 CPF_NeedCtorLink
    struct FLocalizedString Sit;  // 1EC4 400000 CPF_NeedCtorLink
    struct FLocalizedString Loot;  // 1ED0 400000 CPF_NeedCtorLink
    struct FLocalizedString Gather;  // 1EDC 400000 CPF_NeedCtorLink
    struct FLocalizedString Interact;  // 1EE8 400000 CPF_NeedCtorLink
    struct FLocalizedString Talk;  // 1EF4 400000 CPF_NeedCtorLink
    struct FLocalizedString Team_Invite;  // 1F00 400000 CPF_NeedCtorLink
    struct FLocalizedString Guild_Invite;  // 1F0C 400000 CPF_NeedCtorLink
    struct FLocalizedString Add_to_Friends;  // 1F18 400000 CPF_NeedCtorLink
    struct FLocalizedString Travel;  // 1F24 400000 CPF_NeedCtorLink
    struct FLocalizedString mailbox;  // 1F30 400000 CPF_NeedCtorLink
    struct FLocalizedString Arena_Master;  // 1F3C 400000 CPF_NeedCtorLink
    struct FLocalizedString miniGame;  // 1F48 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Buy_Forge;  // 1F54 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Buy_Tailor;  // 1F60 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Buy_Soul;  // 1F6C 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Buy_Rune;  // 1F78 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Buy_Spirit;  // 1F84 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Buy_Tavern;  // 1F90 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Buy_General;  // 1F9C 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Craft_Forge;  // 1FA8 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Craft_Soul;  // 1FB4 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Craft_Rune;  // 1FC0 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Craft_Spirit;  // 1FCC 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Craft_Tavern;  // 1FD8 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Craft_General;  // 1FE4 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Painting;  // 1FF0 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Sigil_Forging;  // 1FFC 400000 CPF_NeedCtorLink
    struct FLocalizedString Shop_Dragon;  // 2008 400000 CPF_NeedCtorLink
    struct FLocalizedString Upgrade_a_skill;  // 2014 400000 CPF_NeedCtorLink
    struct FLocalizedString No_upgrade_left;  // 2020 400000 CPF_NeedCtorLink
    struct FLocalizedString One_upgrade_left;  // 202C 400000 CPF_NeedCtorLink
    struct FLocalizedString Upgrades_Left;  // 2038 400000 CPF_NeedCtorLink
    struct FLocalizedString Unknown;  // 2044 400000 CPF_NeedCtorLink
    struct FLocalizedString Learnable;  // 2050 400000 CPF_NeedCtorLink
    struct FLocalizedString Learned;  // 205C 400000 CPF_NeedCtorLink
    struct FLocalizedString Press_confirm_to_learn_this_skill;  // 2068 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_Skill_Slot;  // 2074 400000 CPF_NeedCtorLink
    struct FLocalizedString Press_confirm_to_upgrade_this_skill;  // 2080 400000 CPF_NeedCtorLink
    struct FLocalizedString DuffShare;  // 208C 400000 CPF_NeedCtorLink
    struct FLocalizedString Target_fame_level;  // 2098 400000 CPF_NeedCtorLink
    struct FLocalizedString This_target_has_the_maximum_fame_level_possible;  // 20A4 400000 CPF_NeedCtorLink
    struct FLocalizedString Character_fame_level;  // 20B0 400000 CPF_NeedCtorLink
    struct FLocalizedString Maximum_fame_level_reached_;  // 20BC 400000 CPF_NeedCtorLink
    struct FLocalizedString Target_health;  // 20C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Character_health;  // 20D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Current_and_maximum_health_selected_target;  // 20E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Current_and_maximum_health_your_character;  // 20EC 400000 CPF_NeedCtorLink
    struct FLocalizedString This_target_has_the_maximum_pep_rank_possible;  // 20F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Maximum_pep_rank_reached;  // 2104 400000 CPF_NeedCtorLink
    struct FLocalizedString Target_pep_rank;  // 2110 400000 CPF_NeedCtorLink
    struct FLocalizedString Character_pep_rank;  // 211C 400000 CPF_NeedCtorLink
    struct FLocalizedString Target_status;  // 2128 400000 CPF_NeedCtorLink
    struct FLocalizedString Character_status;  // 2134 400000 CPF_NeedCtorLink
    struct FLocalizedString TargetStatusBarsDescription;  // 2140 400000 CPF_NeedCtorLink
    struct FLocalizedString CharacterStatusBarsDescription;  // 214C 400000 CPF_NeedCtorLink
    struct FLocalizedString Party_member_health;  // 2158 400000 CPF_NeedCtorLink
    struct FLocalizedString TeamInformationscreenDescription;  // 2164 400000 CPF_NeedCtorLink
    struct FLocalizedString Discipline;  // 2170 400000 CPF_NeedCtorLink
    struct FLocalizedString Archetype;  // 217C 400000 CPF_NeedCtorLink
    struct FLocalizedString Physique;  // 2188 400000 CPF_NeedCtorLink
    struct FLocalizedString Morale;  // 2194 400000 CPF_NeedCtorLink
    struct FLocalizedString Concentration;  // 21A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Party_member_status;  // 21AC 400000 CPF_NeedCtorLink
    struct FLocalizedString CharacterStatusBarDescription;  // 21B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Buy;  // 21C4 400000 CPF_NeedCtorLink
    struct FLocalizedString Add_to_trade;  // 21D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Remove_from_trade;  // 21DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Return_item;  // 21E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Split_;  // 21F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Take_attachment;  // 2200 400000 CPF_NeedCtorLink
    struct FLocalizedString Movement_speed;  // 220C 400000 CPF_NeedCtorLink
    struct FLocalizedString Damage_output;  // 2218 400000 CPF_NeedCtorLink
    struct FLocalizedString Resistance_values;  // 2224 400000 CPF_NeedCtorLink
    struct FLocalizedString Current_Fame_Points_;  // 2230 400000 CPF_NeedCtorLink
    struct FLocalizedString Needed_for_next_level_;  // 223C 400000 CPF_NeedCtorLink
    struct FLocalizedString ThisTargetHas_FamePoints;  // 2248 400000 CPF_NeedCtorLink
    struct FLocalizedString Current_pep_points_;  // 2254 400000 CPF_NeedCtorLink
    struct FLocalizedString Needed_for_next_rank_;  // 2260 400000 CPF_NeedCtorLink
    struct FLocalizedString Loot_mode_set_to_LOOTMODE_;  // 226C 400000 CPF_NeedCtorLink
    struct FLocalizedString Greed;  // 2278 400000 CPF_NeedCtorLink
    struct FLocalizedString Need;  // 2284 400000 CPF_NeedCtorLink
    struct FLocalizedString Quest_Items;  // 2290 400000 CPF_NeedCtorLink
    struct FLocalizedString Filters;  // 229C 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_trade_item__No_empty_trade_slots_left;  // 22A8 400000 CPF_NeedCtorLink
    struct FLocalizedString User_startable;  // 22B4 400000 CPF_NeedCtorLink
    struct FLocalizedString Skill_startable;  // 22C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Recipe_for_ITEMNAME;  // 22CC 400000 CPF_NeedCtorLink
    struct FLocalizedString Necessary_resources_;  // 22D8 400000 CPF_NeedCtorLink
    struct FLocalizedString Crafting_Cost_;  // 22E4 400000 CPF_NeedCtorLink
    struct FLocalizedString Sigil_rank_;  // 22F0 400000 CPF_NeedCtorLink
    struct FLocalizedString Compatible_with_Jewelry;  // 22FC 400000 CPF_NeedCtorLink
    struct FLocalizedString Compatible_with_Melee_Weapons;  // 2308 400000 CPF_NeedCtorLink
    struct FLocalizedString Compatible_with_Melee_Weapons_and_Jewelry;  // 2314 400000 CPF_NeedCtorLink
    struct FLocalizedString Attuned;  // 2320 400000 CPF_NeedCtorLink
    struct FLocalizedString Not_Attuned;  // 232C 400000 CPF_NeedCtorLink
    struct FLocalizedString Slot_Empty;  // 2338 400000 CPF_NeedCtorLink
    struct FLocalizedString Slot_Unavailable;  // 2344 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_ranged_weapon_slot;  // 2350 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_melee_weapon_slot;  // 235C 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_shield_slot;  // 2368 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_helmet_slot;  // 2374 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_necklace_slot;  // 2380 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_chest_amour_slot;  // 238C 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_left_shoulder_slot;  // 2398 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_right_shoulder_slot;  // 23A4 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_left_gauntlet_slot;  // 23B0 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_right_gauntlet_slot;  // 23BC 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_left_glove_slot;  // 23C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_right_glove_slot;  // 23D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_left_ring_slot;  // 23E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_right_ring_slot;  // 23EC 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_left_thigh_slot;  // 23F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_right_thigh_slot;  // 2404 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_left_shin_slot;  // 2410 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_right_shin_slot;  // 241C 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_chest_clothing_slot;  // 2428 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_belt_slot;  // 2434 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_pants_slot;  // 2440 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_shoes_slot;  // 244C 400000 CPF_NeedCtorLink
    struct FLocalizedString Unable_to_move_Item_cant_move_attachment_here;  // 2458 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_mail_item_This_item_is_attuned_to_you;  // 2464 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_mail_item_This_item_is_not_tradable;  // 2470 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_trade_item_This_item_is_attuned_to_you;  // 247C 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_trade_item_This_item_is_not_tradable;  // 2488 400000 CPF_NeedCtorLink
    struct FLocalizedString Failed;  // 2494 400000 CPF_NeedCtorLink
    struct FLocalizedString AreYouSure_AbandonQuest;  // 24A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Abandon_Quest;  // 24AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Logging_in___;  // 24B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Cancel_Character_Creation;  // 24C4 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_cancel_Character_Creaton;  // 24D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Armour_Info;  // 24DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Failed_;  // 24E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_inventory_slot;  // 24F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Time_remaining;  // 2500 400000 CPF_NeedCtorLink
    struct FLocalizedString Out_of_time;  // 250C 400000 CPF_NeedCtorLink
    struct FLocalizedString World_traveling_failed_;  // 2518 400000 CPF_NeedCtorLink
    struct FLocalizedString Combat_log;  // 2524 400000 CPF_NeedCtorLink
    struct FLocalizedString Spellborn;  // 2530 400000 CPF_NeedCtorLink
    struct FLocalizedString PrivateMessageHelp;  // 253C 400000 CPF_NeedCtorLink
    struct FLocalizedString messageStr;  // 2548 400000 CPF_NeedCtorLink
    struct FLocalizedString Departing___;  // 2554 400000 CPF_NeedCtorLink
    struct FLocalizedString Join_travel;  // 2560 400000 CPF_NeedCtorLink
    struct FLocalizedString Party_travel_has_been_cancelled_;  // 256C 400000 CPF_NeedCtorLink
    struct FLocalizedString Party_has_departed_without_you_;  // 2578 400000 CPF_NeedCtorLink
    struct FLocalizedString Departing_in_DEPART_TIME___;  // 2584 400000 CPF_NeedCtorLink
    struct FLocalizedString Do_not_meet_requirements;  // 2590 400000 CPF_NeedCtorLink
    struct FLocalizedString Travel_Failed;  // 259C 400000 CPF_NeedCtorLink
    struct FLocalizedString One_day;  // 25A8 400000 CPF_NeedCtorLink
    struct FLocalizedString DAYS_days;  // 25B4 400000 CPF_NeedCtorLink
    struct FLocalizedString ShaderModelMsg;  // 25C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Paint_failure;  // 25CC 400000 CPF_NeedCtorLink
    struct FLocalizedString This_item_cannot_be_painted;  // 25D8 400000 CPF_NeedCtorLink
    struct FLocalizedString You_do_not_have_enough_money_to_paint_that_item;  // 25E4 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_buy_item;  // 25F0 400000 CPF_NeedCtorLink
    struct FLocalizedString NotEnoughMoney_ToBuyItem;  // 25FC 400000 CPF_NeedCtorLink
    struct FLocalizedString Buy_items2;  // 2608 400000 CPF_NeedCtorLink
    struct FLocalizedString How_many_items_of_this_type_do_you_want_;  // 2614 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_craft_recipe;  // 2620 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_this_shop_doesnt_accept_this_type_of_recipe;  // 262C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_you_dont_have_the_necessary_resources_to_craft;  // 2638 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_you_dont_have_enough_money_to_craft_this_recipe;  // 2644 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_create_recipe;  // 2650 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_you_cant_craft_sigils_on_this_item;  // 265C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_you_need_to_place_broken_item_here;  // 2668 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_you_dont_have_enough_money_to_create_a_recipe;  // 2674 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_sell_item;  // 2680 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_the_shop_owner_doesnt_want_this_item;  // 268C 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_sell_this_item;  // 2698 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_forge_sigil;  // 26A4 400000 CPF_NeedCtorLink
    struct FLocalizedString Forge_Sigil;  // 26B0 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_forge_this_sigil_on_this_item_;  // 26BC 400000 CPF_NeedCtorLink
    struct FLocalizedString Forge_Note_Free_Slot;  // 26C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Forge_Note_Taken_Slot;  // 26D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Remove_Sigils;  // 26E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_Remove_Sigils;  // 26EC 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_remove_the_sigils_from_this_item;  // 26F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Forge_Remove_Note_1;  // 2704 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_I_dropped_my_tools;  // 2710 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_you_cant_place_a_sigil_in_this_slot;  // 271C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_you_dont_have_enough_money_to_craft_this_Sigil;  // 2728 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_this_Sigil_is_not_compatible_with_this_Item;  // 2734 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_your_Fame_level_is_too_low_for_this_Sigil;  // 2740 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_this_Sigils_rank_is_too_high_for_this_slot;  // 274C 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_remove_this_sigil_from_this_item_;  // 2758 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_remove_Sigil;  // 2764 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_you_dont_have_enough_space_in_your_inv_remove_sigil;  // 2770 400000 CPF_NeedCtorLink
    struct FLocalizedString Sorry_but_you_dont_have_enough_money_to_remove_this_Sigil;  // 277C 400000 CPF_NeedCtorLink
    struct FLocalizedString Result_;  // 2788 400000 CPF_NeedCtorLink
    struct FLocalizedString rank;  // 2794 400000 CPF_NeedCtorLink
    struct FLocalizedString Promote_Player;  // 27A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Demote_Player;  // 27AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Remove_from_Guild;  // 27B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_promote_MEMBERNAME__member_is_rank_RANKLEVEL_;  // 27C4 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_promote_MEMBERNAME_;  // 27D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_demote_MEMBERNAME__member_is_rank_RANKLEVEL_;  // 27DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_demote_MEMBERNAME_;  // 27E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Guild_master_cannot_be_removed_from_guild_;  // 27F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Disband_Guild;  // 2800 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_disband_your_guild_;  // 280C 400000 CPF_NeedCtorLink
    struct FLocalizedString Leave_Guild;  // 2818 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_leave_your_guild_;  // 2824 400000 CPF_NeedCtorLink
    struct FLocalizedString Playername_;  // 2830 400000 CPF_NeedCtorLink
    struct FLocalizedString Please_enter_the_player_name_;  // 283C 400000 CPF_NeedCtorLink
    struct FLocalizedString ErrorDOT;  // 2848 400000 CPF_NeedCtorLink
    struct FLocalizedString Message_of_the_day_;  // 2854 400000 CPF_NeedCtorLink
    struct FLocalizedString Disband_Guild_You_can_disband_your_guild_this_can_not_be_undone;  // 2860 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_disband_this_guild_;  // 286C 400000 CPF_NeedCtorLink
    struct FLocalizedString Read_in_guild_chat;  // 2878 400000 CPF_NeedCtorLink
    struct FLocalizedString Write_in_guild_chat;  // 2884 400000 CPF_NeedCtorLink
    struct FLocalizedString Invite_players_to_the_guild;  // 2890 400000 CPF_NeedCtorLink
    struct FLocalizedString Set_message_of_the_day;  // 289C 400000 CPF_NeedCtorLink
    struct FLocalizedString Promote_Demote_players;  // 28A8 400000 CPF_NeedCtorLink
    struct FLocalizedString Current_Ranks;  // 28B4 400000 CPF_NeedCtorLink
    struct FLocalizedString Rank_;  // 28C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Add_Rank;  // 28CC 400000 CPF_NeedCtorLink
    struct FLocalizedString Remove_Rank;  // 28D8 400000 CPF_NeedCtorLink
    struct FLocalizedString Rank_level_must_be_a_numeric_value_;  // 28E4 400000 CPF_NeedCtorLink
    struct FLocalizedString Rank_level_must_be_above_1_and_under_10;  // 28F0 400000 CPF_NeedCtorLink
    struct FLocalizedString Maximum_amount_of_ranks_10_exceeded;  // 28FC 400000 CPF_NeedCtorLink
    struct FLocalizedString You_have_been_invited_to_join_the_guild_;  // 2908 400000 CPF_NeedCtorLink
    struct FLocalizedString Add_player;  // 2914 400000 CPF_NeedCtorLink
    struct FLocalizedString Enter_player_name;  // 2920 400000 CPF_NeedCtorLink
    struct FLocalizedString Friend_Request;  // 292C 400000 CPF_NeedCtorLink
    struct FLocalizedString Do_you_want_to_be_PLAYERNAME_s_friend_;  // 2938 400000 CPF_NeedCtorLink
    struct FLocalizedString Communicate_;  // 2944 400000 CPF_NeedCtorLink
    struct FLocalizedString Primary_Key;  // 2950 400000 CPF_NeedCtorLink
    struct FLocalizedString Secondary_Key;  // 295C 400000 CPF_NeedCtorLink
    struct FLocalizedString Turn_Left;  // 2968 400000 CPF_NeedCtorLink
    struct FLocalizedString Turn_Right;  // 2974 400000 CPF_NeedCtorLink
    struct FLocalizedString Auto_Run;  // 2980 400000 CPF_NeedCtorLink
    struct FLocalizedString Rest;  // 298C 400000 CPF_NeedCtorLink
    struct FLocalizedString Select_Next_Enemy;  // 2998 400000 CPF_NeedCtorLink
    struct FLocalizedString BodySlots;  // 29A4 400000 CPF_NeedCtorLink
    struct FLocalizedString Activate_BodySlot;  // 29B0 400000 CPF_NeedCtorLink
    struct FLocalizedString Misc;  // 29BC 400000 CPF_NeedCtorLink
    struct FLocalizedString Enter_Chat_Message;  // 29C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Slash_Enter_Chat_Message;  // 29D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Cancel_System_Menu;  // 29E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Console;  // 29EC 400000 CPF_NeedCtorLink
    struct FLocalizedString GUI_Combat_Setup;  // 29F8 400000 CPF_NeedCtorLink
    struct FLocalizedString Toggle_HUD;  // 2A04 400000 CPF_NeedCtorLink
    struct FLocalizedString Take_Screenshot;  // 2A10 400000 CPF_NeedCtorLink
    struct FLocalizedString Empty_Item_Container;  // 2A1C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sort_by_added;  // 2A28 400000 CPF_NeedCtorLink
    struct FLocalizedString Sort_by_expiration;  // 2A34 400000 CPF_NeedCtorLink
    struct FLocalizedString Create_Recipe;  // 2A40 400000 CPF_NeedCtorLink
    struct FLocalizedString Aborted;  // 2A4C 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_wish_to_break_down_this_item_;  // 2A58 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Waste_Items;  // 2A64 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Equipment;  // 2A70 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Jewelry;  // 2A7C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Weapons;  // 2A88 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Item_Sigils;  // 2A94 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Skill_Sigils;  // 2AA0 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Bodyslots;  // 2AAC 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Broken_Items;  // 2AB8 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Resources;  // 2AC4 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Recipes;  // 2AD0 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Consumables;  // 2ADC 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Miscellaneous_Items;  // 2AE8 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_All;  // 2AF4 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Open_library;  // 2B00 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Add_sigil_slot;  // 2B0C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Learn_new_skill;  // 2B18 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Buildup__S;  // 2B24 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Fame_Level__S;  // 2B30 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Personal_XP_level_S;  // 2B3C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Distribute_your_remaining_attribute_points_POINTS_left;  // 2B48 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Choose_Class;  // 2B54 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Local_Messages;  // 2B60 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Zone_Messages;  // 2B6C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Trade_Messages;  // 2B78 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Party_Messages;  // 2B84 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Guild_Messages;  // 2B90 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Private_Messages;  // 2B9C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_Combat_Messages;  // 2BA8 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString You_can_create_a_guild_here;  // 2BB4 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Creating_a_guild_will_activate_the_guild;  // 2BC0 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString menu_in_the_menubar_;  // 2BCC 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Enter_Guildname_;  // 2BD8 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Choose_a_guild_logo_;  // 2BE4 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Pick_guild_logo_colors_;  // 2BF0 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Ignore_List;  // 2BFC 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Guild_;  // 2C08 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Your_rank_;  // 2C14 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Management;  // 2C20 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Create_your_guild;  // 2C2C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Disband_your_guild;  // 2C38 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Disband;  // 2C44 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString MOTD_;  // 2C50 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Member_;  // 2C5C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Invite;  // 2C68 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Leave_your_guild;  // 2C74 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Leave;  // 2C80 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString ranks;  // 2C8C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Show_tutorial_tips;  // 2C98 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Disable_tutorials;  // 2CA4 400000 CPF_NeedCtorLink
    struct FLocalizedString S__Attack_type_;  // 2CB0 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString S__Skill_Attribute_;  // 2CBC 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString S__Combo_type_;  // 2CC8 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Confirm_Selection;  // 2CD4 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Please_confirm_you_want_to_learn_this_skill;  // 2CE0 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString S_sec__Cooldown_time;  // 2CEC 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString The_skills_of_Spellborn;  // 2CF8 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Not_Learned;  // 2D04 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Unavailable;  // 2D10 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Set_1;  // 2D1C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Set_2;  // 2D28 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Set_3;  // 2D34 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Set_4;  // 2D40 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Set_5;  // 2D4C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Set_6;  // 2D58 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString S__Magic_type_;  // 2D64 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Skill_library;  // 2D70 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Select_a_skill_you_want_to_learn;  // 2D7C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Select_a_skill_you_want_to_upgrade;  // 2D88 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Drag_items_here_;  // 2D94 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString From_;  // 2DA0 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Reply;  // 2DAC 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Title;  // 2DB8 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString You_have_completed_the_Quest_;  // 2DC4 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Quest_failed;  // 2DD0 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Enter_the_Resource_Dealer_to_buy_resources;  // 2DDC 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Craft_runes;  // 2DE8 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Buy_and_sell_runes;  // 2DF4 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Enter_the_Rune_section;  // 2E00 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Craft_spirit;  // 2E0C 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Buy_and_sell_Spirits;  // 2E18 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Enter_the_Spirit_section;  // 2E24 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString Enter_the_Tavern_for_strength_giving_sustenance;  // 2E30 2400000 CPF_NeedCtorLink CPF_EditorData
    struct FLocalizedString EULA_Part_1;  // 2E3C 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_2;  // 2E48 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_3;  // 2E54 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_4;  // 2E60 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_5;  // 2E6C 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_6;  // 2E78 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_7;  // 2E84 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_8;  // 2E90 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_9;  // 2E9C 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_10;  // 2EA8 400000 CPF_NeedCtorLink
    struct FLocalizedString EULA_Part_11;  // 2EB4 400000 CPF_NeedCtorLink
    struct FLocalizedString Stay;  // 2EC0 400000 CPF_NeedCtorLink
    struct FLocalizedString Follow;  // 2ECC 400000 CPF_NeedCtorLink
    struct FLocalizedString Aggresive;  // 2ED8 400000 CPF_NeedCtorLink
    struct FLocalizedString Defensive;  // 2EE4 400000 CPF_NeedCtorLink
    struct FLocalizedString Assist;  // 2EF0 400000 CPF_NeedCtorLink
    struct FLocalizedString Passive;  // 2EFC 400000 CPF_NeedCtorLink
    struct FLocalizedString Failed_to_select_the_universe_server;  // 2F08 400000 CPF_NeedCtorLink
    struct FLocalizedString Invalid_lobby_server;  // 2F14 400000 CPF_NeedCtorLink
    struct FLocalizedString Unable_to_locate_the_game_server;  // 2F20 400000 CPF_NeedCtorLink
    struct FLocalizedString Unable_to_locate_the_universe_server;  // 2F2C 400000 CPF_NeedCtorLink
    struct FLocalizedString Failed_to_connect_to_the_universe_server;  // 2F38 400000 CPF_NeedCtorLink
    struct FLocalizedString Failed_to_select_the_universe__invalid_player_or_universe;  // 2F44 400000 CPF_NeedCtorLink
    struct FLocalizedString Remember_username;  // 2F50 400000 CPF_NeedCtorLink
    struct FLocalizedString Clothing_Info;  // 2F5C 400000 CPF_NeedCtorLink
    struct FLocalizedString Weapon_Info;  // 2F68 400000 CPF_NeedCtorLink
    struct FLocalizedString Profanity_Filter;  // 2F74 400000 CPF_NeedCtorLink
    struct FLocalizedString Font;  // 2F80 400000 CPF_NeedCtorLink
    struct FLocalizedString Small;  // 2F8C 400000 CPF_NeedCtorLink
    struct FLocalizedString Medium;  // 2F98 400000 CPF_NeedCtorLink
    struct FLocalizedString Large;  // 2FA4 400000 CPF_NeedCtorLink
    struct FLocalizedString __requires_a_restart;  // 2FB0 400000 CPF_NeedCtorLink
    struct FLocalizedString Player_Voice_Volume;  // 2FBC 400000 CPF_NeedCtorLink
    struct FLocalizedString Player_Voice_Freq_;  // 2FC8 400000 CPF_NeedCtorLink
    struct FLocalizedString Other_Voice_Volume;  // 2FD4 400000 CPF_NeedCtorLink
    struct FLocalizedString Other_Voice_Freq_;  // 2FE0 400000 CPF_NeedCtorLink
    struct FLocalizedString NPC_Voice_Volume;  // 2FEC 400000 CPF_NeedCtorLink
    struct FLocalizedString NPC_Voice_Freq_;  // 2FF8 400000 CPF_NeedCtorLink
    struct FLocalizedString Player_Footsteps_Volume;  // 3004 400000 CPF_NeedCtorLink
    struct FLocalizedString Other_Footsteps_Volume;  // 3010 400000 CPF_NeedCtorLink
    struct FLocalizedString NPC_Footsteps_Volume;  // 301C 400000 CPF_NeedCtorLink
    struct FLocalizedString Player_FX_Volume;  // 3028 400000 CPF_NeedCtorLink
    struct FLocalizedString Other_FX_Volume;  // 3034 400000 CPF_NeedCtorLink
    struct FLocalizedString NPC_FX_Volume;  // 3040 400000 CPF_NeedCtorLink
    struct FLocalizedString Wildlife_FX_Volume_;  // 304C 400000 CPF_NeedCtorLink
    struct FLocalizedString Wildlife_Idle_FX_Freq_;  // 3058 400000 CPF_NeedCtorLink
    struct FLocalizedString Wildlife_Combat_FX_Freq_;  // 3064 400000 CPF_NeedCtorLink
    struct FLocalizedString Monster_FX_Volume;  // 3070 400000 CPF_NeedCtorLink
    struct FLocalizedString Monster_Idle_FX_Freq_;  // 307C 400000 CPF_NeedCtorLink
    struct FLocalizedString Monster_Combat_FX_Freq_;  // 3088 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_1;  // 3094 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_2;  // 30A0 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_3;  // 30AC 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_4;  // 30B8 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_5;  // 30C4 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_6;  // 30D0 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_7;  // 30DC 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_8;  // 30E8 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_9;  // 30F4 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_10;  // 3100 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_11;  // 310C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_12;  // 3118 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_13;  // 3124 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_14;  // 3130 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_15;  // 313C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_16;  // 3148 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_17;  // 3154 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_18;  // 3160 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_19;  // 316C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_20;  // 3178 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_21;  // 3184 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_22;  // 3190 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_23;  // 319C 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_24;  // 31A8 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_25;  // 31B4 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_26;  // 31C0 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_27;  // 31CC 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_28;  // 31D8 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_29;  // 31E4 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_30;  // 31F0 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_31;  // 31FC 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_32;  // 3208 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_33;  // 3214 400000 CPF_NeedCtorLink
    struct FLocalizedString Sound_Tooltip_34;  // 3220 400000 CPF_NeedCtorLink
    struct FLocalizedString Fame_Level__PAWN_FAME_LEVEL___PAWN_CLASS_NAME;  // 322C 400000 CPF_NeedCtorLink
    struct FLocalizedString Universe_Selected_failed__invalid_player_or_invalid_universe_;  // 3238 400000 CPF_NeedCtorLink
    struct FLocalizedString Cannot_promote_to_GuildMaster_XX_member_is_rank_XX;  // 3244 400000 CPF_NeedCtorLink
    struct FLocalizedString Cant_dye_item;  // 3250 400000 CPF_NeedCtorLink
    struct FLocalizedString This_item_cannot_be_dyed;  // 325C 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_assign_all_items;  // 3268 400000 CPF_NeedCtorLink
    struct FLocalizedString Are_you_sure_you_want_to_assign_this_item;  // 3274 400000 CPF_NeedCtorLink
    struct FLocalizedString You_have_been_disconnected_from_the_login_server;  // 3280 400000 CPF_NeedCtorLink
    struct FLocalizedString You_have_been_disconnected_from_the_game_server;  // 328C 400000 CPF_NeedCtorLink
    struct FLocalizedString This_account_has_been_banned;  // 3298 400000 CPF_NeedCtorLink
    struct FLocalizedString This_account_is_temporarily_suspended_Contact_support;  // 32A4 400000 CPF_NeedCtorLink
    struct FLocalizedString This_account_is_waiting_for_email_confirmation;  // 32B0 400000 CPF_NeedCtorLink
    struct FLocalizedString L_Button;  // 32BC 400000 CPF_NeedCtorLink
    struct FLocalizedString R_Button;  // 32C8 400000 CPF_NeedCtorLink
    struct FLocalizedString Anisotropic_Filtering;  // 32D4 400000 CPF_NeedCtorLink
    struct FLocalizedString Music_Interval;  // 32E0 400000 CPF_NeedCtorLink
    struct FLocalizedString Music_Interval_Tooltip;  // 32EC 400000 CPF_NeedCtorLink
    struct FLocalizedString One_day_old;  // 32F8 400000 CPF_NeedCtorLink
    struct FLocalizedString DAYS_days_old;  // 3304 400000 CPF_NeedCtorLink
    struct FLocalizedString age;  // 3310 400000 CPF_NeedCtorLink
    virtual ~USBGuiStrings(void);
    virtual unsigned int GetCPPSize(void);
    USBGuiStrings(class USBGuiStrings const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBGuiStrings & operator=(class USBGuiStrings const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    USBGuiStrings(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_Component
//------------------------------------------------------------------------------

#define UCONST_GUI_Component_GUI_MAX_FUNCTION_PTRS  4
#define UCONST_GUI_Component_GUI_CDS_REPEAT  1
#define UCONST_GUI_Component_GUI_CDS_NORMAL  0
enum EToolTipMode {
  ETT_Cached = 0,
  ETT_Dynamic = 1
};

//  GUI_Component.OnGetTooltipObject 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnGetTooltipObject_Parms {
  class UGUI_Component* aSender;  // 0 80 CPF_Parm
  class UObject* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnGetTooltipText 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnGetTooltipText_Parms {
  class UGUI_Component* aSender;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_Component.OnShow 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnShow_Parms {
};


//  GUI_Component.OnHitTest 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnHitTest_Parms {
  FLOAT MouseX;  // 0 80 CPF_Parm
  FLOAT MouseY;  // 4 80 CPF_Parm
};


//  GUI_Component.OnWatch 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnWatch_Parms {
};


//  GUI_Component.OnDeActivate 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnDeActivate_Parms {
};


//  GUI_Component.OnActivate 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnActivate_Parms {
};


//  GUI_Component.OnChange 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnChange_Parms {
  class UGUI_Component* aSender;  // 0 80 CPF_Parm
};


//  GUI_Component.OnTimer 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnTimer_Parms {
  class UGUI_Component* aSender;  // 0 80 CPF_Parm
};


//  GUI_Component.OnCapturedMouseMove 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnCapturedMouseMove_Parms {
  FLOAT deltaX;  // 0 80 CPF_Parm
  FLOAT deltaY;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnMouseRelease 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnMouseRelease_Parms {
  class UGUI_Component* aSender;  // 0 80 CPF_Parm
};


//  GUI_Component.OnMousePressed 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnMousePressed_Parms {
  class UGUI_Component* sender;  // 0 80 CPF_Parm
  BITFIELD bRepeat : 1;  // 4 80 CPF_Parm
};


//  GUI_Component.OnDblClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnDblClick_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnHover 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnHover_Parms {
  class UGUI_Component* aSender;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnRendered 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnRendered_Parms {
  class UCanvas* aCanvas;  // 0 80 CPF_Parm
};


//  GUI_Component.OnRender 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnRender_Parms {
  class UCanvas* aCanvas;  // 0 80 CPF_Parm
};


//  GUI_Component.OnEndDrag 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnEndDrag_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  class UGUI_Component* Target;  // 4 80 CPF_Parm
  FLOAT X;  // 8 80 CPF_Parm
  FLOAT Y;  // C 80 CPF_Parm
  class UGUI_Component* fromChild;  // 10 80 CPF_Parm
};


//  GUI_Component.OnDrop 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnDrop_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  FLOAT relMouseX;  // 4 80 CPF_Parm
  FLOAT relMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* fromChild;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnDrag 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnDrag_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  FLOAT relMouseX;  // 4 80 CPF_Parm
  FLOAT relMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* fromChild;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnHide 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnHide_Parms {
};


//  GUI_Component.OnFocusChanged 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnFocusChanged_Parms {
  BITFIELD newState : 1;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnDoubleClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnDoubleClick_Parms {
  class UGUI_Component* clickedComponent;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnRightClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnRightClick_Parms {
  class UGUI_Component* clickedComponent;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnClick_Parms {
  class UGUI_Component* clickedComponent;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnComponentClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnComponentClick_Parms {
  class UGUI_Component* clickedComponent;  // 0 80 CPF_Parm
  BITFIELD hasDoubleClicked : 1;  // 4 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnKeyType 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnKeyType_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
  BYTE Key;  // 4 180 CPF_Parm CPF_OutParm
  class FString Unicode;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnKeyEvent 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnKeyEvent_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
  BYTE Key;  // 4 180 CPF_Parm CPF_OutParm
  BYTE State;  // 5 180 CPF_Parm CPF_OutParm
  FLOAT delta;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnMBClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnMBClick_Parms {
  class UGUI_MessageBox* messageBox;  // 0 80 CPF_Parm
  INT boxTag;  // 4 80 CPF_Parm
  INT buttonTag;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnMouseMove 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnMouseMove_Parms {
  class UGUI_Component* fromChild;  // 0 80 CPF_Parm
  FLOAT MouseX;  // 4 80 CPF_Parm
  FLOAT MouseY;  // 8 80 CPF_Parm
  FLOAT deltaX;  // C 80 CPF_Parm
  FLOAT deltaY;  // 10 80 CPF_Parm
  INT buttons;  // 14 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnMouseUp 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnMouseUp_Parms {
  FLOAT MouseX;  // 0 80 CPF_Parm
  FLOAT MouseY;  // 4 80 CPF_Parm
  INT buttons;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnMouseDown 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnMouseDown_Parms {
  FLOAT MouseX;  // 0 80 CPF_Parm
  FLOAT MouseY;  // 4 80 CPF_Parm
  INT buttons;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnWhileMouseDown 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnWhileMouseDown_Parms {
  FLOAT MouseX;  // 0 80 CPF_Parm
  FLOAT MouseY;  // 4 80 CPF_Parm
  INT buttonStates;  // 8 80 CPF_Parm
  INT deltaButtonStates;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnDeHilite 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnDeHilite_Parms {
  class UGUI_Component* fromChild;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnHilite 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnHilite_Parms {
  class UGUI_Component* fromChild;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnTick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnTick_Parms {
  FLOAT DeltaTime;  // 0 80 CPF_Parm
};


//  GUI_Component.OnPostDraw 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnPostDraw_Parms {
  class UCanvas* aCanvas;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnPreDraw 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Component_execOnPreDraw_Parms {
  class UCanvas* aCanvas;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.UpdateHeight 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execUpdateHeight_Parms {
  class UGUI_Component* aTargetComponent;  // 0 80 CPF_Parm
  class UGUI_Component* aSourceComponent;  // 4 80 CPF_Parm
  FLOAT aOffset;  // 8 90 CPF_OptionalParm CPF_Parm
  FLOAT aMinimum;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.GetMouseDragCursor 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetMouseDragCursor_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetMouseDownCursor 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetMouseDownCursor_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetMouseOverCursor 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetMouseOverCursor_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetDesktop 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execGetDesktop_Parms {
  class UGUI_Desktop* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.SetProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetProperty_Parms {
  class FString aKey;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aValue;  // 8 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.GetPropertyAsRotator 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetPropertyAsRotator_Parms {
  class FString Key;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FRotator ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetPropertyAsVector 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetPropertyAsVector_Parms {
  class FString Key;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FVector ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetPropertyAsFloat 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetPropertyAsFloat_Parms {
  class FString aKey;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetPropertyAsInt 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetPropertyAsInt_Parms {
  class FString aKey;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetProperty_Parms {
  class FString aKey;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_Component.UpdateComponent 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventUpdateComponent_Parms {
  INT anIntParam;  // 0 80 CPF_Parm
  class FString aStringParam;  // 4 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.InvalidateFunctionPtrs 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execInvalidateFunctionPtrs_Parms {
};


//  GUI_Component.ResolveShortkeyNames 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventResolveShortkeyNames_Parms {
};


//  GUI_Component.GetTooltipObjectPageClassName 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventGetTooltipObjectPageClassName_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_Component.SetTooltipObjectPageClassName 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventSetTooltipObjectPageClassName_Parms {
  class FString aClassName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.ResetToolTipObject 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventResetToolTipObject_Parms {
  class FString aTooltipText;  // 0 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.SetTooltipObject 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventSetTooltipObject_Parms {
  class UObject* aObject;  // 0 80 CPF_Parm
  class FString aPageClassName;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.GetTooltipObject 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetTooltipObject_Parms {
  class UObject* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetTooltipText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetTooltipText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_Component.SetTooltipText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventSetTooltipText_Parms {
  class FString aText;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.SetComponentTitle 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventSetComponentTitle_Parms {
  class FString Title;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.ResetTooltipMode 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventResetTooltipMode_Parms {
};


//  GUI_Component.FadeOut 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct UGUI_Component_eventFadeOut_Parms {
  FLOAT FadeTime;  // 0 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.FadeIn 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct UGUI_Component_eventFadeIn_Parms {
  FLOAT FadeTime;  // 0 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.GetTimeSeconds 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetTimeSeconds_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetLevel 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetLevel_Parms {
  class ULevel* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetPawn 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetPawn_Parms {
  class AGame_Pawn* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetLoginController 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetLoginController_Parms {
  class ALogin_PlayerController* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetCharacterController 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetCharacterController_Parms {
  class ACharacter_PlayerController* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetGamePlayerController 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetGamePlayerController_Parms {
  class AGame_PlayerController* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetPlayerController 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetPlayerController_Parms {
  class APlayerController* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetAlphaFactor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execGetAlphaFactor_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.SetAlphaFactor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execSetAlphaFactor_Parms {
  FLOAT Alpha;  // 0 80 CPF_Parm
};


//  GUI_Component.SetIconColors 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execSetIconColors_Parms {
  FLOAT R;  // 0 80 CPF_Parm
  FLOAT G;  // 4 80 CPF_Parm
  FLOAT B;  // 8 80 CPF_Parm
  FLOAT A;  // C 80 CPF_Parm
};


//  GUI_Component.SetBackgroundColors 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execSetBackgroundColors_Parms {
  FLOAT R;  // 0 80 CPF_Parm
  FLOAT G;  // 4 80 CPF_Parm
  FLOAT B;  // 8 80 CPF_Parm
  FLOAT A;  // C 80 CPF_Parm
};


//  GUI_Component.DrawTile 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execDrawTile_Parms {
  class UCanvas* aCanvas;  // 0 80 CPF_Parm
  class UMaterial* aMaterial;  // 4 80 CPF_Parm
  FLOAT Left;  // 8 80 CPF_Parm
  FLOAT top;  // C 80 CPF_Parm
  FLOAT width;  // 10 90 CPF_OptionalParm CPF_Parm
  FLOAT Height;  // 14 90 CPF_OptionalParm CPF_Parm
  INT uleft;  // 18 90 CPF_OptionalParm CPF_Parm
  INT utop;  // 1C 90 CPF_OptionalParm CPF_Parm
  INT uwidth;  // 20 90 CPF_OptionalParm CPF_Parm
  INT uheight;  // 24 90 CPF_OptionalParm CPF_Parm
  FLOAT Z;  // 28 90 CPF_OptionalParm CPF_Parm
  class FColor Color;  // 2C 90 CPF_OptionalParm CPF_Parm
  class FPlane fog;  // 30 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.DrawImage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execDrawImage_Parms {
  class UCanvas* aCanvas;  // 0 80 CPF_Parm
  class UGUI_Image* aImage;  // 4 80 CPF_Parm
  FLOAT Left;  // 8 80 CPF_Parm
  FLOAT top;  // C 80 CPF_Parm
  FLOAT width;  // 10 90 CPF_OptionalParm CPF_Parm
  FLOAT Height;  // 14 90 CPF_OptionalParm CPF_Parm
  FLOAT uleft;  // 18 90 CPF_OptionalParm CPF_Parm
  FLOAT utop;  // 1C 90 CPF_OptionalParm CPF_Parm
  FLOAT uwidth;  // 20 90 CPF_OptionalParm CPF_Parm
  FLOAT uheight;  // 24 90 CPF_OptionalParm CPF_Parm
  FLOAT Z;  // 28 90 CPF_OptionalParm CPF_Parm
  class FColor Color;  // 2C 90 CPF_OptionalParm CPF_Parm
  class FPlane fog;  // 30 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.CreateRotator 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execCreateRotator_Parms {
  class UGUI_Image* image;  // 0 80 CPF_Parm
  class UTexRotator* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.CreateImage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execCreateImage_Parms {
  class FString imageBaseName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString TexturePackage;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 10 400080 CPF_Parm CPF_NeedCtorLink
  class FString anImageClassName;  // 18 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_Image* ReturnValue;  // 20 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.CreateFont 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execCreateFont_Parms {
  class FString FontName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UFont* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.AdjustBorder 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execAdjustBorder_Parms {
  INT Left;  // 0 80 CPF_Parm
  INT top;  // 4 80 CPF_Parm
  INT Right;  // 8 80 CPF_Parm
  INT Bottom;  // C 80 CPF_Parm
};


//  GUI_Component.GetIconMaterialBounds 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetIconMaterialBounds_Parms {
  FLOAT Left;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT top;  // 4 180 CPF_Parm CPF_OutParm
  FLOAT width;  // 8 180 CPF_Parm CPF_OutParm
  FLOAT Height;  // C 180 CPF_Parm CPF_OutParm
};


//  GUI_Component.GetIconMaterial 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execGetIconMaterial_Parms {
  class UMaterial* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.SetIconMaterial 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetIconMaterial_Parms {
  class UMaterial* Material;  // 0 80 CPF_Parm
  FLOAT Left;  // 4 80 CPF_Parm
  FLOAT top;  // 8 80 CPF_Parm
  FLOAT width;  // C 90 CPF_OptionalParm CPF_Parm
  FLOAT Height;  // 10 90 CPF_OptionalParm CPF_Parm
  INT uleft;  // 14 90 CPF_OptionalParm CPF_Parm
  INT utop;  // 18 90 CPF_OptionalParm CPF_Parm
  INT uwidth;  // 1C 90 CPF_OptionalParm CPF_Parm
  INT uheight;  // 20 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.SetStateIcon 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetStateIcon_Parms {
  INT stateIndex;  // 0 80 CPF_Parm
  class FString imageBaseName;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FString TexturePackage;  // C 400080 CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 14 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.SetStdIcon 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetStdIcon_Parms {
  INT iconType;  // 0 80 CPF_Parm
};


//  GUI_Component.SetStdBorder 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetStdBorder_Parms {
  INT borderType;  // 0 80 CPF_Parm
};


//  GUI_Component.SetStdBackground 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetStdBackground_Parms {
  INT backgroundType;  // 0 80 CPF_Parm
};


//  GUI_Component.ClearIcon 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execClearIcon_Parms {
};


//  GUI_Component.SetIcon 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetIcon_Parms {
  class FString imageBaseName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString texturePackages;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 10 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.SetBorder 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetBorder_Parms {
  INT offsetX;  // 0 80 CPF_Parm
  INT offsetY;  // 4 80 CPF_Parm
  INT offsetW;  // 8 80 CPF_Parm
  INT offsetH;  // C 80 CPF_Parm
  class FString imageBaseName;  // 10 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString texturePackages;  // 18 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_Component.ClearBackground 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execClearBackground_Parms {
};


//  GUI_Component.SetSolidBackground 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetSolidBackground_Parms {
  FLOAT R;  // 0 80 CPF_Parm
  FLOAT G;  // 4 80 CPF_Parm
  FLOAT B;  // 8 80 CPF_Parm
  FLOAT A;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.SetBackground 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetBackground_Parms {
  class FString imageBaseName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString TexturePackage;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 10 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  INT backgroundType;  // 18 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.OnFocus 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventOnFocus_Parms {
  BITFIELD State : 1;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.IsFocused 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execIsFocused_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.SetFocus 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execSetFocus_Parms {
};


//  GUI_Component.SetContextMenuEnabled 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execSetContextMenuEnabled_Parms {
  BITFIELD Enabled : 1;  // 0 80 CPF_Parm
};


//  GUI_Component.HasMouseCapture 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execHasMouseCapture_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.IsMouseOwner 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execIsMouseOwner_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.IsHiliteComponent 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execIsHiliteComponent_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.IsVisible 20003 0 ( FUNC_Final FUNC_Defined FUNC_Public )
struct UGUI_Component_execIsVisible_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.SetVisible 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetVisible_Parms {
  BITFIELD State : 1;  // 0 80 CPF_Parm
};


//  GUI_Component.IsEnabled 20003 0 ( FUNC_Final FUNC_Defined FUNC_Public )
struct UGUI_Component_execIsEnabled_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.SetEnabled 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetEnabled_Parms {
  BITFIELD State : 1;  // 0 80 CPF_Parm
};


//  GUI_Component.IsOver 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execIsOver_Parms {
  FLOAT X;  // 0 80 CPF_Parm
  FLOAT Y;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.IsMouseOver 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execIsMouseOver_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.SetClientHeight 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetClientHeight_Parms {
  FLOAT aHeight;  // 0 80 CPF_Parm
};


//  GUI_Component.SetClientWidth 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetClientWidth_Parms {
  FLOAT aWidth;  // 0 80 CPF_Parm
};


//  GUI_Component.SetClientDimensions 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetClientDimensions_Parms {
  FLOAT aWidth;  // 0 80 CPF_Parm
  FLOAT aHeight;  // 4 80 CPF_Parm
};


//  GUI_Component.GetClientHeight 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetClientHeight_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetClientWidth 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetClientWidth_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.SetCustomClipRect 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetCustomClipRect_Parms {
  FLOAT Left;  // 0 80 CPF_Parm
  FLOAT top;  // 4 80 CPF_Parm
  FLOAT Right;  // 8 80 CPF_Parm
  FLOAT Bottom;  // C 80 CPF_Parm
};


//  GUI_Component.SetMaxBounds 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetMaxBounds_Parms {
  FLOAT Left;  // 0 80 CPF_Parm
  FLOAT top;  // 4 80 CPF_Parm
  FLOAT width;  // 8 80 CPF_Parm
  FLOAT Height;  // C 80 CPF_Parm
};


//  GUI_Component.SetMinBounds 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetMinBounds_Parms {
  FLOAT Left;  // 0 80 CPF_Parm
  FLOAT top;  // 4 80 CPF_Parm
  FLOAT width;  // 8 80 CPF_Parm
  FLOAT Height;  // C 80 CPF_Parm
};


//  GUI_Component.SetAnchors 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetAnchors_Parms {
  FLOAT Left;  // 0 80 CPF_Parm
  FLOAT top;  // 4 80 CPF_Parm
  FLOAT Right;  // 8 80 CPF_Parm
  FLOAT Bottom;  // C 80 CPF_Parm
};


//  GUI_Component.GetClientRect 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetClientRect_Parms {
  FLOAT X;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT Y;  // 4 180 CPF_Parm CPF_OutParm
  FLOAT width;  // 8 180 CPF_Parm CPF_OutParm
  FLOAT Height;  // C 180 CPF_Parm CPF_OutParm
};


//  GUI_Component.GetWindowRect 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetWindowRect_Parms {
  FLOAT X;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT Y;  // 4 180 CPF_Parm CPF_OutParm
  FLOAT width;  // 8 180 CPF_Parm CPF_OutParm
  FLOAT Height;  // C 180 CPF_Parm CPF_OutParm
};


//  GUI_Component.SetPosition 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execSetPosition_Parms {
  FLOAT X;  // 0 80 CPF_Parm
  FLOAT Y;  // 4 80 CPF_Parm
  FLOAT width;  // 8 90 CPF_OptionalParm CPF_Parm
  FLOAT Height;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.GetDrawPriority 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execGetDrawPriority_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.SetDrawPriority 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execSetDrawPriority_Parms {
  INT aNewPrio;  // 0 80 CPF_Parm
};


//  GUI_Component.GetOwnerClass 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetOwnerClass_Parms {
  class UClass* aClass;  // 0 80 CPF_Parm
  class UGUI_Component* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetTopLevelOwner 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetTopLevelOwner_Parms {
  class UGUI_Component* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.GetOwnerPage 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Component_execGetOwnerPage_Parms {
  class UGUI_Component* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.PositionChanged 20800 0 ( FUNC_Event FUNC_Public )
struct UGUI_Component_eventPositionChanged_Parms {
  FLOAT X;  // 0 80 CPF_Parm
  FLOAT Y;  // 4 80 CPF_Parm
};


//  GUI_Component.SetDelegates 20800 0 ( FUNC_Event FUNC_Public )
struct UGUI_Component_eventSetDelegates_Parms {
};


//  GUI_Component.PreLogin 20800 0 ( FUNC_Event FUNC_Public )
struct UGUI_Component_eventPreLogin_Parms {
};


//  GUI_Component.OnLogin 20800 0 ( FUNC_Event FUNC_Public )
struct UGUI_Component_eventOnLogin_Parms {
};


//  GUI_Component.OnComponentHidden 20800 0 ( FUNC_Event FUNC_Public )
struct UGUI_Component_eventOnComponentHidden_Parms {
};


//  GUI_Component.OnComponentShown 20800 0 ( FUNC_Event FUNC_Public )
struct UGUI_Component_eventOnComponentShown_Parms {
};


//  GUI_Component.ResolutionChanged 20800 0 ( FUNC_Event FUNC_Public )
struct UGUI_Component_eventResolutionChanged_Parms {
  INT ResX;  // 0 80 CPF_Parm
  INT ResY;  // 4 80 CPF_Parm
};


//  GUI_Component.Invalidate 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execInvalidate_Parms {
};


//  GUI_Component.OnMouseWheel 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventOnMouseWheel_Parms {
  BITFIELD isUp : 1;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Component.OnTimeout 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventOnTimeout_Parms {
  class UObject* Source;  // 0 80 CPF_Parm
  INT Id;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Component.OnComponentDestroyed 20800 0 ( FUNC_Event FUNC_Public )
struct UGUI_Component_eventOnComponentDestroyed_Parms {
};


//  GUI_Component.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Component_eventInitialize_Parms {
};


//  GUI_Component.GetComponentState 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Component_execGetComponentState_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UGUI_Component 1F ( CLASS_Abstract CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Component : public UObject {
  public:
    class UGUI_Desktop* mDesktop;  // 28 0
    class UGUI_Page* mOwnerPage;  // 2C 0
    INT mComponentHandle;  // 30 0
    class FString mComponentTitle;  // 34 400000 CPF_NeedCtorLink
    INT mComponentStyle;  // 3C 2000000 CPF_EditorData
    BITFIELD mVisible : 1;  // 40 2000000 CPF_EditorData
    BITFIELD mWantedVisible : 1;  // 40 2000000 CPF_EditorData
    BITFIELD mEnabled : 1;  // 40 2000000 CPF_EditorData
    BITFIELD mWantedEnabled : 1;  // 40 2000000 CPF_EditorData
    FLOAT mAlphaFactor;  // 44 0
    BITFIELD mWantTick : 1;  // 48 0
    BITFIELD mPostDrawEnabled : 1;  // 48 0
    BITFIELD mCanBecomeMouseDownComponent : 1;  // 48 2000000 CPF_EditorData
    BITFIELD mDoubleClickEnabled : 1;  // 48 0
    FLOAT mLastClickMouseX;  // 4C 0
    FLOAT mLastClickMouseY;  // 50 0
    INT mLastButtonStates;  // 54 0
    INT mLastDeltaButton;  // 58 0
    class UGUI_Component* mLastFromChild;  // 5C 0
    FLOAT mMaxDoubleClickTime;  // 60 44000 CPF_Config CPF_GlobalConfig
    INT mBackgroundType;  // 64 0
    INT mBorderType;  // 68 0
    INT mIconType;  // 6C 0
    class UMaterial* mIconMaterial;  // 70 0
    FLOAT mIconBounds[4];  // 74 0
    FLOAT mIconTexCoords[4];  // 84 0
    FLOAT mBackgroundColors[4];  // 94 0
    FLOAT mIconColors[4];  // A4 0
    INT mDrawPriority;  // B4 0
    FLOAT mLeft;  // B8 2000000 CPF_EditorData
    FLOAT mTop;  // BC 2000000 CPF_EditorData
    FLOAT mWidth;  // C0 2000000 CPF_EditorData
    FLOAT mHeight;  // C4 2000000 CPF_EditorData
    FLOAT mMinWidth;  // C8 2000000 CPF_EditorData
    FLOAT mMinHeight;  // CC 2000000 CPF_EditorData
    FLOAT mTexWidth;  // D0 2000000 CPF_EditorData
    FLOAT mTexHeight;  // D4 2000000 CPF_EditorData
    FLOAT mAnchors[4];  // D8 0
    FLOAT mMinBounds[4];  // E8 0
    FLOAT mMaxBounds[4];  // F8 0
    BITFIELD mMinBoundsSet : 1;  // 108 0
    BITFIELD mMaxBoundsSet : 1;  // 108 0
    BITFIELD mValidated : 1;  // 108 0
    INT mTabIndex;  // 10C 0
    INT mIntTag;  // 110 0
    class FString mStringTag;  // 114 400000 CPF_NeedCtorLink
    class UObject* mObjectTag;  // 11C 0
    class FString mShortKeyCommand;  // 120 400000 CPF_NeedCtorLink
    class FString mShortKeyName;  // 128 400000 CPF_NeedCtorLink
    BITFIELD mFadeIn : 1;  // 130 0
    BITFIELD mFadeOut : 1;  // 130 0
    BITFIELD mHideOnFadePolicy : 1;  // 130 0
    BITFIELD mUseParentAlpha : 1;  // 130 0
    FLOAT mFadeTimeStart;  // 134 0
    FLOAT mFadeTime;  // 138 0
    FLOAT mAlphaStart;  // 13C 0
    BYTE mTooltipMode;  // 140 0
    class FString mTooltipText;  // 144 400000 CPF_NeedCtorLink
    class UObject* mTooltipObject;  // 14C 0
    class FString mTooltipObjectPageClassName;  // 150 400000 CPF_NeedCtorLink
    BITFIELD mPositionTooltip : 1;  // 158 0
    INT mTooltipOffsetX;  // 15C 0
    INT mTooltipOffsetY;  // 160 0
    INT mMouseOverCursor;  // 164 0
    INT mMouseDownCursor;  // 168 0
    INT mFunctionPtrs[4];  // 16C 0
    FLOAT mFunctionPtrTimeouts[4];  // 17C 0
    FLOAT mFunctionPtrTimeReset[4];  // 18C 0
    struct FScriptDelegate __OnPreDraw__Delegate;  // 19C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnPostDraw__Delegate;  // 1A4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnTick__Delegate;  // 1AC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnHilite__Delegate;  // 1B4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnDeHilite__Delegate;  // 1BC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnWhileMouseDown__Delegate;  // 1C4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnMouseDown__Delegate;  // 1CC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnMouseUp__Delegate;  // 1D4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnMouseMove__Delegate;  // 1DC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnMBClick__Delegate;  // 1E4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnKeyEvent__Delegate;  // 1EC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnKeyType__Delegate;  // 1F4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnComponentClick__Delegate;  // 1FC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnClick__Delegate;  // 204 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnRightClick__Delegate;  // 20C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnDoubleClick__Delegate;  // 214 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnFocusChanged__Delegate;  // 21C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnHide__Delegate;  // 224 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnDrag__Delegate;  // 22C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnDrop__Delegate;  // 234 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnEndDrag__Delegate;  // 23C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnRender__Delegate;  // 244 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnRendered__Delegate;  // 24C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnHover__Delegate;  // 254 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnDblClick__Delegate;  // 25C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnMousePressed__Delegate;  // 264 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnMouseRelease__Delegate;  // 26C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnCapturedMouseMove__Delegate;  // 274 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnTimer__Delegate;  // 27C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnChange__Delegate;  // 284 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnActivate__Delegate;  // 28C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnDeActivate__Delegate;  // 294 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnWatch__Delegate;  // 29C 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnHitTest__Delegate;  // 2A4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnShow__Delegate;  // 2AC 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnGetTooltipText__Delegate;  // 2B4 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnGetTooltipObject__Delegate;  // 2BC 400000 CPF_NeedCtorLink
    INT mComponentData;  // 2C4 800000 CPF_Unk_00800000
    virtual ~UGUI_Component(void);
    virtual void Destroy(void);
  protected:
    virtual void Serialize(class FArchive &);
  public:
    virtual void CleanWeakPointers(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(void);
    virtual void EvaluateFunctionPointers(void);
    virtual void Shutdown(void);
    virtual void NotifyResolutionChange(int,int,int,int);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void SetVisible(bool);
    virtual void SetEnabled(bool);
    virtual bool ContainsHiliteComponent(void)const ;
    virtual bool IsFocused(void)const ;
    virtual int GetComponentState(void)const ;
  protected:
    virtual void VisibleChanged(bool);
    virtual void EnabledChanged(bool);
    virtual void DrawBackground(class UCanvas *,struct UGUI_Desktop::draw_context &,struct UGUI_BaseDesktop::base_rect<float> *);
    virtual void DrawBorder(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void DrawIcon(class UCanvas *,struct UGUI_Desktop::draw_context &);
  private:
    virtual void ConstructComponent(void);
  public:
    virtual void PreMove(float,float,float *,float *);
    virtual void Move(float,float);
    virtual void PreResize(float,float,float *,float *);
    virtual void Resize(float,float);
    virtual float GetClientHeight(void);
    virtual float GetClientWidth(void);
    virtual void SetClientDimensions(float,float);
    virtual void SetClientWidth(float);
    virtual void SetClientHeight(float);
    virtual void SetPosition(float,float,float,float);
    virtual void SetBackground(class FString,class FString,class FString,int);
    virtual void SetSolidBackground(float,float,float,float);
    virtual void SetIcon(class FString,class FString,class FString);
    virtual void SetIconMaterial(class UMaterial *,float,float,float,float,int,int,int,int);
    virtual void SetBackgroundColors(float,float,float,float);
    virtual void FadeIn(float);
    virtual void FadeOut(float);
    virtual void MouseMove(float,float,float,float,int,class UGUI_Component *);
    virtual bool MouseWheel(bool);
    virtual bool WhileMouseDown(float,float,int,int,class UGUI_Component *);
    virtual bool MouseDown(float,float,int,int,class UGUI_Component *);
    virtual bool MouseUp(float,float,int,int,class UGUI_Component *);
    virtual bool Hilite(class UGUI_Component *);
    virtual bool DeHilite(class UGUI_Component *);
    virtual void ComponentClick(class UGUI_Component *,bool);
    virtual void ComponentRightClick(class UGUI_Component *);
    virtual int GetMouseOverCursor(void);
    virtual int GetMouseDownCursor(void);
    virtual int GetMouseDragCursor(void);
    virtual bool Drag(class UGUI_DnDInfo *,float,float,class UGUI_Component *);
    virtual bool Drop(class UGUI_DnDInfo *,float,float,class UGUI_Component *);
    virtual void EndDrag(class UGUI_DnDInfo *,class UGUI_Component *,float,float,class UGUI_Component *);
    virtual bool KeyType(unsigned char &,unsigned short);
    virtual bool KeyEvent(unsigned char &,unsigned char &,float);
    virtual void SetFunctionPtr(int,int,float);
    virtual bool FunctionPtrRequiresEvaluation(int);
    virtual void FunctionPtrUpdateTimeout(int);
    virtual void InvalidateFunctionPtrs(void);
    virtual void SetProperty(class FString const &,class FString const &);
    virtual class FString GetProperty(class FString const &,class UObject *);
    UGUI_Component(class UGUI_Component const &);
    UGUI_Component(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Component & operator=(class UGUI_Component const &);
    bool CanBecomeMouseDownComponent(void)const ;
    void ClearBackground(void);
    void ClearIcon(void);
    class UFont * CreateFontW(class FString const &);
    class UGUI_Image * CreateImage(class FString const &,class FString const &,class FString const &,class FString const &);
    class UTexRotator * CreateRotator(class UGUI_Image *);
    void DrawImage(class UCanvas *,struct UGUI_Desktop::draw_context &,class UGUI_Image *,float,float,float,float,int,int,int,int,float,class FColor,class FPlane,struct UGUI_BaseDesktop::base_rect<float> *);
    void DrawTile(class UCanvas *,struct UGUI_Desktop::draw_context &,class UMaterial *,float,float,float,float,int,int,int,int,float,class FColor,class FPlane,struct UGUI_BaseDesktop::base_rect<float> *);
    float GetAlphaFactor(void);
    struct UGUI_BaseDesktop::base_rect<float> const & GetClientRect(void)const ;
    class AGame_PlayerController * GetGamePlayerController(void)const ;
    class ULevel * GetLevel(void)const ;
    class UGUI_Component * GetOwnerClass(class UClass *);
    class APawn * GetPawn(void)const ;
    class APlayerController * GetPlayerController(void)const ;
    double GetTimeSeconds(void)const ;
    class UObject * GetTooltipObject(void);
    class FString GetTooltipText(void);
    class UGUI_Component * GetTopLevelOwner(void);
    struct UGUI_BaseDesktop::base_rect<float> const & GetWindowRect(void)const ;
    bool HasMouseCapture(void)const ;
    bool HasOwner(class UGUI_Component *);
    bool HasOwnerClass(class UClass *);
    static void CDECL InternalConstructor(void *);
    bool IsEnabled(void)const ;
    bool IsHiliteComponent(void)const ;
    bool IsMouseOver(void)const ;
    bool IsMouseOwner(void)const ;
    bool IsVisible(void)const ;
    bool IsWithinClipRect(struct UGUI_BaseDesktop::base_rect<float> const &);
    bool IsWithinClipRect(class UGUI_Component *);
    bool LoadGUIImage(unsigned short const *,unsigned short const *,unsigned short const *,struct UGUI_Component::image_desc *,float *,float *);
    bool MouseHover(void);
    bool MouseMove(int,int);
    bool MousePressed(bool);
    bool MouseReleased(void);
    void SetAlphaFactor(float);
    void SetAnchors(float,float,float,float);
    void SetBorder(int,int,int,int,class FString,class FString,class FString);
    void SetCanBecomeMouseDownComponent(bool);
    void SetIconColors(float,float,float,float);
    void SetMaxBounds(float,float,float,float);
    void SetMinBounds(float,float,float,float);
    void SetStateIcon(int,class FString,class FString,class FString);
    void SetStdBackground(int);
    void SetStdBorder(int);
    void SetStdIcon(int);
    static class UClass * CDECL StaticClass(void);
    void UpdateHeight(class UGUI_Component *,class UGUI_Component *,float,float);
    void delegateOnActivate(void);
    unsigned long delegateOnCapturedMouseMove(float,float);
    void delegateOnChange(class UGUI_Component *);
    unsigned long delegateOnClick(class UGUI_Component *);
    unsigned long delegateOnComponentClick(class UGUI_Component *,unsigned long);
    unsigned long delegateOnDblClick(void);
    void delegateOnDeActivate(void);
    unsigned long delegateOnDeHilite(class UGUI_Component *);
    unsigned long delegateOnDoubleClick(class UGUI_Component *);
    unsigned long delegateOnDrag(class UGUI_DnDInfo *,float,float,class UGUI_Component *);
    unsigned long delegateOnDrop(class UGUI_DnDInfo *,float,float,class UGUI_Component *);
    void delegateOnEndDrag(class UGUI_DnDInfo *,class UGUI_Component *,float,float,class UGUI_Component *);
    unsigned long delegateOnFocusChanged(unsigned long);
    class UObject * delegateOnGetTooltipObject(class UGUI_Component *);
    class FString delegateOnGetTooltipText(class UGUI_Component *);
    void delegateOnHide(void);
    unsigned long delegateOnHilite(class UGUI_Component *);
    void delegateOnHitTest(float,float);
    unsigned long delegateOnHover(class UGUI_Component *);
    unsigned long delegateOnKeyEvent(class UGUI_Component *,unsigned char &,unsigned char &,float);
    unsigned long delegateOnKeyType(class UGUI_Component *,unsigned char &,class FString const &);
    unsigned long delegateOnMBClick(class UGUI_MessageBox *,int,int);
    unsigned long delegateOnMouseDown(float,float,int);
    unsigned long delegateOnMouseMove(class UGUI_Component *,float,float,float,float,int);
    void delegateOnMousePressed(class UGUI_Component *,unsigned long);
    void delegateOnMouseRelease(class UGUI_Component *);
    unsigned long delegateOnMouseUp(float,float,int);
    unsigned long delegateOnPostDraw(class UCanvas *);
    unsigned long delegateOnPreDraw(class UCanvas *);
    void delegateOnRender(class UCanvas *);
    void delegateOnRendered(class UCanvas *);
    unsigned long delegateOnRightClick(class UGUI_Component *);
    void delegateOnShow(void);
    void delegateOnTick(float);
    void delegateOnTimer(class UGUI_Component *);
    void delegateOnWatch(void);
    unsigned long delegateOnWhileMouseDown(float,float,int,int);
    void eventFadeIn(float);
    void eventFadeOut(float);
    class FString eventGetTooltipObjectPageClassName(void);
    void eventInitialize(void);
    void eventOnComponentDestroyed(void);
    void eventOnComponentHidden(void);
    void eventOnComponentShown(void);
    unsigned long eventOnFocus(unsigned long);
    void eventOnLogin(void);
    unsigned long eventOnMouseWheel(unsigned long);
    void eventOnTimeout(class UObject *,int);
    void eventPositionChanged(float,float);
    void eventPreLogin(void);
    void eventResetToolTipObject(class FString const &);
    void eventResetTooltipMode(void);
    void eventResolutionChanged(int,int);
    void eventResolveShortkeyNames(void);
    void eventSetComponentTitle(class FString const &);
    void eventSetDelegates(void);
    void eventSetTooltipObject(class UObject *,class FString const &);
    void eventSetTooltipObjectPageClassName(class FString const &);
    void eventSetTooltipText(class FString const &);
    void eventUpdateComponent(int,class FString const &);
    void execAdjustBorder(struct FFrame &,void * const);
    void execClearBackground(struct FFrame &,void * const);
    void execClearIcon(struct FFrame &,void * const);
    void execCreateFont(struct FFrame &,void * const);
    void execCreateImage(struct FFrame &,void * const);
    void execCreateRotator(struct FFrame &,void * const);
    void execDrawImage(struct FFrame &,void * const);
    void execDrawTile(struct FFrame &,void * const);
    void execFadeIn(struct FFrame &,void * const);
    void execFadeOut(struct FFrame &,void * const);
    void execGetCharacterController(struct FFrame &,void * const);
    void execGetClientHeight(struct FFrame &,void * const);
    void execGetClientRect(struct FFrame &,void * const);
    void execGetClientWidth(struct FFrame &,void * const);
    void execGetComponentState(struct FFrame &,void * const);
    void execGetGamePlayerController(struct FFrame &,void * const);
    void execGetIconMaterialBounds(struct FFrame &,void * const);
    void execGetLevel(struct FFrame &,void * const);
    void execGetLoginController(struct FFrame &,void * const);
    void execGetMouseDownCursor(struct FFrame &,void * const);
    void execGetMouseDragCursor(struct FFrame &,void * const);
    void execGetMouseOverCursor(struct FFrame &,void * const);
    void execGetOwnerClass(struct FFrame &,void * const);
    void execGetPawn(struct FFrame &,void * const);
    void execGetPlayerController(struct FFrame &,void * const);
    void execGetProperty(struct FFrame &,void * const);
    void execGetPropertyAsFloat(struct FFrame &,void * const);
    void execGetPropertyAsInt(struct FFrame &,void * const);
    void execGetPropertyAsRotator(struct FFrame &,void * const);
    void execGetPropertyAsVector(struct FFrame &,void * const);
    void execGetTimeSeconds(struct FFrame &,void * const);
    void execGetTooltipObject(struct FFrame &,void * const);
    void execGetTooltipText(struct FFrame &,void * const);
    void execGetTopLevelOwner(struct FFrame &,void * const);
    void execGetWindowRect(struct FFrame &,void * const);
    void execInvalidate(struct FFrame &,void * const);
    void execInvalidateFunctionPtrs(struct FFrame &,void * const);
    void execIsMouseOver(struct FFrame &,void * const);
    void execSetAnchors(struct FFrame &,void * const);
    void execSetBackground(struct FFrame &,void * const);
    void execSetBorder(struct FFrame &,void * const);
    void execSetClientDimensions(struct FFrame &,void * const);
    void execSetClientHeight(struct FFrame &,void * const);
    void execSetClientWidth(struct FFrame &,void * const);
    void execSetCustomClipRect(struct FFrame &,void * const);
    void execSetEnabled(struct FFrame &,void * const);
    void execSetIcon(struct FFrame &,void * const);
    void execSetIconMaterial(struct FFrame &,void * const);
    void execSetMaxBounds(struct FFrame &,void * const);
    void execSetMinBounds(struct FFrame &,void * const);
    void execSetPosition(struct FFrame &,void * const);
    void execSetProperty(struct FFrame &,void * const);
    void execSetSolidBackground(struct FFrame &,void * const);
    void execSetStateIcon(struct FFrame &,void * const);
    void execSetStdBackground(struct FFrame &,void * const);
    void execSetStdBorder(struct FFrame &,void * const);
    void execSetStdIcon(struct FFrame &,void * const);
    void execSetVisible(struct FFrame &,void * const);
    void execUpdateHeight(struct FFrame &,void * const);
  private:
    bool ClipToClient(struct UGUI_BaseDesktop::base_rect<float> *,struct UGUI_BaseDesktop::base_rect<int> *);
    bool ClipToParent(struct UGUI_BaseDesktop::base_rect<float> *,struct UGUI_BaseDesktop::base_rect<int> *);
    bool ClipToRect(struct UGUI_BaseDesktop::base_rect<float> const &,struct UGUI_BaseDesktop::base_rect<float> *,struct UGUI_BaseDesktop::base_rect<int> *);
    bool GetConstInt(class FString const &,class FString const &,int *);
    void LoadStateImages(unsigned short const *,unsigned short const *,unsigned short const *,struct UGUI_Component::state_images *,float *,float *);
    void OwnerEnabledChanged(bool);
    void OwnerVisibleChanged(bool);
    static class UClass PrivateStaticClass;
    void UpdateEnabled(bool);
    void UpdateFade(struct UGUI_Desktop::draw_context &);
    void UpdateVisible(bool);
};
AUTOGENERATE_FUNCTION(UGUI_Component,0,execAdjustBorder)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execClearBackground)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execClearIcon)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execCreateFont)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execCreateImage)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execCreateRotator)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execDrawImage)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execDrawTile)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execFadeIn)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execFadeOut)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetCharacterController)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetClientHeight)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetClientRect)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetClientWidth)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetComponentState)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetGamePlayerController)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetIconMaterialBounds)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetLevel)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetLoginController)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetMouseDownCursor)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetMouseDragCursor)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetMouseOverCursor)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetOwnerClass)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetPawn)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetPlayerController)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetProperty)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetPropertyAsFloat)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetPropertyAsInt)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetPropertyAsRotator)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetPropertyAsVector)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetTimeSeconds)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetTooltipObject)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetTooltipText)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetTopLevelOwner)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execGetWindowRect)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execInvalidate)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execInvalidateFunctionPtrs)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execIsMouseOver)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetAnchors)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetBackground)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetBorder)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetClientDimensions)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetClientHeight)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetClientWidth)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetCustomClipRect)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetEnabled)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetIcon)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetIconMaterial)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetMaxBounds)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetMinBounds)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetPosition)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetProperty)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetSolidBackground)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetStateIcon)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetStdBackground)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetStdBorder)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetStdIcon)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execSetVisible)
AUTOGENERATE_FUNCTION(UGUI_Component,0,execUpdateHeight)


//------------------------------------------------------------------------------
//  GUI_Page
//------------------------------------------------------------------------------

//  GUI_Page.OnMouseWheel 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Page_eventOnMouseWheel_Parms {
  BITFIELD isUp : 1;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.HandleMouseWheel 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execHandleMouseWheel_Parms {
  BITFIELD isUp : 1;  // 0 80 CPF_Parm
};


//  GUI_Page.AttachComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execAttachComponent_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
};


//  GUI_Page.DetachComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execDetachComponent_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
};


//  GUI_Page.TransferComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execTransferComponent_Parms {
  class UGUI_Component* aComponent;  // 0 80 CPF_Parm
  class UGUI_Page* aTarget;  // 4 80 CPF_Parm
};


//  GUI_Page.Clear 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execClear_Parms {
};


//  GUI_Page.GetVScrollOffset 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execGetVScrollOffset_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.HiliteHandler 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Page_eventHiliteHandler_Parms {
  class UGUI_Component* fromChild;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.PreviousTabComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execPreviousTabComponent_Parms {
  class UGUI_Component* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.NextTabComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execNextTabComponent_Parms {
  class UGUI_Component* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.AddTabComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execAddTabComponent_Parms {
  class UGUI_Component* aComponent;  // 0 80 CPF_Parm
};


//  GUI_Page.UpdateTabFocus 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execUpdateTabFocus_Parms {
};


//  GUI_Page.GetComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execGetComponent_Parms {
  INT Index;  // 0 80 CPF_Parm
  class UGUI_Component* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.GetComponentCount 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execGetComponentCount_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.OnScrollOffsetChanged 120800 0 ( FUNC_Event FUNC_Public FUNC_Delegate )
struct UGUI_Page_eventOnScrollOffsetChanged_Parms {
  class UGUI_ScrollBar* Source;  // 0 80 CPF_Parm
};


//  GUI_Page.BringToBottom 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execBringToBottom_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
};


//  GUI_Page.BringToTop 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execBringToTop_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
};


//  GUI_Page.FindComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execFindComponent_Parms {
  class FString componentTitle;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.DestroyComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execDestroyComponent_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
};


//  GUI_Page.CreateListView 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreateListView_Parms {
  class FString listviewClassName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT pageStyle;  // C 80 CPF_Parm
  INT Left;  // 10 80 CPF_Parm
  INT top;  // 14 80 CPF_Parm
  INT width;  // 18 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 1C 90 CPF_OptionalParm CPF_Parm
  class UGUI_ListView* ReturnValue;  // 20 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.CreateMesh 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreateMesh_Parms {
  class FString pageClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  class FString meshName;  // C 400080 CPF_Parm CPF_NeedCtorLink
  INT Left;  // 14 80 CPF_Parm
  INT top;  // 18 80 CPF_Parm
  INT width;  // 1C 80 CPF_Parm
  INT Height;  // 20 80 CPF_Parm
  INT Yaw;  // 24 90 CPF_OptionalParm CPF_Parm
  INT Pitch;  // 28 90 CPF_OptionalParm CPF_Parm
  INT Roll;  // 2C 90 CPF_OptionalParm CPF_Parm
  FLOAT Distance;  // 30 90 CPF_OptionalParm CPF_Parm
  FLOAT FOV;  // 34 90 CPF_OptionalParm CPF_Parm
  BITFIELD ClearZ : 1;  // 38 90 CPF_OptionalParm CPF_Parm
  class UGUI_Mesh* ReturnValue;  // 3C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.CreateTabCtrl 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreateTabCtrl_Parms {
  class FString ctrlClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT pageStyle;  // C 80 CPF_Parm
  INT tabCtrlStyle;  // 10 80 CPF_Parm
  INT Left;  // 14 80 CPF_Parm
  INT top;  // 18 80 CPF_Parm
  INT width;  // 1C 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 20 90 CPF_OptionalParm CPF_Parm
  class FString componentTitle;  // 24 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_TabCtrl* ReturnValue;  // 2C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.CreatePage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreatePage_Parms {
  class FString pageClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT pageStyle;  // C 80 CPF_Parm
  INT Left;  // 10 80 CPF_Parm
  INT top;  // 14 80 CPF_Parm
  INT width;  // 18 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 1C 90 CPF_OptionalParm CPF_Parm
  class FString componentTitle;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString tooltipText;  // 28 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_Page* ReturnValue;  // 30 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.CreateComboBox 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreateComboBox_Parms {
  class FString comboBoxClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT comboBoxStyle;  // C 80 CPF_Parm
  INT Left;  // 10 80 CPF_Parm
  INT top;  // 14 80 CPF_Parm
  INT width;  // 18 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 1C 90 CPF_OptionalParm CPF_Parm
  class FString componentTitle;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_ComboBox* ReturnValue;  // 28 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.CreateEditBox 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreateEditBox_Parms {
  class FString editBoxClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT editBoxStyle;  // C 80 CPF_Parm
  INT Left;  // 10 80 CPF_Parm
  INT top;  // 14 80 CPF_Parm
  INT width;  // 18 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 1C 90 CPF_OptionalParm CPF_Parm
  class FString componentTitle;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_EditBox* ReturnValue;  // 28 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.CreateTextButton 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreateTextButton_Parms {
  class FString buttonClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT buttonStyle;  // C 80 CPF_Parm
  INT Left;  // 10 80 CPF_Parm
  INT top;  // 14 80 CPF_Parm
  INT width;  // 18 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 1C 90 CPF_OptionalParm CPF_Parm
  class FString componentTitle;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_TextButton* ReturnValue;  // 28 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.CreateButton 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreateButton_Parms {
  class FString buttonClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT buttonStyle;  // C 80 CPF_Parm
  INT Left;  // 10 80 CPF_Parm
  INT top;  // 14 80 CPF_Parm
  INT width;  // 18 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 1C 90 CPF_OptionalParm CPF_Parm
  class FString componentTitle;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_Button* ReturnValue;  // 28 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.CreateLabel 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreateLabel_Parms {
  class FString labelClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT labelStyle;  // C 80 CPF_Parm
  INT Left;  // 10 80 CPF_Parm
  INT top;  // 14 80 CPF_Parm
  INT width;  // 18 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 1C 90 CPF_OptionalParm CPF_Parm
  class FString labelText;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_Label* ReturnValue;  // 28 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.CreateComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execCreateComponent_Parms {
  class FString ComponentClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT Left;  // C 80 CPF_Parm
  INT top;  // 10 80 CPF_Parm
  INT width;  // 14 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 18 90 CPF_OptionalParm CPF_Parm
  class FString componentTitle;  // 1C 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_Component* ReturnValue;  // 24 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.GetClientHeight 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execGetClientHeight_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.GetClientWidth 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Page_execGetClientWidth_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Page.PreLogin 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct UGUI_Page_eventPreLogin_Parms {
};


//  GUI_Page.OnLogin 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct UGUI_Page_eventOnLogin_Parms {
};


//  GUI_Page.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Page_execInitialize_Parms {
};


// UGUI_Page 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Page : public UGUI_Component {
  public:
    INT mPageStyle;  // 2C8 0
    INT mCurrentTabIndex;  // 2CC 0
    class UGUI_ScrollBar* mVScrollBar;  // 2D0 0
    class UGUI_ScrollBar* mHScrollBar;  // 2D4 0
    struct FScriptDelegate __OnScrollOffsetChanged__Delegate;  // 2D8 400000 CPF_NeedCtorLink
    INT mPageData;  // 2E0 800000 CPF_Unk_00800000
    virtual ~UGUI_Page(void);
    virtual void Destroy(void);
  protected:
    virtual void Serialize(class FArchive &);
  public:
    virtual void CleanWeakPointers(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(void);
    virtual void Shutdown(void);
    virtual void NotifyResolutionChange(int,int,int,int);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual bool ContainsHiliteComponent(void)const ;
  protected:
    virtual void VisibleChanged(bool);
    virtual void EnabledChanged(bool);
  public:
    virtual void DrawBackground(class UCanvas *,struct UGUI_Desktop::draw_context &,struct UGUI_BaseDesktop::base_rect<float> *);
    virtual void PreMove(float,float,float *,float *);
    virtual void Move(float,float);
    virtual void PreResize(float,float,float *,float *);
    virtual void Resize(float,float);
    virtual float GetClientHeight(void);
    virtual float GetClientWidth(void);
    virtual bool MouseWheel(bool);
    virtual void InvalidateFunctionPtrs(void);
    virtual void DrawComponent(class UGUI_Component *,class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void DrawComponents(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void TransferComponent(class UGUI_Component *,class UGUI_Page *);
    virtual class UGUI_Page * CreatePage(class FString const &,int,int,int,int,int,int,class FString,class FString);
    virtual struct UGUI_BaseDesktop::base_rect<float> GetChildClientArea(void);
    UGUI_Page(class UGUI_Page const &);
    UGUI_Page(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Page & operator=(class UGUI_Page const &);
    void AddTabComponent(class UGUI_Component *);
    void AttachComponent(class UGUI_Component *);
    void BringToBottom(class UGUI_Component *);
    void BringToTop(class UGUI_Component *);
    void Clear(void);
    class UGUI_Button * CreateButton(class FString const &,int,int,int,int,int,int,class FString);
    class UGUI_ComboBox * CreateComboBox(class FString const &,int,int,int,int,int,int,class FString);
    class UGUI_Component * CreateComponent(class FString const &,int,int,int,int,int,class FString,bool);
    class UGUI_EditBox * CreateEditBox(class FString const &,int,int,int,int,int,int,class FString);
    class UGUI_Label * CreateLabel(class FString const &,int,int,int,int,int,int,class FString);
    class UGUI_ListView * CreateListView(class FString const &,int,int,int,int,int,int);
    class UGUI_Mesh * CreateMesh(class FString const &,int,class FString const &,int,int,int,int,int,int,int,float,float,bool);
    class UGUI_TabCtrl * CreateTabCtrl(class FString const &,int,int,int,int,int,int,int,class FString);
    class UGUI_TextButton * CreateTextButton(class FString const &,int,int,int,int,int,int,class FString);
    void DestroyComponent(class UGUI_Component *);
    class UGUI_Component * DetachComponent(class UGUI_Component *);
    int GetHScrollOffset(void);
    class UGUI_Component * GetTabComponent(void);
    int GetVScrollOffset(void);
    static void CDECL InternalConstructor(void *);
    class UGUI_Component * NextTabComponent(void);
    class UGUI_Component * PreviousTabComponent(void);
    void SetTabComponent(class UGUI_Component *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnScrollOffsetChanged(class UGUI_ScrollBar *);
    unsigned long eventHiliteHandler(class UGUI_Component *);
    void execAddTabComponent(struct FFrame &,void * const);
    void execAttachComponent(struct FFrame &,void * const);
    void execBringToBottom(struct FFrame &,void * const);
    void execBringToTop(struct FFrame &,void * const);
    void execClear(struct FFrame &,void * const);
    void execCreateButton(struct FFrame &,void * const);
    void execCreateComboBox(struct FFrame &,void * const);
    void execCreateComponent(struct FFrame &,void * const);
    void execCreateEditBox(struct FFrame &,void * const);
    void execCreateLabel(struct FFrame &,void * const);
    void execCreateListView(struct FFrame &,void * const);
    void execCreateMesh(struct FFrame &,void * const);
    void execCreatePage(struct FFrame &,void * const);
    void execCreateTabCtrl(struct FFrame &,void * const);
    void execCreateTextButton(struct FFrame &,void * const);
    void execDestroyComponent(struct FFrame &,void * const);
    void execDetachComponent(struct FFrame &,void * const);
    void execFindComponent(struct FFrame &,void * const);
    void execGetClientHeight(struct FFrame &,void * const);
    void execGetClientWidth(struct FFrame &,void * const);
    void execGetComponent(struct FFrame &,void * const);
    void execGetComponentCount(struct FFrame &,void * const);
    void execGetVScrollOffset(struct FFrame &,void * const);
    void execHandleMouseWheel(struct FFrame &,void * const);
    void execNextTabComponent(struct FFrame &,void * const);
    void execOnLogin(struct FFrame &,void * const);
    void execPreLogin(struct FFrame &,void * const);
    void execPreviousTabComponent(struct FFrame &,void * const);
    void execTransferComponent(struct FFrame &,void * const);
    void execUpdateTabFocus(struct FFrame &,void * const);
  private:
    void CreateScrollBars(void);
    int ObtainComponentHandle(void);
    static class UClass PrivateStaticClass;
    void ReleaseComponentHandle(int);
    void UpdateScrollBars(void);
    void ValidateChild(class UGUI_Component *,class UCanvas *);
    void ValidateChildren(class UCanvas *);
    void ValidateScrollBars(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
};
AUTOGENERATE_FUNCTION(UGUI_Page,0,execAddTabComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execAttachComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execBringToBottom)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execBringToTop)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execClear)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreateButton)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreateComboBox)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreateComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreateEditBox)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreateLabel)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreateListView)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreateMesh)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreatePage)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreateTabCtrl)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execCreateTextButton)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execDestroyComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execDetachComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execFindComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execGetClientHeight)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execGetClientWidth)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execGetComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execGetComponentCount)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execGetVScrollOffset)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execHandleMouseWheel)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execNextTabComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execOnLogin)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execPreLogin)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execPreviousTabComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execTransferComponent)
AUTOGENERATE_FUNCTION(UGUI_Page,0,execUpdateTabFocus)


//------------------------------------------------------------------------------
//  GUI_Window
//------------------------------------------------------------------------------

#define UCONST_GUI_Window_WINDOW_MIN_HEIGHT  20.0f
#define UCONST_GUI_Window_WINDOW_MIN_WIDTH  20.0f
//  GUI_Window.GetWindowStyle 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execGetWindowStyle_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.EnableClose 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Window_eventEnableClose_Parms {
  BITFIELD Setting : 1;  // 0 80 CPF_Parm
};


//  GUI_Window.EnableMovement 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Window_eventEnableMovement_Parms {
  BITFIELD Setting : 1;  // 0 80 CPF_Parm
};


//  GUI_Window.EnableMinimize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Window_eventEnableMinimize_Parms {
  BITFIELD Setting : 1;  // 0 80 CPF_Parm
};


//  GUI_Window.SetIcon 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execSetIcon_Parms {
  class FString imageBaseName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString texturePackages;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 10 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_Window.SetTitle 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execSetTitle_Parms {
  class FString NewTitle;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Window.Resize 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execResize_Parms {
  FLOAT newWidth;  // 0 80 CPF_Parm
  FLOAT NewHeight;  // 4 80 CPF_Parm
};


//  GUI_Window.Move 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execMove_Parms {
  FLOAT newX;  // 0 80 CPF_Parm
  FLOAT newY;  // 4 80 CPF_Parm
};


//  GUI_Window.SetDockingStyle 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execSetDockingStyle_Parms {
  INT dockingSytle;  // 0 80 CPF_Parm
};


//  GUI_Window.GetClientHeight 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execGetClientHeight_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.GetClientWidth 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execGetClientWidth_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.OnEndMoving 20800 0 ( FUNC_Event FUNC_Public )
struct UGUI_Window_eventOnEndMoving_Parms {
};


//  GUI_Window.OnUpdate 20000 0 ( FUNC_Public )
struct UGUI_Window_execOnUpdate_Parms {
  INT intParam;  // 0 90 CPF_OptionalParm CPF_Parm
  class UObject* objParam;  // 4 90 CPF_OptionalParm CPF_Parm
  class FString stringParam;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  INT intParam2;  // 10 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Window.GetWindowHandle 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execGetWindowHandle_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.Restore 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execRestore_Parms {
};


//  GUI_Window.Minimize 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execMinimize_Parms {
};


//  GUI_Window.Maximize 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execMaximize_Parms {
};


//  GUI_Window.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Window_eventDoShowWindow_Parms {
  INT flags;  // 0 80 CPF_Parm
};


//  GUI_Window.ToggleContextMenu 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Window_execToggleContextMenu_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
};


//  GUI_Window.GetLastFocusedComponent 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execGetLastFocusedComponent_Parms {
  class UGUI_Component* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.IsFocused 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execIsFocused_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.TitleBarClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execTitleBarClickHandler_Parms {
  class UGUI_Button* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.TryCloseWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Window_eventTryCloseWindow_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.CloseMenuItemHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execCloseMenuItemHandler_Parms {
  class UGUI_Component* aClickedComponent;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.AutoplaceMenuItemHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execAutoplaceMenuItemHandler_Parms {
  class UGUI_TextButton* clickedButton;  // 0 80 CPF_Parm
  BITFIELD checkState : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.ChangeTransparencySetting 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execChangeTransparencySetting_Parms {
  class UGUI_TextButton* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Window.UpdateMenuItems 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Window_eventUpdateMenuItems_Parms {
};


//  GUI_Window.InitializeMenu 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Window_eventInitializeMenu_Parms {
  class UGUI_Menu* Menu;  // 0 80 CPF_Parm
};


//  GUI_Window.Flush 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Window_eventFlush_Parms {
};


//  GUI_Window.OnWindowClosed 120800 0 ( FUNC_Event FUNC_Public FUNC_Delegate )
struct UGUI_Window_eventOnWindowClosed_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  GUI_Window.Invalidate 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execInvalidate_Parms {
};


//  GUI_Window.SetBorder 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Window_execSetBorder_Parms {
  INT offsetX;  // 0 80 CPF_Parm
  INT offsetY;  // 4 80 CPF_Parm
  INT offsetW;  // 8 80 CPF_Parm
  INT offsetH;  // C 80 CPF_Parm
  class FString imageBaseName;  // 10 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString texturePackages;  // 18 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_Window.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Window_eventInitialize_Parms {
};


// UGUI_Window 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Window : public UGUI_Page {
  public:
    INT mWindowHandle;  // 2E4 0
    class FString mWindowTitle;  // 2E8 400000 CPF_NeedCtorLink
    class FString mClassName;  // 2F0 400000 CPF_NeedCtorLink
    INT mWindowStyle;  // 2F8 0
    class UGUI_TitleBar* mTitleBar;  // 2FC 0
    class UGUI_Window* mOwnerWindow;  // 300 0
    INT mDockingStyle;  // 304 0
    INT mCurrentDocking;  // 308 0
    FLOAT mRenderWindowRect[4];  // 30C 0
    FLOAT mDockLeft;  // 31C 0
    FLOAT mDockTop;  // 320 0
    FLOAT mSnapLeft;  // 324 0
    FLOAT mSnapTop;  // 328 0
    FLOAT mDockingBorders[4];  // 32C 0
    class UGUI_Image* mInnerOrnament;  // 33C 0
    BITFIELD mMinimized : 1;  // 340 0
    BITFIELD mMaximized : 1;  // 340 0
    BITFIELD mMinimizeFadeIn : 1;  // 340 0
    BITFIELD mMinimizeFadeOut : 1;  // 340 0
    BITFIELD mMaximizeFadeIn : 1;  // 340 0
    BITFIELD mMaximizeFadeOut : 1;  // 340 0
    FLOAT mMinimizedLeft;  // 344 0
    FLOAT mMinimizedTop;  // 348 0
    FLOAT mRestoreLeft;  // 34C 0
    FLOAT mRestoreTop;  // 350 0
    FLOAT mRestoreWidth;  // 354 0
    FLOAT mRestoreHeight;  // 358 0
    class UGUI_Component* mFocusedComponent;  // 35C 2000000 CPF_EditorData
    class UGUI_Menu* mSystemMenu;  // 360 0
    class UGUI_Menu* mTransparencyMenu;  // 364 0
    class UGUI_TextButton* mAutoplaceMenuItem;  // 368 0
    class UGUI_TextButton* mCloseMenuItem;  // 36C 0
    struct FScriptDelegate __OnWindowClosed__Delegate;  // 370 400000 CPF_NeedCtorLink
    INT mWindowData;  // 378 800000 CPF_Unk_00800000
    virtual ~UGUI_Window(void);
    virtual void Destroy(void);
  protected:
    virtual void Serialize(class FArchive &);
  public:
    virtual void CleanWeakPointers(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Shutdown(void);
    virtual void NotifyResolutionChange(int,int,int,int);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual bool IsFocused(void)const ;
    virtual void VisibleChanged(bool);
    virtual void Move(float,float);
    virtual void Resize(float,float);
    virtual float GetClientHeight(void);
    virtual float GetClientWidth(void);
    virtual void SetClientHeight(float);
    virtual void SetPosition(float,float,float,float);
    virtual void SetIcon(class FString,class FString,class FString);
    virtual bool MouseWheel(bool);
    virtual void PreInitialize(void);
    virtual void DrawComponents(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void PostInitialize(void);
    virtual void SetTitle(class FString const &);
    UGUI_Window(class UGUI_Window const &);
    UGUI_Window(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Window & operator=(class UGUI_Window const &);
    static void CDECL InternalConstructor(void *);
    void Maximize(void);
    void Minimize(void);
    void Restore(void);
    static class UClass * CDECL StaticClass(void);
    void delegateOnWindowClosed(class UGUI_Window *);
    void eventDoShowWindow(int);
    void eventEnableClose(unsigned long);
    void eventEnableMinimize(unsigned long);
    void eventEnableMovement(unsigned long);
    void eventFlush(void);
    void eventInitializeMenu(class UGUI_Menu *);
    void eventOnEndMoving(void);
    unsigned long eventTryCloseWindow(void);
    void eventUpdateMenuItems(void);
    void execGetClientHeight(struct FFrame &,void * const);
    void execGetClientWidth(struct FFrame &,void * const);
    void execMaximize(struct FFrame &,void * const);
    void execMinimize(struct FFrame &,void * const);
    void execMove(struct FFrame &,void * const);
    void execResize(struct FFrame &,void * const);
    void execRestore(struct FFrame &,void * const);
    void execSetIcon(struct FFrame &,void * const);
    void execSetTitle(struct FFrame &,void * const);
    void execToggleContextMenu(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_Window,0,execGetClientHeight)
AUTOGENERATE_FUNCTION(UGUI_Window,0,execGetClientWidth)
AUTOGENERATE_FUNCTION(UGUI_Window,0,execMaximize)
AUTOGENERATE_FUNCTION(UGUI_Window,0,execMinimize)
AUTOGENERATE_FUNCTION(UGUI_Window,0,execMove)
AUTOGENERATE_FUNCTION(UGUI_Window,0,execResize)
AUTOGENERATE_FUNCTION(UGUI_Window,0,execRestore)
AUTOGENERATE_FUNCTION(UGUI_Window,0,execSetIcon)
AUTOGENERATE_FUNCTION(UGUI_Window,0,execSetTitle)
AUTOGENERATE_FUNCTION(UGUI_Window,0,execToggleContextMenu)


//------------------------------------------------------------------------------
//  GED_Editor
//------------------------------------------------------------------------------

#define UCONST_GED_Editor_GED_EXPORT_COMPONENT_LIST_NAME  "componentVector"
#define UCONST_GED_Editor_GED_EXPORT_VAR_NAME  "currentComponent"
//  GED_Editor.Deregister 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execDeregister_Parms {
  class FString aName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GED_Editor.Register 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execRegister_Parms {
  class UGUI_Component* aComponent;  // 0 80 CPF_Parm
  class FString aName;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  GED_Editor.ResolveComponents 20002 0 ( FUNC_Defined FUNC_Public )
struct UGED_Editor_execResolveComponents_Parms {
  TArray<class FString> filenames;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  TArray<class FString> references;  // C 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  TArray<class UGUI_Component*> Result;  // 18 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 24 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GED_Editor.OnEndDragHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGED_Editor_execOnEndDragHandler_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GED_Editor.OnDropHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGED_Editor_execOnDropHandler_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  FLOAT relMouseX;  // 4 80 CPF_Parm
  FLOAT relMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* fromChild;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GED_Editor.OnDragHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGED_Editor_execOnDragHandler_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  FLOAT relMouseX;  // 4 80 CPF_Parm
  FLOAT relMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* fromChild;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GED_Editor.OnClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGED_Editor_execOnClickHandler_Parms {
  class UGUI_Button* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GED_Editor.DumpRegistry 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execDumpRegistry_Parms {
};


//  GED_Editor.ReloadWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execReloadWindow_Parms {
  class FString fileName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UGUI_Window* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GED_Editor.GetWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execGetWindow_Parms {
  class FString fileName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UGUI_Window* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GED_Editor.ShowWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execShowWindow_Parms {
  class FString fileName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ShowFlags;  // 8 80 CPF_Parm
  class UGUI_Window* ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GED_Editor.Flush 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execFlush_Parms {
};


//  GED_Editor.RetrieveComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execRetrieveComponent_Parms {
  class FString Name;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UGUI_Component* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GED_Editor.Attach 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execAttach_Parms {
  class UGUI_Component* Source;  // 0 80 CPF_Parm
  class FString specificationFile;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  GED_Editor.HandleEndDrag 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execHandleEndDrag_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
};


//  GED_Editor.HandleDropEvent 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execHandleDropEvent_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  FLOAT relMouseX;  // 4 80 CPF_Parm
  FLOAT relMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* fromChild;  // C 80 CPF_Parm
};


//  GED_Editor.HandleDragEvent 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execHandleDragEvent_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  FLOAT relMouseX;  // 4 80 CPF_Parm
  FLOAT relMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* fromChild;  // C 80 CPF_Parm
};


//  GED_Editor.HandleClickEvent 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execHandleClickEvent_Parms {
  class UGUI_Component* Source;  // 0 80 CPF_Parm
};


//  GED_Editor.Parse 20400 0 ( FUNC_Native FUNC_Public )
struct UGED_Editor_execParse_Parms {
  class FString Input;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


// UGED_Editor 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGED_Editor : public UGUI_Window {
  public:
    class UGUI_Window* mCurrentWindow;  // 37C 0
    class UGUI_Component* mCurrentComponent;  // 380 0
    class UGUI_Image* mCurrentImage;  // 384 0
    TArray<class UGUI_Component*> mSessionComponents;  // 388 400000 CPF_NeedCtorLink
    BITFIELD mDebugSession : 1;  // 394 0
    virtual ~UGED_Editor(void);
    virtual unsigned int GetCPPSize(void);
    UGED_Editor(class UGED_Editor const &);
    UGED_Editor(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGED_Editor & operator=(class UGED_Editor const &);
    class UGUI_Window * Attach(class UGUI_Component *,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    void ClearWindowCache(void);
    void Deregister(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    void DumpRegistry(void);
    void Flush(void);
    class GED_CommandList * GetCommandList(void);
    static class UGED_Editor * CDECL GetInstance(void);
    void Init(void);
    static void CDECL InternalConstructor(void *);
    class UGUI_Window * LoadWindow(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    void Register(class UGUI_Component *,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    class FString ResolveProperty(class FString const &);
    class UGUI_Component * RetrieveComponent(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    class UGUI_Window * ShowWindow(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,int);
    static class UClass * CDECL StaticClass(void);
    void execAttach(struct FFrame &,void * const);
    void execDeregister(struct FFrame &,void * const);
    void execDumpRegistry(struct FFrame &,void * const);
    void execFlush(struct FFrame &,void * const);
    void execGetWindow(struct FFrame &,void * const);
    void execHandleClickEvent(struct FFrame &,void * const);
    void execHandleDragEvent(struct FFrame &,void * const);
    void execHandleDropEvent(struct FFrame &,void * const);
    void execHandleEndDrag(struct FFrame &,void * const);
    void execParse(struct FFrame &,void * const);
    void execRegister(struct FFrame &,void * const);
    void execReloadWindow(struct FFrame &,void * const);
    void execRetrieveComponent(struct FFrame &,void * const);
    void execShowWindow(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGED_Editor,0,execAttach)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execDeregister)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execDumpRegistry)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execFlush)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execGetWindow)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execHandleClickEvent)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execHandleDragEvent)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execHandleDropEvent)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execHandleEndDrag)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execParse)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execRegister)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execReloadWindow)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execRetrieveComponent)
AUTOGENERATE_FUNCTION(UGED_Editor,0,execShowWindow)


//------------------------------------------------------------------------------
//  GED_DebugWindow
//------------------------------------------------------------------------------

// UGED_DebugWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGED_DebugWindow : public UGUI_Window {
  public:
    virtual ~UGED_DebugWindow(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void SetVisible(bool);
    virtual void Resize(float,float);
    UGED_DebugWindow(class UGED_DebugWindow const &);
    UGED_DebugWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGED_DebugWindow & operator=(class UGED_DebugWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GED_StringPage
//------------------------------------------------------------------------------

// UGED_StringPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGED_StringPage : public UGUI_Page {
  public:
    char Unknown0[12];
    virtual ~UGED_StringPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UGED_StringPage(class UGED_StringPage const &);
    UGED_StringPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGED_StringPage & operator=(class UGED_StringPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GED_ObjectPage
//------------------------------------------------------------------------------

// UGED_ObjectPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGED_ObjectPage : public UGUI_Page {
  public:
    char Unknown0[4];
    virtual ~UGED_ObjectPage(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(void);
    virtual void Tick(float);
    UGED_ObjectPage(class UGED_ObjectPage const &);
    UGED_ObjectPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGED_ObjectPage & operator=(class UGED_ObjectPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventSetObject(class UObject *);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GED_QuestPage
//------------------------------------------------------------------------------

// UGED_QuestPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGED_QuestPage : public UGED_ObjectPage {
  public:
    virtual ~UGED_QuestPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual class UQuest_Type * GetQuest(void);
    UGED_QuestPage(class UGED_QuestPage const &);
    UGED_QuestPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGED_QuestPage & operator=(class UGED_QuestPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GED_PawnPage
//------------------------------------------------------------------------------

// UGED_PawnPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGED_PawnPage : public UGED_ObjectPage {
  public:
    virtual ~UGED_PawnPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual class AGame_Pawn * GetPawn(void);
    UGED_PawnPage(class UGED_PawnPage const &);
    UGED_PawnPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGED_PawnPage & operator=(class UGED_PawnPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GED_IntPage
//------------------------------------------------------------------------------

// UGED_IntPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGED_IntPage : public UGUI_Page {
  public:
    char Unknown0[8];
    virtual ~UGED_IntPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual class UMaterial * GetMaterial(void);
    UGED_IntPage(class UGED_IntPage const &);
    UGED_IntPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGED_IntPage & operator=(class UGED_IntPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GED_GroupMemberPage
//------------------------------------------------------------------------------

// UGED_GroupMemberPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGED_GroupMemberPage : public UGED_ObjectPage {
  public:
    virtual ~UGED_GroupMemberPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual class UGame_TeamMember * GetTeamMember(void);
    UGED_GroupMemberPage(class UGED_GroupMemberPage const &);
    UGED_GroupMemberPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGED_GroupMemberPage & operator=(class UGED_GroupMemberPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  SBConsole
//------------------------------------------------------------------------------

//  SBConsole.AddMessage 40003 0 ( FUNC_Final FUNC_Defined FUNC_Private )
struct USBConsole_execAddMessage_Parms {
  class FString aMsg;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  SBConsole.ConsoleToggle 20202 0 ( FUNC_Defined FUNC_Exec FUNC_Public )
struct USBConsole_execConsoleToggle_Parms {
};


//  SBConsole.ConsoleClose 20002 0 ( FUNC_Defined FUNC_Public )
struct USBConsole_execConsoleClose_Parms {
};


//  SBConsole.CancelAction 20202 0 ( FUNC_Defined FUNC_Exec FUNC_Public )
struct USBConsole_execCancelAction_Parms {
};


//  SBConsole.GetPlayerController 20002 0 ( FUNC_Defined FUNC_Public )
struct USBConsole_execGetPlayerController_Parms {
  class AGame_PlayerController* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBConsole.GetPawn 20002 0 ( FUNC_Defined FUNC_Public )
struct USBConsole_execGetPawn_Parms {
  class AGame_Pawn* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBConsole.ConsoleOpen 20002 0 ( FUNC_Defined FUNC_Public )
struct USBConsole_execConsoleOpen_Parms {
};


//  SBConsole.NativeConsoleOpen 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct USBConsole_eventNativeConsoleOpen_Parms {
};


//  SBConsole.KeyEvent 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct USBConsole_eventKeyEvent_Parms {
  BYTE aKey;  // 0 80 CPF_Parm
  BYTE aAction;  // 1 80 CPF_Parm
  FLOAT aDelta;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBConsole.InMouseLook 20002 0 ( FUNC_Defined FUNC_Public )
struct USBConsole_execInMouseLook_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  SBConsole.Message 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct USBConsole_eventMessage_Parms {
  class FString aMsg;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  FLOAT aMsgLife;  // 8 80 CPF_Parm
};


//  SBConsole.CLS 20202 0 ( FUNC_Defined FUNC_Exec FUNC_Public )
struct USBConsole_execCLS_Parms {
};


//  SBConsole.MakeCSConsole 20002 0 ( FUNC_Defined FUNC_Public )
struct USBConsole_execMakeCSConsole_Parms {
};


// USBConsole 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT USBConsole : public UConsole {
  public:
    INT MaxScrollbackSize;  // 2FC 44000 CPF_Config CPF_GlobalConfig
    BITFIELD mConsoleEnabled : 1;  // 300 44002 CPF_Const CPF_Config CPF_GlobalConfig
    TArray<class FString> mScrollback;  // 304 400000 CPF_NeedCtorLink
    INT mSBHead;  // 310 2000000 CPF_EditorData
    INT mSBPos;  // 314 2000000 CPF_EditorData
    BITFIELD mCtrlPressed : 1;  // 318 0
    BITFIELD mAltPressed : 1;  // 318 0
    BITFIELD mShiftPressed : 1;  // 318 0
    BITFIELD mConsoleHotKeyPressed : 1;  // 318 0
    BITFIELD mCSplayer : 1;  // 318 0
    class UFont* mConsoleFont;  // 31C 0
    INT mCurrentMusicHandle;  // 320 0
    virtual ~USBConsole(void);
    virtual unsigned int GetCPPSize(void);
    USBConsole(class USBConsole const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USBConsole & operator=(class USBConsole const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execStartMusic(struct FFrame &,void * const);
  protected:
    USBConsole(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(USBConsole,0,execStartMusic)


//------------------------------------------------------------------------------
//  HUD_TeamNotification
//------------------------------------------------------------------------------

// UHUD_TeamNotification 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_TeamNotification : public UGUI_Window {
  public:
    char Unknown0[16];
    virtual ~UHUD_TeamNotification(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_TeamNotification(class UHUD_TeamNotification const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_TeamNotification & operator=(class UHUD_TeamNotification const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_TeamNotification(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_PawnTracker
//------------------------------------------------------------------------------

// UHUD_PawnTracker 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UHUD_PawnTracker : public UGame_HUD {
  public:
    char Unknown0[80];
    virtual ~UHUD_PawnTracker(void);
    virtual unsigned int GetCPPSize(void);
    virtual void NativeTick(float);
    virtual void NativeRender(class FSceneNode *,class FRenderInterface *);
    virtual void OnHitByPlayer(void);
    virtual void OnHitPlayer(void);
    virtual void cl_OnInit(void);
    virtual void Destroyed(void);
    virtual void cl_AddScrollingCombatMessage(class FString const &,enum EScrollingCombatTextType,float);
    UHUD_PawnTracker(class UHUD_PawnTracker const &);
    UHUD_PawnTracker(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_PawnTracker & operator=(class UHUD_PawnTracker const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    void BlinkHealthBar(void);
    class FPlane const & GetHUDColor(void)const ;
    int IsOccluded(class FSceneNode *,class AActor *);
    bool IsWithinNameRange(void)const ;
    bool IsWithinPermanentHealthBarOnEnemiesRange(void)const ;
    bool IsWithinTrackingRange(void)const ;
    static class UClass PrivateStaticClass;
    void RenderHealthBar(class FSceneNode *,class FRenderInterface *);
    void RenderName(class FSceneNode *,class FRenderInterface *);
    void RenderScrollingCombatText(class FSceneNode *,class FRenderInterface *);
    void TickCharacter(void);
    void TickHealthBar(float);
    void TickName(float);
    void TickScrollingCombatText(float);
    bool UpdateScreenRect(class FSceneNode *);
    bool WasHitSource(void)const ;
    bool WasHitTarget(void)const ;
};


//------------------------------------------------------------------------------
//  HUD_OnScreenMessages
//------------------------------------------------------------------------------

// FOnScreenMessage 0 ( )
struct DLL_IMPORT FOnScreenMessage {
  public:
    class UGUI_TextCtrl* TextCtrl;  // 0 0
    FLOAT CreationTime;  // 4 0
    FLOAT PreviousTop;  // 8 0
    BITFIELD Fading : 1;  // C 0
    struct FOnScreenMessage & operator=(struct FOnScreenMessage const &);
};

//  HUD_OnScreenMessages.AddOnScreenMessage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_OnScreenMessages_eventAddOnScreenMessage_Parms {
  class FString aMessage;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FColor aColor;  // 8 90 CPF_OptionalParm CPF_Parm
  class FString aFont;  // C 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  HUD_OnScreenMessages.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_OnScreenMessages_eventDoShowWindow_Parms {
  INT flags;  // 0 80 CPF_Parm
};


//  HUD_OnScreenMessages.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_OnScreenMessages_eventInitialize_Parms {
};


// UHUD_OnScreenMessages 401E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UHUD_OnScreenMessages : public UGUI_Window {
  public:
    TArray<struct FOnScreenMessage> OnScreenMessages;  // 37C 400000 CPF_NeedCtorLink
    class FString mDefaultFont;  // 388 400000 CPF_NeedCtorLink
    class FColor mDefaultColor;  // 390 0
    FLOAT mTimer;  // 394 0
    FLOAT mDefaultDisplayTime;  // 398 0
    FLOAT mDefaultFadeTime;  // 39C 0
    INT mDefaultWidth;  // 3A0 0
    INT mDefaultHeight;  // 3A4 0
    INT mPreviousMessageCount;  // 3A8 0
    class FString mPreviousMessageText;  // 3AC 400000 CPF_NeedCtorLink
    FLOAT mPreviousMessageTimer;  // 3B4 0
    virtual ~UHUD_OnScreenMessages(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    UHUD_OnScreenMessages(class UHUD_OnScreenMessages const &);
    UHUD_OnScreenMessages(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_OnScreenMessages & operator=(class UHUD_OnScreenMessages const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventAddOnScreenMessage(class FString const &,class FColor,class FString const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CreditsWindow
//------------------------------------------------------------------------------

// UHUD_CreditsWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CreditsWindow : public UGUI_Window {
  public:
    char Unknown0[48];
    virtual ~UHUD_CreditsWindow(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_CreditsWindow(class UHUD_CreditsWindow const &);
    UHUD_CreditsWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CreditsWindow & operator=(class UHUD_CreditsWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execLoadCredits(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_CreditsWindow,0,execLoadCredits)


//------------------------------------------------------------------------------
//  HUD_HelpTutorial
//------------------------------------------------------------------------------

//  HUD_HelpTutorial.GetArticleByTag 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_HelpTutorial_execGetArticleByTag_Parms {
  class FString articleTag;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UHelp_Article* ReturnValue;  // 8 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  HUD_HelpTutorial.SetTutorialsActive 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_HelpTutorial_execSetTutorialsActive_Parms {
  BITFIELD Active : 1;  // 0 80 CPF_Parm
};


//  HUD_HelpTutorial.GetTutorialsActive 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_HelpTutorial_execGetTutorialsActive_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_HelpTutorial.LoadContent 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_HelpTutorial_execLoadContent_Parms {
  class UGUI_TextCtrl* textTitle;  // 0 80 CPF_Parm
  class UGUI_TextCtrl* textBody;  // 4 80 CPF_Parm
  class UHelp_Article* Article;  // 8 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  HUD_HelpTutorial.SetTutorialByTag 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_HelpTutorial_execSetTutorialByTag_Parms {
  class FString articleTag;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_HelpTutorial.SetTutorialByID 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_HelpTutorial_execSetTutorialByID_Parms {
  INT articleID;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_HelpTutorial.CloseClick 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_HelpTutorial_execCloseClick_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_HelpTutorial.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_HelpTutorial_eventDoShowWindow_Parms {
  INT flags;  // 0 80 CPF_Parm
};


//  HUD_HelpTutorial.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_HelpTutorial_eventInitialize_Parms {
};


// UHUD_HelpTutorial 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_HelpTutorial : public UGUI_Window {
  public:
    class UGUI_Page* mMainPage;  // 37C 0
    class UGUI_TextCtrl* mHelpTitle;  // 380 0
    class UGUI_TextCtrl* mHelpContent;  // 384 0
    class UGUI_Button* mTutorialButton;  // 388 0
    class UGUI_Label* mTutorialLabel;  // 38C 0
    class UGUI_Button* mCloseButton;  // 390 0
    class UHelp_Article* mRootArticle;  // 394 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    virtual ~UHUD_HelpTutorial(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_HelpTutorial(class UHUD_HelpTutorial const &);
    UHUD_HelpTutorial(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_HelpTutorial & operator=(class UHUD_HelpTutorial const &);
    class UHelp_Article * GetArticleByTag(class FString);
    int GetTutorialsActive(void);
    static void CDECL InternalConstructor(void *);
    void LoadContent(class UGUI_TextCtrl *,class UGUI_TextCtrl *,class UHelp_Article *);
    void SetTutorialsActive(int);
    static class UClass * CDECL StaticClass(void);
    void execGetArticleByTag(struct FFrame &,void * const);
    void execGetTutorialsActive(struct FFrame &,void * const);
    void execLoadContent(struct FFrame &,void * const);
    void execSetTutorialsActive(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_HelpTutorial,0,execGetArticleByTag)
AUTOGENERATE_FUNCTION(UHUD_HelpTutorial,0,execGetTutorialsActive)
AUTOGENERATE_FUNCTION(UHUD_HelpTutorial,0,execLoadContent)
AUTOGENERATE_FUNCTION(UHUD_HelpTutorial,0,execSetTutorialsActive)


//------------------------------------------------------------------------------
//  HUD_HelpKnowledgeBase
//------------------------------------------------------------------------------

//  HUD_HelpKnowledgeBase.SetTutorialsActive 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_HelpKnowledgeBase_execSetTutorialsActive_Parms {
  BITFIELD Active : 1;  // 0 80 CPF_Parm
};


//  HUD_HelpKnowledgeBase.GetTutorialsActive 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_HelpKnowledgeBase_execGetTutorialsActive_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_HelpKnowledgeBase.LoadContent 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_HelpKnowledgeBase_execLoadContent_Parms {
  class UGUI_Label* textTitle;  // 0 80 CPF_Parm
  class UGUI_TextCtrl* textBody;  // 4 80 CPF_Parm
  class UHelp_Article* Article;  // 8 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  HUD_HelpKnowledgeBase.LoadSubjects 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_HelpKnowledgeBase_execLoadSubjects_Parms {
  class UGUI_TreeCtrl* tree;  // 0 80 CPF_Parm
  class UHelp_Article* rootArticle;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  HUD_HelpKnowledgeBase.CloseClick 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_HelpKnowledgeBase_execCloseClick_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_HelpKnowledgeBase.HelpSubjectItemSelect 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_HelpKnowledgeBase_execHelpSubjectItemSelect_Parms {
  class UGUI_TreeCtrl* Source;  // 0 80 CPF_Parm
  INT itemIndex;  // 4 80 CPF_Parm
  class FString itemText;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class UObject* itemData;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_HelpKnowledgeBase.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_HelpKnowledgeBase_eventDoShowWindow_Parms {
  INT flags;  // 0 80 CPF_Parm
};


//  HUD_HelpKnowledgeBase.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_HelpKnowledgeBase_eventInitialize_Parms {
};


// UHUD_HelpKnowledgeBase 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_HelpKnowledgeBase : public UGUI_Window {
  public:
    class UGUI_TreeCtrl* mHelpSubjects;  // 37C 0
    class UGUI_Label* mHelpTitle;  // 380 0
    class UGUI_TextCtrl* mHelpContent;  // 384 0
    class UGUI_Button* mTutorialButton;  // 388 0
    class UGUI_Label* mTutorialLabel;  // 38C 0
    class UGUI_Button* mCloseButton;  // 390 0
    class UHelp_Article* mRootArticle;  // 394 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    virtual ~UHUD_HelpKnowledgeBase(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_HelpKnowledgeBase(class UHUD_HelpKnowledgeBase const &);
    UHUD_HelpKnowledgeBase(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_HelpKnowledgeBase & operator=(class UHUD_HelpKnowledgeBase const &);
    void AddSubject(int,class UGUI_TreeCtrl *,class UHelp_Article *);
    int GetTutorialsActive(void);
    static void CDECL InternalConstructor(void *);
    void LoadContent(class UGUI_Label *,class UGUI_TextCtrl *,class UHelp_Article *);
    void LoadSubjects(class UGUI_TreeCtrl *,class UHelp_Article *);
    void SetTutorialsActive(int);
    static class UClass * CDECL StaticClass(void);
    void execGetTutorialsActive(struct FFrame &,void * const);
    void execLoadContent(struct FFrame &,void * const);
    void execLoadSubjects(struct FFrame &,void * const);
    void execSetTutorialsActive(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_HelpKnowledgeBase,0,execGetTutorialsActive)
AUTOGENERATE_FUNCTION(UHUD_HelpKnowledgeBase,0,execLoadContent)
AUTOGENERATE_FUNCTION(UHUD_HelpKnowledgeBase,0,execLoadSubjects)
AUTOGENERATE_FUNCTION(UHUD_HelpKnowledgeBase,0,execSetTutorialsActive)


//------------------------------------------------------------------------------
//  HUD_Join_Guild
//------------------------------------------------------------------------------

// UHUD_Join_Guild 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Join_Guild : public UGUI_Window {
  public:
    char Unknown0[64];
    virtual ~UHUD_Join_Guild(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_Join_Guild(class UHUD_Join_Guild const &);
    UHUD_Join_Guild(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Join_Guild & operator=(class UHUD_Join_Guild const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_GuildList
//------------------------------------------------------------------------------

// UHUD_GuildList 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_GuildList : public UGUI_Window {
  public:
    char Unknown0[172];
    virtual ~UHUD_GuildList(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_GuildList(class UHUD_GuildList const &);
    UHUD_GuildList(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_GuildList & operator=(class UHUD_GuildList const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_Create_Guild
//------------------------------------------------------------------------------

// UHUD_Create_Guild 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Create_Guild : public UGUI_Window {
  public:
    char Unknown0[80];
    virtual ~UHUD_Create_Guild(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_Create_Guild(class UHUD_Create_Guild const &);
    UHUD_Create_Guild(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Create_Guild & operator=(class UHUD_Create_Guild const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execIsValidGuildName(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_Create_Guild,0,execIsValidGuildName)


//------------------------------------------------------------------------------
//  HUD_Shop_ItemDescription
//------------------------------------------------------------------------------

// UHUD_Shop_ItemDescription 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Shop_ItemDescription : public UGUI_Page {
  public:
    char Unknown0[56];
    virtual ~UHUD_Shop_ItemDescription(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_Shop_ItemDescription(class UHUD_Shop_ItemDescription const &);
    UHUD_Shop_ItemDescription(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Shop_ItemDescription & operator=(class UHUD_Shop_ItemDescription const &);
    float GetTextHeight(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnItemSet(int,class UGame_Item *);
    void delegateOnSetSelected(class UHUD_Shop_ItemDescription *);
    void execGetTextHeight(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_Shop_ItemDescription,0,execGetTextHeight)


//------------------------------------------------------------------------------
//  HUD_Shop_Window
//------------------------------------------------------------------------------

// UHUD_Shop_Window 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Shop_Window : public UGUI_Window {
  public:
    char Unknown0[40];
    virtual ~UHUD_Shop_Window(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_Shop_Window(class UHUD_Shop_Window const &);
    UHUD_Shop_Window(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Shop_Window & operator=(class UHUD_Shop_Window const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventOnItemAppliedToPawn(class UGame_Item *);
    void eventOnItemRemovedFromPawn(class UGame_Item *);
    void execApplyItemToPawn(struct FFrame &,void * const);
    void execRemoveItemFromPawn(struct FFrame &,void * const);
    void execResetPawnAppearance(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_Shop_Window,0,execApplyItemToPawn)
AUTOGENERATE_FUNCTION(UHUD_Shop_Window,0,execRemoveItemFromPawn)
AUTOGENERATE_FUNCTION(UHUD_Shop_Window,0,execResetPawnAppearance)


//------------------------------------------------------------------------------
//  HUD_ColourChoice
//------------------------------------------------------------------------------

// UHUD_ColourChoice 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ColourChoice : public UGUI_Page {
  public:
    char Unknown0[48];
    virtual ~UHUD_ColourChoice(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_ColourChoice(class UHUD_ColourChoice const &);
    UHUD_ColourChoice(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ColourChoice & operator=(class UHUD_ColourChoice const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnColourSelected(class FColor,int,unsigned char);
    class UTexture * delegateOnGetPalette(int);
    void delegateOnOpenPicker(class UHUD_ColourChoice *,int);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_Shop_Painting
//------------------------------------------------------------------------------

// UHUD_Shop_Painting 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Shop_Painting : public UHUD_Shop_Window {
  public:
    char Unknown0[48];
    virtual ~UHUD_Shop_Painting(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_Shop_Painting(class UHUD_Shop_Painting const &);
    UHUD_Shop_Painting(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Shop_Painting & operator=(class UHUD_Shop_Painting const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    class UTexture * eventGetPalette(int);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_Shop_Crafting
//------------------------------------------------------------------------------

// UHUD_Shop_Crafting 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Shop_Crafting : public UHUD_Shop_Window {
  public:
    char Unknown0[40];
    virtual ~UHUD_Shop_Crafting(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_Shop_Crafting(class UHUD_Shop_Crafting const &);
    UHUD_Shop_Crafting(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Shop_Crafting & operator=(class UHUD_Shop_Crafting const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execSetItemMesh(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_Shop_Crafting,0,execSetItemMesh)


//------------------------------------------------------------------------------
//  GUI_AutoHeight_Page
//------------------------------------------------------------------------------

// UGUI_AutoHeight_Page 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_AutoHeight_Page : public UGUI_Page {
  public:
    char Unknown0[16];
    virtual ~UGUI_AutoHeight_Page(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UGUI_AutoHeight_Page(class UGUI_AutoHeight_Page const &);
    UGUI_AutoHeight_Page(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_AutoHeight_Page & operator=(class UGUI_AutoHeight_Page const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnHeightChanged(int);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_Shop_Buy_Section_Page
//------------------------------------------------------------------------------

// UHUD_Shop_Buy_Section_Page 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Shop_Buy_Section_Page : public UGUI_AutoHeight_Page {
  public:
    char Unknown0[28];
    virtual ~UHUD_Shop_Buy_Section_Page(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_Shop_Buy_Section_Page(class UHUD_Shop_Buy_Section_Page const &);
    UHUD_Shop_Buy_Section_Page(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Shop_Buy_Section_Page & operator=(class UHUD_Shop_Buy_Section_Page const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnSelectionChanged(class UHUD_Shop_Buy_Section_Page *,class UHUD_Shop_BuyItemDescription *);
    void eventSetDescription(class FString const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_Shop_Buying_Page
//------------------------------------------------------------------------------

// UHUD_Shop_Buying_Page 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Shop_Buying_Page : public UGUI_Page {
  public:
    char Unknown0[32];
    virtual ~UHUD_Shop_Buying_Page(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_Shop_Buying_Page(class UHUD_Shop_Buying_Page const &);
    UHUD_Shop_Buying_Page(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Shop_Buying_Page & operator=(class UHUD_Shop_Buying_Page const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnSelectionChanged(class UGame_Item *,unsigned long);
    void execCreateSections(struct FFrame &,void * const);
    void execGetItemSection(struct FFrame &,void * const);
  private:
    void CreateSection(enum EBuyingItemSections,class FString const &);
    enum EBuyingItemSections GetItemSection(class UGame_Item *);
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_Shop_Buying_Page,0,execCreateSections)
AUTOGENERATE_FUNCTION(UHUD_Shop_Buying_Page,0,execGetItemSection)


//------------------------------------------------------------------------------
//  HUD_Shop_Buying
//------------------------------------------------------------------------------

// UHUD_Shop_Buying 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Shop_Buying : public UHUD_Shop_Window {
  public:
    char Unknown0[20];
    virtual ~UHUD_Shop_Buying(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_Shop_Buying(class UHUD_Shop_Buying const &);
    UHUD_Shop_Buying(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Shop_Buying & operator=(class UHUD_Shop_Buying const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_MailDetails
//------------------------------------------------------------------------------

// UHUD_MailDetails 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_MailDetails : public UGUI_Window {
  public:
    char Unknown0[72];
    virtual ~UHUD_MailDetails(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_MailDetails(class UHUD_MailDetails const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_MailDetails & operator=(class UHUD_MailDetails const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execAgeFormatTimestamp(struct FFrame &,void * const);
  protected:
    UHUD_MailDetails(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_MailDetails,0,execAgeFormatTimestamp)


//------------------------------------------------------------------------------
//  HUD_MailCompose
//------------------------------------------------------------------------------

// UHUD_MailCompose 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_MailCompose : public UGUI_Window {
  public:
    char Unknown0[44];
    virtual ~UHUD_MailCompose(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_MailCompose(class UHUD_MailCompose const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_MailCompose & operator=(class UHUD_MailCompose const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execHandleSendMailStatus(struct FFrame &,void * const);
  protected:
    UHUD_MailCompose(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_MailCompose,0,execHandleSendMailStatus)


//------------------------------------------------------------------------------
//  HUD_MailBox
//------------------------------------------------------------------------------

// UHUD_MailBox 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_MailBox : public UGUI_Window {
  public:
    char Unknown0[40];
    virtual ~UHUD_MailBox(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_MailBox(class UHUD_MailBox const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_MailBox & operator=(class UHUD_MailBox const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execAgeFormatTimestamp(struct FFrame &,void * const);
  protected:
    UHUD_MailBox(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_MailBox,0,execAgeFormatTimestamp)


//------------------------------------------------------------------------------
//  HUD_Travel
//------------------------------------------------------------------------------

// UHUD_Travel 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Travel : public UGUI_Window {
  public:
    char Unknown0[124];
    virtual ~UHUD_Travel(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_Travel(class UHUD_Travel const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Travel & operator=(class UHUD_Travel const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnTravel(int,class FString const &);
  protected:
    UHUD_Travel(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_ChatConsole
//------------------------------------------------------------------------------

//  HUD_ChatConsole.HandleMessage 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_ChatConsole_execHandleMessage_Parms {
  class FString Message;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  class FString sender;  // 8 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT Channel;  // 10 180 CPF_Parm CPF_OutParm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatConsole.HandleUserOutput 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_ChatConsole_execHandleUserOutput_Parms {
  class FString Message;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT Channel;  // 8 180 CPF_Parm CPF_OutParm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatConsole.HandleKeyEvent 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_ChatConsole_execHandleKeyEvent_Parms {
  BYTE Key;  // 0 180 CPF_Parm CPF_OutParm
  BYTE State;  // 1 180 CPF_Parm CPF_OutParm
  FLOAT delta;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatConsole.HandleKeyType 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_ChatConsole_execHandleKeyType_Parms {
  BYTE Key;  // 0 180 CPF_Parm CPF_OutParm
  class FString Unicode;  // 4 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatConsole.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatConsole_execInitialize_Parms {
  class UHUD_Chat* aChat;  // 0 80 CPF_Parm
};


// UHUD_ChatConsole 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UHUD_ChatConsole : public UObject {
  public:
    class UHUD_Chat* mChat;  // 28 0
    virtual ~UHUD_ChatConsole(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool HandleKeyType(unsigned char *,unsigned short *);
    virtual bool HandleUserOutput(class FString *,int *);
    virtual bool HandleMessage(class FString *,class FString *,int *);
    virtual bool HandleKeyEvent(unsigned char *,unsigned char *,float);
    virtual class AGame_Pawn * GetPawn(void);
    UHUD_ChatConsole(class UHUD_ChatConsole const &);
    UHUD_ChatConsole(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ChatConsole & operator=(class UHUD_ChatConsole const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execHandleKeyEvent(struct FFrame &,void * const);
    void execHandleKeyType(struct FFrame &,void * const);
    void execHandleMessage(struct FFrame &,void * const);
    void execHandleUserOutput(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_ChatConsole,0,execHandleKeyEvent)
AUTOGENERATE_FUNCTION(UHUD_ChatConsole,0,execHandleKeyType)
AUTOGENERATE_FUNCTION(UHUD_ChatConsole,0,execHandleMessage)
AUTOGENERATE_FUNCTION(UHUD_ChatConsole,0,execHandleUserOutput)


//------------------------------------------------------------------------------
//  HUD_NetConsole
//------------------------------------------------------------------------------

// UHUD_NetConsole 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UHUD_NetConsole : public UHUD_ChatConsole {
  public:
    virtual ~UHUD_NetConsole(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool HandleUserOutput(class FString *,int *);
    UHUD_NetConsole(class UHUD_NetConsole const &);
    UHUD_NetConsole(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_NetConsole & operator=(class UHUD_NetConsole const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_DefaultConsole
//------------------------------------------------------------------------------

// UHUD_DefaultConsole 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UHUD_DefaultConsole : public UHUD_ChatConsole {
  public:
    char Unknown0[124];
    virtual ~UHUD_DefaultConsole(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool HandleKeyType(unsigned char *,unsigned short *);
    virtual bool HandleKeyEvent(unsigned char *,unsigned char *,float);
    virtual bool HandleUserOutput(class FString *,int *);
    virtual bool HandleMessage(class FString *,class FString *,int *);
    UHUD_DefaultConsole(class UHUD_DefaultConsole const &);
    UHUD_DefaultConsole(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_DefaultConsole & operator=(class UHUD_DefaultConsole const &);
    static class FString CDECL FormatChatMessage(class UHUD_Chat *,class FString const &,class FString const &,class FString const &,class FColor const &);
    static class FString CDECL FormatChatMessage(class UHUD_Chat *,void *);
    bool HandleCommand(class FString const &,int);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execInitNative(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_DefaultConsole,0,execInitNative)


//------------------------------------------------------------------------------
//  HUD_ChatConsoleManager
//------------------------------------------------------------------------------

#define UCONST_HUD_ChatConsoleManager_MAX_CHAT_MESSAGE_LENGTH  256
//  HUD_ChatConsoleManager.AddConsole 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatConsoleManager_execAddConsole_Parms {
  class FString consoleClassName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  HUD_ChatConsoleManager.DoesConsoleExist 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatConsoleManager_execDoesConsoleExist_Parms {
  class UClass* aClass;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatConsoleManager.LoadConsole 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatConsoleManager_eventLoadConsole_Parms {
  class FString ClassName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UHUD_ChatConsole* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatConsoleManager.LoadConsoles 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatConsoleManager_execLoadConsoles_Parms {
};


//  HUD_ChatConsoleManager.HandleKeyEvent 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatConsoleManager_eventHandleKeyEvent_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
  BYTE keyCode;  // 4 180 CPF_Parm CPF_OutParm
  BYTE State;  // 5 180 CPF_Parm CPF_OutParm
  FLOAT delta;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatConsoleManager.HandleKeyType 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatConsoleManager_eventHandleKeyType_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
  BYTE keyCode;  // 4 180 CPF_Parm CPF_OutParm
  class FString Unicode;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatConsoleManager.HandleMessage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatConsoleManager_eventHandleMessage_Parms {
  class FString sender;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString Message;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  INT Channel;  // 10 80 CPF_Parm
};


//  HUD_ChatConsoleManager.HandleUserOutput 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatConsoleManager_execHandleUserOutput_Parms {
  class FString Message;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT Channel;  // 8 80 CPF_Parm
};


//  HUD_ChatConsoleManager.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatConsoleManager_execInitialize_Parms {
  class UHUD_Chat* aChat;  // 0 80 CPF_Parm
};


// UHUD_ChatConsoleManager 16 ( CLASS_Compiled CLASS_Config CLASS_Parsed )
class DLL_IMPORT UHUD_ChatConsoleManager : public UObject {
  public:
    class UHUD_Chat* mChat;  // 28 0
    TArray<class UHUD_ChatConsole*> mConsoles;  // 2C 400000 CPF_NeedCtorLink
    TArray<class FString> mConsoleNames;  // 38 444000 CPF_Config CPF_GlobalConfig CPF_NeedCtorLink
    virtual ~UHUD_ChatConsoleManager(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_ChatConsoleManager(class UHUD_ChatConsoleManager const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ChatConsoleManager & operator=(class UHUD_ChatConsoleManager const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long eventHandleKeyEvent(class UGUI_Component *,unsigned char &,unsigned char &,float);
    unsigned long eventHandleKeyType(class UGUI_Component *,unsigned char &,class FString const &);
    void eventHandleMessage(class FString const &,class FString const &,int);
    class UHUD_ChatConsole * eventLoadConsole(class FString const &);
  protected:
    UHUD_ChatConsoleManager(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_TabCtrlDnDWindow
//------------------------------------------------------------------------------

//  GUI_TabCtrlDnDWindow.OnEndMoving 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TabCtrlDnDWindow_eventOnEndMoving_Parms {
};


// UGUI_TabCtrlDnDWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_TabCtrlDnDWindow : public UGUI_Window {
  public:
    class UGUI_Page* mOwnerTabCtrl;  // 37C 0
    virtual ~UGUI_TabCtrlDnDWindow(void);
    virtual unsigned int GetCPPSize(void);
    UGUI_TabCtrlDnDWindow(class UGUI_TabCtrlDnDWindow const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_TabCtrlDnDWindow & operator=(class UGUI_TabCtrlDnDWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UGUI_TabCtrlDnDWindow(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_ChatWindow
//------------------------------------------------------------------------------

//  HUD_ChatWindow.OnEndMoving 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatWindow_eventOnEndMoving_Parms {
};


//  HUD_ChatWindow.ChangeFontSize 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatWindow_execChangeFontSize_Parms {
  class UGUI_TextButton* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatWindow.ChangeFilterSetting 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatWindow_execChangeFilterSetting_Parms {
  class UGUI_TextButton* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatWindow.ToggleFadeOut 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatWindow_execToggleFadeOut_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatWindow.OnFocus 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatWindow_eventOnFocus_Parms {
  BITFIELD State : 1;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatWindow.SetHasFadeOut 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatWindow_eventSetHasFadeOut_Parms {
  BITFIELD aHasFadeOut : 1;  // 0 80 CPF_Parm
};


//  HUD_ChatWindow.SetChatPage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatWindow_eventSetChatPage_Parms {
  class UHUD_ChatPage* aChatPage;  // 0 80 CPF_Parm
};


//  HUD_ChatWindow.InitializeMenu 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatWindow_eventInitializeMenu_Parms {
  class UGUI_Menu* Menu;  // 0 80 CPF_Parm
};


//  HUD_ChatWindow.Flush 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatWindow_eventFlush_Parms {
};


//  HUD_ChatWindow.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatWindow_execInitialize_Parms {
};


// UHUD_ChatWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ChatWindow : public UGUI_TabCtrlDnDWindow {
  public:
    FLOAT mFadeOutTime;  // 380 0
    BITFIELD mHasFadeOut : 1;  // 384 0
    class UGUI_Page* mMainPage;  // 388 0
    class UHUD_ChatPage* mChatPage;  // 38C 0
    class UGUI_TextButton* mFadeOutButton;  // 390 0
    class UGUI_Menu* mChannelFilterMenu;  // 394 0
    class UGUI_Menu* mFontSizeMenu;  // 398 0
    virtual ~UHUD_ChatWindow(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void Resize(float,float);
    UHUD_ChatWindow(class UHUD_ChatWindow const &);
    UHUD_ChatWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ChatWindow & operator=(class UHUD_ChatWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventSetChatPage(class UHUD_ChatPage *);
    void eventSetHasFadeOut(unsigned long);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_ChatPage
//------------------------------------------------------------------------------

//  HUD_ChatPage.OnMessageReceived 120000 0 ( FUNC_Public FUNC_Delegate )
struct UHUD_ChatPage_execOnMessageReceived_Parms {
  class UHUD_ChatPage* aPage;  // 0 80 CPF_Parm
  class FString Message;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  HUD_ChatPage.SaveChatSettings 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatPage_execSaveChatSettings_Parms {
};


//  HUD_ChatPage.GetFontSize 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatPage_execGetFontSize_Parms {
  class UGUI_Menu* aFontSizeMenu;  // 0 80 CPF_Parm
};


//  HUD_ChatPage.GetFilterSettings 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatPage_execGetFilterSettings_Parms {
  class UGUI_Menu* aChannelFilterMenu;  // 0 80 CPF_Parm
};


//  HUD_ChatPage.SetLastUsedChannel 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatPage_execSetLastUsedChannel_Parms {
  INT i;  // 0 80 CPF_Parm
};


//  HUD_ChatPage.GetLastUsedChannel 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatPage_execGetLastUsedChannel_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatPage.SetChannelFlags 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatPage_execSetChannelFlags_Parms {
  INT newFlags;  // 0 80 CPF_Parm
};


//  HUD_ChatPage.GetRegisteredChannels 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatPage_execGetRegisteredChannels_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatPage.AcceptsInput 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_ChatPage_execAcceptsInput_Parms {
  INT Channel;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatPage.SetChannelFilter 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_ChatPage_execSetChannelFilter_Parms {
  INT Channel;  // 0 80 CPF_Parm
  BITFIELD acceptingInput : 1;  // 4 80 CPF_Parm
};


//  HUD_ChatPage.ResetText 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_ChatPage_execResetText_Parms {
};


//  HUD_ChatPage.SetChatSource 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatPage_execSetChatSource_Parms {
  class UHUD_Chat* aSource;  // 0 80 CPF_Parm
};


//  HUD_ChatPage.GetWindow 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_ChatPage_execGetWindow_Parms {
  class UGUI_Window* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_ChatPage.ChangeWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatPage_eventChangeWindow_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  HUD_ChatPage.OnComponentDestroyed 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatPage_eventOnComponentDestroyed_Parms {
};


//  HUD_ChatPage.AddMessage 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_ChatPage_execAddMessage_Parms {
  class FString aMessage;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT aChannel;  // 8 80 CPF_Parm
};


//  HUD_ChatPage.SetFontSize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatPage_eventSetFontSize_Parms {
  INT FontSize;  // 0 80 CPF_Parm
};


//  HUD_ChatPage.AddText 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatPage_eventAddText_Parms {
  class FString Text;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  HUD_ChatPage.AdjustTextCtrlDimensions 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatPage_eventAdjustTextCtrlDimensions_Parms {
  FLOAT X;  // 0 80 CPF_Parm
  FLOAT Y;  // 4 80 CPF_Parm
  FLOAT width;  // 8 80 CPF_Parm
  FLOAT Height;  // C 80 CPF_Parm
};


//  HUD_ChatPage.WindowClosed 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatPage_eventWindowClosed_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  HUD_ChatPage.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_ChatPage_eventInitialize_Parms {
};


// UHUD_ChatPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ChatPage : public UGUI_Page {
  public:
    class UGUI_TextCtrl* mTextCtrl;  // 2E4 0
    INT mScrollDown;  // 2E8 0
    class UGUI_Page* mTextCtrlContainer;  // 2EC 0
    class UHUD_Chat* mChatMessagesSource;  // 2F0 0
    INT mRegisteredChannels;  // 2F4 0
    class UGUI_Window* mCurrentAssignedWindow;  // 2F8 0
    INT mLastUsedChannel;  // 2FC 0
    INT mFontSize;  // 300 0
    class FString mTitle;  // 304 400000 CPF_NeedCtorLink
    BITFIELD mIsWindowed : 1;  // 30C 0
    struct FScriptDelegate __OnMessageReceived__Delegate;  // 310 400000 CPF_NeedCtorLink
    virtual ~UHUD_ChatPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void DrawComponent(class UGUI_Component *,class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_ChatPage(class UHUD_ChatPage const &);
    UHUD_ChatPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ChatPage & operator=(class UHUD_ChatPage const &);
    bool AcceptsInput(int)const ;
    void AddMessage(int,class FString const &);
    static void CDECL InternalConstructor(void *);
    void ResetText(void);
    void SetChannelFilter(int,bool);
    static class UClass * CDECL StaticClass(void);
    void delegateOnMessageReceived(class UHUD_ChatPage *,class FString const &);
    void eventAddText(class FString const &);
    void eventAdjustTextCtrlDimensions(float,float,float,float);
    void eventChangeWindow(class UGUI_Window *);
    void eventSetFontSize(int);
    void eventWindowClosed(class UGUI_Window *);
    void execAcceptsInput(struct FFrame &,void * const);
    void execAddMessage(struct FFrame &,void * const);
    void execResetText(struct FFrame &,void * const);
    void execSetChannelFilter(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_ChatPage,0,execAcceptsInput)
AUTOGENERATE_FUNCTION(UHUD_ChatPage,0,execAddMessage)
AUTOGENERATE_FUNCTION(UHUD_ChatPage,0,execResetText)
AUTOGENERATE_FUNCTION(UHUD_ChatPage,0,execSetChannelFilter)


//------------------------------------------------------------------------------
//  HUD_Chat
//------------------------------------------------------------------------------

#define UCONST_HUD_Chat_HD_TOTAL_CHANNEL_COUNT  8
#define UCONST_HUD_Chat_HD_FILTERABLE_CHANNEL_COUNT  8
#define UCONST_HUD_Chat_HD_SELECTABLE_CHANNEL_COUNT  6
#define UCONST_HUD_Chat_HD_CHAT_PAGE_WIDTH_REDUCTION  43
#define UCONST_HUD_Chat_HD_CHAT_PAGE_X_OFFSET  40
#define UCONST_HUD_Chat_HD_OPTION_BUTTON_COUNT  3
#define UCONST_HUD_Chat_HD_MAX_CHAT_PAGES  4
#define UCONST_HUD_Chat_HD_OUTPUT_PAGE_COUNT  8
#define UCONST_HUD_Chat_HD_MAX_VANISH_TIME  0.25
#define UCONST_HUD_Chat_HD_MAX_FADE_TIME  0.25
// FChatSetting 0 ( )
struct DLL_IMPORT FChatSetting {
  public:
    class FString Title;  // 0 400000 CPF_NeedCtorLink
    INT FontSize;  // 8 0
    INT FilterFlags;  // C 0
    BITFIELD Windowed : 1;  // 10 0
    FLOAT Left;  // 14 0
    FLOAT top;  // 18 0
    FLOAT width;  // 1C 0
    FLOAT Height;  // 20 0
    BITFIELD HasFadeOut : 1;  // 24 0
    FChatSetting(struct FChatSetting const &);
    FChatSetting(void);
    ~FChatSetting(void);
    struct FChatSetting & operator=(struct FChatSetting const &);
};

//  HUD_Chat.MBClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execMBClickHandler_Parms {
  class UGUI_MessageBox* messageBox;  // 0 80 CPF_Parm
  INT boxTag;  // 4 80 CPF_Parm
  INT buttonTag;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.GetActiveChatPage 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execGetActiveChatPage_Parms {
  class UHUD_ChatPage* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.LayoutChannelButtons 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execLayoutChannelButtons_Parms {
};


//  HUD_Chat.InitChannelButtons 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execInitChannelButtons_Parms {
};


//  HUD_Chat.ChangeTabTextColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execChangeTabTextColor_Parms {
  class UHUD_ChatPage* aPage;  // 0 80 CPF_Parm
  class FString Text;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  HUD_Chat.DeregisterChatPage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventDeregisterChatPage_Parms {
  class UHUD_ChatPage* aPage;  // 0 80 CPF_Parm
};


//  HUD_Chat.OnChatPageUndock 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execOnChatPageUndock_Parms {
  class UGUI_TabCtrl* aSource;  // 0 80 CPF_Parm
  class UGUI_Window* NewOwner;  // 4 80 CPF_Parm
  class UGUI_Page* undockedPage;  // 8 80 CPF_Parm
};


//  HUD_Chat.OnChatPageDock 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execOnChatPageDock_Parms {
  class UGUI_TabCtrl* aSource;  // 0 80 CPF_Parm
  class UGUI_Page* aPage;  // 4 80 CPF_Parm
};


//  HUD_Chat.OnScroll 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventOnScroll_Parms {
  BITFIELD scrollIn : 1;  // 0 80 CPF_Parm
};


//  HUD_Chat.ChangeChatTitle 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventChangeChatTitle_Parms {
  class FString aTitle;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  HUD_Chat.ChangeFontSize 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execChangeFontSize_Parms {
  class UGUI_TextButton* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.ChangeFilterSetting 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execChangeFilterSetting_Parms {
  class UGUI_TextButton* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.CreateChatTab 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventCreateChatTab_Parms {
  class FString aName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString ClassName;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class UHUD_ChatPage* ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.CreateChatWindow 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execCreateChatWindow_Parms {
  class FString aTitle;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT aLeft;  // 8 80 CPF_Parm
  INT aTop;  // C 80 CPF_Parm
  INT aWidth;  // 10 80 CPF_Parm
  INT aHeight;  // 14 80 CPF_Parm
  BITFIELD aHasFadeOut : 1;  // 18 80 CPF_Parm
};


//  HUD_Chat.DestroySelectedTab 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventDestroySelectedTab_Parms {
};


//  HUD_Chat.SelectChatChannel 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execSelectChatChannel_Parms {
  class UHUD_ChatPage* aPage;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.OnTabChanged 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execOnTabChanged_Parms {
  class UGUI_TabCtrl* aSource;  // 0 80 CPF_Parm
  class UGUI_Page* aNewSelectedPage;  // 4 80 CPF_Parm
  class UGUI_Page* aPreviousSelectedPage;  // 8 80 CPF_Parm
};


//  HUD_Chat.ReleaseFocus 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventReleaseFocus_Parms {
};


//  HUD_Chat.ProcessInput 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execProcessInput_Parms {
  class FString Text;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT Channel;  // 8 80 CPF_Parm
};


//  HUD_Chat.EnterHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execEnterHandler_Parms {
  class UGUI_EditBox* editBox;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.SelectChatPage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventSelectChatPage_Parms {
  INT Channel;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.HandleKeyEvent 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventHandleKeyEvent_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
  BYTE Key;  // 4 180 CPF_Parm CPF_OutParm
  BYTE State;  // 5 180 CPF_Parm CPF_OutParm
  FLOAT delta;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.HandleKeyType 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventHandleKeyType_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
  BYTE keyCode;  // 4 180 CPF_Parm CPF_OutParm
  class FString Unicode;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.ChangeChannel 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventChangeChannel_Parms {
  INT aChannel;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.OnChannelButtonClick 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execOnChannelButtonClick_Parms {
  class UGUI_Component* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.BeginSlashChatMessageEntry 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execBeginSlashChatMessageEntry_Parms {
};


//  HUD_Chat.BeginChatMessageEntry 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execBeginChatMessageEntry_Parms {
  class FString aMessage;  // 0 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  HUD_Chat.SetWhisperTarget 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventSetWhisperTarget_Parms {
  class FString aTarget;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  HUD_Chat.HandleMessage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventHandleMessage_Parms {
  class FString sender;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString Message;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  INT Channel;  // 10 80 CPF_Parm
};


//  HUD_Chat.OutputMessage 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_Chat_execOutputMessage_Parms {
  class FString Text;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT Channel;  // 8 80 CPF_Parm
};


//  HUD_Chat.AddChatMessage 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_Chat_execAddChatMessage_Parms {
  class FString sender;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString Text;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  INT Channel;  // 10 80 CPF_Parm
};


//  HUD_Chat.SaveChatSettings 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_Chat_execSaveChatSettings_Parms {
};


//  HUD_Chat.ToggleLockPosition 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execToggleLockPosition_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.ToggleProfanityFilter 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execToggleProfanityFilter_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.ChannelMenuClicked 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execChannelMenuClicked_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.ToggleFadeOut 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execToggleFadeOut_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.ShowChatWindows 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execShowChatWindows_Parms {
};


//  HUD_Chat.CreateChatWindows 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execCreateChatWindows_Parms {
};


//  HUD_Chat.CreateChatTabs 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execCreateChatTabs_Parms {
};


//  HUD_Chat.InitializeMenu 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventInitializeMenu_Parms {
  class UGUI_Menu* Menu;  // 0 80 CPF_Parm
};


//  HUD_Chat.SystemClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execSystemClickHandler_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.Flush 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventFlush_Parms {
};


//  HUD_Chat.TryCloseWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventTryCloseWindow_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Chat.OnLogin 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Chat_execOnLogin_Parms {
};


//  HUD_Chat.OnComponentDestroyed 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventOnComponentDestroyed_Parms {
};


//  HUD_Chat.SetDelegates 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventSetDelegates_Parms {
};


//  HUD_Chat.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Chat_eventInitialize_Parms {
};


// UHUD_Chat 401E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UHUD_Chat : public UGUI_Window {
  public:
    class UGUI_Menu* mEmoteWindow;  // 37C 0
    class FString mEmoteWindowFile;  // 380 444000 CPF_Config CPF_GlobalConfig CPF_NeedCtorLink
    INT mMaxBacklogLength;  // 388 44000 CPF_Config CPF_GlobalConfig
    INT mMaxUserHistoryLength;  // 38C 44000 CPF_Config CPF_GlobalConfig
    BITFIELD mDisplayChannelInMessage : 1;  // 390 44000 CPF_Config CPF_GlobalConfig
    BITFIELD mDisplayTimeInMessage : 1;  // 390 44000 CPF_Config CPF_GlobalConfig
    BITFIELD mAutoSelectOutputPage : 1;  // 390 44000 CPF_Config CPF_GlobalConfig
    BITFIELD mAutoSelectOutputChannel : 1;  // 390 44000 CPF_Config CPF_GlobalConfig
    BITFIELD mHasFadeOut : 1;  // 390 44000 CPF_Config CPF_GlobalConfig
    BITFIELD mHasProfanityFilter : 1;  // 390 44000 CPF_Config CPF_GlobalConfig
    TArray<struct FChatSetting> mChatSettings;  // 394 444000 CPF_Config CPF_GlobalConfig CPF_NeedCtorLink
    BITFIELD mIsPositionLocked : 1;  // 3A0 0
    class UGUI_Image* mOrnament;  // 3A4 0
    class UGUI_TabCtrl* mTabCtrl;  // 3A8 0
    class UGUI_EditBox* mEditBox;  // 3AC 0
    class UGUI_Page* mTabScrollPage;  // 3B0 0
    class UGUI_Page* mEditBoxScrollPage;  // 3B4 0
    class UGUI_Page* mChatIconPage;  // 3B8 0
    class UGUI_Page* mBackbarPage;  // 3BC 0
    class UGUI_Button* mChannelButtons[6];  // 3C0 0
    class FString mChannelNames[8];  // 3D8 400000 CPF_NeedCtorLink
    class FColor mChannelColors[8];  // 418 0
    class UGUI_Button* mChannelSelection;  // 438 0
    TArray<class UHUD_ChatPage*> mChatPages;  // 43C 400000 CPF_NeedCtorLink
    class FColor mDefaultMessageColor;  // 448 0
    FLOAT mFadeTimer;  // 44C 0
    FLOAT mVanishTimer;  // 450 0
    class FString mCurrentWhisperTarget;  // 454 400000 CPF_NeedCtorLink
    class UGUI_TextButton* mCreateTabMenuButton;  // 45C 0
    class UGUI_TextButton* mRemoveTabMenuButton;  // 460 0
    class UGUI_Menu* mChannelFilterMenu;  // 464 0
    class UGUI_Menu* mFontSizeMenu;  // 468 0
    BITFIELD mIsUpdatingText : 1;  // 46C 0
    class UHUD_ChatConsoleManager* mConsoleManager;  // 470 0
    INT mMoveDirection;  // 474 0
    class UGUI_Button* mSystemButton;  // 478 0
    class UGUI_TextButton* mLockMenuButton;  // 47C 0
    INT mChatData;  // 480 800000 CPF_Unk_00800000
    virtual ~UHUD_Chat(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_Chat(class UHUD_Chat const &);
    UHUD_Chat(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Chat & operator=(class UHUD_Chat const &);
    void AddChatMessage(class FString const &,class FString const &,int);
    void AddUserOutput(class FString const &);
    class FString FilterProfanity(class FString const &);
    class FString GetUserOutput(int const &);
    int GetUserOutputIndex(void);
    static void CDECL InternalConstructor(void *);
    bool IsMouseInHotspot(void);
    void OutputMessage(class FString const &,int);
    void SaveChatSettings(void);
    void SetUserOutputIndex(int const &);
    static class UClass * CDECL StaticClass(void);
    unsigned long eventChangeChannel(int);
    void eventChangeChatTitle(class FString const &);
    class UHUD_ChatPage * eventCreateChatTab(class FString const &,class FString const &);
    void eventDeregisterChatPage(class UHUD_ChatPage *);
    void eventDestroySelectedTab(void);
    unsigned long eventHandleKeyEvent(class UGUI_Component *,unsigned char &,unsigned char &,float);
    unsigned long eventHandleKeyType(class UGUI_Component *,unsigned char &,class FString const &);
    void eventHandleMessage(class FString const &,class FString const &,int);
    void eventOnScroll(unsigned long);
    void eventReleaseFocus(void);
    unsigned long eventSelectChatPage(int);
    void eventSetWhisperTarget(class FString const &);
    void execAddChatMessage(struct FFrame &,void * const);
    void execOutputMessage(struct FFrame &,void * const);
    void execSaveChatSettings(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_Chat,0,execAddChatMessage)
AUTOGENERATE_FUNCTION(UHUD_Chat,0,execOutputMessage)
AUTOGENERATE_FUNCTION(UHUD_Chat,0,execSaveChatSettings)


//------------------------------------------------------------------------------
//  HUD_TimerWindow
//------------------------------------------------------------------------------

#define UCONST_HUD_TimerWindow_HTW_FADEOUT_TIME  1
#define UCONST_HUD_TimerWindow_HTW_FADEIN_TIME  0.5
#define UCONST_HUD_TimerWindow_HTW_TIMERLABELOFFSET  4
#define UCONST_HUD_TimerWindow_HTW_TIMERLABELHEIGHT  26
#define UCONST_HUD_TimerWindow_HTW_TIMERLABELWIDTH  52
#define UCONST_HUD_TimerWindow_HTW_TITLEBARHEIGHT  25
enum ESortingTypes {
  ESO_Expiration = 0,
  ESO_Creation = 1
};

enum ETimerTypes {
  ETI_Quest = 0
};

// FHUDQuestTimer 0 ( )
struct DLL_IMPORT FHUDQuestTimer {
  public:
    class UQuest_Type* quest;  // 0 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    INT TargetIndex;  // 4 0
    INT TimerID;  // 8 0
    INT GoalTime;  // C 0
    INT PreviousProgress;  // 10 0
    struct FHUDQuestTimer & operator=(struct FHUDQuestTimer const &);
};

// FOnScreenTimer 0 ( )
struct DLL_IMPORT FOnScreenTimer {
  public:
    class UGUI_Label* TimerLabel;  // 0 0
    BYTE TimerType;  // 4 0
    FLOAT Time;  // 8 0
    FLOAT CreationTime;  // C 0
    INT TimerID;  // 10 0
    BITFIELD Active : 1;  // 14 0
    struct FOnScreenTimer & operator=(struct FOnScreenTimer const &);
};

//  HUD_TimerWindow.CreateQuestTimer 40002 0 ( FUNC_Defined FUNC_Private )
struct UHUD_TimerWindow_execCreateQuestTimer_Parms {
  class UQuest_Type* aQuest;  // 0 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
  INT aTargetNr;  // 4 80 CPF_Parm
  INT aProgress;  // 8 80 CPF_Parm
};


//  HUD_TimerWindow.UpdateQuestTimers 40002 0 ( FUNC_Defined FUNC_Private )
struct UHUD_TimerWindow_execUpdateQuestTimers_Parms {
};


//  HUD_TimerWindow.UpdateOnScreenTimer 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_TimerWindow_execUpdateOnScreenTimer_Parms {
  INT aTimerID;  // 0 80 CPF_Parm
  FLOAT aTime;  // 4 80 CPF_Parm
  class FString aTooltipText;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  HUD_TimerWindow.CreateOnScreenTimer 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_TimerWindow_execCreateOnScreenTimer_Parms {
  FLOAT aTime;  // 0 80 CPF_Parm
  BYTE aTimerType;  // 4 80 CPF_Parm
  class FString aTooltipText;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_TimerWindow.FormatTimeText 40002 0 ( FUNC_Defined FUNC_Private )
struct UHUD_TimerWindow_execFormatTimeText_Parms {
  INT aTime;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  HUD_TimerWindow.TickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_TimerWindow_execTickHandler_Parms {
  FLOAT aDeltaTime;  // 0 80 CPF_Parm
};


//  HUD_TimerWindow.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_TimerWindow_eventDoShowWindow_Parms {
  INT flags;  // 0 80 CPF_Parm
};


//  HUD_TimerWindow.SetSortByExpriationTime 40002 0 ( FUNC_Defined FUNC_Private )
struct UHUD_TimerWindow_execSetSortByExpriationTime_Parms {
  class UGUI_Component* aClickedComponent;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_TimerWindow.SetSortByCreationTime 40002 0 ( FUNC_Defined FUNC_Private )
struct UHUD_TimerWindow_execSetSortByCreationTime_Parms {
  class UGUI_Component* aClickedComponent;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_TimerWindow.InitializeMenu 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_TimerWindow_eventInitializeMenu_Parms {
  class UGUI_Menu* Menu;  // 0 80 CPF_Parm
};


//  HUD_TimerWindow.SystemClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_TimerWindow_execSystemClickHandler_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_TimerWindow.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_TimerWindow_execInitialize_Parms {
};


//  HUD_TimerWindow.SortTimers 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_TimerWindow_execSortTimers_Parms {
};


// UHUD_TimerWindow 401E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UHUD_TimerWindow : public UGUI_Window {
  public:
    class UGUI_Button* mSystemButton;  // 37C 0
    TArray<struct FOnScreenTimer> OnScreenTimers;  // 380 400000 CPF_NeedCtorLink
    TArray<struct FHUDQuestTimer> QuestTimers;  // 38C 400000 CPF_NeedCtorLink
    BYTE Sorting;  // 398 0
    INT CurrentTimerID;  // 39C 0
    FLOAT InternalTimer;  // 3A0 0
    FLOAT NextUpdateTime;  // 3A4 0
    class UGUI_Page* TimerPage;  // 3A8 0
    class FColor TimerColor;  // 3AC 0
    class FColor TimerColorWarning1;  // 3B0 0
    class FColor TimerColorWarning2;  // 3B4 0
    virtual ~UHUD_TimerWindow(void);
    virtual unsigned int GetCPPSize(void);
  private:
    virtual void SortTimers(void);
  public:
    UHUD_TimerWindow(class UHUD_TimerWindow const &);
    UHUD_TimerWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_TimerWindow & operator=(class UHUD_TimerWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execSortTimers(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_TimerWindow,0,execSortTimers)


//------------------------------------------------------------------------------
//  HUD_Timer
//------------------------------------------------------------------------------

// UHUD_Timer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Timer : public UGUI_Page {
  public:
    char Unknown0[60];
    virtual ~UHUD_Timer(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_Timer(class UHUD_Timer const &);
    UHUD_Timer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Timer & operator=(class UHUD_Timer const &);
    static void CDECL InternalConstructor(void *);
    void SetText(bool);
    static class UClass * CDECL StaticClass(void);
    void delegateOnTimerEnd(void);
    void execSetText(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_Timer,0,execSetText)


//------------------------------------------------------------------------------
//  HUD_Progress
//------------------------------------------------------------------------------

// UHUD_Progress 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Progress : public UGUI_Window {
  public:
    char Unknown0[556];
    virtual ~UHUD_Progress(void);
    virtual unsigned int GetCPPSize(void);
  protected:
    virtual void Tick(float);
  public:
    UHUD_Progress(class UHUD_Progress const &);
    UHUD_Progress(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Progress & operator=(class UHUD_Progress const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_BodySlotWindow
//------------------------------------------------------------------------------

// UHUD_BodySlotWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_BodySlotWindow : public UGUI_Window {
  public:
    char Unknown0[112];
    virtual ~UHUD_BodySlotWindow(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_BodySlotWindow(class UHUD_BodySlotWindow const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_BodySlotWindow & operator=(class UHUD_BodySlotWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    class UMaterial * eventGetPetControlTexture(int);
    void eventUpdateShortCutKeys(void);
  protected:
    UHUD_BodySlotWindow(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_Window
//------------------------------------------------------------------------------

// UHUD_CC_Window 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_Window : public UGUI_Window {
  public:
    char Unknown0[68];
    virtual ~UHUD_CC_Window(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_CC_Window(class UHUD_CC_Window const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_Window & operator=(class UHUD_CC_Window const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_CC_Window(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_CreateCharacter
//------------------------------------------------------------------------------

// UHUD_CC_CreateCharacter 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_CreateCharacter : public UHUD_CC_Window {
  public:
    char Unknown0[80];
    virtual ~UHUD_CC_CreateCharacter(void);
    virtual unsigned int GetCPPSize(void);
    virtual void SetVisible(bool);
    UHUD_CC_CreateCharacter(class UHUD_CC_CreateCharacter const &);
    UHUD_CC_CreateCharacter(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_CreateCharacter & operator=(class UHUD_CC_CreateCharacter const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnCompletion(void);
    unsigned long delegateOnPreviousStage(class UGUI_Component *);
    void execIsValidName(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_CC_CreateCharacter,0,execIsValidName)


//------------------------------------------------------------------------------
//  HUD_CC_Option
//------------------------------------------------------------------------------

// UHUD_CC_Option 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_Option : public UGUI_Page {
  public:
    char Unknown0[148];
    virtual ~UHUD_CC_Option(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_CC_Option(class UHUD_CC_Option const &);
    UHUD_CC_Option(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_Option & operator=(class UHUD_CC_Option const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnButton(class UHUD_CC_Option *);
    class UTexture * delegateOnGetPalette(int,class UHUD_CC_Option *);
    void delegateOnLeft(class UHUD_CC_Option *);
    void delegateOnMirror(class UHUD_CC_Option *,int);
    void delegateOnNext(class UHUD_CC_Option *,int);
    void delegateOnOpenPicker(class UHUD_CC_Option *,int);
    void delegateOnRight(class UHUD_CC_Option *);
    void delegateOnSetColor(class UHUD_CC_Option *,int,unsigned char);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_AllColors
//------------------------------------------------------------------------------

// UHUD_CC_AllColors 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_AllColors : public UHUD_CC_Option {
  public:
    virtual ~UHUD_CC_AllColors(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_CC_AllColors(class UHUD_CC_AllColors const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_AllColors & operator=(class UHUD_CC_AllColors const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_CC_AllColors(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_ItemInfo
//------------------------------------------------------------------------------

// UHUD_CC_ItemInfo 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_ItemInfo : public UHUD_CC_Window {
  public:
    char Unknown0[36];
    virtual ~UHUD_CC_ItemInfo(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_CC_ItemInfo(class UHUD_CC_ItemInfo const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_ItemInfo & operator=(class UHUD_CC_ItemInfo const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_CC_ItemInfo(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_ContextWindow
//------------------------------------------------------------------------------

//  GUI_ContextWindow.CloseMenu 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_ContextWindow_eventCloseMenu_Parms {
};


//  GUI_ContextWindow.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_ContextWindow_eventInitialize_Parms {
};


// UGUI_ContextWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_ContextWindow : public UGUI_Window {
  public:
    class UGUI_Component* mWatchedComponent;  // 37C 0
    class UGUI_Component* mWatchedChild;  // 380 0
    virtual ~UGUI_ContextWindow(void);
    virtual unsigned int GetCPPSize(void);
    UGUI_ContextWindow(class UGUI_ContextWindow const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ContextWindow & operator=(class UGUI_ContextWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventCloseMenu(void);
  protected:
    UGUI_ContextWindow(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_ColorPicker
//------------------------------------------------------------------------------

// UHUD_CC_ColorPicker 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_ColorPicker : public UGUI_ContextWindow {
  public:
    char Unknown0[32];
    virtual ~UHUD_CC_ColorPicker(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual bool WhileMouseDown(float,float,int,int,class UGUI_Component *);
    virtual void ComponentClick(class UGUI_Component *,bool);
    UHUD_CC_ColorPicker(class UHUD_CC_ColorPicker const &);
    UHUD_CC_ColorPicker(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_ColorPicker & operator=(class UHUD_CC_ColorPicker const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnClose(void);
    void delegateOnColorClicked(class UHUD_CC_ColorPicker *,unsigned char);
    void execGetColorRGB(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_CC_ColorPicker,0,execGetColorRGB)


//------------------------------------------------------------------------------
//  HUD_SkillBookPage
//------------------------------------------------------------------------------

// UHUD_SkillBookPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SkillBookPage : public UGED_ObjectPage {
  public:
    char Unknown0[60];
    virtual ~UHUD_SkillBookPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    UHUD_SkillBookPage(class UHUD_SkillBookPage const &);
    UHUD_SkillBookPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_SkillBookPage & operator=(class UHUD_SkillBookPage const &);
    void InitializePage(class UGED_Editor *);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UpdateSlots(void);
    void eventSetChecked(unsigned long);
    void eventUpdateTokenSlotsMaterial(void);
    void execInitializePage(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_SkillBookPage,0,execInitializePage)


//------------------------------------------------------------------------------
//  HUD_CC_SkillButton
//------------------------------------------------------------------------------

// UHUD_CC_SkillButton 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_SkillButton : public UHUD_SkillBookPage {
  public:
    char Unknown0[12];
    virtual ~UHUD_CC_SkillButton(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_CC_SkillButton(class UHUD_CC_SkillButton const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_SkillButton & operator=(class UHUD_CC_SkillButton const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long delegateOnCheck(class UHUD_CC_SkillButton *,unsigned long);
  protected:
    UHUD_CC_SkillButton(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_Navigation
//------------------------------------------------------------------------------

// UHUD_CC_Navigation 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_Navigation : public UGUI_Window {
  public:
    char Unknown0[84];
    virtual ~UHUD_CC_Navigation(void);
    virtual unsigned int GetCPPSize(void);
    virtual void SetVisible(bool);
    UHUD_CC_Navigation(class UHUD_CC_Navigation const &);
    UHUD_CC_Navigation(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_Navigation & operator=(class UHUD_CC_Navigation const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnButtonGroupChanged(int);
    void delegateOnSubButtonSelected(class UGUI_Button *);
    void execAddButton(struct FFrame &,void * const);
    void execGetButton(struct FFrame &,void * const);
    void execGetButtonIndex(struct FFrame &,void * const);
    void execGetSubButtonCount(struct FFrame &,void * const);
    void execSetButtonGroupVisibilty(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_CC_Navigation,0,execAddButton)
AUTOGENERATE_FUNCTION(UHUD_CC_Navigation,0,execGetButton)
AUTOGENERATE_FUNCTION(UHUD_CC_Navigation,0,execGetButtonIndex)
AUTOGENERATE_FUNCTION(UHUD_CC_Navigation,0,execGetSubButtonCount)
AUTOGENERATE_FUNCTION(UHUD_CC_Navigation,0,execSetButtonGroupVisibilty)


//------------------------------------------------------------------------------
//  HUD_CC_ClassSelectionWindow
//------------------------------------------------------------------------------

// UHUD_CC_ClassSelectionWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_ClassSelectionWindow : public UGUI_Window {
  public:
    char Unknown0[84];
    virtual ~UHUD_CC_ClassSelectionWindow(void);
    virtual unsigned int GetCPPSize(void);
    virtual void SetVisible(bool);
    UHUD_CC_ClassSelectionWindow(class UHUD_CC_ClassSelectionWindow const &);
    UHUD_CC_ClassSelectionWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_ClassSelectionWindow & operator=(class UHUD_CC_ClassSelectionWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnClassChanged(unsigned char);
    void eventShowInfoWindows(int);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_WeaponSelection
//------------------------------------------------------------------------------

// UHUD_CC_WeaponSelection 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_WeaponSelection : public UGUI_Page {
  public:
    char Unknown0[40];
    virtual ~UHUD_CC_WeaponSelection(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_CC_WeaponSelection(class UHUD_CC_WeaponSelection const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_WeaponSelection & operator=(class UHUD_CC_WeaponSelection const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnSelectionChanged(class UStaticMesh *,class FString const &,int);
  protected:
    UHUD_CC_WeaponSelection(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_ShieldSelection
//------------------------------------------------------------------------------

// UHUD_CC_ShieldSelection 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_ShieldSelection : public UHUD_CC_WeaponSelection {
  public:
    char Unknown0[12];
    virtual ~UHUD_CC_ShieldSelection(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_CC_ShieldSelection(class UHUD_CC_ShieldSelection const &);
    UHUD_CC_ShieldSelection(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_ShieldSelection & operator=(class UHUD_CC_ShieldSelection const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_Armour
//------------------------------------------------------------------------------

// UHUD_CC_Armour 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_Armour : public UHUD_CC_Window {
  public:
    virtual ~UHUD_CC_Armour(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_CC_Armour(class UHUD_CC_Armour const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_Armour & operator=(class UHUD_CC_Armour const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_CC_Armour(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CC_Main
//------------------------------------------------------------------------------

// UHUD_CC_Main 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CC_Main : public UGUI_Window {
  public:
    char Unknown0[40];
    virtual ~UHUD_CC_Main(void);
    virtual unsigned int GetCPPSize(void);
    virtual void SetVisible(bool);
    UHUD_CC_Main(class UHUD_CC_Main const &);
    UHUD_CC_Main(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CC_Main & operator=(class UHUD_CC_Main const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventResetValues(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_UniverseSelection
//------------------------------------------------------------------------------

// UHUD_UniverseSelection 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_UniverseSelection : public UGUI_Window {
  public:
    char Unknown0[32];
    virtual ~UHUD_UniverseSelection(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_UniverseSelection(class UHUD_UniverseSelection const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_UniverseSelection & operator=(class UHUD_UniverseSelection const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long eventHandleKeyEvent(class UGUI_Component *,unsigned char &,unsigned char &,float);
    void execPacketResult2UniverseSelectionResult(struct FFrame &,void * const);
  protected:
    UHUD_UniverseSelection(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_UniverseSelection,0,execPacketResult2UniverseSelectionResult)


//------------------------------------------------------------------------------
//  HUD_NDAWindow
//------------------------------------------------------------------------------

#define UCONST_HUD_NDAWindow_MAX_WIDTH  680
//  HUD_NDAWindow.ResolutionChanged 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_NDAWindow_eventResolutionChanged_Parms {
  INT ResX;  // 0 80 CPF_Parm
  INT ResY;  // 4 80 CPF_Parm
};


//  HUD_NDAWindow.ClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_NDAWindow_execClickHandler_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_NDAWindow.OnUpdate 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_NDAWindow_execOnUpdate_Parms {
  INT intParam;  // 0 90 CPF_OptionalParm CPF_Parm
  class UObject* objParam;  // 4 90 CPF_OptionalParm CPF_Parm
  class FString stringParam;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  INT intParam2;  // 10 90 CPF_OptionalParm CPF_Parm
};


//  HUD_NDAWindow.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_NDAWindow_eventDoShowWindow_Parms {
  INT flags;  // 0 80 CPF_Parm
};


//  HUD_NDAWindow.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_NDAWindow_eventInitialize_Parms {
};


//  HUD_NDAWindow.SetAcceptedEULA 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_NDAWindow_execSetAcceptedEULA_Parms {
};


//  HUD_NDAWindow.GetAcceptedEULA 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_NDAWindow_execGetAcceptedEULA_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UHUD_NDAWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_NDAWindow : public UGUI_Window {
  public:
    class UGUI_Page* mTextPage;  // 37C 0
    class UGUI_TextCtrl* mTextCtrl;  // 380 0
    class UGUI_Button* mAcceptButton;  // 384 0
    class UGUI_Button* mDenyButton;  // 388 0
    BITFIELD mHasAcceptedNDA : 1;  // 38C 0
    virtual ~UHUD_NDAWindow(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_NDAWindow(class UHUD_NDAWindow const &);
    UHUD_NDAWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_NDAWindow & operator=(class UHUD_NDAWindow const &);
    class FString GetCurrentPatchVersion(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetAcceptedEULA(struct FFrame &,void * const);
    void execSetAcceptedEULA(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_NDAWindow,0,execGetAcceptedEULA)
AUTOGENERATE_FUNCTION(UHUD_NDAWindow,0,execSetAcceptedEULA)


//------------------------------------------------------------------------------
//  HUD_Login
//------------------------------------------------------------------------------

#define UCONST_HUD_Login_LOGIN_HEIGHT  220
#define UCONST_HUD_Login_LOGIN_WIDTH  401
#define UCONST_HUD_Login_IDC_SM_ACCOUNT_FORCED_FAILED  12
#define UCONST_HUD_Login_IDC_SM_ACCOUNT_LOCKED  11
#define UCONST_HUD_Login_IDC_SM_ACCOUNT_LOCK_STATUS  10
#define UCONST_HUD_Login_IDC_SM_INVALID_PROTOCOL  5
#define UCONST_HUD_Login_IDC_SM_AUTH_TIMEOUT  4
#define UCONST_HUD_Login_IDC_SM_AUTH_FAILED  3
#define UCONST_HUD_Login_IDC_SM_CANCEL  2
#define UCONST_HUD_Login_IDC_SM_LOGIN  1
#define UCONST_HUD_Login_IDC_SM_QUIT  0
enum eLoginRequestResult {
  LRR_NONE = 0,
  LRR_INVALID_REVISION = 1,
  LRR_INVALID_USERNAME = 2,
  LRR_INVALID_PASSWORD = 3,
  LRR_AUTHENTICATE_FAILED = 4,
  LRR_LOGIN_ADD_FAILED = 5,
  LRR_LOGIN_CONNECT_FAILED = 6,
  LRR_INVALID_ACTIVE_CODE = 7,
  LRR_BANNED_ACCOUNT = 8,
  LRR_SUSPENDED_ACCOUNT = 9,
  LRR_DISABLED_ACCOUNT = 10
};

//  HUD_Login.OnComponentDestroyed 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Login_eventOnComponentDestroyed_Parms {
};


//  HUD_Login.HandleKeyEvent 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Login_eventHandleKeyEvent_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
  BYTE Key;  // 4 180 CPF_Parm CPF_OutParm
  BYTE State;  // 5 180 CPF_Parm CPF_OutParm
  FLOAT delta;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Login.EnableInteractiveComponents 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Login_execEnableInteractiveComponents_Parms {
  BITFIELD IsEnabled : 1;  // 0 80 CPF_Parm
};


//  HUD_Login.MBClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Login_execMBClickHandler_Parms {
  class UGUI_MessageBox* messageBox;  // 0 80 CPF_Parm
  INT boxTag;  // 4 80 CPF_Parm
  INT buttonTag;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Login.ClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Login_execClickHandler_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Login.TickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Login_execTickHandler_Parms {
  FLOAT aDeltaTime;  // 0 80 CPF_Parm
};


//  HUD_Login.ResetTimer 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Login_execResetTimer_Parms {
};


//  HUD_Login.InitTimer 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Login_execInitTimer_Parms {
  INT Reason;  // 0 80 CPF_Parm
};


//  HUD_Login.HandleLoginResult 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Login_execHandleLoginResult_Parms {
  BITFIELD aSuccess : 1;  // 0 80 CPF_Parm
  INT aResult;  // 4 80 CPF_Parm
};


//  HUD_Login.OnUpdate 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Login_execOnUpdate_Parms {
  INT intParam;  // 0 90 CPF_OptionalParm CPF_Parm
  class UObject* objParam;  // 4 90 CPF_OptionalParm CPF_Parm
  class FString stringParam;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  INT intParam2;  // 10 90 CPF_OptionalParm CPF_Parm
};


//  HUD_Login.ResolutionChanged 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Login_eventResolutionChanged_Parms {
  INT ResX;  // 0 80 CPF_Parm
  INT ResY;  // 4 80 CPF_Parm
};


//  HUD_Login.ForcedLogout2PacketLogout 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_Login_execForcedLogout2PacketLogout_Parms {
  INT Reason;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Login.PacketResult2LoginResult 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_Login_execPacketResult2LoginResult_Parms {
  INT packetResult;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Login.FormatTimestamp 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_Login_execFormatTimestamp_Parms {
  INT TimeStamp;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  HUD_Login.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Login_eventDoShowWindow_Parms {
  INT flags;  // 0 80 CPF_Parm
};


//  HUD_Login.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Login_eventInitialize_Parms {
};


// UHUD_Login 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Login : public UGUI_Window {
  public:
    class UGUI_Page* mMainPage;  // 37C 0
    class UGUI_Label* mLoginNameLabel;  // 380 0
    class UGUI_EditBox* mLoginName;  // 384 0
    class UGUI_Label* mLoginPwdLabel;  // 388 0
    class UGUI_EditBox* mLoginPwd;  // 38C 0
    class UGUI_Label* mRememberLabel;  // 390 0
    class UGUI_Button* mRememberButton;  // 394 0
    class UGUI_Page* mButtonPage;  // 398 0
    class UGUI_Button* mLoginButton;  // 39C 0
    class UGUI_Button* mQuitButton;  // 3A0 0
    class UGUI_Page* mStatusPage;  // 3A4 0
    class UGUI_Label* mErrorLabel;  // 3A8 0
    class UGUI_Page* mCancelPage;  // 3AC 0
    class UGUI_Button* mCancelButton;  // 3B0 0
    class FString mLastUserName;  // 3B4 444000 CPF_Config CPF_GlobalConfig CPF_NeedCtorLink
    BITFIELD mRememberUserName : 1;  // 3BC 44000 CPF_Config CPF_GlobalConfig
    FLOAT mForcedDisconnectTimer;  // 3C0 0
    INT mForcedDisconnectReason;  // 3C4 0
    virtual ~UHUD_Login(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_Login(class UHUD_Login const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Login & operator=(class UHUD_Login const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long eventHandleKeyEvent(class UGUI_Component *,unsigned char &,unsigned char &,float);
    void execForcedLogout2PacketLogout(struct FFrame &,void * const);
    void execFormatTimestamp(struct FFrame &,void * const);
    void execPacketResult2LoginResult(struct FFrame &,void * const);
  protected:
    UHUD_Login(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_Login,0,execForcedLogout2PacketLogout)
AUTOGENERATE_FUNCTION(UHUD_Login,0,execFormatTimestamp)
AUTOGENERATE_FUNCTION(UHUD_Login,0,execPacketResult2LoginResult)


//------------------------------------------------------------------------------
//  HUD_CharacterSelection
//------------------------------------------------------------------------------

// UHUD_CharacterSelection 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CharacterSelection : public UGUI_Window {
  public:
    char Unknown0[36];
    virtual ~UHUD_CharacterSelection(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_CharacterSelection(class UHUD_CharacterSelection const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CharacterSelection & operator=(class UHUD_CharacterSelection const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_CharacterSelection(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_IterationPage
//------------------------------------------------------------------------------

// UGUI_IterationPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_IterationPage : public UGUI_Page {
  public:
    char Unknown0[56];
    virtual ~UGUI_IterationPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void InitIteration(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void InvalidateFunctionPtrs(void);
    virtual void EvaluateFunctionPointers(void);
    virtual void SetupPage(class GED_CommandList *,class UGED_Editor *);
    virtual void ClearIteration(void);
    virtual bool HasNext(void);
    virtual void ApplyNext(class UGUI_Page *);
    virtual void ClearData(class UGUI_Component *);
    UGUI_IterationPage(class UGUI_IterationPage const &);
    UGUI_IterationPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_IterationPage & operator=(class UGUI_IterationPage const &);
    static void CDECL InternalConstructor(void *);
    void SetLayout(float,float,float,float);
    int Size(void);
    void Sort(int (__cdecl*)(void const *,void const *));
    static class UClass * CDECL StaticClass(void);
    void UpdateIteration(void);
    void execClearIteration(struct FFrame &,void * const);
    void execSetupPage(struct FFrame &,void * const);
    void execSize(struct FFrame &,void * const);
    void execUpdateIteration(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_IterationPage,0,execClearIteration)
AUTOGENERATE_FUNCTION(UGUI_IterationPage,0,execSetupPage)
AUTOGENERATE_FUNCTION(UGUI_IterationPage,0,execSize)
AUTOGENERATE_FUNCTION(UGUI_IterationPage,0,execUpdateIteration)


//------------------------------------------------------------------------------
//  HUD_CharacterIterationPage
//------------------------------------------------------------------------------

// UHUD_CharacterIterationPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CharacterIterationPage : public UGUI_IterationPage {
  public:
    char Unknown0[12];
    virtual ~UHUD_CharacterIterationPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void DrawBackground(class UCanvas *,struct UGUI_Desktop::draw_context &,struct UGUI_BaseDesktop::base_rect<float> *);
    virtual bool HasNext(void);
    virtual void ApplyNext(class UGUI_Page *);
    virtual void InitIteration(void);
    UHUD_CharacterIterationPage(class UHUD_CharacterIterationPage const &);
    UHUD_CharacterIterationPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CharacterIterationPage & operator=(class UHUD_CharacterIterationPage const &);
    class UGED_PawnPage * GetPawnPage(class ACharacter_Pawn *);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetPawnPage(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_CharacterIterationPage,0,execGetPawnPage)


//------------------------------------------------------------------------------
//  HUD_WorldMap
//------------------------------------------------------------------------------

// UHUD_WorldMap 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_WorldMap : public UGUI_Window {
  public:
    char Unknown0[76];
    virtual ~UHUD_WorldMap(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(void);
    virtual void Shutdown(void);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_WorldMap(class UHUD_WorldMap const &);
    UHUD_WorldMap(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_WorldMap & operator=(class UHUD_WorldMap const &);
    void AdjustImages(void);
    class FColor GetColorAtIndex(class UTexture *,int);
    static void CDECL InternalConstructor(void *);
    bool IsInArea(float,float,class UGUI_ImageX *);
    bool LoadMap(class FString const &);
    static class UClass * CDECL StaticClass(void);
    void ToggleAreas(void);
    void ToggleRegion(class UGUI_ImageX *);
    void execLoadMap(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_WorldMap,0,execLoadMap)


//------------------------------------------------------------------------------
//  HUD_Minimap
//------------------------------------------------------------------------------

#define UCONST_HUD_Minimap_ZOOM_TIME_TO_TARGET  0.5f
#define UCONST_HUD_Minimap_CLAMP_MAX_ZOOM_STEP  2
#define UCONST_HUD_Minimap_CLAMP_MIN_ZOOM_STEP  -4
#define UCONST_HUD_Minimap_MAP_OFFSET_Y  39
#define UCONST_HUD_Minimap_MAP_OFFSET_X  29
#define UCONST_HUD_Minimap_ZOOM_OUT_OFFSET_Y  150
#define UCONST_HUD_Minimap_ZOOM_OUT_OFFSET_X  113
#define UCONST_HUD_Minimap_ZOOM_IN_OFFSET_Y  128
#define UCONST_HUD_Minimap_ZOOM_IN_OFFSET_X  135
#define UCONST_HUD_Minimap_MINIMAP_MASK_SCALE  1.1
#define UCONST_HUD_Minimap_MAP_VIEWPORT_RADIUS  61
#define UCONST_HUD_Minimap_MAP_VIEWPORT_HEIGHT  122
#define UCONST_HUD_Minimap_MAP_VIEWPORT_WIDTH  122
//  HUD_Minimap.OnScroll 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Minimap_eventOnScroll_Parms {
  BITFIELD scrollIn : 1;  // 0 80 CPF_Parm
};


//  HUD_Minimap.ShowCompassClick 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Minimap_execShowCompassClick_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Minimap.OpenWorldmapClick 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Minimap_execOpenWorldmapClick_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Minimap.ToggleLockClick 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Minimap_execToggleLockClick_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Minimap.UpdateZoomButtonState 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Minimap_eventUpdateZoomButtonState_Parms {
};


//  HUD_Minimap.UpdateCompassButtonState 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Minimap_eventUpdateCompassButtonState_Parms {
};


//  HUD_Minimap.ZoomIn 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Minimap_execZoomIn_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Minimap.ZoomOut 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Minimap_execZoomOut_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Minimap.InitializeMenu 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Minimap_eventInitializeMenu_Parms {
  class UGUI_Menu* Menu;  // 0 80 CPF_Parm
};


//  HUD_Minimap.SystemClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Minimap_execSystemClickHandler_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_Minimap.SetAreaName 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_Minimap_execSetAreaName_Parms {
  class FString aAreaName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  HUD_Minimap.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_Minimap_eventInitialize_Parms {
};


// UHUD_Minimap 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Minimap : public UGUI_Window {
  public:
    class UGUI_Page* mBackgroundPage;  // 37C 0
    class UGUI_Button* mZoomInButton;  // 380 0
    class UGUI_Button* mZoomOutButton;  // 384 0
    class UGUI_Button* mSystemButton;  // 388 0
    class UGUI_TextButton* mLockMenuButton;  // 38C 0
    class UGUI_TextButton* mCompassMenuButton;  // 390 0
    INT mMoveDirection;  // 394 0
    BITFIELD mIsPositionLocked : 1;  // 398 0
    INT mCurrentZoomStep;  // 39C 44000 CPF_Config CPF_GlobalConfig
    FLOAT mCurrentDisplayedZoomStep;  // 3A0 2000000 CPF_EditorData
    FLOAT mCurrentDisplayedZoomScale;  // 3A4 0
    struct FLocalizedString mZoomInHint;  // 3A8 400000 CPF_NeedCtorLink
    struct FLocalizedString mZoomOutHint;  // 3B4 400000 CPF_NeedCtorLink
    class UGUI_Image* mMinimapCompass;  // 3C0 0
    class UGUI_Image* mMinimapNeedle;  // 3C4 0
    class UTexRotator* mRotatedNeedle;  // 3C8 0
    class UGUI_Label* mAreaName;  // 3CC 0
    class UGUI_Image* mMinimapPlayer;  // 3D0 0
    class UTexRotator* mRotatedPlayerArrow;  // 3D4 0
    TArray<class UGUI_Image*> mMinimapDot;  // 3D8 400000 CPF_NeedCtorLink
    TArray<class UShader*> mMapTextures;  // 3E4 2400000 CPF_NeedCtorLink CPF_EditorData
    INT mMapWidthInBlocks;  // 3F0 2000000 CPF_EditorData
    INT mMapHeightInBlocks;  // 3F4 2000000 CPF_EditorData
    BITFIELD mIsMapPresent : 1;  // 3F8 2000000 CPF_EditorData
    BITFIELD mForceCompass : 1;  // 3F8 2000000 CPF_EditorData
    INT mMapBlockSize;  // 3FC 2000000 CPF_EditorData
    INT mMapUnitsPerPixel;  // 400 2000000 CPF_EditorData
    INT mMapUnitsPerMapBlock;  // 404 2000000 CPF_EditorData
    FLOAT mMapMinX;  // 408 2000000 CPF_EditorData
    FLOAT mMapMinY;  // 40C 2000000 CPF_EditorData
    FLOAT mMapMaxX;  // 410 2000000 CPF_EditorData
    FLOAT mMapMaxY;  // 414 2000000 CPF_EditorData
    INT mMapMaxZoomStep;  // 418 0
    INT mMapMinZoomStep;  // 41C 0
    class AZoneInfo* mCurrentZoneInfo;  // 420 0
    class UShader* mMapShader;  // 424 0
    BITFIELD IsInitialized : 1;  // 428 0
    class UTexture* mMinimapMask;  // 42C 0
    TArray<class UGUI_Image*> mDayNightCycleImages;  // 430 400000 CPF_NeedCtorLink
    class FColor mDayNightCycleColor;  // 43C 0
    TArray<class AGame_NPCPawn*> mNPCs;  // 440 400000 CPF_NeedCtorLink
    TArray<class AGame_PlayerPawn*> mPlayers;  // 44C 400000 CPF_NeedCtorLink
    class UGUI_Page* mInCombatPage;  // 458 0
    class UMaterial* mInCombatMaterial;  // 45C 0
    class UClass* EmitterClassProvide;  // 460 0
    class UClass* EmitterClassMid;  // 464 0
    class UClass* EmitterClassFinish;  // 468 0
    virtual ~UHUD_Minimap(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_Minimap(class UHUD_Minimap const &);
    UHUD_Minimap(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Minimap & operator=(class UHUD_Minimap const &);
    float CalculateCurrentZoomScale(float);
    void CheckAndAddPawn(class AGame_PlayerPawn *,class AGame_Pawn *);
    class FVector const ConvertWorldToMapBlockCoords(class FVector const &)const ;
    void DrawActors(class AGame_PlayerPawn *,class UCanvas *,struct UGUI_Desktop::draw_context &);
    void DrawCompass(class AGame_PlayerPawn *,class UCanvas *,struct UGUI_Desktop::draw_context &);
    void DrawDayNightCycle(class AGame_PlayerPawn *,class UCanvas *,struct UGUI_Desktop::draw_context &);
    void DrawMap(class AGame_PlayerPawn *,class UCanvas *,struct UGUI_Desktop::draw_context &);
    void DrawPlayer(class AGame_PlayerPawn *,class UCanvas *,struct UGUI_Desktop::draw_context &);
    class FString GetMapBlockTextureName(class FString,int,int);
    static void CDECL InternalConstructor(void *);
    void RemovePawn(class AGame_Pawn *);
    void SetMapZone(class AZoneInfo *);
    static class UClass * CDECL StaticClass(void);
    void UpdateLock(void);
    void eventOnScroll(unsigned long);
    void eventUpdateCompassButtonState(void);
    void eventUpdateZoomButtonState(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_ResponsePage
//------------------------------------------------------------------------------

// UHUD_ResponsePage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ResponsePage : public UGUI_Page {
  public:
    virtual ~UHUD_ResponsePage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UHUD_ResponsePage(class UHUD_ResponsePage const &);
    UHUD_ResponsePage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ResponsePage & operator=(class UHUD_ResponsePage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_QuestLogPage
//------------------------------------------------------------------------------

// UHUD_QuestLogPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_QuestLogPage : public UGUI_Page {
  public:
    char Unknown0[72];
    virtual ~UHUD_QuestLogPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UHUD_QuestLogPage(class UHUD_QuestLogPage const &);
    UHUD_QuestLogPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_QuestLogPage & operator=(class UHUD_QuestLogPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventUpdateQuest(class UQuest_Type *);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_Conversation
//------------------------------------------------------------------------------

// UHUD_Conversation 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Conversation : public UGUI_Window {
  public:
    char Unknown0[56];
    virtual ~UHUD_Conversation(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UHUD_Conversation(class UHUD_Conversation const &);
    UHUD_Conversation(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Conversation & operator=(class UHUD_Conversation const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_QuestItemPage
//------------------------------------------------------------------------------

// UHUD_QuestItemPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_QuestItemPage : public UGED_ObjectPage {
  public:
    char Unknown0[16];
    virtual ~UHUD_QuestItemPage(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_QuestItemPage(class UHUD_QuestItemPage const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_QuestItemPage & operator=(class UHUD_QuestItemPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_QuestItemPage(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_QuestItemIterationPage
//------------------------------------------------------------------------------

// UHUD_QuestItemIterationPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_QuestItemIterationPage : public UGUI_IterationPage {
  public:
    char Unknown0[16];
    virtual ~UHUD_QuestItemIterationPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool HasNext(void);
    virtual void ApplyNext(class UGUI_Page *);
    virtual void InitIteration(void);
    UHUD_QuestItemIterationPage(class UHUD_QuestItemIterationPage const &);
    UHUD_QuestItemIterationPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_QuestItemIterationPage & operator=(class UHUD_QuestItemIterationPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventAddQuestItem(class UHUD_QuestItem *);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_QuestItem
//------------------------------------------------------------------------------

// UHUD_QuestItem 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UHUD_QuestItem : public UObject {
  public:
    char Unknown0[12];
    virtual ~UHUD_QuestItem(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_QuestItem(class UHUD_QuestItem const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_QuestItem & operator=(class UHUD_QuestItem const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_QuestItem(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_Label
//------------------------------------------------------------------------------

//  GUI_Label.SetTextBorder 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Label_execSetTextBorder_Parms {
  FLOAT Left;  // 0 80 CPF_Parm
  FLOAT top;  // 4 80 CPF_Parm
  FLOAT Right;  // 8 90 CPF_OptionalParm CPF_Parm
  FLOAT Bottom;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Label.SetFontScale 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Label_execSetFontScale_Parms {
  FLOAT scaleX;  // 0 80 CPF_Parm
  FLOAT scaleY;  // 4 80 CPF_Parm
};


//  GUI_Label.GetColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Label_execGetColor_Parms {
  class FColor ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Label.SetColor 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Label_execSetColor_Parms {
  INT R;  // 0 80 CPF_Parm
  INT G;  // 4 80 CPF_Parm
  INT B;  // 8 80 CPF_Parm
  INT A;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Label.SetText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Label_execSetText_Parms {
  class FString Text;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Label.GetFont 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Label_execGetFont_Parms {
  class UFont* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Label.SetFont 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Label_execSetFont_Parms {
  class FString FontName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Label.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Label_eventInitialize_Parms {
};


// UGUI_Label 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Label : public UGUI_Component {
  public:
    INT mLabelStyle;  // 2C8 0
    class UFont* mFont;  // 2CC 2 CPF_Const
    FLOAT mFontScaleX;  // 2D0 0
    FLOAT mFontScaleY;  // 2D4 0
    class FString mText;  // 2D8 400002 CPF_Const CPF_NeedCtorLink
    class FString mDisplayedText;  // 2E0 400002 CPF_Const CPF_NeedCtorLink
    class FColor mColor;  // 2E8 0
    class FColor mShadowColor;  // 2EC 0
    BITFIELD mSelected : 1;  // 2F0 0
    BITFIELD mHovered : 1;  // 2F0 0
    FLOAT mTextBorders[4];  // 2F4 0
    virtual ~UGUI_Label(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void EvaluateFunctionPointers(void);
    virtual void ApplyTextOffsets(struct UGUI_BaseDesktop::base_rect<float> *);
    UGUI_Label(class UGUI_Label const &);
    UGUI_Label(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Label & operator=(class UGUI_Label const &);
    static void CDECL InternalConstructor(void *);
    void SetColor(int,int,int,int);
    void SetFontScale(float,float);
    void SetShadowColor(int,int,int,int);
    void SetText(class FString const &);
    void SetTextBorder(float,float,float,float);
    static class UClass * CDECL StaticClass(void);
    void execGetFont(struct FFrame &,void * const);
    void execSetColor(struct FFrame &,void * const);
    void execSetFont(struct FFrame &,void * const);
    void execSetFontScale(struct FFrame &,void * const);
    void execSetText(struct FFrame &,void * const);
    void execSetTextBorder(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_Label,0,execGetFont)
AUTOGENERATE_FUNCTION(UGUI_Label,0,execSetColor)
AUTOGENERATE_FUNCTION(UGUI_Label,0,execSetFont)
AUTOGENERATE_FUNCTION(UGUI_Label,0,execSetFontScale)
AUTOGENERATE_FUNCTION(UGUI_Label,0,execSetText)
AUTOGENERATE_FUNCTION(UGUI_Label,0,execSetTextBorder)


//------------------------------------------------------------------------------
//  GUI_Button
//------------------------------------------------------------------------------

//  GUI_Button.SetChecked 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Button_execSetChecked_Parms {
  BITFIELD aChecked : 1;  // 0 80 CPF_Parm
};


//  GUI_Button.isChecked 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Button_execisChecked_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Button.IsPressed 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Button_execIsPressed_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Button.SetDisabledColors 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Button_execSetDisabledColors_Parms {
  FLOAT R;  // 0 80 CPF_Parm
  FLOAT G;  // 4 80 CPF_Parm
  FLOAT B;  // 8 80 CPF_Parm
  FLOAT A;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Button.PostDrawHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Button_execPostDrawHandler_Parms {
  class UCanvas* aCanvas;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Button.PlayButtonSound 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Button_eventPlayButtonSound_Parms {
};


//  GUI_Button.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Button_eventInitialize_Parms {
};


//  GUI_Button.OnCheck 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_Button_execOnCheck_Parms {
  class UGUI_Button* clickedButton;  // 0 80 CPF_Parm
  BITFIELD checkState : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UGUI_Button 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Button : public UGUI_Label {
  public:
    INT mButtonStyle;  // 304 0
    class UGUI_Image* mCheckImage;  // 308 0
    FLOAT mEnabledBackgroundColors[4];  // 30C 0
    FLOAT mEnabledTextColors[4];  // 31C 0
    FLOAT mDisabledColors[4];  // 32C 0
    BITFIELD mChecked : 1;  // 33C 0
    struct FScriptDelegate __OnCheck__Delegate;  // 340 400000 CPF_NeedCtorLink
    virtual ~UGUI_Button(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual int GetComponentState(void)const ;
    virtual bool MouseDown(float,float,int,int,class UGUI_Component *);
    virtual void ComponentClick(class UGUI_Component *,bool);
    virtual bool KeyType(unsigned char &,unsigned short);
    virtual bool KeyEvent(unsigned char &,unsigned char &,float);
    virtual void EvaluateFunctionPointers(void);
    virtual void SetProperty(class FString const &,class FString const &);
    virtual void ApplyTextOffsets(struct UGUI_BaseDesktop::base_rect<float> *);
    virtual void ProcessButtonClick(void);
    virtual void SetDisabledColors(float,float,float,float);
    UGUI_Button(class UGUI_Button const &);
    UGUI_Button(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Button & operator=(class UGUI_Button const &);
    static void CDECL InternalConstructor(void *);
    bool IsChecked(void)const ;
    bool IsPressed(void)const ;
    void SetChecked(bool);
    static class UClass * CDECL StaticClass(void);
    unsigned long delegateOnCheck(class UGUI_Button *,unsigned long);
    void eventPlayButtonSound(void);
    void execIsPressed(struct FFrame &,void * const);
    void execSetChecked(struct FFrame &,void * const);
    void execSetDisabledColors(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_Button,0,execIsPressed)
AUTOGENERATE_FUNCTION(UGUI_Button,0,execSetChecked)
AUTOGENERATE_FUNCTION(UGUI_Button,0,execSetDisabledColors)


//------------------------------------------------------------------------------
//  HUD_BaseItemContainer
//------------------------------------------------------------------------------

// UHUD_BaseItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_BaseItemContainer : public UGUI_Button {
  public:
    char Unknown0[24];
    virtual ~UHUD_BaseItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    virtual void ApplyTextOffsets(struct UGUI_BaseDesktop::base_rect<float> *);
    UHUD_BaseItemContainer(class UHUD_BaseItemContainer const &);
    UHUD_BaseItemContainer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_BaseItemContainer & operator=(class UHUD_BaseItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    class UGame_Item * eventGetItem(void);
    void eventRemoveItem(void);
    void eventSetItem(class UGame_Item *);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_ItemContainer
//------------------------------------------------------------------------------

// UHUD_ItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ItemContainer : public UHUD_BaseItemContainer {
  public:
    char Unknown0[556];
    virtual ~UHUD_ItemContainer(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    virtual bool MouseWheel(bool);
    virtual void ComponentClick(class UGUI_Component *,bool);
    virtual void ComponentRightClick(class UGUI_Component *);
    virtual int GetMouseOverCursor(void);
    virtual int GetMouseDownCursor(void);
    virtual int GetMouseDragCursor(void);
    virtual bool CanDrop(class UGame_Item *);
    UHUD_ItemContainer(class UHUD_ItemContainer const &);
    UHUD_ItemContainer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ItemContainer & operator=(class UHUD_ItemContainer const &);
    class UHUD_ItemContextMenu * GetContextMenuWindow(void);
    static void CDECL InternalConstructor(void *);
    void PrecalculatedCooldownCoordinates(void);
    static class UClass * CDECL StaticClass(void);
    void delegateOnItemSet(class UGame_Item *,int);
    void delegateOnSetSelected(unsigned long,int);
    int eventGetLocationID(void);
    int eventGetLocationSlot(void);
    unsigned char eventGetLocationType(void);
    unsigned long eventIsLocked(void);
    unsigned long eventIsSelected(void);
    void eventSetDBLocked(unsigned long);
    void eventSetGUILocked(unsigned long);
    void eventSetItemLocation(unsigned char,int,int);
    void eventSetSelected(unsigned long);
    class UGame_ItemContainerListener * eventSetupListener(unsigned char,int,int);
    void eventUpdateLocked(void);
    void eventUpdateUseCooldown(void);
    void execGetContextMenuWindow(struct FFrame &,void * const);
    void execHasContextMenuOpen(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_ItemContainer,0,execGetContextMenuWindow)
AUTOGENERATE_FUNCTION(UHUD_ItemContainer,0,execHasContextMenuOpen)


//------------------------------------------------------------------------------
//  HUD_ShopSigilItemContainer
//------------------------------------------------------------------------------

// UHUD_ShopSigilItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ShopSigilItemContainer : public UHUD_ItemContainer {
  public:
    char Unknown0[16];
    virtual ~UHUD_ShopSigilItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    virtual void SetIconMaterial(class UMaterial *,float,float,float,float,int,int,int,int);
    virtual void ApplyTextOffsets(struct UGUI_BaseDesktop::base_rect<float> *);
    UHUD_ShopSigilItemContainer(class UHUD_ShopSigilItemContainer const &);
    UHUD_ShopSigilItemContainer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ShopSigilItemContainer & operator=(class UHUD_ShopSigilItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnForge(class UHUD_ShopSigilItemContainer *,class UGame_Item *,int,int);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_TempItemContainer
//------------------------------------------------------------------------------

// UHUD_TempItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_TempItemContainer : public UHUD_ItemContainer {
  public:
    char Unknown0[4];
    virtual ~UHUD_TempItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_TempItemContainer(class UHUD_TempItemContainer const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_TempItemContainer & operator=(class UHUD_TempItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    class UHUD_ItemContainer * eventGetSourceContainer(void);
    unsigned long eventPlaceItem(class UHUD_ItemContainer *,class UGame_Item *);
  protected:
    UHUD_TempItemContainer(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_ShopCraftItemContainer
//------------------------------------------------------------------------------

// UHUD_ShopCraftItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ShopCraftItemContainer : public UHUD_TempItemContainer {
  public:
    char Unknown0[16];
    virtual ~UHUD_ShopCraftItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_ShopCraftItemContainer(class UHUD_ShopCraftItemContainer const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ShopCraftItemContainer & operator=(class UHUD_ShopCraftItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_ShopCraftItemContainer(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_ShopPaintItemContainer
//------------------------------------------------------------------------------

// UHUD_ShopPaintItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ShopPaintItemContainer : public UHUD_TempItemContainer {
  public:
    char Unknown0[4];
    virtual ~UHUD_ShopPaintItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_ShopPaintItemContainer(class UHUD_ShopPaintItemContainer const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ShopPaintItemContainer & operator=(class UHUD_ShopPaintItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_ShopPaintItemContainer(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_ShopBuyItemContainer
//------------------------------------------------------------------------------

// UHUD_ShopBuyItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ShopBuyItemContainer : public UHUD_ItemContainer {
  public:
    char Unknown0[4];
    virtual ~UHUD_ShopBuyItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_ShopBuyItemContainer(class UHUD_ShopBuyItemContainer const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ShopBuyItemContainer & operator=(class UHUD_ShopBuyItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_ShopBuyItemContainer(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_SendMailItemContainer
//------------------------------------------------------------------------------

// UHUD_SendMailItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SendMailItemContainer : public UHUD_TempItemContainer {
  public:
    virtual ~UHUD_SendMailItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_SendMailItemContainer(class UHUD_SendMailItemContainer const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_SendMailItemContainer & operator=(class UHUD_SendMailItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_SendMailItemContainer(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_ShopSellItemContainer
//------------------------------------------------------------------------------

// UHUD_ShopSellItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ShopSellItemContainer : public UHUD_TempItemContainer {
  public:
    virtual ~UHUD_ShopSellItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_ShopSellItemContainer(class UHUD_ShopSellItemContainer const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ShopSellItemContainer & operator=(class UHUD_ShopSellItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventSellItem(void);
  protected:
    UHUD_ShopSellItemContainer(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_TradeItemContainer
//------------------------------------------------------------------------------

// UHUD_TradeItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_TradeItemContainer : public UHUD_TempItemContainer {
  public:
    virtual ~UHUD_TradeItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_TradeItemContainer(class UHUD_TradeItemContainer const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_TradeItemContainer & operator=(class UHUD_TradeItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_TradeItemContainer(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_MailItemContainer
//------------------------------------------------------------------------------

// UHUD_MailItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_MailItemContainer : public UHUD_ItemContainer {
  public:
    virtual ~UHUD_MailItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_MailItemContainer(class UHUD_MailItemContainer const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_MailItemContainer & operator=(class UHUD_MailItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_MailItemContainer(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_SkillItemContainer
//------------------------------------------------------------------------------

// UHUD_SkillItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SkillItemContainer : public UHUD_ItemContainer {
  public:
    char Unknown0[4];
    virtual ~UHUD_SkillItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    virtual void SetIconMaterial(class UMaterial *,float,float,float,float,int,int,int,int);
    virtual bool CanDrop(class UGame_Item *);
    UHUD_SkillItemContainer(class UHUD_SkillItemContainer const &);
    UHUD_SkillItemContainer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_SkillItemContainer & operator=(class UHUD_SkillItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_EquipmentItemContainer
//------------------------------------------------------------------------------

// UHUD_EquipmentItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_EquipmentItemContainer : public UHUD_ItemContainer {
  public:
    virtual ~UHUD_EquipmentItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_EquipmentItemContainer(class UHUD_EquipmentItemContainer const &);
    UHUD_EquipmentItemContainer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_EquipmentItemContainer & operator=(class UHUD_EquipmentItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_BodySlotItemContainer
//------------------------------------------------------------------------------

// UHUD_BodySlotItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_BodySlotItemContainer : public UHUD_ItemContainer {
  public:
    virtual ~UHUD_BodySlotItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_BodySlotItemContainer(class UHUD_BodySlotItemContainer const &);
    UHUD_BodySlotItemContainer(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_BodySlotItemContainer & operator=(class UHUD_BodySlotItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_InventoryItemContainer
//------------------------------------------------------------------------------

// UHUD_InventoryItemContainer 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_InventoryItemContainer : public UHUD_ItemContainer {
  public:
    char Unknown0[4];
    virtual ~UHUD_InventoryItemContainer(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_InventoryItemContainer(class UHUD_InventoryItemContainer const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_InventoryItemContainer & operator=(class UHUD_InventoryItemContainer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_InventoryItemContainer(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_MoneyPage_Base
//------------------------------------------------------------------------------

// UHUD_MoneyPage_Base 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_MoneyPage_Base : public UGUI_Page {
  public:
    char Unknown0[36];
    virtual ~UHUD_MoneyPage_Base(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_MoneyPage_Base(class UHUD_MoneyPage_Base const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_MoneyPage_Base & operator=(class UHUD_MoneyPage_Base const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    int eventGetMoney(void);
    void eventSetCheckPurse(unsigned long);
    void eventSetMoney(int);
    void eventSetShadow(unsigned long);
    void eventSetTextColour(int,int,int);
    void eventSetTextFont(class FString const &);
    void eventUpdateColours(void);
  protected:
    UHUD_MoneyPage_Base(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_MoneyPageShort
//------------------------------------------------------------------------------

// UHUD_MoneyPageShort 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_MoneyPageShort : public UHUD_MoneyPage_Base {
  public:
    virtual ~UHUD_MoneyPageShort(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_MoneyPageShort(class UHUD_MoneyPageShort const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_MoneyPageShort & operator=(class UHUD_MoneyPageShort const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_MoneyPageShort(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_MoneyPageSmall
//------------------------------------------------------------------------------

// UHUD_MoneyPageSmall 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_MoneyPageSmall : public UHUD_MoneyPage_Base {
  public:
    virtual ~UHUD_MoneyPageSmall(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_MoneyPageSmall(class UHUD_MoneyPageSmall const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_MoneyPageSmall & operator=(class UHUD_MoneyPageSmall const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_MoneyPageSmall(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_MoneyPage
//------------------------------------------------------------------------------

// UHUD_MoneyPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_MoneyPage : public UHUD_MoneyPage_Base {
  public:
    virtual ~UHUD_MoneyPage(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_MoneyPage(class UHUD_MoneyPage const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_MoneyPage & operator=(class UHUD_MoneyPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_MoneyPage(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_InventoryPage
//------------------------------------------------------------------------------

// UHUD_InventoryPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_InventoryPage : public UGUI_Page {
  public:
    char Unknown0[4];
    virtual ~UHUD_InventoryPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_InventoryPage(class UHUD_InventoryPage const &);
    UHUD_InventoryPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_InventoryPage & operator=(class UHUD_InventoryPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_AttachWindow
//------------------------------------------------------------------------------

// UGUI_AttachWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_AttachWindow : public UGUI_Window {
  public:
    char Unknown0[56];
    virtual ~UGUI_AttachWindow(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual bool ChooseButton(void);
    UGUI_AttachWindow(class UGUI_AttachWindow const &);
    UGUI_AttachWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_AttachWindow & operator=(class UGUI_AttachWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execChooseButton(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_AttachWindow,0,execChooseButton)


//------------------------------------------------------------------------------
//  HUD_Inventory
//------------------------------------------------------------------------------

// UHUD_Inventory 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Inventory : public UGUI_AttachWindow {
  public:
    char Unknown0[60];
    virtual ~UHUD_Inventory(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UHUD_Inventory(class UHUD_Inventory const &);
    UHUD_Inventory(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Inventory & operator=(class UHUD_Inventory const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_Equipment
//------------------------------------------------------------------------------

// UHUD_Equipment 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Equipment : public UGUI_AttachWindow {
  public:
    char Unknown0[40];
    virtual ~UHUD_Equipment(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_Equipment(class UHUD_Equipment const &);
    UHUD_Equipment(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Equipment & operator=(class UHUD_Equipment const &);
    static void CDECL InternalConstructor(void *);
    bool IsFunctional(void);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_SettingsPage
//------------------------------------------------------------------------------

// UHUD_SettingsPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SettingsPage : public UGUI_Page {
  public:
    char Unknown0[72];
    virtual ~UHUD_SettingsPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void SetVisible(bool);
    virtual void Resize(float,float);
    UHUD_SettingsPage(class UHUD_SettingsPage const &);
    UHUD_SettingsPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_SettingsPage & operator=(class UHUD_SettingsPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventApplySettings(void);
    void eventCancelSettings(void);
    void eventDefaultSettings(void);
    int eventSettingsChanged(void);
    void eventUpdateSettings(void);
    void execGetDefaultBool(struct FFrame &,void * const);
    void execGetDefaultFloat(struct FFrame &,void * const);
    void execGetDefaultInt(struct FFrame &,void * const);
    void execGetDefaultString(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_SettingsPage,0,execGetDefaultBool)
AUTOGENERATE_FUNCTION(UHUD_SettingsPage,0,execGetDefaultFloat)
AUTOGENERATE_FUNCTION(UHUD_SettingsPage,0,execGetDefaultInt)
AUTOGENERATE_FUNCTION(UHUD_SettingsPage,0,execGetDefaultString)


//------------------------------------------------------------------------------
//  HUD_Options
//------------------------------------------------------------------------------

// UHUD_Options 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Options : public UGUI_Window {
  public:
    char Unknown0[36];
    virtual ~UHUD_Options(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UHUD_Options(class UHUD_Options const &);
    UHUD_Options(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Options & operator=(class UHUD_Options const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_MouseSettings
//------------------------------------------------------------------------------

// UHUD_MouseSettings 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_MouseSettings : public UHUD_SettingsPage {
  public:
    char Unknown0[32];
    virtual ~UHUD_MouseSettings(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_MouseSettings(class UHUD_MouseSettings const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_MouseSettings & operator=(class UHUD_MouseSettings const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execIsHardwareCursorAvailable(struct FFrame &,void * const);
  protected:
    UHUD_MouseSettings(void);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_MouseSettings,0,execIsHardwareCursorAvailable)


//------------------------------------------------------------------------------
//  HUD_DisplaySettings
//------------------------------------------------------------------------------

// UHUD_DisplaySettings 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_DisplaySettings : public UHUD_SettingsPage {
  public:
    char Unknown0[204];
    virtual ~UHUD_DisplaySettings(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_DisplaySettings(class UHUD_DisplaySettings const &);
    UHUD_DisplaySettings(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_DisplaySettings & operator=(class UHUD_DisplaySettings const &);
    int GetAnisotropicLevels(void);
    int GetMultiSampleLevels(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetAnisotropicLevels(struct FFrame &,void * const);
    void execGetMultiSampleLevels(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_DisplaySettings,0,execGetAnisotropicLevels)
AUTOGENERATE_FUNCTION(UHUD_DisplaySettings,0,execGetMultiSampleLevels)


//------------------------------------------------------------------------------
//  HUD_ControlsSettings
//------------------------------------------------------------------------------

// UHUD_ControlsSettings 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ControlsSettings : public UHUD_SettingsPage {
  public:
    char Unknown0[116];
    virtual ~UHUD_ControlsSettings(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_ControlsSettings(class UHUD_ControlsSettings const &);
    UHUD_ControlsSettings(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ControlsSettings & operator=(class UHUD_ControlsSettings const &);
    void BindKey(class FString const &,class FString const &);
    void ClearBindings(void);
    void InitializeInput(void);
    static void CDECL InternalConstructor(void *);
    int IsReservedKey(unsigned char);
    static class UClass * CDECL StaticClass(void);
    void eventSetButtonText(class UGUI_KeyEditButton *,class FString const &);
    void execApplyBindings(struct FFrame &,void * const);
    void execDefaultSettings(struct FFrame &,void * const);
    void execIsReservedKey(struct FFrame &,void * const);
    void execUpdateControls(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_ControlsSettings,0,execApplyBindings)
AUTOGENERATE_FUNCTION(UHUD_ControlsSettings,0,execDefaultSettings)
AUTOGENERATE_FUNCTION(UHUD_ControlsSettings,0,execIsReservedKey)
AUTOGENERATE_FUNCTION(UHUD_ControlsSettings,0,execUpdateControls)


//------------------------------------------------------------------------------
//  HUD_SystemMenu
//------------------------------------------------------------------------------

// UHUD_SystemMenu 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SystemMenu : public UGUI_Window {
  public:
    char Unknown0[108];
    virtual ~UHUD_SystemMenu(void);
    virtual unsigned int GetCPPSize(void);
    virtual void DrawBackground(class UCanvas *,struct UGUI_Desktop::draw_context &,struct UGUI_BaseDesktop::base_rect<float> *);
    UHUD_SystemMenu(class UHUD_SystemMenu const &);
    UHUD_SystemMenu(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_SystemMenu & operator=(class UHUD_SystemMenu const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_RadialMenu
//------------------------------------------------------------------------------

//  HUD_RadialMenu.GetSelectedButtonOption 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_RadialMenu_execGetSelectedButtonOption_Parms {
  class UGUI_Button* aButton;  // 0 80 CPF_Parm
  BYTE aOption;  // 4 80 CPF_Parm
};


//  HUD_RadialMenu.UpdateButtons 40400 0 ( FUNC_Native FUNC_Private )
struct UHUD_RadialMenu_execUpdateButtons_Parms {
  TArray<class UMaterial*> imageList;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  HUD_RadialMenu.UpdateTarget 40400 0 ( FUNC_Native FUNC_Private )
struct UHUD_RadialMenu_execUpdateTarget_Parms {
};


//  HUD_RadialMenu.DoRadialMenuSelect 40400 0 ( FUNC_Native FUNC_Private )
struct UHUD_RadialMenu_execDoRadialMenuSelect_Parms {
  BYTE aOption;  // 0 80 CPF_Parm
};


//  HUD_RadialMenu.OnButtonClick 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_RadialMenu_execOnButtonClick_Parms {
  class UGUI_Component* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_RadialMenu.InteractionPossible 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_RadialMenu_execInteractionPossible_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_RadialMenu.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_RadialMenu_eventDoShowWindow_Parms {
  INT aFlags;  // 0 80 CPF_Parm
};


//  HUD_RadialMenu.CollectTargetOptions 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_RadialMenu_eventCollectTargetOptions_Parms {
};


//  HUD_RadialMenu.ResetInfoText 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_RadialMenu_execResetInfoText_Parms {
  class UGUI_Component* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_RadialMenu.SetInfoText 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_RadialMenu_execSetInfoText_Parms {
  class UGUI_Component* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_RadialMenu.NativeCreateRadialButton 20400 0 ( FUNC_Native FUNC_Public )
struct UHUD_RadialMenu_execNativeCreateRadialButton_Parms {
  BYTE optionID;  // 0 80 CPF_Parm
  class FString imageName;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FString infoText;  // C 400080 CPF_Parm CPF_NeedCtorLink
  class UGUI_Button* ReturnValue;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_RadialMenu.CreateRadialButton 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_RadialMenu_execCreateRadialButton_Parms {
  BYTE optionID;  // 0 80 CPF_Parm
  class FString imageName;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FString infoText;  // C 400080 CPF_Parm CPF_NeedCtorLink
};


//  HUD_RadialMenu.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_RadialMenu_eventInitialize_Parms {
};


// UHUD_RadialMenu 401E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UHUD_RadialMenu : public UGUI_Window {
  public:
    class AGame_Pawn* mTargetPawn;  // 37C 0
    class AInteractiveLevelElement* mTargetInteractiveLevelElement;  // 380 0
    TArray<BYTE> mOptions;  // 384 400000 CPF_NeedCtorLink
    class UGUI_Image* mBackgroundMulti;  // 390 0
    class UGUI_Image* mBackgroundSingle;  // 394 0
    FLOAT mCenterX;  // 398 0
    FLOAT mCenterY;  // 39C 0
    FLOAT mButtonRadius;  // 3A0 0
    BITFIELD mRadialFadeIn : 1;  // 3A4 0
    BITFIELD mRadialFadeOut : 1;  // 3A4 0
    FLOAT mAnimationTime;  // 3A8 0
    class UGUI_Page* mInfoPage;  // 3AC 0
    class UGUI_Label* mInfoLabel;  // 3B0 0
    INT mRadialData;  // 3B4 800000 CPF_Unk_00800000
    virtual ~UHUD_RadialMenu(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_RadialMenu(class UHUD_RadialMenu const &);
    UHUD_RadialMenu(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_RadialMenu & operator=(class UHUD_RadialMenu const &);
    unsigned char GetFirstOption(void);
    int GetOptionsCount(void);
    bool InteractionAllowed(void);
    int InteractionPossible(void);
    static void CDECL InternalConstructor(void *);
    bool IsInRange(void);
    static class UClass * CDECL StaticClass(void);
    void eventCollectTargetOptions(void);
    void execDoRadialMenuSelect(struct FFrame &,void * const);
    void execGetSelectedButtonOption(struct FFrame &,void * const);
    void execInteractionPossible(struct FFrame &,void * const);
    void execNativeCreateRadialButton(struct FFrame &,void * const);
    void execResetInfoText(struct FFrame &,void * const);
    void execSetInfoText(struct FFrame &,void * const);
    void execUpdateButtons(struct FFrame &,void * const);
    void execUpdateTarget(struct FFrame &,void * const);
  private:
    class UGUI_Button * CreateRadialButton(unsigned char,class FString const &,class FString const &);
    void DoRadialMenuSelect(unsigned char);
    bool IsOptionAllowed(unsigned char,class AGame_PlayerPawn *);
    static class UClass PrivateStaticClass;
    void UpdateInfoTextDimensions(void);
    void UpdateTarget(void);
};
AUTOGENERATE_FUNCTION(UHUD_RadialMenu,0,execDoRadialMenuSelect)
AUTOGENERATE_FUNCTION(UHUD_RadialMenu,0,execGetSelectedButtonOption)
AUTOGENERATE_FUNCTION(UHUD_RadialMenu,0,execInteractionPossible)
AUTOGENERATE_FUNCTION(UHUD_RadialMenu,0,execNativeCreateRadialButton)
AUTOGENERATE_FUNCTION(UHUD_RadialMenu,0,execResetInfoText)
AUTOGENERATE_FUNCTION(UHUD_RadialMenu,0,execSetInfoText)
AUTOGENERATE_FUNCTION(UHUD_RadialMenu,0,execUpdateButtons)
AUTOGENERATE_FUNCTION(UHUD_RadialMenu,0,execUpdateTarget)


//------------------------------------------------------------------------------
//  GUI_Menu
//------------------------------------------------------------------------------

//  GUI_Menu.ItemSelected 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Menu_execItemSelected_Parms {
  class UGUI_TextButton* Button;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Menu.OnButtonChecked 120002 0 ( FUNC_Defined FUNC_Public FUNC_Delegate )
struct UGUI_Menu_execOnButtonChecked_Parms {
  class UGUI_TextButton* aButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Menu.ButtonChecked 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Menu_execButtonChecked_Parms {
  class UGUI_TextButton* aButton;  // 0 80 CPF_Parm
  BITFIELD isChecked : 1;  // 4 80 CPF_Parm
};


//  GUI_Menu.OpenSubmenu 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Menu_execOpenSubmenu_Parms {
  class UGUI_Component* aComponent;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Menu.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Menu_execInitialize_Parms {
};


//  GUI_Menu.CheckButton 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Menu_execCheckButton_Parms {
  INT Index;  // 0 80 CPF_Parm
  BITFIELD newSetting : 1;  // 4 80 CPF_Parm
};


//  GUI_Menu.CreateMenuCheckbox 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Menu_execCreateMenuCheckbox_Parms {
  class FString menuItemName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD isChecked : 1;  // 8 80 CPF_Parm
  class UGUI_TextButton* ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Menu.GetSubMenu 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Menu_execGetSubMenu_Parms {
  class UGUI_TextButton* aButton;  // 0 80 CPF_Parm
  class UGUI_Window* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Menu.CreateSubMenu 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Menu_execCreateSubMenu_Parms {
  class FString menuItemName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString menuClass;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString menuSpecification;  // 10 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_TextButton* ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Menu.CreateMenuItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Menu_execCreateMenuItem_Parms {
  class FString menuItemName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UGUI_TextButton* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UGUI_Menu 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Menu : public UGUI_ContextWindow {
  public:
    FLOAT mYOffset;  // 384 0
    FLOAT mXOffset;  // 388 0
    BITFIELD mIsRoot : 1;  // 38C 0
    struct FScriptDelegate __OnButtonChecked__Delegate;  // 390 400000 CPF_NeedCtorLink
    INT mMenuData;  // 398 800000 CPF_Unk_00800000
    virtual ~UGUI_Menu(void);
    virtual unsigned int GetCPPSize(void);
    virtual class UGUI_TextButton * CreateMenuItem(class FString,int);
    virtual class UGUI_TextButton * CreateSubMenu(class FString,class FString,class FString);
    virtual class UGUI_TextButton * CreateMenuCheckbox(class FString,bool);
    virtual class UGUI_Window * GetSubMenu(class UGUI_TextButton *);
    UGUI_Menu(class UGUI_Menu const &);
    UGUI_Menu(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Menu & operator=(class UGUI_Menu const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UpdatePosition(class UGUI_Component *);
    unsigned long delegateOnButtonChecked(class UGUI_TextButton *);
    void execCheckButton(struct FFrame &,void * const);
    void execCreateMenuCheckbox(struct FFrame &,void * const);
    void execCreateMenuItem(struct FFrame &,void * const);
    void execCreateSubMenu(struct FFrame &,void * const);
    void execGetSubMenu(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_Menu,0,execCheckButton)
AUTOGENERATE_FUNCTION(UGUI_Menu,0,execCreateMenuCheckbox)
AUTOGENERATE_FUNCTION(UGUI_Menu,0,execCreateMenuItem)
AUTOGENERATE_FUNCTION(UGUI_Menu,0,execCreateSubMenu)
AUTOGENERATE_FUNCTION(UGUI_Menu,0,execGetSubMenu)


//------------------------------------------------------------------------------
//  HUD_ItemContextMenu
//------------------------------------------------------------------------------

// UHUD_ItemContextMenu 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_ItemContextMenu : public UGUI_Menu {
  public:
    char Unknown0[12];
    virtual ~UHUD_ItemContextMenu(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UHUD_ItemContextMenu(class UHUD_ItemContextMenu const &);
    UHUD_ItemContextMenu(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_ItemContextMenu & operator=(class UHUD_ItemContextMenu const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventOpenMenu(class UHUD_ItemContainer *);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_GameMenu
//------------------------------------------------------------------------------

// UHUD_GameMenu 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_GameMenu : public UGUI_Window {
  public:
    char Unknown0[68];
    virtual ~UHUD_GameMenu(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_GameMenu(class UHUD_GameMenu const &);
    UHUD_GameMenu(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_GameMenu & operator=(class UHUD_GameMenu const &);
    bool CanLearnOrUpgradeSkill(void);
    bool CanPlayerUpgradeStats(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UpdateBlinkState(void);
    void UpdateLockLogic(void);
    void eventOnScroll(unsigned long);
    void eventUpdateTooltips(void);
    void execSetIcon(struct FFrame &,void * const);
    void execUpdateResolution(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_GameMenu,0,execSetIcon)
AUTOGENERATE_FUNCTION(UHUD_GameMenu,0,execUpdateResolution)


//------------------------------------------------------------------------------
//  HUD_TeamMemberPage
//------------------------------------------------------------------------------

// UHUD_TeamMemberPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_TeamMemberPage : public UGED_GroupMemberPage {
  public:
    char Unknown0[36];
    virtual ~UHUD_TeamMemberPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    UHUD_TeamMemberPage(class UHUD_TeamMemberPage const &);
    UHUD_TeamMemberPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_TeamMemberPage & operator=(class UHUD_TeamMemberPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_TeamMemberIterationPage
//------------------------------------------------------------------------------

// UHUD_TeamMemberIterationPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_TeamMemberIterationPage : public UGUI_IterationPage {
  public:
    char Unknown0[4];
    virtual ~UHUD_TeamMemberIterationPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual bool HasNext(void);
    virtual void ApplyNext(class UGUI_Page *);
    virtual void InitIteration(void);
    UHUD_TeamMemberIterationPage(class UHUD_TeamMemberIterationPage const &);
    UHUD_TeamMemberIterationPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_TeamMemberIterationPage & operator=(class UHUD_TeamMemberIterationPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetTeamMemberCount(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_TeamMemberIterationPage,0,execGetTeamMemberCount)


//------------------------------------------------------------------------------
//  HUD_TeamDuffPage
//------------------------------------------------------------------------------

// UHUD_TeamDuffPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_TeamDuffPage : public UGUI_IterationPage {
  public:
    char Unknown0[8];
    virtual ~UHUD_TeamDuffPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual bool HasNext(void);
    virtual void ApplyNext(class UGUI_Page *);
    virtual void InitIteration(void);
    UHUD_TeamDuffPage(class UHUD_TeamDuffPage const &);
    UHUD_TeamDuffPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_TeamDuffPage & operator=(class UHUD_TeamDuffPage const &);
    class UGame_TeamMember * GetTeamMember(class UGUI_Component *);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_Team
//------------------------------------------------------------------------------

// UHUD_Team 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Team : public UGUI_Window {
  public:
    char Unknown0[28];
    virtual ~UHUD_Team(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void SetVisible(bool);
    UHUD_Team(class UHUD_Team const &);
    UHUD_Team(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Team & operator=(class UHUD_Team const &);
    static void CDECL InternalConstructor(void *);
    bool IsMouseInHotspot(void);
    static class UClass * CDECL StaticClass(void);
    void eventOnScroll(unsigned long);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_TargetAvatar
//------------------------------------------------------------------------------

// UHUD_TargetAvatar 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_TargetAvatar : public UGUI_Window {
  public:
    char Unknown0[28];
    virtual ~UHUD_TargetAvatar(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_TargetAvatar(class UHUD_TargetAvatar const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_TargetAvatar & operator=(class UHUD_TargetAvatar const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_TargetAvatar(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_PlayerAvatar
//------------------------------------------------------------------------------

// UHUD_PlayerAvatar 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_PlayerAvatar : public UGUI_Window {
  public:
    char Unknown0[56];
    virtual ~UHUD_PlayerAvatar(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_PlayerAvatar(class UHUD_PlayerAvatar const &);
    UHUD_PlayerAvatar(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_PlayerAvatar & operator=(class UHUD_PlayerAvatar const &);
    static void CDECL InternalConstructor(void *);
    bool IsMouseInHotspot(void);
    static class UClass * CDECL StaticClass(void);
    void eventOnScroll(unsigned long);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_Pet
//------------------------------------------------------------------------------

// UHUD_Pet 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_Pet : public UGUI_Window {
  public:
    char Unknown0[24];
    virtual ~UHUD_Pet(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    UHUD_Pet(class UHUD_Pet const &);
    UHUD_Pet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_Pet & operator=(class UHUD_Pet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_DuffsPage
//------------------------------------------------------------------------------

// UHUD_DuffsPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_DuffsPage : public UGUI_Page {
  public:
    char Unknown0[16];
    virtual ~UHUD_DuffsPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_DuffsPage(class UHUD_DuffsPage const &);
    UHUD_DuffsPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_DuffsPage & operator=(class UHUD_DuffsPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void Update(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_ObjectTooltipPage
//------------------------------------------------------------------------------

#define UCONST_GUI_ObjectTooltipPage_FOOTNOTE_B  183
#define UCONST_GUI_ObjectTooltipPage_FOOTNOTE_G  183
#define UCONST_GUI_ObjectTooltipPage_FOOTNOTE_R  183
#define UCONST_GUI_ObjectTooltipPage_FOOTNOTE_LABEL_B  255
#define UCONST_GUI_ObjectTooltipPage_FOOTNOTE_LABEL_G  208
#define UCONST_GUI_ObjectTooltipPage_FOOTNOTE_LABEL_R  76
#define UCONST_GUI_ObjectTooltipPage_SUBHEADER_HEIGHT  16
#define UCONST_GUI_ObjectTooltipPage_MAINHEADER_HEIGHT  15
// FFootnote 0 ( )
struct DLL_IMPORT FFootnote {
  public:
    class UHelp_Article* Article;  // 0 4400008 CPF_ExportObject CPF_NeedCtorLink CPF_EditInline
    class FString FormattedBody;  // 4 400000 CPF_NeedCtorLink
    class UGUI_Page* page;  // C 0
    FFootnote(struct FFootnote const &);
    FFootnote(void);
    ~FFootnote(void);
    struct FFootnote & operator=(struct FFootnote const &);
};

//  GUI_ObjectTooltipPage.AddLine 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_ObjectTooltipPage_eventAddLine_Parms {
  class FString aText;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FColor aForegroundColor;  // 8 90 CPF_OptionalParm CPF_Parm
  class FColor aBackgroundColor;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_ObjectTooltipPage.AddDescription 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ObjectTooltipPage_execAddDescription_Parms {
  class FString aDescription;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_ObjectTooltipPage.GetHelpArticle 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ObjectTooltipPage_execGetHelpArticle_Parms {
  class FString aHelpTag;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UHelp_Article* ReturnValue;  // 8 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  GUI_ObjectTooltipPage.AddFootnotes C0802 0 ( FUNC_Defined FUNC_Event FUNC_Private FUNC_Protected )
struct UGUI_ObjectTooltipPage_eventAddFootnotes_Parms {
};


//  GUI_ObjectTooltipPage.ParseFootnotes 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ObjectTooltipPage_execParseFootnotes_Parms {
  class FString aInputString;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FColor aMainTextColor;  // 8 80 CPF_Parm
  class FColor aFootnoteLabelColor;  // C 80 CPF_Parm
  class FString ReturnValue;  // 10 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_ObjectTooltipPage.SetHeaderLabelText 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ObjectTooltipPage_execSetHeaderLabelText_Parms {
  class UGUI_Label* aLabel;  // 0 80 CPF_Parm
  class FString aText;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FColor aColor;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_ObjectTooltipPage.AddHeader 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ObjectTooltipPage_execAddHeader_Parms {
  class FString aMLString;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aMRString;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString aSLString;  // 10 400080 CPF_Parm CPF_NeedCtorLink
  class FString aSRString;  // 18 400080 CPF_Parm CPF_NeedCtorLink
  class FColor aMLColor;  // 20 90 CPF_OptionalParm CPF_Parm
  class FColor aMRColor;  // 24 90 CPF_OptionalParm CPF_Parm
  class FColor aSLColor;  // 28 90 CPF_OptionalParm CPF_Parm
  class FColor aSRColor;  // 2C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_ObjectTooltipPage.ShouldUpdate 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_ObjectTooltipPage_eventShouldUpdate_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ObjectTooltipPage.UpdateTooltipInfo 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ObjectTooltipPage_execUpdateTooltipInfo_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ObjectTooltipPage.UpdateTooltipObject 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ObjectTooltipPage_execUpdateTooltipObject_Parms {
  class UObject* aObject;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ObjectTooltipPage.ResetObjectTooltip 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ObjectTooltipPage_execResetObjectTooltip_Parms {
};


//  GUI_ObjectTooltipPage.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ObjectTooltipPage_execInitialize_Parms {
};


// UGUI_ObjectTooltipPage 401E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UGUI_ObjectTooltipPage : public UGUI_Page {
  public:
    class UObject* mObject;  // 2E4 0
    INT mDefaultWidth;  // 2E8 0
    BITFIELD mHelpArticlesPackageLoaded : 1;  // 2EC 0
    class UGUI_Page* mMainHeader;  // 2F0 0
    class UGUI_Page* mSubHeader;  // 2F4 0
    class UGUI_TextCtrl* mHeaderMLLabel;  // 2F8 0
    class UGUI_Label* mHeaderMRLabel;  // 2FC 0
    class UGUI_Label* mHeaderSLLabel;  // 300 0
    class UGUI_Label* mHeaderSRLabel;  // 304 0
    class UGUI_Page* mDescription;  // 308 0
    TArray<class UGUI_Page*> mLinePages;  // 30C 400000 CPF_NeedCtorLink
    TArray<struct FFootnote> mFootnotes;  // 318 400000 CPF_NeedCtorLink
    virtual ~UGUI_ObjectTooltipPage(void);
    virtual unsigned int GetCPPSize(void);
    UGUI_ObjectTooltipPage(class UGUI_ObjectTooltipPage const &);
    UGUI_ObjectTooltipPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ObjectTooltipPage & operator=(class UGUI_ObjectTooltipPage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventAddFootnotes(void);
    void eventAddLine(class FString const &,class FColor,class FColor);
    unsigned long eventShouldUpdate(void);
    void execGetHelpArticle(struct FFrame &,void * const);
    void execParseFootnotes(struct FFrame &,void * const);
  protected:
    class UHelp_Article * GetHelpArticle(class FString);
    class FString ParseFootnotes(class FString,class FColor,class FColor);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_ObjectTooltipPage,0,execGetHelpArticle)
AUTOGENERATE_FUNCTION(UGUI_ObjectTooltipPage,0,execParseFootnotes)


//------------------------------------------------------------------------------
//  HUD_AvatarStatusBarTooltip
//------------------------------------------------------------------------------

// UHUD_AvatarStatusBarTooltip 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_AvatarStatusBarTooltip : public UGUI_ObjectTooltipPage {
  public:
    char Unknown0[16];
    virtual ~UHUD_AvatarStatusBarTooltip(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_AvatarStatusBarTooltip(class UHUD_AvatarStatusBarTooltip const &);
    UHUD_AvatarStatusBarTooltip(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_AvatarStatusBarTooltip & operator=(class UHUD_AvatarStatusBarTooltip const &);
    class FString GetStateLevel(int &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execGetStateLevel(struct FFrame &,void * const);
    void execGetStateLevels(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_AvatarStatusBarTooltip,0,execGetStateLevel)
AUTOGENERATE_FUNCTION(UHUD_AvatarStatusBarTooltip,0,execGetStateLevels)


//------------------------------------------------------------------------------
//  HUD_AvatarImagePage
//------------------------------------------------------------------------------

// UHUD_AvatarImagePage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_AvatarImagePage : public UGUI_Page {
  public:
    char Unknown0[24];
    virtual ~UHUD_AvatarImagePage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UHUD_AvatarImagePage(class UHUD_AvatarImagePage const &);
    UHUD_AvatarImagePage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_AvatarImagePage & operator=(class UHUD_AvatarImagePage const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventSetAvatarPawn(class AGame_Pawn *);
    void execPreLogin(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_AvatarImagePage,0,execPreLogin)


//------------------------------------------------------------------------------
//  HUD_SkillLibrary
//------------------------------------------------------------------------------

// UHUD_SkillLibrary 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SkillLibrary : public UGUI_Window {
  public:
    char Unknown0[60];
    virtual ~UHUD_SkillLibrary(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_SkillLibrary(class UHUD_SkillLibrary const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_SkillLibrary & operator=(class UHUD_SkillLibrary const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UHUD_SkillLibrary(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_SkillIterationPage
//------------------------------------------------------------------------------

// UHUD_SkillIterationPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SkillIterationPage : public UGUI_IterationPage {
  public:
    char Unknown0[36];
    virtual ~UHUD_SkillIterationPage(void);
    virtual unsigned int GetCPPSize(void);
    virtual void SetProperty(class FString const &,class FString const &);
    virtual bool HasNext(void);
    virtual void ApplyNext(class UGUI_Page *);
    virtual void InitIteration(void);
    virtual void ClearData(class UGUI_Component *);
    virtual void ApplyNextLearnableSkill(class UGUI_Page *);
    virtual void ApplyNextUpgradableSkill(class UGUI_Page *);
    UHUD_SkillIterationPage(class UHUD_SkillIterationPage const &);
    UHUD_SkillIterationPage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_SkillIterationPage & operator=(class UHUD_SkillIterationPage const &);
    int DetermineSkillPriority(class UFSkill_Type *);
    bool DoesPlayerHaveSkill(class UFSkill_Type *);
    void EnableSkills(bool);
    bool HasNextExistingSkill(void);
    bool HasNextLearnableSkill(void);
    bool HasNextUpgradableSkill(void);
    static void CDECL InternalConstructor(void *);
    bool IsAvailableForArchetypes(class UFSkill_Type *);
    bool IsRelevantSkill(class UFSkill_Type *);
    bool IsRelevantTier(class UFSkill_Type *);
    bool IsSkillAvailableToPlayer(class UFSkill_Type *);
    static class UClass * CDECL StaticClass(void);
    void execEnableSkills(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UHUD_SkillIterationPage,0,execEnableSkills)


//------------------------------------------------------------------------------
//  HUD_SkillBook
//------------------------------------------------------------------------------

// UHUD_SkillBook 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SkillBook : public UGUI_Window {
  public:
    char Unknown0[32];
    virtual ~UHUD_SkillBook(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    UHUD_SkillBook(class UHUD_SkillBook const &);
    UHUD_SkillBook(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_SkillBook & operator=(class UHUD_SkillBook const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventUpdateLearnPage(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_SheathWeaponWindow
//------------------------------------------------------------------------------

// UHUD_SheathWeaponWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SheathWeaponWindow : public UGUI_Window {
  public:
    char Unknown0[12];
    virtual ~UHUD_SheathWeaponWindow(void);
    virtual unsigned int GetCPPSize(void);
    UHUD_SheathWeaponWindow(class UHUD_SheathWeaponWindow const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_SheathWeaponWindow & operator=(class UHUD_SheathWeaponWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventUpdateTooltips(void);
  protected:
    UHUD_SheathWeaponWindow(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  HUD_CombatBar
//------------------------------------------------------------------------------

#define UCONST_HUD_CombatBar_BACKGROUND_OFFSET  106
#define UCONST_HUD_CombatBar_COMBATBAR_HEIGHT  128
#define UCONST_HUD_CombatBar_COMBATBAR_WIDTH  370
#define UCONST_HUD_CombatBar_ICON_REFRESH_RATE  0.333
#define UCONST_HUD_CombatBar_DEFAULT_YAW_ANGLE  16834
#define UCONST_HUD_CombatBar_TIER_TIMEOUT_ANGLE  32768
#define UCONST_HUD_CombatBar_ONE_TIER_ANGLE  10922.66667
#define UCONST_HUD_CombatBar_CBB_RIGHT_BORDER  0.17
#define UCONST_HUD_CombatBar_CBB_LEFT_BORDER  0.17
#define UCONST_HUD_CombatBar_SLOT_COUNT  5
#define UCONST_HUD_CombatBar_TIER_COUNT  6
#define UCONST_HUD_CombatBar_BAR_OFFSET_Z  530
#define UCONST_HUD_CombatBar_BAR_OFFSET_Y  -20
#define UCONST_HUD_CombatBar_BAR_OFFSET_X  7
enum eSlotMaterialTypes {
  SMT_NORMAL = 0,
  SMT_DISABLED = 1,
  SMT_SELECTED = 2
};

//  HUD_CombatBar.OnComponentShown 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execOnComponentShown_Parms {
};


//  HUD_CombatBar.HandleComboStringChanged 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execHandleComboStringChanged_Parms {
  INT aStringLength;  // 0 80 CPF_Parm
};


//  HUD_CombatBar.OnSkilldeckChanged 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execOnSkilldeckChanged_Parms {
};


//  HUD_CombatBar.OnActivateSkillFailed 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execOnActivateSkillFailed_Parms {
};


//  HUD_CombatBar.OnRollToFirstTier 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execOnRollToFirstTier_Parms {
};


//  HUD_CombatBar.OnRollToNextTier 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execOnRollToNextTier_Parms {
};


//  HUD_CombatBar.MouseUpHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execMouseUpHandler_Parms {
  FLOAT MouseX;  // 0 80 CPF_Parm
  FLOAT MouseY;  // 4 80 CPF_Parm
  INT buttons;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_CombatBar.OnMessage 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execOnMessage_Parms {
  class UObject* aSender;  // 0 80 CPF_Parm
  INT intParam;  // 4 90 CPF_OptionalParm CPF_Parm
  class UObject* objParam;  // 8 90 CPF_OptionalParm CPF_Parm
  class FString stringParam;  // C 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  HUD_CombatBar.AssignIconMaterials 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execAssignIconMaterials_Parms {
  INT aHighlightTier;  // 0 90 CPF_OptionalParm CPF_Parm
};


//  HUD_CombatBar.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_CombatBar_eventDoShowWindow_Parms {
  INT aFlags;  // 0 80 CPF_Parm
};


//  HUD_CombatBar.OnComponentDestroyed 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_CombatBar_eventOnComponentDestroyed_Parms {
};


//  HUD_CombatBar.SetDelegates 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execSetDelegates_Parms {
};


//  HUD_CombatBar.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_CombatBar_eventInitialize_Parms {
};


//  HUD_CombatBar.PrecalculateClockCoordinates 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execPrecalculateClockCoordinates_Parms {
};


//  HUD_CombatBar.SetRowAndSlot 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_CombatBar_execSetRowAndSlot_Parms {
  INT aRow;  // 0 80 CPF_Parm
  INT aSlot;  // 4 80 CPF_Parm
};


// UHUD_CombatBar 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_CombatBar : public UGUI_Window {
  public:
    class UGUI_Label* mBackgroundImage;  // 37C 2000000 CPF_EditorData
    class UGUI_Mesh* mCombatBarComponent01;  // 380 2000000 CPF_EditorData
    class UGUI_Mesh* mCombatBarComponent03;  // 384 2000000 CPF_EditorData
    class UGUI_Mesh* mCombatBarComponent04;  // 388 2000000 CPF_EditorData
    class UGUI_Mesh* mCombatBarComponent05;  // 38C 2000000 CPF_EditorData
    class UGUI_Mesh* mCombatBarComponent06;  // 390 2000000 CPF_EditorData
    INT mCurrentRow;  // 394 0
    INT mCurrentSlot;  // 398 0
    class UCombiner* mHighlightCombiner;  // 39C 0
    class UShader* mHighlightShader;  // 3A0 0
    class UTexOscillator* mAnimation;  // 3A4 0
    class UTexture* mEmptySlotMaterial;  // 3A8 0
    class UTexture* mClocksheet;  // 3AC 0
    class UTexture* mHoverMaterial;  // 3B0 0
    class UTexture* mNormalMaterial;  // 3B4 0
    class UTexture* mPressedMaterial;  // 3B8 0
    class UTexture* mDisabledMaterial;  // 3BC 0
    class UMaterial* mSlotMaterials[30];  // 3C0 0
    class UMaterial* mComboMaterials[30];  // 438 0
    class UMaterial* mComboStringMaterial;  // 4B0 0
    class UMaterial* mComboOpenerMaterial;  // 4B4 0
    class UMaterial* mComboFollowUpMaterial;  // 4B8 0
    class UMaterial* mComboEmptyMaterial;  // 4BC 0
    class UMaterial* mComboFinisherMaterial;  // 4C0 0
    class UMaterial* mComboDisabledMaterial;  // 4C4 0
    INT mClockCoordinateX[64];  // 4C8 0
    INT mClockCoordinateY[64];  // 5C8 0
    BITFIELD mIsMouseDown : 1;  // 6C8 0
    class UGUI_Label* mComboStringIcons[8];  // 6CC 0
    virtual ~UHUD_CombatBar(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    virtual bool MouseDown(float,float,int,int,class UGUI_Component *);
    UHUD_CombatBar(class UHUD_CombatBar const &);
    UHUD_CombatBar(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UHUD_CombatBar & operator=(class UHUD_CombatBar const &);
    static void CDECL InternalConstructor(void *);
    float SmoothBlendAngle(float,float,float,float);
    static class UClass * CDECL StaticClass(void);
    void UpdateRotation(float);
    void UpdateSkillIconStates(float);
    void UpdateSlotMaterial(int,bool,bool,float);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_Tooltip
//------------------------------------------------------------------------------

// FObjectTooltipPage 0 ( )
struct DLL_IMPORT FObjectTooltipPage {
  public:
    class UGUI_ObjectTooltipPage* ObjectTooltipPage;  // 0 0
    class FString ObjectPageClassName;  // 4 400000 CPF_NeedCtorLink
    FObjectTooltipPage(struct FObjectTooltipPage const &);
    FObjectTooltipPage(void);
    ~FObjectTooltipPage(void);
    struct FObjectTooltipPage & operator=(struct FObjectTooltipPage const &);
};

//  GUI_Tooltip.ResetTooltip 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Tooltip_eventResetTooltip_Parms {
};


//  GUI_Tooltip.ShowObjectTooltip 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Tooltip_eventShowObjectTooltip_Parms {
  class UObject* aObject;  // 0 80 CPF_Parm
  class FString aObjectPageClassName;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Tooltip.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Tooltip_execInitialize_Parms {
};


// UGUI_Tooltip 401E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UGUI_Tooltip : public UGUI_Window {
  public:
    class UGUI_Window* mHelperWindow;  // 37C 0
    class UGUI_TextCtrl* mTextControl;  // 380 0
    FLOAT mTooltipAppearanceDelay;  // 384 44000 CPF_Config CPF_GlobalConfig
    FLOAT mTooltipFadeInTime;  // 388 44000 CPF_Config CPF_GlobalConfig
    class UObject* mCurrentObject;  // 38C 0
    class FString mCurrentText;  // 390 400000 CPF_NeedCtorLink
    class AActor* mCurrentActor;  // 398 0
    class UGUI_Component* mCurrentComponent;  // 39C 0
    FLOAT mTooltipTimer;  // 3A0 0
    TArray<struct FObjectTooltipPage> ObjectTooltipPages;  // 3A4 400000 CPF_NeedCtorLink
    INT mCurrentObjectPageID;  // 3B0 0
    virtual ~UGUI_Tooltip(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    UGUI_Tooltip(class UGUI_Tooltip const &);
    UGUI_Tooltip(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Tooltip & operator=(class UGUI_Tooltip const &);
    bool DetermineTooltipActor(void);
    bool DetermineTooltipComponent(void);
    class UObject * DetermineTooltipObject(void);
    class FString DetermineTooltipObjectPageClassName(void);
    class FString DetermineTooltipText(void);
    void FormatText(class FString const &);
    class FString GetActorText(class AActor *);
    void GetHelperWindow(void);
    void HideTooltip(class UGUI_Window *);
    void HideTooltip(void);
    static void CDECL InternalConstructor(void *);
    void InvalidateTooltip(void);
    bool PositionTooltip(class UGUI_Window *);
    void ShowTooltip(class UGUI_Window *);
    static class UClass * CDECL StaticClass(void);
    void UpdateTooltipInformation(void);
    void UpdateTooltipLocation(void);
    void eventResetTooltip(void);
    unsigned long eventShowObjectTooltip(class UObject *,class FString const &);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_Rotator
//------------------------------------------------------------------------------

// UGUI_Rotator 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Rotator : public UGUI_Page {
  public:
    char Unknown0[36];
    virtual ~UGUI_Rotator(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UGUI_Rotator(class UGUI_Rotator const &);
    UGUI_Rotator(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Rotator & operator=(class UGUI_Rotator const &);
    void AddSelection(class FString const &);
    void ClearOptions(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void UpdateSelection(void);
    void delegateOnItemChange(int);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_RadialButton
//------------------------------------------------------------------------------

//  GUI_RadialButton.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_RadialButton_eventInitialize_Parms {
};


// UGUI_RadialButton 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_RadialButton : public UGUI_Button {
  public:
    class UMaterial* mCurrentMaterial;  // 348 0
    class UTexture* mIconMaskTexture;  // 34C 0
    class UTexture* mShaderMaskTexture;  // 350 0
    class UTexture* mNormalTexture;  // 354 0
    class UTexture* mHilitedTexture;  // 358 0
    class UTexture* mPressedTexture;  // 35C 0
    virtual ~UGUI_RadialButton(void);
    virtual unsigned int GetCPPSize(void);
    virtual void SetEnabled(bool);
    virtual void SetIconMaterial(class UMaterial *,float,float,float,float,int,int,int,int);
    UGUI_RadialButton(class UGUI_RadialButton const &);
    UGUI_RadialButton(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_RadialButton & operator=(class UGUI_RadialButton const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    void LoadStateShaders(struct UGUI_Component::state_images *);
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_NPCDebugWindow
//------------------------------------------------------------------------------

//  GUI_NPCDebugWindow.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_NPCDebugWindow_execInitialize_Parms {
};


// UGUI_NPCDebugWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_NPCDebugWindow : public UGUI_Window {
  public:
    class UGUI_TextCtrl* mText;  // 37C 0
    class AGame_NPCPawn* mLastPawn;  // 380 0
    virtual ~UGUI_NPCDebugWindow(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UGUI_NPCDebugWindow(class UGUI_NPCDebugWindow const &);
    UGUI_NPCDebugWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_NPCDebugWindow & operator=(class UGUI_NPCDebugWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_Image
//------------------------------------------------------------------------------

//  GUI_Image.SetVisible 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Image_execSetVisible_Parms {
  BITFIELD B : 1;  // 0 80 CPF_Parm
};


//  GUI_Image.SetImageRotation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Image_eventSetImageRotation_Parms {
  class FRotator aRotation;  // 0 80 CPF_Parm
};


//  GUI_Image.GetProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Image_execGetProperty_Parms {
  class FString aKey;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_Image.SetProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Image_execSetProperty_Parms {
  class FString aKey;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aValue;  // 8 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Image.GetTexTop 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Image_execGetTexTop_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Image.GetTexLeft 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Image_execGetTexLeft_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Image.ResetClipping 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Image_execResetClipping_Parms {
};


//  GUI_Image.SetClipping 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Image_execSetClipping_Parms {
  FLOAT Left;  // 0 80 CPF_Parm
  FLOAT top;  // 4 80 CPF_Parm
  FLOAT width;  // 8 90 CPF_OptionalParm CPF_Parm
  FLOAT Height;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Image.SetMaterial 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Image_execSetMaterial_Parms {
  class UMaterial* aMaterial;  // 0 80 CPF_Parm
};


//  GUI_Image.GetMaterial 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Image_execGetMaterial_Parms {
  class UMaterial* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UGUI_Image 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UGUI_Image : public UObject {
  public:
    FLOAT mTexWidth;  // 28 2 CPF_Const
    FLOAT mTexHeight;  // 2C 2 CPF_Const
    BITFIELD mCustomClipping : 1;  // 30 2 CPF_Const
    FLOAT mColor[4];  // 34 0
    class UGUI_Component* mParent;  // 44 2 CPF_Const
    class UTexRotator* mTextureRotator;  // 48 0
    class FRotator mRotation;  // 4C 0
    class FRotator mRotationPerSecond;  // 58 0
    BITFIELD mVisible : 1;  // 64 0
    INT mImageID;  // 68 0
    INT mData;  // 6C 800000 CPF_Unk_00800000
    virtual ~UGUI_Image(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void SetProperty(class FString const &,class FString const &);
    UGUI_Image(class UGUI_Image const &);
    UGUI_Image(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Image & operator=(class UGUI_Image const &);
    static void CDECL InternalConstructor(void *);
    void SetBackgroundColors(float,float,float,float);
    static class UClass * CDECL StaticClass(void);
    void eventSetImageRotation(class FRotator);
    void execGetMaterial(struct FFrame &,void * const);
    void execGetProperty(struct FFrame &,void * const);
    void execGetTexLeft(struct FFrame &,void * const);
    void execGetTexTop(struct FFrame &,void * const);
    void execResetClipping(struct FFrame &,void * const);
    void execSetClipping(struct FFrame &,void * const);
    void execSetMaterial(struct FFrame &,void * const);
    void execSetProperty(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_Image,0,execGetMaterial)
AUTOGENERATE_FUNCTION(UGUI_Image,0,execGetProperty)
AUTOGENERATE_FUNCTION(UGUI_Image,0,execGetTexLeft)
AUTOGENERATE_FUNCTION(UGUI_Image,0,execGetTexTop)
AUTOGENERATE_FUNCTION(UGUI_Image,0,execResetClipping)
AUTOGENERATE_FUNCTION(UGUI_Image,0,execSetClipping)
AUTOGENERATE_FUNCTION(UGUI_Image,0,execSetMaterial)
AUTOGENERATE_FUNCTION(UGUI_Image,0,execSetProperty)


//------------------------------------------------------------------------------
//  GUI_ImageX
//------------------------------------------------------------------------------

// UGUI_ImageX 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UGUI_ImageX : public UGUI_Image {
  public:
    char Unknown0[32];
    virtual ~UGUI_ImageX(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UGUI_Component *,class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void InvalidateFunctionPtrs(void);
    UGUI_ImageX(class UGUI_ImageX const &);
    UGUI_ImageX(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ImageX & operator=(class UGUI_ImageX const &);
    void EvaluateFunctionPtr(class UGUI_Component *);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_DuffButton
//------------------------------------------------------------------------------

// UGUI_DuffButton 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_DuffButton : public UGUI_Button {
  public:
    char Unknown0[552];
    virtual ~UGUI_DuffButton(void);
    virtual unsigned int GetCPPSize(void);
  protected:
    virtual void Tick(float);
  public:
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void SetVisible(bool);
    virtual void SetDuff(class UFSkill_Event_Duff *,float,float);
    virtual void SetDuffShare(class UFSkill_EffectClass_DuffShare *);
    UGUI_DuffButton(class UGUI_DuffButton const &);
    UGUI_DuffButton(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_DuffButton & operator=(class UGUI_DuffButton const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void eventSetStackSize(int);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_CustomComposition
//------------------------------------------------------------------------------

// UGUI_CustomComposition 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_CustomComposition : public UGUI_Page {
  public:
    char Unknown0[40];
    virtual ~UGUI_CustomComposition(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void InvalidateFunctionPtrs(void);
    UGUI_CustomComposition(class UGUI_CustomComposition const &);
    UGUI_CustomComposition(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_CustomComposition & operator=(class UGUI_CustomComposition const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_Bar
//------------------------------------------------------------------------------

// UGUI_Bar 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Bar : public UGUI_Page {
  public:
    char Unknown0[64];
    virtual ~UGUI_Bar(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void EvaluateFunctionPointers(void);
    virtual float CalculateFame(void);
    virtual float CalculatePep(void);
    UGUI_Bar(class UGUI_Bar const &);
    UGUI_Bar(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Bar & operator=(class UGUI_Bar const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_AttachedWindow
//------------------------------------------------------------------------------

// UGUI_AttachedWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_AttachedWindow : public UGUI_Window {
  public:
    char Unknown0[32];
    virtual ~UGUI_AttachedWindow(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void SetProperty(class FString const &,class FString const &);
    UGUI_AttachedWindow(class UGUI_AttachedWindow const &);
    UGUI_AttachedWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_AttachedWindow & operator=(class UGUI_AttachedWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_GamePawn
//------------------------------------------------------------------------------

// AGUI_GamePawn 236 ( CLASS_Compiled CLASS_Config CLASS_Parsed CLASS_Localized CLASS_NoUserCreate )
class DLL_IMPORT AGUI_GamePawn : public AGame_Pawn {
  public:
    virtual ~AGUI_GamePawn(void);
    virtual unsigned int GetCPPSize(void);
    AGUI_GamePawn(class AGUI_GamePawn const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AGUI_GamePawn & operator=(class AGUI_GamePawn const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    AGUI_GamePawn(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_AvatarImageMaterial
//------------------------------------------------------------------------------

// UGUI_AvatarImageMaterial 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UGUI_AvatarImageMaterial : public UBitmapMaterial {
  public:
    char Unknown0[24];
    virtual ~UGUI_AvatarImageMaterial(void);
    virtual void Destroy(void);
    virtual void CleanWeakPointers(void);
    virtual unsigned int GetCPPSize(void);
    virtual class FBaseTexture * GetRenderInterface(void);
    virtual class UBitmapMaterial * Get(double,class UViewport *);
    UGUI_AvatarImageMaterial(class UGUI_AvatarImageMaterial const &);
    UGUI_AvatarImageMaterial(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_AvatarImageMaterial & operator=(class UGUI_AvatarImageMaterial const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void execPostCreate(struct FFrame &,void * const);
    void execSetAvatarPawn(struct FFrame &,void * const);
  private:
    void CreateGUIGamePawnIfNeeded(void);
    static class UClass PrivateStaticClass;
    void SetAvatarPawn(class AGame_Pawn *);
};
AUTOGENERATE_FUNCTION(UGUI_AvatarImageMaterial,0,execPostCreate)
AUTOGENERATE_FUNCTION(UGUI_AvatarImageMaterial,0,execSetAvatarPawn)


//------------------------------------------------------------------------------
//  GUI_TreeCtrl
//------------------------------------------------------------------------------

#define UCONST_GUI_TreeCtrl_GUI_TIS_EXPANDED 2
#define UCONST_GUI_TreeCtrl_GUI_TIS_BUTTON 1
//  GUI_TreeCtrl.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TreeCtrl_eventInitialize_Parms {
};


//  GUI_TreeCtrl.HideRoot 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TreeCtrl_execHideRoot_Parms {
  BITFIELD HideRoot : 1;  // 0 80 CPF_Parm
};


//  GUI_TreeCtrl.OnItemSelect 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_TreeCtrl_execOnItemSelect_Parms {
  class UGUI_TreeCtrl* Source;  // 0 80 CPF_Parm
  INT itemIndex;  // 4 80 CPF_Parm
  class FString itemText;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class UObject* itemData;  // 10 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.GetSelectedIndex 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TreeCtrl_execGetSelectedIndex_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.HandleComponentClick 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execHandleComponentClick_Parms {
  class UGUI_Component* clickedComponent;  // 0 80 CPF_Parm
  BITFIELD doubleClick : 1;  // 4 90 CPF_OptionalParm CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.GetItemComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execGetItemComponent_Parms {
  INT itemIndex;  // 0 80 CPF_Parm
  class UGUI_Component* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.GetItemIndex 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execGetItemIndex_Parms {
  class UObject* itemData;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.GetItemData 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execGetItemData_Parms {
  INT itemIndex;  // 0 80 CPF_Parm
  class UObject* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.SetItemData 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execSetItemData_Parms {
  INT itemIndex;  // 0 80 CPF_Parm
  class UObject* itemData;  // 4 80 CPF_Parm
};


//  GUI_TreeCtrl.SelectItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execSelectItem_Parms {
  INT itemIndex;  // 0 80 CPF_Parm
};


//  GUI_TreeCtrl.CollapseItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execCollapseItem_Parms {
  INT itemIndex;  // 0 80 CPF_Parm
  BITFIELD collapseChildren : 1;  // 4 80 CPF_Parm
};


//  GUI_TreeCtrl.ExpandItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execExpandItem_Parms {
  INT itemIndex;  // 0 80 CPF_Parm
  BITFIELD expandChildren : 1;  // 4 80 CPF_Parm
};


//  GUI_TreeCtrl.SetItemDrawn 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execSetItemDrawn_Parms {
  INT Index;  // 0 80 CPF_Parm
  BITFIELD IsVisible : 1;  // 4 80 CPF_Parm
};


//  GUI_TreeCtrl.ClearItemIcon 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execClearItemIcon_Parms {
  INT itemIndex;  // 0 80 CPF_Parm
};


//  GUI_TreeCtrl.SetItemIcon 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execSetItemIcon_Parms {
  INT itemIndex;  // 0 80 CPF_Parm
  class FString imageBaseName;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FString TexturePackage;  // C 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 14 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_TreeCtrl.SetItemText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execSetItemText_Parms {
  INT itemIndex;  // 0 80 CPF_Parm
  class FString newText;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.RemoveAllItems 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execRemoveAllItems_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.AddItemText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execAddItemText_Parms {
  INT parentItem;  // 0 80 CPF_Parm
  INT treeItemStyle;  // 4 80 CPF_Parm
  class FString Text;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FColor aColor;  // 10 80 CPF_Parm
  BITFIELD ownerEvents : 1;  // 14 90 CPF_OptionalParm CPF_Parm
  INT intTag;  // 18 90 CPF_OptionalParm CPF_Parm
  INT ReturnValue;  // 1C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.RemoveItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execRemoveItem_Parms {
  INT itemID;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.AddItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execAddItem_Parms {
  INT parentItem;  // 0 80 CPF_Parm
  INT treeItemStyle;  // 4 80 CPF_Parm
  class UGUI_Component* component;  // 8 80 CPF_Parm
  INT ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.SetRootText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execSetRootText_Parms {
  INT treeItemStyle;  // 0 80 CPF_Parm
  class FString Text;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FColor aColor;  // C 80 CPF_Parm
  INT ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TreeCtrl.SetRoot 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TreeCtrl_execSetRoot_Parms {
  INT treeItemStyle;  // 0 80 CPF_Parm
  class UGUI_Component* component;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UGUI_TreeCtrl 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_TreeCtrl : public UGUI_Page {
  public:
    BITFIELD mHideRoot : 1;  // 2E4 0
    INT mSelectedIndex;  // 2E8 0
    class UGUI_Image* mSelectionImage;  // 2EC 0
    struct FScriptDelegate __OnItemSelect__Delegate;  // 2F0 400000 CPF_NeedCtorLink
    INT mTreeCtrlData;  // 2F8 800000 CPF_Unk_00800000
    virtual ~UGUI_TreeCtrl(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void MouseMove(float,float,float,float,int,class UGUI_Component *);
    virtual bool MouseDown(float,float,int,int,class UGUI_Component *);
    virtual bool MouseUp(float,float,int,int,class UGUI_Component *);
    UGUI_TreeCtrl(class UGUI_TreeCtrl const &);
    UGUI_TreeCtrl(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_TreeCtrl & operator=(class UGUI_TreeCtrl const &);
    int AddItem(int,int,class UGUI_Component *);
    int AddItemText(int,int,class FString const &,class FColor const &,bool);
    void ClearItemIcon(int);
    void CollapseItem(int,bool);
    void ExpandItem(int,bool);
    class UGUI_Component * GetItemComponent(int);
    class UObject * GetItemData(int);
    int GetItemIndex(class UObject *);
    static void CDECL InternalConstructor(void *);
    void RemoveItem(int);
    void SelectItem(int);
    void SetItemData(int,class UObject *);
    void SetItemIcon(int,class FString const &,class FString,class FString);
    int SetRoot(int,class UGUI_Component *);
    int SetRootText(int,class FString const &,class FColor const &);
    static class UClass * CDECL StaticClass(void);
    unsigned long delegateOnItemSelect(class UGUI_TreeCtrl *,int,class FString const &,class UObject *);
    void execAddItem(struct FFrame &,void * const);
    void execAddItemText(struct FFrame &,void * const);
    void execClearItemIcon(struct FFrame &,void * const);
    void execCollapseItem(struct FFrame &,void * const);
    void execExpandItem(struct FFrame &,void * const);
    void execGetItemComponent(struct FFrame &,void * const);
    void execGetItemData(struct FFrame &,void * const);
    void execGetItemIndex(struct FFrame &,void * const);
    void execHandleComponentClick(struct FFrame &,void * const);
    void execRemoveAllItems(struct FFrame &,void * const);
    void execRemoveItem(struct FFrame &,void * const);
    void execSelectItem(struct FFrame &,void * const);
    void execSetItemData(struct FFrame &,void * const);
    void execSetItemDrawn(struct FFrame &,void * const);
    void execSetItemIcon(struct FFrame &,void * const);
    void execSetItemText(struct FFrame &,void * const);
    void execSetRoot(struct FFrame &,void * const);
    void execSetRootText(struct FFrame &,void * const);
  private:
    void CollapseItemRecursive(struct UGUI_TreeCtrl::item_desc *);
    void ExpandItemRecursive(struct UGUI_TreeCtrl::item_desc *);
    static class UClass PrivateStaticClass;
    void SetItemDrawn(int,bool);
    void ValidateRecursive(struct UGUI_TreeCtrl::item_desc *,bool,float *,float *);
};
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execAddItem)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execAddItemText)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execClearItemIcon)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execCollapseItem)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execExpandItem)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execGetItemComponent)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execGetItemData)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execGetItemIndex)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execHandleComponentClick)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execRemoveAllItems)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execRemoveItem)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execSelectItem)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execSetItemData)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execSetItemDrawn)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execSetItemIcon)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execSetItemText)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execSetRoot)
AUTOGENERATE_FUNCTION(UGUI_TreeCtrl,0,execSetRootText)


//------------------------------------------------------------------------------
//  GUI_TextCtrl
//------------------------------------------------------------------------------

enum EAlphaDeltaMode {
  ADM_None = 0,
  ADM_FrontToBack = 1,
  ADM_BackToFront = 2
};

//  GUI_TextCtrl.GetLineHeight 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execGetLineHeight_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TextCtrl.GetUseColorCodes 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TextCtrl_execGetUseColorCodes_Parms {
  BITFIELD aUseColorCodes : 1;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TextCtrl.SetUseColorCodes 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TextCtrl_execSetUseColorCodes_Parms {
  BITFIELD aUseColorCodes : 1;  // 0 80 CPF_Parm
};


//  GUI_TextCtrl.ExportToFile 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execExportToFile_Parms {
  class FString fileName;  // 0 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_TextCtrl.Empty 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execEmpty_Parms {
};


//  GUI_TextCtrl.IsEmpty 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execIsEmpty_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TextCtrl.GetShadowColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TextCtrl_execGetShadowColor_Parms {
  class FColor ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TextCtrl.SetShadowColor 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execSetShadowColor_Parms {
  INT R;  // 0 80 CPF_Parm
  INT G;  // 4 80 CPF_Parm
  INT B;  // 8 80 CPF_Parm
  INT A;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_TextCtrl.GetColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TextCtrl_execGetColor_Parms {
  class FColor ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TextCtrl.SetColor 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execSetColor_Parms {
  INT R;  // 0 80 CPF_Parm
  INT G;  // 4 80 CPF_Parm
  INT B;  // 8 80 CPF_Parm
  INT A;  // C 90 CPF_OptionalParm CPF_Parm
};


//  GUI_TextCtrl.AddText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execAddText_Parms {
  class FString Text;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD newline : 1;  // 8 90 CPF_OptionalParm CPF_Parm
};


//  GUI_TextCtrl.SetText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execSetText_Parms {
  class FString Text;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_TextCtrl.GetFont 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execGetFont_Parms {
  class UFont* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TextCtrl.SetFont 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TextCtrl_execSetFont_Parms {
  class FString FontName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_TextCtrl.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TextCtrl_eventInitialize_Parms {
};


// UGUI_TextCtrl 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_TextCtrl : public UGUI_Page {
  public:
    INT mLabelStyle;  // 2E4 0
    class UFont* mFont;  // 2E8 2 CPF_Const
    FLOAT mFontScaleX;  // 2EC 0
    FLOAT mFontScaleY;  // 2F0 0
    INT mBufferSize;  // 2F4 2000000 CPF_EditorData
    BITFIELD mBufferSizeBlock : 1;  // 2F8 2000000 CPF_EditorData
    INT mScrollbackSize;  // 2FC 2000000 CPF_EditorData
    FLOAT mPreviousWidth;  // 300 0
    FLOAT mPreviousHeight;  // 304 0
    class FColor mColor;  // 308 0
    class FColor mShadowColor;  // 30C 0
    BITFIELD mUseColorCodes : 1;  // 310 0
    BITFIELD mTextChanged : 1;  // 310 0
    BYTE mAlphaDeltaMode;  // 314 0
    FLOAT mAlphaDeltaStart;  // 318 0
    FLOAT mAlphaDelta;  // 31C 0
    INT mTextCtrlData;  // 320 800000 CPF_Unk_00800000
    virtual ~UGUI_TextCtrl(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void EvaluateFunctionPointers(void);
    virtual void SetProperty(class FString const &,class FString const &);
    virtual float GetLineAlpha(unsigned int,unsigned int);
    virtual void SetText(class FString const &);
    UGUI_TextCtrl(class UGUI_TextCtrl const &);
    UGUI_TextCtrl(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_TextCtrl & operator=(class UGUI_TextCtrl const &);
    void AddText(class FString const &,bool);
    void Empty(void);
    void ExportToFile(class FString const &);
    class FColor GetColor(void)const ;
    int GetLineHeight(void);
    class FColor GetShadowColor(void)const ;
    class FString GetText(void);
    bool GetUseColorCodes(void)const ;
    static void CDECL InternalConstructor(void *);
    bool IsEmpty(void)const ;
    void SetColor(int,int,int,int);
    void SetShadowColor(int,int,int,int);
    void SetUseColorCodes(bool);
    static class UClass * CDECL StaticClass(void);
    void execAddText(struct FFrame &,void * const);
    void execEmpty(struct FFrame &,void * const);
    void execExportToFile(struct FFrame &,void * const);
    void execGetFont(struct FFrame &,void * const);
    void execGetLineHeight(struct FFrame &,void * const);
    void execIsEmpty(struct FFrame &,void * const);
    void execSetColor(struct FFrame &,void * const);
    void execSetFont(struct FFrame &,void * const);
    void execSetShadowColor(struct FFrame &,void * const);
    void execSetText(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execAddText)
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execEmpty)
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execExportToFile)
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execGetFont)
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execGetLineHeight)
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execIsEmpty)
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execSetColor)
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execSetFont)
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execSetShadowColor)
AUTOGENERATE_FUNCTION(UGUI_TextCtrl,0,execSetText)


//------------------------------------------------------------------------------
//  GUI_TextBoxCtrl
//------------------------------------------------------------------------------

// UGUI_TextBoxCtrl 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_TextBoxCtrl : public UGUI_TextCtrl {
  public:
    char Unknown0[68];
    virtual ~UGUI_TextBoxCtrl(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual bool MouseUp(float,float,int,int,class UGUI_Component *);
  protected:
    virtual bool KeyType(unsigned char &,unsigned short);
    virtual bool KeyEvent(unsigned char &,unsigned char &,float);
  public:
    virtual void EvaluateFunctionPointers(void);
    virtual void SetText(class FString const &);
    UGUI_TextBoxCtrl(class UGUI_TextBoxCtrl const &);
    UGUI_TextBoxCtrl(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_TextBoxCtrl & operator=(class UGUI_TextBoxCtrl const &);
    class FString GetText(void);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long delegateOnEnter(class UGUI_TextBoxCtrl *);
    void delegateOnTextChanged(class UGUI_TextBoxCtrl *);
    void eventTextChanged(void);
    void execGetText(struct FFrame &,void * const);
  private:
    class FString ConvertIllegal(class FString const &);
    void DeleteChar(void);
    int GetCaretPos(void);
    static class UClass PrivateStaticClass;
    void TextChanged(void);
};
AUTOGENERATE_FUNCTION(UGUI_TextBoxCtrl,0,execGetText)


//------------------------------------------------------------------------------
//  GUI_TabCtrl
//------------------------------------------------------------------------------

//  GUI_TabCtrl.SetSelectedColor 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execSetSelectedColor_Parms {
  INT Index;  // 0 80 CPF_Parm
  class FColor aColor;  // 4 80 CPF_Parm
};


//  GUI_TabCtrl.SetUnselectedColor 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execSetUnselectedColor_Parms {
  INT Index;  // 0 80 CPF_Parm
  class FColor aColor;  // 4 80 CPF_Parm
};


//  GUI_TabCtrl.DropPage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TabCtrl_eventDropPage_Parms {
  class UGUI_Page* aPage;  // 0 80 CPF_Parm
  class FString Title;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_TabCtrl.SetTabVisible 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execSetTabVisible_Parms {
  class UGUI_Page* aTabPage;  // 0 80 CPF_Parm
  BITFIELD aVisible : 1;  // 4 80 CPF_Parm
};


//  GUI_TabCtrl.EnableDnD 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TabCtrl_execEnableDnD_Parms {
  BITFIELD Setting : 1;  // 0 80 CPF_Parm
  class FString windowClass;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_TabCtrl.SetEnabled 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TabCtrl_execSetEnabled_Parms {
  BITFIELD B : 1;  // 0 80 CPF_Parm
};


//  GUI_TabCtrl.SetBackgroundColors 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TabCtrl_execSetBackgroundColors_Parms {
  FLOAT R;  // 0 80 CPF_Parm
  FLOAT G;  // 4 80 CPF_Parm
  FLOAT B;  // 8 80 CPF_Parm
  FLOAT A;  // C 80 CPF_Parm
};


//  GUI_TabCtrl.OnPageUndocked 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_TabCtrl_execOnPageUndocked_Parms {
  class UGUI_TabCtrl* aSource;  // 0 80 CPF_Parm
  class UGUI_Window* NewOwner;  // 4 80 CPF_Parm
  class UGUI_Page* undockedPage;  // 8 80 CPF_Parm
};


//  GUI_TabCtrl.OnPageDock 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_TabCtrl_execOnPageDock_Parms {
  class UGUI_TabCtrl* aSource;  // 0 80 CPF_Parm
  class UGUI_Page* aPage;  // 4 80 CPF_Parm
};


//  GUI_TabCtrl.OnTabChanged 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_TabCtrl_execOnTabChanged_Parms {
  class UGUI_TabCtrl* aSource;  // 0 80 CPF_Parm
  class UGUI_Page* aNewSelectedPage;  // 4 80 CPF_Parm
  class UGUI_Page* aPreviousSelectedPage;  // 8 80 CPF_Parm
};


//  GUI_TabCtrl.FindButton 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execFindButton_Parms {
  class UGUI_Page* aPage;  // 0 80 CPF_Parm
  class UGUI_Button* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TabCtrl.DestroyPage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execDestroyPage_Parms {
  class UGUI_Page* aPage;  // 0 80 CPF_Parm
};


//  GUI_TabCtrl.AttachPage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execAttachPage_Parms {
  class UGUI_Page* aPage;  // 0 80 CPF_Parm
  class FString componentTitle;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FString tooltipText;  // C 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_TabCtrl.OnPageDrop 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execOnPageDrop_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  FLOAT relMouseX;  // 4 80 CPF_Parm
  FLOAT relMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* fromChild;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TabCtrl.OnPageDrag 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execOnPageDrag_Parms {
  class UGUI_DnDInfo* dndInfo;  // 0 80 CPF_Parm
  FLOAT relMouseX;  // 4 80 CPF_Parm
  FLOAT relMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* fromChild;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TabCtrl.SetTabComponentColors 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execSetTabComponentColors_Parms {
  FLOAT R;  // 0 80 CPF_Parm
  FLOAT G;  // 4 80 CPF_Parm
  FLOAT B;  // 8 80 CPF_Parm
  FLOAT A;  // C 80 CPF_Parm
};


//  GUI_TabCtrl.SetTabTitle 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execSetTabTitle_Parms {
  class FString Title;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_TabCtrl.GetTabTitle 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execGetTabTitle_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_TabCtrl.GetTabCount 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execGetTabCount_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TabCtrl.GetPageHeight 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execGetPageHeight_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TabCtrl.SetBackground 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execSetBackground_Parms {
  class FString imageBaseName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString TexturePackage;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 10 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  INT backgroundType;  // 18 90 CPF_OptionalParm CPF_Parm
};


//  GUI_TabCtrl.SetSelectedPage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execSetSelectedPage_Parms {
  class UGUI_Page* aPage;  // 0 80 CPF_Parm
};


//  GUI_TabCtrl.GetButton 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execGetButton_Parms {
  INT Index;  // 0 80 CPF_Parm
  class UGUI_Button* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TabCtrl.GetSelectedButton 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execGetSelectedButton_Parms {
  class UGUI_Button* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TabCtrl.GetSelectedPage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execGetSelectedPage_Parms {
  class UGUI_Page* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TabCtrl.CreatePage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TabCtrl_execCreatePage_Parms {
  class FString pageClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT pageStyle;  // C 80 CPF_Parm
  INT Left;  // 10 80 CPF_Parm
  INT top;  // 14 80 CPF_Parm
  INT width;  // 18 90 CPF_OptionalParm CPF_Parm
  INT Height;  // 1C 90 CPF_OptionalParm CPF_Parm
  class FString componentTitle;  // 20 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString tooltipText;  // 28 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class UGUI_Page* ReturnValue;  // 30 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UGUI_TabCtrl 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_TabCtrl : public UGUI_Page {
  public:
    INT mTabCtrlStyle;  // 2E4 0
    INT mMaxButtonsX;  // 2E8 0
    INT mMaxButtonsY;  // 2EC 0
    FLOAT mButtonWidthFactor;  // 2F0 0
    class UGUI_Window* mDragAndDropWindow;  // 2F4 0
    class FString mDnDWindowClass;  // 2F8 400000 CPF_NeedCtorLink
    class FString mBackgroundImageName;  // 300 400000 CPF_NeedCtorLink
    class FString mBackgroundPackage;  // 308 400000 CPF_NeedCtorLink
    class FString mBackgroundSheetfile;  // 310 400000 CPF_NeedCtorLink
    FLOAT mButtonWidth;  // 318 0
    FLOAT mButtonHeight;  // 31C 0
    FLOAT mButtonTop;  // 320 0
    BITFIELD mHasFullTabs : 1;  // 324 0
    BITFIELD mCanDnDTabs : 1;  // 324 0
    class FColor mSelectedButtonColor;  // 328 0
    class FColor mUnselectedButtonColor;  // 32C 0
    struct FScriptDelegate __OnTabChanged__Delegate;  // 330 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnPageDock__Delegate;  // 338 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnPageUndocked__Delegate;  // 340 400000 CPF_NeedCtorLink
    INT mTabCtrlData;  // 348 800000 CPF_Unk_00800000
    virtual ~UGUI_TabCtrl(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void SetBackground(class FString,class FString,class FString,int);
    virtual void MouseMove(float,float,float,float,int,class UGUI_Component *);
    virtual bool WhileMouseDown(float,float,int,int,class UGUI_Component *);
    virtual void SetProperty(class FString const &,class FString const &);
    virtual void TransferComponent(class UGUI_Component *,class UGUI_Page *);
    virtual class UGUI_Page * CreatePage(class FString const &,int,int,int,int,int,int,class FString,class FString);
    virtual struct UGUI_BaseDesktop::base_rect<float> GetChildClientArea(void);
    UGUI_TabCtrl(class UGUI_TabCtrl const &);
    UGUI_TabCtrl(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_TabCtrl & operator=(class UGUI_TabCtrl const &);
    void AttachPage(class UGUI_Page *,class FString const &,class FString const &);
    void DestroyPage(class FString const &);
    void DestroyTab(class UGUI_Page *,bool);
    class UGUI_Button * FindButton(class UGUI_Page *);
    class UGUI_Page * FindPage(class UGUI_Button *);
    float GetPageHeight(void);
    class UGUI_Page * GetSelectedPage(void);
    int GetTabCount(void);
    class FString GetTabTitle(void);
    static void CDECL InternalConstructor(void *);
    bool OnPageDrag(class UGUI_DnDInfo *,float,float,class UGUI_Component *);
    bool OnPageDrop(class UGUI_DnDInfo *,float,float,class UGUI_Component *);
    void SetSelectedColor(int const &,class FColor const &);
    void SetSelectedPage(class UGUI_Page *);
    void SetTabTitle(class FString const &);
    void SetUnselectedColor(int const &,class FColor const &);
    static class UClass * CDECL StaticClass(void);
    void ValidateTabPage(struct UGUI_TabCtrl::tab_desc &,float const &,float const &,unsigned int const &,float const &,float &);
    void delegateOnPageDock(class UGUI_TabCtrl *,class UGUI_Page *);
    void delegateOnPageUndocked(class UGUI_TabCtrl *,class UGUI_Window *,class UGUI_Page *);
    void delegateOnTabChanged(class UGUI_TabCtrl *,class UGUI_Page *,class UGUI_Page *);
    void eventDropPage(class UGUI_Page *,class FString const &);
    void execAttachPage(struct FFrame &,void * const);
    void execCreatePage(struct FFrame &,void * const);
    void execDestroyPage(struct FFrame &,void * const);
    void execFindButton(struct FFrame &,void * const);
    void execGetButton(struct FFrame &,void * const);
    void execGetPageHeight(struct FFrame &,void * const);
    void execGetSelectedButton(struct FFrame &,void * const);
    void execGetSelectedPage(struct FFrame &,void * const);
    void execGetTabCount(struct FFrame &,void * const);
    void execGetTabTitle(struct FFrame &,void * const);
    void execOnPageDrag(struct FFrame &,void * const);
    void execOnPageDrop(struct FFrame &,void * const);
    void execSetBackground(struct FFrame &,void * const);
    void execSetSelectedColor(struct FFrame &,void * const);
    void execSetSelectedPage(struct FFrame &,void * const);
    void execSetTabComponentColors(struct FFrame &,void * const);
    void execSetTabTitle(struct FFrame &,void * const);
    void execSetTabVisible(struct FFrame &,void * const);
    void execSetUnselectedColor(struct FFrame &,void * const);
  private:
    void OrderRows(void);
    static class UClass PrivateStaticClass;
    void SetButtonBackground(struct UGUI_TabCtrl::tab_desc &,int const &,unsigned int const &,bool const &);
    void SetTabComponentColors(float,float,float,float);
};
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execAttachPage)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execCreatePage)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execDestroyPage)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execFindButton)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execGetButton)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execGetPageHeight)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execGetSelectedButton)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execGetSelectedPage)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execGetTabCount)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execGetTabTitle)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execOnPageDrag)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execOnPageDrop)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execSetBackground)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execSetSelectedColor)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execSetSelectedPage)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execSetTabComponentColors)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execSetTabTitle)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execSetTabVisible)
AUTOGENERATE_FUNCTION(UGUI_TabCtrl,0,execSetUnselectedColor)


//------------------------------------------------------------------------------
//  GUI_SplitCtrl
//------------------------------------------------------------------------------

// UGUI_SplitCtrl 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_SplitCtrl : public UGUI_Page {
  public:
    char Unknown0[8];
    virtual ~UGUI_SplitCtrl(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void MouseMove(float,float,float,float,int,class UGUI_Component *);
    virtual class UGUI_Page * CreatePage(class FString const &,int,int,int,int,int,int,class FString,class FString);
    UGUI_SplitCtrl(class UGUI_SplitCtrl const &);
    UGUI_SplitCtrl(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_SplitCtrl & operator=(class UGUI_SplitCtrl const &);
    static void CDECL InternalConstructor(void *);
    void SetSplitRatio(float);
    static class UClass * CDECL StaticClass(void);
    void execCreatePage(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_SplitCtrl,0,execCreatePage)


//------------------------------------------------------------------------------
//  GUI_ListView
//------------------------------------------------------------------------------

#define UCONST_GUI_ListView_LV_HEADER_MARGIN  4
#define UCONST_GUI_ListView_LV_HEADER_HEIGHT  22
#define UCONST_GUI_ListView_LV_COL_ALIGN_RIGHT  2
#define UCONST_GUI_ListView_LV_COL_ALIGN_CENTER  1
#define UCONST_GUI_ListView_LV_COL_ALIGN_LEFT  0
#define UCONST_GUI_ListView_LV_MODE_LIST  1
#define UCONST_GUI_ListView_LV_MODE_REPORT  0
// FListViewItem 0 ( )
struct DLL_IMPORT FListViewItem {
  public:
    class FString pageClass;  // 0 400000 CPF_NeedCtorLink
    class FString Text;  // 8 400000 CPF_NeedCtorLink
    INT Sortable;  // 10 0
    FListViewItem(struct FListViewItem const &);
    FListViewItem(void);
    ~FListViewItem(void);
    struct FListViewItem & operator=(struct FListViewItem const &);
};

//  GUI_ListView.OnHeaderComponentClickHandler 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execOnHeaderComponentClickHandler_Parms {
  class UGUI_Component* sender;  // 0 80 CPF_Parm
  BITFIELD hasDoubleClicked : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.OnRowMouseDownHandler 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execOnRowMouseDownHandler_Parms {
  FLOAT aMouseX;  // 0 80 CPF_Parm
  FLOAT aMouseY;  // 4 80 CPF_Parm
  INT aButtons;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.OnRowMouseUpHandler 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execOnRowMouseUpHandler_Parms {
  FLOAT aMouseX;  // 0 80 CPF_Parm
  FLOAT aMouseY;  // 4 80 CPF_Parm
  INT aButtons;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.OnRowComponentClickHandler 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execOnRowComponentClickHandler_Parms {
  class UGUI_Component* sender;  // 0 80 CPF_Parm
  BITFIELD hasDoubleClicked : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.Sort 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execSort_Parms {
  INT aColumnIndex;  // 0 80 CPF_Parm
};


//  GUI_ListView.SelectRow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execSelectRow_Parms {
  INT aIndex;  // 0 80 CPF_Parm
};


//  GUI_ListView.GetSelectedRowId 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetSelectedRowId_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.GetSelectedRow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetSelectedRow_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.SetImageMaterial 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execSetImageMaterial_Parms {
  INT aColumnIndex;  // 0 80 CPF_Parm
  INT aRowIndex;  // 4 80 CPF_Parm
  class UMaterial* aMaterial;  // 8 80 CPF_Parm
};


//  GUI_ListView.SetImage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execSetImage_Parms {
  INT aColumnIndex;  // 0 80 CPF_Parm
  INT aRowIndex;  // 4 80 CPF_Parm
  class FString aImageBaseName;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString aTexturePackage;  // 10 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString aImageSet;  // 18 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_ListView.SetSortable 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execSetSortable_Parms {
  INT aColumnIndex;  // 0 80 CPF_Parm
  INT aRowIndex;  // 4 80 CPF_Parm
  INT aSortable;  // 8 80 CPF_Parm
  BITFIELD aUpdate : 1;  // C 80 CPF_Parm
};


//  GUI_ListView.SetText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execSetText_Parms {
  INT aColumnIndex;  // 0 80 CPF_Parm
  INT aRowIndex;  // 4 80 CPF_Parm
  class FString aText;  // 8 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_ListView.GetRowPage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetRowPage_Parms {
  INT aColumnIndex;  // 0 80 CPF_Parm
  INT aRowIndex;  // 4 80 CPF_Parm
  class UGUI_Page* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.GetRowLabel 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetRowLabel_Parms {
  INT aColumnIndex;  // 0 80 CPF_Parm
  INT aRowIndex;  // 4 80 CPF_Parm
  class UGUI_Label* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.GetRowTexts 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetRowTexts_Parms {
  INT aRowIndex;  // 0 80 CPF_Parm
  TArray<class FString> ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_ListView.GetRowText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetRowText_Parms {
  INT aColumnIndex;  // 0 80 CPF_Parm
  INT aRowIndex;  // 4 80 CPF_Parm
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_ListView.GetRowCount 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetRowCount_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.RemoveAllRows 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execRemoveAllRows_Parms {
};


//  GUI_ListView.RemoveRow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execRemoveRow_Parms {
  INT aIndex;  // 0 80 CPF_Parm
};


//  GUI_ListView.PackRowItem 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct UGUI_ListView_execPackRowItem_Parms {
  TArray<struct FListViewItem> aItems;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  class FString aPageClass;  // C 400080 CPF_Parm CPF_NeedCtorLink
  class FString aString;  // 14 400080 CPF_Parm CPF_NeedCtorLink
  INT aSortable;  // 1C 80 CPF_Parm
};


//  GUI_ListView.PostAddItems 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execPostAddItems_Parms {
  INT aRowIndex;  // 0 90 CPF_OptionalParm CPF_Parm
};


//  GUI_ListView.AddRowItems 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execAddRowItems_Parms {
  INT aRowId;  // 0 80 CPF_Parm
  TArray<struct FListViewItem> aColumnItems;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD aBulkInsert : 1;  // 10 90 CPF_OptionalParm CPF_Parm
  INT ReturnValue;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.AddRowTexts 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execAddRowTexts_Parms {
  INT aRowId;  // 0 80 CPF_Parm
  TArray<class FString> aColumnTexts;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD aBulkInsert : 1;  // 10 90 CPF_OptionalParm CPF_Parm
  INT ReturnValue;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.GetRowID 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetRowID_Parms {
  INT aRowIndex;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.GetRowIndex 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetRowIndex_Parms {
  INT aRowId;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.GetColumnWidth 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetColumnWidth_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.GetColumnAlignment 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetColumnAlignment_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.GetColumnName 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetColumnName_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_ListView.GetColumnCount 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetColumnCount_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.InsertColumn 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execInsertColumn_Parms {
  class FString aColumnName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT aAlignment;  // 8 80 CPF_Parm
  INT aWidth;  // C 80 CPF_Parm
  INT aColumnIndex;  // 10 80 CPF_Parm
  INT ReturnValue;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.RemoveColumn 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execRemoveColumn_Parms {
  INT aColumnIndex;  // 0 80 CPF_Parm
};


//  GUI_ListView.AddColumn 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execAddColumn_Parms {
  class FString aColumnName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT aAlignment;  // 8 80 CPF_Parm
  INT aWidth;  // C 80 CPF_Parm
  INT ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.ScrollToLastItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execScrollToLastItem_Parms {
};


//  GUI_ListView.ScaleToFit 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execScaleToFit_Parms {
  BITFIELD aHideScrollbar : 1;  // 0 80 CPF_Parm
};


//  GUI_ListView.MayRowsBeSelected 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execMayRowsBeSelected_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.AllowRowSelection 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execAllowRowSelection_Parms {
  BITFIELD Allow : 1;  // 0 80 CPF_Parm
};


//  GUI_ListView.AreColumnHeadersShown 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execAreColumnHeadersShown_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.ShowColumnHeaders 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execShowColumnHeaders_Parms {
  BITFIELD Show : 1;  // 0 80 CPF_Parm
};


//  GUI_ListView.GetViewMode 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execGetViewMode_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ListView.SetViewMode 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ListView_execSetViewMode_Parms {
  BYTE aMode;  // 0 80 CPF_Parm
};


//  GUI_ListView.DefaultColumnHeaderClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ListView_execDefaultColumnHeaderClickHandler_Parms {
  class UGUI_ListView* sender;  // 0 80 CPF_Parm
  INT aColumnIndex;  // 4 80 CPF_Parm
};


//  GUI_ListView.OnSelectionChange 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_ListView_execOnSelectionChange_Parms {
  class UGUI_ListView* sender;  // 0 80 CPF_Parm
  INT aNewSelectionIndex;  // 4 80 CPF_Parm
};


//  GUI_ListView.OnRowDblClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_ListView_execOnRowDblClick_Parms {
  class UGUI_ListView* sender;  // 0 80 CPF_Parm
  INT aColumnIndex;  // 4 80 CPF_Parm
  INT aRowIndex;  // 8 80 CPF_Parm
};


//  GUI_ListView.OnRowRightClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_ListView_execOnRowRightClick_Parms {
  class UGUI_ListView* sender;  // 0 80 CPF_Parm
  INT aColumnIndex;  // 4 80 CPF_Parm
  INT aRowIndex;  // 8 80 CPF_Parm
};


//  GUI_ListView.OnRowClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_ListView_execOnRowClick_Parms {
  class UGUI_ListView* sender;  // 0 80 CPF_Parm
  INT aColumnIndex;  // 4 80 CPF_Parm
  INT aRowIndex;  // 8 80 CPF_Parm
};


//  GUI_ListView.OnColumnHeaderDblClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_ListView_execOnColumnHeaderDblClick_Parms {
  class UGUI_ListView* sender;  // 0 80 CPF_Parm
  INT aColumnIndex;  // 4 80 CPF_Parm
};


//  GUI_ListView.OnColumnHeaderClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_ListView_execOnColumnHeaderClick_Parms {
  class UGUI_ListView* sender;  // 0 80 CPF_Parm
  INT aColumnIndex;  // 4 80 CPF_Parm
};


//  GUI_ListView.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_ListView_eventInitialize_Parms {
};


// UGUI_ListView 401E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UGUI_ListView : public UGUI_Page {
  public:
    INT mRowHeight;  // 2E4 2000000 CPF_EditorData
    INT mHorizMargin;  // 2E8 2000000 CPF_EditorData
    class UGUI_ListViewHeader* mHeader;  // 2EC 2000000 CPF_EditorData
    BYTE mListViewMode;  // 2F0 2000000 CPF_EditorData
    BITFIELD mShowColumnHeaders : 1;  // 2F4 2000000 CPF_EditorData
    BITFIELD mAllowRowSelection : 1;  // 2F4 2000000 CPF_EditorData
    BITFIELD mSorted : 1;  // 2F4 2000000 CPF_EditorData
    INT mSortColumn;  // 2F8 2000000 CPF_EditorData
    BITFIELD mSortAscending : 1;  // 2FC 2000000 CPF_EditorData
    INT mSelectedRow;  // 300 2000000 CPF_EditorData
    class UGUI_Page* mRowsPage;  // 304 2000000 CPF_EditorData
    struct FScriptDelegate __OnColumnHeaderClick__Delegate;  // 308 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnColumnHeaderDblClick__Delegate;  // 310 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnRowClick__Delegate;  // 318 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnRowRightClick__Delegate;  // 320 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnRowDblClick__Delegate;  // 328 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnSelectionChange__Delegate;  // 330 400000 CPF_NeedCtorLink
    INT mData;  // 338 2800000 CPF_Unk_00800000 CPF_EditorData
    virtual ~UGUI_ListView(void);
    virtual unsigned int GetCPPSize(void);
    virtual void SetClientHeight(float);
    UGUI_ListView(class UGUI_ListView const &);
    UGUI_ListView(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ListView & operator=(class UGUI_ListView const &);
    int AddColumn(class FString const &,int,int);
    int AddRowItems(int,class TArray<struct FListViewItem> const &,bool);
    int AddRowSubColumn(int,struct FListViewItem const &);
    int AddRowTexts(int,class TArray<class FString> const &,bool);
    void AllowRowSelection(bool);
    bool AreColumnHeadersShown(void);
    int GetColumnAlignment(int);
    int GetColumnCount(void);
    class FString const & GetColumnName(int);
    int GetColumnWidth(int);
    int GetRowCount(void);
    int GetRowID(int);
    int GetRowIndex(int);
    class UGUI_Label * GetRowLabel(int,int);
    class UGUI_Page * GetRowPage(int,int);
    class FString const & GetRowText(int,int);
    class TArray<class FString> GetRowTexts(int);
    int GetSelectedRow(void);
    int GetSelectedRowId(void);
    int GetViewMode(void);
    int InsertColumn(class FString const &,int,int,int);
    static void CDECL InternalConstructor(void *);
    bool MayRowsBeSelected(void);
    bool OnHeaderComponentClickHandler(class UGUI_Component *,bool);
    bool OnRowComponentClickHandler(class UGUI_Component *,bool);
    bool OnRowMouseDownHandler(float,float,int);
    bool OnRowMouseUpHandler(float,float,int);
    static void CDECL PackRowItem(class TArray<struct FListViewItem> *,class FString const &,class FString const &,int);
    void PostAddItems(int);
    void RemoveAllRows(void);
    void RemoveColumn(int);
    void RemoveRow(int);
    void ScaleToFit(bool);
    void SelectRow(int);
    void SetImage(int,int,class FString const &,class FString,class FString);
    void SetImageMaterial(int,int,class UMaterial *);
    void SetSortable(int,int,int,int);
    void SetText(int,int,class FString const &);
    void SetViewMode(unsigned char);
    void ShowColumnHeaders(bool);
    void Sort(int);
    static class UClass * CDECL StaticClass(void);
    void delegateOnColumnHeaderClick(class UGUI_ListView *,int);
    void delegateOnColumnHeaderDblClick(class UGUI_ListView *,int);
    void delegateOnRowClick(class UGUI_ListView *,int,int);
    void delegateOnRowDblClick(class UGUI_ListView *,int,int);
    void delegateOnRowRightClick(class UGUI_ListView *,int,int);
    void delegateOnSelectionChange(class UGUI_ListView *,int);
    void execAddColumn(struct FFrame &,void * const);
    void execAddRowItems(struct FFrame &,void * const);
    void execAddRowTexts(struct FFrame &,void * const);
    void execAllowRowSelection(struct FFrame &,void * const);
    void execAreColumnHeadersShown(struct FFrame &,void * const);
    void execGetColumnAlignment(struct FFrame &,void * const);
    void execGetColumnCount(struct FFrame &,void * const);
    void execGetColumnName(struct FFrame &,void * const);
    void execGetColumnWidth(struct FFrame &,void * const);
    void execGetRowCount(struct FFrame &,void * const);
    void execGetRowID(struct FFrame &,void * const);
    void execGetRowIndex(struct FFrame &,void * const);
    void execGetRowLabel(struct FFrame &,void * const);
    void execGetRowPage(struct FFrame &,void * const);
    void execGetRowText(struct FFrame &,void * const);
    void execGetRowTexts(struct FFrame &,void * const);
    void execGetSelectedRow(struct FFrame &,void * const);
    void execGetSelectedRowId(struct FFrame &,void * const);
    void execGetViewMode(struct FFrame &,void * const);
    void execInsertColumn(struct FFrame &,void * const);
    void execMayRowsBeSelected(struct FFrame &,void * const);
    void execOnHeaderComponentClickHandler(struct FFrame &,void * const);
    void execOnRowComponentClickHandler(struct FFrame &,void * const);
    void execOnRowMouseDownHandler(struct FFrame &,void * const);
    void execOnRowMouseUpHandler(struct FFrame &,void * const);
    void execPackRowItem(struct FFrame &,void * const);
    void execPostAddItems(struct FFrame &,void * const);
    void execRemoveAllRows(struct FFrame &,void * const);
    void execRemoveColumn(struct FFrame &,void * const);
    void execRemoveRow(struct FFrame &,void * const);
    void execScaleToFit(struct FFrame &,void * const);
    void execScrollToLastItem(struct FFrame &,void * const);
    void execSelectRow(struct FFrame &,void * const);
    void execSetImage(struct FFrame &,void * const);
    void execSetImageMaterial(struct FFrame &,void * const);
    void execSetSortable(struct FFrame &,void * const);
    void execSetText(struct FFrame &,void * const);
    void execSetViewMode(struct FFrame &,void * const);
    void execShowColumnHeaders(struct FFrame &,void * const);
    void execSort(struct FFrame &,void * const);
  protected:
    class UGUI_ListViewHeader * CreateColumnHeader(int,int,int,class FString const &);
    class UGUI_Page * CreateColumnPage(int,int,int);
    static class FString EmptyFString;
    int GetColumnOffset(int);
    int GetRowOffset(int);
    int GetSortedIndexFor(class TArray<struct FListViewItem> const &);
    static class FString LabelClassName;
    void MoveRows(int,int);
    void ResizeColumns(void);
    void ResolveLocation(int,int,int &,int &);
    void UpdateRowColors(int);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execAddColumn)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execAddRowItems)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execAddRowTexts)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execAllowRowSelection)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execAreColumnHeadersShown)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetColumnAlignment)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetColumnCount)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetColumnName)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetColumnWidth)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetRowCount)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetRowID)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetRowIndex)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetRowLabel)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetRowPage)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetRowText)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetRowTexts)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetSelectedRow)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetSelectedRowId)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execGetViewMode)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execInsertColumn)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execMayRowsBeSelected)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execOnHeaderComponentClickHandler)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execOnRowComponentClickHandler)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execOnRowMouseDownHandler)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execOnRowMouseUpHandler)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execPackRowItem)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execPostAddItems)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execRemoveAllRows)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execRemoveColumn)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execRemoveRow)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execScaleToFit)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execScrollToLastItem)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execSelectRow)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execSetImage)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execSetImageMaterial)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execSetSortable)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execSetText)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execSetViewMode)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execShowColumnHeaders)
AUTOGENERATE_FUNCTION(UGUI_ListView,0,execSort)


//------------------------------------------------------------------------------
//  GUI_ListViewHeader
//------------------------------------------------------------------------------

//  GUI_ListViewHeader.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_ListViewHeader_eventInitialize_Parms {
};


// UGUI_ListViewHeader 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_ListViewHeader : public UGUI_Page {
  public:
    class UGUI_Label* mLabel;  // 2E4 0
    class UGUI_Page* mArrowUp;  // 2E8 0
    class UGUI_Page* mArrowDn;  // 2EC 0
    virtual ~UGUI_ListViewHeader(void);
    virtual unsigned int GetCPPSize(void);
    UGUI_ListViewHeader(class UGUI_ListViewHeader const &);
    UGUI_ListViewHeader(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ListViewHeader & operator=(class UGUI_ListViewHeader const &);
    void ClearSorting(void);
    static void CDECL InternalConstructor(void *);
    bool NextSorting(void)const ;
    void SetSorting(bool);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_TrayBox
//------------------------------------------------------------------------------

// UGUI_TrayBox 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_TrayBox : public UGUI_Window {
  public:
    char Unknown0[36];
    virtual ~UGUI_TrayBox(void);
    virtual unsigned int GetCPPSize(void);
    UGUI_TrayBox(class UGUI_TrayBox const &);
    UGUI_TrayBox(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_TrayBox & operator=(class UGUI_TrayBox const &);
    static void CDECL InternalConstructor(void *);
    void Layout(void);
    void SetText(class FString const &);
    static class UClass * CDECL StaticClass(void);
    void execLayout(struct FFrame &,void * const);
    void execSetText(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_TrayBox,0,execLayout)
AUTOGENERATE_FUNCTION(UGUI_TrayBox,0,execSetText)


//------------------------------------------------------------------------------
//  GUI_TabWindow
//------------------------------------------------------------------------------

// UGUI_TabWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_TabWindow : public UGUI_Window {
  public:
    char Unknown0[8];
    virtual ~UGUI_TabWindow(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UGUI_TabWindow(class UGUI_TabWindow const &);
    UGUI_TabWindow(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_TabWindow & operator=(class UGUI_TabWindow const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_MessageBox
//------------------------------------------------------------------------------

//  GUI_MessageBox.HandleKeyEvent 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_MessageBox_eventHandleKeyEvent_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
  BYTE Key;  // 4 180 CPF_Parm CPF_OutParm
  BYTE State;  // 5 180 CPF_Parm CPF_OutParm
  FLOAT delta;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_MessageBox.TryCloseWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_MessageBox_eventTryCloseWindow_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_MessageBox.OnComponentShown 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_MessageBox_execOnComponentShown_Parms {
};


//  GUI_MessageBox.OnComponentHidden 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_MessageBox_execOnComponentHidden_Parms {
};


//  GUI_MessageBox.ClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_MessageBox_execClickHandler_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_MessageBox.AddButton 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_MessageBox_execAddButton_Parms {
  class FString Text;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT Style;  // 8 80 CPF_Parm
};


//  GUI_MessageBox.SetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_MessageBox_execSetText_Parms {
  class FString aText;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_MessageBox.SetFont 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_MessageBox_execSetFont_Parms {
  class FString FontName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_MessageBox.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_MessageBox_eventInitialize_Parms {
};


// UGUI_MessageBox 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_MessageBox : public UGUI_Window {
  public:
    INT mMessageBoxStyle;  // 37C 0
    TArray<class UGUI_Button*> mButtons;  // 380 400000 CPF_NeedCtorLink
    class UGUI_Component* mOwner;  // 38C 0
    class UGUI_Page* mMessagePage;  // 390 0
    class UGUI_Page* mButtonPage;  // 394 0
    class UGUI_TextCtrl* mTextCtrl;  // 398 0
    INT mMinMessageHeight;  // 39C 2000000 CPF_EditorData
    BITFIELD mWasDesktopActive : 1;  // 3A0 0
    virtual ~UGUI_MessageBox(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    UGUI_MessageBox(class UGUI_MessageBox const &);
    UGUI_MessageBox(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_MessageBox & operator=(class UGUI_MessageBox const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long eventHandleKeyEvent(class UGUI_Component *,unsigned char &,unsigned char &,float);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_ContextMenu
//------------------------------------------------------------------------------

// UGUI_ContextMenu 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_ContextMenu : public UGUI_Window {
  public:
    virtual ~UGUI_ContextMenu(void);
    virtual unsigned int GetCPPSize(void);
    UGUI_ContextMenu(class UGUI_ContextMenu const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ContextMenu & operator=(class UGUI_ContextMenu const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UGUI_ContextMenu(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_TitleBar
//------------------------------------------------------------------------------

//  GUI_TitleBar.EnableMove 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TitleBar_eventEnableMove_Parms {
  BITFIELD Setting : 1;  // 0 80 CPF_Parm
};


//  GUI_TitleBar.EnableClose 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TitleBar_eventEnableClose_Parms {
  BITFIELD Setting : 1;  // 0 80 CPF_Parm
};


//  GUI_TitleBar.EnableMinimize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TitleBar_eventEnableMinimize_Parms {
  BITFIELD Setting : 1;  // 0 80 CPF_Parm
};


//  GUI_TitleBar.SystemClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TitleBar_execSystemClickHandler_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TitleBar.CloseClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TitleBar_execCloseClickHandler_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_TitleBar.SetIcon 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TitleBar_execSetIcon_Parms {
  class FString imageBaseName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString texturePackages;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  class FString imageSet;  // 10 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_TitleBar.SetTitle 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_TitleBar_execSetTitle_Parms {
  class FString Text;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_TitleBar.SetWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TitleBar_eventSetWindow_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  GUI_TitleBar.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TitleBar_eventInitialize_Parms {
};


//  GUI_TitleBar.OnCloseClick 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_TitleBar_execOnCloseClick_Parms {
  class UGUI_Button* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UGUI_TitleBar 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_TitleBar : public UGUI_Page {
  public:
    class UGUI_Button* mSystemButton;  // 2E4 0
    class UGUI_Label* mTitleLabel;  // 2E8 0
    class UGUI_Button* mCloseButton;  // 2EC 0
    class UGUI_Button* mMaximizeButton;  // 2F0 0
    class UGUI_Button* mMinimizeButton;  // 2F4 0
    class UGUI_Button* mRestoreButton;  // 2F8 0
    class UGUI_Window* mWindow;  // 2FC 0
    class UGUI_Image* mWindowHeaderFrame;  // 300 0
    class UGUI_Image* mOrnamentLeft;  // 304 0
    class UGUI_Image* mOrnamentRight;  // 308 0
    struct FScriptDelegate __OnCloseClick__Delegate;  // 30C 400000 CPF_NeedCtorLink
    virtual ~UGUI_TitleBar(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void DrawBackground(class UCanvas *,struct UGUI_Desktop::draw_context &,struct UGUI_BaseDesktop::base_rect<float> *);
    virtual void SetIcon(class FString,class FString,class FString);
    virtual void SetTitle(class FString const &);
    UGUI_TitleBar(class UGUI_TitleBar const &);
    UGUI_TitleBar(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_TitleBar & operator=(class UGUI_TitleBar const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long delegateOnCloseClick(class UGUI_Button *);
    void eventEnableClose(unsigned long);
    void eventEnableMinimize(unsigned long);
    void eventEnableMove(unsigned long);
    void eventSetWindow(class UGUI_Window *);
    void execSetIcon(struct FFrame &,void * const);
    void execSetTitle(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_TitleBar,0,execSetIcon)
AUTOGENERATE_FUNCTION(UGUI_TitleBar,0,execSetTitle)


//------------------------------------------------------------------------------
//  GUI_TextButton
//------------------------------------------------------------------------------

//  GUI_TextButton.SetUnselectedSolidBackground 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TextButton_execSetUnselectedSolidBackground_Parms {
  INT R;  // 0 80 CPF_Parm
  INT G;  // 4 80 CPF_Parm
  INT B;  // 8 80 CPF_Parm
  INT A;  // C 80 CPF_Parm
};


//  GUI_TextButton.SetSelectedSolidBackground 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TextButton_execSetSelectedSolidBackground_Parms {
  INT R;  // 0 80 CPF_Parm
  INT G;  // 4 80 CPF_Parm
  INT B;  // 8 80 CPF_Parm
  INT A;  // C 80 CPF_Parm
};


//  GUI_TextButton.SetColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TextButton_execSetColor_Parms {
  INT R;  // 0 80 CPF_Parm
  INT G;  // 4 80 CPF_Parm
  INT B;  // 8 80 CPF_Parm
  INT A;  // C 80 CPF_Parm
};


//  GUI_TextButton.SetSelectedColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TextButton_execSetSelectedColor_Parms {
  INT R;  // 0 80 CPF_Parm
  INT G;  // 4 80 CPF_Parm
  INT B;  // 8 80 CPF_Parm
  INT A;  // C 80 CPF_Parm
};


//  GUI_TextButton.SetButtonImage 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_TextButton_execSetButtonImage_Parms {
  INT num;  // 0 80 CPF_Parm
};


//  GUI_TextButton.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_TextButton_eventInitialize_Parms {
};


//  GUI_TextButton.OnCheck 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_TextButton_execOnCheck_Parms {
  class UGUI_TextButton* clickedButton;  // 0 80 CPF_Parm
  BITFIELD checkState : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UGUI_TextButton 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_TextButton : public UGUI_TextCtrl {
  public:
    INT mButtonStyle;  // 324 0
    BITFIELD mHilited : 1;  // 328 0
    BITFIELD mChecked : 1;  // 328 0
    class UGUI_Image* mHiliteImage;  // 32C 0
    class UGUI_Image* mButtonImage;  // 330 0
    class UGUI_Image* mButtonImage1;  // 334 0
    class UGUI_Image* mButtonImage2;  // 338 0
    class UGUI_Image* mButtonImage3;  // 33C 0
    class UGUI_Image* mButtonImage4;  // 340 0
    class UGUI_Image* mButtonImage5;  // 344 0
    class UGUI_Image* mButtonImage6;  // 348 0
    class FColor mSelectedColor;  // 34C 0
    class FColor mUnselectedColor;  // 350 0
    class FColor mSelectedBackgroundColor;  // 354 0
    class FColor mUnselectedBackgroundColor;  // 358 0
    BITFIELD mPressed : 1;  // 35C 2000000 CPF_EditorData
    struct FScriptDelegate __OnCheck__Delegate;  // 360 400000 CPF_NeedCtorLink
    virtual ~UGUI_TextButton(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Invalidate(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual bool WhileMouseDown(float,float,int,int,class UGUI_Component *);
    virtual bool Hilite(class UGUI_Component *);
    virtual bool DeHilite(class UGUI_Component *);
    virtual void ComponentClick(class UGUI_Component *,bool);
    virtual void EvaluateFunctionPointers(void);
    UGUI_TextButton(class UGUI_TextButton const &);
    UGUI_TextButton(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_TextButton & operator=(class UGUI_TextButton const &);
    static void CDECL InternalConstructor(void *);
    bool IsPressed(void)const ;
    void SetPressed(bool);
    static class UClass * CDECL StaticClass(void);
    unsigned long delegateOnCheck(class UGUI_TextButton *,unsigned long);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_ScrollBar
//------------------------------------------------------------------------------

#define UCONST_GUI_ScrollBar_SCROLLBAR_SIZE_W  17.0f
#define UCONST_GUI_ScrollBar_GUI_SBS_VERTICAL  1
#define UCONST_GUI_ScrollBar_GUI_SBS_HORIZONTAL  0
//  GUI_ScrollBar.ScrollToEnd 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ScrollBar_execScrollToEnd_Parms {
};


//  GUI_ScrollBar.SetEnabled 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ScrollBar_execSetEnabled_Parms {
  BITFIELD State : 1;  // 0 80 CPF_Parm
};


//  GUI_ScrollBar.SetScrollOffset 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ScrollBar_execSetScrollOffset_Parms {
  FLOAT Offset;  // 0 80 CPF_Parm
};


// UGUI_ScrollBar 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_ScrollBar : public UGUI_Page {
  public:
    INT mDirection;  // 2E4 0
    FLOAT mScrollRange;  // 2E8 0
    FLOAT mScrollOffset;  // 2EC 0
    FLOAT mMoveAnchor[2];  // 2F0 0
    BITFIELD mRemoveWhenDisabled : 1;  // 2F8 0
    class UGUI_Button* mUpButton;  // 2FC 0
    class UGUI_Button* mDownButton;  // 300 0
    class UGUI_Button* mThumbnail;  // 304 0
    class UGUI_Page* mThumbnailBackground;  // 308 0
    virtual ~UGUI_ScrollBar(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Initialize(void);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void SetEnabled(bool);
    virtual void MouseMove(float,float,float,float,int,class UGUI_Component *);
    virtual bool WhileMouseDown(float,float,int,int,class UGUI_Component *);
    virtual bool MouseDown(float,float,int,int,class UGUI_Component *);
    virtual bool MouseUp(float,float,int,int,class UGUI_Component *);
    UGUI_ScrollBar(class UGUI_ScrollBar const &);
    UGUI_ScrollBar(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ScrollBar & operator=(class UGUI_ScrollBar const &);
    float GetThumbnailSize(void);
    static void CDECL InternalConstructor(void *);
    bool IsPressed(void)const ;
    void ScrollToEnd(void);
    void SetDirection(int);
    void SetScrollOffset(float);
    static class UClass * CDECL StaticClass(void);
    void execScrollToEnd(struct FFrame &,void * const);
    void execSetEnabled(struct FFrame &,void * const);
    void execSetScrollOffset(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_ScrollBar,0,execScrollToEnd)
AUTOGENERATE_FUNCTION(UGUI_ScrollBar,0,execSetEnabled)
AUTOGENERATE_FUNCTION(UGUI_ScrollBar,0,execSetScrollOffset)


//------------------------------------------------------------------------------
//  GUI_Slider
//------------------------------------------------------------------------------

// UGUI_Slider 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Slider : public UGUI_ScrollBar {
  public:
    char Unknown0[12];
    virtual ~UGUI_Slider(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void SetEnabled(bool);
    virtual void MouseMove(float,float,float,float,int,class UGUI_Component *);
    UGUI_Slider(class UGUI_Slider const &);
    UGUI_Slider(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Slider & operator=(class UGUI_Slider const &);
    float GetValue(void);
    static void CDECL InternalConstructor(void *);
    void SetRange(float);
    void SetValue(float);
    static class UClass * CDECL StaticClass(void);
    void delegateOnValueChanged(class UGUI_Slider *,float);
    void execGetValue(struct FFrame &,void * const);
    void execSetEnabled(struct FFrame &,void * const);
    void execSetRange(struct FFrame &,void * const);
    void execSetValue(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_Slider,0,execGetValue)
AUTOGENERATE_FUNCTION(UGUI_Slider,0,execSetEnabled)
AUTOGENERATE_FUNCTION(UGUI_Slider,0,execSetRange)
AUTOGENERATE_FUNCTION(UGUI_Slider,0,execSetValue)


//------------------------------------------------------------------------------
//  GUI_Mesh
//------------------------------------------------------------------------------

//  GUI_Mesh.SetActorTranslation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Mesh_eventSetActorTranslation_Parms {
  class FVector aTranslation;  // 0 80 CPF_Parm
};


//  GUI_Mesh.SetActorRotation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Mesh_eventSetActorRotation_Parms {
  class FRotator aRotator;  // 0 80 CPF_Parm
};


//  GUI_Mesh.ResetLookAtPosition 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Mesh_execResetLookAtPosition_Parms {
};


//  GUI_Mesh.SetCameraLookAtDistance 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Mesh_execSetCameraLookAtDistance_Parms {
  FLOAT Distance;  // 0 80 CPF_Parm
};


//  GUI_Mesh.SetCameraLookAtPosition 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Mesh_execSetCameraLookAtPosition_Parms {
  class FVector lookAtPosition;  // 0 80 CPF_Parm
};


//  GUI_Mesh.SetCameraLookAtParams 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Mesh_execSetCameraLookAtParams_Parms {
  class FVector lookAtPosition;  // 0 80 CPF_Parm
  FLOAT Distance;  // C 80 CPF_Parm
};


//  GUI_Mesh.SetRoll 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Mesh_execSetRoll_Parms {
  FLOAT targetRoll;  // 0 80 CPF_Parm
  FLOAT targetTime;  // 4 80 CPF_Parm
  INT direction;  // 8 80 CPF_Parm
};


//  GUI_Mesh.SetMeshMaterial 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Mesh_execSetMeshMaterial_Parms {
  INT materialID;  // 0 80 CPF_Parm
  class UMaterial* newMaterial;  // 4 80 CPF_Parm
};


//  GUI_Mesh.GetMeshActor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Mesh_execGetMeshActor_Parms {
  class AActor* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Mesh.UseLevelLighting 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Mesh_execUseLevelLighting_Parms {
  BITFIELD aUseLevelLighting : 1;  // 0 80 CPF_Parm
};


//  GUI_Mesh.ShowMesh 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Mesh_eventShowMesh_Parms {
  BITFIELD aShowFlag : 1;  // 0 80 CPF_Parm
};


//  GUI_Mesh.ShowMeshActor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Mesh_execShowMeshActor_Parms {
  BITFIELD aShowFlag : 1;  // 0 80 CPF_Parm
};


//  GUI_Mesh.SetMeshActor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Mesh_execSetMeshActor_Parms {
  class AActor* aPawn;  // 0 80 CPF_Parm
};


//  GUI_Mesh.SetStaticMesh 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Mesh_eventSetStaticMesh_Parms {
  class UStaticMesh* aNewMesh;  // 0 80 CPF_Parm
};


//  GUI_Mesh.LoadStaticMesh 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Mesh_eventLoadStaticMesh_Parms {
  class FString aName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Mesh.MakeMeshActorWhenNeeded 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Mesh_eventMakeMeshActorWhenNeeded_Parms {
};


//  GUI_Mesh.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Mesh_eventInitialize_Parms {
};


// UGUI_Mesh 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Mesh : public UGUI_Component {
  public:
    class UStaticMesh* mStaticMesh;  // 2C8 0
    class FVector mPawnTranslation;  // 2CC 0
    BITFIELD mAutoCenter : 1;  // 2D8 0
    FLOAT mYaw;  // 2DC 0
    FLOAT mPitch;  // 2E0 0
    FLOAT mRoll;  // 2E4 0
    FLOAT mDistance;  // 2E8 0
    FLOAT mFOV;  // 2EC 0
    BITFIELD mClearZ : 1;  // 2F0 0
    class FRotator mMeshRotation;  // 2F4 0
    class FRotator mAppliedRotation;  // 300 0
    class FRotator mUserRotation;  // 30C 0
    FLOAT mLastTick;  // 318 0
    FLOAT mMeshWidth;  // 31C 0
    FLOAT mMeshHeight;  // 320 0
    BITFIELD mIsTranslating : 1;  // 324 0
    class FVector mStartTranslation;  // 328 0
    FLOAT mStartTranslationTime;  // 334 0
    class FVector mEndTranslation;  // 338 0
    FLOAT mEndTranslationTime;  // 344 0
    BITFIELD mIsRotating : 1;  // 348 0
    BITFIELD mJustFinishedRotating : 1;  // 348 0
    INT mRollDirection;  // 34C 0
    FLOAT mStartYaw;  // 350 0
    FLOAT mStartPitch;  // 354 0
    FLOAT mStartRoll;  // 358 0
    FLOAT mStartRotationTime;  // 35C 0
    FLOAT mEndYaw;  // 360 0
    FLOAT mEndPitch;  // 364 0
    FLOAT mEndRoll;  // 368 0
    FLOAT mEndRotationTime;  // 36C 0
    class AActor* mMeshActor;  // 370 0
    INT TopDownRotation;  // 374 2000000 CPF_EditorData
    BITFIELD UseCameraLookAtLocation : 1;  // 378 0
    BITFIELD UsePawnLocationAsLookAtLocation : 1;  // 378 0
    class FVector CameraLookAtLocation;  // 37C 0
    FLOAT CameraDistance;  // 388 0
    BITFIELD mShowMesh : 1;  // 38C 0
    BITFIELD mUseLevelLighting : 1;  // 38C 0
    class FVector mTranslation;  // 390 0
    virtual ~UGUI_Mesh(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Tick(float);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void SetVisible(bool);
    virtual void SetFunctionPtr(int,int,float);
    virtual void InvalidateFunctionPtrs(void);
    virtual void EvaluateFunctionPointers(void);
    virtual void SetProperty(class FString const &,class FString const &);
    UGUI_Mesh(class UGUI_Mesh const &);
    UGUI_Mesh(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Mesh & operator=(class UGUI_Mesh const &);
    static void CDECL InternalConstructor(void *);
    void SetMeshMaterial(int,class UMaterial *);
    void SetRoll(float,float,int);
    static class UClass * CDECL StaticClass(void);
    void UpdateRotation(float);
    void UpdateTranslation(void);
    void eventLoadStaticMesh(class FString const &);
    void eventMakeMeshActorWhenNeeded(void);
    void eventSetActorRotation(class FRotator);
    void eventSetActorTranslation(class FVector);
    void eventSetStaticMesh(class UStaticMesh *);
    void eventShowMesh(unsigned long);
    void execSetMeshMaterial(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_Mesh,0,execSetMeshMaterial)


//------------------------------------------------------------------------------
//  GUI_RotatableMesh
//------------------------------------------------------------------------------

// UGUI_RotatableMesh 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_RotatableMesh : public UGUI_Mesh {
  public:
    char Unknown0[88];
    virtual ~UGUI_RotatableMesh(void);
    virtual unsigned int GetCPPSize(void);
    virtual int GetMouseOverCursor(void);
    virtual int GetMouseDownCursor(void);
    UGUI_RotatableMesh(class UGUI_RotatableMesh const &);
    UGUI_RotatableMesh(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_RotatableMesh & operator=(class UGUI_RotatableMesh const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_MeshActor
//------------------------------------------------------------------------------

// AGUI_MeshActor 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT AGUI_MeshActor : public AActor {
  public:
    virtual ~AGUI_MeshActor(void);
    virtual void Destroy(void);
    virtual unsigned int GetCPPSize(void);
    AGUI_MeshActor(class AGUI_MeshActor const &);
    AGUI_MeshActor(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class AGUI_MeshActor & operator=(class AGUI_MeshActor const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_ListBox
//------------------------------------------------------------------------------

// UGUI_ListBox 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_ListBox : public UGUI_Page {
  public:
    char Unknown0[40];
    virtual ~UGUI_ListBox(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Invalidate(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UGUI_ListBox(class UGUI_ListBox const &);
    UGUI_ListBox(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ListBox & operator=(class UGUI_ListBox const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    unsigned long delegateOnItemSelect(class UGUI_ListBox *,int,class FString const &);
    void execAddItem(struct FFrame &,void * const);
    void execGetFont(struct FFrame &,void * const);
    void execHandleComponentClick(struct FFrame &,void * const);
    void execSetColor(struct FFrame &,void * const);
    void execSetFont(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_ListBox,0,execAddItem)
AUTOGENERATE_FUNCTION(UGUI_ListBox,0,execGetFont)
AUTOGENERATE_FUNCTION(UGUI_ListBox,0,execHandleComponentClick)
AUTOGENERATE_FUNCTION(UGUI_ListBox,0,execSetColor)
AUTOGENERATE_FUNCTION(UGUI_ListBox,0,execSetFont)


//------------------------------------------------------------------------------
//  GUI_KeyEditButton
//------------------------------------------------------------------------------

// UGUI_KeyEditButton 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_KeyEditButton : public UGUI_Button {
  public:
    char Unknown0[12];
    virtual ~UGUI_KeyEditButton(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual bool KeyType(unsigned char &,unsigned short);
    virtual bool KeyEvent(unsigned char &,unsigned char &,float);
    UGUI_KeyEditButton(class UGUI_KeyEditButton const &);
    UGUI_KeyEditButton(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_KeyEditButton & operator=(class UGUI_KeyEditButton const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void delegateOnFocusLost(class UGUI_Component *);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_IconButton
//------------------------------------------------------------------------------

// UGUI_IconButton 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_IconButton : public UGUI_Button {
  public:
    virtual ~UGUI_IconButton(void);
    virtual unsigned int GetCPPSize(void);
    virtual void DrawBackground(class UCanvas *,struct UGUI_Desktop::draw_context &,struct UGUI_BaseDesktop::base_rect<float> *);
    virtual void DrawIcon(class UCanvas *,struct UGUI_Desktop::draw_context &);
    UGUI_IconButton(class UGUI_IconButton const &);
    UGUI_IconButton(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_IconButton & operator=(class UGUI_IconButton const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_EditBox
//------------------------------------------------------------------------------

//  GUI_EditBox.OnEnter 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_EditBox_execOnEnter_Parms {
  class UGUI_EditBox* editBox;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_EditBox.OnTextChanged 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_EditBox_execOnTextChanged_Parms {
  class UGUI_EditBox* editBox;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_EditBox.OnFocus 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_EditBox_eventOnFocus_Parms {
  BITFIELD State : 1;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_EditBox.UpdateCaretPosition 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_EditBox_execUpdateCaretPosition_Parms {
};


//  GUI_EditBox.TextChanged 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_EditBox_eventTextChanged_Parms {
};


//  GUI_EditBox.Clear 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_EditBox_execClear_Parms {
};


//  GUI_EditBox.GetText 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_EditBox_execGetText_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_EditBox.SetText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_EditBox_execSetText_Parms {
  class FString Text;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_EditBox.SetColor 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_EditBox_execSetColor_Parms {
  FLOAT R;  // 0 80 CPF_Parm
  FLOAT G;  // 4 80 CPF_Parm
  FLOAT B;  // 8 80 CPF_Parm
};


//  GUI_EditBox.GetFont 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_EditBox_execGetFont_Parms {
  class UFont* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_EditBox.SetFont 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_EditBox_execSetFont_Parms {
  class FString FontName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_EditBox.UpdateNumericalLimitation 80002 0 ( FUNC_Defined FUNC_Protected )
struct UGUI_EditBox_execUpdateNumericalLimitation_Parms {
};


//  GUI_EditBox.SetNumericalLimitation 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_EditBox_execSetNumericalLimitation_Parms {
  BITFIELD aIntOnly : 1;  // 0 80 CPF_Parm
  BITFIELD aFloatOnly : 1;  // 4 80 CPF_Parm
  BITFIELD aSigned : 1;  // 8 80 CPF_Parm
};


//  GUI_EditBox.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_EditBox_eventInitialize_Parms {
};


// UGUI_EditBox 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_EditBox : public UGUI_Component {
  public:
    INT mEditBoxStyle;  // 2C8 0
    class UFont* mFont;  // 2CC 2 CPF_Const
    FLOAT mFontScaleX;  // 2D0 0
    FLOAT mFontScaleY;  // 2D4 0
    class FString mText;  // 2D8 400000 CPF_NeedCtorLink
    class FString mPrefix;  // 2E0 400000 CPF_NeedCtorLink
    FLOAT mScrollX;  // 2E8 0
    INT mCaretPos;  // 2EC 0
    INT mCaretPosPrev;  // 2F0 0
    FLOAT mCaretX;  // 2F4 0
    INT mSelStart;  // 2F8 0
    INT mSelEnd;  // 2FC 0
    BITFIELD mAllSelected : 1;  // 300 0
    class FColor mColor;  // 304 0
    class FColor mPrefixColor;  // 308 0
    FLOAT mBorderOffsets[4];  // 30C 2000000 CPF_EditorData
    INT mMaxLength;  // 31C 0
    BITFIELD mIsReadOnly : 1;  // 320 0
    class FString mAllowedCharSet;  // 324 400000 CPF_NeedCtorLink
    BITFIELD mIntOnly : 1;  // 32C 2000000 CPF_EditorData
    BITFIELD mFloatOnly : 1;  // 32C 2000000 CPF_EditorData
    BITFIELD mSigned : 1;  // 32C 2000000 CPF_EditorData
    FLOAT mClipX0;  // 330 0
    FLOAT mClipX1;  // 334 0
    FLOAT mClipY0;  // 338 0
    FLOAT mClipY1;  // 33C 0
    class UGUI_Image* mCursorImage;  // 340 0
    FLOAT mScrollDistance;  // 344 0
    struct FScriptDelegate __OnTextChanged__Delegate;  // 348 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnEnter__Delegate;  // 350 400000 CPF_NeedCtorLink
    virtual ~UGUI_EditBox(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void Draw(class UCanvas *,struct UGUI_Desktop::draw_context &);
  protected:
    virtual bool KeyType(unsigned char &,unsigned short);
    virtual bool KeyEvent(unsigned char &,unsigned char &,float);
  public:
    virtual class FString GetProperty(class FString const &,class UObject *);
    virtual void UpdateCaretPosition(struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual bool HandlesKey(unsigned char const &);
  protected:
    virtual void DrawCursor(class UCanvas *,struct UGUI_Desktop::draw_context &);
    virtual void DrawTextW(class UCanvas *,struct UGUI_Desktop::draw_context &,class FString const &,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual class FString DetermineText(void);
    virtual struct UGUI_BaseDesktop::base_rect<float> DetermineBounds(class FString);
    virtual struct UGUI_BaseDesktop::base_rect<float> GetClipRect(void);
  public:
    UGUI_EditBox(class UGUI_EditBox const &);
    UGUI_EditBox(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_EditBox & operator=(class UGUI_EditBox const &);
    static void CDECL InternalConstructor(void *);
    void SetColor(float,float,float);
    void SetText(class FString const &);
    static class UClass * CDECL StaticClass(void);
    unsigned long delegateOnEnter(class UGUI_EditBox *);
    unsigned long delegateOnTextChanged(class UGUI_EditBox *);
    void eventTextChanged(void);
    void execGetFont(struct FFrame &,void * const);
    void execSetFont(struct FFrame &,void * const);
    void execSetText(struct FFrame &,void * const);
    void execUpdateCaretPosition(struct FFrame &,void * const);
  private:
    void ClipText(class FString *);
    class FString ConvertIllegal(class FString const &);
    void DeleteChar(void);
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_EditBox,0,execGetFont)
AUTOGENERATE_FUNCTION(UGUI_EditBox,0,execSetFont)
AUTOGENERATE_FUNCTION(UGUI_EditBox,0,execSetText)
AUTOGENERATE_FUNCTION(UGUI_EditBox,0,execUpdateCaretPosition)


//------------------------------------------------------------------------------
//  GUI_ComboBoxDropDown
//------------------------------------------------------------------------------

//  GUI_ComboBoxDropDown.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_ComboBoxDropDown_eventInitialize_Parms {
};


// UGUI_ComboBoxDropDown 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_ComboBoxDropDown : public UGUI_ContextWindow {
  public:
    INT mSelectedID;  // 384 2000000 CPF_EditorData
    INT mNumItems;  // 388 0
    class UGUI_ComboBox* ComboBox;  // 38C 2000000 CPF_EditorData
    INT mComboBoxData;  // 390 800000 CPF_Unk_00800000
    virtual ~UGUI_ComboBoxDropDown(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void MouseMove(float,float,float,float,int,class UGUI_Component *);
    virtual bool MouseDown(float,float,int,int,class UGUI_Component *);
    virtual bool MouseUp(float,float,int,int,class UGUI_Component *);
    UGUI_ComboBoxDropDown(class UGUI_ComboBoxDropDown const &);
    UGUI_ComboBoxDropDown(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ComboBoxDropDown & operator=(class UGUI_ComboBoxDropDown const &);
    void AddItem(int,class FString const &,class FString const &);
    int FindData(class FString const &)const ;
    int FindItem(class FString const &)const ;
    class FString GetItemData(int)const ;
    class FString GetItemText(int)const ;
    int GetNumItems(void)const ;
    int GetSelection(void)const ;
    static void CDECL InternalConstructor(void *);
    void RemoveAllItems(void);
    void RemoveItem(int);
    bool SelectItem(int);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_ComboBox
//------------------------------------------------------------------------------

//  GUI_ComboBox.GetItemData 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execGetItemData_Parms {
  INT itemID;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_ComboBox.GetItemText 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execGetItemText_Parms {
  INT itemID;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_ComboBox.IsExpanded 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execIsExpanded_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ComboBox.GetNumItems 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execGetNumItems_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ComboBox.GetSelection 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execGetSelection_Parms {
  INT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ComboBox.ExpandList 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execExpandList_Parms {
  BITFIELD State : 1;  // 0 80 CPF_Parm
};


//  GUI_ComboBox.SelectItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execSelectItem_Parms {
  INT itemID;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ComboBox.FindData 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execFindData_Parms {
  class FString itemData;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ComboBox.FindItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execFindItem_Parms {
  class FString itemText;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ComboBox.RemoveAllItems 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execRemoveAllItems_Parms {
};


//  GUI_ComboBox.RemoveItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execRemoveItem_Parms {
  INT itemID;  // 0 80 CPF_Parm
};


//  GUI_ComboBox.AddItem 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_ComboBox_execAddItem_Parms {
  INT itemID;  // 0 80 CPF_Parm
  class FString itemText;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FString itemData;  // C 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  GUI_ComboBox.OnItemChange 120000 0 ( FUNC_Public FUNC_Delegate )
struct UGUI_ComboBox_execOnItemChange_Parms {
  class UGUI_Component* sender;  // 0 80 CPF_Parm
  INT newItemIndex;  // 4 80 CPF_Parm
};


//  GUI_ComboBox.SelectedLabelMouseDownHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ComboBox_execSelectedLabelMouseDownHandler_Parms {
  FLOAT MouseX;  // 0 80 CPF_Parm
  FLOAT MouseY;  // 4 80 CPF_Parm
  INT buttons;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ComboBox.ExpandButtonMouseDownHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_ComboBox_execExpandButtonMouseDownHandler_Parms {
  FLOAT MouseX;  // 0 80 CPF_Parm
  FLOAT MouseY;  // 4 80 CPF_Parm
  INT buttons;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_ComboBox.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_ComboBox_eventInitialize_Parms {
};


// UGUI_ComboBox 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_ComboBox : public UGUI_Page {
  public:
    INT mComboBoxStyle;  // 2E4 2000000 CPF_EditorData
    class UGUI_Label* mSelectedLabel;  // 2E8 0
    class UGUI_Button* mExpandButton;  // 2EC 0
    class UGUI_ComboBoxDropDown* mOptionsDropDown;  // 2F0 0
    struct FScriptDelegate __OnItemChange__Delegate;  // 2F4 400000 CPF_NeedCtorLink
    virtual ~UGUI_ComboBox(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Validate(class UCanvas *,struct UGUI_BaseDesktop::base_rect<float> const &);
    virtual void VisibleChanged(bool);
    UGUI_ComboBox(class UGUI_ComboBox const &);
    UGUI_ComboBox(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_ComboBox & operator=(class UGUI_ComboBox const &);
    void AddItem(int,class FString const &,class FString const &);
    void ExpandList(bool);
    int FindData(class FString const &)const ;
    int FindItem(class FString const &)const ;
    class FString GetItemData(int)const ;
    class FString GetItemText(int)const ;
    int GetNumItems(void)const ;
    int GetSelection(void)const ;
    static void CDECL InternalConstructor(void *);
    bool IsExpanded(void)const ;
    void RemoveAllItems(void);
    void RemoveItem(int);
    bool SelectItem(int);
    static class UClass * CDECL StaticClass(void);
    void delegateOnItemChange(class UGUI_Component *,int);
    void execAddItem(struct FFrame &,void * const);
    void execExpandList(struct FFrame &,void * const);
    void execFindData(struct FFrame &,void * const);
    void execFindItem(struct FFrame &,void * const);
    void execGetItemData(struct FFrame &,void * const);
    void execGetItemText(struct FFrame &,void * const);
    void execGetNumItems(struct FFrame &,void * const);
    void execGetSelection(struct FFrame &,void * const);
    void execIsExpanded(struct FFrame &,void * const);
    void execRemoveAllItems(struct FFrame &,void * const);
    void execRemoveItem(struct FFrame &,void * const);
    void execSelectItem(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execAddItem)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execExpandList)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execFindData)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execFindItem)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execGetItemData)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execGetItemText)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execGetNumItems)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execGetSelection)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execIsExpanded)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execRemoveAllItems)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execRemoveItem)
AUTOGENERATE_FUNCTION(UGUI_ComboBox,0,execSelectItem)


//------------------------------------------------------------------------------
//  GUI_DnDInfo
//------------------------------------------------------------------------------

//  GUI_DnDInfo.IsDragging 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DnDInfo_execIsDragging_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_DnDInfo.EndDrag 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DnDInfo_execEndDrag_Parms {
};


//  GUI_DnDInfo.SetMaterial 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DnDInfo_execSetMaterial_Parms {
  class UMaterial* dragMaterial;  // 0 80 CPF_Parm
  FLOAT materialWidth;  // 4 80 CPF_Parm
  FLOAT materialHeight;  // 8 80 CPF_Parm
  FLOAT offsetX;  // C 90 CPF_OptionalParm CPF_Parm
  FLOAT offsetY;  // 10 90 CPF_OptionalParm CPF_Parm
};


//  GUI_DnDInfo.SetImage 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DnDInfo_execSetImage_Parms {
  class UGUI_Image* image;  // 0 80 CPF_Parm
  FLOAT offsetX;  // 4 90 CPF_OptionalParm CPF_Parm
  FLOAT offsetY;  // 8 90 CPF_OptionalParm CPF_Parm
};


//  GUI_DnDInfo.BeginDrag 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DnDInfo_execBeginDrag_Parms {
  class UGUI_Component* Source;  // 0 80 CPF_Parm
  class UObject* Param;  // 4 90 CPF_OptionalParm CPF_Parm
};


// UGUI_DnDInfo 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UGUI_DnDInfo : public UObject {
  public:
    class UGUI_Desktop* mDesktop;  // 28 0
    class UGUI_Component* mSource;  // 2C 0
    class UGUI_Component* mDestination;  // 30 0
    class UGUI_Component* mDraggedComponent;  // 34 0
    class UMaterial* mMaterial;  // 38 0
    FLOAT mMaterialWidth;  // 3C 0
    FLOAT mMaterialHeight;  // 40 0
    FLOAT mOffsetX;  // 44 0
    FLOAT mOffsetY;  // 48 0
    class UObject* mParam;  // 4C 0
    class FColor mDrawColor;  // 50 0
    class UGUI_Image* mImage;  // 54 0
    FLOAT mImageX;  // 58 0
    FLOAT mImageY;  // 5C 0
    INT mIndex;  // 60 0
    BITFIELD mDropSucceeded : 1;  // 64 0
    virtual ~UGUI_DnDInfo(void);
    virtual unsigned int GetCPPSize(void);
    UGUI_DnDInfo(class UGUI_DnDInfo const &);
    UGUI_DnDInfo(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_DnDInfo & operator=(class UGUI_DnDInfo const &);
    void BeginDrag(class UGUI_Component *,class UObject *);
    void EndDrag(void);
    static void CDECL InternalConstructor(void *);
    bool IsDragging(void)const ;
    void SetImage(class UGUI_Image *,float,float);
    void SetMaterial(class UMaterial *,float,float,float,float);
    static class UClass * CDECL StaticClass(void);
    void execBeginDrag(struct FFrame &,void * const);
    void execEndDrag(struct FFrame &,void * const);
    void execIsDragging(struct FFrame &,void * const);
    void execSetImage(struct FFrame &,void * const);
    void execSetMaterial(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_DnDInfo,0,execBeginDrag)
AUTOGENERATE_FUNCTION(UGUI_DnDInfo,0,execEndDrag)
AUTOGENERATE_FUNCTION(UGUI_DnDInfo,0,execIsDragging)
AUTOGENERATE_FUNCTION(UGUI_DnDInfo,0,execSetImage)
AUTOGENERATE_FUNCTION(UGUI_DnDInfo,0,execSetMaterial)


//------------------------------------------------------------------------------
//  GUI_Desktop
//------------------------------------------------------------------------------

#define UCONST_GUI_Desktop_GUI_ITEM_SIZE  40
#define UCONST_GUI_Desktop_GUI_MESSAGEBOX_H  225
#define UCONST_GUI_Desktop_GUI_MESSAGEBOX_W  400
#define UCONST_GUI_Desktop_GUI_LABEL_HEIGHT  24
#define UCONST_GUI_Desktop_GUI_BUTTON_PANE_H  42
#define UCONST_GUI_Desktop_GUI_BUTTON_H  24
#define UCONST_GUI_Desktop_GUI_BUTTON_W  105
#define UCONST_GUI_Desktop_GUI_MARGIN_TOP  21
#define UCONST_GUI_Desktop_GUI_DOUBLE_MARGIN  12
#define UCONST_GUI_Desktop_GUI_MARGIN  6
#define UCONST_GUI_Desktop_GUI_DOUBLE_BORDER  6
#define UCONST_GUI_Desktop_GUI_BORDER  3
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RMODE_ACTION_OUR  32
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RMODE_RADIAL_OUR  31
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RMODE_CHAT_OUR  30
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RMODE_DISABLED  29
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RMODE_ACTION  28
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RMODE_RADIAL  27
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RMODE_CHAT  26
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RMODE_CURSOR  25
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_ARROW_ACTION_OUR  24
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_ARROW_RADIAL_OUR  23
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_ARROW_CHAT_OUR  22
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_ARROW_DISABLED  21
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_ARROW_ACTION  20
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_ARROW_CONTEXT  19
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_ARROW_RADIAL  18
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_ARROW_CHAT  17
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RETICULE_PAINT_INVALID  16
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RETICULE_INVALID  15
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RETICULE_PAINT  14
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RETICULE_DISABLED  13
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_DROP_CHARACTER  12
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_DRAG_CHARACTER  11
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_DRAG_FALSE  10
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_DRAG  9
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_DROP  8
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_RETICULE_NORMAL  7
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_CARRET  6
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_SIZE_WE  5
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_SIZE_NW_SE  4
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_SIZE_NS  3
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_SIZE_NE_SW  2
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_SIZEALL  1
#define UCONST_GUI_Desktop_SB_MOUSE_CURSOR_ARROW  0
#define UCONST_GUI_Desktop_SNAP_REGION_SIZE  10
#define UCONST_GUI_Desktop_DOCK_REGION_SIZE  10
#define UCONST_GUI_Desktop_DESKTOP_DEBUG_TRACE_DRAW_TIME  2
#define UCONST_GUI_Desktop_DESKTOP_DEBUG_TRACE_FOCUS  1
enum GUI_BackgroundRenderMode {
  GUIBRM_Normal = 0,
  GUIBRM_KeepMaterialAR = 1
};

//  GUI_Desktop.GetWorldName 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetWorldName_Parms {
  INT aWorldID;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_Desktop.GetBindingKey 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetBindingKey_Parms {
  class FString Binding;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_Desktop.AddScreenMessage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventAddScreenMessage_Parms {
  class FString aMessage;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FColor aColour;  // 8 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Desktop.IsPlayingVideo 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execIsPlayingVideo_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.StopVideo 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execStopVideo_Parms {
  class FString fileName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Desktop.PlayVideo 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execPlayVideo_Parms {
  class FString fileName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD fadeInWhenStopped : 1;  // 8 80 CPF_Parm
};


//  GUI_Desktop.GetTimeSeconds 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetTimeSeconds_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetEngine 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetEngine_Parms {
  class UEngine* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetLevel 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetLevel_Parms {
  class ULevel* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.NativeTick 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execNativeTick_Parms {
  FLOAT delta;  // 0 80 CPF_Parm
};


//  GUI_Desktop.AddMessage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventAddMessage_Parms {
  class FString aSender;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aMessage;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  INT aChannel;  // 10 80 CPF_Parm
};


//  GUI_Desktop.ProcessMessage 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventProcessMessage_Parms {
  class FString aMessage;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT aChannel;  // 8 80 CPF_Parm
};


//  GUI_Desktop.OnRankUp 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventOnRankUp_Parms {
  INT newRank;  // 0 80 CPF_Parm
};


//  GUI_Desktop.OnLevelUp 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventOnLevelUp_Parms {
  INT aNewLevel;  // 0 80 CPF_Parm
};


//  GUI_Desktop.InvalidateFunctionPtrs 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventInvalidateFunctionPtrs_Parms {
};


//  GUI_Desktop.IsPlayerBusy 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventIsPlayerBusy_Parms {
  class AGame_Pawn* Pawn;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.InLoadingScreen 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventInLoadingScreen_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.StopLoadingScreen 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventStopLoadingScreen_Parms {
};


//  GUI_Desktop.UpdateLoadingScreen 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventUpdateLoadingScreen_Parms {
  FLOAT percentage;  // 0 80 CPF_Parm
  class FString Text;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Desktop.StartLoadingScreen 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execStartLoadingScreen_Parms {
  class FString loadingTexture;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Desktop.SetLoadingFinished 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSetLoadingFinished_Parms {
};


//  GUI_Desktop.SetLoadingScreenMaterial 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSetLoadingScreenMaterial_Parms {
  class UMaterial* loadingScreenMaterial;  // 0 80 CPF_Parm
};


//  GUI_Desktop.SetLoadingHook 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSetLoadingHook_Parms {
  BITFIELD setHook : 1;  // 0 80 CPF_Parm
};


//  GUI_Desktop.PlaySound 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execPlaySound_Parms {
  class USound* s;  // 0 80 CPF_Parm
};


//  GUI_Desktop.ResetBackgroundRenderMode 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execResetBackgroundRenderMode_Parms {
};


//  GUI_Desktop.SetBackgroundRenderMode 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execSetBackgroundRenderMode_Parms {
  BYTE aRendMode;  // 0 80 CPF_Parm
};


//  GUI_Desktop.SetBackgroundMaterial 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSetBackgroundMaterial_Parms {
  class UMaterial* aMaterial;  // 0 80 CPF_Parm
};


//  GUI_Desktop.GetModalWindow 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetModalWindow_Parms {
  class UGUI_Window* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.SetModalWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSetModalWindow_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  GUI_Desktop.PreviousTabStop 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execPreviousTabStop_Parms {
};


//  GUI_Desktop.NextTabStop 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execNextTabStop_Parms {
};


//  GUI_Desktop.GetRenderWindow 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetRenderWindow_Parms {
  INT Index;  // 0 80 CPF_Parm
  class UGUI_Window* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetDnDInfo 20003 0 ( FUNC_Final FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetDnDInfo_Parms {
  class UGUI_DnDInfo* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.UpdateWindowPositioning 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UGUI_Desktop_execUpdateWindowPositioning_Parms {
  class UGUI_Window* Target;  // 0 80 CPF_Parm
};


//  GUI_Desktop.GetMouseCaptureComponent 20003 0 ( FUNC_Final FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetMouseCaptureComponent_Parms {
  class UGUI_Component* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetMouseOwner 20003 0 ( FUNC_Final FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetMouseOwner_Parms {
  class UGUI_Component* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetFocusedWindow 20003 0 ( FUNC_Final FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetFocusedWindow_Parms {
  class UGUI_Window* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetFocusedComponent 20003 0 ( FUNC_Final FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetFocusedComponent_Parms {
  class UGUI_Component* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.HasHiliteComponent 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execHasHiliteComponent_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetHiliteWindow 20003 0 ( FUNC_Final FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetHiliteWindow_Parms {
  class UGUI_Window* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetHiliteComponent 20003 0 ( FUNC_Final FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetHiliteComponent_Parms {
  class UGUI_Component* ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.CloseContextWindows 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UGUI_Desktop_execCloseContextWindows_Parms {
  class UGUI_Component* aClickedComponent;  // 0 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Desktop.CreateContextWindow 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UGUI_Desktop_execCreateContextWindow_Parms {
  class UGUI_Component* aWatchedComponent;  // 0 80 CPF_Parm
  class FString aGEDFile;  // 4 400080 CPF_Parm CPF_NeedCtorLink
  class FString aGEDContextWindowComponent;  // C 400080 CPF_Parm CPF_NeedCtorLink
  class UGUI_ContextWindow* ReturnValue;  // 14 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsKeyDown 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UGUI_Desktop_execIsKeyDown_Parms {
  BYTE keyCode;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.ParseEditorString 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventParseEditorString_Parms {
  class FString editorString;  // 0 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Desktop.UpdateStdWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventUpdateStdWindow_Parms {
  INT windowType;  // 0 80 CPF_Parm
  INT intParam;  // 4 90 CPF_OptionalParm CPF_Parm
  class UObject* objParam;  // 8 90 CPF_OptionalParm CPF_Parm
  class FString stringParam;  // C 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  INT intParam2;  // 14 90 CPF_OptionalParm CPF_Parm
};


//  GUI_Desktop.ShowRulesWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventShowRulesWindow_Parms {
  INT articleID;  // 0 80 CPF_Parm
};


//  GUI_Desktop.ShowTutorialWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventShowTutorialWindow_Parms {
  INT articleID;  // 0 80 CPF_Parm
};


//  GUI_Desktop.ShowMessageBox 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventShowMessageBox_Parms {
  class FString Title;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString Message;  // 8 400080 CPF_Parm CPF_NeedCtorLink
};


//  GUI_Desktop.ShowPartyTravelConfirmation 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventShowPartyTravelConfirmation_Parms {
};


//  GUI_Desktop.ShowPartyTravelOverview 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventShowPartyTravelOverview_Parms {
};


//  GUI_Desktop.ShowLevelAreaName 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventShowLevelAreaName_Parms {
  class FString aName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD newArea : 1;  // 8 80 CPF_Parm
};


//  GUI_Desktop.ShowStdWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execShowStdWindow_Parms {
  INT wndType;  // 0 80 CPF_Parm
  INT flags;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.Clear 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execClear_Parms {
};


//  GUI_Desktop.BringToBottom 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execBringToBottom_Parms {
  class UGUI_Window* Window;  // 0 80 CPF_Parm
};


//  GUI_Desktop.BringToTop 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execBringToTop_Parms {
  class UGUI_Window* Window;  // 0 80 CPF_Parm
};


//  GUI_Desktop.FocusComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execFocusComponent_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
};


//  GUI_Desktop.FocusWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execFocusWindow_Parms {
  class UGUI_Window* Window;  // 0 80 CPF_Parm
};


//  GUI_Desktop.ClearSavedWindows 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execClearSavedWindows_Parms {
};


//  GUI_Desktop.RestoreSavedWindows 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execRestoreSavedWindows_Parms {
};


//  GUI_Desktop.SaveOpenWindows 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSaveOpenWindows_Parms {
};


//  GUI_Desktop.CancelAction 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execCancelAction_Parms {
};


//  GUI_Desktop.HideAllWindows 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execHideAllWindows_Parms {
};


//  GUI_Desktop.PreLogin 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execPreLogin_Parms {
};


//  GUI_Desktop.OnLogin 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execOnLogin_Parms {
};


//  GUI_Desktop.StartTrayWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execStartTrayWindow_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  GUI_Desktop.StopTrayWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execStopTrayWindow_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  GUI_Desktop.StartAutoWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execStartAutoWindow_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  GUI_Desktop.StopAutoWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execStopAutoWindow_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  GUI_Desktop.ShowWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execShowWindow_Parms {
  INT windowHandle;  // 0 80 CPF_Parm
  INT ShowFlags;  // 4 80 CPF_Parm
};


//  GUI_Desktop.ShowGUIWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execShowGUIWindow_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
  INT ShowFlags;  // 4 80 CPF_Parm
};


//  GUI_Desktop.GetWindowTitle 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetWindowTitle_Parms {
  INT windowHandle;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_Desktop.IsStdWindowVisible 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execIsStdWindowVisible_Parms {
  INT windowID;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsWindowVisible 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execIsWindowVisible_Parms {
  INT windowHandle;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsStdWindowInitialized 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execIsStdWindowInitialized_Parms {
  INT windowTag;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetStdWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetStdWindow_Parms {
  INT windowTag;  // 0 80 CPF_Parm
  class UGUI_Window* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetWindow_Parms {
  INT windowHandle;  // 0 80 CPF_Parm
  class UGUI_Window* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.FindWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execFindWindow_Parms {
  class FString windowTitle;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.DestroyWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execDestroyWindow_Parms {
  INT windowHandle;  // 0 80 CPF_Parm
};


//  GUI_Desktop.CreateWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execCreateWindow_Parms {
  class FString windowClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT componentStyle;  // 8 80 CPF_Parm
  INT pageStyle;  // C 80 CPF_Parm
  INT windowStyle;  // 10 80 CPF_Parm
  INT Left;  // 14 80 CPF_Parm
  INT top;  // 18 80 CPF_Parm
  INT width;  // 1C 80 CPF_Parm
  INT Height;  // 20 80 CPF_Parm
  class FString windowTitle;  // 24 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 2C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.CreateTrayBox 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execCreateTrayBox_Parms {
  class FString trayBoxClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString caption;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString Text;  // 10 400080 CPF_Parm CPF_NeedCtorLink
  INT messageBoxStyle;  // 18 80 CPF_Parm
  INT Tag;  // 1C 80 CPF_Parm
  class UGUI_Component* Owner;  // 20 80 CPF_Parm
  INT ReturnValue;  // 24 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.CreateMessageBox 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execCreateMessageBox_Parms {
  class FString messageBoxClass;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString caption;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString Text;  // 10 400080 CPF_Parm CPF_NeedCtorLink
  INT messageBoxStyle;  // 18 80 CPF_Parm
  INT Tag;  // 1C 80 CPF_Parm
  class UGUI_Component* Owner;  // 20 80 CPF_Parm
  INT ReturnValue;  // 24 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsRadialInteractionPossible 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execIsRadialInteractionPossible_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsMouseInsideWindow 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execIsMouseInsideWindow_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.SetDockingStyle 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSetDockingStyle_Parms {
  INT windowHandle;  // 0 80 CPF_Parm
  INT dockingStyle;  // 4 80 CPF_Parm
};


//  GUI_Desktop.SetMousePosition 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSetMousePosition_Parms {
  FLOAT X;  // 0 80 CPF_Parm
  FLOAT Y;  // 4 80 CPF_Parm
};


//  GUI_Desktop.GetRelMouseY 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetRelMouseY_Parms {
  class UGUI_Component* relTo;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetRelMouseX 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetRelMouseX_Parms {
  class UGUI_Component* relTo;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetMouseY 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetMouseY_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetMouseX 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execGetMouseX_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsFullscreen 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execIsFullscreen_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetScreenHeight 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetScreenHeight_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.GetScreenWidth 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execGetScreenWidth_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsDragging 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execIsDragging_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsTempInactive 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execIsTempInactive_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsTempActive 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execIsTempActive_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.IsActive 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Desktop_execIsActive_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_Desktop.SetTempInactive 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSetTempInactive_Parms {
  BITFIELD OnOff : 1;  // 0 80 CPF_Parm
};


//  GUI_Desktop.SetTempActive 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execSetTempActive_Parms {
  BITFIELD OnOff : 1;  // 0 80 CPF_Parm
};


//  GUI_Desktop.ForceActive 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execForceActive_Parms {
};


//  GUI_Desktop.ToggleActive 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execToggleActive_Parms {
};


//  GUI_Desktop.RecreateStdWindows 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_Desktop_execRecreateStdWindows_Parms {
};


//  GUI_Desktop.Shutdown 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventShutdown_Parms {
};


//  GUI_Desktop.frame 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventframe_Parms {
};


//  GUI_Desktop.Test 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventTest_Parms {
};


//  GUI_Desktop.CreateDefaultWindows 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventCreateDefaultWindows_Parms {
};


//  GUI_Desktop.Init 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_Desktop_eventInit_Parms {
};


// UGUI_Desktop 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_Desktop : public UGame_Desktop {
  public:
    BITFIELD mFullScreen : 1;  // 44 0
    BITFIELD mWasDesktopActive : 1;  // 44 2000000 CPF_EditorData
    BITFIELD mTempActiveFromTempReticule : 1;  // 44 2000000 CPF_EditorData
    FLOAT mLastDeltaTime;  // 48 2000000 CPF_EditorData
    INT mDebug;  // 4C 0
    class UGUI_Window* mModalWindow;  // 50 0
    class UGUI_Window* mModalOverlay;  // 54 0
    class UMaterial* mBackgroundMaterial;  // 58 0
    BYTE mBackgroundRenderMode;  // 5C 0
    class UMaterial* mFadeInMaterial;  // 60 0
    BITFIELD mFadeIn : 1;  // 64 0
    FLOAT mFadeInAlpha;  // 68 0
    class UGUI_Window* mHiliteWindow;  // 6C 0
    class UGUI_Window* mFocusWindow;  // 70 0
    class UGUI_Window* mMoveWindow;  // 74 0
    class UGUI_Window* mSizeWindow;  // 78 0
    INT mSizeDirection;  // 7C 0
    FLOAT mLastClickTime;  // 80 0
    class UGUI_Component* mLastClickedComponent;  // 84 0
    TArray<class FString> mStdWindowClasses;  // 88 400000 CPF_NeedCtorLink
    TArray<INT> mStdWindowStyles;  // 94 400000 CPF_NeedCtorLink
    TArray<INT> mStdPageStyles;  // A0 400000 CPF_NeedCtorLink
    TArray<INT> mStdWindowHandles;  // AC 400000 CPF_NeedCtorLink
    TArray<class FString> mStdWindowTitles;  // B8 400000 CPF_NeedCtorLink
    BYTE mLastKeyDown;  // C4 0
    FLOAT mLastKeyDownTime;  // C8 0
    FLOAT mLastKeyDownDelta;  // CC 0
    FLOAT mKeyRepeatDelay;  // D0 0
    FLOAT mBlinkAlpha;  // D4 0
    FLOAT mBlinkTime;  // D8 0
    BYTE mKeyStates[255];  // DC 0
    INT mTabWindowIndex;  // 1DC 0
    class UGUI_Component* mHiliteComponent;  // 1E0 0
    class UGUI_Component* mMouseCaptureComponent;  // 1E4 0
    class UGUI_Component* mMouseOwner;  // 1E8 0
    FLOAT mMouseSensitivity;  // 1EC 0
    FLOAT mMouseX;  // 1F0 0
    FLOAT mMouseY;  // 1F4 0
    FLOAT mMouseXPrev;  // 1F8 0
    FLOAT mMouseYPrev;  // 1FC 0
    INT mMouseButtonStates;  // 200 0
    INT mMouseButtonStatesPrev;  // 204 0
    TArray<class UTexture*> mMouseCursors;  // 208 400000 CPF_NeedCtorLink
    TArray<class FVector> mMouseCursorOffsets;  // 214 400000 CPF_NeedCtorLink
    FLOAT mMouseDragThreshold;  // 220 44000 CPF_Config CPF_GlobalConfig
    FLOAT mMouseDownX;  // 224 0
    FLOAT mMouseDownY;  // 228 0
    INT mMouseCursorIndex;  // 22C 0
    class FVector mPreviousMousePosition;  // 230 0
    class UGUI_DnDInfo* mDnDInfo;  // 23C 0
    class FPlane mColorModifier;  // 240 0
    class UClass* mToolkitClass;  // 250 0
    class UGUI_Toolkit* mToolkit;  // 254 0
    class UGUI_Tooltip* mTooltipWindow;  // 258 0
    class UHUD_TimerWindow* mTimerWindow;  // 25C 0
    class UMaterial* mLoadingScreenMaterial;  // 260 0
    TArray<INT> mOpenWindowHandles;  // 264 400000 CPF_NeedCtorLink
    class FString mRequestedVideo;  // 270 400000 CPF_NeedCtorLink
    FLOAT mDrawConnectionWarningIcon;  // 278 0
    class UMaterial* mDisconnectedIcon;  // 27C 0
    class UObject* mInput;  // 280 0
    FLOAT TrackingRange;  // 284 44000 CPF_Config CPF_GlobalConfig
    BITFIELD ShowNameAboveHeadsOnSelectedTarget : 1;  // 288 44000 CPF_Config CPF_GlobalConfig
    BITFIELD ShowNameAboveHeadsOnHoveredTarget : 1;  // 288 44000 CPF_Config CPF_GlobalConfig
    BITFIELD ShowNameAboveHeads : 1;  // 288 44000 CPF_Config CPF_GlobalConfig
    FLOAT NameTrackingRange;  // 28C 44000 CPF_Config CPF_GlobalConfig
    BITFIELD ShowPermanentHealthBarsOnSelectedTarget : 1;  // 290 44000 CPF_Config CPF_GlobalConfig
    BITFIELD ShowPermanentHealthBarsOnHoveredTarget : 1;  // 290 44000 CPF_Config CPF_GlobalConfig
    BITFIELD ShowPermanentHealthBarsOnEnemies : 1;  // 290 44000 CPF_Config CPF_GlobalConfig
    BITFIELD ShowPopupHealthBarsOnHitTargets : 1;  // 290 44000 CPF_Config CPF_GlobalConfig
    BITFIELD ShowPopupHealthBarsOnHitSources : 1;  // 290 44000 CPF_Config CPF_GlobalConfig
    FLOAT PermanentHealthBarOnEnemiesRange;  // 294 44000 CPF_Config CPF_GlobalConfig
    FLOAT PopupHealthBarPeriod;  // 298 44000 CPF_Config CPF_GlobalConfig
    FLOAT HealthBarBlinkingPeriod;  // 29C 2044000 CPF_Config CPF_GlobalConfig CPF_EditorData
    FLOAT HealthBarBlinkingFrequency;  // 2A0 2044000 CPF_Config CPF_GlobalConfig CPF_EditorData
    BITFIELD ShowHealthBarPercentage : 1;  // 2A4 44000 CPF_Config CPF_GlobalConfig
    FLOAT WindowBackgroundAlpha;  // 2A8 44000 CPF_Config CPF_GlobalConfig
    INT mData;  // 2AC 800000 CPF_Unk_00800000
    DWORD mReticule;  // 2B0 802000 CPF_Transient CPF_Unk_00800000
    virtual ~UGUI_Desktop(void);
  protected:
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
  public:
    virtual unsigned int GetCPPSize(void);
  protected:
    virtual bool NativeKeyType(unsigned char &,unsigned short);
    virtual bool NativeKeyEvent(unsigned char &,unsigned char &,float);
  public:
    virtual void NativeTick(float);
    virtual void NativePreRender(class UCanvas *);
    virtual void NativePostRender(class UCanvas *);
    virtual void ResolutionChanged(int,int);
  protected:
    virtual void ResetInput(void);
  public:
    virtual void Initialize(void);
  protected:
    virtual void FocusChanged(bool);
  public:
    virtual void SetColorModifier(class FPlane const &);
    virtual int ShowStdWindow(int,int);
    virtual class UClass * GetGameHUDClass(void)const ;
    virtual void Clear(void);
    virtual void Shutdown(void);
    virtual bool IsActive(void)const ;
    virtual bool IsTempActive(void)const ;
    virtual bool IsTempInactive(void)const ;
    virtual void ToggleActive(void);
    virtual void ForceActive(void);
    virtual void SetTempActive(bool);
    virtual void SetTempInactive(bool);
    virtual void RenderMouseCursor(class UCanvas *);
  protected:
    virtual void GetCursorPos(int &,int &);
  private:
    virtual bool KeyDown(unsigned char &,unsigned char &,float);
    virtual bool KeyHold(unsigned char &,unsigned char &,float);
    virtual bool KeyUp(unsigned char &,unsigned char &,float);
    virtual bool WhileMouseDown(float,float,int,int);
    virtual bool MouseUp(float,float,int,int);
    virtual void MouseMove(float,float,float,float,int);
    virtual bool MouseWheel(float,float,bool);
  public:
    UGUI_Desktop(class UGUI_Desktop const &);
    UGUI_Desktop(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Desktop & operator=(class UGUI_Desktop const &);
    void BringToBottom(class UGUI_Window *);
    void BringToTop(class UGUI_Window *);
    void ClearModalWindow(class UGUI_Window *);
    void ComponentChangedVisibleOrEnabled(void);
    class UGUI_ContextWindow * CreateContextWindow(class UGUI_Component *,class FString,class FString);
    class UGUI_Window * CreateGUIWindow(class FString const &,int,int,int,int,int,int,int,class FString,bool);
    int CreateMessageBox(class FString const &,class FString const &,class FString const &,int,int,class UGUI_Component *);
    int CreateTrayBox(class FString const &,class FString const &,class FString const &,int,int,class UGUI_Component *);
    void DestroyWindow(int);
    void DestroyWindow(class UGUI_Window *);
    void FindComponentUnderCursor(bool,bool,class UGUI_Component *,class UGUI_Component * *,class UGUI_Component * *);
    void FocusComponent(class UGUI_Component *);
    void FocusParent(class UGUI_Window *);
    void FocusWindow(class UGUI_Window *);
    class FString GetBindingKey(class FString const &);
    class UEngine * GetEngine(void)const ;
    class UGUI_Component * GetFocusedComponent(void)const ;
    class UGUI_Window * GetFocusedWindow(void)const ;
    class UGUI_Component * GetHiliteComponent(void)const ;
    class UGUI_Window * GetHiliteWindow(void)const ;
    class UInput * GetInput(void);
    class ULevel * GetLevel(void)const ;
    class UGUI_Component * GetMouseCaptureComponent(void)const ;
    class UGUI_Component * GetMouseOwner(void)const ;
    float GetRelMouseX(class UGUI_Component *);
    float GetRelMouseY(class UGUI_Component *);
    class UGUI_Window * GetRenderWindow(int);
    class UGUI_Window * GetStdWindow(int);
    double GetTimeSeconds(void)const ;
    class UGUI_Window * GetWindow(int);
    class FString GetWorldName(int);
    static bool CDECL HasHigherDrawPriority(class UGUI_Component *,class UGUI_Component *);
    void HideAll(void);
    static void CDECL InternalConstructor(void *);
    bool IsAtLeastPartiallyOnScreen(struct UGUI_BaseDesktop::base_rect<float> const &)const ;
    bool IsCompletelyOnScreen(struct UGUI_BaseDesktop::base_rect<float> const &)const ;
    bool IsDragging(void)const ;
    bool IsKeyDown(unsigned char);
    bool IsMouseInsideWindow(void);
    bool IsPlayingVideo(void);
    int IsRadialInteractionPossible(void);
    int IsStdWindowInitialized(int);
    bool IsViewingCinematic(void);
    void NextTabStop(void);
    void PlayVideo(class FString const &,bool);
    void RecreateStdWindows(void);
    void RenderLoadingScreen(void);
    void SetBackgroundMaterial(class UMaterial *);
    void SetModalWindow(class UGUI_Window *);
    void ShowAll(void);
    void ShowWindow(int,int);
    void ShowWindow(class UGUI_Window *,int);
    void StartAutoWindow(class UGUI_Window *);
    void StartTrayWindow(class UGUI_Window *);
    static class UClass * CDECL StaticClass(void);
    void StopAutoWindow(class UGUI_Window *);
    void StopTrayWindow(class UGUI_Window *);
    void StopVideo(void);
    void UpdateMouseCursor(void);
    void UpdateRadialMenuOptions(void);
    void UpdateTargetingPosition(float,float);
    void UpdateWindowPositioning(class UGUI_Window *);
    void eventCreateDefaultWindows(void);
    void eventInvalidateFunctionPtrs(void);
    unsigned long eventIsPlayerBusy(class AGame_Pawn *);
    void eventShowRulesWindow(int);
    void execBringToBottom(struct FFrame &,void * const);
    void execBringToTop(struct FFrame &,void * const);
    void execCancelAction(struct FFrame &,void * const);
    void execClear(struct FFrame &,void * const);
    void execClearSavedWindows(struct FFrame &,void * const);
    void execCloseContextWindows(struct FFrame &,void * const);
    void execCreateContextWindow(struct FFrame &,void * const);
    void execCreateMessageBox(struct FFrame &,void * const);
    void execCreateTrayBox(struct FFrame &,void * const);
    void execCreateWindow(struct FFrame &,void * const);
    void execDestroyWindow(struct FFrame &,void * const);
    void execFindWindow(struct FFrame &,void * const);
    void execFocusComponent(struct FFrame &,void * const);
    void execFocusWindow(struct FFrame &,void * const);
    void execForceActive(struct FFrame &,void * const);
    void execGetBindingKey(struct FFrame &,void * const);
    void execGetEngine(struct FFrame &,void * const);
    void execGetLevel(struct FFrame &,void * const);
    void execGetRelMouseX(struct FFrame &,void * const);
    void execGetRelMouseY(struct FFrame &,void * const);
    void execGetRenderWindow(struct FFrame &,void * const);
    void execGetScreenHeight(struct FFrame &,void * const);
    void execGetScreenWidth(struct FFrame &,void * const);
    void execGetStdWindow(struct FFrame &,void * const);
    void execGetTimeSeconds(struct FFrame &,void * const);
    void execGetWindow(struct FFrame &,void * const);
    void execGetWorldName(struct FFrame &,void * const);
    void execHideAllWindows(struct FFrame &,void * const);
    void execInLoadingScreen(struct FFrame &,void * const);
    void execInvalidateFunctionPtrs(struct FFrame &,void * const);
    void execIsKeyDown(struct FFrame &,void * const);
    void execIsMouseInsideWindow(struct FFrame &,void * const);
    void execIsPlayingVideo(struct FFrame &,void * const);
    void execIsRadialInteractionPossible(struct FFrame &,void * const);
    void execIsStdWindowInitialized(struct FFrame &,void * const);
    void execNativeTick(struct FFrame &,void * const);
    void execNextTabStop(struct FFrame &,void * const);
    void execOnLogin(struct FFrame &,void * const);
    void execPlayVideo(struct FFrame &,void * const);
    void execPreLogin(struct FFrame &,void * const);
    void execPrintWindows(struct FFrame &,void * const);
    void execRecreateStdWindows(struct FFrame &,void * const);
    void execRestoreSavedWindows(struct FFrame &,void * const);
    void execSaveOpenWindows(struct FFrame &,void * const);
    void execSetBackgroundMaterial(struct FFrame &,void * const);
    void execSetDockingStyle(struct FFrame &,void * const);
    void execSetLoadingFinished(struct FFrame &,void * const);
    void execSetLoadingHook(struct FFrame &,void * const);
    void execSetLoadingScreenMaterial(struct FFrame &,void * const);
    void execSetModalWindow(struct FFrame &,void * const);
    void execSetMousePosition(struct FFrame &,void * const);
    void execSetTempActive(struct FFrame &,void * const);
    void execSetTempInactive(struct FFrame &,void * const);
    void execShowGUIWindow(struct FFrame &,void * const);
    void execShowStdWindow(struct FFrame &,void * const);
    void execShowWindow(struct FFrame &,void * const);
    void execStartAutoWindow(struct FFrame &,void * const);
    void execStartTrayWindow(struct FFrame &,void * const);
    void execStopAutoWindow(struct FFrame &,void * const);
    void execStopTrayWindow(struct FFrame &,void * const);
    void execStopVideo(struct FFrame &,void * const);
    void execToggleActive(struct FFrame &,void * const);
    void execUpdateWindowPositioning(struct FFrame &,void * const);
  protected:
    void SetActive(bool);
  private:
    void AddAutoWindow(class UGUI_Window *);
    void CaptureMouse(void);
    int CheckBorderRegion(void);
    void CloseContextWindows(class UGUI_Component *);
    void FindComponentUnderCursor(bool,bool,class UGUI_Component *,class UGUI_Page *,class UGUI_Component * *);
    int ObtainWindowHandle(void);
    void PositionAutoWindows(void);
    void PositionTrayWindows(void);
    static class UClass PrivateStaticClass;
    void ReleaseMouseCapture(void);
    void ReleaseWindowHandle(int);
    void RemoveAutoWindow(class UGUI_Window *);
    void ResetHiliteComponent(void);
    bool UpdateDockingX(class UGUI_Window *);
    bool UpdateDockingY(class UGUI_Window *);
    void UpdateHilites(class UGUI_Page *);
    void UpdateHilitesAndMouseOwner(void);
    void UpdateMouseOwner(void);
    bool UpdateSnappingX(class UGUI_Window *);
    bool UpdateSnappingY(class UGUI_Window *);
};
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execBringToBottom)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execBringToTop)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execCancelAction)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execClear)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execClearSavedWindows)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execCloseContextWindows)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execCreateContextWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execCreateMessageBox)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execCreateTrayBox)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execCreateWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execDestroyWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execFindWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execFocusComponent)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execFocusWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execForceActive)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetBindingKey)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetEngine)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetLevel)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetRelMouseX)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetRelMouseY)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetRenderWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetScreenHeight)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetScreenWidth)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetStdWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetTimeSeconds)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execGetWorldName)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execHideAllWindows)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execInLoadingScreen)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execInvalidateFunctionPtrs)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execIsKeyDown)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execIsMouseInsideWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execIsPlayingVideo)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execIsRadialInteractionPossible)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execIsStdWindowInitialized)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execNativeTick)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execNextTabStop)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execOnLogin)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execPlayVideo)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execPreLogin)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execPrintWindows)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execRecreateStdWindows)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execRestoreSavedWindows)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSaveOpenWindows)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSetBackgroundMaterial)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSetDockingStyle)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSetLoadingFinished)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSetLoadingHook)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSetLoadingScreenMaterial)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSetModalWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSetMousePosition)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSetTempActive)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execSetTempInactive)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execShowGUIWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execShowStdWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execShowWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execStartAutoWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execStartTrayWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execStopAutoWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execStopTrayWindow)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execStopVideo)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execToggleActive)
AUTOGENERATE_FUNCTION(UGUI_Desktop,0,execUpdateWindowPositioning)


//------------------------------------------------------------------------------
//  GUI_Toolkit
//------------------------------------------------------------------------------

//  GUI_Toolkit.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_Toolkit_execInitialize_Parms {
  class UGUI_Desktop* aDesktop;  // 0 80 CPF_Parm
};


// UGUI_Toolkit 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UGUI_Toolkit : public UObject {
  public:
    class UGUI_Desktop* mDesktop;  // 28 0
    virtual ~UGUI_Toolkit(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    UGUI_Toolkit(class UGUI_Toolkit const &);
    UGUI_Toolkit(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_Toolkit & operator=(class UGUI_Toolkit const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  GUI_DefaultToolkit
//------------------------------------------------------------------------------

#define UCONST_GUI_DefaultToolkit_TOOLKIT_EVENT_BLINK  3
#define UCONST_GUI_DefaultToolkit_TOOLKIT_EVENT_MOVER  2
#define UCONST_GUI_DefaultToolkit_TOOLKIT_EVENT_TIMER  1
#define UCONST_GUI_DefaultToolkit_GDT_MAX_DECORATIONS  8
#define UCONST_GUI_DefaultToolkit_GDT_SWIRLY_DECORATION_INDEX  7
#define UCONST_GUI_DefaultToolkit_GDT_SHADOW_BORDER_INDEX  6
#define UCONST_GUI_DefaultToolkit_GDT_TOP_ORNAMENT_BORDER_INDEX  5
#define UCONST_GUI_DefaultToolkit_GDT_FANCY_BODER_DECORATION  4
#define UCONST_GUI_DefaultToolkit_GDT_CHAT_BAR_DECORATION  3
#define UCONST_GUI_DefaultToolkit_GDT_BOTTOM_ORNAMENTS_BORDER  2
#define UCONST_GUI_DefaultToolkit_GDT_BIG_TOP_ORNAMENT_BORDER_INDEX  1
#define UCONST_GUI_DefaultToolkit_GDT_SIMPLE_BORDER_INDEX  0
enum DefaultFontsEnum {
  DFE_Satanick16 = 0,
  DFE_Satanick18 = 1,
  DFE_Verdana10 = 2,
  DFE_Verdana11 = 3,
  DFE_Verdana12 = 4,
  DFE_MaxFonts = 5
};

// FBlinkStruct 0 ( )
struct DLL_IMPORT FBlinkStruct {
  public:
    class UGUI_Component* component;  // 0 0
    FLOAT Cycle;  // 4 0
    FLOAT TotalTime;  // 8 0
    FLOAT StartTime;  // C 0
    class FColor Color1;  // 10 0
    class FColor Color2;  // 14 0
    class UGUI_Page* Overlay;  // 18 0
    FBlinkStruct(void);
    struct FBlinkStruct & operator=(struct FBlinkStruct const &);
};

// FComponentMoverStruct 0 ( )
struct DLL_IMPORT FComponentMoverStruct {
  public:
    FLOAT Timeout;  // 0 0
    FLOAT TotalTime;  // 4 0
    FLOAT X;  // 8 0
    FLOAT Y;  // C 0
    FLOAT width;  // 10 0
    FLOAT Height;  // 14 0
    FLOAT deltaX;  // 18 0
    FLOAT deltaY;  // 1C 0
    FLOAT deltaWidth;  // 20 0
    FLOAT deltaHeight;  // 24 0
    class UGUI_Component* component;  // 28 0
    struct FComponentMoverStruct & operator=(struct FComponentMoverStruct const &);
};

// FComponentTimerStruct 0 ( )
struct DLL_IMPORT FComponentTimerStruct {
  public:
    FLOAT Timeout;  // 0 0
    class UGUI_Component* caller;  // 4 0
    struct FComponentTimerStruct & operator=(struct FComponentTimerStruct const &);
};

//  GUI_DefaultToolkit.SetTextColor 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DefaultToolkit_execSetTextColor_Parms {
  class FString aText;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  BYTE R;  // 8 80 CPF_Parm
  BYTE G;  // 9 80 CPF_Parm
  BYTE B;  // A 80 CPF_Parm
  class FString ReturnValue;  // C 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_DefaultToolkit.MoveComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DefaultToolkit_execMoveComponent_Parms {
  class UGUI_Component* aComponent;  // 0 80 CPF_Parm
  FLOAT Time;  // 4 80 CPF_Parm
  FLOAT X;  // 8 80 CPF_Parm
  FLOAT Y;  // C 80 CPF_Parm
  FLOAT W;  // 10 80 CPF_Parm
  FLOAT H;  // 14 80 CPF_Parm
};


//  GUI_DefaultToolkit.CreateFont 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DefaultToolkit_execCreateFont_Parms {
  class FString FontName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UFont* ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_DefaultToolkit.GetTextWidth 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DefaultToolkit_execGetTextWidth_Parms {
  class FString aText;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UFont* aFont;  // 8 80 CPF_Parm
  FLOAT aScale;  // C 80 CPF_Parm
  FLOAT ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_DefaultToolkit.RemoveBlinkComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DefaultToolkit_execRemoveBlinkComponent_Parms {
  class UGUI_Component* aComponent;  // 0 80 CPF_Parm
  class FColor Color1;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  GUI_DefaultToolkit.AddBlinkComponent 20400 0 ( FUNC_Native FUNC_Public )
struct UGUI_DefaultToolkit_execAddBlinkComponent_Parms {
  class UGUI_Component* aComponent;  // 0 80 CPF_Parm
  class FColor Color1;  // 4 80 CPF_Parm
  class FColor Color2;  // 8 80 CPF_Parm
  FLOAT Cycle;  // C 80 CPF_Parm
  FLOAT TotalTime;  // 10 80 CPF_Parm
  class UGUI_Page* Overlay;  // 14 90 CPF_OptionalParm CPF_Parm
};


//  GUI_DefaultToolkit.Flush 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_DefaultToolkit_eventFlush_Parms {
};


//  GUI_DefaultToolkit.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execInitialize_Parms {
  class UGUI_Desktop* aDesktop;  // 0 80 CPF_Parm
};


//  GUI_DefaultToolkit.IsNPCDebugging 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execIsNPCDebugging_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_DefaultToolkit.ToggleNPCDebugging 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execToggleNPCDebugging_Parms {
};


//  GUI_DefaultToolkit.GetFontName 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execGetFontName_Parms {
  BYTE aFont;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  GUI_DefaultToolkit.Center 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execCenter_Parms {
  class UGUI_Window* aWindow;  // 0 80 CPF_Parm
};


//  GUI_DefaultToolkit.AddTimeout 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execAddTimeout_Parms {
  class UGUI_Component* aComponent;  // 0 80 CPF_Parm
  FLOAT Time;  // 4 80 CPF_Parm
};


//  GUI_DefaultToolkit.EndFade 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execEndFade_Parms {
};


//  GUI_DefaultToolkit.ClearFade 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execClearFade_Parms {
};


//  GUI_DefaultToolkit.IsFading 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execIsFading_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_DefaultToolkit.Fade 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_DefaultToolkit_execFade_Parms {
  FLOAT FadeTime;  // 0 80 CPF_Parm
  FLOAT fadeAlphaStart;  // 4 80 CPF_Parm
  FLOAT fadeAlphaEnd;  // 8 80 CPF_Parm
};


// UGUI_DefaultToolkit 4012 ( CLASS_Compiled CLASS_Parsed CLASS_ExportStructs )
class DLL_IMPORT UGUI_DefaultToolkit : public UGUI_Toolkit {
  public:
    class UFont* mFonts[9];  // 2C 0
    class FString mFontNames[9];  // 50 400000 CPF_NeedCtorLink
    TArray<class UFSkill_Type*> mAvailableSkills;  // 98 400000 CPF_NeedCtorLink
    FLOAT mFadeTime;  // A4 0
    FLOAT mFadeAlpha;  // A8 0
    FLOAT mStartAlpha;  // AC 0
    FLOAT mDeltaTime;  // B0 0
    TArray<struct FComponentTimerStruct> mTimeouts;  // B4 400000 CPF_NeedCtorLink
    TArray<struct FComponentMoverStruct> mMovers;  // C0 400000 CPF_NeedCtorLink
    TArray<struct FBlinkStruct> mBlinkers;  // CC 400000 CPF_NeedCtorLink
    TArray<class UGUI_Page*> mOverlays;  // D8 400000 CPF_NeedCtorLink
    class UGUI_NPCDebugWindow* mNPCDebugWindow;  // E4 0
    virtual ~UGUI_DefaultToolkit(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Tick(float);
    UGUI_DefaultToolkit(class UGUI_DefaultToolkit const &);
    UGUI_DefaultToolkit(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UGUI_DefaultToolkit & operator=(class UGUI_DefaultToolkit const &);
    void AddBlinkComponent(class UGUI_Component *,class FColor const &,class FColor const &,float,float,class UGUI_Page *);
    class UFont * CreateFontW(class FString const &);
    class TArrayNoInit<class UFSkill_Type *> * GetAvailableSkills(void);
    float GetTextHeight(class UFont *,float);
    float GetTextWidth(class FString,class UFont *,float);
    static void CDECL InternalConstructor(void *);
    bool IsBlinking(class UGUI_Component *);
    void MoveComponent(class UGUI_Component *,float,float,float,float,float);
    void RemoveBlinkComponent(class UGUI_Component *,class FColor const &);
    void SetBlinkColors(class UGUI_Component *,class FColor const &);
    static void CDECL SetTextColor(class FString *,unsigned char,unsigned char,unsigned char);
    static class UClass * CDECL StaticClass(void);
    bool UpdateBlinker(struct FBlinkStruct *);
    bool UpdateComponentMove(struct FComponentMoverStruct *);
    void eventFlush(void);
    void execAddBlinkComponent(struct FFrame &,void * const);
    void execCreateFont(struct FFrame &,void * const);
    void execGetTextWidth(struct FFrame &,void * const);
    void execMoveComponent(struct FFrame &,void * const);
    void execRemoveBlinkComponent(struct FFrame &,void * const);
    void execSetTextColor(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
AUTOGENERATE_FUNCTION(UGUI_DefaultToolkit,0,execAddBlinkComponent)
AUTOGENERATE_FUNCTION(UGUI_DefaultToolkit,0,execCreateFont)
AUTOGENERATE_FUNCTION(UGUI_DefaultToolkit,0,execGetTextWidth)
AUTOGENERATE_FUNCTION(UGUI_DefaultToolkit,0,execMoveComponent)
AUTOGENERATE_FUNCTION(UGUI_DefaultToolkit,0,execRemoveBlinkComponent)
AUTOGENERATE_FUNCTION(UGUI_DefaultToolkit,0,execSetTextColor)


//------------------------------------------------------------------------------
//  HUD_SkillDeck
//------------------------------------------------------------------------------

#define UCONST_HUD_SkillDeck_ROTATION_ANGLE  10922.66667
#define UCONST_HUD_SkillDeck_BAR_FOV  35
#define UCONST_HUD_SkillDeck_BAR_OFFSET_Z  250
#define UCONST_HUD_SkillDeck_BAR_OFFSET_Y  -40
#define UCONST_HUD_SkillDeck_BAR_OFFSET_X  0
#define UCONST_HUD_SkillDeck_BUTTON_HEIGHT  24
#define UCONST_HUD_SkillDeck_BUTTON_WIDTH  115
#define UCONST_HUD_SkillDeck_BUTTON_COUNT  3
#define UCONST_HUD_SkillDeck_TIER_COUNT  6
#define UCONST_HUD_SkillDeck_WINDOW_WIDTH  410
#define UCONST_HUD_SkillDeck_WINDOW_HEIGHT  578
//  HUD_SkillDeck.UpdateMeshMaterials 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeck_execUpdateMeshMaterials_Parms {
};


//  HUD_SkillDeck.ClearSlotHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeck_execClearSlotHandler_Parms {
  INT aRow;  // 0 80 CPF_Parm
  INT aSlot;  // 4 80 CPF_Parm
};


//  HUD_SkillDeck.SetSlotHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeck_execSetSlotHandler_Parms {
  INT aRow;  // 0 80 CPF_Parm
  INT aSlot;  // 4 80 CPF_Parm
  class UFSkill_Type* aSkillType;  // 8 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  HUD_SkillDeck.TickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeck_execTickHandler_Parms {
  FLOAT aDelta;  // 0 80 CPF_Parm
};


//  HUD_SkillDeck.HiliteSlotHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeck_execHiliteSlotHandler_Parms {
  INT aRow;  // 0 80 CPF_Parm
  INT aSlot;  // 4 80 CPF_Parm
  BITFIELD aHilite : 1;  // 8 80 CPF_Parm
};


//  HUD_SkillDeck.SelectDeckHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeck_execSelectDeckHandler_Parms {
  class UGUI_Component* aClickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_SkillDeck.UpdateSkillPages 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeck_execUpdateSkillPages_Parms {
};


//  HUD_SkillDeck.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_SkillDeck_eventDoShowWindow_Parms {
  INT aFlags;  // 0 80 CPF_Parm
};


//  HUD_SkillDeck.PostDrawHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeck_execPostDrawHandler_Parms {
  class UCanvas* aCanvas;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_SkillDeck.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_SkillDeck_eventInitialize_Parms {
};


// UHUD_SkillDeck 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SkillDeck : public UGUI_Window {
  public:
    class UGUI_Page* mTierPage;  // 37C 0
    TArray<class UHUD_SkillDeckPage*> mSkillPages;  // 380 400000 CPF_NeedCtorLink
    class UGUI_Page* mDeckPage;  // 38C 0
    TArray<class UGUI_Button*> mDeckButtons;  // 390 400000 CPF_NeedCtorLink
    class UGUI_Mesh* mCombatBarComponent01;  // 39C 2000000 CPF_EditorData
    class UGUI_Mesh* mCombatBarComponent03;  // 3A0 0
    class UGUI_Mesh* mCombatBarComponent04;  // 3A4 0
    class UGUI_Mesh* mCombatBarComponent05;  // 3A8 2000000 CPF_EditorData
    class UGUI_Mesh* mCombatBarComponent06;  // 3AC 0
    class UCombiner* mSlotMaterials[30];  // 3B0 0
    class UConstantColor* mConstantColor;  // 428 0
    FLOAT mCurrentRoll;  // 42C 0
    FLOAT mTargetRoll;  // 430 0
};


//------------------------------------------------------------------------------
//  HUD_RulesWindow
//------------------------------------------------------------------------------

//  HUD_RulesWindow.SetTutorialByID 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_RulesWindow_execSetTutorialByID_Parms {
  INT articleID;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_RulesWindow.Initialize 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_RulesWindow_execInitialize_Parms {
};


// UHUD_RulesWindow 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_RulesWindow : public UHUD_HelpKnowledgeBase {
};


//------------------------------------------------------------------------------
//  GUI_Sounds
//------------------------------------------------------------------------------

//  GUI_Sounds.GetDragSound 22002 0 ( FUNC_Defined FUNC_Static FUNC_Public )
struct UGUI_Sounds_execGetDragSound_Parms {
  class UGame_Item* Item;  // 0 80 CPF_Parm
  class USound* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UGUI_Sounds 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UGUI_Sounds : public UObject {
  public:
    class USound* CombatStart;  // 28 2000000 CPF_EditorData
    class USound* RollToNextTier;  // 2C 2000000 CPF_EditorData
    class USound* ResetCombatbar;  // 30 2000000 CPF_EditorData
    class USound* CannotActivateSkill;  // 34 2000000 CPF_EditorData
    class USound* RotateSkillSelection;  // 38 2000000 CPF_EditorData
    class USound* ChangeCombatSet;  // 3C 2000000 CPF_EditorData
    class USound* CombatbarAppears;  // 40 2000000 CPF_EditorData
    class USound* CombatbarChange;  // 44 2000000 CPF_EditorData
    class USound* ComboStart;  // 48 2000000 CPF_EditorData
    class USound* ComboFollowUp;  // 4C 2000000 CPF_EditorData
    class USound* ComboFinish;  // 50 2000000 CPF_EditorData
    class USound* ComboFinishKill;  // 54 2000000 CPF_EditorData
    class USound* WindowFoldOut;  // 58 2000000 CPF_EditorData
    class USound* WindowFoldIn;  // 5C 2000000 CPF_EditorData
    class USound* WindowOpen;  // 60 2000000 CPF_EditorData
    class USound* WindowClose;  // 64 2000000 CPF_EditorData
    class USound* ButtonPress;  // 68 2000000 CPF_EditorData
    class USound* BoxCheck;  // 6C 2000000 CPF_EditorData
    class USound* WorldmapSwitch;  // 70 2000000 CPF_EditorData
    class USound* LearnSkill;  // 74 2000000 CPF_EditorData
    class USound* UpgradeSkill;  // 78 2000000 CPF_EditorData
    class USound* MenuItemPickupDefault;  // 7C 2000000 CPF_EditorData
    class USound* MenuItemPickupFlask;  // 80 2000000 CPF_EditorData
    class USound* MenuItemPickupMetalWeapon;  // 84 2000000 CPF_EditorData
    class USound* MenuItemPickupWoodWeapon;  // 88 2000000 CPF_EditorData
    class USound* MenuItemPickupClothing;  // 8C 2000000 CPF_EditorData
    class USound* MenuItemPickupArmor;  // 90 2000000 CPF_EditorData
    class USound* MenuItemPickupSpell;  // 94 2000000 CPF_EditorData
    class USound* MenuItemPickupMoney;  // 98 2000000 CPF_EditorData
    class USound* MenuItemDrop;  // 9C 2000000 CPF_EditorData
    class USound* MenuItemDropMissed;  // A0 2000000 CPF_EditorData
    class USound* Buy;  // A4 2000000 CPF_EditorData
    class USound* Sell;  // A8 2000000 CPF_EditorData
    class USound* Breakdown;  // AC 2000000 CPF_EditorData
    class USound* CreateRecipe;  // B0 2000000 CPF_EditorData
    class USound* CraftRecipe;  // B4 2000000 CPF_EditorData
    class USound* ForgeButton;  // B8 2000000 CPF_EditorData
    class USound* CraftSigil;  // BC 2000000 CPF_EditorData
    class USound* RemoveSigil;  // C0 2000000 CPF_EditorData
    class USound* DyeItem;  // C4 2000000 CPF_EditorData
    class USound* SystemMessage;  // C8 2000000 CPF_EditorData
    class USound* LevelIncrease;  // CC 2000000 CPF_EditorData
    class USound* PepIncrease;  // D0 2000000 CPF_EditorData
    class USound* FinishQuest;  // D4 2000000 CPF_EditorData
    class USound* AcceptQuest;  // D8 2000000 CPF_EditorData
    class USound* AbandonQuest;  // DC 2000000 CPF_EditorData
    class USound* PrivateMessage;  // E0 2000000 CPF_EditorData
    class USound* MailMessage;  // E4 2000000 CPF_EditorData
    class USound* FriendOnline;  // E8 2000000 CPF_EditorData
    class USound* GuildOnline;  // EC 2000000 CPF_EditorData
};


//------------------------------------------------------------------------------
//  GUI_EntryBox
//------------------------------------------------------------------------------

//  GUI_EntryBox.ClickHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UGUI_EntryBox_execClickHandler_Parms {
  class UGUI_Component* clickedButton;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  GUI_EntryBox.DoShowWindow 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_EntryBox_eventDoShowWindow_Parms {
  INT flags;  // 0 80 CPF_Parm
};


//  GUI_EntryBox.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UGUI_EntryBox_eventInitialize_Parms {
};


// UGUI_EntryBox 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UGUI_EntryBox : public UGUI_MessageBox {
  public:
    class UGUI_EditBox* mEditBox;  // 3A4 0
};


//------------------------------------------------------------------------------
//  HUD_SkillDeckPage
//------------------------------------------------------------------------------

//  HUD_SkillDeckPage.SetDelegates 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeckPage_execSetDelegates_Parms {
};


//  HUD_SkillDeckPage.OnComponentDestroyed 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_SkillDeckPage_eventOnComponentDestroyed_Parms {
};


//  HUD_SkillDeckPage.DeHiliteHandler 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_SkillDeckPage_eventDeHiliteHandler_Parms {
  class UGUI_Component* fromChild;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_SkillDeckPage.HiliteHandler 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_SkillDeckPage_eventHiliteHandler_Parms {
  class UGUI_Component* fromChild;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_SkillDeckPage.DropHandler 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_SkillDeckPage_eventDropHandler_Parms {
  class UGUI_DnDInfo* aDndInfo;  // 0 80 CPF_Parm
  FLOAT aRelMouseX;  // 4 80 CPF_Parm
  FLOAT aRelMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* aFromChild;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_SkillDeckPage.DragHandler 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_SkillDeckPage_eventDragHandler_Parms {
  class UGUI_DnDInfo* aDndInfo;  // 0 80 CPF_Parm
  FLOAT aRelMouseX;  // 4 80 CPF_Parm
  FLOAT aRelMouseY;  // 8 80 CPF_Parm
  class UGUI_Component* aFromChild;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_SkillDeckPage.GetSkill 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeckPage_execGetSkill_Parms {
  INT aSlot;  // 0 80 CPF_Parm
  class UFSkill_Type* ReturnValue;  // 4 4400588 CPF_ExportObject CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink CPF_EditInline
};


//  HUD_SkillDeckPage.SetSkill 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeckPage_execSetSkill_Parms {
  INT aSlot;  // 0 80 CPF_Parm
  class UFSkill_Type* aSkillType;  // 4 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


//  HUD_SkillDeckPage.SetTier 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeckPage_execSetTier_Parms {
  INT aTierID;  // 0 80 CPF_Parm
};


//  HUD_SkillDeckPage.KeyEventHandler 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeckPage_execKeyEventHandler_Parms {
  class UGUI_Component* component;  // 0 80 CPF_Parm
  BYTE aKey;  // 4 180 CPF_Parm CPF_OutParm
  BYTE aState;  // 5 180 CPF_Parm CPF_OutParm
  FLOAT aDelta;  // 8 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  HUD_SkillDeckPage.UpdateSlotColors 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeckPage_execUpdateSlotColors_Parms {
};


//  HUD_SkillDeckPage.Initialize 20802 0 ( FUNC_Defined FUNC_Event FUNC_Public )
struct UHUD_SkillDeckPage_eventInitialize_Parms {
};


//  HUD_SkillDeckPage.GetMaxRowsAndCols 20002 0 ( FUNC_Defined FUNC_Public )
struct UHUD_SkillDeckPage_execGetMaxRowsAndCols_Parms {
  INT MaxRows;  // 0 180 CPF_Parm CPF_OutParm
  INT MaxCols;  // 4 180 CPF_Parm CPF_OutParm
};


//  HUD_SkillDeckPage.OnHiliteSlot 120000 0 ( FUNC_Public FUNC_Delegate )
struct UHUD_SkillDeckPage_execOnHiliteSlot_Parms {
  INT row;  // 0 80 CPF_Parm
  INT Slot;  // 4 80 CPF_Parm
  BITFIELD State : 1;  // 8 80 CPF_Parm
};


//  HUD_SkillDeckPage.OnClearSlot 120000 0 ( FUNC_Public FUNC_Delegate )
struct UHUD_SkillDeckPage_execOnClearSlot_Parms {
  INT row;  // 0 80 CPF_Parm
  INT Slot;  // 4 80 CPF_Parm
};


//  HUD_SkillDeckPage.OnSetSlot 120000 0 ( FUNC_Public FUNC_Delegate )
struct UHUD_SkillDeckPage_execOnSetSlot_Parms {
  INT row;  // 0 80 CPF_Parm
  INT Slot;  // 4 80 CPF_Parm
  class UFSkill_Type* skillType;  // 8 4400088 CPF_ExportObject CPF_Parm CPF_NeedCtorLink CPF_EditInline
};


// UHUD_SkillDeckPage 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UHUD_SkillDeckPage : public UGUI_Page {
  public:
    class UGUI_Label* mTierName;  // 2E4 0
    class UGUI_Page* mSkillPage;  // 2E8 0
    TArray<class UGUI_Button*> mSkillSlots;  // 2EC 400000 CPF_NeedCtorLink
    TArray<class UFSkill_Type*> mSkills;  // 2F8 400000 CPF_NeedCtorLink
    class UGUI_Image* mBackgroundImage;  // 304 0
    struct FScriptDelegate __OnSetSlot__Delegate;  // 308 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnClearSlot__Delegate;  // 310 400000 CPF_NeedCtorLink
    struct FScriptDelegate __OnHiliteSlot__Delegate;  // 318 400000 CPF_NeedCtorLink
};


//------------------------------------------------------------------------------
//  GUI_Styles
//------------------------------------------------------------------------------

#define UCONST_GUI_Styles_Treeview_Selection_B_HEIGHT  2
#define UCONST_GUI_Styles_Treeview_Selection_B_WIDTH  2
#define UCONST_GUI_Styles_Treeview_Selection_B_TOP  24
#define UCONST_GUI_Styles_Treeview_Selection_B_LEFT  1021
#define UCONST_GUI_Styles_Group_Avatar_Bar_Yellow_B_HEIGHT  3
#define UCONST_GUI_Styles_Group_Avatar_Bar_Yellow_B_WIDTH  59
#define UCONST_GUI_Styles_Group_Avatar_Bar_Yellow_B_TOP  395
#define UCONST_GUI_Styles_Group_Avatar_Bar_Yellow_B_LEFT  614
#define UCONST_GUI_Styles_Group_Avatar_Bar_Orange_B_HEIGHT  3
#define UCONST_GUI_Styles_Group_Avatar_Bar_Orange_B_WIDTH  59
#define UCONST_GUI_Styles_Group_Avatar_Bar_Orange_B_TOP  390
#define UCONST_GUI_Styles_Group_Avatar_Bar_Orange_B_LEFT  960
#define UCONST_GUI_Styles_Group_Avatar_Bar_Blue_B_HEIGHT  3
#define UCONST_GUI_Styles_Group_Avatar_Bar_Blue_B_WIDTH  59
#define UCONST_GUI_Styles_Group_Avatar_Bar_Blue_B_TOP  390
#define UCONST_GUI_Styles_Group_Avatar_Bar_Blue_B_LEFT  901
#define UCONST_GUI_Styles_Taskicon_Inactive_HEIGHT  4
#define UCONST_GUI_Styles_Taskicon_Inactive_WIDTH  9
#define UCONST_GUI_Styles_Taskicon_Inactive_TOP  390
#define UCONST_GUI_Styles_Taskicon_Inactive_LEFT  892
#define UCONST_GUI_Styles_Taskicon_Active_HEIGHT  4
#define UCONST_GUI_Styles_Taskicon_Active_WIDTH  9
#define UCONST_GUI_Styles_Taskicon_Active_TOP  230
#define UCONST_GUI_Styles_Taskicon_Active_LEFT  1008
#define UCONST_GUI_Styles_SelectText_HEIGHT  4
#define UCONST_GUI_Styles_SelectText_WIDTH  4
#define UCONST_GUI_Styles_SelectText_TOP  29
#define UCONST_GUI_Styles_SelectText_LEFT  1016
#define UCONST_GUI_Styles_Inventory_Dot_B_HEIGHT  4
#define UCONST_GUI_Styles_Inventory_Dot_B_WIDTH  4
#define UCONST_GUI_Styles_Inventory_Dot_B_TOP  24
#define UCONST_GUI_Styles_Inventory_Dot_B_LEFT  1017
#define UCONST_GUI_Styles_DropInventoryRectangleDot_HEIGHT  4
#define UCONST_GUI_Styles_DropInventoryRectangleDot_WIDTH  4
#define UCONST_GUI_Styles_DropInventoryRectangleDot_TOP  24
#define UCONST_GUI_Styles_DropInventoryRectangleDot_LEFT  1013
#define UCONST_GUI_Styles_Avatar_Bar_Yellow_B_HEIGHT  5
#define UCONST_GUI_Styles_Avatar_Bar_Yellow_B_WIDTH  139
#define UCONST_GUI_Styles_Avatar_Bar_Yellow_B_TOP  488
#define UCONST_GUI_Styles_Avatar_Bar_Yellow_B_LEFT  501
#define UCONST_GUI_Styles_Avatar_Bar_Orange_B_HEIGHT  5
#define UCONST_GUI_Styles_Avatar_Bar_Orange_B_WIDTH  139
#define UCONST_GUI_Styles_Avatar_Bar_Orange_B_TOP  390
#define UCONST_GUI_Styles_Avatar_Bar_Orange_B_LEFT  753
#define UCONST_GUI_Styles_Avatar_Bar_Blue_B_HEIGHT  5
#define UCONST_GUI_Styles_Avatar_Bar_Blue_B_WIDTH  139
#define UCONST_GUI_Styles_Avatar_Bar_Blue_B_TOP  390
#define UCONST_GUI_Styles_Avatar_Bar_Blue_B_LEFT  614
#define UCONST_GUI_Styles_White_Dot_HEIGHT  8
#define UCONST_GUI_Styles_White_Dot_WIDTH  8
#define UCONST_GUI_Styles_White_Dot_TOP  29
#define UCONST_GUI_Styles_White_Dot_LEFT  1008
#define UCONST_GUI_Styles_Minimap_Button05_B_HEIGHT  9
#define UCONST_GUI_Styles_Minimap_Button05_B_WIDTH  9
#define UCONST_GUI_Styles_Minimap_Button05_B_TOP  390
#define UCONST_GUI_Styles_Minimap_Button05_B_LEFT  605
#define UCONST_GUI_Styles_Minimap_Button04_B_HEIGHT  9
#define UCONST_GUI_Styles_Minimap_Button04_B_WIDTH  9
#define UCONST_GUI_Styles_Minimap_Button04_B_TOP  390
#define UCONST_GUI_Styles_Minimap_Button04_B_LEFT  596
#define UCONST_GUI_Styles_Minimap_Button03_B_HEIGHT  9
#define UCONST_GUI_Styles_Minimap_Button03_B_WIDTH  9
#define UCONST_GUI_Styles_Minimap_Button03_B_TOP  390
#define UCONST_GUI_Styles_Minimap_Button03_B_LEFT  587
#define UCONST_GUI_Styles_Minimap_Button02_B_HEIGHT  9
#define UCONST_GUI_Styles_Minimap_Button02_B_WIDTH  9
#define UCONST_GUI_Styles_Minimap_Button02_B_TOP  390
#define UCONST_GUI_Styles_Minimap_Button02_B_LEFT  578
#define UCONST_GUI_Styles_Minimap_Button01_B_HEIGHT  9
#define UCONST_GUI_Styles_Minimap_Button01_B_WIDTH  9
#define UCONST_GUI_Styles_Minimap_Button01_B_TOP  390
#define UCONST_GUI_Styles_Minimap_Button01_B_LEFT  569
#define UCONST_GUI_Styles_Mail_New_HEIGHT  9
#define UCONST_GUI_Styles_Mail_New_WIDTH  13
#define UCONST_GUI_Styles_Mail_New_TOP  337
#define UCONST_GUI_Styles_Mail_New_LEFT  1010
#define UCONST_GUI_Styles_TreeButton_Plus_W_HEIGHT  11
#define UCONST_GUI_Styles_TreeButton_Plus_W_WIDTH  11
#define UCONST_GUI_Styles_TreeButton_Plus_W_TOP  390
#define UCONST_GUI_Styles_TreeButton_Plus_W_LEFT  558
#define UCONST_GUI_Styles_TreeButton_Plus_P_HEIGHT  11
#define UCONST_GUI_Styles_TreeButton_Plus_P_WIDTH  11
#define UCONST_GUI_Styles_TreeButton_Plus_P_TOP  390
#define UCONST_GUI_Styles_TreeButton_Plus_P_LEFT  547
#define UCONST_GUI_Styles_TreeButton_Plus_B_HEIGHT  11
#define UCONST_GUI_Styles_TreeButton_Plus_B_WIDTH  11
#define UCONST_GUI_Styles_TreeButton_Plus_B_TOP  390
#define UCONST_GUI_Styles_TreeButton_Plus_B_LEFT  536
#define UCONST_GUI_Styles_TreeButton_Minus_W_HEIGHT  11
#define UCONST_GUI_Styles_TreeButton_Minus_W_WIDTH  11
#define UCONST_GUI_Styles_TreeButton_Minus_W_TOP  390
#define UCONST_GUI_Styles_TreeButton_Minus_W_LEFT  525
#define UCONST_GUI_Styles_TreeButton_Minus_P_HEIGHT  11
#define UCONST_GUI_Styles_TreeButton_Minus_P_WIDTH  11
#define UCONST_GUI_Styles_TreeButton_Minus_P_TOP  390
#define UCONST_GUI_Styles_TreeButton_Minus_P_LEFT  514
#define UCONST_GUI_Styles_TreeButton_Minus_B_HEIGHT  11
#define UCONST_GUI_Styles_TreeButton_Minus_B_WIDTH  11
#define UCONST_GUI_Styles_TreeButton_Minus_B_TOP  390
#define UCONST_GUI_Styles_TreeButton_Minus_B_LEFT  503
#define UCONST_GUI_Styles_Tableview_Up_HEIGHT  11
#define UCONST_GUI_Styles_Tableview_Up_WIDTH  11
#define UCONST_GUI_Styles_Tableview_Up_TOP  390
#define UCONST_GUI_Styles_Tableview_Up_LEFT  492
#define UCONST_GUI_Styles_Tableview_Down_HEIGHT  11
#define UCONST_GUI_Styles_Tableview_Down_WIDTH  11
#define UCONST_GUI_Styles_Tableview_Down_TOP  390
#define UCONST_GUI_Styles_Tableview_Down_LEFT  481
#define UCONST_GUI_Styles_Slider_Hor_Handle_W_HEIGHT  11
#define UCONST_GUI_Styles_Slider_Hor_Handle_W_WIDTH  24
#define UCONST_GUI_Styles_Slider_Hor_Handle_W_TOP  390
#define UCONST_GUI_Styles_Slider_Hor_Handle_W_LEFT  457
#define UCONST_GUI_Styles_Slider_Hor_Handle_P_HEIGHT  11
#define UCONST_GUI_Styles_Slider_Hor_Handle_P_WIDTH  24
#define UCONST_GUI_Styles_Slider_Hor_Handle_P_TOP  390
#define UCONST_GUI_Styles_Slider_Hor_Handle_P_LEFT  433
#define UCONST_GUI_Styles_Slider_Hor_Handle_B_HEIGHT  11
#define UCONST_GUI_Styles_Slider_Hor_Handle_B_WIDTH  24
#define UCONST_GUI_Styles_Slider_Hor_Handle_B_TOP  390
#define UCONST_GUI_Styles_Slider_Hor_Handle_B_LEFT  409
#define UCONST_GUI_Styles_Conversation_Icons_Leave_B_HEIGHT  11
#define UCONST_GUI_Styles_Conversation_Icons_Leave_B_WIDTH  12
#define UCONST_GUI_Styles_Conversation_Icons_Leave_B_TOP  390
#define UCONST_GUI_Styles_Conversation_Icons_Leave_B_LEFT  397
#define UCONST_GUI_Styles_Conversation_Icons_Decline_B_HEIGHT  11
#define UCONST_GUI_Styles_Conversation_Icons_Decline_B_WIDTH  11
#define UCONST_GUI_Styles_Conversation_Icons_Decline_B_TOP  390
#define UCONST_GUI_Styles_Conversation_Icons_Decline_B_LEFT  386
#define UCONST_GUI_Styles_Conversation_Icons_Bubble_B_HEIGHT  11
#define UCONST_GUI_Styles_Conversation_Icons_Bubble_B_WIDTH  11
#define UCONST_GUI_Styles_Conversation_Icons_Bubble_B_TOP  347
#define UCONST_GUI_Styles_Conversation_Icons_Bubble_B_LEFT  1011
#define UCONST_GUI_Styles_Taskicon_Failed_HEIGHT  12
#define UCONST_GUI_Styles_Taskicon_Failed_WIDTH  12
#define UCONST_GUI_Styles_Taskicon_Failed_TOP  347
#define UCONST_GUI_Styles_Taskicon_Failed_LEFT  999
#define UCONST_GUI_Styles_ScrollArrowRight_W_HEIGHT  12
#define UCONST_GUI_Styles_ScrollArrowRight_W_WIDTH  10
#define UCONST_GUI_Styles_ScrollArrowRight_W_TOP  347
#define UCONST_GUI_Styles_ScrollArrowRight_W_LEFT  989
#define UCONST_GUI_Styles_ScrollArrowRight_P_HEIGHT  12
#define UCONST_GUI_Styles_ScrollArrowRight_P_WIDTH  10
#define UCONST_GUI_Styles_ScrollArrowRight_P_TOP  347
#define UCONST_GUI_Styles_ScrollArrowRight_P_LEFT  979
#define UCONST_GUI_Styles_ScrollArrowRight_D_HEIGHT  12
#define UCONST_GUI_Styles_ScrollArrowRight_D_WIDTH  10
#define UCONST_GUI_Styles_ScrollArrowRight_D_TOP  347
#define UCONST_GUI_Styles_ScrollArrowRight_D_LEFT  969
#define UCONST_GUI_Styles_ScrollArrowRight_B_HEIGHT  12
#define UCONST_GUI_Styles_ScrollArrowRight_B_WIDTH  10
#define UCONST_GUI_Styles_ScrollArrowRight_B_TOP  347
#define UCONST_GUI_Styles_ScrollArrowRight_B_LEFT  959
#define UCONST_GUI_Styles_Mail_Old_HEIGHT  12
#define UCONST_GUI_Styles_Mail_Old_WIDTH  13
#define UCONST_GUI_Styles_Mail_Old_TOP  347
#define UCONST_GUI_Styles_Mail_Old_LEFT  946
#define UCONST_GUI_Styles_Group_Avatar_Healthbar_end_B_HEIGHT  12
#define UCONST_GUI_Styles_Group_Avatar_Healthbar_end_B_WIDTH  1
#define UCONST_GUI_Styles_Group_Avatar_Healthbar_end_B_TOP  37
#define UCONST_GUI_Styles_Group_Avatar_Healthbar_end_B_LEFT  1018
#define UCONST_GUI_Styles_Group_Avatar_Healthbar_B_HEIGHT  12
#define UCONST_GUI_Styles_Group_Avatar_Healthbar_B_WIDTH  115
#define UCONST_GUI_Styles_Group_Avatar_Healthbar_B_TOP  488
#define UCONST_GUI_Styles_Group_Avatar_Healthbar_B_LEFT  386
#define UCONST_GUI_Styles_Currency_Small_Sunplates_B_HEIGHT  12
#define UCONST_GUI_Styles_Currency_Small_Sunplates_B_WIDTH  15
#define UCONST_GUI_Styles_Currency_Small_Sunplates_B_TOP  347
#define UCONST_GUI_Styles_Currency_Small_Sunplates_B_LEFT  931
#define UCONST_GUI_Styles_Currency_Small_Quarternails_B_HEIGHT  12
#define UCONST_GUI_Styles_Currency_Small_Quarternails_B_WIDTH  19
#define UCONST_GUI_Styles_Currency_Small_Quarternails_B_TOP  347
#define UCONST_GUI_Styles_Currency_Small_Quarternails_B_LEFT  912
#define UCONST_GUI_Styles_Currency_Small_Loderings_B_HEIGHT  12
#define UCONST_GUI_Styles_Currency_Small_Loderings_B_WIDTH  15
#define UCONST_GUI_Styles_Currency_Small_Loderings_B_TOP  347
#define UCONST_GUI_Styles_Currency_Small_Loderings_B_LEFT  897
#define UCONST_GUI_Styles_ContextArrow_W_HEIGHT  12
#define UCONST_GUI_Styles_ContextArrow_W_WIDTH  7
#define UCONST_GUI_Styles_ContextArrow_W_TOP  347
#define UCONST_GUI_Styles_ContextArrow_W_LEFT  890
#define UCONST_GUI_Styles_ContextArrow_P_HEIGHT  12
#define UCONST_GUI_Styles_ContextArrow_P_WIDTH  7
#define UCONST_GUI_Styles_ContextArrow_P_TOP  347
#define UCONST_GUI_Styles_ContextArrow_P_LEFT  883
#define UCONST_GUI_Styles_ContextArrow_B_HEIGHT  12
#define UCONST_GUI_Styles_ContextArrow_B_WIDTH  7
#define UCONST_GUI_Styles_ContextArrow_B_TOP  86
#define UCONST_GUI_Styles_ContextArrow_B_LEFT  1015
#define UCONST_GUI_Styles_Chat_Icon_HEIGHT  12
#define UCONST_GUI_Styles_Chat_Icon_WIDTH  12
#define UCONST_GUI_Styles_Chat_Icon_TOP  347
#define UCONST_GUI_Styles_Chat_Icon_LEFT  871
#define UCONST_GUI_Styles_Characterstats_Plus_W_HEIGHT  12
#define UCONST_GUI_Styles_Characterstats_Plus_W_WIDTH  11
#define UCONST_GUI_Styles_Characterstats_Plus_W_TOP  347
#define UCONST_GUI_Styles_Characterstats_Plus_W_LEFT  860
#define UCONST_GUI_Styles_Characterstats_Plus_P_HEIGHT  12
#define UCONST_GUI_Styles_Characterstats_Plus_P_WIDTH  11
#define UCONST_GUI_Styles_Characterstats_Plus_P_TOP  347
#define UCONST_GUI_Styles_Characterstats_Plus_P_LEFT  849
#define UCONST_GUI_Styles_Characterstats_Plus_B_HEIGHT  12
#define UCONST_GUI_Styles_Characterstats_Plus_B_WIDTH  11
#define UCONST_GUI_Styles_Characterstats_Plus_B_TOP  347
#define UCONST_GUI_Styles_Characterstats_Plus_B_LEFT  838
#define UCONST_GUI_Styles_Characterstats_Minus_W_HEIGHT  12
#define UCONST_GUI_Styles_Characterstats_Minus_W_WIDTH  11
#define UCONST_GUI_Styles_Characterstats_Minus_W_TOP  347
#define UCONST_GUI_Styles_Characterstats_Minus_W_LEFT  827
#define UCONST_GUI_Styles_Characterstats_Minus_P_HEIGHT  12
#define UCONST_GUI_Styles_Characterstats_Minus_P_WIDTH  11
#define UCONST_GUI_Styles_Characterstats_Minus_P_TOP  347
#define UCONST_GUI_Styles_Characterstats_Minus_P_LEFT  816
#define UCONST_GUI_Styles_Characterstats_Minus_B_HEIGHT  12
#define UCONST_GUI_Styles_Characterstats_Minus_B_WIDTH  11
#define UCONST_GUI_Styles_Characterstats_Minus_B_TOP  347
#define UCONST_GUI_Styles_Characterstats_Minus_B_LEFT  805
#define UCONST_GUI_Styles_WindowMinimizeButton_W_HEIGHT  13
#define UCONST_GUI_Styles_WindowMinimizeButton_W_WIDTH  11
#define UCONST_GUI_Styles_WindowMinimizeButton_W_TOP  347
#define UCONST_GUI_Styles_WindowMinimizeButton_W_LEFT  794
#define UCONST_GUI_Styles_WindowMinimizeButton_P_HEIGHT  13
#define UCONST_GUI_Styles_WindowMinimizeButton_P_WIDTH  11
#define UCONST_GUI_Styles_WindowMinimizeButton_P_TOP  347
#define UCONST_GUI_Styles_WindowMinimizeButton_P_LEFT  783
#define UCONST_GUI_Styles_WindowMinimizeButton_D_HEIGHT  13
#define UCONST_GUI_Styles_WindowMinimizeButton_D_WIDTH  11
#define UCONST_GUI_Styles_WindowMinimizeButton_D_TOP  347
#define UCONST_GUI_Styles_WindowMinimizeButton_D_LEFT  772
#define UCONST_GUI_Styles_WindowMinimizeButton_B_HEIGHT  13
#define UCONST_GUI_Styles_WindowMinimizeButton_B_WIDTH  11
#define UCONST_GUI_Styles_WindowMinimizeButton_B_TOP  347
#define UCONST_GUI_Styles_WindowMinimizeButton_B_LEFT  761
#define UCONST_GUI_Styles_Taskicon_Complete_HEIGHT  13
#define UCONST_GUI_Styles_Taskicon_Complete_WIDTH  16
#define UCONST_GUI_Styles_Taskicon_Complete_TOP  347
#define UCONST_GUI_Styles_Taskicon_Complete_LEFT  745
#define UCONST_GUI_Styles_Conversation_Icons_Scroll_B_HEIGHT  13
#define UCONST_GUI_Styles_Conversation_Icons_Scroll_B_WIDTH  15
#define UCONST_GUI_Styles_Conversation_Icons_Scroll_B_TOP  347
#define UCONST_GUI_Styles_Conversation_Icons_Scroll_B_LEFT  730
#define UCONST_GUI_Styles_Characterstats_PEPbar_Shadow_HEIGHT  13
#define UCONST_GUI_Styles_Characterstats_PEPbar_Shadow_WIDTH  24
#define UCONST_GUI_Styles_Characterstats_PEPbar_Shadow_TOP  347
#define UCONST_GUI_Styles_Characterstats_PEPbar_Shadow_LEFT  706
#define UCONST_GUI_Styles_Characterstats_PEPbar_HEIGHT  13
#define UCONST_GUI_Styles_Characterstats_PEPbar_WIDTH  3
#define UCONST_GUI_Styles_Characterstats_PEPbar_TOP  37
#define UCONST_GUI_Styles_Characterstats_PEPbar_LEFT  1015
#define UCONST_GUI_Styles_Conversation_Icons_Accept_B_HEIGHT  14
#define UCONST_GUI_Styles_Conversation_Icons_Accept_B_WIDTH  12
#define UCONST_GUI_Styles_Conversation_Icons_Accept_B_TOP  566
#define UCONST_GUI_Styles_Conversation_Icons_Accept_B_LEFT  911
#define UCONST_GUI_Styles_Combo_Opener_HEIGHT  14
#define UCONST_GUI_Styles_Combo_Opener_WIDTH  15
#define UCONST_GUI_Styles_Combo_Opener_TOP  566
#define UCONST_GUI_Styles_Combo_Opener_LEFT  896
#define UCONST_GUI_Styles_Combo_On_HEIGHT  14
#define UCONST_GUI_Styles_Combo_On_WIDTH  15
#define UCONST_GUI_Styles_Combo_On_TOP  566
#define UCONST_GUI_Styles_Combo_On_LEFT  881
#define UCONST_GUI_Styles_Combo_FollowUp_HEIGHT  14
#define UCONST_GUI_Styles_Combo_FollowUp_WIDTH  15
#define UCONST_GUI_Styles_Combo_FollowUp_TOP  566
#define UCONST_GUI_Styles_Combo_FollowUp_LEFT  866
#define UCONST_GUI_Styles_Combo_Finisher_HEIGHT  14
#define UCONST_GUI_Styles_Combo_Finisher_WIDTH  15
#define UCONST_GUI_Styles_Combo_Finisher_TOP  86
#define UCONST_GUI_Styles_Combo_Finisher_LEFT  1000
#define UCONST_GUI_Styles_Avatar_Healthbar_end_B_HEIGHT  15
#define UCONST_GUI_Styles_Avatar_Healthbar_end_B_WIDTH  1
#define UCONST_GUI_Styles_Avatar_Healthbar_end_B_TOP  37
#define UCONST_GUI_Styles_Avatar_Healthbar_end_B_LEFT  1014
#define UCONST_GUI_Styles_Avatar_Healthbar_B_HEIGHT  15
#define UCONST_GUI_Styles_Avatar_Healthbar_B_WIDTH  215
#define UCONST_GUI_Styles_Avatar_Healthbar_B_TOP  937
#define UCONST_GUI_Styles_Avatar_Healthbar_B_LEFT  51
#define UCONST_GUI_Styles_RadioButton_W_HEIGHT  16
#define UCONST_GUI_Styles_RadioButton_W_WIDTH  16
#define UCONST_GUI_Styles_RadioButton_W_TOP  566
#define UCONST_GUI_Styles_RadioButton_W_LEFT  850
#define UCONST_GUI_Styles_RadioButton_RedDot_HEIGHT  16
#define UCONST_GUI_Styles_RadioButton_RedDot_WIDTH  16
#define UCONST_GUI_Styles_RadioButton_RedDot_TOP  566
#define UCONST_GUI_Styles_RadioButton_RedDot_LEFT  834
#define UCONST_GUI_Styles_RadioButton_B_HEIGHT  16
#define UCONST_GUI_Styles_RadioButton_B_WIDTH  16
#define UCONST_GUI_Styles_RadioButton_B_TOP  566
#define UCONST_GUI_Styles_RadioButton_B_LEFT  818
#define UCONST_GUI_Styles_MinimapArrow_HEIGHT  16
#define UCONST_GUI_Styles_MinimapArrow_WIDTH  16
#define UCONST_GUI_Styles_MinimapArrow_TOP  566
#define UCONST_GUI_Styles_MinimapArrow_LEFT  802
#define UCONST_GUI_Styles_MenuLock_P_W_HEIGHT  16
#define UCONST_GUI_Styles_MenuLock_P_W_WIDTH  11
#define UCONST_GUI_Styles_MenuLock_P_W_TOP  566
#define UCONST_GUI_Styles_MenuLock_P_W_LEFT  791
#define UCONST_GUI_Styles_MenuLock_P_HEIGHT  16
#define UCONST_GUI_Styles_MenuLock_P_WIDTH  11
#define UCONST_GUI_Styles_MenuLock_P_TOP  566
#define UCONST_GUI_Styles_MenuLock_P_LEFT  780
#define UCONST_GUI_Styles_MenuLock_B_W_HEIGHT  16
#define UCONST_GUI_Styles_MenuLock_B_W_WIDTH  11
#define UCONST_GUI_Styles_MenuLock_B_W_TOP  566
#define UCONST_GUI_Styles_MenuLock_B_W_LEFT  769
#define UCONST_GUI_Styles_MenuLock_B_HEIGHT  16
#define UCONST_GUI_Styles_MenuLock_B_WIDTH  11
#define UCONST_GUI_Styles_MenuLock_B_TOP  566
#define UCONST_GUI_Styles_MenuLock_B_LEFT  758
#define UCONST_GUI_Styles_DuffEmpty_HEIGHT  16
#define UCONST_GUI_Styles_DuffEmpty_WIDTH  16
#define UCONST_GUI_Styles_DuffEmpty_TOP  566
#define UCONST_GUI_Styles_DuffEmpty_LEFT  742
#define UCONST_GUI_Styles_Slider_W_HEIGHT  17
#define UCONST_GUI_Styles_Slider_W_WIDTH  11
#define UCONST_GUI_Styles_Slider_W_TOP  566
#define UCONST_GUI_Styles_Slider_W_LEFT  731
#define UCONST_GUI_Styles_Slider_P_HEIGHT  17
#define UCONST_GUI_Styles_Slider_P_WIDTH  11
#define UCONST_GUI_Styles_Slider_P_TOP  518
#define UCONST_GUI_Styles_Slider_P_LEFT  1013
#define UCONST_GUI_Styles_Slider_Hor_Background_D_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Hor_Background_D_WIDTH  31
#define UCONST_GUI_Styles_Slider_Hor_Background_D_TOP  566
#define UCONST_GUI_Styles_Slider_Hor_Background_D_LEFT  700
#define UCONST_GUI_Styles_Slider_Hor_Background_B_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Hor_Background_B_WIDTH  31
#define UCONST_GUI_Styles_Slider_Hor_Background_B_TOP  566
#define UCONST_GUI_Styles_Slider_Hor_Background_B_LEFT  669
#define UCONST_GUI_Styles_Slider_HandleSmall_W_HEIGHT  17
#define UCONST_GUI_Styles_Slider_HandleSmall_W_WIDTH  11
#define UCONST_GUI_Styles_Slider_HandleSmall_W_TOP  501
#define UCONST_GUI_Styles_Slider_HandleSmall_W_LEFT  1013
#define UCONST_GUI_Styles_Slider_HandleSmall_P_HEIGHT  17
#define UCONST_GUI_Styles_Slider_HandleSmall_P_WIDTH  11
#define UCONST_GUI_Styles_Slider_HandleSmall_P_TOP  320
#define UCONST_GUI_Styles_Slider_HandleSmall_P_LEFT  1010
#define UCONST_GUI_Styles_Slider_HandleSmall_B_HEIGHT  17
#define UCONST_GUI_Styles_Slider_HandleSmall_B_WIDTH  11
#define UCONST_GUI_Styles_Slider_HandleSmall_B_TOP  213
#define UCONST_GUI_Styles_Slider_HandleSmall_B_LEFT  1008
#define UCONST_GUI_Styles_Slider_Button_RIGHT_W_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Button_RIGHT_W_WIDTH  18
#define UCONST_GUI_Styles_Slider_Button_RIGHT_W_TOP  566
#define UCONST_GUI_Styles_Slider_Button_RIGHT_W_LEFT  651
#define UCONST_GUI_Styles_Slider_Button_RIGHT_P_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Button_RIGHT_P_WIDTH  18
#define UCONST_GUI_Styles_Slider_Button_RIGHT_P_TOP  566
#define UCONST_GUI_Styles_Slider_Button_RIGHT_P_LEFT  633
#define UCONST_GUI_Styles_Slider_Button_RIGHT_D_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Button_RIGHT_D_WIDTH  18
#define UCONST_GUI_Styles_Slider_Button_RIGHT_D_TOP  566
#define UCONST_GUI_Styles_Slider_Button_RIGHT_D_LEFT  615
#define UCONST_GUI_Styles_Slider_Button_RIGHT_B_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Button_RIGHT_B_WIDTH  18
#define UCONST_GUI_Styles_Slider_Button_RIGHT_B_TOP  566
#define UCONST_GUI_Styles_Slider_Button_RIGHT_B_LEFT  597
#define UCONST_GUI_Styles_Slider_Button_LEFT_W_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Button_LEFT_W_WIDTH  18
#define UCONST_GUI_Styles_Slider_Button_LEFT_W_TOP  566
#define UCONST_GUI_Styles_Slider_Button_LEFT_W_LEFT  579
#define UCONST_GUI_Styles_Slider_Button_LEFT_P_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Button_LEFT_P_WIDTH  18
#define UCONST_GUI_Styles_Slider_Button_LEFT_P_TOP  566
#define UCONST_GUI_Styles_Slider_Button_LEFT_P_LEFT  561
#define UCONST_GUI_Styles_Slider_Button_LEFT_D_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Button_LEFT_D_WIDTH  18
#define UCONST_GUI_Styles_Slider_Button_LEFT_D_TOP  566
#define UCONST_GUI_Styles_Slider_Button_LEFT_D_LEFT  543
#define UCONST_GUI_Styles_Slider_Button_LEFT_B_HEIGHT  17
#define UCONST_GUI_Styles_Slider_Button_LEFT_B_WIDTH  18
#define UCONST_GUI_Styles_Slider_Button_LEFT_B_TOP  566
#define UCONST_GUI_Styles_Slider_Button_LEFT_B_LEFT  525
#define UCONST_GUI_Styles_Slider_B_HEIGHT  17
#define UCONST_GUI_Styles_Slider_B_WIDTH  11
#define UCONST_GUI_Styles_Slider_B_TOP  37
#define UCONST_GUI_Styles_Slider_B_LEFT  1003
#define UCONST_GUI_Styles_Slider_Button_UP_W_HEIGHT  18
#define UCONST_GUI_Styles_Slider_Button_UP_W_WIDTH  17
#define UCONST_GUI_Styles_Slider_Button_UP_W_TOP  937
#define UCONST_GUI_Styles_Slider_Button_UP_W_LEFT  34
#define UCONST_GUI_Styles_Slider_Button_UP_P_HEIGHT  18
#define UCONST_GUI_Styles_Slider_Button_UP_P_WIDTH  17
#define UCONST_GUI_Styles_Slider_Button_UP_P_TOP  937
#define UCONST_GUI_Styles_Slider_Button_UP_P_LEFT  17
#define UCONST_GUI_Styles_Slider_Button_UP_D_HEIGHT  18
#define UCONST_GUI_Styles_Slider_Button_UP_D_WIDTH  17
#define UCONST_GUI_Styles_Slider_Button_UP_D_TOP  937
#define UCONST_GUI_Styles_Slider_Button_UP_D_LEFT  0
#define UCONST_GUI_Styles_Slider_Button_UP_B_HEIGHT  18
#define UCONST_GUI_Styles_Slider_Button_UP_B_WIDTH  17
#define UCONST_GUI_Styles_Slider_Button_UP_B_TOP  915
#define UCONST_GUI_Styles_Slider_Button_UP_B_LEFT  991
#define UCONST_GUI_Styles_Slider_Button_DOWN_W_HEIGHT  18
#define UCONST_GUI_Styles_Slider_Button_DOWN_W_WIDTH  17
#define UCONST_GUI_Styles_Slider_Button_DOWN_W_TOP  915
#define UCONST_GUI_Styles_Slider_Button_DOWN_W_LEFT  974
#define UCONST_GUI_Styles_Slider_Button_DOWN_P_HEIGHT  18
#define UCONST_GUI_Styles_Slider_Button_DOWN_P_WIDTH  17
#define UCONST_GUI_Styles_Slider_Button_DOWN_P_TOP  915
#define UCONST_GUI_Styles_Slider_Button_DOWN_P_LEFT  957
#define UCONST_GUI_Styles_Slider_Button_DOWN_D_HEIGHT  18
#define UCONST_GUI_Styles_Slider_Button_DOWN_D_WIDTH  17
#define UCONST_GUI_Styles_Slider_Button_DOWN_D_TOP  915
#define UCONST_GUI_Styles_Slider_Button_DOWN_D_LEFT  940
#define UCONST_GUI_Styles_Slider_Button_DOWN_B_HEIGHT  18
#define UCONST_GUI_Styles_Slider_Button_DOWN_B_WIDTH  17
#define UCONST_GUI_Styles_Slider_Button_DOWN_B_TOP  543
#define UCONST_GUI_Styles_Slider_Button_DOWN_B_LEFT  1007
#define UCONST_GUI_Styles_Skillstats_Combo_Opener_HEIGHT  18
#define UCONST_GUI_Styles_Skillstats_Combo_Opener_WIDTH  18
#define UCONST_GUI_Styles_Skillstats_Combo_Opener_TOP  915
#define UCONST_GUI_Styles_Skillstats_Combo_Opener_LEFT  922
#define UCONST_GUI_Styles_Skillstats_Combo_FollowUp_HEIGHT  18
#define UCONST_GUI_Styles_Skillstats_Combo_FollowUp_WIDTH  18
#define UCONST_GUI_Styles_Skillstats_Combo_FollowUp_TOP  915
#define UCONST_GUI_Styles_Skillstats_Combo_FollowUp_LEFT  904
#define UCONST_GUI_Styles_Skillstats_Combo_Finish_HEIGHT  18
#define UCONST_GUI_Styles_Skillstats_Combo_Finish_WIDTH  18
#define UCONST_GUI_Styles_Skillstats_Combo_Finish_TOP  915
#define UCONST_GUI_Styles_Skillstats_Combo_Finish_LEFT  886
#define UCONST_GUI_Styles_Skillstats_Combo_Empty_HEIGHT  18
#define UCONST_GUI_Styles_Skillstats_Combo_Empty_WIDTH  18
#define UCONST_GUI_Styles_Skillstats_Combo_Empty_TOP  915
#define UCONST_GUI_Styles_Skillstats_Combo_Empty_LEFT  868
#define UCONST_GUI_Styles_Minimap_Plus_W_HEIGHT  18
#define UCONST_GUI_Styles_Minimap_Plus_W_WIDTH  18
#define UCONST_GUI_Styles_Minimap_Plus_W_TOP  915
#define UCONST_GUI_Styles_Minimap_Plus_W_LEFT  850
#define UCONST_GUI_Styles_Minimap_Plus_P_HEIGHT  18
#define UCONST_GUI_Styles_Minimap_Plus_P_WIDTH  18
#define UCONST_GUI_Styles_Minimap_Plus_P_TOP  915
#define UCONST_GUI_Styles_Minimap_Plus_P_LEFT  832
#define UCONST_GUI_Styles_Minimap_Plus_D_HEIGHT  18
#define UCONST_GUI_Styles_Minimap_Plus_D_WIDTH  18
#define UCONST_GUI_Styles_Minimap_Plus_D_TOP  915
#define UCONST_GUI_Styles_Minimap_Plus_D_LEFT  814
#define UCONST_GUI_Styles_Minimap_Plus_B_HEIGHT  18
#define UCONST_GUI_Styles_Minimap_Plus_B_WIDTH  18
#define UCONST_GUI_Styles_Minimap_Plus_B_TOP  915
#define UCONST_GUI_Styles_Minimap_Plus_B_LEFT  796
#define UCONST_GUI_Styles_Minimap_Minus_W_HEIGHT  18
#define UCONST_GUI_Styles_Minimap_Minus_W_WIDTH  18
#define UCONST_GUI_Styles_Minimap_Minus_W_TOP  915
#define UCONST_GUI_Styles_Minimap_Minus_W_LEFT  778
#define UCONST_GUI_Styles_Minimap_Minus_P_HEIGHT  18
#define UCONST_GUI_Styles_Minimap_Minus_P_WIDTH  18
#define UCONST_GUI_Styles_Minimap_Minus_P_TOP  915
#define UCONST_GUI_Styles_Minimap_Minus_P_LEFT  760
#define UCONST_GUI_Styles_Minimap_Minus_D_HEIGHT  18
#define UCONST_GUI_Styles_Minimap_Minus_D_WIDTH  18
#define UCONST_GUI_Styles_Minimap_Minus_D_TOP  543
#define UCONST_GUI_Styles_Minimap_Minus_D_LEFT  989
#define UCONST_GUI_Styles_Minimap_Minus_B_HEIGHT  18
#define UCONST_GUI_Styles_Minimap_Minus_B_WIDTH  18
#define UCONST_GUI_Styles_Minimap_Minus_B_TOP  543
#define UCONST_GUI_Styles_Minimap_Minus_B_LEFT  971
#define UCONST_GUI_Styles_Combos_BuildUp_B__HEIGHT  19
#define UCONST_GUI_Styles_Combos_BuildUp_B__WIDTH  19
#define UCONST_GUI_Styles_Combos_BuildUp_B__TOP  915
#define UCONST_GUI_Styles_Combos_BuildUp_B__LEFT  741
#define UCONST_GUI_Styles_Checkbox_W_HEIGHT  19
#define UCONST_GUI_Styles_Checkbox_W_WIDTH  18
#define UCONST_GUI_Styles_Checkbox_W_TOP  915
#define UCONST_GUI_Styles_Checkbox_W_LEFT  723
#define UCONST_GUI_Styles_Checkbox_P_HEIGHT  19
#define UCONST_GUI_Styles_Checkbox_P_WIDTH  18
#define UCONST_GUI_Styles_Checkbox_P_TOP  915
#define UCONST_GUI_Styles_Checkbox_P_LEFT  705
#define UCONST_GUI_Styles_Checkbox_B_HEIGHT  19
#define UCONST_GUI_Styles_Checkbox_B_WIDTH  18
#define UCONST_GUI_Styles_Checkbox_B_TOP  915
#define UCONST_GUI_Styles_Checkbox_B_LEFT  687
#define UCONST_GUI_Styles_Characterstats_PEPbar_Strech_HEIGHT  19
#define UCONST_GUI_Styles_Characterstats_PEPbar_Strech_WIDTH  18
#define UCONST_GUI_Styles_Characterstats_PEPbar_Strech_TOP  915
#define UCONST_GUI_Styles_Characterstats_PEPbar_Strech_LEFT  669
#define UCONST_GUI_Styles_Characterstats_Famebar_Strech_HEIGHT  19
#define UCONST_GUI_Styles_Characterstats_Famebar_Strech_WIDTH  18
#define UCONST_GUI_Styles_Characterstats_Famebar_Strech_TOP  915
#define UCONST_GUI_Styles_Characterstats_Famebar_Strech_LEFT  651
#define UCONST_GUI_Styles_Characterstats_Famebar_shadow_HEIGHT  19
#define UCONST_GUI_Styles_Characterstats_Famebar_shadow_WIDTH  31
#define UCONST_GUI_Styles_Characterstats_Famebar_shadow_TOP  915
#define UCONST_GUI_Styles_Characterstats_Famebar_shadow_LEFT  620
#define UCONST_GUI_Styles_Characterstats_Famebar_HEIGHT  19
#define UCONST_GUI_Styles_Characterstats_Famebar_WIDTH  3
#define UCONST_GUI_Styles_Characterstats_Famebar_TOP  100
#define UCONST_GUI_Styles_Characterstats_Famebar_LEFT  1021
#define UCONST_GUI_Styles_Bodyslots_Button_Up_W_HEIGHT  19
#define UCONST_GUI_Styles_Bodyslots_Button_Up_W_WIDTH  24
#define UCONST_GUI_Styles_Bodyslots_Button_Up_W_TOP  915
#define UCONST_GUI_Styles_Bodyslots_Button_Up_W_LEFT  596
#define UCONST_GUI_Styles_Bodyslots_Button_Up_P_HEIGHT  19
#define UCONST_GUI_Styles_Bodyslots_Button_Up_P_WIDTH  24
#define UCONST_GUI_Styles_Bodyslots_Button_Up_P_TOP  915
#define UCONST_GUI_Styles_Bodyslots_Button_Up_P_LEFT  572
#define UCONST_GUI_Styles_Bodyslots_Button_Up_B_HEIGHT  19
#define UCONST_GUI_Styles_Bodyslots_Button_Up_B_WIDTH  24
#define UCONST_GUI_Styles_Bodyslots_Button_Up_B_TOP  915
#define UCONST_GUI_Styles_Bodyslots_Button_Up_B_LEFT  548
#define UCONST_GUI_Styles_Bodyslots_Button_Down_W_HEIGHT  19
#define UCONST_GUI_Styles_Bodyslots_Button_Down_W_WIDTH  24
#define UCONST_GUI_Styles_Bodyslots_Button_Down_W_TOP  915
#define UCONST_GUI_Styles_Bodyslots_Button_Down_W_LEFT  524
#define UCONST_GUI_Styles_Bodyslots_Button_Down_P_HEIGHT  19
#define UCONST_GUI_Styles_Bodyslots_Button_Down_P_WIDTH  24
#define UCONST_GUI_Styles_Bodyslots_Button_Down_P_TOP  915
#define UCONST_GUI_Styles_Bodyslots_Button_Down_P_LEFT  500
#define UCONST_GUI_Styles_Bodyslots_Button_Down_B_HEIGHT  19
#define UCONST_GUI_Styles_Bodyslots_Button_Down_B_WIDTH  24
#define UCONST_GUI_Styles_Bodyslots_Button_Down_B_TOP  915
#define UCONST_GUI_Styles_Bodyslots_Button_Down_B_LEFT  476
#define UCONST_GUI_Styles_LevelProgressMeter_HEIGHT  20
#define UCONST_GUI_Styles_LevelProgressMeter_WIDTH  379
#define UCONST_GUI_Styles_LevelProgressMeter_TOP  915
#define UCONST_GUI_Styles_LevelProgressMeter_LEFT  97
#define UCONST_GUI_Styles_Shop_Header_HEIGHT  21
#define UCONST_GUI_Styles_Shop_Header_WIDTH  21
#define UCONST_GUI_Styles_Shop_Header_TOP  915
#define UCONST_GUI_Styles_Shop_Header_LEFT  76
#define UCONST_GUI_Styles_Group_Avatar_Ornament_B_HEIGHT  21
#define UCONST_GUI_Styles_Group_Avatar_Ornament_B_WIDTH  24
#define UCONST_GUI_Styles_Group_Avatar_Ornament_B_TOP  915
#define UCONST_GUI_Styles_Group_Avatar_Ornament_B_LEFT  52
#define UCONST_GUI_Styles_CheckboxV_P_HEIGHT  21
#define UCONST_GUI_Styles_CheckboxV_P_WIDTH  20
#define UCONST_GUI_Styles_CheckboxV_P_TOP  915
#define UCONST_GUI_Styles_CheckboxV_P_LEFT  32
#define UCONST_GUI_Styles_CheckboxV_B_HEIGHT  21
#define UCONST_GUI_Styles_CheckboxV_B_WIDTH  20
#define UCONST_GUI_Styles_CheckboxV_B_TOP  886
#define UCONST_GUI_Styles_CheckboxV_B_LEFT  1000
#define UCONST_GUI_Styles_Bodyslots_Ornament_B_HEIGHT  21
#define UCONST_GUI_Styles_Bodyslots_Ornament_B_WIDTH  92
#define UCONST_GUI_Styles_Bodyslots_Ornament_B_TOP  466
#define UCONST_GUI_Styles_Bodyslots_Ornament_B_LEFT  928
#define UCONST_GUI_Styles_Skill_Label_B_HEIGHT  22
#define UCONST_GUI_Styles_Skill_Label_B_WIDTH  32
#define UCONST_GUI_Styles_Skill_Label_B_TOP  915
#define UCONST_GUI_Styles_Skill_Label_B_LEFT  0
#define UCONST_GUI_Styles_WindowHeader_Right_B_HEIGHT  23
#define UCONST_GUI_Styles_WindowHeader_Right_B_WIDTH  114
#define UCONST_GUI_Styles_WindowHeader_Right_B_TOP  886
#define UCONST_GUI_Styles_WindowHeader_Right_B_LEFT  886
#define UCONST_GUI_Styles_WindowHeader_Left_B_HEIGHT  23
#define UCONST_GUI_Styles_WindowHeader_Left_B_WIDTH  240
#define UCONST_GUI_Styles_WindowHeader_Left_B_TOP  886
#define UCONST_GUI_Styles_WindowHeader_Left_B_LEFT  646
#define UCONST_GUI_Styles_HUD_Header_Worldmap_B_HEIGHT  23
#define UCONST_GUI_Styles_HUD_Header_Worldmap_B_WIDTH  17
#define UCONST_GUI_Styles_HUD_Header_Worldmap_B_TOP  237
#define UCONST_GUI_Styles_HUD_Header_Worldmap_B_LEFT  1004
#define UCONST_GUI_Styles_HUD_Header_MainMenu_B_HEIGHT  23
#define UCONST_GUI_Styles_HUD_Header_MainMenu_B_WIDTH  17
#define UCONST_GUI_Styles_HUD_Header_MainMenu_B_TOP  237
#define UCONST_GUI_Styles_HUD_Header_MainMenu_B_LEFT  987
#define UCONST_GUI_Styles_HUD_Header_Conversation_B_HEIGHT  23
#define UCONST_GUI_Styles_HUD_Header_Conversation_B_WIDTH  17
#define UCONST_GUI_Styles_HUD_Header_Conversation_B_TOP  237
#define UCONST_GUI_Styles_HUD_Header_Conversation_B_LEFT  970
#define UCONST_GUI_Styles_HUD_Header_CharacterInfo_B_HEIGHT  23
#define UCONST_GUI_Styles_HUD_Header_CharacterInfo_B_WIDTH  17
#define UCONST_GUI_Styles_HUD_Header_CharacterInfo_B_TOP  237
#define UCONST_GUI_Styles_HUD_Header_CharacterInfo_B_LEFT  953
#define UCONST_GUI_Styles_Header_Worldmap_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Worldmap_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Worldmap_B_TOP  237
#define UCONST_GUI_Styles_Header_Worldmap_B_LEFT  936
#define UCONST_GUI_Styles_Header_Weapon_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Weapon_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Weapon_B_TOP  237
#define UCONST_GUI_Styles_Header_Weapon_B_LEFT  919
#define UCONST_GUI_Styles_Header_Travel_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Travel_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Travel_B_TOP  237
#define UCONST_GUI_Styles_Header_Travel_B_LEFT  902
#define UCONST_GUI_Styles_Header_Trade_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Trade_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Trade_B_TOP  237
#define UCONST_GUI_Styles_Header_Trade_B_LEFT  885
#define UCONST_GUI_Styles_Header_Skilldeck_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Skilldeck_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Skilldeck_B_TOP  237
#define UCONST_GUI_Styles_Header_Skilldeck_B_LEFT  868
#define UCONST_GUI_Styles_Header_Skillbook_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Skillbook_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Skillbook_B_TOP  237
#define UCONST_GUI_Styles_Header_Skillbook_B_LEFT  851
#define UCONST_GUI_Styles_Header_Sigil_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Sigil_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Sigil_B_TOP  237
#define UCONST_GUI_Styles_Header_Sigil_B_LEFT  834
#define UCONST_GUI_Styles_Header_Repair_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Repair_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Repair_B_TOP  237
#define UCONST_GUI_Styles_Header_Repair_B_LEFT  817
#define UCONST_GUI_Styles_Header_Questlog_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Questlog_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Questlog_B_TOP  237
#define UCONST_GUI_Styles_Header_Questlog_B_LEFT  800
#define UCONST_GUI_Styles_Header_Pet_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Pet_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Pet_B_TOP  237
#define UCONST_GUI_Styles_Header_Pet_B_LEFT  783
#define UCONST_GUI_Styles_Header_Paint_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Paint_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Paint_B_TOP  237
#define UCONST_GUI_Styles_Header_Paint_B_LEFT  766
#define UCONST_GUI_Styles_Header_Minigame_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Minigame_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Minigame_B_TOP  237
#define UCONST_GUI_Styles_Header_Minigame_B_LEFT  749
#define UCONST_GUI_Styles_Header_Menu_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Menu_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Menu_B_TOP  237
#define UCONST_GUI_Styles_Header_Menu_B_LEFT  732
#define UCONST_GUI_Styles_Header_MainMenu_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_MainMenu_B_WIDTH  17
#define UCONST_GUI_Styles_Header_MainMenu_B_TOP  237
#define UCONST_GUI_Styles_Header_MainMenu_B_LEFT  715
#define UCONST_GUI_Styles_Header_Mail_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Mail_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Mail_B_TOP  237
#define UCONST_GUI_Styles_Header_Mail_B_LEFT  698
#define UCONST_GUI_Styles_Header_Inventory_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Inventory_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Inventory_B_TOP  237
#define UCONST_GUI_Styles_Header_Inventory_B_LEFT  681
#define UCONST_GUI_Styles_Header_Guildlist_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Guildlist_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Guildlist_B_TOP  237
#define UCONST_GUI_Styles_Header_Guildlist_B_LEFT  664
#define UCONST_GUI_Styles_Header_Group_RoundRobin_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Group_RoundRobin_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Group_RoundRobin_B_TOP  237
#define UCONST_GUI_Styles_Header_Group_RoundRobin_B_LEFT  647
#define UCONST_GUI_Styles_Header_Group_Lootmaster_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Group_Lootmaster_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Group_Lootmaster_B_TOP  237
#define UCONST_GUI_Styles_Header_Group_Lootmaster_B_LEFT  630
#define UCONST_GUI_Styles_Header_Group_GroupLoot_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Group_GroupLoot_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Group_GroupLoot_B_TOP  237
#define UCONST_GUI_Styles_Header_Group_GroupLoot_B_LEFT  613
#define UCONST_GUI_Styles_Header_Group_FreeForAll_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Group_FreeForAll_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Group_FreeForAll_B_TOP  237
#define UCONST_GUI_Styles_Header_Group_FreeForAll_B_LEFT  596
#define UCONST_GUI_Styles_Header_FriendsList_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_FriendsList_B_WIDTH  17
#define UCONST_GUI_Styles_Header_FriendsList_B_TOP  237
#define UCONST_GUI_Styles_Header_FriendsList_B_LEFT  579
#define UCONST_GUI_Styles_Header_Forge_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Forge_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Forge_B_TOP  237
#define UCONST_GUI_Styles_Header_Forge_B_LEFT  562
#define UCONST_GUI_Styles_Header_Equipment_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Equipment_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Equipment_B_TOP  237
#define UCONST_GUI_Styles_Header_Equipment_B_LEFT  545
#define UCONST_GUI_Styles_Header_Death_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Death_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Death_B_TOP  237
#define UCONST_GUI_Styles_Header_Death_B_LEFT  528
#define UCONST_GUI_Styles_Header_Conversation_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Conversation_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Conversation_B_TOP  237
#define UCONST_GUI_Styles_Header_Conversation_B_LEFT  511
#define UCONST_GUI_Styles_Header_CharacterInfo_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_CharacterInfo_B_WIDTH  17
#define UCONST_GUI_Styles_Header_CharacterInfo_B_TOP  237
#define UCONST_GUI_Styles_Header_CharacterInfo_B_LEFT  494
#define UCONST_GUI_Styles_Header_BuySell_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_BuySell_B_WIDTH  17
#define UCONST_GUI_Styles_Header_BuySell_B_TOP  237
#define UCONST_GUI_Styles_Header_BuySell_B_LEFT  477
#define UCONST_GUI_Styles_Header_Avatar_PvP_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Avatar_PvP_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Avatar_PvP_B_TOP  237
#define UCONST_GUI_Styles_Header_Avatar_PvP_B_LEFT  460
#define UCONST_GUI_Styles_Header_Avatar_PvE_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Avatar_PvE_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Avatar_PvE_B_TOP  237
#define UCONST_GUI_Styles_Header_Avatar_PvE_B_LEFT  443
#define UCONST_GUI_Styles_Header_Avatar_Friendly_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Avatar_Friendly_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Avatar_Friendly_B_TOP  237
#define UCONST_GUI_Styles_Header_Avatar_Friendly_B_LEFT  426
#define UCONST_GUI_Styles_Header_Arena_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Arena_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Arena_B_TOP  237
#define UCONST_GUI_Styles_Header_Arena_B_LEFT  409
#define UCONST_GUI_Styles_Header_Archtype_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Archtype_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Archtype_B_TOP  237
#define UCONST_GUI_Styles_Header_Archtype_B_LEFT  392
#define UCONST_GUI_Styles_Header_Ancestraldream_B_HEIGHT  23
#define UCONST_GUI_Styles_Header_Ancestraldream_B_WIDTH  17
#define UCONST_GUI_Styles_Header_Ancestraldream_B_TOP  237
#define UCONST_GUI_Styles_Header_Ancestraldream_B_LEFT  375
#define UCONST_GUI_Styles_Characterstats_Numberbox_HEIGHT  23
#define UCONST_GUI_Styles_Characterstats_Numberbox_WIDTH  40
#define UCONST_GUI_Styles_Characterstats_Numberbox_TOP  237
#define UCONST_GUI_Styles_Characterstats_Numberbox_LEFT  335
#define UCONST_GUI_Styles_Avatar_Pep_Bar_B_HEIGHT  23
#define UCONST_GUI_Styles_Avatar_Pep_Bar_B_WIDTH  23
#define UCONST_GUI_Styles_Avatar_Pep_Bar_B_TOP  237
#define UCONST_GUI_Styles_Avatar_Pep_Bar_B_LEFT  312
#define UCONST_GUI_Styles_Avatar_Mixed_Duff_Dropbox_B_HEIGHT  23
#define UCONST_GUI_Styles_Avatar_Mixed_Duff_Dropbox_B_WIDTH  23
#define UCONST_GUI_Styles_Avatar_Mixed_Duff_Dropbox_B_TOP  237
#define UCONST_GUI_Styles_Avatar_Mixed_Duff_Dropbox_B_LEFT  289
#define UCONST_GUI_Styles_Avatar_Duff_Dropbox_B_HEIGHT  23
#define UCONST_GUI_Styles_Avatar_Duff_Dropbox_B_WIDTH  23
#define UCONST_GUI_Styles_Avatar_Duff_Dropbox_B_TOP  237
#define UCONST_GUI_Styles_Avatar_Duff_Dropbox_B_LEFT  266
#define UCONST_GUI_Styles_Avatar_Debuff_Dropbox_B_HEIGHT  23
#define UCONST_GUI_Styles_Avatar_Debuff_Dropbox_B_WIDTH  23
#define UCONST_GUI_Styles_Avatar_Debuff_Dropbox_B_TOP  213
#define UCONST_GUI_Styles_Avatar_Debuff_Dropbox_B_LEFT  985
#define UCONST_GUI_Styles_Avatar_Buff_Dropbox_B_HEIGHT  23
#define UCONST_GUI_Styles_Avatar_Buff_Dropbox_B_WIDTH  23
#define UCONST_GUI_Styles_Avatar_Buff_Dropbox_B_TOP  213
#define UCONST_GUI_Styles_Avatar_Buff_Dropbox_B_LEFT  962
#define UCONST_GUI_Styles_Slider_Handle_W_HEIGHT  24
#define UCONST_GUI_Styles_Slider_Handle_W_WIDTH  11
#define UCONST_GUI_Styles_Slider_Handle_W_TOP  213
#define UCONST_GUI_Styles_Slider_Handle_W_LEFT  951
#define UCONST_GUI_Styles_Slider_Handle_P_HEIGHT  24
#define UCONST_GUI_Styles_Slider_Handle_P_WIDTH  11
#define UCONST_GUI_Styles_Slider_Handle_P_TOP  213
#define UCONST_GUI_Styles_Slider_Handle_P_LEFT  940
#define UCONST_GUI_Styles_Slider_Handle_B_HEIGHT  24
#define UCONST_GUI_Styles_Slider_Handle_B_WIDTH  11
#define UCONST_GUI_Styles_Slider_Handle_B_TOP  0
#define UCONST_GUI_Styles_Slider_Handle_B_LEFT  1013
#define UCONST_GUI_Styles_NormalButton_W_HEIGHT  24
#define UCONST_GUI_Styles_NormalButton_W_WIDTH  107
#define UCONST_GUI_Styles_NormalButton_W_TOP  886
#define UCONST_GUI_Styles_NormalButton_W_LEFT  539
#define UCONST_GUI_Styles_NormalButton_P_HEIGHT  24
#define UCONST_GUI_Styles_NormalButton_P_WIDTH  107
#define UCONST_GUI_Styles_NormalButton_P_TOP  886
#define UCONST_GUI_Styles_NormalButton_P_LEFT  432
#define UCONST_GUI_Styles_NormalButton_B_HEIGHT  24
#define UCONST_GUI_Styles_NormalButton_B_WIDTH  107
#define UCONST_GUI_Styles_NormalButton_B_TOP  886
#define UCONST_GUI_Styles_NormalButton_B_LEFT  325
#define UCONST_GUI_Styles_Mail_Previous_W_HEIGHT  24
#define UCONST_GUI_Styles_Mail_Previous_W_WIDTH  24
#define UCONST_GUI_Styles_Mail_Previous_W_TOP  213
#define UCONST_GUI_Styles_Mail_Previous_W_LEFT  916
#define UCONST_GUI_Styles_Mail_Previous_P_HEIGHT  24
#define UCONST_GUI_Styles_Mail_Previous_P_WIDTH  24
#define UCONST_GUI_Styles_Mail_Previous_P_TOP  213
#define UCONST_GUI_Styles_Mail_Previous_P_LEFT  892
#define UCONST_GUI_Styles_Mail_Previous_B_HEIGHT  24
#define UCONST_GUI_Styles_Mail_Previous_B_WIDTH  24
#define UCONST_GUI_Styles_Mail_Previous_B_TOP  213
#define UCONST_GUI_Styles_Mail_Previous_B_LEFT  868
#define UCONST_GUI_Styles_Mail_Next_W_HEIGHT  24
#define UCONST_GUI_Styles_Mail_Next_W_WIDTH  24
#define UCONST_GUI_Styles_Mail_Next_W_TOP  213
#define UCONST_GUI_Styles_Mail_Next_W_LEFT  844
#define UCONST_GUI_Styles_Mail_Next_P_HEIGHT  24
#define UCONST_GUI_Styles_Mail_Next_P_WIDTH  24
#define UCONST_GUI_Styles_Mail_Next_P_TOP  213
#define UCONST_GUI_Styles_Mail_Next_P_LEFT  820
#define UCONST_GUI_Styles_Mail_Next_B_HEIGHT  24
#define UCONST_GUI_Styles_Mail_Next_B_WIDTH  24
#define UCONST_GUI_Styles_Mail_Next_B_TOP  213
#define UCONST_GUI_Styles_Mail_Next_B_LEFT  796
#define UCONST_GUI_Styles_Dropdown_Button_W_HEIGHT  24
#define UCONST_GUI_Styles_Dropdown_Button_W_WIDTH  24
#define UCONST_GUI_Styles_Dropdown_Button_W_TOP  213
#define UCONST_GUI_Styles_Dropdown_Button_W_LEFT  772
#define UCONST_GUI_Styles_Dropdown_Button_Up_W_HEIGHT  24
#define UCONST_GUI_Styles_Dropdown_Button_Up_W_WIDTH  24
#define UCONST_GUI_Styles_Dropdown_Button_Up_W_TOP  213
#define UCONST_GUI_Styles_Dropdown_Button_Up_W_LEFT  748
#define UCONST_GUI_Styles_Dropdown_Button_Up_P_HEIGHT  24
#define UCONST_GUI_Styles_Dropdown_Button_Up_P_WIDTH  24
#define UCONST_GUI_Styles_Dropdown_Button_Up_P_TOP  213
#define UCONST_GUI_Styles_Dropdown_Button_Up_P_LEFT  724
#define UCONST_GUI_Styles_Dropdown_Button_Up_B_HEIGHT  24
#define UCONST_GUI_Styles_Dropdown_Button_Up_B_WIDTH  24
#define UCONST_GUI_Styles_Dropdown_Button_Up_B_TOP  213
#define UCONST_GUI_Styles_Dropdown_Button_Up_B_LEFT  700
#define UCONST_GUI_Styles_Dropdown_Button_P_HEIGHT  24
#define UCONST_GUI_Styles_Dropdown_Button_P_WIDTH  24
#define UCONST_GUI_Styles_Dropdown_Button_P_TOP  213
#define UCONST_GUI_Styles_Dropdown_Button_P_LEFT  676
#define UCONST_GUI_Styles_Dropdown_Button_B_HEIGHT  24
#define UCONST_GUI_Styles_Dropdown_Button_B_WIDTH  24
#define UCONST_GUI_Styles_Dropdown_Button_B_TOP  213
#define UCONST_GUI_Styles_Dropdown_Button_B_LEFT  652
#define UCONST_GUI_Styles_WindowBorder_W_HEIGHT  25
#define UCONST_GUI_Styles_WindowBorder_W_WIDTH  25
#define UCONST_GUI_Styles_WindowBorder_W_TOP  886
#define UCONST_GUI_Styles_WindowBorder_W_LEFT  300
#define UCONST_GUI_Styles_WindowBorder_P_HEIGHT  25
#define UCONST_GUI_Styles_WindowBorder_P_WIDTH  25
#define UCONST_GUI_Styles_WindowBorder_P_TOP  886
#define UCONST_GUI_Styles_WindowBorder_P_LEFT  275
#define UCONST_GUI_Styles_WindowBorder_No_background_B_HEIGHT  25
#define UCONST_GUI_Styles_WindowBorder_No_background_B_WIDTH  25
#define UCONST_GUI_Styles_WindowBorder_No_background_B_TOP  886
#define UCONST_GUI_Styles_WindowBorder_No_background_B_LEFT  250
#define UCONST_GUI_Styles_WindowBorder_B_HEIGHT  25
#define UCONST_GUI_Styles_WindowBorder_B_WIDTH  25
#define UCONST_GUI_Styles_WindowBorder_B_TOP  886
#define UCONST_GUI_Styles_WindowBorder_B_LEFT  225
#define UCONST_GUI_Styles_Tablerow_Header_W_HEIGHT  25
#define UCONST_GUI_Styles_Tablerow_Header_W_WIDTH  25
#define UCONST_GUI_Styles_Tablerow_Header_W_TOP  886
#define UCONST_GUI_Styles_Tablerow_Header_W_LEFT  200
#define UCONST_GUI_Styles_Tablerow_Header_P_HEIGHT  25
#define UCONST_GUI_Styles_Tablerow_Header_P_WIDTH  25
#define UCONST_GUI_Styles_Tablerow_Header_P_TOP  886
#define UCONST_GUI_Styles_Tablerow_Header_P_LEFT  175
#define UCONST_GUI_Styles_Tablerow_Header_B_HEIGHT  25
#define UCONST_GUI_Styles_Tablerow_Header_B_WIDTH  25
#define UCONST_GUI_Styles_Tablerow_Header_B_TOP  886
#define UCONST_GUI_Styles_Tablerow_Header_B_LEFT  150
#define UCONST_GUI_Styles_TabControl_infrontRight_B_HEIGHT  25
#define UCONST_GUI_Styles_TabControl_infrontRight_B_WIDTH  32
#define UCONST_GUI_Styles_TabControl_infrontRight_B_TOP  886
#define UCONST_GUI_Styles_TabControl_infrontRight_B_LEFT  118
#define UCONST_GUI_Styles_TabControl_infrontLeft_B_HEIGHT  25
#define UCONST_GUI_Styles_TabControl_infrontLeft_B_WIDTH  32
#define UCONST_GUI_Styles_TabControl_infrontLeft_B_TOP  886
#define UCONST_GUI_Styles_TabControl_infrontLeft_B_LEFT  86
#define UCONST_GUI_Styles_TabControl_infront_B_HEIGHT  25
#define UCONST_GUI_Styles_TabControl_infront_B_WIDTH  32
#define UCONST_GUI_Styles_TabControl_infront_B_TOP  886
#define UCONST_GUI_Styles_TabControl_infront_B_LEFT  54
#define UCONST_GUI_Styles_TabControl_Background_B_HEIGHT  25
#define UCONST_GUI_Styles_TabControl_Background_B_WIDTH  32
#define UCONST_GUI_Styles_TabControl_Background_B_TOP  886
#define UCONST_GUI_Styles_TabControl_Background_B_LEFT  22
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_W_HEIGHT  25
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_W_WIDTH  19
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_W_TOP  854
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_W_LEFT  1004
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_P_HEIGHT  25
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_P_WIDTH  19
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_P_TOP  360
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_P_LEFT  1001
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_B_HEIGHT  25
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_B_WIDTH  19
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_B_TOP  360
#define UCONST_GUI_Styles_Chat_Tab_Small_Front_B_LEFT  982
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_W_HEIGHT  25
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_W_WIDTH  19
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_W_TOP  360
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_W_LEFT  963
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_P_HEIGHT  25
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_P_WIDTH  19
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_P_TOP  360
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_P_LEFT  944
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_B_HEIGHT  25
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_B_WIDTH  19
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_B_TOP  360
#define UCONST_GUI_Styles_Chat_Tab_Small_Back_B_LEFT  925
#define UCONST_GUI_Styles_Timer_Box_B_HEIGHT  26
#define UCONST_GUI_Styles_Timer_Box_B_WIDTH  52
#define UCONST_GUI_Styles_Timer_Box_B_TOP  360
#define UCONST_GUI_Styles_Timer_Box_B_LEFT  873
#define UCONST_GUI_Styles_WindowHeaderFrame_HEIGHT  27
#define UCONST_GUI_Styles_WindowHeaderFrame_WIDTH  82
#define UCONST_GUI_Styles_WindowHeaderFrame_TOP  360
#define UCONST_GUI_Styles_WindowHeaderFrame_LEFT  791
#define UCONST_GUI_Styles_WindowHeader_HEIGHT  27
#define UCONST_GUI_Styles_WindowHeader_WIDTH  82
#define UCONST_GUI_Styles_WindowHeader_TOP  360
#define UCONST_GUI_Styles_WindowHeader_LEFT  709
#define UCONST_GUI_Styles_LevelCapLock_HEIGHT  27
#define UCONST_GUI_Styles_LevelCapLock_WIDTH  22
#define UCONST_GUI_Styles_LevelCapLock_TOP  360
#define UCONST_GUI_Styles_LevelCapLock_LEFT  687
#define UCONST_GUI_Styles_Close_Button_W_HEIGHT  27
#define UCONST_GUI_Styles_Close_Button_W_WIDTH  23
#define UCONST_GUI_Styles_Close_Button_W_TOP  360
#define UCONST_GUI_Styles_Close_Button_W_LEFT  664
#define UCONST_GUI_Styles_Close_Button_P_HEIGHT  27
#define UCONST_GUI_Styles_Close_Button_P_WIDTH  23
#define UCONST_GUI_Styles_Close_Button_P_TOP  360
#define UCONST_GUI_Styles_Close_Button_P_LEFT  641
#define UCONST_GUI_Styles_Close_Button_B_HEIGHT  27
#define UCONST_GUI_Styles_Close_Button_B_WIDTH  23
#define UCONST_GUI_Styles_Close_Button_B_TOP  320
#define UCONST_GUI_Styles_Close_Button_B_LEFT  987
#define UCONST_GUI_Styles_BuffNoSkillSlot_HEIGHT  27
#define UCONST_GUI_Styles_BuffNoSkillSlot_WIDTH  28
#define UCONST_GUI_Styles_BuffNoSkillSlot_TOP  320
#define UCONST_GUI_Styles_BuffNoSkillSlot_LEFT  959
#define UCONST_GUI_Styles_Quarternails_HEIGHT  29
#define UCONST_GUI_Styles_Quarternails_WIDTH  22
#define UCONST_GUI_Styles_Quarternails_TOP  886
#define UCONST_GUI_Styles_Quarternails_LEFT  0
#define UCONST_GUI_Styles_Group_Headerbar_B_HEIGHT  29
#define UCONST_GUI_Styles_Group_Headerbar_B_WIDTH  157
#define UCONST_GUI_Styles_Group_Headerbar_B_TOP  854
#define UCONST_GUI_Styles_Group_Headerbar_B_LEFT  847
#define UCONST_GUI_Styles_Group_Avatar_Zero_Point_B_HEIGHT  29
#define UCONST_GUI_Styles_Group_Avatar_Zero_Point_B_WIDTH  5
#define UCONST_GUI_Styles_Group_Avatar_Zero_Point_B_TOP  0
#define UCONST_GUI_Styles_Group_Avatar_Zero_Point_B_LEFT  1008
#define UCONST_GUI_Styles_Currency_Quarternails_HEIGHT  29
#define UCONST_GUI_Styles_Currency_Quarternails_WIDTH  22
#define UCONST_GUI_Styles_Currency_Quarternails_TOP  854
#define UCONST_GUI_Styles_Currency_Quarternails_LEFT  825
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_W_HEIGHT  30
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_W_WIDTH  30
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_W_TOP  854
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_W_LEFT  795
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_P_HEIGHT  30
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_P_WIDTH  30
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_P_TOP  854
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_P_LEFT  765
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_B_HEIGHT  30
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_B_WIDTH  30
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_B_TOP  854
#define UCONST_GUI_Styles_Sigil_Dropbox_Skill_B_LEFT  735
#define UCONST_GUI_Styles_Dropdown_Border_B_HEIGHT  30
#define UCONST_GUI_Styles_Dropdown_Border_B_WIDTH  30
#define UCONST_GUI_Styles_Dropdown_Border_B_TOP  854
#define UCONST_GUI_Styles_Dropdown_Border_B_LEFT  705
#define UCONST_GUI_Styles_Sunplates_HEIGHT  31
#define UCONST_GUI_Styles_Sunplates_WIDTH  24
#define UCONST_GUI_Styles_Sunplates_TOP  854
#define UCONST_GUI_Styles_Sunplates_LEFT  681
#define UCONST_GUI_Styles_Slider_Background_D_HEIGHT  31
#define UCONST_GUI_Styles_Slider_Background_D_WIDTH  17
#define UCONST_GUI_Styles_Slider_Background_D_TOP  854
#define UCONST_GUI_Styles_Slider_Background_D_LEFT  664
#define UCONST_GUI_Styles_Slider_Background_B_HEIGHT  31
#define UCONST_GUI_Styles_Slider_Background_B_WIDTH  17
#define UCONST_GUI_Styles_Slider_Background_B_TOP  141
#define UCONST_GUI_Styles_Slider_Background_B_LEFT  1007
#define UCONST_GUI_Styles_Loderings_HEIGHT  31
#define UCONST_GUI_Styles_Loderings_WIDTH  24
#define UCONST_GUI_Styles_Loderings_TOP  787
#define UCONST_GUI_Styles_Loderings_LEFT  994
#define UCONST_GUI_Styles_Currency_Sunplates_HEIGHT  31
#define UCONST_GUI_Styles_Currency_Sunplates_WIDTH  24
#define UCONST_GUI_Styles_Currency_Sunplates_TOP  433
#define UCONST_GUI_Styles_Currency_Sunplates_LEFT  996
#define UCONST_GUI_Styles_Currency_Loderings_HEIGHT  31
#define UCONST_GUI_Styles_Currency_Loderings_WIDTH  24
#define UCONST_GUI_Styles_Currency_Loderings_TOP  141
#define UCONST_GUI_Styles_Currency_Loderings_LEFT  983
#define UCONST_GUI_Styles_Chatbar_background_HEIGHT  31
#define UCONST_GUI_Styles_Chatbar_background_WIDTH  294
#define UCONST_GUI_Styles_Chatbar_background_TOP  854
#define UCONST_GUI_Styles_Chatbar_background_LEFT  370
#define UCONST_GUI_Styles_Textfield_W_HEIGHT  32
#define UCONST_GUI_Styles_Textfield_W_WIDTH  32
#define UCONST_GUI_Styles_Textfield_W_TOP  854
#define UCONST_GUI_Styles_Textfield_W_LEFT  338
#define UCONST_GUI_Styles_Textfield_P_HEIGHT  32
#define UCONST_GUI_Styles_Textfield_P_WIDTH  32
#define UCONST_GUI_Styles_Textfield_P_TOP  854
#define UCONST_GUI_Styles_Textfield_P_LEFT  306
#define UCONST_GUI_Styles_Textfield_B_HEIGHT  32
#define UCONST_GUI_Styles_Textfield_B_WIDTH  32
#define UCONST_GUI_Styles_Textfield_B_TOP  854
#define UCONST_GUI_Styles_Textfield_B_LEFT  274
#define UCONST_GUI_Styles_RolloverWhiteBar_HEIGHT  32
#define UCONST_GUI_Styles_RolloverWhiteBar_WIDTH  274
#define UCONST_GUI_Styles_RolloverWhiteBar_TOP  854
#define UCONST_GUI_Styles_RolloverWhiteBar_LEFT  0
#define UCONST_GUI_Styles_Menu_Hightligt_HEIGHT  32
#define UCONST_GUI_Styles_Menu_Hightligt_WIDTH  24
#define UCONST_GUI_Styles_Menu_Hightligt_TOP  401
#define UCONST_GUI_Styles_Menu_Hightligt_LEFT  996
#define UCONST_GUI_Styles_Menu_Hightlight_HEIGHT  32
#define UCONST_GUI_Styles_Menu_Hightlight_WIDTH  24
#define UCONST_GUI_Styles_Menu_Hightlight_TOP  54
#define UCONST_GUI_Styles_Menu_Hightlight_LEFT  1000
#define UCONST_GUI_Styles_Loadingscreenbackground01_HEIGHT  32
#define UCONST_GUI_Styles_Loadingscreenbackground01_WIDTH  282
#define UCONST_GUI_Styles_Loadingscreenbackground01_TOP  822
#define UCONST_GUI_Styles_Loadingscreenbackground01_LEFT  736
#define UCONST_GUI_Styles_Equipment_Thigh_Right_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Thigh_Right_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Thigh_Right_TOP  822
#define UCONST_GUI_Styles_Equipment_Thigh_Right_LEFT  704
#define UCONST_GUI_Styles_Equipment_Thigh_Left_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Thigh_Left_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Thigh_Left_TOP  822
#define UCONST_GUI_Styles_Equipment_Thigh_Left_LEFT  672
#define UCONST_GUI_Styles_Equipment_Sword_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Sword_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Sword_TOP  822
#define UCONST_GUI_Styles_Equipment_Sword_LEFT  640
#define UCONST_GUI_Styles_Equipment_Shoulder_Right_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Shoulder_Right_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Shoulder_Right_TOP  822
#define UCONST_GUI_Styles_Equipment_Shoulder_Right_LEFT  608
#define UCONST_GUI_Styles_Equipment_Shoulder_Left_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Shoulder_Left_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Shoulder_Left_TOP  822
#define UCONST_GUI_Styles_Equipment_Shoulder_Left_LEFT  576
#define UCONST_GUI_Styles_Equipment_Shoe_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Shoe_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Shoe_TOP  822
#define UCONST_GUI_Styles_Equipment_Shoe_LEFT  544
#define UCONST_GUI_Styles_Equipment_Shin_Right_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Shin_Right_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Shin_Right_TOP  822
#define UCONST_GUI_Styles_Equipment_Shin_Right_LEFT  512
#define UCONST_GUI_Styles_Equipment_Shin_Left_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Shin_Left_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Shin_Left_TOP  822
#define UCONST_GUI_Styles_Equipment_Shin_Left_LEFT  480
#define UCONST_GUI_Styles_Equipment_Shield_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Shield_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Shield_TOP  822
#define UCONST_GUI_Styles_Equipment_Shield_LEFT  448
#define UCONST_GUI_Styles_Equipment_Ring_Right_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Ring_Right_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Ring_Right_TOP  822
#define UCONST_GUI_Styles_Equipment_Ring_Right_LEFT  416
#define UCONST_GUI_Styles_Equipment_Ring_Left_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Ring_Left_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Ring_Left_TOP  822
#define UCONST_GUI_Styles_Equipment_Ring_Left_LEFT  384
#define UCONST_GUI_Styles_Equipment_Pants_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Pants_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Pants_TOP  822
#define UCONST_GUI_Styles_Equipment_Pants_LEFT  352
#define UCONST_GUI_Styles_Equipment_Necklace_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Necklace_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Necklace_TOP  822
#define UCONST_GUI_Styles_Equipment_Necklace_LEFT  320
#define UCONST_GUI_Styles_Equipment_Headgear_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Headgear_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Headgear_TOP  822
#define UCONST_GUI_Styles_Equipment_Headgear_LEFT  288
#define UCONST_GUI_Styles_Equipment_Glove_Right_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Glove_Right_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Glove_Right_TOP  822
#define UCONST_GUI_Styles_Equipment_Glove_Right_LEFT  256
#define UCONST_GUI_Styles_Equipment_Glove_Left_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Glove_Left_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Glove_Left_TOP  822
#define UCONST_GUI_Styles_Equipment_Glove_Left_LEFT  224
#define UCONST_GUI_Styles_Equipment_Gauntlet_Right_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Gauntlet_Right_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Gauntlet_Right_TOP  822
#define UCONST_GUI_Styles_Equipment_Gauntlet_Right_LEFT  192
#define UCONST_GUI_Styles_Equipment_Gauntlet_Left_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Gauntlet_Left_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Gauntlet_Left_TOP  822
#define UCONST_GUI_Styles_Equipment_Gauntlet_Left_LEFT  160
#define UCONST_GUI_Styles_Equipment_ChestClothing_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_ChestClothing_WIDTH  32
#define UCONST_GUI_Styles_Equipment_ChestClothing_TOP  822
#define UCONST_GUI_Styles_Equipment_ChestClothing_LEFT  128
#define UCONST_GUI_Styles_Equipment_ChestArmour_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_ChestArmour_WIDTH  32
#define UCONST_GUI_Styles_Equipment_ChestArmour_TOP  822
#define UCONST_GUI_Styles_Equipment_ChestArmour_LEFT  96
#define UCONST_GUI_Styles_Equipment_Bow_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Bow_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Bow_TOP  822
#define UCONST_GUI_Styles_Equipment_Bow_LEFT  64
#define UCONST_GUI_Styles_Equipment_Belt_HEIGHT  32
#define UCONST_GUI_Styles_Equipment_Belt_WIDTH  32
#define UCONST_GUI_Styles_Equipment_Belt_TOP  822
#define UCONST_GUI_Styles_Equipment_Belt_LEFT  32
#define UCONST_GUI_Styles_Avatar_Selected_Fame_Bar_B_HEIGHT  32
#define UCONST_GUI_Styles_Avatar_Selected_Fame_Bar_B_WIDTH  32
#define UCONST_GUI_Styles_Avatar_Selected_Fame_Bar_B_TOP  822
#define UCONST_GUI_Styles_Avatar_Selected_Fame_Bar_B_LEFT  0
#define UCONST_GUI_Styles_Avatar_Fame_Bar_B_HEIGHT  32
#define UCONST_GUI_Styles_Avatar_Fame_Bar_B_WIDTH  32
#define UCONST_GUI_Styles_Avatar_Fame_Bar_B_TOP  787
#define UCONST_GUI_Styles_Avatar_Fame_Bar_B_LEFT  962
#define UCONST_GUI_Styles_Combatbar_InCombat_B_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_InCombat_B_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_InCombat_B_TOP  787
#define UCONST_GUI_Styles_Combatbar_InCombat_B_LEFT  922
#define UCONST_GUI_Styles_Combatbar_incombat02_B_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_incombat02_B_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_incombat02_B_TOP  787
#define UCONST_GUI_Styles_Combatbar_incombat02_B_LEFT  882
#define UCONST_GUI_Styles_Combatbar_Holster_W_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_Holster_W_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_Holster_W_TOP  787
#define UCONST_GUI_Styles_Combatbar_Holster_W_LEFT  842
#define UCONST_GUI_Styles_Combatbar_Holster_P_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_Holster_P_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_Holster_P_TOP  787
#define UCONST_GUI_Styles_Combatbar_Holster_P_LEFT  802
#define UCONST_GUI_Styles_Combatbar_Holster_D_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_Holster_D_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_Holster_D_TOP  787
#define UCONST_GUI_Styles_Combatbar_Holster_D_LEFT  762
#define UCONST_GUI_Styles_Combatbar_Holster_B_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_Holster_B_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_Holster_B_TOP  787
#define UCONST_GUI_Styles_Combatbar_Holster_B_LEFT  722
#define UCONST_GUI_Styles_Combatbar_Draw_W_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_Draw_W_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_Draw_W_TOP  787
#define UCONST_GUI_Styles_Combatbar_Draw_W_LEFT  682
#define UCONST_GUI_Styles_Combatbar_Draw_P_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_Draw_P_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_Draw_P_TOP  787
#define UCONST_GUI_Styles_Combatbar_Draw_P_LEFT  642
#define UCONST_GUI_Styles_Combatbar_Draw_D_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_Draw_D_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_Draw_D_TOP  787
#define UCONST_GUI_Styles_Combatbar_Draw_D_LEFT  602
#define UCONST_GUI_Styles_Combatbar_Draw_B_HEIGHT  33
#define UCONST_GUI_Styles_Combatbar_Draw_B_WIDTH  40
#define UCONST_GUI_Styles_Combatbar_Draw_B_TOP  787
#define UCONST_GUI_Styles_Combatbar_Draw_B_LEFT  562
#define UCONST_GUI_Styles_Skillstats_Mind_HEIGHT  34
#define UCONST_GUI_Styles_Skillstats_Mind_WIDTH  34
#define UCONST_GUI_Styles_Skillstats_Mind_TOP  787
#define UCONST_GUI_Styles_Skillstats_Mind_LEFT  528
#define UCONST_GUI_Styles_Skillstats_Focus_HEIGHT  34
#define UCONST_GUI_Styles_Skillstats_Focus_WIDTH  34
#define UCONST_GUI_Styles_Skillstats_Focus_TOP  787
#define UCONST_GUI_Styles_Skillstats_Focus_LEFT  494
#define UCONST_GUI_Styles_Skillstats_Empty_HEIGHT  34
#define UCONST_GUI_Styles_Skillstats_Empty_WIDTH  34
#define UCONST_GUI_Styles_Skillstats_Empty_TOP  787
#define UCONST_GUI_Styles_Skillstats_Empty_LEFT  460
#define UCONST_GUI_Styles_Skillstats_Cooldown_HEIGHT  34
#define UCONST_GUI_Styles_Skillstats_Cooldown_WIDTH  34
#define UCONST_GUI_Styles_Skillstats_Cooldown_TOP  787
#define UCONST_GUI_Styles_Skillstats_Cooldown_LEFT  426
#define UCONST_GUI_Styles_Skillstats_Body_HEIGHT  34
#define UCONST_GUI_Styles_Skillstats_Body_WIDTH  34
#define UCONST_GUI_Styles_Skillstats_Body_TOP  787
#define UCONST_GUI_Styles_Skillstats_Body_LEFT  392
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_W_HEIGHT  34
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_W_WIDTH  36
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_W_TOP  787
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_W_LEFT  356
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_P_HEIGHT  34
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_P_WIDTH  36
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_P_TOP  787
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_P_LEFT  320
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_D_HEIGHT  34
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_D_WIDTH  36
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_D_TOP  787
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_D_LEFT  284
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_B_HEIGHT  34
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_B_WIDTH  36
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_B_TOP  787
#define UCONST_GUI_Styles_Sigil_Dropbox_Weapon_B_LEFT  248
#define UCONST_GUI_Styles_Characterstats_Spirit_HEIGHT  34
#define UCONST_GUI_Styles_Characterstats_Spirit_WIDTH  34
#define UCONST_GUI_Styles_Characterstats_Spirit_TOP  787
#define UCONST_GUI_Styles_Characterstats_Spirit_LEFT  214
#define UCONST_GUI_Styles_Characterstats_Soul_HEIGHT  34
#define UCONST_GUI_Styles_Characterstats_Soul_WIDTH  34
#define UCONST_GUI_Styles_Characterstats_Soul_TOP  787
#define UCONST_GUI_Styles_Characterstats_Soul_LEFT  180
#define UCONST_GUI_Styles_Characterstats_Rune_HEIGHT  34
#define UCONST_GUI_Styles_Characterstats_Rune_WIDTH  34
#define UCONST_GUI_Styles_Characterstats_Rune_TOP  787
#define UCONST_GUI_Styles_Characterstats_Rune_LEFT  146
#define UCONST_GUI_Styles_Characterstats_Ranged_HEIGHT  34
#define UCONST_GUI_Styles_Characterstats_Ranged_WIDTH  34
#define UCONST_GUI_Styles_Characterstats_Ranged_TOP  787
#define UCONST_GUI_Styles_Characterstats_Ranged_LEFT  112
#define UCONST_GUI_Styles_Characterstats_Melee_HEIGHT  34
#define UCONST_GUI_Styles_Characterstats_Melee_WIDTH  34
#define UCONST_GUI_Styles_Characterstats_Melee_TOP  747
#define UCONST_GUI_Styles_Characterstats_Melee_LEFT  987
#define UCONST_GUI_Styles_Characterstats_Magic_HEIGHT  34
#define UCONST_GUI_Styles_Characterstats_Magic_WIDTH  34
#define UCONST_GUI_Styles_Characterstats_Magic_TOP  747
#define UCONST_GUI_Styles_Characterstats_Magic_LEFT  953
#define UCONST_GUI_Styles_Combatbar_ornament_B_HEIGHT  35
#define UCONST_GUI_Styles_Combatbar_ornament_B_WIDTH  112
#define UCONST_GUI_Styles_Combatbar_ornament_B_TOP  787
#define UCONST_GUI_Styles_Combatbar_ornament_B_LEFT  0
#define UCONST_GUI_Styles_Chatbar_outline_HEIGHT  35
#define UCONST_GUI_Styles_Chatbar_outline_WIDTH  298
#define UCONST_GUI_Styles_Chatbar_outline_TOP  747
#define UCONST_GUI_Styles_Chatbar_outline_LEFT  655
#define UCONST_GUI_Styles_Night_B_HEIGHT  36
#define UCONST_GUI_Styles_Night_B_WIDTH  36
#define UCONST_GUI_Styles_Night_B_TOP  747
#define UCONST_GUI_Styles_Night_B_LEFT  619
#define UCONST_GUI_Styles_MidDay_B_HEIGHT  36
#define UCONST_GUI_Styles_MidDay_B_WIDTH  36
#define UCONST_GUI_Styles_MidDay_B_TOP  747
#define UCONST_GUI_Styles_MidDay_B_LEFT  583
#define UCONST_GUI_Styles_Dusk_B_HEIGHT  36
#define UCONST_GUI_Styles_Dusk_B_WIDTH  36
#define UCONST_GUI_Styles_Dusk_B_TOP  747
#define UCONST_GUI_Styles_Dusk_B_LEFT  547
#define UCONST_GUI_Styles_Dawn_B_HEIGHT  36
#define UCONST_GUI_Styles_Dawn_B_WIDTH  36
#define UCONST_GUI_Styles_Dawn_B_TOP  747
#define UCONST_GUI_Styles_Dawn_B_LEFT  511
#define UCONST_GUI_Styles_Avatar_Zero_Point_B_HEIGHT  37
#define UCONST_GUI_Styles_Avatar_Zero_Point_B_WIDTH  5
#define UCONST_GUI_Styles_Avatar_Zero_Point_B_TOP  0
#define UCONST_GUI_Styles_Avatar_Zero_Point_B_LEFT  1003
#define UCONST_GUI_Styles_Menu_optionbuttonHL_B_HEIGHT  39
#define UCONST_GUI_Styles_Menu_optionbuttonHL_B_WIDTH  31
#define UCONST_GUI_Styles_Menu_optionbuttonHL_B_TOP  747
#define UCONST_GUI_Styles_Menu_optionbuttonHL_B_LEFT  480
#define UCONST_GUI_Styles_Menu_Worldmap_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Worldmap_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_Worldmap_W_TOP  747
#define UCONST_GUI_Styles_Menu_Worldmap_W_LEFT  448
#define UCONST_GUI_Styles_Menu_Worldmap_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Worldmap_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_Worldmap_P_TOP  747
#define UCONST_GUI_Styles_Menu_Worldmap_P_LEFT  416
#define UCONST_GUI_Styles_Menu_Worldmap_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Worldmap_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_Worldmap_D_TOP  747
#define UCONST_GUI_Styles_Menu_Worldmap_D_LEFT  384
#define UCONST_GUI_Styles_Menu_Worldmap_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Worldmap_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_Worldmap_B_TOP  747
#define UCONST_GUI_Styles_Menu_Worldmap_B_LEFT  352
#define UCONST_GUI_Styles_Menu_Skilldeck_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Skilldeck_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_Skilldeck_W_TOP  747
#define UCONST_GUI_Styles_Menu_Skilldeck_W_LEFT  320
#define UCONST_GUI_Styles_Menu_Skilldeck_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Skilldeck_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_Skilldeck_P_TOP  747
#define UCONST_GUI_Styles_Menu_Skilldeck_P_LEFT  288
#define UCONST_GUI_Styles_Menu_Skilldeck_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Skilldeck_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_Skilldeck_D_TOP  747
#define UCONST_GUI_Styles_Menu_Skilldeck_D_LEFT  256
#define UCONST_GUI_Styles_Menu_Skilldeck_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Skilldeck_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_Skilldeck_B_TOP  747
#define UCONST_GUI_Styles_Menu_Skilldeck_B_LEFT  224
#define UCONST_GUI_Styles_Menu_Skillbook_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Skillbook_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_Skillbook_W_TOP  747
#define UCONST_GUI_Styles_Menu_Skillbook_W_LEFT  192
#define UCONST_GUI_Styles_Menu_Skillbook_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Skillbook_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_Skillbook_P_TOP  747
#define UCONST_GUI_Styles_Menu_Skillbook_P_LEFT  160
#define UCONST_GUI_Styles_Menu_Skillbook_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Skillbook_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_Skillbook_D_TOP  747
#define UCONST_GUI_Styles_Menu_Skillbook_D_LEFT  128
#define UCONST_GUI_Styles_Menu_Skillbook_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Skillbook_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_Skillbook_B_TOP  747
#define UCONST_GUI_Styles_Menu_Skillbook_B_LEFT  96
#define UCONST_GUI_Styles_Menu_Questlog_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Questlog_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_Questlog_W_TOP  747
#define UCONST_GUI_Styles_Menu_Questlog_W_LEFT  64
#define UCONST_GUI_Styles_Menu_Questlog_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Questlog_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_Questlog_P_TOP  747
#define UCONST_GUI_Styles_Menu_Questlog_P_LEFT  32
#define UCONST_GUI_Styles_Menu_Questlog_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Questlog_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_Questlog_D_TOP  747
#define UCONST_GUI_Styles_Menu_Questlog_D_LEFT  0
#define UCONST_GUI_Styles_Menu_Questlog_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Questlog_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_Questlog_B_TOP  702
#define UCONST_GUI_Styles_Menu_Questlog_B_LEFT  986
#define UCONST_GUI_Styles_Menu_MainMenu_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_MainMenu_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_MainMenu_W_TOP  702
#define UCONST_GUI_Styles_Menu_MainMenu_W_LEFT  954
#define UCONST_GUI_Styles_Menu_MainMenu_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_MainMenu_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_MainMenu_P_TOP  702
#define UCONST_GUI_Styles_Menu_MainMenu_P_LEFT  922
#define UCONST_GUI_Styles_Menu_MainMenu_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_MainMenu_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_MainMenu_D_TOP  702
#define UCONST_GUI_Styles_Menu_MainMenu_D_LEFT  890
#define UCONST_GUI_Styles_Menu_MainMenu_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_MainMenu_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_MainMenu_B_TOP  702
#define UCONST_GUI_Styles_Menu_MainMenu_B_LEFT  858
#define UCONST_GUI_Styles_Menu_Level_Highlight_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Level_Highlight_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_Level_Highlight_B_TOP  702
#define UCONST_GUI_Styles_Menu_Level_Highlight_B_LEFT  826
#define UCONST_GUI_Styles_Menu_Inventory_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Inventory_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_Inventory_W_TOP  702
#define UCONST_GUI_Styles_Menu_Inventory_W_LEFT  794
#define UCONST_GUI_Styles_Menu_Inventory_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Inventory_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_Inventory_P_TOP  702
#define UCONST_GUI_Styles_Menu_Inventory_P_LEFT  762
#define UCONST_GUI_Styles_Menu_Inventory_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Inventory_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_Inventory_D_TOP  702
#define UCONST_GUI_Styles_Menu_Inventory_D_LEFT  730
#define UCONST_GUI_Styles_Menu_Inventory_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Inventory_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_Inventory_B_TOP  702
#define UCONST_GUI_Styles_Menu_Inventory_B_LEFT  698
#define UCONST_GUI_Styles_Menu_Guildlist_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Guildlist_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_Guildlist_W_TOP  702
#define UCONST_GUI_Styles_Menu_Guildlist_W_LEFT  666
#define UCONST_GUI_Styles_Menu_Guildlist_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Guildlist_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_Guildlist_P_TOP  702
#define UCONST_GUI_Styles_Menu_Guildlist_P_LEFT  634
#define UCONST_GUI_Styles_Menu_Guildlist_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Guildlist_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_Guildlist_D_TOP  702
#define UCONST_GUI_Styles_Menu_Guildlist_D_LEFT  602
#define UCONST_GUI_Styles_Menu_Guildlist_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Guildlist_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_Guildlist_B_TOP  702
#define UCONST_GUI_Styles_Menu_Guildlist_B_LEFT  570
#define UCONST_GUI_Styles_Menu_FriendsList_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_FriendsList_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_FriendsList_W_TOP  702
#define UCONST_GUI_Styles_Menu_FriendsList_W_LEFT  538
#define UCONST_GUI_Styles_Menu_FriendsList_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_FriendsList_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_FriendsList_P_TOP  702
#define UCONST_GUI_Styles_Menu_FriendsList_P_LEFT  506
#define UCONST_GUI_Styles_Menu_FriendsList_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_FriendsList_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_FriendsList_D_TOP  702
#define UCONST_GUI_Styles_Menu_FriendsList_D_LEFT  474
#define UCONST_GUI_Styles_Menu_FriendsList_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_FriendsList_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_FriendsList_B_TOP  702
#define UCONST_GUI_Styles_Menu_FriendsList_B_LEFT  442
#define UCONST_GUI_Styles_Menu_Equipment_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Equipment_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_Equipment_W_TOP  702
#define UCONST_GUI_Styles_Menu_Equipment_W_LEFT  410
#define UCONST_GUI_Styles_Menu_Equipment_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Equipment_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_Equipment_P_TOP  702
#define UCONST_GUI_Styles_Menu_Equipment_P_LEFT  378
#define UCONST_GUI_Styles_Menu_Equipment_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Equipment_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_Equipment_D_TOP  648
#define UCONST_GUI_Styles_Menu_Equipment_D_LEFT  980
#define UCONST_GUI_Styles_Menu_Equipment_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_Equipment_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_Equipment_B_TOP  648
#define UCONST_GUI_Styles_Menu_Equipment_B_LEFT  948
#define UCONST_GUI_Styles_Menu_CharacterInfo_W_HEIGHT  40
#define UCONST_GUI_Styles_Menu_CharacterInfo_W_WIDTH  32
#define UCONST_GUI_Styles_Menu_CharacterInfo_W_TOP  583
#define UCONST_GUI_Styles_Menu_CharacterInfo_W_LEFT  977
#define UCONST_GUI_Styles_Menu_CharacterInfo_P_HEIGHT  40
#define UCONST_GUI_Styles_Menu_CharacterInfo_P_WIDTH  32
#define UCONST_GUI_Styles_Menu_CharacterInfo_P_TOP  172
#define UCONST_GUI_Styles_Menu_CharacterInfo_P_LEFT  988
#define UCONST_GUI_Styles_Menu_CharacterInfo_D_HEIGHT  40
#define UCONST_GUI_Styles_Menu_CharacterInfo_D_WIDTH  32
#define UCONST_GUI_Styles_Menu_CharacterInfo_D_TOP  172
#define UCONST_GUI_Styles_Menu_CharacterInfo_D_LEFT  956
#define UCONST_GUI_Styles_Menu_CharacterInfo_B_HEIGHT  40
#define UCONST_GUI_Styles_Menu_CharacterInfo_B_WIDTH  32
#define UCONST_GUI_Styles_Menu_CharacterInfo_B_TOP  172
#define UCONST_GUI_Styles_Menu_CharacterInfo_B_LEFT  924
#define UCONST_GUI_Styles_Mainmenu_P_HEIGHT  40
#define UCONST_GUI_Styles_Mainmenu_P_WIDTH  32
#define UCONST_GUI_Styles_Mainmenu_P_TOP  172
#define UCONST_GUI_Styles_Mainmenu_P_LEFT  892
#define UCONST_GUI_Styles_Dropbox_W_HEIGHT  40
#define UCONST_GUI_Styles_Dropbox_W_WIDTH  40
#define UCONST_GUI_Styles_Dropbox_W_TOP  172
#define UCONST_GUI_Styles_Dropbox_W_LEFT  852
#define UCONST_GUI_Styles_Dropbox_P_HEIGHT  40
#define UCONST_GUI_Styles_Dropbox_P_WIDTH  40
#define UCONST_GUI_Styles_Dropbox_P_TOP  172
#define UCONST_GUI_Styles_Dropbox_P_LEFT  812
#define UCONST_GUI_Styles_Dropbox_B_HEIGHT  40
#define UCONST_GUI_Styles_Dropbox_B_WIDTH  40
#define UCONST_GUI_Styles_Dropbox_B_TOP  172
#define UCONST_GUI_Styles_Dropbox_B_LEFT  772
#define UCONST_GUI_Styles_Minimap_Mail_Icon_Only_HEIGHT  41
#define UCONST_GUI_Styles_Minimap_Mail_Icon_Only_WIDTH  38
#define UCONST_GUI_Styles_Minimap_Mail_Icon_Only_TOP  100
#define UCONST_GUI_Styles_Minimap_Mail_Icon_Only_LEFT  983
#define UCONST_GUI_Styles_Skill_Dropbox_W_HEIGHT  42
#define UCONST_GUI_Styles_Skill_Dropbox_W_WIDTH  42
#define UCONST_GUI_Styles_Skill_Dropbox_W_TOP  583
#define UCONST_GUI_Styles_Skill_Dropbox_W_LEFT  935
#define UCONST_GUI_Styles_Skill_Dropbox_P_HEIGHT  42
#define UCONST_GUI_Styles_Skill_Dropbox_P_WIDTH  42
#define UCONST_GUI_Styles_Skill_Dropbox_P_TOP  583
#define UCONST_GUI_Styles_Skill_Dropbox_P_LEFT  893
#define UCONST_GUI_Styles_Skill_Dropbox_B_HEIGHT  42
#define UCONST_GUI_Styles_Skill_Dropbox_B_WIDTH  42
#define UCONST_GUI_Styles_Skill_Dropbox_B_TOP  501
#define UCONST_GUI_Styles_Skill_Dropbox_B_LEFT  971
#define UCONST_GUI_Styles_Bodyslots_B_HEIGHT  44
#define UCONST_GUI_Styles_Bodyslots_B_WIDTH  237
#define UCONST_GUI_Styles_Bodyslots_B_TOP  648
#define UCONST_GUI_Styles_Bodyslots_B_LEFT  711
#define UCONST_GUI_Styles_Mainmenu_B_HEIGHT  45
#define UCONST_GUI_Styles_Mainmenu_B_WIDTH  378
#define UCONST_GUI_Styles_Mainmenu_B_TOP  702
#define UCONST_GUI_Styles_Mainmenu_B_LEFT  0
#define UCONST_GUI_Styles_Ornament_Top_HEIGHT  48
#define UCONST_GUI_Styles_Ornament_Top_WIDTH  182
#define UCONST_GUI_Styles_Ornament_Top_TOP  648
#define UCONST_GUI_Styles_Ornament_Top_LEFT  529
#define UCONST_GUI_Styles_Chat_Bar_B_HEIGHT  48
#define UCONST_GUI_Styles_Chat_Bar_B_WIDTH  372
#define UCONST_GUI_Styles_Chat_Bar_B_TOP  648
#define UCONST_GUI_Styles_Chat_Bar_B_LEFT  157
#define UCONST_GUI_Styles_Combatbar_B_HEIGHT  54
#define UCONST_GUI_Styles_Combatbar_B_WIDTH  157
#define UCONST_GUI_Styles_Combatbar_B_TOP  648
#define UCONST_GUI_Styles_Combatbar_B_LEFT  0
#define UCONST_GUI_Styles_Arena_Banner_Strech_HEIGHT  54
#define UCONST_GUI_Styles_Arena_Banner_Strech_WIDTH  3
#define UCONST_GUI_Styles_Arena_Banner_Strech_TOP  0
#define UCONST_GUI_Styles_Arena_Banner_Strech_LEFT  1000
#define UCONST_GUI_Styles_Arena_Banner_Ornament_HEIGHT  54
#define UCONST_GUI_Styles_Arena_Banner_Ornament_WIDTH  128
#define UCONST_GUI_Styles_Arena_Banner_Ornament_TOP  583
#define UCONST_GUI_Styles_Arena_Banner_Ornament_LEFT  765
#define UCONST_GUI_Styles_WindowFrame_empty_HEIGHT  55
#define UCONST_GUI_Styles_WindowFrame_empty_WIDTH  76
#define UCONST_GUI_Styles_WindowFrame_empty_TOP  583
#define UCONST_GUI_Styles_WindowFrame_empty_LEFT  689
#define UCONST_GUI_Styles_Group_Avatar_B_HEIGHT  58
#define UCONST_GUI_Styles_Group_Avatar_B_WIDTH  125
#define UCONST_GUI_Styles_Group_Avatar_B_TOP  583
#define UCONST_GUI_Styles_Group_Avatar_B_LEFT  564
#define UCONST_GUI_Styles_WindowFrameFrame_HEIGHT  60
#define UCONST_GUI_Styles_WindowFrameFrame_WIDTH  82
#define UCONST_GUI_Styles_WindowFrameFrame_TOP  501
#define UCONST_GUI_Styles_WindowFrameFrame_LEFT  889
#define UCONST_GUI_Styles_WindowFrame_HEIGHT  60
#define UCONST_GUI_Styles_WindowFrame_WIDTH  82
#define UCONST_GUI_Styles_WindowFrame_TOP  501
#define UCONST_GUI_Styles_WindowFrame_LEFT  807
#define UCONST_GUI_Styles_Arena_Character_Circle_HEIGHT  60
#define UCONST_GUI_Styles_Arena_Character_Circle_WIDTH  60
#define UCONST_GUI_Styles_Arena_Character_Circle_TOP  260
#define UCONST_GUI_Styles_Arena_Character_Circle_LEFT  959
#define UCONST_GUI_Styles_Timer_Window_B_HEIGHT  65
#define UCONST_GUI_Styles_Timer_Window_B_WIDTH  68
#define UCONST_GUI_Styles_Timer_Window_B_TOP  401
#define UCONST_GUI_Styles_Timer_Window_B_LEFT  928
#define UCONST_GUI_Styles_Skillbook_Skilltape_W_HEIGHT  65
#define UCONST_GUI_Styles_Skillbook_Skilltape_W_WIDTH  282
#define UCONST_GUI_Styles_Skillbook_Skilltape_W_TOP  583
#define UCONST_GUI_Styles_Skillbook_Skilltape_W_LEFT  282
#define UCONST_GUI_Styles_Skillbook_Skilltape_P_HEIGHT  65
#define UCONST_GUI_Styles_Skillbook_Skilltape_P_WIDTH  282
#define UCONST_GUI_Styles_Skillbook_Skilltape_P_TOP  583
#define UCONST_GUI_Styles_Skillbook_Skilltape_P_LEFT  0
#define UCONST_GUI_Styles_Skillbook_Skilltape_B_HEIGHT  65
#define UCONST_GUI_Styles_Skillbook_Skilltape_B_WIDTH  282
#define UCONST_GUI_Styles_Skillbook_Skilltape_B_TOP  501
#define UCONST_GUI_Styles_Skillbook_Skilltape_B_LEFT  525
#define UCONST_GUI_Styles_SkillPopup_HEIGHT  72
#define UCONST_GUI_Styles_SkillPopup_WIDTH  48
#define UCONST_GUI_Styles_SkillPopup_TOP  100
#define UCONST_GUI_Styles_SkillPopup_LEFT  935
#define UCONST_GUI_Styles_Class_Selection_Selected_Class_HEIGHT  82
#define UCONST_GUI_Styles_Class_Selection_Selected_Class_WIDTH  222
#define UCONST_GUI_Styles_Class_Selection_Selected_Class_TOP  501
#define UCONST_GUI_Styles_Class_Selection_Selected_Class_LEFT  303
#define UCONST_GUI_Styles_CC_Selection_HEIGHT  82
#define UCONST_GUI_Styles_CC_Selection_WIDTH  303
#define UCONST_GUI_Styles_CC_Selection_TOP  501
#define UCONST_GUI_Styles_CC_Selection_LEFT  0
#define UCONST_GUI_Styles_Minigames_AvatarCircle_B_HEIGHT  86
#define UCONST_GUI_Styles_Minigames_AvatarCircle_B_WIDTH  86
#define UCONST_GUI_Styles_Minigames_AvatarCircle_B_TOP  401
#define UCONST_GUI_Styles_Minigames_AvatarCircle_B_LEFT  842
#define UCONST_GUI_Styles_Characterstats_Mind_HEIGHT  86
#define UCONST_GUI_Styles_Characterstats_Mind_WIDTH  68
#define UCONST_GUI_Styles_Characterstats_Mind_TOP  401
#define UCONST_GUI_Styles_Characterstats_Mind_LEFT  774
#define UCONST_GUI_Styles_Characterstats_Focus_HEIGHT  86
#define UCONST_GUI_Styles_Characterstats_Focus_WIDTH  68
#define UCONST_GUI_Styles_Characterstats_Focus_TOP  401
#define UCONST_GUI_Styles_Characterstats_Focus_LEFT  706
#define UCONST_GUI_Styles_Characterstats_Body_HEIGHT  86
#define UCONST_GUI_Styles_Characterstats_Body_WIDTH  68
#define UCONST_GUI_Styles_Characterstats_Body_TOP  401
#define UCONST_GUI_Styles_Characterstats_Body_LEFT  638
#define UCONST_GUI_Styles_Avatar_Selected_B_HEIGHT  87
#define UCONST_GUI_Styles_Avatar_Selected_B_WIDTH  252
#define UCONST_GUI_Styles_Avatar_Selected_B_TOP  401
#define UCONST_GUI_Styles_Avatar_Selected_B_LEFT  386
#define UCONST_GUI_Styles_Avatar_Player_B_HEIGHT  87
#define UCONST_GUI_Styles_Avatar_Player_B_WIDTH  253
#define UCONST_GUI_Styles_Avatar_Player_B_TOP  260
#define UCONST_GUI_Styles_Avatar_Player_B_LEFT  706
#define UCONST_GUI_Styles_Parchment_Bottom_HEIGHT  100
#define UCONST_GUI_Styles_Parchment_Bottom_WIDTH  386
#define UCONST_GUI_Styles_Parchment_Bottom_TOP  401
#define UCONST_GUI_Styles_Parchment_Bottom_LEFT  0
#define UCONST_GUI_Styles_Menu_ornament_B_HEIGHT  100
#define UCONST_GUI_Styles_Menu_ornament_B_WIDTH  65
#define UCONST_GUI_Styles_Menu_ornament_B_TOP  260
#define UCONST_GUI_Styles_Menu_ornament_B_LEFT  641
#define UCONST_GUI_Styles_Chat_ornament_B_HEIGHT  100
#define UCONST_GUI_Styles_Chat_ornament_B_WIDTH  65
#define UCONST_GUI_Styles_Chat_ornament_B_TOP  0
#define UCONST_GUI_Styles_Chat_ornament_B_LEFT  935
#define UCONST_GUI_Styles_Minimap_Compass_B_HEIGHT  128
#define UCONST_GUI_Styles_Minimap_Compass_B_WIDTH  128
#define UCONST_GUI_Styles_Minimap_Compass_B_TOP  260
#define UCONST_GUI_Styles_Minimap_Compass_B_LEFT  513
#define UCONST_GUI_Styles_Class_Selection03_Bigicon_Ring_HEIGHT  130
#define UCONST_GUI_Styles_Class_Selection03_Bigicon_Ring_WIDTH  127
#define UCONST_GUI_Styles_Class_Selection03_Bigicon_Ring_TOP  260
#define UCONST_GUI_Styles_Class_Selection03_Bigicon_Ring_LEFT  386
#define UCONST_GUI_Styles_Parchment_Top_HEIGHT  141
#define UCONST_GUI_Styles_Parchment_Top_WIDTH  386
#define UCONST_GUI_Styles_Parchment_Top_TOP  260
#define UCONST_GUI_Styles_Parchment_Top_LEFT  0
#define UCONST_GUI_Styles_Minimap_B_HEIGHT  172
#define UCONST_GUI_Styles_Minimap_B_WIDTH  163
#define UCONST_GUI_Styles_Minimap_B_TOP  0
#define UCONST_GUI_Styles_Minimap_B_LEFT  772
#define UCONST_GUI_Styles_Dropdown_Background_B_HEIGHT  213
#define UCONST_GUI_Styles_Dropdown_Background_B_WIDTH  120
#define UCONST_GUI_Styles_Dropdown_Background_B_TOP  0
#define UCONST_GUI_Styles_Dropdown_Background_B_LEFT  652
#define UCONST_GUI_Styles_Parchment_Tile_HEIGHT  237
#define UCONST_GUI_Styles_Parchment_Tile_WIDTH  386
#define UCONST_GUI_Styles_Parchment_Tile_TOP  0
#define UCONST_GUI_Styles_Parchment_Tile_LEFT  266
#define UCONST_GUI_Styles_Ornament_Bottom_HEIGHT  260
#define UCONST_GUI_Styles_Ornament_Bottom_WIDTH  266
#define UCONST_GUI_Styles_Ornament_Bottom_TOP  0
#define UCONST_GUI_Styles_Ornament_Bottom_LEFT  0
// UGUI_Styles 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UGUI_Styles : public UObject {
};


//------------------------------------------------------------------------------
//  WorldMap
//------------------------------------------------------------------------------

#define UCONST_WorldMap_MinimapArrow_HEIGHT  16
#define UCONST_WorldMap_MinimapArrow_WIDTH  16
#define UCONST_WorldMap_MinimapArrow_TOP  0
#define UCONST_WorldMap_MinimapArrow_LEFT  0
#define UCONST_WorldMap_empty_HEIGHT  1024
#define UCONST_WorldMap_empty_WIDTH  1024
#define UCONST_WorldMap_empty_TOP  0
#define UCONST_WorldMap_empty_LEFT  0
// UWorldMap 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UWorldMap : public UObject {
};



//------------------------------------------------------------------------------
//  FBoolSetting
//------------------------------------------------------------------------------

struct DLL_IMPORT FBoolSetting {
  public:
    FBoolSetting(struct FBoolSetting const &);
    FBoolSetting(void);
    ~FBoolSetting(void);
    struct FBoolSetting & operator=(struct FBoolSetting const &);
};

//------------------------------------------------------------------------------
//  FButtonReferenceStruct
//------------------------------------------------------------------------------

struct DLL_IMPORT FButtonReferenceStruct {
  public:
    FButtonReferenceStruct(struct FButtonReferenceStruct const &);
    FButtonReferenceStruct(void);
    ~FButtonReferenceStruct(void);
    struct FButtonReferenceStruct & operator=(struct FButtonReferenceStruct const &);
};

//------------------------------------------------------------------------------
//  FCombatText
//------------------------------------------------------------------------------

struct DLL_IMPORT FCombatText {
  public:
    FCombatText(struct FCombatText const &);
    FCombatText(void);
    ~FCombatText(void);
    struct FCombatText & operator=(struct FCombatText const &);
};

//------------------------------------------------------------------------------
//  FFloatSetting
//------------------------------------------------------------------------------

struct DLL_IMPORT FFloatSetting {
  public:
    FFloatSetting(struct FFloatSetting const &);
    FFloatSetting(void);
    ~FFloatSetting(void);
    struct FFloatSetting & operator=(struct FFloatSetting const &);
};

//------------------------------------------------------------------------------
//  FIntSetting
//------------------------------------------------------------------------------

struct DLL_IMPORT FIntSetting {
  public:
    FIntSetting(struct FIntSetting const &);
    FIntSetting(void);
    ~FIntSetting(void);
    struct FIntSetting & operator=(struct FIntSetting const &);
};

//------------------------------------------------------------------------------
//  FKeyBinding
//------------------------------------------------------------------------------

struct DLL_IMPORT FKeyBinding {
  public:
    FKeyBinding(struct FKeyBinding const &);
    FKeyBinding(void);
    ~FKeyBinding(void);
    struct FKeyBinding & operator=(struct FKeyBinding const &);
};

//------------------------------------------------------------------------------
//  FResolutionOption
//------------------------------------------------------------------------------

struct DLL_IMPORT FResolutionOption {
  public:
    FResolutionOption(struct FResolutionOption const &);
    FResolutionOption(void);
    ~FResolutionOption(void);
    struct FResolutionOption & operator=(struct FResolutionOption const &);
};

//------------------------------------------------------------------------------
//  FWeaponMesh
//------------------------------------------------------------------------------

struct DLL_IMPORT FWeaponMesh {
  public:
    FWeaponMesh(struct FWeaponMesh const &);
    FWeaponMesh(void);
    ~FWeaponMesh(void);
    struct FWeaponMesh & operator=(struct FWeaponMesh const &);
};

//------------------------------------------------------------------------------
//  PropertyMap
//------------------------------------------------------------------------------

class DLL_IMPORT PropertyMap {
  public:
    virtual ~PropertyMap(void);
    virtual void SetProperty(class FString const &,class FString const &);
    virtual class FString GetProperty(class FString const &,class UObject *);
    virtual int GetPropertyAsInt(class FString const &);
    virtual float GetPropertyAsFloat(class FString const &);
    virtual class FVector GetPropertyAsVector(class FString const &);
    PropertyMap(class PropertyMap const &);
    PropertyMap(void);
    class PropertyMap & operator=(class PropertyMap const &);
};

//------------------------------------------------------------------------------
//  FBuySection
//------------------------------------------------------------------------------

struct DLL_IMPORT FBuySection {
  public:
    struct FBuySection & operator=(struct FBuySection const &);
};

//------------------------------------------------------------------------------
//  `d_relevance
//------------------------------------------------------------------------------

struct DLL_IMPORT `d_relevance {
};


//state SBConsole.ConsoleVisible 0


AUTOGENERATE_CLASS(AGUI_GamePawn)
AUTOGENERATE_CLASS(AGUI_MeshActor)
AUTOGENERATE_CLASS(UGED_DebugWindow)
AUTOGENERATE_CLASS(UGED_Editor)
AUTOGENERATE_CLASS(UGED_GroupMemberPage)
AUTOGENERATE_CLASS(UGED_IntPage)
AUTOGENERATE_CLASS(UGED_ObjectPage)
AUTOGENERATE_CLASS(UGED_PawnPage)
AUTOGENERATE_CLASS(UGED_QuestPage)
AUTOGENERATE_CLASS(UGED_StringPage)
AUTOGENERATE_CLASS(UGUI_AttachWindow)
AUTOGENERATE_CLASS(UGUI_AttachedWindow)
AUTOGENERATE_CLASS(UGUI_AutoHeight_Page)
AUTOGENERATE_CLASS(UGUI_AvatarImageMaterial)
AUTOGENERATE_CLASS(UGUI_Bar)
AUTOGENERATE_CLASS(UGUI_Button)
AUTOGENERATE_CLASS(UGUI_ComboBox)
AUTOGENERATE_CLASS(UGUI_ComboBoxDropDown)
AUTOGENERATE_CLASS(UGUI_Component)
AUTOGENERATE_CLASS(UGUI_ContextMenu)
AUTOGENERATE_CLASS(UGUI_ContextWindow)
AUTOGENERATE_CLASS(UGUI_CustomComposition)
AUTOGENERATE_CLASS(UGUI_DefaultToolkit)
AUTOGENERATE_CLASS(UGUI_Desktop)
AUTOGENERATE_CLASS(UGUI_DnDInfo)
AUTOGENERATE_CLASS(UGUI_DuffButton)
AUTOGENERATE_CLASS(UGUI_EditBox)
AUTOGENERATE_CLASS(UGUI_IconButton)
AUTOGENERATE_CLASS(UGUI_Image)
AUTOGENERATE_CLASS(UGUI_ImageX)
AUTOGENERATE_CLASS(UGUI_IterationPage)
AUTOGENERATE_CLASS(UGUI_KeyEditButton)
AUTOGENERATE_CLASS(UGUI_Label)
AUTOGENERATE_CLASS(UGUI_ListBox)
AUTOGENERATE_CLASS(UGUI_ListView)
AUTOGENERATE_CLASS(UGUI_ListViewHeader)
AUTOGENERATE_CLASS(UGUI_Menu)
AUTOGENERATE_CLASS(UGUI_Mesh)
AUTOGENERATE_CLASS(UGUI_MessageBox)
AUTOGENERATE_CLASS(UGUI_NPCDebugWindow)
AUTOGENERATE_CLASS(UGUI_ObjectTooltipPage)
AUTOGENERATE_CLASS(UGUI_Page)
AUTOGENERATE_CLASS(UGUI_RadialButton)
AUTOGENERATE_CLASS(UGUI_RotatableMesh)
AUTOGENERATE_CLASS(UGUI_Rotator)
AUTOGENERATE_CLASS(UGUI_ScrollBar)
AUTOGENERATE_CLASS(UGUI_Slider)
AUTOGENERATE_CLASS(UGUI_SplitCtrl)
AUTOGENERATE_CLASS(UGUI_TabCtrl)
AUTOGENERATE_CLASS(UGUI_TabCtrlDnDWindow)
AUTOGENERATE_CLASS(UGUI_TabWindow)
AUTOGENERATE_CLASS(UGUI_TextBoxCtrl)
AUTOGENERATE_CLASS(UGUI_TextButton)
AUTOGENERATE_CLASS(UGUI_TextCtrl)
AUTOGENERATE_CLASS(UGUI_TitleBar)
AUTOGENERATE_CLASS(UGUI_Toolkit)
AUTOGENERATE_CLASS(UGUI_Tooltip)
AUTOGENERATE_CLASS(UGUI_TrayBox)
AUTOGENERATE_CLASS(UGUI_TreeCtrl)
AUTOGENERATE_CLASS(UGUI_Window)
AUTOGENERATE_CLASS(UHUD_AvatarImagePage)
AUTOGENERATE_CLASS(UHUD_AvatarStatusBarTooltip)
AUTOGENERATE_CLASS(UHUD_BaseItemContainer)
AUTOGENERATE_CLASS(UHUD_BodySlotItemContainer)
AUTOGENERATE_CLASS(UHUD_BodySlotWindow)
AUTOGENERATE_CLASS(UHUD_CC_AllColors)
AUTOGENERATE_CLASS(UHUD_CC_Armour)
AUTOGENERATE_CLASS(UHUD_CC_ClassSelectionWindow)
AUTOGENERATE_CLASS(UHUD_CC_ColorPicker)
AUTOGENERATE_CLASS(UHUD_CC_CreateCharacter)
AUTOGENERATE_CLASS(UHUD_CC_ItemInfo)
AUTOGENERATE_CLASS(UHUD_CC_Main)
AUTOGENERATE_CLASS(UHUD_CC_Navigation)
AUTOGENERATE_CLASS(UHUD_CC_Option)
AUTOGENERATE_CLASS(UHUD_CC_ShieldSelection)
AUTOGENERATE_CLASS(UHUD_CC_SkillButton)
AUTOGENERATE_CLASS(UHUD_CC_WeaponSelection)
AUTOGENERATE_CLASS(UHUD_CC_Window)
AUTOGENERATE_CLASS(UHUD_CharacterIterationPage)
AUTOGENERATE_CLASS(UHUD_CharacterSelection)
AUTOGENERATE_CLASS(UHUD_Chat)
AUTOGENERATE_CLASS(UHUD_ChatConsole)
AUTOGENERATE_CLASS(UHUD_ChatConsoleManager)
AUTOGENERATE_CLASS(UHUD_ChatPage)
AUTOGENERATE_CLASS(UHUD_ChatWindow)
AUTOGENERATE_CLASS(UHUD_ColourChoice)
AUTOGENERATE_CLASS(UHUD_CombatBar)
AUTOGENERATE_CLASS(UHUD_ControlsSettings)
AUTOGENERATE_CLASS(UHUD_Conversation)
AUTOGENERATE_CLASS(UHUD_Create_Guild)
AUTOGENERATE_CLASS(UHUD_CreditsWindow)
AUTOGENERATE_CLASS(UHUD_DefaultConsole)
AUTOGENERATE_CLASS(UHUD_DisplaySettings)
AUTOGENERATE_CLASS(UHUD_DuffsPage)
AUTOGENERATE_CLASS(UHUD_Equipment)
AUTOGENERATE_CLASS(UHUD_EquipmentItemContainer)
AUTOGENERATE_CLASS(UHUD_GameMenu)
AUTOGENERATE_CLASS(UHUD_GuildList)
AUTOGENERATE_CLASS(UHUD_HelpKnowledgeBase)
AUTOGENERATE_CLASS(UHUD_HelpTutorial)
AUTOGENERATE_CLASS(UHUD_Inventory)
AUTOGENERATE_CLASS(UHUD_InventoryItemContainer)
AUTOGENERATE_CLASS(UHUD_InventoryPage)
AUTOGENERATE_CLASS(UHUD_ItemContainer)
AUTOGENERATE_CLASS(UHUD_ItemContextMenu)
AUTOGENERATE_CLASS(UHUD_Join_Guild)
AUTOGENERATE_CLASS(UHUD_Login)
AUTOGENERATE_CLASS(UHUD_MailBox)
AUTOGENERATE_CLASS(UHUD_MailCompose)
AUTOGENERATE_CLASS(UHUD_MailDetails)
AUTOGENERATE_CLASS(UHUD_MailItemContainer)
AUTOGENERATE_CLASS(UHUD_Minimap)
AUTOGENERATE_CLASS(UHUD_MoneyPage)
AUTOGENERATE_CLASS(UHUD_MoneyPageShort)
AUTOGENERATE_CLASS(UHUD_MoneyPageSmall)
AUTOGENERATE_CLASS(UHUD_MoneyPage_Base)
AUTOGENERATE_CLASS(UHUD_MouseSettings)
AUTOGENERATE_CLASS(UHUD_NDAWindow)
AUTOGENERATE_CLASS(UHUD_NetConsole)
AUTOGENERATE_CLASS(UHUD_OnScreenMessages)
AUTOGENERATE_CLASS(UHUD_Options)
AUTOGENERATE_CLASS(UHUD_PawnTracker)
AUTOGENERATE_CLASS(UHUD_Pet)
AUTOGENERATE_CLASS(UHUD_PlayerAvatar)
AUTOGENERATE_CLASS(UHUD_Progress)
AUTOGENERATE_CLASS(UHUD_QuestItem)
AUTOGENERATE_CLASS(UHUD_QuestItemIterationPage)
AUTOGENERATE_CLASS(UHUD_QuestItemPage)
AUTOGENERATE_CLASS(UHUD_QuestLogPage)
AUTOGENERATE_CLASS(UHUD_RadialMenu)
AUTOGENERATE_CLASS(UHUD_ResponsePage)
AUTOGENERATE_CLASS(UHUD_SendMailItemContainer)
AUTOGENERATE_CLASS(UHUD_SettingsPage)
AUTOGENERATE_CLASS(UHUD_SheathWeaponWindow)
AUTOGENERATE_CLASS(UHUD_ShopBuyItemContainer)
AUTOGENERATE_CLASS(UHUD_ShopCraftItemContainer)
AUTOGENERATE_CLASS(UHUD_ShopPaintItemContainer)
AUTOGENERATE_CLASS(UHUD_ShopSellItemContainer)
AUTOGENERATE_CLASS(UHUD_ShopSigilItemContainer)
AUTOGENERATE_CLASS(UHUD_Shop_Buy_Section_Page)
AUTOGENERATE_CLASS(UHUD_Shop_Buying)
AUTOGENERATE_CLASS(UHUD_Shop_Buying_Page)
AUTOGENERATE_CLASS(UHUD_Shop_Crafting)
AUTOGENERATE_CLASS(UHUD_Shop_ItemDescription)
AUTOGENERATE_CLASS(UHUD_Shop_Painting)
AUTOGENERATE_CLASS(UHUD_Shop_Window)
AUTOGENERATE_CLASS(UHUD_SkillBook)
AUTOGENERATE_CLASS(UHUD_SkillBookPage)
AUTOGENERATE_CLASS(UHUD_SkillItemContainer)
AUTOGENERATE_CLASS(UHUD_SkillIterationPage)
AUTOGENERATE_CLASS(UHUD_SkillLibrary)
AUTOGENERATE_CLASS(UHUD_SystemMenu)
AUTOGENERATE_CLASS(UHUD_TargetAvatar)
AUTOGENERATE_CLASS(UHUD_Team)
AUTOGENERATE_CLASS(UHUD_TeamDuffPage)
AUTOGENERATE_CLASS(UHUD_TeamMemberIterationPage)
AUTOGENERATE_CLASS(UHUD_TeamMemberPage)
AUTOGENERATE_CLASS(UHUD_TeamNotification)
AUTOGENERATE_CLASS(UHUD_TempItemContainer)
AUTOGENERATE_CLASS(UHUD_Timer)
AUTOGENERATE_CLASS(UHUD_TimerWindow)
AUTOGENERATE_CLASS(UHUD_TradeItemContainer)
AUTOGENERATE_CLASS(UHUD_Travel)
AUTOGENERATE_CLASS(UHUD_UniverseSelection)
AUTOGENERATE_CLASS(UHUD_WorldMap)
AUTOGENERATE_CLASS(USBConsole)
AUTOGENERATE_CLASS(USBGuiStrings)

AUTOGENERATE_PACKAGE(SBGui)


//_DllMain@12 1d2553c0
//SBGui_InitPackage 1d2553e0

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

