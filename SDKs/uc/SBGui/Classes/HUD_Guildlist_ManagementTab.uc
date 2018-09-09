//==============================================================================
//  HUD_Guildlist_ManagementTab
//==============================================================================

class HUD_Guildlist_ManagementTab extends GUI_Page
    dependsOn(Game_PlayerController,Game_PlayerGuilds,GUI_Desktop,Class,SBGuiStrings,GUI_BaseDesktop,Game_GUI,GUI_Label,GUI_EditBox,GUI_Button)
    Transient
    Config(User)
  ;

  var GUI_Page mMOTDPage;
  var GUI_Page mDisbandPage;
  var GUI_Page mCreatePage;
  var GUI_Button mButtonDisbandGuild;
  var GUI_Button mButtonSaveMOTD;
  var GUI_Button mButtonCreateGuild;
  var GUI_EditBox mEditBoxMOTD;
  var GUI_Label mLabelMOTD;
  var GUI_Label mLabelDisbandGuild;
  var GUI_Label mLabelCreateGuild;


  function string GetMOTD() {
    return "This is the message of the day...";                                 //0000 : 04 1F 54 68 69 73 20 69 73 20 74 68 65 20 6D 65 73 73 61 67 65 20 6F 66 20 74 68 65 20 64 61 79 2E 2E 2E 00 
    //04 1F 54 68 69 73 20 69 73 20 74 68 65 20 6D 65 73 73 61 67 65 20 6F 66 20 74 68 65 20 64 61 79 
    //2E 2E 2E 00 04 0B 47 
  }


  function bool MBClickHandler(GUI_MessageBox messageBox,int boxTag,int buttonTag) {
    local Game_PlayerController PlayerController;
    switch (boxTag) {                                                           //0000 : 05 04 00 70 F6 35 26 
      case 0 :                                                                  //0007 : 0A 4E 00 25 
        if (buttonTag == 4) {                                                   //000B : 07 4B 00 9A 00 F8 F5 35 26 2C 04 16 
          PlayerController = Game_PlayerController(GetPlayerController());      //0017 : 0F 00 18 45 07 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
          if (PlayerController != None) {                                       //0028 : 07 4B 00 77 00 18 45 07 1B 2A 16 
            PlayerController.GroupingGuilds.GuildDisband();                     //0033 : 19 19 00 18 45 07 1B 05 00 04 01 C8 A2 1B 11 06 00 00 1B 26 1C 00 00 16 
          }
        }
        break;                                                                  //004B : 06 51 00 
      default:                                                                  //004E : 0A FF FF 
    }
    return True;                                                                //0051 : 04 27 
    //05 04 00 70 F6 35 26 0A 4E 00 25 07 4B 00 9A 00 F8 F5 35 26 2C 04 16 0F 00 18 45 07 1B 2E 90 18 
    //5B 01 1B 0E 2F 00 00 16 07 4B 00 77 00 18 45 07 1B 2A 16 19 19 00 18 45 07 1B 05 00 04 01 C8 A2 
    //1B 11 06 00 00 1B 26 1C 00 00 16 06 51 00 0A FF FF 04 27 04 0B 47 
  }


  function bool ClickHandler(GUI_Component clickedButton) {
    local int mbHandle;
    local Game_PlayerController PlayerController;
    switch (clickedButton.mIntTag) {                                            //0000 : 05 04 19 00 E8 F6 35 26 05 00 04 01 58 90 31 16 
      case 0 :                                                                  //0010 : 0A 17 00 25 
        break;                                                                  //0014 : 06 F2 00 
      case 1 :                                                                  //0017 : 0A B3 00 26 
        mbHandle = mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Disband_Guild.Text,Class'SBGuiStrings'.default.Are_you_sure_you_want_to_disband_this_guild_.Text,Class'GUI_BaseDesktop'.4 | Class'GUI_BaseDesktop'.8 | Class'GUI_BaseDesktop'.32,0,self);//001B : 0F 00 78 42 33 26 19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 C3 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 C8 99 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 
        mDesktop.BringToTop(mDesktop.GetWindow(mbHandle));                      //008D : 19 01 48 0C 9D 19 1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 78 42 33 26 16 16 
        break;                                                                  //00B0 : 06 F2 00 
      case 2 :                                                                  //00B3 : 0A EF 00 2C 02 
        PlayerController = Game_PlayerController(GetPlayerController());        //00B8 : 0F 00 40 46 07 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
        if (PlayerController != None) {                                         //00C9 : 07 EC 00 77 00 40 46 07 1B 2A 16 
          PlayerController.GUI.ShowGuildCreate();                               //00D4 : 19 19 00 40 46 07 1B 05 00 04 01 40 8A 1B 11 06 00 00 1B 8B 1A 00 00 16 
        }
        break;                                                                  //00EC : 06 F2 00 
      default:                                                                  //00EF : 0A FF FF 
    }
    return True;                                                                //00F2 : 04 27 
    //05 04 19 00 E8 F6 35 26 05 00 04 01 58 90 31 16 0A 17 00 25 06 F2 00 0A B3 00 26 0F 00 78 42 33 
    //26 19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 C3 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 00 C8 99 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 
    //00 68 D7 00 02 00 04 2C 20 16 25 17 16 19 01 48 0C 9D 19 1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 
    //19 0B 00 04 1B 1E 98 00 00 00 78 42 33 26 16 16 06 F2 00 0A EF 00 2C 02 0F 00 40 46 07 1B 2E 90 
    //18 5B 01 1B 0E 2F 00 00 16 07 EC 00 77 00 40 46 07 1B 2A 16 19 19 00 40 46 07 1B 05 00 04 01 40 
    //8A 1B 11 06 00 00 1B 8B 1A 00 00 16 06 F2 00 0A FF FF 04 27 04 0B 47 
  }


  function SetGuildStatus(bool inGuild) {
    if (inGuild) {                                                              //0000 : 07 3C 00 2D 00 C0 F8 35 26 
      mMOTDPage.SetEnabled(False);                                              //0009 : 19 01 28 5B 8A 19 07 00 00 1B 5F 32 00 00 28 16 
      mDisbandPage.SetEnabled(True);                                            //0019 : 19 01 D0 06 2D 26 07 00 00 1B 5F 32 00 00 27 16 
      mCreatePage.SetEnabled(False);                                            //0029 : 19 01 D8 EE 32 26 07 00 00 1B 5F 32 00 00 28 16 
    } else {                                                                    //0039 : 06 6C 00 
      mMOTDPage.SetEnabled(False);                                              //003C : 19 01 28 5B 8A 19 07 00 00 1B 5F 32 00 00 28 16 
      mDisbandPage.SetEnabled(False);                                           //004C : 19 01 D0 06 2D 26 07 00 00 1B 5F 32 00 00 28 16 
      mCreatePage.SetEnabled(True);                                             //005C : 19 01 D8 EE 32 26 07 00 00 1B 5F 32 00 00 27 16 
    }
    //07 3C 00 2D 00 C0 F8 35 26 19 01 28 5B 8A 19 07 00 00 1B 5F 32 00 00 28 16 19 01 D0 06 2D 26 07 
    //00 00 1B 5F 32 00 00 27 16 19 01 D8 EE 32 26 07 00 00 1B 5F 32 00 00 28 16 06 6C 00 19 01 28 5B 
    //8A 19 07 00 00 1B 5F 32 00 00 28 16 19 01 D0 06 2D 26 07 00 00 1B 5F 32 00 00 28 16 19 01 D8 EE 
    //32 26 07 00 00 1B 5F 32 00 00 27 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    mMOTDPage = CreatePage("GUI_Page",524288 | 262144,0,11,11,GetClientWidth() - 22,80);//0006 : 0F 01 28 5B 8A 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 9E 1D 00 00 08 00 1D 00 00 04 00 16 25 2C 0B 2C 0B 39 44 AF 1B 17 98 00 00 16 39 3F 2C 16 16 2C 50 16 
    mMOTDPage.SetBorder(3,3,3,3,"windowsizableframe");                          //003D : 19 01 28 5B 8A 19 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    mLabelMOTD = mMOTDPage.CreateLabel("GUI_Label",0,256,11,11,400,24);         //0068 : 0F 01 40 65 33 26 19 01 28 5B 8A 19 22 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 1D 00 01 00 00 2C 0B 2C 0B 1D 90 01 00 00 2C 18 16 
    mLabelMOTD.SetText(Class'SBGuiStrings'.default.Message_of_the_day_.Text);   //0099 : 19 01 40 65 33 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 C7 99 19 16 
    mEditBoxMOTD = mMOTDPage.CreateEditBox("GUI_EditBox",Class'GUI_BaseDesktop'.4194304,0,11,35,400,34);//00BB : 0F 01 18 35 04 1B 19 01 28 5B 8A 19 2D 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 12 20 00 68 D7 00 05 00 04 1D 00 00 40 00 25 2C 0B 2C 23 1D 90 01 00 00 2C 22 16 
    mEditBoxMOTD.SetBackground("textfield","SBGuiTX.GUI_Styles","GUI_Styles");  //00F7 : 19 01 18 35 04 1B 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mEditBoxMOTD.mTabIndex = 0;                                                 //0131 : 0F 19 01 18 35 04 1B 05 00 04 01 E0 8F 31 16 25 
    mEditBoxMOTD.SetColor(219.00000000,206.00000000,186.00000000);              //0141 : 19 01 18 35 04 1B 15 00 00 1B 19 98 00 00 1E 00 00 5B 43 1E 00 00 4E 43 1E 00 00 3A 43 16 
    mEditBoxMOTD.SetText(GetMOTD());                                            //015F : 19 01 18 35 04 1B 0C 00 00 1B 13 98 00 00 1B 3C 9B 00 00 16 16 
    mButtonSaveMOTD = mMOTDPage.CreateButton("GUI_Button",4194304,2,mMOTDPage.GetClientWidth() - 116,40,105);//0174 : 0F 01 F0 04 8B 19 19 01 28 5B 8A 19 34 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 39 44 AF 19 01 28 5B 8A 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 74 16 2C 28 2C 69 16 
    mButtonSaveMOTD.SetText(Class'SBGuiStrings'.default.Apply.Text);            //01B7 : 19 01 F0 04 8B 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 CB 98 19 16 
    mButtonSaveMOTD.SetTextBorder(0.00000000,3.00000000);                       //01D9 : 19 01 F0 04 8B 19 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mButtonSaveMOTD.mIntTag = 0;                                                //01F2 : 0F 19 01 F0 04 8B 19 05 00 04 01 58 90 31 16 25 
    mButtonSaveMOTD.mTabIndex = 1;                                              //0202 : 0F 19 01 F0 04 8B 19 05 00 04 01 E0 8F 31 16 26 
    mButtonSaveMOTD.__OnClick__Delegate = ClickHandler;                         //0212 : 45 19 01 F0 04 8B 19 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mCreatePage = CreatePage("GUI_Page",524288 | 262144,0,11,102,GetClientWidth() - 22,52);//0226 : 0F 01 D8 EE 32 26 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 9E 1D 00 00 08 00 1D 00 00 04 00 16 25 2C 0B 2C 66 39 44 AF 1B 17 98 00 00 16 39 3F 2C 16 16 2C 34 16 
    mCreatePage.SetBorder(3,3,3,3,"windowsizableframe");                        //025D : 19 01 D8 EE 32 26 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    mLabelCreateGuild = mCreatePage.CreateLabel("GUI_Label",0,256,11,11,450,48);//0288 : 0F 01 58 44 33 26 19 01 D8 EE 32 26 22 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 1D 00 01 00 00 2C 0B 2C 0B 1D C2 01 00 00 2C 30 16 
    mLabelCreateGuild.SetText(Class'SBGuiStrings'.default.Create_Guild.Text
      $ ".");//02B9 : 19 01 58 44 33 26 1E 00 00 1B 13 98 00 00 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 32 97 19 1F 2E 00 16 16 
    mButtonCreateGuild = mCreatePage.CreateButton("GUI_Button",4194304,2,mCreatePage.GetClientWidth() - 116,11,105);//02E0 : 0F 01 A8 06 04 1B 19 01 D8 EE 32 26 34 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 39 44 AF 19 01 D8 EE 32 26 06 00 04 1B 17 98 00 00 16 39 3F 2C 74 16 2C 0B 2C 69 16 
    mButtonCreateGuild.SetText(Class'SBGuiStrings'.default.Create_Guild.Text);  //0323 : 19 01 A8 06 04 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 32 97 19 16 
    mButtonCreateGuild.SetTextBorder(0.00000000,3.00000000);                    //0345 : 19 01 A8 06 04 1B 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mButtonCreateGuild.mIntTag = 2;                                             //035E : 0F 19 01 A8 06 04 1B 05 00 04 01 58 90 31 16 2C 02 
    mButtonCreateGuild.mTabIndex = 2;                                           //036F : 0F 19 01 A8 06 04 1B 05 00 04 01 E0 8F 31 16 2C 02 
    mButtonCreateGuild.__OnClick__Delegate = ClickHandler;                      //0380 : 45 19 01 A8 06 04 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mDisbandPage = CreatePage("GUI_Page",524288 | 262144,0,11,160,GetClientWidth() - 22,52);//0394 : 0F 01 D0 06 2D 26 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 9E 1D 00 00 08 00 1D 00 00 04 00 16 25 2C 0B 2C A0 39 44 AF 1B 17 98 00 00 16 39 3F 2C 16 16 2C 34 16 
    mDisbandPage.SetBorder(3,3,3,3,"windowsizableframe");                       //03CB : 19 01 D0 06 2D 26 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    mLabelDisbandGuild = mDisbandPage.CreateLabel("GUI_Label",0,256,11,11,450,48);//03F6 : 0F 01 48 45 33 26 19 01 D0 06 2D 26 22 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 1D 00 01 00 00 2C 0B 2C 0B 1D C2 01 00 00 2C 30 16 
    mLabelDisbandGuild.SetText(Class'SBGuiStrings'.default.Disband_Guild_You_can_disband_your_guild_this_can_not_be_undone.Text);//0427 : 19 01 48 45 33 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 C7 99 19 16 
    mButtonDisbandGuild = mDisbandPage.CreateButton("GUI_Button",4194304,2,mDisbandPage.GetClientWidth() - 116,11,105);//0449 : 0F 01 78 0A 04 1B 19 01 D0 06 2D 26 34 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 39 44 AF 19 01 D0 06 2D 26 06 00 04 1B 17 98 00 00 16 39 3F 2C 74 16 2C 0B 2C 69 16 
    mButtonDisbandGuild.SetText(Class'SBGuiStrings'.default.Disband_Guild.Text);//048C : 19 01 78 0A 04 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 C3 99 19 16 
    mButtonDisbandGuild.SetTextBorder(0.00000000,3.00000000);                   //04AE : 19 01 78 0A 04 1B 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mButtonDisbandGuild.mIntTag = 1;                                            //04C7 : 0F 19 01 78 0A 04 1B 05 00 04 01 58 90 31 16 26 
    mButtonDisbandGuild.mTabIndex = 2;                                          //04D7 : 0F 19 01 78 0A 04 1B 05 00 04 01 E0 8F 31 16 2C 02 
    mButtonDisbandGuild.__OnClick__Delegate = ClickHandler;                     //04E8 : 45 19 01 78 0A 04 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    __OnMBClick__Delegate = MBClickHandler;                                     //04FC : 45 01 B8 E9 9D 19 44 2D 98 00 00 
    SetGuildStatus(False);                                                      //0507 : 1B 3B 9B 00 00 28 16 
    //1C 40 5B 9E 19 16 0F 01 28 5B 8A 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 9E 1D 00 00 08 
    //00 1D 00 00 04 00 16 25 2C 0B 2C 0B 39 44 AF 1B 17 98 00 00 16 39 3F 2C 16 16 2C 50 16 19 01 28 
    //5B 8A 19 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 
    //65 66 72 61 6D 65 00 16 0F 01 40 65 33 26 19 01 28 5B 8A 19 22 00 04 1B 20 98 00 00 1F 47 55 49 
    //5F 4C 61 62 65 6C 00 25 1D 00 01 00 00 2C 0B 2C 0B 1D 90 01 00 00 2C 18 16 19 01 40 65 33 26 19 
    //00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 C7 99 19 16 0F 01 18 35 04 
    //1B 19 01 28 5B 8A 19 2D 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 12 20 00 68 
    //D7 00 05 00 04 1D 00 00 40 00 25 2C 0B 2C 23 1D 90 01 00 00 2C 22 16 19 01 18 35 04 1B 31 00 00 
    //1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 
    //6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 19 01 18 35 04 1B 05 00 04 01 E0 8F 31 16 
    //25 19 01 18 35 04 1B 15 00 00 1B 19 98 00 00 1E 00 00 5B 43 1E 00 00 4E 43 1E 00 00 3A 43 16 19 
    //01 18 35 04 1B 0C 00 00 1B 13 98 00 00 1B 3C 9B 00 00 16 16 0F 01 F0 04 8B 19 19 01 28 5B 8A 19 
    //34 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 39 44 AF 19 01 
    //28 5B 8A 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 74 16 2C 28 2C 69 16 19 01 F0 04 8B 19 19 00 00 
    //1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 CB 98 19 16 19 01 F0 04 8B 19 10 
    //00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 0F 19 01 F0 04 8B 19 05 00 04 01 58 90 31 
    //16 25 0F 19 01 F0 04 8B 19 05 00 04 01 E0 8F 31 16 26 45 19 01 F0 04 8B 19 05 00 08 01 98 EB 9D 
    //19 44 21 98 00 00 0F 01 D8 EE 32 26 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 9E 1D 00 00 08 
    //00 1D 00 00 04 00 16 25 2C 0B 2C 66 39 44 AF 1B 17 98 00 00 16 39 3F 2C 16 16 2C 34 16 19 01 D8 
    //EE 32 26 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 
    //65 66 72 61 6D 65 00 16 0F 01 58 44 33 26 19 01 D8 EE 32 26 22 00 04 1B 20 98 00 00 1F 47 55 49 
    //5F 4C 61 62 65 6C 00 25 1D 00 01 00 00 2C 0B 2C 0B 1D C2 01 00 00 2C 30 16 19 01 58 44 33 26 1E 
    //00 00 1B 13 98 00 00 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 32 97 19 1F 2E 00 16 16 
    //0F 01 A8 06 04 1B 19 01 D8 EE 32 26 34 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 
    //1D 00 00 40 00 2C 02 39 44 AF 19 01 D8 EE 32 26 06 00 04 1B 17 98 00 00 16 39 3F 2C 74 16 2C 0B 
    //2C 69 16 19 01 A8 06 04 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //A0 32 97 19 16 19 01 A8 06 04 1B 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 0F 19 
    //01 A8 06 04 1B 05 00 04 01 58 90 31 16 2C 02 0F 19 01 A8 06 04 1B 05 00 04 01 E0 8F 31 16 2C 02 
    //45 19 01 A8 06 04 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 01 D0 06 2D 26 1B 16 98 00 00 1F 
    //47 55 49 5F 50 61 67 65 00 9E 1D 00 00 08 00 1D 00 00 04 00 16 25 2C 0B 2C A0 39 44 AF 1B 17 98 
    //00 00 16 39 3F 2C 16 16 2C 34 16 19 01 D0 06 2D 26 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 
    //03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 0F 01 48 45 33 26 19 01 D0 06 
    //2D 26 22 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 1D 00 01 00 00 2C 0B 2C 0B 1D 
    //C2 01 00 00 2C 30 16 19 01 48 45 33 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 88 C7 99 19 16 0F 01 78 0A 04 1B 19 01 D0 06 2D 26 34 00 04 1B 18 98 00 00 1F 47 55 
    //49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 39 44 AF 19 01 D0 06 2D 26 06 00 04 1B 17 98 00 
    //00 16 39 3F 2C 74 16 2C 0B 2C 69 16 19 01 78 0A 04 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 C8 C3 99 19 16 19 01 78 0A 04 1B 10 00 00 1B 49 98 00 00 1E 00 00 00 
    //00 1E 00 00 40 40 16 0F 19 01 78 0A 04 1B 05 00 04 01 58 90 31 16 26 0F 19 01 78 0A 04 1B 05 00 
    //04 01 E0 8F 31 16 2C 02 45 19 01 78 0A 04 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 45 01 B8 E9 
    //9D 19 44 2D 98 00 00 1B 3B 9B 00 00 28 16 04 0B 47 
  }



