//==============================================================================
//  HUD_Guildlist_RankTab
//==============================================================================

class HUD_Guildlist_RankTab extends GUI_Page
    exportstructs
    dependsOn(GUI_ListView,Game_PlayerController,Game_PlayerGuilds,Class,HUD_Guildlist_RankRightsPage,GUI_Button,GUI_EditBox,GUI_Desktop,SBGuiStrings,GUI_BaseDesktop,GUI_Label)
    Transient
    Config(User)
  ;

  var GUI_Page mRankListingPage;
  var GUI_ListView mRankListView;
  var GUI_Page mRanksEditPage;
  var GUI_Label mLabelRankName;
  var GUI_EditBox mEditBoxRankName;
  var GUI_Label mLabelRankLevel;
  var GUI_EditBox mEditBoxRankLevel;
  var GUI_Button mButtonAddRank;
  var GUI_Button mButtonRemoveRank;
  var HUD_Guildlist_RankRightsPage mRankRightsPage;
  var private string mSelectedRankName;
  var private int mSelectedRankLevel;


  function GuildRanksRefreshHandler() {
    local Game_PlayerController PlayerController;
    local int i;
    local array<ListViewItem> newRow;
    PlayerController = Game_PlayerController(GetPlayerController());            //0000 : 0F 00 D8 B2 2B 26 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    mRankListView.__OnSelectionChange__Delegate = None;                         //0011 : 45 19 01 80 52 2B 26 05 00 08 01 60 BF A4 19 44 00 00 00 00 
    mRankListView.SelectRow(-1);                                                //0025 : 19 01 80 52 2B 26 0B 00 00 1B 82 98 00 00 1D FF FF FF FF 16 
    mRankListView.RemoveAllRows();                                              //0039 : 19 01 80 52 2B 26 06 00 00 1B 54 98 00 00 16 
    i = 0;                                                                      //0048 : 0F 00 B0 17 2B 26 25 
    while (i < PlayerController.GroupingGuilds.mRanks.Length) {                 //004F : 07 61 01 96 00 B0 17 2B 26 37 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 16 
      if (PlayerController.GroupingGuilds.mRanks[i].Level != -1) {              //0071 : 07 57 01 9B 36 60 B8 32 11 10 00 B0 17 2B 26 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 1D FF FF FF FF 16 
        newRow.Length = 0;                                                      //009D : 0F 37 00 70 A2 05 1B 25 
        Class'GUI_ListView'.PackRowItem(newRow,"",""
          $ string(PlayerController.GroupingGuilds.mRanks[i].Level),PlayerController.GroupingGuilds.mRanks[i].Level);//00A5 : 12 20 08 64 2F 1D 57 00 00 1B 40 98 00 00 00 70 A2 05 1B 1F 00 70 1F 00 39 53 36 60 B8 32 11 10 00 B0 17 2B 26 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 16 36 60 B8 32 11 10 00 B0 17 2B 26 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 16 
        Class'GUI_ListView'.PackRowItem(newRow,"",PlayerController.GroupingGuilds.mRanks[i].Name,0);//0105 : 12 20 08 64 2F 1D 30 00 00 1B 40 98 00 00 00 70 A2 05 1B 1F 00 36 20 BE 32 11 10 00 B0 17 2B 26 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 25 16 
        mRankListView.AddRowItems(i,newRow);                                    //013E : 19 01 80 52 2B 26 10 00 04 1B 86 98 00 00 00 B0 17 2B 26 00 70 A2 05 1B 16 
      }
      i++;                                                                      //0157 : A5 00 B0 17 2B 26 16 
    }
    mRankListView.__OnSelectionChange__Delegate = RankSelectedHandler;          //0161 : 45 19 01 80 52 2B 26 05 00 08 01 60 BF A4 19 44 F0 99 00 00 
    if (mSelectedRankLevel != -1) {                                             //0175 : 07 F9 01 9B 01 D0 4A 2C 26 1D FF FF FF FF 16 
      i = 0;                                                                    //0184 : 0F 00 B0 17 2B 26 25 
      while (i < PlayerController.GroupingGuilds.mRanks.Length) {               //018B : 07 F9 01 96 00 B0 17 2B 26 37 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 16 
        if (PlayerController.GroupingGuilds.mRanks[i].Level == mSelectedRankLevel) {//01AD : 07 EF 01 9A 36 60 B8 32 11 10 00 B0 17 2B 26 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 01 D0 4A 2C 26 16 
          mRankListView.SelectRow(i);                                           //01D9 : 19 01 80 52 2B 26 0B 00 00 1B 82 98 00 00 00 B0 17 2B 26 16 
          return;                                                               //01ED : 04 0B 
        }
        i++;                                                                    //01EF : A5 00 B0 17 2B 26 16 
      }
    }
    mRankRightsPage.SetRightsEnabled(False);                                    //01F9 : 19 01 C0 BD 2B 26 07 00 00 1B C5 98 00 00 28 16 
    mRankRightsPage.SetRights(0);                                               //0209 : 19 01 C0 BD 2B 26 07 00 00 1B 4C 99 00 00 25 16 
    mSelectedRankName = "";                                                     //0219 : 0F 01 70 29 07 1B 1F 00 
    mSelectedRankLevel = -1;                                                    //0221 : 0F 01 D0 4A 2C 26 1D FF FF FF FF 
    //0F 00 D8 B2 2B 26 2E 90 18 5B 01 1B 0E 2F 00 00 16 45 19 01 80 52 2B 26 05 00 08 01 60 BF A4 19 
    //44 00 00 00 00 19 01 80 52 2B 26 0B 00 00 1B 82 98 00 00 1D FF FF FF FF 16 19 01 80 52 2B 26 06 
    //00 00 1B 54 98 00 00 16 0F 00 B0 17 2B 26 25 07 61 01 96 00 B0 17 2B 26 37 19 19 00 D8 B2 2B 26 
    //05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 16 07 57 01 9B 36 60 B8 32 11 10 00 B0 17 2B 26 
    //19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 1D FF FF FF FF 16 0F 37 00 
    //70 A2 05 1B 25 12 20 08 64 2F 1D 57 00 00 1B 40 98 00 00 00 70 A2 05 1B 1F 00 70 1F 00 39 53 36 
    //60 B8 32 11 10 00 B0 17 2B 26 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 
    //11 16 36 60 B8 32 11 10 00 B0 17 2B 26 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 
    //E8 B7 32 11 16 12 20 08 64 2F 1D 30 00 00 1B 40 98 00 00 00 70 A2 05 1B 1F 00 36 20 BE 32 11 10 
    //00 B0 17 2B 26 19 19 00 D8 B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 25 16 19 01 
    //80 52 2B 26 10 00 04 1B 86 98 00 00 00 B0 17 2B 26 00 70 A2 05 1B 16 A5 00 B0 17 2B 26 16 06 4F 
    //00 45 19 01 80 52 2B 26 05 00 08 01 60 BF A4 19 44 F0 99 00 00 07 F9 01 9B 01 D0 4A 2C 26 1D FF 
    //FF FF FF 16 0F 00 B0 17 2B 26 25 07 F9 01 96 00 B0 17 2B 26 37 19 19 00 D8 B2 2B 26 05 00 04 01 
    //C8 A2 1B 11 05 00 00 01 E8 B7 32 11 16 07 EF 01 9A 36 60 B8 32 11 10 00 B0 17 2B 26 19 19 00 D8 
    //B2 2B 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 01 D0 4A 2C 26 16 19 01 80 52 2B 26 0B 
    //00 00 1B 82 98 00 00 00 B0 17 2B 26 16 04 0B A5 00 B0 17 2B 26 16 06 8B 01 19 01 C0 BD 2B 26 07 
    //00 00 1B C5 98 00 00 28 16 19 01 C0 BD 2B 26 07 00 00 1B 4C 99 00 00 25 16 0F 01 70 29 07 1B 1F 
    //00 0F 01 D0 4A 2C 26 1D FF FF FF FF 04 0B 47 
  }


  function RightsChangedHandler(int newRights) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(GetPlayerController());            //0000 : 0F 00 88 A4 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //0011 : 07 8E 00 77 00 88 A4 05 1B 2A 16 
      if (PlayerController.GroupingGuilds.AllowRights(Class'Game_PlayerGuilds'.2097152)) {//001C : 07 8E 00 19 19 00 88 A4 05 1B 05 00 04 01 C8 A2 1B 11 14 00 04 1B 14 1C 00 00 12 20 70 BA 60 01 05 00 04 1D 00 00 20 00 16 
        if (mSelectedRankLevel == 10) {                                         //0045 : 07 6C 00 9A 01 D0 4A 2C 26 2C 0A 16 
          newRights = newRights | Class'Game_PlayerGuilds'.2097152;             //0051 : 0F 00 E0 FD 06 1B 9E 00 E0 FD 06 1B 12 20 70 BA 60 01 05 00 04 1D 00 00 20 00 16 
        }
        PlayerController.GroupingGuilds.GuildRankSetRights(mSelectedRankLevel,newRights);//006C : 19 19 00 88 A4 05 1B 05 00 04 01 C8 A2 1B 11 10 00 00 1B 1B 1C 00 00 01 D0 4A 2C 26 00 E0 FD 06 1B 16 
      }
    }
    //0F 00 88 A4 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 8E 00 77 00 88 A4 05 1B 2A 16 07 8E 00 19 
    //19 00 88 A4 05 1B 05 00 04 01 C8 A2 1B 11 14 00 04 1B 14 1C 00 00 12 20 70 BA 60 01 05 00 04 1D 
    //00 00 20 00 16 07 6C 00 9A 01 D0 4A 2C 26 2C 0A 16 0F 00 E0 FD 06 1B 9E 00 E0 FD 06 1B 12 20 70 
    //BA 60 01 05 00 04 1D 00 00 20 00 16 19 19 00 88 A4 05 1B 05 00 04 01 C8 A2 1B 11 10 00 00 1B 1B 
    //1C 00 00 01 D0 4A 2C 26 00 E0 FD 06 1B 16 04 0B 47 
  }


  function RankSelectedHandler(GUI_ListView sender,int aNewSelectionIndex) {
    local Game_PlayerController PlayerController;
    aNewSelectionIndex = mRankListView.GetSelectedRowId();                      //0000 : 0F 00 98 3C 04 1B 19 01 80 52 2B 26 06 00 04 1B 63 98 00 00 16 
    if (aNewSelectionIndex != -1) {                                             //0015 : 07 A0 01 9B 00 98 3C 04 1B 1D FF FF FF FF 16 
      PlayerController = Game_PlayerController(GetPlayerController());          //0024 : 0F 00 98 E3 2C 26 2E 90 18 5B 01 1B 0E 2F 00 00 16 
      if (PlayerController != None) {                                           //0035 : 07 9D 01 77 00 98 E3 2C 26 2A 16 
        mSelectedRankName = PlayerController.GroupingGuilds.mRanks[aNewSelectionIndex].Name;//0040 : 0F 01 70 29 07 1B 36 20 BE 32 11 10 00 98 3C 04 1B 19 19 00 98 E3 2C 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 
        mSelectedRankLevel = PlayerController.GroupingGuilds.mRanks[aNewSelectionIndex].Level;//0068 : 0F 01 D0 4A 2C 26 36 60 B8 32 11 10 00 98 3C 04 1B 19 19 00 98 E3 2C 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 
        mRankRightsPage.SetRights(PlayerController.GroupingGuilds.mRanks[aNewSelectionIndex].Rights);//0090 : 19 01 C0 BD 2B 26 28 00 00 1B 4C 99 00 00 36 50 B9 32 11 10 00 98 3C 04 1B 19 19 00 98 E3 2C 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 16 
        if (PlayerController.GroupingGuilds.AllowRights(Class'Game_PlayerGuilds'.2097152)
          && mSelectedRankLevel != 1
          && mSelectedRankLevel != 9
          && mSelectedRankLevel != 10) {//00C1 : 07 26 01 82 82 82 19 19 00 98 E3 2C 26 05 00 04 01 C8 A2 1B 11 14 00 04 1B 14 1C 00 00 12 20 70 BA 60 01 05 00 04 1D 00 00 20 00 16 18 09 00 9B 01 D0 4A 2C 26 26 16 16 18 0A 00 9B 01 D0 4A 2C 26 2C 09 16 16 18 0A 00 9B 01 D0 4A 2C 26 2C 0A 16 16 
          mRankRightsPage.SetRightsEnabled(True);                               //0113 : 19 01 C0 BD 2B 26 07 00 00 1B C5 98 00 00 27 16 
        } else {                                                                //0123 : 06 36 01 
          mRankRightsPage.SetRightsEnabled(False);                              //0126 : 19 01 C0 BD 2B 26 07 00 00 1B C5 98 00 00 28 16 
        }
        if (mSelectedRankLevel > 1 && mSelectedRankLevel < 9
          && PlayerController.GroupingGuilds.AllowRights(Class'Game_PlayerGuilds'.2097152)) {//0136 : 07 8D 01 82 82 97 01 D0 4A 2C 26 26 16 18 0A 00 96 01 D0 4A 2C 26 2C 09 16 16 18 27 00 19 19 00 98 E3 2C 26 05 00 04 01 C8 A2 1B 11 14 00 04 1B 14 1C 00 00 12 20 70 BA 60 01 05 00 04 1D 00 00 20 00 16 16 
          mButtonRemoveRank.SetEnabled(True);                                   //017A : 19 01 D8 A4 2B 26 07 00 00 1B 5F 32 00 00 27 16 
        } else {                                                                //018A : 06 9D 01 
          mButtonRemoveRank.SetEnabled(False);                                  //018D : 19 01 D8 A4 2B 26 07 00 00 1B 5F 32 00 00 28 16 
        }
      }
    } else {                                                                    //019D : 06 E3 01 
      mButtonRemoveRank.SetEnabled(False);                                      //01A0 : 19 01 D8 A4 2B 26 07 00 00 1B 5F 32 00 00 28 16 
      mRankRightsPage.SetRightsEnabled(False);                                  //01B0 : 19 01 C0 BD 2B 26 07 00 00 1B C5 98 00 00 28 16 
      mRankRightsPage.SetRights(0);                                             //01C0 : 19 01 C0 BD 2B 26 07 00 00 1B 4C 99 00 00 25 16 
      mSelectedRankName = "";                                                   //01D0 : 0F 01 70 29 07 1B 1F 00 
      mSelectedRankLevel = -1;                                                  //01D8 : 0F 01 D0 4A 2C 26 1D FF FF FF FF 
    }
    //0F 00 98 3C 04 1B 19 01 80 52 2B 26 06 00 04 1B 63 98 00 00 16 07 A0 01 9B 00 98 3C 04 1B 1D FF 
    //FF FF FF 16 0F 00 98 E3 2C 26 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 9D 01 77 00 98 E3 2C 26 2A 16 
    //0F 01 70 29 07 1B 36 20 BE 32 11 10 00 98 3C 04 1B 19 19 00 98 E3 2C 26 05 00 04 01 C8 A2 1B 11 
    //05 00 00 01 E8 B7 32 11 0F 01 D0 4A 2C 26 36 60 B8 32 11 10 00 98 3C 04 1B 19 19 00 98 E3 2C 26 
    //05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 19 01 C0 BD 2B 26 28 00 00 1B 4C 99 00 00 36 50 
    //B9 32 11 10 00 98 3C 04 1B 19 19 00 98 E3 2C 26 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 
    //16 07 26 01 82 82 82 19 19 00 98 E3 2C 26 05 00 04 01 C8 A2 1B 11 14 00 04 1B 14 1C 00 00 12 20 
    //70 BA 60 01 05 00 04 1D 00 00 20 00 16 18 09 00 9B 01 D0 4A 2C 26 26 16 16 18 0A 00 9B 01 D0 4A 
    //2C 26 2C 09 16 16 18 0A 00 9B 01 D0 4A 2C 26 2C 0A 16 16 19 01 C0 BD 2B 26 07 00 00 1B C5 98 00 
    //00 27 16 06 36 01 19 01 C0 BD 2B 26 07 00 00 1B C5 98 00 00 28 16 07 8D 01 82 82 97 01 D0 4A 2C 
    //26 26 16 18 0A 00 96 01 D0 4A 2C 26 2C 09 16 16 18 27 00 19 19 00 98 E3 2C 26 05 00 04 01 C8 A2 
    //1B 11 14 00 04 1B 14 1C 00 00 12 20 70 BA 60 01 05 00 04 1D 00 00 20 00 16 16 19 01 D8 A4 2B 26 
    //07 00 00 1B 5F 32 00 00 27 16 06 9D 01 19 01 D8 A4 2B 26 07 00 00 1B 5F 32 00 00 28 16 06 E3 01 
    //19 01 D8 A4 2B 26 07 00 00 1B 5F 32 00 00 28 16 19 01 C0 BD 2B 26 07 00 00 1B C5 98 00 00 28 16 
    //19 01 C0 BD 2B 26 07 00 00 1B 4C 99 00 00 25 16 0F 01 70 29 07 1B 1F 00 0F 01 D0 4A 2C 26 1D FF 
    //FF FF FF 04 0B 47 
  }


  function bool RemoveRankButtonClickHandler(GUI_Component clickedButton) {
    local Game_PlayerController PlayerController;
    if (mSelectedRankLevel == -1) {                                             //0000 : 07 11 00 9A 01 D0 4A 2C 26 1D FF FF FF FF 16 
      return False;                                                             //000F : 04 28 
    }
    PlayerController = Game_PlayerController(GetPlayerController());            //0011 : 0F 00 20 01 07 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //0022 : 07 4A 00 77 00 20 01 07 1B 2A 16 
      PlayerController.GroupingGuilds.GuildRankDelete(mSelectedRankLevel);      //002D : 19 19 00 20 01 07 1B 05 00 04 01 C8 A2 1B 11 0B 00 00 1B 1D 1C 00 00 01 D0 4A 2C 26 16 
    }
    return True;                                                                //004A : 04 27 
    //07 11 00 9A 01 D0 4A 2C 26 1D FF FF FF FF 16 04 28 0F 00 20 01 07 1B 2E 90 18 5B 01 1B 0E 2F 00 
    //00 16 07 4A 00 77 00 20 01 07 1B 2A 16 19 19 00 20 01 07 1B 05 00 04 01 C8 A2 1B 11 0B 00 00 1B 
    //1D 1C 00 00 01 D0 4A 2C 26 16 04 27 04 0B 47 
  }


  function bool AddRankButtonClickHandler(GUI_Component clickedButton) {
    local Game_PlayerController PlayerController;
    local int RankLevel;
    local int mbHandle;
    RankLevel = int(mEditBoxRankLevel.GetText());                               //0000 : 0F 00 78 3E 04 1B 39 4A 19 01 10 0C 2B 26 06 00 00 1B 92 0C 00 00 16 
    if (("" $ string(RankLevel)) != mEditBoxRankLevel.GetText()) {              //0017 : 07 DD 00 7B 70 1F 00 39 53 00 78 3E 04 1B 16 19 01 10 0C 2B 26 06 00 00 1B 92 0C 00 00 16 16 
      mbHandle = mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Add_Rank.Text,Class'SBGuiStrings'.default.Rank_level_must_be_a_numeric_value_.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,0,self);//0036 : 0F 00 A8 46 04 1B 19 01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 A1 31 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 A2 31 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 
      mDesktop.BringToTop(mDesktop.GetWindow(mbHandle));                        //009A : 19 01 48 0C 9D 19 1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 A8 46 04 1B 16 16 
      mEditBoxRankName.Clear();                                                 //00BD : 19 01 58 3E 2B 26 06 00 00 1B A8 12 00 00 16 
      mEditBoxRankLevel.Clear();                                                //00CC : 19 01 10 0C 2B 26 06 00 00 1B A8 12 00 00 16 
      return False;                                                             //00DB : 04 28 
    }
    if (RankLevel < 2 || RankLevel > 9) {                                       //00DD : 07 9E 01 84 96 00 78 3E 04 1B 2C 02 16 18 0A 00 97 00 78 3E 04 1B 2C 09 16 16 
      mbHandle = mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Add_Rank.Text,Class'SBGuiStrings'.default.Rank_level_must_be_above_1_and_under_10.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,0,self);//00F7 : 0F 00 A8 46 04 1B 19 01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 A1 31 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 A2 31 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 
      mDesktop.BringToTop(mDesktop.GetWindow(mbHandle));                        //015B : 19 01 48 0C 9D 19 1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 A8 46 04 1B 16 16 
      mEditBoxRankName.Clear();                                                 //017E : 19 01 58 3E 2B 26 06 00 00 1B A8 12 00 00 16 
      mEditBoxRankLevel.Clear();                                                //018D : 19 01 10 0C 2B 26 06 00 00 1B A8 12 00 00 16 
      return False;                                                             //019C : 04 28 
    }
    PlayerController = Game_PlayerController(GetPlayerController());            //019E : 0F 00 00 AC 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //01AF : 07 CA 02 77 00 00 AC 05 1B 2A 16 
      if (PlayerController.GroupingGuilds.mRanks.Length >= 10) {                //01BA : 07 80 02 99 37 19 19 00 00 AC 05 1B 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 2C 0A 16 
        mbHandle = mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Add_Rank.Text,Class'SBGuiStrings'.default.Maximum_amount_of_ranks_10_exceeded.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,0,self);//01D9 : 0F 00 A8 46 04 1B 19 01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 A1 31 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 A3 31 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 
        mDesktop.BringToTop(mDesktop.GetWindow(mbHandle));                      //023D : 19 01 48 0C 9D 19 1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 A8 46 04 1B 16 16 
        mEditBoxRankName.Clear();                                               //0260 : 19 01 58 3E 2B 26 06 00 00 1B A8 12 00 00 16 
        mEditBoxRankLevel.Clear();                                              //026F : 19 01 10 0C 2B 26 06 00 00 1B A8 12 00 00 16 
        return False;                                                           //027E : 04 28 
      }
      PlayerController.GroupingGuilds.GuildRankSet(RankLevel,mEditBoxRankName.GetText());//0280 : 19 19 00 00 AC 05 1B 05 00 04 01 C8 A2 1B 11 1A 00 00 1B 20 1C 00 00 00 78 3E 04 1B 19 01 58 3E 2B 26 06 00 00 1B 92 0C 00 00 16 16 
      mEditBoxRankName.Clear();                                                 //02AC : 19 01 58 3E 2B 26 06 00 00 1B A8 12 00 00 16 
      mEditBoxRankLevel.Clear();                                                //02BB : 19 01 10 0C 2B 26 06 00 00 1B A8 12 00 00 16 
    }
    return True;                                                                //02CA : 04 27 
    //0F 00 78 3E 04 1B 39 4A 19 01 10 0C 2B 26 06 00 00 1B 92 0C 00 00 16 07 DD 00 7B 70 1F 00 39 53 
    //00 78 3E 04 1B 16 19 01 10 0C 2B 26 06 00 00 1B 92 0C 00 00 16 16 0F 00 A8 46 04 1B 19 01 48 0C 
    //9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 70 A1 31 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 A2 31 16 
    //9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 19 01 48 0C 9D 19 
    //1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 A8 46 04 1B 16 16 19 01 58 
    //3E 2B 26 06 00 00 1B A8 12 00 00 16 19 01 10 0C 2B 26 06 00 00 1B A8 12 00 00 16 04 28 07 9E 01 
    //84 96 00 78 3E 04 1B 2C 02 16 18 0A 00 97 00 78 3E 04 1B 2C 09 16 16 0F 00 A8 46 04 1B 19 01 48 
    //0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 70 A1 31 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 A2 31 
    //16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 19 01 48 0C 9D 
    //19 1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 A8 46 04 1B 16 16 19 01 
    //58 3E 2B 26 06 00 00 1B A8 12 00 00 16 19 01 10 0C 2B 26 06 00 00 1B A8 12 00 00 16 04 28 0F 00 
    //00 AC 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 CA 02 77 00 00 AC 05 1B 2A 16 07 80 02 99 37 19 
    //19 00 00 AC 05 1B 05 00 04 01 C8 A2 1B 11 05 00 00 01 E8 B7 32 11 2C 0A 16 0F 00 A8 46 04 1B 19 
    //01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 A1 31 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 
    //A3 31 16 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 19 01 48 
    //0C 9D 19 1A 00 00 1B 3E 98 00 00 19 01 48 0C 9D 19 0B 00 04 1B 1E 98 00 00 00 A8 46 04 1B 16 16 
    //19 01 58 3E 2B 26 06 00 00 1B A8 12 00 00 16 19 01 10 0C 2B 26 06 00 00 1B A8 12 00 00 16 04 28 
    //19 19 00 00 AC 05 1B 05 00 04 01 C8 A2 1B 11 1A 00 00 1B 20 1C 00 00 00 78 3E 04 1B 19 01 58 3E 
    //2B 26 06 00 00 1B 92 0C 00 00 16 16 19 01 58 3E 2B 26 06 00 00 1B A8 12 00 00 16 19 01 10 0C 2B 
    //26 06 00 00 1B A8 12 00 00 16 04 27 04 0B 47 
  }


  function SetGuildState(bool hasGuild) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(GetPlayerController());            //0000 : 0F 00 E0 11 07 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //0011 : 07 D3 00 77 00 E0 11 07 1B 2A 16 
      if (hasGuild
        && PlayerController.GroupingGuilds.AllowRights(Class'Game_PlayerGuilds'.2097152)) {//001C : 07 93 00 82 2D 00 90 F1 35 26 18 27 00 19 19 00 E0 11 07 1B 05 00 04 01 C8 A2 1B 11 14 00 04 1B 14 1C 00 00 12 20 70 BA 60 01 05 00 04 1D 00 00 20 00 16 16 
        mEditBoxRankName.SetEnabled(True);                                      //0050 : 19 01 58 3E 2B 26 07 00 00 1B 5F 32 00 00 27 16 
        mEditBoxRankLevel.SetEnabled(True);                                     //0060 : 19 01 10 0C 2B 26 07 00 00 1B 5F 32 00 00 27 16 
        mButtonAddRank.SetEnabled(True);                                        //0070 : 19 01 E0 EF 2C 26 07 00 00 1B 5F 32 00 00 27 16 
        mButtonRemoveRank.SetEnabled(False);                                    //0080 : 19 01 D8 A4 2B 26 07 00 00 1B 5F 32 00 00 28 16 
      } else {                                                                  //0090 : 06 D3 00 
        mEditBoxRankName.SetEnabled(False);                                     //0093 : 19 01 58 3E 2B 26 07 00 00 1B 5F 32 00 00 28 16 
        mEditBoxRankLevel.SetEnabled(False);                                    //00A3 : 19 01 10 0C 2B 26 07 00 00 1B 5F 32 00 00 28 16 
        mButtonAddRank.SetEnabled(False);                                       //00B3 : 19 01 E0 EF 2C 26 07 00 00 1B 5F 32 00 00 28 16 
        mButtonRemoveRank.SetEnabled(False);                                    //00C3 : 19 01 D8 A4 2B 26 07 00 00 1B 5F 32 00 00 28 16 
      }
    }
    //0F 00 E0 11 07 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 D3 00 77 00 E0 11 07 1B 2A 16 07 93 00 82 
    //2D 00 90 F1 35 26 18 27 00 19 19 00 E0 11 07 1B 05 00 04 01 C8 A2 1B 11 14 00 04 1B 14 1C 00 00 
    //12 20 70 BA 60 01 05 00 04 1D 00 00 20 00 16 16 19 01 58 3E 2B 26 07 00 00 1B 5F 32 00 00 27 16 
    //19 01 10 0C 2B 26 07 00 00 1B 5F 32 00 00 27 16 19 01 E0 EF 2C 26 07 00 00 1B 5F 32 00 00 27 16 
    //19 01 D8 A4 2B 26 07 00 00 1B 5F 32 00 00 28 16 06 D3 00 19 01 58 3E 2B 26 07 00 00 1B 5F 32 00 
    //00 28 16 19 01 10 0C 2B 26 07 00 00 1B 5F 32 00 00 28 16 19 01 E0 EF 2C 26 07 00 00 1B 5F 32 00 
    //00 28 16 19 01 D8 A4 2B 26 07 00 00 1B 5F 32 00 00 28 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    mRankListingPage = CreatePage("GUI_Page",524288,0,6,6,300,262);             //0006 : 0F 01 10 3D 04 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 2C 06 2C 06 1D 2C 01 00 00 1D 06 01 00 00 16 
    mRankListingPage.SetStdBackground(7);                                       //0030 : 19 01 10 3D 04 1B 08 00 00 1B 22 98 00 00 2C 07 16 
    mRankListView = mRankListingPage.CreateListView("GUI_ListView",4194304,0,6,6,mRankListingPage.GetClientWidth() - 12,mRankListingPage.GetClientHeight() - 12);//0041 : 0F 01 80 52 2B 26 19 01 10 3D 04 1B 4C 00 04 1B 77 99 00 00 1F 47 55 49 5F 4C 69 73 74 56 69 65 77 00 1D 00 00 40 00 25 2C 06 2C 06 39 44 AF 19 01 10 3D 04 1B 06 00 04 1B 17 98 00 00 16 39 3F 2C 0C 16 39 44 AF 19 01 10 3D 04 1B 06 00 04 1B 1F 98 00 00 16 39 3F 2C 0C 16 16 
    mRankListView.AddColumn(Class'SBGuiStrings'.default.Level.Text,0,50);       //009C : 19 01 80 52 2B 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 92 98 19 25 2C 32 16 
    mRankListView.AddColumn(Class'SBGuiStrings'.default.Current_Ranks.Text,0,206);//00C1 : 19 01 80 52 2B 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 A0 31 16 25 2C CE 16 
    mRankListView.__OnSelectionChange__Delegate = RankSelectedHandler;          //00E6 : 45 19 01 80 52 2B 26 05 00 08 01 60 BF A4 19 44 F0 99 00 00 
    mRanksEditPage = CreatePage("GUI_Page",524288,0,6,274,300,74);              //00FA : 0F 01 70 FD 8A 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 2C 06 1D 12 01 00 00 1D 2C 01 00 00 2C 4A 16 
    mRanksEditPage.SetStdBackground(7);                                         //0124 : 19 01 70 FD 8A 19 08 00 00 1B 22 98 00 00 2C 07 16 
    mLabelRankName = mRanksEditPage.CreateLabel("GUI_Label",524288,512 | 2048,3,5,45,24);//0135 : 0F 01 A0 31 07 1B 19 01 70 FD 8A 19 2A 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 9E 1D 00 02 00 00 1D 00 08 00 00 16 2C 03 2C 05 2C 2D 2C 18 16 
    mLabelRankName.SetText(Class'SBGuiStrings'.default.rank.Text
      $ ":");  //016E : 19 01 A0 31 07 1B 1E 00 00 1B 13 98 00 00 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 BF 99 19 1F 3A 00 16 16 
    mLabelRankName.SetColor(120,113,131);                                       //0195 : 19 01 A0 31 07 1B 0C 00 00 1B 19 98 00 00 2C 78 2C 71 2C 83 16 
    mEditBoxRankName = mRanksEditPage.CreateEditBox("GUI_EditBox",4194304,0,50,6,130,24);//01AA : 0F 01 58 3E 2B 26 19 01 70 FD 8A 19 21 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 1D 00 00 40 00 25 2C 32 2C 06 2C 82 2C 18 16 
    mEditBoxRankName.SetBackground("textfield","SBGuiTX.GUI_Styles","GUI_Styles");//01DA : 19 01 58 3E 2B 26 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mEditBoxRankName.SetFont("SBFontsTX.Verdana10");                            //0214 : 19 01 58 3E 2B 26 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    mEditBoxRankName.SetColor(255.00000000,255.00000000,255.00000000);          //0238 : 19 01 58 3E 2B 26 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    mEditBoxRankName.mTabIndex = 0;                                             //0256 : 0F 19 01 58 3E 2B 26 05 00 04 01 E0 8F 31 16 25 
    mLabelRankLevel = mRanksEditPage.CreateLabel("GUI_Label",524288,512 | 2048,185,5,45,24);//0266 : 0F 01 28 31 07 1B 19 01 70 FD 8A 19 2A 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 9E 1D 00 02 00 00 1D 00 08 00 00 16 2C B9 2C 05 2C 2D 2C 18 16 
    mLabelRankLevel.SetText(Class'SBGuiStrings'.default.Level.Text
      $ ":");//029F : 19 01 28 31 07 1B 1E 00 00 1B 13 98 00 00 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 92 98 19 1F 3A 00 16 16 
    mLabelRankLevel.SetColor(120,113,131);                                      //02C6 : 19 01 28 31 07 1B 0C 00 00 1B 19 98 00 00 2C 78 2C 71 2C 83 16 
    mEditBoxRankLevel = mRanksEditPage.CreateEditBox("GUI_EditBox",4194304,0,235,6,53,24);//02DB : 0F 01 10 0C 2B 26 19 01 70 FD 8A 19 21 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 1D 00 00 40 00 25 2C EB 2C 06 2C 35 2C 18 16 
    mEditBoxRankLevel.SetBackground("textfield","SBGuiTX.GUI_Styles","GUI_Styles");//030B : 19 01 10 0C 2B 26 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mEditBoxRankLevel.SetFont("SBFontsTX.Verdana10");                           //0345 : 19 01 10 0C 2B 26 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    mEditBoxRankLevel.SetColor(255.00000000,255.00000000,255.00000000);         //0369 : 19 01 10 0C 2B 26 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    mEditBoxRankLevel.mTabIndex = 1;                                            //0387 : 0F 19 01 10 0C 2B 26 05 00 04 01 E0 8F 31 16 26 
    mButtonAddRank = mRanksEditPage.CreateButton("GUI_Button",4194304,2,6,36,138,26);//0397 : 0F 01 E0 EF 2C 26 19 01 70 FD 8A 19 21 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 2C 06 2C 24 2C 8A 2C 1A 16 
    mButtonAddRank.SetText(Class'SBGuiStrings'.default.Add_Rank.Text);          //03C7 : 19 01 E0 EF 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 A1 31 16 16 
    mButtonAddRank.mIntTag = 0;                                                 //03E9 : 0F 19 01 E0 EF 2C 26 05 00 04 01 58 90 31 16 25 
    mButtonAddRank.mTabIndex = 2;                                               //03F9 : 0F 19 01 E0 EF 2C 26 05 00 04 01 E0 8F 31 16 2C 02 
    mButtonAddRank.__OnClick__Delegate = AddRankButtonClickHandler;             //040A : 45 19 01 E0 EF 2C 26 05 00 08 01 98 EB 9D 19 44 42 9B 00 00 
    mButtonRemoveRank = mRanksEditPage.CreateButton("GUI_Button",4194304,2,150,36,138,26);//041E : 0F 01 D8 A4 2B 26 19 01 70 FD 8A 19 21 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 2C 96 2C 24 2C 8A 2C 1A 16 
    mButtonRemoveRank.SetText(Class'SBGuiStrings'.default.Remove_Rank.Text);    //044E : 19 01 D8 A4 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 A1 31 16 16 
    mButtonRemoveRank.mIntTag = 1;                                              //0470 : 0F 19 01 D8 A4 2B 26 05 00 04 01 58 90 31 16 26 
    mButtonRemoveRank.mTabIndex = 3;                                            //0480 : 0F 19 01 D8 A4 2B 26 05 00 04 01 E0 8F 31 16 2C 03 
    mButtonRemoveRank.__OnClick__Delegate = RemoveRankButtonClickHandler;       //0491 : 45 19 01 D8 A4 2B 26 05 00 08 01 98 EB 9D 19 44 43 9B 00 00 
    mRankRightsPage = HUD_Guildlist_RankRightsPage(CreatePage("HUD_Guildlist_RankRightsPage",524288,0,312,6,317,342));//04A5 : 0F 01 C0 BD 2B 26 2E 40 19 8A 19 1B 16 98 00 00 1F 48 55 44 5F 47 75 69 6C 64 6C 69 73 74 5F 52 61 6E 6B 52 69 67 68 74 73 50 61 67 65 00 1D 00 00 08 00 25 1D 38 01 00 00 2C 06 1D 3D 01 00 00 1D 56 01 00 00 16 
    mRankRightsPage.SetRightsEnabled(False);                                    //04EB : 19 01 C0 BD 2B 26 07 00 00 1B C5 98 00 00 28 16 
    mRankRightsPage.__OnRightsChanged__Delegate = RightsChangedHandler;         //04FB : 45 19 01 C0 BD 2B 26 05 00 08 01 38 3D 08 1B 44 45 9B 00 00 
    mSelectedRankLevel = -1;                                                    //050F : 0F 01 D0 4A 2C 26 1D FF FF FF FF 
    GuildRanksRefreshHandler();                                                 //051A : 1B F2 99 00 00 16 
    //1C 40 5B 9E 19 16 0F 01 10 3D 04 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 
    //25 2C 06 2C 06 1D 2C 01 00 00 1D 06 01 00 00 16 19 01 10 3D 04 1B 08 00 00 1B 22 98 00 00 2C 07 
    //16 0F 01 80 52 2B 26 19 01 10 3D 04 1B 4C 00 04 1B 77 99 00 00 1F 47 55 49 5F 4C 69 73 74 56 69 
    //65 77 00 1D 00 00 40 00 25 2C 06 2C 06 39 44 AF 19 01 10 3D 04 1B 06 00 04 1B 17 98 00 00 16 39 
    //3F 2C 0C 16 39 44 AF 19 01 10 3D 04 1B 06 00 04 1B 1F 98 00 00 16 39 3F 2C 0C 16 16 19 01 80 52 
    //2B 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 92 98 19 25 2C 32 
    //16 19 01 80 52 2B 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 A0 
    //31 16 25 2C CE 16 45 19 01 80 52 2B 26 05 00 08 01 60 BF A4 19 44 F0 99 00 00 0F 01 70 FD 8A 19 
    //1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 2C 06 1D 12 01 00 00 1D 2C 01 00 
    //00 2C 4A 16 19 01 70 FD 8A 19 08 00 00 1B 22 98 00 00 2C 07 16 0F 01 A0 31 07 1B 19 01 70 FD 8A 
    //19 2A 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 9E 1D 00 02 00 00 1D 
    //00 08 00 00 16 2C 03 2C 05 2C 2D 2C 18 16 19 01 A0 31 07 1B 1E 00 00 1B 13 98 00 00 70 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 BF 99 19 1F 3A 00 16 16 19 01 A0 31 07 1B 0C 00 00 1B 19 
    //98 00 00 2C 78 2C 71 2C 83 16 0F 01 58 3E 2B 26 19 01 70 FD 8A 19 21 00 04 1B 60 98 00 00 1F 47 
    //55 49 5F 45 64 69 74 42 6F 78 00 1D 00 00 40 00 25 2C 32 2C 06 2C 82 2C 18 16 19 01 58 3E 2B 26 
    //31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 
    //53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 19 01 58 3E 2B 26 1B 00 00 1B 25 98 
    //00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 19 01 58 3E 2B 26 15 00 
    //00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 0F 19 01 58 3E 2B 26 05 00 04 
    //01 E0 8F 31 16 25 0F 01 28 31 07 1B 19 01 70 FD 8A 19 2A 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 
    //61 62 65 6C 00 1D 00 00 08 00 9E 1D 00 02 00 00 1D 00 08 00 00 16 2C B9 2C 05 2C 2D 2C 18 16 19 
    //01 28 31 07 1B 1E 00 00 1B 13 98 00 00 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 92 98 
    //19 1F 3A 00 16 16 19 01 28 31 07 1B 0C 00 00 1B 19 98 00 00 2C 78 2C 71 2C 83 16 0F 01 10 0C 2B 
    //26 19 01 70 FD 8A 19 21 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 1D 00 00 40 
    //00 25 2C EB 2C 06 2C 35 2C 18 16 19 01 10 0C 2B 26 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 
    //65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 
    //6C 65 73 00 16 19 01 10 0C 2B 26 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 
    //72 64 61 6E 61 31 30 00 16 19 01 10 0C 2B 26 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 
    //43 1E 00 00 7F 43 16 0F 19 01 10 0C 2B 26 05 00 04 01 E0 8F 31 16 26 0F 01 E0 EF 2C 26 19 01 70 
    //FD 8A 19 21 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 2C 06 
    //2C 24 2C 8A 2C 1A 16 19 01 E0 EF 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 70 A1 31 16 16 0F 19 01 E0 EF 2C 26 05 00 04 01 58 90 31 16 25 0F 19 01 E0 EF 2C 26 
    //05 00 04 01 E0 8F 31 16 2C 02 45 19 01 E0 EF 2C 26 05 00 08 01 98 EB 9D 19 44 42 9B 00 00 0F 01 
    //D8 A4 2B 26 19 01 70 FD 8A 19 21 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 
    //00 40 00 2C 02 2C 96 2C 24 2C 8A 2C 1A 16 19 01 D8 A4 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 E8 A1 31 16 16 0F 19 01 D8 A4 2B 26 05 00 04 01 58 90 31 16 26 
    //0F 19 01 D8 A4 2B 26 05 00 04 01 E0 8F 31 16 2C 03 45 19 01 D8 A4 2B 26 05 00 08 01 98 EB 9D 19 
    //44 43 9B 00 00 0F 01 C0 BD 2B 26 2E 40 19 8A 19 1B 16 98 00 00 1F 48 55 44 5F 47 75 69 6C 64 6C 
    //69 73 74 5F 52 61 6E 6B 52 69 67 68 74 73 50 61 67 65 00 1D 00 00 08 00 25 1D 38 01 00 00 2C 06 
    //1D 3D 01 00 00 1D 56 01 00 00 16 19 01 C0 BD 2B 26 07 00 00 1B C5 98 00 00 28 16 45 19 01 C0 BD 
    //2B 26 05 00 08 01 38 3D 08 1B 44 45 9B 00 00 0F 01 D0 4A 2C 26 1D FF FF FF FF 1B F2 99 00 00 16 
    //04 0B 47 
  }



