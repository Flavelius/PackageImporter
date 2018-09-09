//==============================================================================
//  HUD_Guildlist_ListingTab
//==============================================================================

class HUD_Guildlist_ListingTab extends GUI_Page
    dependsOn(GUI_Desktop,Class,GUI_BaseDesktop,GUI_EditBox,Game_PlayerController,Game_PlayerGuilds,SBGuiStrings,GUI_ListView,GUI_Label,GUI_Button)
    Transient
    Config(User)
  ;

  var GUI_ListView mGuildListView;
  var GUI_Page mActionsPage;
  var GUI_Button mButtonInvite;
  var GUI_Button mButtonLeave;
  var GUI_EditBox mPlayerName;
  var GUI_Label mLabelPlayerName;


  function bool ClickHandler(GUI_Component clickedButton) {
    local Game_PlayerController PlayerController;
    local int mbHandle;
    switch (clickedButton.mIntTag) {                                            //0000 : 05 04 19 00 38 F9 35 26 05 00 04 01 58 90 31 16 
      case 1 :                                                                  //0010 : 0A 20 01 26 
        mDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.65,Class'GUI_BaseDesktop'.2);//0014 : 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 41 12 20 00 68 D7 00 02 00 04 2C 02 16 
        PlayerController = Game_PlayerController(GetPlayerController());        //0039 : 0F 00 B8 40 08 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
        if (PlayerController != None) {                                         //004A : 07 1D 01 77 00 B8 40 08 1B 2A 16 
          if (Len(mPlayerName.GetText()) != 0) {                                //0055 : 07 96 00 9B 7D 19 01 E0 92 89 19 06 00 00 1B 92 0C 00 00 16 16 25 16 
            PlayerController.GroupingGuilds.GuildInvite(mPlayerName.GetText()); //006C : 19 19 00 B8 40 08 1B 05 00 04 01 C8 A2 1B 11 15 00 00 1B 14 0F 00 00 19 01 E0 92 89 19 06 00 00 1B 92 0C 00 00 16 16 
          } else {                                                              //0093 : 06 1D 01 
            mbHandle = mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.ErrorDOT.Text,Class'SBGuiStrings'.default.Please_enter_the_player_name_.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,0,self);//0096 : 0F 00 78 69 33 26 19 01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 C6 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 C6 99 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 
            mDesktop.BringToTop(mDesktop.GetWindow(mbHandle));                  //00FA : 19 01 48 0C 9D 19 1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 78 69 33 26 16 16 
          }
        }
        break;                                                                  //011D : 06 84 01 
      case 2 :                                                                  //0120 : 0A 81 01 2C 02 
        mDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.65,Class'GUI_BaseDesktop'.2);//0125 : 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 41 12 20 00 68 D7 00 02 00 04 2C 02 16 
        PlayerController = Game_PlayerController(GetPlayerController());        //014A : 0F 00 B8 40 08 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
        if (PlayerController != None) {                                         //015B : 07 7E 01 77 00 B8 40 08 1B 2A 16 
          PlayerController.GroupingGuilds.GuildLeave();                         //0166 : 19 19 00 B8 40 08 1B 05 00 04 01 C8 A2 1B 11 06 00 00 1B 23 1C 00 00 16 
        }
        break;                                                                  //017E : 06 84 01 
      default:                                                                  //0181 : 0A FF FF 
    }
    return True;                                                                //0184 : 04 27 
    //05 04 19 00 38 F9 35 26 05 00 04 01 58 90 31 16 0A 20 01 26 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 
    //00 00 12 20 00 68 D7 00 02 00 04 2C 41 12 20 00 68 D7 00 02 00 04 2C 02 16 0F 00 B8 40 08 1B 2E 
    //90 18 5B 01 1B 0E 2F 00 00 16 07 1D 01 77 00 B8 40 08 1B 2A 16 07 96 00 9B 7D 19 01 E0 92 89 19 
    //06 00 00 1B 92 0C 00 00 16 16 25 16 19 19 00 B8 40 08 1B 05 00 04 01 C8 A2 1B 11 15 00 00 1B 14 
    //0F 00 00 19 01 E0 92 89 19 06 00 00 1B 92 0C 00 00 16 16 06 1D 01 0F 00 78 69 33 26 19 01 48 0C 
    //9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 98 C6 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 C6 99 19 
    //9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 19 01 48 0C 9D 19 
    //1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 78 69 33 26 16 16 06 84 01 
    //0A 81 01 2C 02 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 41 12 20 
    //00 68 D7 00 02 00 04 2C 02 16 0F 00 B8 40 08 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 7E 01 77 00 
    //B8 40 08 1B 2A 16 19 19 00 B8 40 08 1B 05 00 04 01 C8 A2 1B 11 06 00 00 1B 23 1C 00 00 16 06 84 
    //01 0A FF FF 04 27 04 0B 47 
  }


  function FillGuildListView() {
    //04 0B 47 
  }


  function UpdateMember(string Name,string Online) {
    local int i;
    local array<string> TempInfo;
    i = 0;                                                                      //0000 : 0F 00 A0 34 04 1B 25 
    while (i < mGuildListView.GetRowCount()) {                                  //0007 : 07 65 00 96 00 A0 34 04 1B 19 01 30 20 2B 26 06 00 04 1B 43 98 00 00 16 16 
      if (mGuildListView.GetRowText(0,i) == Name) {                             //0020 : 07 5B 00 7A 19 01 30 20 2B 26 0C 00 00 1B 93 98 00 00 25 00 A0 34 04 1B 16 00 88 76 33 26 16 
        mGuildListView.SetText(1,i,Online);                                     //003F : 19 01 30 20 2B 26 11 00 00 1B 13 98 00 00 26 00 A0 34 04 1B 00 70 6D 33 26 16 
        return;                                                                 //0059 : 04 0B 
      }
      i++;                                                                      //005B : A5 00 A0 34 04 1B 16 
    }
    TempInfo[0] = Name;                                                         //0065 : 0F 10 25 00 60 4B 07 1B 00 88 76 33 26 
    TempInfo[1] = Online;                                                       //0072 : 0F 10 26 00 60 4B 07 1B 00 70 6D 33 26 
    mGuildListView.AddRowTexts(0,TempInfo);                                     //007F : 19 01 30 20 2B 26 0C 00 04 1B C6 98 00 00 25 00 60 4B 07 1B 16 
    //0F 00 A0 34 04 1B 25 07 65 00 96 00 A0 34 04 1B 19 01 30 20 2B 26 06 00 04 1B 43 98 00 00 16 16 
    //07 5B 00 7A 19 01 30 20 2B 26 0C 00 00 1B 93 98 00 00 25 00 A0 34 04 1B 16 00 88 76 33 26 16 19 
    //01 30 20 2B 26 11 00 00 1B 13 98 00 00 26 00 A0 34 04 1B 00 70 6D 33 26 16 04 0B A5 00 A0 34 04 
    //1B 16 06 07 00 0F 10 25 00 60 4B 07 1B 00 88 76 33 26 0F 10 26 00 60 4B 07 1B 00 70 6D 33 26 19 
    //01 30 20 2B 26 0C 00 04 1B C6 98 00 00 25 00 60 4B 07 1B 16 04 0B 47 
  }


  function RemoveMember(string Name) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 10 32 04 1B 25 
    while (i < mGuildListView.GetRowCount()) {                                  //0007 : 07 5F 00 96 00 10 32 04 1B 19 01 30 20 2B 26 06 00 04 1B 43 98 00 00 16 16 
      if (mGuildListView.GetRowText(0,i) == Name) {                             //0020 : 07 55 00 7A 19 01 30 20 2B 26 0C 00 00 1B 93 98 00 00 25 00 10 32 04 1B 16 00 B0 F9 35 26 16 
        mGuildListView.RemoveRow(i);                                            //003F : 19 01 30 20 2B 26 0B 00 00 1B 3F 99 00 00 00 10 32 04 1B 16 
        return;                                                                 //0053 : 04 0B 
      }
      i++;                                                                      //0055 : A5 00 10 32 04 1B 16 
    }
    //0F 00 10 32 04 1B 25 07 5F 00 96 00 10 32 04 1B 19 01 30 20 2B 26 06 00 04 1B 43 98 00 00 16 16 
    //07 55 00 7A 19 01 30 20 2B 26 0C 00 00 1B 93 98 00 00 25 00 10 32 04 1B 16 00 B0 F9 35 26 16 19 
    //01 30 20 2B 26 0B 00 00 1B 3F 99 00 00 00 10 32 04 1B 16 04 0B A5 00 10 32 04 1B 16 06 07 00 04 
    //0B 47 
  }


  function RemoveAllMembers() {
    mGuildListView.RemoveAllRows();                                             //0000 : 19 01 30 20 2B 26 06 00 00 1B 54 98 00 00 16 
    //19 01 30 20 2B 26 06 00 00 1B 54 98 00 00 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    mActionsPage = CreatePage("GUI_Page",524288 | 262144,0,11,GetClientHeight() - 75,GetClientWidth() - 22,40);//0006 : 0F 01 D0 4B 08 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 9E 1D 00 00 08 00 1D 00 00 04 00 16 25 2C 0B 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 4B 16 39 44 AF 1B 17 98 00 00 16 39 3F 2C 16 16 2C 28 16 
    mActionsPage.SetBorder(3,3,3,3,"windowsizableframe");                       //0049 : 19 01 D0 4B 08 1B 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    mLabelPlayerName = mActionsPage.CreateLabel("GUI_Label",0,256 | 4096,1,7,86,24);//0074 : 0F 01 20 86 33 26 19 01 D0 4B 08 1B 25 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 01 00 00 1D 00 10 00 00 16 26 2C 07 2C 56 2C 18 16 
    mLabelPlayerName.SetText(Class'SBGuiStrings'.default.Playername_.Text);     //00A8 : 19 01 20 86 33 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 C5 99 19 16 
    mPlayerName = mActionsPage.CreateEditBox("GUI_EditBox",Class'GUI_BaseDesktop'.4194304,0,85,1,230,34);//00CA : 0F 01 E0 92 89 19 19 01 D0 4B 08 1B 29 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 12 20 00 68 D7 00 05 00 04 1D 00 00 40 00 25 2C 55 26 2C E6 2C 22 16 
    mPlayerName.SetBackground("textfield","SBGuiTX.GUI_Styles","GUI_Styles");   //0102 : 19 01 E0 92 89 19 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mPlayerName.mTabIndex = 0;                                                  //013C : 0F 19 01 E0 92 89 19 05 00 04 01 E0 8F 31 16 25 
    mPlayerName.mIntTag = 0;                                                    //014C : 0F 19 01 E0 92 89 19 05 00 04 01 58 90 31 16 25 
    mPlayerName.SetColor(219.00000000,206.00000000,186.00000000);               //015C : 19 01 E0 92 89 19 15 00 00 1B 19 98 00 00 1E 00 00 5B 43 1E 00 00 4E 43 1E 00 00 3A 43 16 
    mButtonLeave = mActionsPage.CreateButton("GUI_Button",4194304,2,GetClientWidth() - 140,5,105);//017A : 0F 01 C8 48 08 1B 19 01 D0 4B 08 1B 2B 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 39 44 AF 1B 17 98 00 00 16 39 3F 2C 8C 16 2C 05 2C 69 16 
    mButtonLeave.SetText("Leave guild");                                        //01B4 : 19 01 C8 48 08 1B 13 00 00 1B 13 98 00 00 1F 4C 65 61 76 65 20 67 75 69 6C 64 00 16 
    mButtonLeave.SetTextBorder(0.00000000,3.00000000);                          //01D0 : 19 01 C8 48 08 1B 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mButtonLeave.mIntTag = 2;                                                   //01E9 : 0F 19 01 C8 48 08 1B 05 00 04 01 58 90 31 16 2C 02 
    mButtonLeave.mTabIndex = 2;                                                 //01FA : 0F 19 01 C8 48 08 1B 05 00 04 01 E0 8F 31 16 2C 02 
    mButtonLeave.__OnClick__Delegate = ClickHandler;                            //020B : 45 19 01 C8 48 08 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mButtonInvite = mActionsPage.CreateButton("GUI_Button",4194304,2,GetClientWidth() - 330,5,105);//021F : 0F 01 E0 4A 08 1B 19 01 D0 4B 08 1B 2E 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 39 44 AF 1B 17 98 00 00 16 39 3F 1D 4A 01 00 00 16 2C 05 2C 69 16 
    mButtonInvite.SetText("Invite player");                                     //025C : 19 01 E0 4A 08 1B 15 00 00 1B 13 98 00 00 1F 49 6E 76 69 74 65 20 70 6C 61 79 65 72 00 16 
    mButtonInvite.SetTextBorder(0.00000000,3.00000000);                         //027A : 19 01 E0 4A 08 1B 10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 
    mButtonInvite.mIntTag = 1;                                                  //0293 : 0F 19 01 E0 4A 08 1B 05 00 04 01 58 90 31 16 26 
    mButtonInvite.mTabIndex = 1;                                                //02A3 : 0F 19 01 E0 4A 08 1B 05 00 04 01 E0 8F 31 16 26 
    mButtonInvite.__OnClick__Delegate = ClickHandler;                           //02B3 : 45 19 01 E0 4A 08 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mGuildListView = CreateListView("GUI_ListView",4194304,0,4,4,GetClientWidth() - 8,GetClientHeight() - 85);//02C7 : 0F 01 30 20 2B 26 1B 77 99 00 00 1F 47 55 49 5F 4C 69 73 74 56 69 65 77 00 1D 00 00 40 00 25 2C 04 2C 04 39 44 AF 1B 17 98 00 00 16 39 3F 2C 08 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 55 16 16 
    mGuildListView.SetAnchors(0.00000000,0.00000000,1.00000000,1.00000000);     //0307 : 19 01 30 20 2B 26 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 
    mGuildListView.AddColumn(Class'SBGuiStrings'.default.CharName.Text,1,450);  //032A : 19 01 30 20 2B 26 1F 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 93 97 19 26 1D C2 01 00 00 16 
    mGuildListView.AddColumn(Class'SBGuiStrings'.default.On_offline.Text,1,118);//0352 : 19 01 30 20 2B 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 FB 98 19 26 2C 76 16 
    FillGuildListView();                                                        //0377 : 1B 3A 9B 00 00 16 
    //1C 40 5B 9E 19 16 0F 01 D0 4B 08 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 9E 1D 00 00 08 
    //00 1D 00 00 04 00 16 25 2C 0B 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 4B 16 39 44 AF 1B 17 98 00 00 
    //16 39 3F 2C 16 16 2C 28 16 19 01 D0 4B 08 1B 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 
    //77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 0F 01 20 86 33 26 19 01 D0 4B 08 1B 
    //25 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 01 00 00 1D 00 10 00 00 16 
    //26 2C 07 2C 56 2C 18 16 19 01 20 86 33 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 A8 C5 99 19 16 0F 01 E0 92 89 19 19 01 D0 4B 08 1B 29 00 04 1B 60 98 00 00 1F 47 
    //55 49 5F 45 64 69 74 42 6F 78 00 12 20 00 68 D7 00 05 00 04 1D 00 00 40 00 25 2C 55 26 2C E6 2C 
    //22 16 19 01 E0 92 89 19 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 
    //69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 19 01 E0 
    //92 89 19 05 00 04 01 E0 8F 31 16 25 0F 19 01 E0 92 89 19 05 00 04 01 58 90 31 16 25 19 01 E0 92 
    //89 19 15 00 00 1B 19 98 00 00 1E 00 00 5B 43 1E 00 00 4E 43 1E 00 00 3A 43 16 0F 01 C8 48 08 1B 
    //19 01 D0 4B 08 1B 2B 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 
    //02 39 44 AF 1B 17 98 00 00 16 39 3F 2C 8C 16 2C 05 2C 69 16 19 01 C8 48 08 1B 13 00 00 1B 13 98 
    //00 00 1F 4C 65 61 76 65 20 67 75 69 6C 64 00 16 19 01 C8 48 08 1B 10 00 00 1B 49 98 00 00 1E 00 
    //00 00 00 1E 00 00 40 40 16 0F 19 01 C8 48 08 1B 05 00 04 01 58 90 31 16 2C 02 0F 19 01 C8 48 08 
    //1B 05 00 04 01 E0 8F 31 16 2C 02 45 19 01 C8 48 08 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 
    //01 E0 4A 08 1B 19 01 D0 4B 08 1B 2E 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 
    //00 00 40 00 2C 02 39 44 AF 1B 17 98 00 00 16 39 3F 1D 4A 01 00 00 16 2C 05 2C 69 16 19 01 E0 4A 
    //08 1B 15 00 00 1B 13 98 00 00 1F 49 6E 76 69 74 65 20 70 6C 61 79 65 72 00 16 19 01 E0 4A 08 1B 
    //10 00 00 1B 49 98 00 00 1E 00 00 00 00 1E 00 00 40 40 16 0F 19 01 E0 4A 08 1B 05 00 04 01 58 90 
    //31 16 26 0F 19 01 E0 4A 08 1B 05 00 04 01 E0 8F 31 16 26 45 19 01 E0 4A 08 1B 05 00 08 01 98 EB 
    //9D 19 44 21 98 00 00 0F 01 30 20 2B 26 1B 77 99 00 00 1F 47 55 49 5F 4C 69 73 74 56 69 65 77 00 
    //1D 00 00 40 00 25 2C 04 2C 04 39 44 AF 1B 17 98 00 00 16 39 3F 2C 08 16 39 44 AF 1B 1F 98 00 00 
    //16 39 3F 2C 55 16 16 19 01 30 20 2B 26 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 
    //00 00 80 3F 1E 00 00 80 3F 16 19 01 30 20 2B 26 1F 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 70 93 97 19 26 1D C2 01 00 00 16 19 01 30 20 2B 26 1C 00 04 1B 30 98 00 00 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 FB 98 19 26 2C 76 16 1B 3A 9B 00 00 16 04 0B 47 
    //
  }



