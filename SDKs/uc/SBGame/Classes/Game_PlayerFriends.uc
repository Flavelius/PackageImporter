//==============================================================================
//  Game_PlayerFriends
//==============================================================================

class Game_PlayerFriends extends Base_Component within Game_Controller
    native
    dependsOn(SBFriendsMember,Game_Controller,Player,Game_Desktop,StringReferences)
  ;

  enum eFriendsResultCode {
    FRC_NONE ,
    FRC_ACCEPT ,
    FRC_DECLINE ,
    FRC_OFFLINE ,
    FRC_BUSY ,
    FRC_IGNORED_ME ,
    FRC_INVITE_SUCCESS ,
    FRC_MEMBER_ON_TRAVELING ,
    FRC_RELATIONSHIP_ALREADY ,
    FRC_UNKNOWN_CHARACTER ,
    FRC_INCORRECT_INVITER ,
    FRC_ADD_RELATIONSHIP_FAILED ,
    FRC_REMOVE_RELATIONSHIP_FAILED ,
    FRC_SET_RELATIONSHIP_FAILED ,
    FRC_GET_RELATIONSHIP_INFO_FAILED 
  };

  enum eFriendsListFlag {
    FLF_UNKNOWN ,
    FLF_FRIEND ,
    FLF_FRIEND_READY ,
    FLF_IGNORE 
  };

  var array<SBFriendsMember> FriendsMembers;
  var (null);
  var (null);
  var (null);


  native function bool IsIgnoringName(string aCharacterName);


  native function bool IsIgnoring(Game_Pawn aPawn);


  native function bool IsFriendWith(Game_Pawn aPawn);


  event RemoveMember(string friendPawnName,bool removeCharacter) {
    local int idx;
    local SBFriendsMember member;
    local string messageStr;
    idx = 0;                                                                    //0000 : 0F 00 C8 F1 31 11 25 
    while (idx < FriendsMembers.Length) {                                       //0007 : 07 59 00 96 00 C8 F1 31 11 37 01 40 F2 31 11 16 
      member = FriendsMembers[idx];                                             //0017 : 0F 00 B8 F2 31 11 10 00 C8 F1 31 11 01 40 F2 31 11 
      if (member.Name == friendPawnName) {                                      //0028 : 07 4F 00 7A 19 00 B8 F2 31 11 05 00 00 01 C0 F3 31 11 00 40 EF 31 11 16 
        FriendsMembers.Remove(idx,1);                                           //0040 : 41 01 40 F2 31 11 00 C8 F1 31 11 26 
        goto jl0059;                                                            //004C : 06 59 00 
      }
      ++idx;                                                                    //004F : A3 00 C8 F1 31 11 16 
    }
    if (removeCharacter == True) {                                              //0059 : 07 E4 00 F2 2D 00 38 F4 31 11 27 16 
      messageStr = "[PLAYERNAME] has been deleted.";                            //0065 : 0F 00 B0 F4 31 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 20 68 61 73 20 62 65 65 6E 20 64 65 6C 65 74 65 64 2E 00 
      static.ReplaceText(messageStr,"[PLAYERNAME]",friendPawnName);             //008B : 1C 30 80 69 0F 00 B0 F4 31 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 40 EF 31 11 16 
      Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//00A9 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 B0 F4 31 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    } else {                                                                    //00E1 : 06 53 01 
      messageStr = Class'StringReferences'.default.PLAYERNAME_has_been_removed_.Text;//00E4 : 0F 00 B0 F4 31 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 7F 1C 11 
      static.ReplaceText(messageStr,"[PLAYERNAME]",friendPawnName);             //00FD : 1C 30 80 69 0F 00 B0 F4 31 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 40 EF 31 11 16 
      Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//011B : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 B0 F4 31 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    }
    OnRefreshView();                                                            //0153 : 43 28 F5 31 11 E3 05 00 00 16 
    //0F 00 C8 F1 31 11 25 07 59 00 96 00 C8 F1 31 11 37 01 40 F2 31 11 16 0F 00 B8 F2 31 11 10 00 C8 
    //F1 31 11 01 40 F2 31 11 07 4F 00 7A 19 00 B8 F2 31 11 05 00 00 01 C0 F3 31 11 00 40 EF 31 11 16 
    //41 01 40 F2 31 11 00 C8 F1 31 11 26 06 59 00 A3 00 C8 F1 31 11 16 06 07 00 07 E4 00 F2 2D 00 38 
    //F4 31 11 27 16 0F 00 B0 F4 31 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 20 68 61 73 20 62 65 65 
    //6E 20 64 65 6C 65 74 65 64 2E 00 1C 30 80 69 0F 00 B0 F4 31 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 
    //45 5D 00 00 40 EF 31 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 
    //04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 B0 F4 31 11 12 20 60 CE 5A 01 02 00 04 2C 07 
    //16 06 53 01 0F 00 B0 F4 31 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 7F 1C 11 1C 30 80 
    //69 0F 00 B0 F4 31 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 40 EF 31 11 16 19 2E 60 CE 5A 
    //01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 
    //1F 00 00 B0 F4 31 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 43 28 F5 31 11 E3 05 00 00 16 04 0B 47 
    //
  }


  event OnFriendSet(string toPawnName,int Flag,int toPawnID,int toPawnLevel,int toPawnClass,int toPawnWorld,bool isOnline) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 60 F9 31 11 25 
    while (i < FriendsMembers.Length) {                                         //0007 : 07 C5 00 96 00 60 F9 31 11 37 01 40 F2 31 11 16 
      if (FriendsMembers[i].CharacterID == toPawnID) {                          //0017 : 07 BB 00 9A 19 10 00 60 F9 31 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 50 FA 31 11 16 
        FriendsMembers[i].Flag = Flag;                                          //0035 : 0F 19 10 00 60 F9 31 11 01 40 F2 31 11 05 00 04 01 C8 FA 31 11 00 40 FB 31 11 
        FriendsMembers[i].Level = toPawnLevel;                                  //004F : 0F 19 10 00 60 F9 31 11 01 40 F2 31 11 05 00 04 01 B8 FB 31 11 00 30 FC 31 11 
        FriendsMembers[i].Class = toPawnClass;                                  //0069 : 0F 19 10 00 60 F9 31 11 01 40 F2 31 11 05 00 04 01 A8 FC 31 11 00 20 FD 31 11 
        FriendsMembers[i].world = toPawnWorld;                                  //0083 : 0F 19 10 00 60 F9 31 11 01 40 F2 31 11 05 00 04 01 98 FD 31 11 00 10 FE 31 11 
        FriendsMembers[i].Online = isOnline;                                    //009D : 14 19 10 00 60 F9 31 11 01 40 F2 31 11 06 00 04 2D 01 88 FE 31 11 2D 00 00 FF 31 11 
        return;                                                                 //00B9 : 04 0B 
      }
      ++i;                                                                      //00BB : A3 00 60 F9 31 11 16 
    }
    FriendsMembers.Insert(FriendsMembers.Length,1);                             //00C5 : 40 01 40 F2 31 11 37 01 40 F2 31 11 26 
    FriendsMembers[FriendsMembers.Length - 1] = new Class'SBFriendsMember';     //00D2 : 0F 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 11 0B 0B 0B 20 68 C1 24 01 
    FriendsMembers[FriendsMembers.Length - 1].Name = toPawnName;                //00EB : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 00 01 C0 F3 31 11 00 50 F6 31 11 
    FriendsMembers[FriendsMembers.Length - 1].Flag = Flag;                      //0109 : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 C8 FA 31 11 00 40 FB 31 11 
    FriendsMembers[FriendsMembers.Length - 1].CharacterID = toPawnID;           //0127 : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 50 FA 31 11 
    FriendsMembers[FriendsMembers.Length - 1].Level = toPawnLevel;              //0145 : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 B8 FB 31 11 00 30 FC 31 11 
    FriendsMembers[FriendsMembers.Length - 1].Class = toPawnClass;              //0163 : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 A8 FC 31 11 00 20 FD 31 11 
    FriendsMembers[FriendsMembers.Length - 1].world = toPawnWorld;              //0181 : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 98 FD 31 11 00 10 FE 31 11 
    FriendsMembers[FriendsMembers.Length - 1].Online = isOnline;                //019F : 14 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 06 00 04 2D 01 88 FE 31 11 2D 00 00 FF 31 11 
    //0F 00 60 F9 31 11 25 07 C5 00 96 00 60 F9 31 11 37 01 40 F2 31 11 16 07 BB 00 9A 19 10 00 60 F9 
    //31 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 50 FA 31 11 16 0F 19 10 00 60 F9 31 11 01 40 F2 
    //31 11 05 00 04 01 C8 FA 31 11 00 40 FB 31 11 0F 19 10 00 60 F9 31 11 01 40 F2 31 11 05 00 04 01 
    //B8 FB 31 11 00 30 FC 31 11 0F 19 10 00 60 F9 31 11 01 40 F2 31 11 05 00 04 01 A8 FC 31 11 00 20 
    //FD 31 11 0F 19 10 00 60 F9 31 11 01 40 F2 31 11 05 00 04 01 98 FD 31 11 00 10 FE 31 11 14 19 10 
    //00 60 F9 31 11 01 40 F2 31 11 06 00 04 2D 01 88 FE 31 11 2D 00 00 FF 31 11 04 0B A3 00 60 F9 31 
    //11 16 06 07 00 40 01 40 F2 31 11 37 01 40 F2 31 11 26 0F 10 93 37 01 40 F2 31 11 26 16 01 40 F2 
    //31 11 11 0B 0B 0B 20 68 C1 24 01 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 00 01 
    //C0 F3 31 11 00 50 F6 31 11 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 C8 FA 
    //31 11 00 40 FB 31 11 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 
    //00 50 FA 31 11 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 B8 FB 31 11 00 30 
    //FC 31 11 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 A8 FC 31 11 00 20 FD 31 
    //11 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 98 FD 31 11 00 10 FE 31 11 14 
    //19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 06 00 04 2D 01 88 FE 31 11 2D 00 00 FF 31 11 04 
    //0B 47 
  }


  event AddMember(string toPawnName,int Flag,int toPawnID,int toPawnLevel,int toPawnClass,int toPawnWorld) {
    local string messageStr;
    FriendsMembers.Insert(FriendsMembers.Length,1);                             //0000 : 40 01 40 F2 31 11 37 01 40 F2 31 11 26 
    FriendsMembers[FriendsMembers.Length - 1] = new Class'SBFriendsMember';     //000D : 0F 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 11 0B 0B 0B 20 68 C1 24 01 
    FriendsMembers[FriendsMembers.Length - 1].Name = toPawnName;                //0026 : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 00 01 C0 F3 31 11 00 28 00 32 11 
    FriendsMembers[FriendsMembers.Length - 1].Flag = Flag;                      //0044 : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 C8 FA 31 11 00 A8 03 32 11 
    FriendsMembers[FriendsMembers.Length - 1].CharacterID = toPawnID;           //0062 : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 20 04 32 11 
    FriendsMembers[FriendsMembers.Length - 1].Level = toPawnLevel;              //0080 : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 B8 FB 31 11 00 98 04 32 11 
    FriendsMembers[FriendsMembers.Length - 1].Class = toPawnClass;              //009E : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 A8 FC 31 11 00 10 05 32 11 
    FriendsMembers[FriendsMembers.Length - 1].world = toPawnWorld;              //00BC : 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 98 FD 31 11 00 88 05 32 11 
    switch (Flag) {                                                             //00DA : 05 01 39 3D 00 A8 03 32 11 
      case 1 :                                                                  //00E3 : 0A 75 01 24 01 
        FriendsMembers[FriendsMembers.Length - 1].Online = True;                //00E8 : 14 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 06 00 04 2D 01 88 FE 31 11 27 
        messageStr = Class'StringReferences'.default.PLAYERNAME_has_been_added_to_your_friend_list_.Text;//0103 : 0F 00 00 06 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 81 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",toPawnName);               //011C : 1C 30 80 69 0F 00 00 06 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 28 00 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//013A : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 00 06 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0172 : 06 0A 02 
      case 3 :                                                                  //0175 : 0A 07 02 24 03 
        FriendsMembers[FriendsMembers.Length - 1].Online = False;               //017A : 14 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 06 00 04 2D 01 88 FE 31 11 28 
        messageStr = Class'StringReferences'.default.PLAYERNAME_has_been_added_to_your_ignore_list_.Text;//0195 : 0F 00 00 06 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 60 82 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",toPawnName);               //01AE : 1C 30 80 69 0F 00 00 06 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 28 00 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//01CC : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 00 06 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0204 : 06 0A 02 
      default:                                                                  //0207 : 0A FF FF 
    }
    OnRefreshView();                                                            //020A : 43 28 F5 31 11 E3 05 00 00 16 
    //40 01 40 F2 31 11 37 01 40 F2 31 11 26 0F 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 11 0B 0B 
    //0B 20 68 C1 24 01 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 00 01 C0 F3 31 11 00 
    //28 00 32 11 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 C8 FA 31 11 00 A8 03 
    //32 11 0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 20 04 32 11 
    //0F 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 B8 FB 31 11 00 98 04 32 11 0F 19 
    //10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 A8 FC 31 11 00 10 05 32 11 0F 19 10 93 
    //37 01 40 F2 31 11 26 16 01 40 F2 31 11 05 00 04 01 98 FD 31 11 00 88 05 32 11 05 01 39 3D 00 A8 
    //03 32 11 0A 75 01 24 01 14 19 10 93 37 01 40 F2 31 11 26 16 01 40 F2 31 11 06 00 04 2D 01 88 FE 
    //31 11 27 0F 00 00 06 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 81 1C 11 1C 30 80 69 
    //0F 00 00 06 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 28 00 32 11 16 19 2E 60 CE 5A 01 
    //19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 
    //00 00 00 06 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 0A 02 0A 07 02 24 03 14 19 10 93 37 01 
    //40 F2 31 11 26 16 01 40 F2 31 11 06 00 04 2D 01 88 FE 31 11 28 0F 00 00 06 32 11 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 60 82 1C 11 1C 30 80 69 0F 00 00 06 32 11 1F 5B 50 4C 41 59 45 52 
    //4E 41 4D 45 5D 00 00 28 00 32 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 
    //0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 00 06 32 11 12 20 60 CE 5A 01 02 00 
    //04 2C 07 16 06 0A 02 0A FF FF 43 28 F5 31 11 E3 05 00 00 16 04 0B 47 
  }


  event OnFailResult(byte Result,optional string pawnName) {
    local string messageStr;
    switch (Result) {                                                           //0000 : 05 01 00 28 07 32 11 
      case 5 :                                                                  //0007 : 0A 7E 00 24 05 
        messageStr = Class'StringReferences'.default.PLAYERNAME_ignored_you_.Text;//000C : 0F 00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 66 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //0025 : 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0043 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //007B : 06 1E 04 
      case 2 :                                                                  //007E : 0A F5 00 24 02 
        messageStr = Class'StringReferences'.default.PLAYERNAME_has_declined_your_request_.Text;//0083 : 0F 00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 80 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //009C : 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//00BA : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //00F2 : 06 1E 04 
      case 4 :                                                                  //00F5 : 0A FA 00 24 04 
      case 7 :                                                                  //00FA : 0A 71 01 24 07 
        messageStr = Class'StringReferences'.default.PLAYERNAME_is_busy__try_again_later_.Text;//00FF : 0F 00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 80 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //0118 : 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0136 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //016E : 06 1E 04 
      case 6 :                                                                  //0171 : 0A E8 01 24 06 
        messageStr = Class'StringReferences'.default.You_have_invited_PLAYERNAME_to_your_friendslist_.Text;//0176 : 0F 00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 80 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //018F : 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//01AD : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //01E5 : 06 1E 04 
      case 3 :                                                                  //01E8 : 0A F0 01 24 03 
        break;                                                                  //01ED : 06 1E 04 
      case 8 :                                                                  //01F0 : 0A 67 02 24 08 
        messageStr = Class'StringReferences'.default.PLAYERNAME_is_already_on_your_list_.Text;//01F5 : 0F 00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 81 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //020E : 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//022C : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0264 : 06 1E 04 
      case 9 :                                                                  //0267 : 0A DE 02 24 09 
        messageStr = Class'StringReferences'.default.PLAYERNAME_is_unknown__check_the_spelling_.Text;//026C : 0F 00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 69 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //0285 : 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//02A3 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //02DB : 06 1E 04 
      case 10 :                                                                 //02DE : 0A E3 02 24 0A 
      case 14 :                                                                 //02E3 : 0A 31 03 24 0E 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Friends_Ignore_System_failed_.Text,Class'Game_Desktop'.7);//02E8 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 82 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //032E : 06 1E 04 
      case 11 :                                                                 //0331 : 0A 7F 03 24 0B 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_add_that_player_.Text,Class'Game_Desktop'.7);//0336 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 83 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //037C : 06 1E 04 
      case 12 :                                                                 //037F : 0A CD 03 24 0C 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_remomve_that_player_.Text,Class'Game_Desktop'.7);//0384 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 83 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //03CA : 06 1E 04 
      case 13 :                                                                 //03CD : 0A 1B 04 24 0D 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_change_relation_.Text,Class'Game_Desktop'.7);//03D2 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 84 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0418 : 06 1E 04 
      default:                                                                  //041B : 0A FF FF 
    }
    //05 01 00 28 07 32 11 0A 7E 00 24 05 0F 00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 
    //02 B0 66 1C 11 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 
    //32 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
    //18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 1E 04 0A F5 
    //00 24 02 0F 00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 80 1C 11 1C 30 80 69 
    //0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 32 11 16 19 2E 60 CE 5A 01 
    //19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 
    //00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 1E 04 0A FA 00 24 04 0A 71 01 24 07 0F 
    //00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 80 1C 11 1C 30 80 69 0F 00 78 0D 
    //32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 32 11 16 19 2E 60 CE 5A 01 19 19 01 00 
    //E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 
    //32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 1E 04 0A E8 01 24 06 0F 00 78 0D 32 11 36 58 C6 6B 
    //0F 12 20 20 F7 60 01 05 00 0C 02 08 80 1C 11 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 
    //52 4E 41 4D 45 5D 00 00 F0 0D 32 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 
    //71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 
    //00 04 2C 07 16 06 1E 04 0A F0 01 24 03 06 1E 04 0A 67 02 24 08 0F 00 78 0D 32 11 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 70 81 1C 11 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 
    //4E 41 4D 45 5D 00 00 F0 0D 32 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 
    //0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 
    //04 2C 07 16 06 1E 04 0A DE 02 24 09 0F 00 78 0D 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 
    //02 F8 69 1C 11 1C 30 80 69 0F 00 78 0D 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 F0 0D 
    //32 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
    //18 00 00 1B 7E 04 00 00 1F 00 00 78 0D 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 1E 04 0A E3 
    //02 24 0A 0A 31 03 24 0E 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 
    //01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 82 
    //1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 1E 04 0A 7F 03 24 0B 19 2E 60 CE 5A 01 19 19 01 00 
    //E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 
    //6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 83 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 1E 04 0A 
    //CD 03 24 0C 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 83 1C 11 12 20 
    //60 CE 5A 01 02 00 04 2C 07 16 06 1E 04 0A 1B 04 24 0D 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 
    //00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 
    //20 F7 60 01 05 00 0C 02 40 84 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 1E 04 0A FF FF 04 0B 
    //47 
  }


  event OnSetClass(int CharacterID,int aNewClass) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 48 10 32 11 25 
    while (i < FriendsMembers.Length) {                                         //0007 : 07 66 00 96 00 48 10 32 11 37 01 40 F2 31 11 16 
      if (FriendsMembers[i].CharacterID == CharacterID) {                       //0017 : 07 5C 00 9A 19 10 00 48 10 32 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 18 0F 32 11 16 
        FriendsMembers[i].Class = aNewClass;                                    //0035 : 0F 19 10 00 48 10 32 11 01 40 F2 31 11 05 00 04 01 A8 FC 31 11 00 C0 10 32 11 
        OnRefreshView();                                                        //004F : 43 28 F5 31 11 E3 05 00 00 16 
        goto jl0066;                                                            //0059 : 06 66 00 
      }
      ++i;                                                                      //005C : A3 00 48 10 32 11 16 
    }
    //0F 00 48 10 32 11 25 07 66 00 96 00 48 10 32 11 37 01 40 F2 31 11 16 07 5C 00 9A 19 10 00 48 10 
    //32 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 18 0F 32 11 16 0F 19 10 00 48 10 32 11 01 40 F2 
    //31 11 05 00 04 01 A8 FC 31 11 00 C0 10 32 11 43 28 F5 31 11 E3 05 00 00 16 06 66 00 A3 00 48 10 
    //32 11 16 06 07 00 04 0B 47 
  }


  event OnLevelUp(int CharacterID,int aNewLevel) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 18 13 32 11 25 
    while (i < FriendsMembers.Length) {                                         //0007 : 07 66 00 96 00 18 13 32 11 37 01 40 F2 31 11 16 
      if (FriendsMembers[i].CharacterID == CharacterID) {                       //0017 : 07 5C 00 9A 19 10 00 18 13 32 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 E8 11 32 11 16 
        FriendsMembers[i].Level = aNewLevel;                                    //0035 : 0F 19 10 00 18 13 32 11 01 40 F2 31 11 05 00 04 01 B8 FB 31 11 00 90 13 32 11 
        OnRefreshView();                                                        //004F : 43 28 F5 31 11 E3 05 00 00 16 
        goto jl0066;                                                            //0059 : 06 66 00 
      }
      ++i;                                                                      //005C : A3 00 18 13 32 11 16 
    }
    //0F 00 18 13 32 11 25 07 66 00 96 00 18 13 32 11 37 01 40 F2 31 11 16 07 5C 00 9A 19 10 00 18 13 
    //32 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 E8 11 32 11 16 0F 19 10 00 18 13 32 11 01 40 F2 
    //31 11 05 00 04 01 B8 FB 31 11 00 90 13 32 11 43 28 F5 31 11 E3 05 00 00 16 06 66 00 A3 00 18 13 
    //32 11 16 06 07 00 04 0B 47 
  }


  event Offline(int pawnID) {
    local int i;
    local string messageStr;
    i = 0;                                                                      //0000 : 0F 00 98 16 32 11 25 
    while (i < FriendsMembers.Length) {                                         //0007 : 07 E1 00 96 00 98 16 32 11 37 01 40 F2 31 11 16 
      if (FriendsMembers[i].CharacterID == pawnID) {                            //0017 : 07 D7 00 9A 19 10 00 98 16 32 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 B8 14 32 11 16 
        messageStr = Class'StringReferences'.default.PLAYERNAME_has_gone_offline_.Text;//0035 : 0F 00 10 17 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 65 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",FriendsMembers[i].Name);   //004E : 1C 30 80 69 0F 00 10 17 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 98 16 32 11 01 40 F2 31 11 05 00 00 01 C0 F3 31 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//007B : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 10 17 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        FriendsMembers[i].Online = False;                                       //00B3 : 14 19 10 00 98 16 32 11 01 40 F2 31 11 06 00 04 2D 01 88 FE 31 11 28 
        OnRefreshView();                                                        //00CA : 43 28 F5 31 11 E3 05 00 00 16 
        goto jl00E1;                                                            //00D4 : 06 E1 00 
      }
      ++i;                                                                      //00D7 : A3 00 98 16 32 11 16 
    }
    //0F 00 98 16 32 11 25 07 E1 00 96 00 98 16 32 11 37 01 40 F2 31 11 16 07 D7 00 9A 19 10 00 98 16 
    //32 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 B8 14 32 11 16 0F 00 10 17 32 11 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 48 65 1C 11 1C 30 80 69 0F 00 10 17 32 11 1F 5B 50 4C 41 59 45 52 
    //4E 41 4D 45 5D 00 19 10 00 98 16 32 11 01 40 F2 31 11 05 00 00 01 C0 F3 31 11 16 19 2E 60 CE 5A 
    //01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 
    //1F 00 00 10 17 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 14 19 10 00 98 16 32 11 01 40 F2 31 11 
    //06 00 04 2D 01 88 FE 31 11 28 43 28 F5 31 11 E3 05 00 00 16 06 E1 00 A3 00 98 16 32 11 16 06 07 
    //00 04 0B 47 
  }


  event Online(int pawnID,int worldID) {
    local int i;
    local string messageStr;
    i = 0;                                                                      //0000 : 0F 00 48 1A 32 11 25 
    while (i < FriendsMembers.Length) {                                         //0007 : 07 05 01 96 00 48 1A 32 11 37 01 40 F2 31 11 16 
      if (FriendsMembers[i].CharacterID == pawnID) {                            //0017 : 07 FB 00 9A 19 10 00 48 1A 32 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 38 18 32 11 16 
        messageStr = Class'StringReferences'.default.PLAYERNAME_has_come_online_.Text;//0035 : 0F 00 C0 1A 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 85 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",FriendsMembers[i].Name);   //004E : 1C 30 80 69 0F 00 C0 1A 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 48 1A 32 11 01 40 F2 31 11 05 00 00 01 C0 F3 31 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//007B : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 C0 1A 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        FriendsMembers[i].Online = True;                                        //00B3 : 14 19 10 00 48 1A 32 11 01 40 F2 31 11 06 00 04 2D 01 88 FE 31 11 27 
        FriendsMembers[i].world = worldID;                                      //00CA : 0F 19 10 00 48 1A 32 11 01 40 F2 31 11 05 00 04 01 98 FD 31 11 00 38 1B 32 11 
        OnRefreshView();                                                        //00E4 : 43 28 F5 31 11 E3 05 00 00 16 
        OnFriendOnline();                                                       //00EE : 43 B0 1B 32 11 C9 05 00 00 16 
        goto jl0105;                                                            //00F8 : 06 05 01 
      }
      ++i;                                                                      //00FB : A3 00 48 1A 32 11 16 
    }
    //0F 00 48 1A 32 11 25 07 05 01 96 00 48 1A 32 11 37 01 40 F2 31 11 16 07 FB 00 9A 19 10 00 48 1A 
    //32 11 01 40 F2 31 11 05 00 04 01 D8 F9 31 11 00 38 18 32 11 16 0F 00 C0 1A 32 11 36 58 C6 6B 0F 
    //12 20 20 F7 60 01 05 00 0C 02 30 85 1C 11 1C 30 80 69 0F 00 C0 1A 32 11 1F 5B 50 4C 41 59 45 52 
    //4E 41 4D 45 5D 00 19 10 00 48 1A 32 11 01 40 F2 31 11 05 00 00 01 C0 F3 31 11 16 19 2E 60 CE 5A 
    //01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 
    //1F 00 00 C0 1A 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 14 19 10 00 48 1A 32 11 01 40 F2 31 11 
    //06 00 04 2D 01 88 FE 31 11 27 0F 19 10 00 48 1A 32 11 01 40 F2 31 11 05 00 04 01 98 FD 31 11 00 
    //38 1B 32 11 43 28 F5 31 11 E3 05 00 00 16 43 B0 1B 32 11 C9 05 00 00 16 06 05 01 A3 00 48 1A 32 
    //11 16 06 07 00 04 0B 47 
  }


  delegate OnAddMemberReq(string fromPawnName);


  event AddMemberReq(string fromPawnName) {
    OnAddMemberReq(fromPawnName);                                               //0000 : 43 E8 1E 32 11 B2 05 00 00 00 30 1E 32 11 16 
    //43 E8 1E 32 11 B2 05 00 00 00 30 1E 32 11 16 04 0B 47 
  }


  event OnRefreshViewNotify() {
    OnRefreshView();                                                            //0000 : 43 28 F5 31 11 E3 05 00 00 16 
    //43 28 F5 31 11 E3 05 00 00 16 04 0B 47 
  }


  delegate OnFriendOnline();


  delegate OnRefreshView();


  native function MemberInviteAck(string fromPawnName,byte resultCode);


  native function GetFriendList();


  native function RemoveIgnoreMember(string ignorePawnName);


  native function AddIgnoreMember(string ignorePawnName);


  native function RemoveFriendMember(string friendPawnName);


  native function AddFriendMember(string friendPawnName);


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    GetFriendList();                                                            //0006 : 1B 69 0F 00 00 16 
    //1C E0 C4 19 11 16 1B 69 0F 00 00 16 04 0B 47 
  }



