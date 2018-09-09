//==============================================================================
//  HUD_FriendIgnoreList
//==============================================================================

class HUD_FriendIgnoreList extends GUI_Window
    dependsOn(Game_PlayerController,Game_PlayerFriends,GUI_ListView,SBFriendsMember,StringReferences,GUI_TabCtrl,Game_Chat,Game_PlayerTeams,GED_Editor)
    Transient
    Config(User)
  ;

  const FL_ADD_REQUEST =  3;
  const FL_REMOVE_PLAYER =  2;
  const FL_ADD_PLAYER =  1;
  var GUI_TabCtrl mTabControl;
  var GUI_Page mFriendListTab;
  var GUI_ListView mFriendListView;
  var GUI_Page mIgnoreListTab;
  var GUI_ListView mIgnoreListView;
  var GUI_Button mAddPlayerButton;
  var GUI_Button mRemovePlayerButton;
  var GUI_Menu mFriendMenu;
  var GUI_TextButton mFriendInviteMenuItem;
  var GUI_TextButton mFriendWhisperMenuItem;
  var private string mSelectedPlayerName;
  var private int mMBHandle;
  var private string mInviteFromPawnName;


  function AddMemberReqHandler(string fromPawnName) {
    local Game_Pawn gamePawn;
    local Game_PlayerController PlayerController;
    local string messageStr;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 C8 2B 07 1B 1B 2B 0C 00 00 16 
    PlayerController = Game_PlayerController(GetPlayerController());            //000C : 0F 00 60 CC 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (gamePawn != None && PlayerController != None) {                         //001D : 07 14 01 82 77 00 C8 2B 07 1B 2A 16 18 09 00 77 00 60 CC 05 1B 2A 16 16 
      if (!mDesktop.IsPlayerBusy(gamePawn)
        && mMBHandle == 0) {         //0035 : 07 E3 00 82 81 19 01 48 0C 9D 19 0B 00 04 1B D0 96 00 00 00 C8 2B 07 1B 16 16 18 09 00 9A 01 D0 19 07 1B 25 16 16 
        mInviteFromPawnName = fromPawnName;                                     //005B : 0F 01 38 1B 07 1B 00 D8 2A 07 1B 
        messageStr = Class'SBGuiStrings'.default.Do_you_want_to_be_PLAYERNAME_s_friend_.Text;//0066 : 0F 00 40 2C 07 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 E6 9C 19 
        static.ReplaceText(messageStr,"[PLAYERNAME]",fromPawnName);             //007F : 1C 30 80 69 0F 00 40 2C 07 1B 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 D8 2A 07 1B 16 
        mMBHandle = mDesktop.CreateTrayBox("GUI_TrayBox",Class'SBGuiStrings'.default.Friend_Request.Text,messageStr,4 | 8,3,self);//009D : 0F 01 D0 19 07 1B 19 01 48 0C 9D 19 34 00 04 1B 7C 99 00 00 1F 47 55 49 5F 54 72 61 79 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 A5 31 16 00 40 2C 07 1B 9E 2C 04 2C 08 16 2C 03 17 16 
      } else {                                                                  //00E0 : 06 14 01 
        PlayerController.GroupingFriends.MemberInviteAck(fromPawnName,PlayerController.GroupingFriends.4);//00E3 : 19 19 00 60 CC 05 1B 05 00 04 01 50 A2 1B 11 1F 00 00 1B E3 1B 00 00 00 D8 2A 07 1B 19 19 00 60 CC 05 1B 05 00 04 01 50 A2 1B 11 02 00 01 24 04 16 
      }
    }
    //0F 00 C8 2B 07 1B 1B 2B 0C 00 00 16 0F 00 60 CC 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 14 01 
    //82 77 00 C8 2B 07 1B 2A 16 18 09 00 77 00 60 CC 05 1B 2A 16 16 07 E3 00 82 81 19 01 48 0C 9D 19 
    //0B 00 04 1B D0 96 00 00 00 C8 2B 07 1B 16 16 18 09 00 9A 01 D0 19 07 1B 25 16 16 0F 01 38 1B 07 
    //1B 00 D8 2A 07 1B 0F 00 40 2C 07 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 E6 9C 19 1C 
    //30 80 69 0F 00 40 2C 07 1B 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 D8 2A 07 1B 16 0F 01 D0 
    //19 07 1B 19 01 48 0C 9D 19 34 00 04 1B 7C 99 00 00 1F 47 55 49 5F 54 72 61 79 42 6F 78 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 A5 31 16 00 40 2C 07 1B 9E 2C 04 2C 08 16 2C 03 17 16 
    //06 14 01 19 19 00 60 CC 05 1B 05 00 04 01 50 A2 1B 11 1F 00 00 1B E3 1B 00 00 00 D8 2A 07 1B 19 
    //19 00 60 CC 05 1B 05 00 04 01 50 A2 1B 11 02 00 01 24 04 16 04 0B 47 
  }


  function FriendOnlineHandler() {
    mDesktop.PlaySound(Class'GUI_Sounds'.default.FriendOnline);                 //0000 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 98 39 A6 19 16 
    //19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 98 39 A6 19 16 04 0B 47 
    //
  }


  function RefreshViewHandler() {
    local int idx;
    local int row;
    local SBFriendsMember member;
    local Game_PlayerController PlayerController;
    local array<string> newRow;
    if (IsVisible() == False) {                                                 //0000 : 07 0E 00 F2 1C C0 E6 88 19 16 28 16 
      return;                                                                   //000C : 04 0B 
    }
    PlayerController = Game_PlayerController(GetPlayerController());            //000E : 0F 00 20 C9 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //001F : 07 E5 01 77 00 20 C9 05 1B 2A 16 
      mFriendListView.RemoveAllRows();                                          //002A : 19 01 E0 39 2C 26 06 00 00 1B 54 98 00 00 16 
      mIgnoreListView.RemoveAllRows();                                          //0039 : 19 01 58 E5 2B 26 06 00 00 1B 54 98 00 00 16 
      idx = 0;                                                                  //0048 : 0F 00 20 47 04 1B 25 
      while (idx < PlayerController.GroupingFriends.FriendsMembers.Length) {    //004F : 07 E5 01 96 00 20 47 04 1B 37 19 19 00 20 C9 05 1B 05 00 04 01 50 A2 1B 11 05 00 00 01 40 F2 31 11 16 
        member = PlayerController.GroupingFriends.FriendsMembers[idx];          //0071 : 0F 00 80 5D 8A 19 10 00 20 47 04 1B 19 19 00 20 C9 05 1B 05 00 04 01 50 A2 1B 11 05 00 00 01 40 F2 31 11 
        if (member.Flag == Class'Game_PlayerFriends'.3) {                       //0094 : 07 EE 00 9A 19 00 80 5D 8A 19 05 00 04 01 C8 FA 31 11 39 3A 12 20 30 B5 60 01 02 00 01 24 03 16 
          newRow.Length = 1;                                                    //00B4 : 0F 37 00 10 47 8A 19 26 
          newRow[0] = member.Name;                                              //00BC : 0F 10 25 00 10 47 8A 19 19 00 80 5D 8A 19 05 00 00 01 C0 F3 31 11 
          mIgnoreListView.AddRowTexts(idx,newRow);                              //00D2 : 19 01 58 E5 2B 26 10 00 04 1B C6 98 00 00 00 20 47 04 1B 00 10 47 8A 19 16 
        } else {                                                                //00EB : 06 DB 01 
          newRow[0] = member.Name;                                              //00EE : 0F 10 25 00 10 47 8A 19 19 00 80 5D 8A 19 05 00 00 01 C0 F3 31 11 
          newRow[1] = Class'StringReferences'.GetClassName(member.Class,False); //0104 : 0F 10 26 00 10 47 8A 19 12 20 20 F7 60 01 17 00 00 1B 54 0D 00 00 39 3D 19 00 80 5D 8A 19 05 00 04 01 A8 FC 31 11 28 16 
          newRow[2] = "" @ string(member.Level);                                //012C : 0F 10 2C 02 00 10 47 8A 19 A8 1F 00 39 53 19 00 80 5D 8A 19 05 00 04 01 B8 FB 31 11 16 
          newRow[3] = mDesktop.GetWorldName(member.world);                      //0149 : 0F 10 2C 03 00 10 47 8A 19 19 01 48 0C 9D 19 14 00 00 1B 22 99 00 00 19 00 80 5D 8A 19 05 00 04 01 98 FD 31 11 16 
          if (member.Online) {                                                  //016F : 07 A0 01 19 00 80 5D 8A 19 06 00 04 2D 01 88 FE 31 11 
            newRow[4] = Class'SBGuiStrings'.default.Online.Text;                //0181 : 0F 10 2C 04 00 10 47 8A 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 FC 98 19 
          } else {                                                              //019D : 06 BC 01 
            newRow[4] = Class'SBGuiStrings'.default.Offline.Text;               //01A0 : 0F 10 2C 04 00 10 47 8A 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 FC 98 19 
          }
          row = mFriendListView.AddRowTexts(idx,newRow);                        //01BC : 0F 00 58 22 34 26 19 01 E0 39 2C 26 10 00 04 1B C6 98 00 00 00 20 47 04 1B 00 10 47 8A 19 16 
        }
        ++idx;                                                                  //01DB : A3 00 20 47 04 1B 16 
      }
    }
    //07 0E 00 F2 1C C0 E6 88 19 16 28 16 04 0B 0F 00 20 C9 05 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 
    //E5 01 77 00 20 C9 05 1B 2A 16 19 01 E0 39 2C 26 06 00 00 1B 54 98 00 00 16 19 01 58 E5 2B 26 06 
    //00 00 1B 54 98 00 00 16 0F 00 20 47 04 1B 25 07 E5 01 96 00 20 47 04 1B 37 19 19 00 20 C9 05 1B 
    //05 00 04 01 50 A2 1B 11 05 00 00 01 40 F2 31 11 16 0F 00 80 5D 8A 19 10 00 20 47 04 1B 19 19 00 
    //20 C9 05 1B 05 00 04 01 50 A2 1B 11 05 00 00 01 40 F2 31 11 07 EE 00 9A 19 00 80 5D 8A 19 05 00 
    //04 01 C8 FA 31 11 39 3A 12 20 30 B5 60 01 02 00 01 24 03 16 0F 37 00 10 47 8A 19 26 0F 10 25 00 
    //10 47 8A 19 19 00 80 5D 8A 19 05 00 00 01 C0 F3 31 11 19 01 58 E5 2B 26 10 00 04 1B C6 98 00 00 
    //00 20 47 04 1B 00 10 47 8A 19 16 06 DB 01 0F 10 25 00 10 47 8A 19 19 00 80 5D 8A 19 05 00 00 01 
    //C0 F3 31 11 0F 10 26 00 10 47 8A 19 12 20 20 F7 60 01 17 00 00 1B 54 0D 00 00 39 3D 19 00 80 5D 
    //8A 19 05 00 04 01 A8 FC 31 11 28 16 0F 10 2C 02 00 10 47 8A 19 A8 1F 00 39 53 19 00 80 5D 8A 19 
    //05 00 04 01 B8 FB 31 11 16 0F 10 2C 03 00 10 47 8A 19 19 01 48 0C 9D 19 14 00 00 1B 22 99 00 00 
    //19 00 80 5D 8A 19 05 00 04 01 98 FD 31 11 16 07 A0 01 19 00 80 5D 8A 19 06 00 04 2D 01 88 FE 31 
    //11 0F 10 2C 04 00 10 47 8A 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 FC 98 19 06 BC 01 
    //0F 10 2C 04 00 10 47 8A 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 FC 98 19 0F 00 58 22 
    //34 26 19 01 E0 39 2C 26 10 00 04 1B C6 98 00 00 00 20 47 04 1B 00 10 47 8A 19 16 A3 00 20 47 04 
    //1B 16 06 4F 00 04 0B 47 
  }


  function bool MBClickHandler(GUI_MessageBox messageBox,int boxTag,int buttonTag) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(GetPlayerController());            //0000 : 0F 00 78 10 2B 26 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    switch (boxTag) {                                                           //0011 : 05 04 00 E0 21 34 26 
      case 1 :                                                                  //0018 : 0A D1 00 26 
        switch (buttonTag) {                                                    //001C : 05 04 00 50 24 07 1B 
          case 1 :                                                              //0023 : 0A CB 00 26 
            if (PlayerController != None) {                                     //0027 : 07 C8 00 77 00 78 10 2B 26 2A 16 
              if (mTabControl.GetSelectedPage() == mFriendListTab) {            //0032 : 07 7D 00 72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 01 68 FF 04 1B 16 
                PlayerController.GroupingFriends.AddFriendMember(GetProperty("GUI_EntryBox.mText"));//004B : 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 20 00 00 1B 7F 0F 00 00 1B 44 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 2E 6D 54 65 78 74 00 16 16 
              }
              if (mTabControl.GetSelectedPage() == mIgnoreListTab) {            //007D : 07 C8 00 72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 01 40 B7 05 1B 16 
                PlayerController.GroupingFriends.AddIgnoreMember(GetProperty("GUI_EntryBox.mText"));//0096 : 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 20 00 00 1B E5 1B 00 00 1B 44 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 2E 6D 54 65 78 74 00 16 16 
              }
            }
            break;                                                              //00C8 : 06 CE 00 
          default:                                                              //00CB : 0A FF FF 
        }
        break;                                                                  //00CE : 06 65 02 
      case 2 :                                                                  //00D1 : 0A C8 01 2C 02 
        switch (buttonTag) {                                                    //00D6 : 05 04 00 50 24 07 1B 
          case 4 :                                                              //00DD : 0A C2 01 2C 04 
            if (PlayerController != None) {                                     //00E2 : 07 BF 01 77 00 78 10 2B 26 2A 16 
              if (mTabControl.GetSelectedPage() == mFriendListTab) {            //00ED : 07 56 01 72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 01 68 FF 04 1B 16 
                if (mFriendListView.GetSelectedRow() != -1) {                   //0106 : 07 56 01 9B 19 01 E0 39 2C 26 06 00 04 1B 50 98 00 00 16 1D FF FF FF FF 16 
                  PlayerController.GroupingFriends.RemoveFriendMember(mFriendListView.GetRowText(0,mFriendListView.GetSelectedRow()));//011F : 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 25 00 00 1B E6 1B 00 00 19 01 E0 39 2C 26 16 00 00 1B 93 98 00 00 25 19 01 E0 39 2C 26 06 00 04 1B 50 98 00 00 16 16 16 
                }
              }
              if (mTabControl.GetSelectedPage() == mIgnoreListTab) {            //0156 : 07 BF 01 72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 01 40 B7 05 1B 16 
                if (mIgnoreListView.GetSelectedRow() != -1) {                   //016F : 07 BF 01 9B 19 01 58 E5 2B 26 06 00 04 1B 50 98 00 00 16 1D FF FF FF FF 16 
                  PlayerController.GroupingFriends.RemoveIgnoreMember(mIgnoreListView.GetRowText(0,mIgnoreListView.GetSelectedRow()));//0188 : 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 25 00 00 1B E4 1B 00 00 19 01 58 E5 2B 26 16 00 00 1B 93 98 00 00 25 19 01 58 E5 2B 26 06 00 04 1B 50 98 00 00 16 16 16 
                }
              }
            }
            break;                                                              //01BF : 06 C5 01 
          default:                                                              //01C2 : 0A FF FF 
        }
        break;                                                                  //01C5 : 06 65 02 
      case 3 :                                                                  //01C8 : 0A 62 02 2C 03 
        switch (buttonTag) {                                                    //01CD : 05 04 00 50 24 07 1B 
          case 4 :                                                              //01D4 : 0A 18 02 2C 04 
            if (PlayerController != None) {                                     //01D9 : 07 15 02 77 00 78 10 2B 26 2A 16 
              PlayerController.GroupingFriends.MemberInviteAck(mInviteFromPawnName,PlayerController.GroupingFriends.1);//01E4 : 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 1F 00 00 1B E3 1B 00 00 01 38 1B 07 1B 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 02 00 01 24 01 16 
            }
            break;                                                              //0215 : 06 5F 02 
          case 8 :                                                              //0218 : 0A 5C 02 2C 08 
            if (PlayerController != None) {                                     //021D : 07 59 02 77 00 78 10 2B 26 2A 16 
              PlayerController.GroupingFriends.MemberInviteAck(mInviteFromPawnName,PlayerController.GroupingFriends.2);//0228 : 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 1F 00 00 1B E3 1B 00 00 01 38 1B 07 1B 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 02 00 01 24 02 16 
            }
            break;                                                              //0259 : 06 5F 02 
          default:                                                              //025C : 0A FF FF 
        }
        break;                                                                  //025F : 06 65 02 
      default:                                                                  //0262 : 0A FF FF 
        mMBHandle = 0;                                                          //0265 : 0F 01 D0 19 07 1B 25 
        return True;                                                            //026C : 04 27 
      }
    }
    //0F 00 78 10 2B 26 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 04 00 E0 21 34 26 0A D1 00 26 05 04 00 50 
    //24 07 1B 0A CB 00 26 07 C8 00 77 00 78 10 2B 26 2A 16 07 7D 00 72 19 01 F8 52 2B 26 06 00 04 1B 
    //33 98 00 00 16 01 68 FF 04 1B 16 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 20 00 00 1B 7F 0F 
    //00 00 1B 44 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 2E 6D 54 65 78 74 00 16 16 07 C8 00 
    //72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 01 40 B7 05 1B 16 19 19 00 78 10 2B 26 05 00 04 
    //01 50 A2 1B 11 20 00 00 1B E5 1B 00 00 1B 44 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 2E 
    //6D 54 65 78 74 00 16 16 06 CE 00 0A FF FF 06 65 02 0A C8 01 2C 02 05 04 00 50 24 07 1B 0A C2 01 
    //2C 04 07 BF 01 77 00 78 10 2B 26 2A 16 07 56 01 72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 
    //01 68 FF 04 1B 16 07 56 01 9B 19 01 E0 39 2C 26 06 00 04 1B 50 98 00 00 16 1D FF FF FF FF 16 19 
    //19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 25 00 00 1B E6 1B 00 00 19 01 E0 39 2C 26 16 00 00 1B 
    //93 98 00 00 25 19 01 E0 39 2C 26 06 00 04 1B 50 98 00 00 16 16 16 07 BF 01 72 19 01 F8 52 2B 26 
    //06 00 04 1B 33 98 00 00 16 01 40 B7 05 1B 16 07 BF 01 9B 19 01 58 E5 2B 26 06 00 04 1B 50 98 00 
    //00 16 1D FF FF FF FF 16 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 25 00 00 1B E4 1B 00 00 19 
    //01 58 E5 2B 26 16 00 00 1B 93 98 00 00 25 19 01 58 E5 2B 26 06 00 04 1B 50 98 00 00 16 16 16 06 
    //C5 01 0A FF FF 06 65 02 0A 62 02 2C 03 05 04 00 50 24 07 1B 0A 18 02 2C 04 07 15 02 77 00 78 10 
    //2B 26 2A 16 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 1F 00 00 1B E3 1B 00 00 01 38 1B 07 1B 
    //19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 02 00 01 24 01 16 06 5F 02 0A 5C 02 2C 08 07 59 02 
    //77 00 78 10 2B 26 2A 16 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 1F 00 00 1B E3 1B 00 00 01 
    //38 1B 07 1B 19 19 00 78 10 2B 26 05 00 04 01 50 A2 1B 11 02 00 01 24 02 16 06 5F 02 0A FF FF 06 
    //65 02 0A FF FF 0F 01 D0 19 07 1B 25 04 27 04 0B 47 
  }


  function bool RemovePlayerClick(GUI_Component clickedButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Remove_player.Text,Class'SBGuiStrings'.default.Are_you_sure_you_want_to_remove_this_player.Text,4 | 8 | 32,2,self);//000F : 19 01 48 0C 9D 19 49 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 FD 98 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 FD 98 19 9E 9E 2C 04 2C 08 16 2C 20 16 2C 02 17 16 
    return True;                                                                //0061 : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 19 01 48 0C 9D 19 49 00 04 1B 1C 98 00 00 1F 47 55 
    //49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 FD 98 19 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 FD 98 19 9E 9E 2C 04 2C 08 16 2C 20 16 2C 02 17 
    //16 04 27 04 0B 47 
  }


  function bool AddPlayerClick(GUI_Component clickedButton) {
    mDesktop.CreateMessageBox("GUI_EntryBox",Class'SBGuiStrings'.default.Add_player.Text,Class'SBGuiStrings'.default.Enter_player_name.Text,4 | 8 | 32,1,self);//0000 : 19 01 48 0C 9D 19 46 00 04 1B 1C 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 A4 31 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 A4 31 16 9E 9E 2C 04 2C 08 16 2C 20 16 26 17 16 
    return True;                                                                //004F : 04 27 
    //19 01 48 0C 9D 19 46 00 04 1B 1C 98 00 00 1F 47 55 49 5F 45 6E 74 72 79 42 6F 78 00 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 40 A4 31 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 A4 
    //31 16 9E 9E 2C 04 2C 08 16 2C 20 16 26 17 16 04 27 04 0B 47 
  }


  function bool WhisperFriendClick(GUI_Component clickedButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    GetGamePlayerController().Chat.EnterChatMessage("/w");                      //000F : 19 19 1B 3A 98 00 00 16 05 00 04 01 E8 A0 1B 11 0A 00 00 1B 95 0D 00 00 1F 2F 77 00 16 
    GetGamePlayerController().Chat.EnterChatMessage(mSelectedPlayerName);       //002C : 19 19 1B 3A 98 00 00 16 05 00 04 01 E8 A0 1B 11 0B 00 00 1B 95 0D 00 00 01 E8 BB 05 1B 16 
    return True;                                                                //004A : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 19 19 1B 3A 98 00 00 16 05 00 04 01 E8 A0 1B 11 0A 
    //00 00 1B 95 0D 00 00 1F 2F 77 00 16 19 19 1B 3A 98 00 00 16 05 00 04 01 E8 A0 1B 11 0B 00 00 1B 
    //95 0D 00 00 01 E8 BB 05 1B 16 04 27 04 0B 47 
  }


  function bool InviteFriendClick(GUI_Component clickedButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    GetGamePlayerController().GroupingTeams.TeamInvite(mSelectedPlayerName);    //000F : 19 19 1B 3A 98 00 00 16 05 00 04 01 48 C2 18 11 0B 00 00 1B 91 0E 00 00 01 E8 BB 05 1B 16 
    return True;                                                                //002D : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 19 19 1B 3A 98 00 00 16 05 00 04 01 48 C2 18 11 0B 
    //00 00 1B 91 0E 00 00 01 E8 BB 05 1B 16 04 27 04 0B 47 
  }


  function FriendRightClick(GUI_ListView sender,int aColumnIndex,int aRowIndex) {
    local bool selectedPlayerOnline;
    mSelectedPlayerName = "";                                                   //0000 : 0F 01 E8 BB 05 1B 1F 00 
    if (mFriendMenu.IsVisible()) {                                              //0008 : 07 2C 00 19 01 88 8B 2C 26 06 00 04 1C C0 E6 88 19 16 
      mFriendMenu.CloseMenu();                                                  //001A : 19 01 88 8B 2C 26 06 00 00 1B D0 2B 00 00 16 
    } else {                                                                    //0029 : 06 F4 00 
      if (aRowIndex != -1) {                                                    //002C : 07 F4 00 9B 00 58 20 07 1B 1D FF FF FF FF 16 
        mDesktop.ShowGUIWindow(mFriendMenu,1);                                  //003B : 19 01 48 0C 9D 19 0C 00 00 1B 51 98 00 00 01 88 8B 2C 26 26 16 
        mFriendMenu.Move(mDesktop.GetMouseX(),mDesktop.GetMouseY());            //0050 : 19 01 88 8B 2C 26 24 00 00 1B A5 2F 00 00 19 01 48 0C 9D 19 06 00 04 1B BB 98 00 00 16 19 01 48 0C 9D 19 06 00 04 1B BC 98 00 00 16 16 
        mSelectedPlayerName = mFriendListView.GetRowText(0,aRowIndex);          //007D : 0F 01 E8 BB 05 1B 19 01 E0 39 2C 26 0C 00 00 1B 93 98 00 00 25 00 58 20 07 1B 16 
        selectedPlayerOnline = mFriendListView.GetRowText(4,aRowIndex) == Class'SBGuiStrings'.default.Online.Text;//0098 : 14 2D 00 B0 22 07 1B 7A 19 01 E0 39 2C 26 0D 00 00 1B 93 98 00 00 2C 04 00 58 20 07 1B 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 FC 98 19 16 
        mFriendInviteMenuItem.SetEnabled(selectedPlayerOnline);                 //00CA : 19 01 90 91 33 26 0C 00 00 1B 5F 32 00 00 2D 00 B0 22 07 1B 16 
        mFriendWhisperMenuItem.SetEnabled(selectedPlayerOnline);                //00DF : 19 01 A0 90 33 26 0C 00 00 1B 5F 32 00 00 2D 00 B0 22 07 1B 16 
      }
    }
    //0F 01 E8 BB 05 1B 1F 00 07 2C 00 19 01 88 8B 2C 26 06 00 04 1C C0 E6 88 19 16 19 01 88 8B 2C 26 
    //06 00 00 1B D0 2B 00 00 16 06 F4 00 07 F4 00 9B 00 58 20 07 1B 1D FF FF FF FF 16 19 01 48 0C 9D 
    //19 0C 00 00 1B 51 98 00 00 01 88 8B 2C 26 26 16 19 01 88 8B 2C 26 24 00 00 1B A5 2F 00 00 19 01 
    //48 0C 9D 19 06 00 04 1B BB 98 00 00 16 19 01 48 0C 9D 19 06 00 04 1B BC 98 00 00 16 16 0F 01 E8 
    //BB 05 1B 19 01 E0 39 2C 26 0C 00 00 1B 93 98 00 00 25 00 58 20 07 1B 16 14 2D 00 B0 22 07 1B 7A 
    //19 01 E0 39 2C 26 0D 00 00 1B 93 98 00 00 2C 04 00 58 20 07 1B 16 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 38 FC 98 19 16 19 01 90 91 33 26 0C 00 00 1B 5F 32 00 00 2D 00 B0 22 07 1B 16 19 
    //01 A0 90 33 26 0C 00 00 1B 5F 32 00 00 2D 00 B0 22 07 1B 16 04 0B 47 
  }


  function ViewSelectionChange(GUI_ListView sender,int aNewSelectionIndex) {
    local bool hasSelection;
    hasSelection = False;                                                       //0000 : 14 2D 00 40 C1 05 1B 28 
    if (mTabControl.GetSelectedPage() == mFriendListTab) {                      //0008 : 07 42 00 72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 01 68 FF 04 1B 16 
      if (mFriendListView.GetSelectedRow() != -1) {                             //0021 : 07 42 00 9B 19 01 E0 39 2C 26 06 00 04 1B 50 98 00 00 16 1D FF FF FF FF 16 
        hasSelection = True;                                                    //003A : 14 2D 00 40 C1 05 1B 27 
      }
    }
    if (mTabControl.GetSelectedPage() == mIgnoreListTab) {                      //0042 : 07 7C 00 72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 01 40 B7 05 1B 16 
      if (mIgnoreListView.GetSelectedRow() != -1) {                             //005B : 07 7C 00 9B 19 01 58 E5 2B 26 06 00 04 1B 50 98 00 00 16 1D FF FF FF FF 16 
        hasSelection = True;                                                    //0074 : 14 2D 00 40 C1 05 1B 27 
      }
    }
    mRemovePlayerButton.SetEnabled(hasSelection);                               //007C : 19 01 A8 B8 05 1B 0C 00 00 1B 5F 32 00 00 2D 00 40 C1 05 1B 16 
    //14 2D 00 40 C1 05 1B 28 07 42 00 72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 01 68 FF 04 1B 
    //16 07 42 00 9B 19 01 E0 39 2C 26 06 00 04 1B 50 98 00 00 16 1D FF FF FF FF 16 14 2D 00 40 C1 05 
    //1B 27 07 7C 00 72 19 01 F8 52 2B 26 06 00 04 1B 33 98 00 00 16 01 40 B7 05 1B 16 07 7C 00 9B 19 
    //01 58 E5 2B 26 06 00 04 1B 50 98 00 00 16 1D FF FF FF FF 16 14 2D 00 40 C1 05 1B 27 19 01 A8 B8 
    //05 1B 0C 00 00 1B 5F 32 00 00 2D 00 40 C1 05 1B 16 04 0B 47 
  }


  function TabTabChanged(GUI_TabCtrl aSource,GUI_Page aNewSelectedPage,GUI_Page aPreviousSelectedPage) {
    ViewSelectionChange(None,-1);                                               //0000 : 1B 84 98 00 00 2A 1D FF FF FF FF 16 
    //1B 84 98 00 00 2A 1D FF FF FF FF 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 C0 8E 33 26 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //000B : 07 25 00 9A 00 C0 8E 33 26 12 20 00 68 D7 00 01 00 04 26 16 
      RefreshViewHandler();                                                     //001F : 1B DE 99 00 00 16 
    }
    //1C 20 7A 9E 19 00 C0 8E 33 26 16 07 25 00 9A 00 C0 8E 33 26 12 20 00 68 D7 00 01 00 04 26 16 1B 
    //DE 99 00 00 16 04 0B 47 
  }


  event OnComponentDestroyed() {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(GetPlayerController());            //0000 : 0F 00 A8 2D 04 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //0011 : 07 73 00 77 00 A8 2D 04 1B 2A 16 
      PlayerController.GroupingFriends.__OnRefreshView__Delegate = None;        //001C : 45 19 19 00 A8 2D 04 1B 05 00 04 01 50 A2 1B 11 05 00 08 01 28 F5 31 11 44 00 00 00 00 
      PlayerController.GroupingFriends.__OnFriendOnline__Delegate = None;       //0039 : 45 19 19 00 A8 2D 04 1B 05 00 04 01 50 A2 1B 11 05 00 08 01 B0 1B 32 11 44 00 00 00 00 
      PlayerController.GroupingFriends.__OnAddMemberReq__Delegate = None;       //0056 : 45 19 19 00 A8 2D 04 1B 05 00 04 01 50 A2 1B 11 05 00 08 01 E8 1E 32 11 44 00 00 00 00 
    }
    Super.OnComponentDestroyed();                                               //0073 : 1C E0 DA 9D 19 16 
    //0F 00 A8 2D 04 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 73 00 77 00 A8 2D 04 1B 2A 16 45 19 19 00 
    //A8 2D 04 1B 05 00 04 01 50 A2 1B 11 05 00 08 01 28 F5 31 11 44 00 00 00 00 45 19 19 00 A8 2D 04 
    //1B 05 00 04 01 50 A2 1B 11 05 00 08 01 B0 1B 32 11 44 00 00 00 00 45 19 19 00 A8 2D 04 1B 05 00 
    //04 01 50 A2 1B 11 05 00 08 01 E8 1E 32 11 44 00 00 00 00 1C E0 DA 9D 19 16 04 0B 47 
  }


  function SetDelegates() {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(GetPlayerController());            //0000 : 0F 00 08 2C 04 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //0011 : 07 73 00 77 00 08 2C 04 1B 2A 16 
      PlayerController.GroupingFriends.__OnRefreshView__Delegate = RefreshViewHandler;//001C : 45 19 19 00 08 2C 04 1B 05 00 04 01 50 A2 1B 11 05 00 08 01 28 F5 31 11 44 DE 99 00 00 
      PlayerController.GroupingFriends.__OnFriendOnline__Delegate = FriendOnlineHandler;//0039 : 45 19 19 00 08 2C 04 1B 05 00 04 01 50 A2 1B 11 05 00 08 01 B0 1B 32 11 44 B1 9A 00 00 
      PlayerController.GroupingFriends.__OnAddMemberReq__Delegate = AddMemberReqHandler;//0056 : 45 19 19 00 08 2C 04 1B 05 00 04 01 50 A2 1B 11 05 00 08 01 E8 1E 32 11 44 B2 9A 00 00 
    }
    //0F 00 08 2C 04 1B 2E 90 18 5B 01 1B 0E 2F 00 00 16 07 73 00 77 00 08 2C 04 1B 2A 16 45 19 19 00 
    //08 2C 04 1B 05 00 04 01 50 A2 1B 11 05 00 08 01 28 F5 31 11 44 DE 99 00 00 45 19 19 00 08 2C 04 
    //1B 05 00 04 01 50 A2 1B 11 05 00 08 01 B0 1B 32 11 44 B1 9A 00 00 45 19 19 00 08 2C 04 1B 05 00 
    //04 01 50 A2 1B 11 05 00 08 01 E8 1E 32 11 44 B2 9A 00 00 04 0B 47 
  }


  event Initialize() {
    local GED_Editor Editor;
    local GUI_TextButton menuItem;
    mWidth = 665.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 40 26 44 
    mHeight = 500.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 00 FA 43 
    mLeft = mDesktop.GetScreenWidth() / 2 - mWidth / 2;                         //0016 : 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 AC 01 60 87 31 16 39 3F 2C 02 16 16 
    mTop = mDesktop.GetScreenHeight() / 2 - mHeight / 2;                        //003E : 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 39 3F 2C 02 16 16 
    Super.Initialize();                                                         //0066 : 1C 28 9E 9E 19 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //006C : 0F 00 68 2B 8A 19 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    Editor.Attach(self,"Guild\Friendlist.txt");                                 //0091 : 19 00 68 2B 8A 19 1D 00 00 1B 3F 01 00 00 17 1F 47 75 69 6C 64 5C 46 72 69 65 6E 64 6C 69 73 74 2E 74 78 74 00 16 
    mTabControl = GUI_TabCtrl(Editor.RetrieveComponent("mTabControl"));         //00B7 : 0F 01 F8 52 2B 26 2E A0 6E 2F 1D 19 00 68 2B 8A 19 13 00 04 1B 15 98 00 00 1F 6D 54 61 62 43 6F 6E 74 72 6F 6C 00 16 
    mTabControl.__OnTabChanged__Delegate = TabTabChanged;                       //00DE : 45 19 01 F8 52 2B 26 05 00 08 01 48 93 A2 19 44 A7 9A 00 00 
    mTabControl.GetButton(0).SetText(Class'SBGuiStrings'.default.Friends_List.Text);//00F2 : 19 19 01 F8 52 2B 26 07 00 04 1B 2A 98 00 00 25 16 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 ED 98 19 16 
    mTabControl.GetButton(1).SetText(Class'SBGuiStrings'.default.Ignore_List.Text);//011F : 19 19 01 F8 52 2B 26 07 00 04 1B 2A 98 00 00 26 16 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 75 2F 16 16 
    mFriendListTab = GUI_Page(Editor.RetrieveComponent("mFriendListTab"));      //014C : 0F 01 68 FF 04 1B 2E D8 E5 2E 1D 19 00 68 2B 8A 19 16 00 04 1B 15 98 00 00 1F 6D 46 72 69 65 6E 64 4C 69 73 74 54 61 62 00 16 
    mFriendListView = GUI_ListView(Editor.RetrieveComponent("mFriendListView"));//0176 : 0F 01 E0 39 2C 26 2E 08 64 2F 1D 19 00 68 2B 8A 19 17 00 04 1B 15 98 00 00 1F 6D 46 72 69 65 6E 64 4C 69 73 74 56 69 65 77 00 16 
    mFriendListView.__OnSelectionChange__Delegate = ViewSelectionChange;        //01A1 : 45 19 01 E0 39 2C 26 05 00 08 01 60 BF A4 19 44 84 98 00 00 
    mFriendListView.__OnRowRightClick__Delegate = FriendRightClick;             //01B5 : 45 19 01 E0 39 2C 26 05 00 08 01 70 BE A4 19 44 A8 9A 00 00 
    mFriendListView.AddColumn(Class'SBGuiStrings'.default.CharName.Text,0,177); //01C9 : 19 01 E0 39 2C 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 93 97 19 25 2C B1 16 
    mFriendListView.AddColumn(Class'SBGuiStrings'.default.Class.Text,0,108);    //01EE : 19 01 E0 39 2C 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 49 98 19 25 2C 6C 16 
    mFriendListView.AddColumn(Class'SBGuiStrings'.default.Level_Header.Text,0,55);//0213 : 19 01 E0 39 2C 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 92 98 19 25 2C 37 16 
    mFriendListView.AddColumn(Class'SBGuiStrings'.default.Location.Text,0,146); //0238 : 19 01 E0 39 2C 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 FB 98 19 25 2C 92 16 
    mFriendListView.AddColumn(Class'SBGuiStrings'.default.On_offline.Text,0,106);//025D : 19 01 E0 39 2C 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 FB 98 19 25 2C 6A 16 
    mFriendMenu = GUI_Menu(mDesktop.GetWindow(mDesktop.CreateWindow("GUI_Menu",0,0,0,10,-100,150,11)));//0282 : 0F 01 88 8B 2C 26 2E 68 B8 2F 1D 19 01 48 0C 9D 19 2D 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 1E 00 04 1B 4C 2D 00 00 1F 47 55 49 5F 4D 65 6E 75 00 25 25 25 2C 0A 1D 9C FF FF FF 2C 96 2C 0B 16 16 
    menuItem = mFriendMenu.CreateMenuItem(Class'SBGuiStrings'.default.Team_Invite.Text);//02C3 : 0F 00 90 5C 8A 19 19 01 88 8B 2C 26 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 65 99 19 16 
    menuItem.__OnClick__Delegate = InviteFriendClick;                           //02EB : 45 19 00 90 5C 8A 19 05 00 08 01 98 EB 9D 19 44 A9 9A 00 00 
    mFriendInviteMenuItem = menuItem;                                           //02FF : 0F 01 90 91 33 26 00 90 5C 8A 19 
    menuItem = mFriendMenu.CreateMenuItem(Class'SBGuiStrings'.default.Private.Text);//030A : 0F 00 90 5C 8A 19 19 01 88 8B 2C 26 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 F9 98 19 16 
    menuItem.__OnClick__Delegate = WhisperFriendClick;                          //0332 : 45 19 00 90 5C 8A 19 05 00 08 01 98 EB 9D 19 44 AA 9A 00 00 
    mFriendWhisperMenuItem = menuItem;                                          //0346 : 0F 01 A0 90 33 26 00 90 5C 8A 19 
    menuItem = mFriendMenu.CreateMenuItem(Class'SBGuiStrings'.default.Remove_player.Text);//0351 : 0F 00 90 5C 8A 19 19 01 88 8B 2C 26 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 FD 98 19 16 
    menuItem.__OnClick__Delegate = RemovePlayerClick;                           //0379 : 45 19 00 90 5C 8A 19 05 00 08 01 98 EB 9D 19 44 E1 99 00 00 
    mIgnoreListTab = GUI_Page(Editor.RetrieveComponent("mIgnoreListTab"));      //038D : 0F 01 40 B7 05 1B 2E D8 E5 2E 1D 19 00 68 2B 8A 19 16 00 04 1B 15 98 00 00 1F 6D 49 67 6E 6F 72 65 4C 69 73 74 54 61 62 00 16 
    mIgnoreListView = GUI_ListView(Editor.RetrieveComponent("mIgnoreListView"));//03B7 : 0F 01 58 E5 2B 26 2E 08 64 2F 1D 19 00 68 2B 8A 19 17 00 04 1B 15 98 00 00 1F 6D 49 67 6E 6F 72 65 4C 69 73 74 56 69 65 77 00 16 
    mIgnoreListView.__OnSelectionChange__Delegate = ViewSelectionChange;        //03E2 : 45 19 01 58 E5 2B 26 05 00 08 01 60 BF A4 19 44 84 98 00 00 
    mIgnoreListView.AddColumn(Class'SBGuiStrings'.default.CharName.Text,0,612); //03F6 : 19 01 58 E5 2B 26 1F 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 93 97 19 25 1D 64 02 00 00 16 
    mAddPlayerButton = GUI_Button(Editor.RetrieveComponent("mAddPlayerButton"));//041E : 0F 01 D8 94 33 26 2E 78 F0 2E 1D 19 00 68 2B 8A 19 18 00 04 1B 15 98 00 00 1F 6D 41 64 64 50 6C 61 79 65 72 42 75 74 74 6F 6E 00 16 
    mAddPlayerButton.__OnClick__Delegate = AddPlayerClick;                      //044A : 45 19 01 D8 94 33 26 05 00 08 01 98 EB 9D 19 44 AC 9A 00 00 
    mRemovePlayerButton = GUI_Button(Editor.RetrieveComponent("mRemovePlayerButton"));//045E : 0F 01 A8 B8 05 1B 2E 78 F0 2E 1D 19 00 68 2B 8A 19 1B 00 04 1B 15 98 00 00 1F 6D 52 65 6D 6F 76 65 50 6C 61 79 65 72 42 75 74 74 6F 6E 00 16 
    mRemovePlayerButton.__OnClick__Delegate = RemovePlayerClick;                //048D : 45 19 01 A8 B8 05 1B 05 00 08 01 98 EB 9D 19 44 E1 99 00 00 
    mRemovePlayerButton.SetEnabled(False);                                      //04A1 : 19 01 A8 B8 05 1B 07 00 00 1B 5F 32 00 00 28 16 
    mTabControl.SetSelectedPage(mFriendListTab);                                //04B1 : 19 01 F8 52 2B 26 0B 00 00 1B 4C 98 00 00 01 68 FF 04 1B 16 
    __OnMBClick__Delegate = MBClickHandler;                                     //04C5 : 45 01 B8 E9 9D 19 44 2D 98 00 00 
    //0F 01 60 87 31 16 1E 00 40 26 44 0F 01 40 88 31 16 1E 00 00 FA 43 0F 01 08 86 31 16 AF AC 19 01 
    //48 0C 9D 19 06 00 04 1B 31 98 00 00 16 39 3F 2C 02 16 AC 01 60 87 31 16 39 3F 2C 02 16 16 0F 01 
    //80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 39 3F 2C 02 16 AC 01 40 88 31 16 
    //39 3F 2C 02 16 16 1C 28 9E 9E 19 16 0F 00 68 2B 8A 19 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 
    //1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 19 00 68 2B 8A 19 1D 00 00 1B 3F 01 00 00 17 
    //1F 47 75 69 6C 64 5C 46 72 69 65 6E 64 6C 69 73 74 2E 74 78 74 00 16 0F 01 F8 52 2B 26 2E A0 6E 
    //2F 1D 19 00 68 2B 8A 19 13 00 04 1B 15 98 00 00 1F 6D 54 61 62 43 6F 6E 74 72 6F 6C 00 16 45 19 
    //01 F8 52 2B 26 05 00 08 01 48 93 A2 19 44 A7 9A 00 00 19 19 01 F8 52 2B 26 07 00 04 1B 2A 98 00 
    //00 25 16 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 ED 98 19 16 19 
    //19 01 F8 52 2B 26 07 00 04 1B 2A 98 00 00 26 16 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 58 75 2F 16 16 0F 01 68 FF 04 1B 2E D8 E5 2E 1D 19 00 68 2B 8A 19 16 00 04 
    //1B 15 98 00 00 1F 6D 46 72 69 65 6E 64 4C 69 73 74 54 61 62 00 16 0F 01 E0 39 2C 26 2E 08 64 2F 
    //1D 19 00 68 2B 8A 19 17 00 04 1B 15 98 00 00 1F 6D 46 72 69 65 6E 64 4C 69 73 74 56 69 65 77 00 
    //16 45 19 01 E0 39 2C 26 05 00 08 01 60 BF A4 19 44 84 98 00 00 45 19 01 E0 39 2C 26 05 00 08 01 
    //70 BE A4 19 44 A8 9A 00 00 19 01 E0 39 2C 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 
    //32 1D 05 00 0C 02 70 93 97 19 25 2C B1 16 19 01 E0 39 2C 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 20 49 98 19 25 2C 6C 16 19 01 E0 39 2C 26 1C 00 04 1B 30 98 00 
    //00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 92 98 19 25 2C 37 16 19 01 E0 39 2C 26 1C 00 
    //04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 FB 98 19 25 2C 92 16 19 01 E0 
    //39 2C 26 1C 00 04 1B 30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 FB 98 19 25 2C 
    //6A 16 0F 01 88 8B 2C 26 2E 68 B8 2F 1D 19 01 48 0C 9D 19 2D 00 04 1B 1E 98 00 00 19 01 48 0C 9D 
    //19 1E 00 04 1B 4C 2D 00 00 1F 47 55 49 5F 4D 65 6E 75 00 25 25 25 2C 0A 1D 9C FF FF FF 2C 96 2C 
    //0B 16 16 0F 00 90 5C 8A 19 19 01 88 8B 2C 26 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 
    //32 1D 05 00 0C 02 58 65 99 19 16 45 19 00 90 5C 8A 19 05 00 08 01 98 EB 9D 19 44 A9 9A 00 00 0F 
    //01 90 91 33 26 00 90 5C 8A 19 0F 00 90 5C 8A 19 19 01 88 8B 2C 26 19 00 04 1B 38 98 00 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 F9 98 19 16 45 19 00 90 5C 8A 19 05 00 08 01 98 EB 9D 
    //19 44 AA 9A 00 00 0F 01 A0 90 33 26 00 90 5C 8A 19 0F 00 90 5C 8A 19 19 01 88 8B 2C 26 19 00 04 
    //1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 FD 98 19 16 45 19 00 90 5C 8A 19 
    //05 00 08 01 98 EB 9D 19 44 E1 99 00 00 0F 01 40 B7 05 1B 2E D8 E5 2E 1D 19 00 68 2B 8A 19 16 00 
    //04 1B 15 98 00 00 1F 6D 49 67 6E 6F 72 65 4C 69 73 74 54 61 62 00 16 0F 01 58 E5 2B 26 2E 08 64 
    //2F 1D 19 00 68 2B 8A 19 17 00 04 1B 15 98 00 00 1F 6D 49 67 6E 6F 72 65 4C 69 73 74 56 69 65 77 
    //00 16 45 19 01 58 E5 2B 26 05 00 08 01 60 BF A4 19 44 84 98 00 00 19 01 58 E5 2B 26 1F 00 04 1B 
    //30 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 93 97 19 25 1D 64 02 00 00 16 0F 01 
    //D8 94 33 26 2E 78 F0 2E 1D 19 00 68 2B 8A 19 18 00 04 1B 15 98 00 00 1F 6D 41 64 64 50 6C 61 79 
    //65 72 42 75 74 74 6F 6E 00 16 45 19 01 D8 94 33 26 05 00 08 01 98 EB 9D 19 44 AC 9A 00 00 0F 01 
    //A8 B8 05 1B 2E 78 F0 2E 1D 19 00 68 2B 8A 19 1B 00 04 1B 15 98 00 00 1F 6D 52 65 6D 6F 76 65 50 
    //6C 61 79 65 72 42 75 74 74 6F 6E 00 16 45 19 01 A8 B8 05 1B 05 00 08 01 98 EB 9D 19 44 E1 99 00 
    //00 19 01 A8 B8 05 1B 07 00 00 1B 5F 32 00 00 28 16 19 01 F8 52 2B 26 0B 00 00 1B 4C 98 00 00 01 
    //68 FF 04 1B 16 45 01 B8 E9 9D 19 44 2D 98 00 00 04 0B 47 
  }



