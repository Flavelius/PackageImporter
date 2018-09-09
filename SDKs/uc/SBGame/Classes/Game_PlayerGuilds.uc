//==============================================================================
//  Game_PlayerGuilds
//==============================================================================

class Game_PlayerGuilds extends Base_Component within Game_Controller
    native
    exportstructs
    dependsOn(SBGuildMember,Game_Controller,Player,Game_Desktop,StringReferences,EventNotification,Game_Pawn)
  ;

  const GRR_GUILD_TOURNAMENTS_SIGN_UP = 524288;
  const GRR_ACCEPT_GUILD_QUESTS = 262144;
  const GRR_ACCESS_GUILD_VAULT = 131072;
  const GRR_ADD_CHEST_TO_GUILD_VAULT = 65536;
  const GRR_BUY_TROHPY_SLOTS = 32768;
  const GRR_OTHER_PLAYERS_TROPHY_REMOVE = 16384;
  const GRR_SET_EVENT_PRIO = 8192;
  const GRR_EDIT_GUILD_EVENTS = 4096;
  const GRR_REMOVE_GUILD_EVENTS = 2048;
  const GRR_ADD_GUILD_EVENTS = 1024;
  const GRR_SET_MOTD = 32;
  const GRR_ALL_RIGHTS = -1;
  const GRR_MANAGE_RANKS = 2097152;
  const GRR_FIGHT_RANKED_FIGHTS = 1048576;
  const GRR_OFFICERS_DESCRIPTION_W = 512;
  const GRR_OFFICERS_DESCRIPTION_R = 256;
  const GRR_OTHER_PLAYERS_DESCRIPTION_W = 128;
  const GRR_SET_PLAYER_RANK = 64;
  const GRR_INVITE_PLAYERS = 16;
  const GRR_OFFICERS_CHAT_W = 8;
  const GRR_OFFICERS_CHAT_R = 4;
  const GRR_GUILD_CHAT_W = 2;
  const GRR_GUILD_CHAT_R = 1;
  const CREATE_GUILD_COST =  5000;
  enum eGuildRequestResult {
    GRR_NONE ,
    GRR_BUSY ,
    GRR_ACCEPT ,
    GRR_DECLINE ,
    GRR_INVITE_SUCCESS ,
    GRR_MEMBER_IN_OTHER_GUILD ,
    GRR_MEMBER_ON_TRAVELING ,
    GRR_IGNORED_ME ,
    GRR_INSUFFICIENT_RIGHTS ,
    GRR_INCORRECT_INVITER ,
    GRR_UNKNOWN_CHARACTER ,
    GRR_UNKNOWN_MEMBER_WORLD ,
    GRR_UNKNOWN_GUILD ,
    GRR_EMPTY_GUILD ,
    GRR_UNKNOWN_RANK ,
    GRR_DEFAULT_RANK ,
    GRR_CREATE_FAILED ,
    GRR_NOT_ENOUGH_COST ,
    GRR_ALREADY_EXIST_GUILD_NAME ,
    GRR_DISBAND_FAILED ,
    GRR_ADD_MEMBER_FAILED ,
    GRR_REMOVE_MEMBER_FAILED ,
    GRR_MEMBER_RANK_SET_FAILED ,
    GRR_INVITE_FAILED ,
    GRR_KICK_FAILED ,
    GRR_LEAVE_FAILED ,
    GRR_PROMOTE_FAILED ,
    GRR_DEMOTE_FAILED ,
    GRR_RANK_SET_FAILED ,
    GRR_RANK_UPDATE_FAILED ,
    GRR_RANK_DELETE_FAILED ,
    GRR_RANK_RIGHTS_FAILED ,
    GRR_SET_MOTD_FAILED ,
    GRR_GET_GUILD_INFO_FAILED ,
    GRR_GUILD_DATA_DB_FAILED ,
    GRR_GUILD_RANK_DB_FAILED ,
    GRR_GUILD_MEMBER_DB_FAILED 
  };

  enum eGuildRemoveMemberCode {
    GRMC_NONE ,
    GRMC_KICK ,
    GRMC_LEAVE ,
    GRMC_REMOVE_CHARACTER ,
    GRMC_DISBAND 
  };

  struct ranks {
      var int Level;
      var string Name;
      var int Rights;

  };


  var bool mInGuild;
  var int mGuildID;
  var string mGuildName;
  var byte mGuildLogoID;
  var byte mGuildColor1;
  var byte mGuildColor2;
  var string mGuildMOTD;
  var int mGuildRanking;
  var int mGuildYourRank;
  var EventNotification mGuildChanged;
  var array<ranks> mRanks;
  var array<SBGuildMember> mGuildMembers;
  var (null);
  var (null);
  var (null);
  var (null);


  native event SBGuildMember GetGuildMember(string aPlayerName);


  native event bool InGuildWith(Game_Pawn aPawn);


  event GuildMOTDSet(int guildID,string motd) {
    if (mGuildID != guildID) {                                                  //0000 : 07 11 00 9B 01 20 B4 32 11 00 48 B3 32 11 16 
      return;                                                                   //000F : 04 0B 
    }
    mGuildMOTD = motd;                                                          //0011 : 0F 01 98 B4 32 11 00 10 B5 32 11 
    RefreshGuildList();                                                         //001C : 1B 06 06 00 00 16 
    //07 11 00 9B 01 20 B4 32 11 00 48 B3 32 11 16 04 0B 0F 01 98 B4 32 11 00 10 B5 32 11 1B 06 06 00 
    //00 16 04 0B 47 
  }


  event GuildSetRightsRank(int guildID,int RankLevel,int Rights) {
    local int i;
    if (mGuildID != guildID) {                                                  //0000 : 07 11 00 9B 01 20 B4 32 11 00 38 B6 32 11 16 
      return;                                                                   //000F : 04 0B 
    }
    i = 0;                                                                      //0011 : 0F 00 70 B7 32 11 25 
    while (i < mRanks.Length) {                                                 //0018 : 07 65 00 96 00 70 B7 32 11 37 01 E8 B7 32 11 16 
      if (mRanks[i].Level == RankLevel) {                                       //0028 : 07 5B 00 9A 36 60 B8 32 11 10 00 70 B7 32 11 01 E8 B7 32 11 00 D8 B8 32 11 16 
        mRanks[i].Rights = Rights;                                              //0042 : 0F 36 50 B9 32 11 10 00 70 B7 32 11 01 E8 B7 32 11 00 C8 B9 32 11 
        goto jl0065;                                                            //0058 : 06 65 00 
      }
      ++i;                                                                      //005B : A3 00 70 B7 32 11 16 
    }
    RefreshGuildRanks();                                                        //0065 : 1B 07 06 00 00 16 
    //07 11 00 9B 01 20 B4 32 11 00 38 B6 32 11 16 04 0B 0F 00 70 B7 32 11 25 07 65 00 96 00 70 B7 32 
    //11 37 01 E8 B7 32 11 16 07 5B 00 9A 36 60 B8 32 11 10 00 70 B7 32 11 01 E8 B7 32 11 00 D8 B8 32 
    //11 16 0F 36 50 B9 32 11 10 00 70 B7 32 11 01 E8 B7 32 11 00 C8 B9 32 11 06 65 00 A3 00 70 B7 32 
    //11 16 06 18 00 1B 07 06 00 00 16 04 0B 47 
  }


  event GuildDeleteRank(int guildID,int deleteRankLevel,int demoteRankLevel) {
    local int i;
    if (mGuildID != guildID) {                                                  //0000 : 07 11 00 9B 01 20 B4 32 11 00 F0 BA 32 11 16 
      return;                                                                   //000F : 04 0B 
    }
    i = 0;                                                                      //0011 : 0F 00 30 BD 32 11 25 
    while (i < mRanks.Length) {                                                 //0018 : 07 90 00 96 00 30 BD 32 11 37 01 E8 B7 32 11 16 
      if (mRanks[i].Level == deleteRankLevel) {                                 //0028 : 07 86 00 9A 36 60 B8 32 11 10 00 30 BD 32 11 01 E8 B7 32 11 00 A8 BD 32 11 16 
        mRanks[i].Level = -1;                                                   //0042 : 0F 36 60 B8 32 11 10 00 30 BD 32 11 01 E8 B7 32 11 1D FF FF FF FF 
        mRanks[i].Name = "";                                                    //0058 : 0F 36 20 BE 32 11 10 00 30 BD 32 11 01 E8 B7 32 11 1F 00 
        mRanks[i].Rights = 0;                                                   //006B : 0F 36 50 B9 32 11 10 00 30 BD 32 11 01 E8 B7 32 11 25 
        RefreshGuildRanks();                                                    //007D : 1B 07 06 00 00 16 
        goto jl0090;                                                            //0083 : 06 90 00 
      }
      i++;                                                                      //0086 : A5 00 30 BD 32 11 16 
    }
    i = 0;                                                                      //0090 : 0F 00 30 BD 32 11 25 
    while (i < mGuildMembers.Length) {                                          //0097 : 07 22 01 96 00 30 BD 32 11 37 01 98 BE 32 11 16 
      if (mGuildMembers[i].RankLevel == deleteRankLevel) {                      //00A7 : 07 DF 00 9A 19 10 00 30 BD 32 11 01 98 BE 32 11 05 00 04 01 10 BF 32 11 00 A8 BD 32 11 16 
        mGuildMembers[i].RankLevel = demoteRankLevel;                           //00C5 : 0F 19 10 00 30 BD 32 11 01 98 BE 32 11 05 00 04 01 10 BF 32 11 00 88 BF 32 11 
      }
      if (mGuildMembers[i].CharacterID == GetPlayerCharacterID()) {             //00DF : 07 18 01 9A 19 10 00 30 BD 32 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 1B 4B 0C 00 00 16 16 
        mGuildYourRank = mGuildMembers[i].RankLevel;                            //00FE : 0F 01 80 C0 32 11 19 10 00 30 BD 32 11 01 98 BE 32 11 05 00 04 01 10 BF 32 11 
      }
      ++i;                                                                      //0118 : A3 00 30 BD 32 11 16 
    }
    RefreshGuildList();                                                         //0122 : 1B 06 06 00 00 16 
    //07 11 00 9B 01 20 B4 32 11 00 F0 BA 32 11 16 04 0B 0F 00 30 BD 32 11 25 07 90 00 96 00 30 BD 32 
    //11 37 01 E8 B7 32 11 16 07 86 00 9A 36 60 B8 32 11 10 00 30 BD 32 11 01 E8 B7 32 11 00 A8 BD 32 
    //11 16 0F 36 60 B8 32 11 10 00 30 BD 32 11 01 E8 B7 32 11 1D FF FF FF FF 0F 36 20 BE 32 11 10 00 
    //30 BD 32 11 01 E8 B7 32 11 1F 00 0F 36 50 B9 32 11 10 00 30 BD 32 11 01 E8 B7 32 11 25 1B 07 06 
    //00 00 16 06 90 00 A5 00 30 BD 32 11 16 06 18 00 0F 00 30 BD 32 11 25 07 22 01 96 00 30 BD 32 11 
    //37 01 98 BE 32 11 16 07 DF 00 9A 19 10 00 30 BD 32 11 01 98 BE 32 11 05 00 04 01 10 BF 32 11 00 
    //A8 BD 32 11 16 0F 19 10 00 30 BD 32 11 01 98 BE 32 11 05 00 04 01 10 BF 32 11 00 88 BF 32 11 07 
    //18 01 9A 19 10 00 30 BD 32 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 1B 4B 0C 00 00 16 16 0F 01 
    //80 C0 32 11 19 10 00 30 BD 32 11 01 98 BE 32 11 05 00 04 01 10 BF 32 11 A3 00 30 BD 32 11 16 06 
    //97 00 1B 06 06 00 00 16 04 0B 47 
  }


  event GuildSetRank(int guildID,int RankLevel,string rankName,int Rights) {
    if (mGuildID != guildID) {                                                  //0000 : 07 11 00 9B 01 20 B4 32 11 00 A8 C1 32 11 16 
      return;                                                                   //000F : 04 0B 
    }
    SetGuildRank(RankLevel,rankName,Rights);                                    //0011 : 1B 18 06 00 00 00 90 C2 32 11 00 08 C3 32 11 00 80 C3 32 11 16 
    RefreshGuildRanks();                                                        //0026 : 1B 07 06 00 00 16 
    RefreshGuildList();                                                         //002C : 1B 06 06 00 00 16 
    //07 11 00 9B 01 20 B4 32 11 00 A8 C1 32 11 16 04 0B 1B 18 06 00 00 00 90 C2 32 11 00 08 C3 32 11 
    //00 80 C3 32 11 16 1B 07 06 00 00 16 1B 06 06 00 00 16 04 0B 47 
  }


  event GuildPromoteDemoteMember(int guildID,int memberID,int RankLevel) {
    local int i;
    local string messageStr;
    if (mGuildID != guildID) {                                                  //0000 : 07 11 00 9B 01 20 B4 32 11 00 A8 C4 32 11 16 
      return;                                                                   //000F : 04 0B 
    }
    i = 0;                                                                      //0011 : 0F 00 E8 C6 32 11 25 
    while (i < mGuildMembers.Length) {                                          //0018 : 07 26 01 96 00 E8 C6 32 11 37 01 98 BE 32 11 16 
      if (mGuildMembers[i].CharacterID == memberID) {                           //0028 : 07 1C 01 9A 19 10 00 E8 C6 32 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 60 C7 32 11 16 
        mGuildMembers[i].RankLevel = RankLevel;                                 //0046 : 0F 19 10 00 E8 C6 32 11 01 98 BE 32 11 05 00 04 01 10 BF 32 11 00 D8 C7 32 11 
        if (memberID == GetPlayerCharacterID()) {                               //0060 : 07 7B 00 9A 00 60 C7 32 11 1B 4B 0C 00 00 16 16 
          mGuildYourRank = RankLevel;                                           //0070 : 0F 01 80 C0 32 11 00 D8 C7 32 11 
        }
        if (RankLevel == 10) {                                                  //007B : 07 19 01 9A 00 D8 C7 32 11 2C 0A 16 
          messageStr = "[PLAYERNAME] is the new Guild Master!";                 //0087 : 0F 00 50 C8 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 20 69 73 20 74 68 65 20 6E 65 77 20 47 75 69 6C 64 20 4D 61 73 74 65 72 21 00 
          static.ReplaceText(messageStr,"[PLAYERNAME]",mGuildMembers[i].Name);  //00B4 : 1C 30 80 69 0F 00 50 C8 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 E8 C6 32 11 01 98 BE 32 11 05 00 00 01 C8 C8 32 11 16 
          Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//00E1 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 50 C8 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        }
        goto jl0126;                                                            //0119 : 06 26 01 
      }
      ++i;                                                                      //011C : A3 00 E8 C6 32 11 16 
    }
    RefreshGuildList();                                                         //0126 : 1B 06 06 00 00 16 
    //07 11 00 9B 01 20 B4 32 11 00 A8 C4 32 11 16 04 0B 0F 00 E8 C6 32 11 25 07 26 01 96 00 E8 C6 32 
    //11 37 01 98 BE 32 11 16 07 1C 01 9A 19 10 00 E8 C6 32 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 
    //00 60 C7 32 11 16 0F 19 10 00 E8 C6 32 11 01 98 BE 32 11 05 00 04 01 10 BF 32 11 00 D8 C7 32 11 
    //07 7B 00 9A 00 60 C7 32 11 1B 4B 0C 00 00 16 16 0F 01 80 C0 32 11 00 D8 C7 32 11 07 19 01 9A 00 
    //D8 C7 32 11 2C 0A 16 0F 00 50 C8 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 20 69 73 20 74 68 
    //65 20 6E 65 77 20 47 75 69 6C 64 20 4D 61 73 74 65 72 21 00 1C 30 80 69 0F 00 50 C8 32 11 1F 5B 
    //50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 E8 C6 32 11 01 98 BE 32 11 05 00 00 01 C8 C8 32 11 
    //16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 
    //00 1B 7E 04 00 00 1F 00 00 50 C8 32 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 26 01 A3 00 E8 C6 
    //32 11 16 06 18 00 1B 06 06 00 00 16 04 0B 47 
  }


  event GuildRemoveMember(int guildID,int CharacterID,byte removeCode) {
    local int i;
    local string messageStr;
    if (CharacterID == GetPlayerCharacterID()) {                                //0000 : 07 1E 00 9A 00 70 CD 32 11 1B 4B 0C 00 00 16 16 
      GuildDestroy(removeCode);                                                 //0010 : 1B 87 05 00 00 00 E8 CD 32 11 16 
    } else {                                                                    //001B : 06 12 02 
      if (mGuildID == guildID) {                                                //001E : 07 12 02 9A 01 20 B4 32 11 00 F0 C9 32 11 16 
        i = 0;                                                                  //002D : 0F 00 60 CE 32 11 25 
        while (i < mGuildMembers.Length) {                                      //0034 : 07 12 02 96 00 60 CE 32 11 37 01 98 BE 32 11 16 
          if (mGuildMembers[i].CharacterID == CharacterID) {                    //0044 : 07 08 02 9A 19 10 00 60 CE 32 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 70 CD 32 11 16 
            switch (removeCode) {                                               //0062 : 05 01 00 E8 CD 32 11 
              case 1 :                                                          //0069 : 0A E2 00 24 01 
                messageStr = Class'StringReferences'.default.PLAYERNAME_has_been_kicked_from_your_guild.Text;//006E : 0F 00 D8 CE 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D0 73 1C 11 
                static.ReplaceText(messageStr,"[PLAYERNAME]",mGuildMembers[i].Name);//0087 : 1C 30 80 69 0F 00 D8 CE 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 60 CE 32 11 01 98 BE 32 11 05 00 00 01 C8 C8 32 11 16 
                Game_Desktop(Outer.Player.GUIDesktop).AddScreenMessage(messageStr);//00B4 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B EF 0B 00 00 00 D8 CE 32 11 16 
                break;                                                          //00DF : 06 F3 01 
              case 2 :                                                          //00E2 : 0A 5B 01 24 02 
                messageStr = Class'StringReferences'.default.PLAYERNAME_has_left_your_guild.Text;//00E7 : 0F 00 D8 CE 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 74 1C 11 
                static.ReplaceText(messageStr,"[PLAYERNAME]",mGuildMembers[i].Name);//0100 : 1C 30 80 69 0F 00 D8 CE 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 60 CE 32 11 01 98 BE 32 11 05 00 00 01 C8 C8 32 11 16 
                Game_Desktop(Outer.Player.GUIDesktop).AddScreenMessage(messageStr);//012D : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B EF 0B 00 00 00 D8 CE 32 11 16 
                break;                                                          //0158 : 06 F3 01 
              case 3 :                                                          //015B : 0A F0 01 24 03 
                messageStr = "[PLAYERNAME] has been deleted from your guild";   //0160 : 0F 00 D8 CE 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 20 68 61 73 20 62 65 65 6E 20 64 65 6C 65 74 65 64 20 66 72 6F 6D 20 79 6F 75 72 20 67 75 69 6C 64 00 
                static.ReplaceText(messageStr,"[PLAYERNAME]",mGuildMembers[i].Name);//0195 : 1C 30 80 69 0F 00 D8 CE 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 60 CE 32 11 01 98 BE 32 11 05 00 00 01 C8 C8 32 11 16 
                Game_Desktop(Outer.Player.GUIDesktop).AddScreenMessage(messageStr);//01C2 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B EF 0B 00 00 00 D8 CE 32 11 16 
                break;                                                          //01ED : 06 F3 01 
              default:                                                          //01F0 : 0A FF FF 
            }
            mGuildMembers.Remove(i,1);                                          //01F3 : 41 01 98 BE 32 11 00 60 CE 32 11 26 
            RefreshGuildList();                                                 //01FF : 1B 06 06 00 00 16 
            goto jl0212;                                                        //0205 : 06 12 02 
          }
          ++i;                                                                  //0208 : A3 00 60 CE 32 11 16 
        }
      }
    }
    //07 1E 00 9A 00 70 CD 32 11 1B 4B 0C 00 00 16 16 1B 87 05 00 00 00 E8 CD 32 11 16 06 12 02 07 12 
    //02 9A 01 20 B4 32 11 00 F0 C9 32 11 16 0F 00 60 CE 32 11 25 07 12 02 96 00 60 CE 32 11 37 01 98 
    //BE 32 11 16 07 08 02 9A 19 10 00 60 CE 32 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 70 CD 32 
    //11 16 05 01 00 E8 CD 32 11 0A E2 00 24 01 0F 00 D8 CE 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 
    //00 0C 02 D0 73 1C 11 1C 30 80 69 0F 00 D8 CE 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 
    //10 00 60 CE 32 11 01 98 BE 32 11 05 00 00 01 C8 C8 32 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 
    //0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B EF 0B 00 00 00 D8 CE 32 11 16 06 
    //F3 01 0A 5B 01 24 02 0F 00 D8 CE 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 48 74 1C 11 
    //1C 30 80 69 0F 00 D8 CE 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 60 CE 32 11 01 
    //98 BE 32 11 05 00 00 01 C8 C8 32 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 
    //71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B EF 0B 00 00 00 D8 CE 32 11 16 06 F3 01 0A F0 01 24 03 
    //0F 00 D8 CE 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 20 68 61 73 20 62 65 65 6E 20 64 65 6C 
    //65 74 65 64 20 66 72 6F 6D 20 79 6F 75 72 20 67 75 69 6C 64 00 1C 30 80 69 0F 00 D8 CE 32 11 1F 
    //5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 19 10 00 60 CE 32 11 01 98 BE 32 11 05 00 00 01 C8 C8 32 
    //11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 
    //00 00 1B EF 0B 00 00 00 D8 CE 32 11 16 06 F3 01 0A FF FF 41 01 98 BE 32 11 00 60 CE 32 11 26 1B 
    //06 06 00 00 16 06 12 02 A3 00 60 CE 32 11 16 06 34 00 04 0B 47 
  }


  event GuildAddMember(int guildID,int CharacterID,int ClassType,int Level,string Name,int Location,int RankLevel,bool Online) {
    local string messageStr;
    if (mGuildID == guildID) {                                                  //0000 : 07 ED 00 9A 01 20 B4 32 11 00 08 D0 32 11 16 
      SetGuildMember(CharacterID,ClassType,Level,Name,Location,RankLevel,Online);//000F : 1B 17 06 00 00 00 F8 D1 32 11 00 70 D2 32 11 00 E8 D2 32 11 00 60 D3 32 11 00 D8 D3 32 11 00 50 D4 32 11 2D 00 C8 D4 32 11 16 
      RefreshGuildList();                                                       //0039 : 1B 06 06 00 00 16 
      if (GetPlayerCharacterID() == CharacterID) {                              //003F : 07 8B 00 9A 1B 4B 0C 00 00 16 00 F8 D1 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddScreenMessage(Class'StringReferences'.default.You_have_joined_a_guild.Text);//004F : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C0 74 1C 11 16 
      } else {                                                                  //0088 : 06 ED 00 
        messageStr = Class'StringReferences'.default.PLAYERNAME_has_joined_your_guild.Text;//008B : 0F 00 40 D5 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 78 88 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",Name);                     //00A4 : 1C 30 80 69 0F 00 40 D5 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 60 D3 32 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddScreenMessage(messageStr);     //00C2 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B EF 0B 00 00 00 40 D5 32 11 16 
      }
    }
    //07 ED 00 9A 01 20 B4 32 11 00 08 D0 32 11 16 1B 17 06 00 00 00 F8 D1 32 11 00 70 D2 32 11 00 E8 
    //D2 32 11 00 60 D3 32 11 00 D8 D3 32 11 00 50 D4 32 11 2D 00 C8 D4 32 11 16 1B 06 06 00 00 16 07 
    //8B 00 9A 1B 4B 0C 00 00 16 00 F8 D1 32 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 
    //28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 
    //00 0C 02 C0 74 1C 11 16 06 ED 00 0F 00 40 D5 32 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 
    //78 88 1C 11 1C 30 80 69 0F 00 40 D5 32 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 60 D3 32 
    //11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 
    //00 00 1B EF 0B 00 00 00 40 D5 32 11 16 04 0B 47 
  }


  delegate OnGuildInviteReq(string fromPawnName,int fromUserID,int guildID,string guildName,int LogoId,int Color1,int Color2);


  event GuildInviteReq(string fromPawnName,int fromUserID,int guildID,string guildName,int LogoId,int Color1,int Color2) {
    OnGuildInviteReq(fromPawnName,fromUserID,guildID,guildName,LogoId,Color1,Color2);//0000 : 43 78 DB 32 11 CB 05 00 00 00 90 DA 32 11 00 F0 DB 32 11 00 68 DC 32 11 00 E0 DC 32 11 00 58 DD 32 11 00 D0 DD 32 11 00 48 DE 32 11 16 
    //43 78 DB 32 11 CB 05 00 00 00 90 DA 32 11 00 F0 DB 32 11 00 68 DC 32 11 00 E0 DC 32 11 00 58 DD 
    //32 11 00 D0 DD 32 11 00 48 DE 32 11 16 04 0B 47 
  }


  event GuildDestroy(byte removeCode) {
    switch (removeCode) {                                                       //0000 : 05 01 00 70 DF 32 11 
      case 1 :                                                                  //0007 : 0A 48 00 24 01 
        Game_Desktop(Outer.Player.GUIDesktop).AddScreenMessage(Class'StringReferences'.default.You_have_been_kicked_from_your_guild.Text);//000C : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E0 72 1C 11 16 
        break;                                                                  //0045 : 06 CD 00 
      case 2 :                                                                  //0048 : 0A 89 00 24 02 
        Game_Desktop(Outer.Player.GUIDesktop).AddScreenMessage(Class'StringReferences'.default.You_have_left_your_guild.Text);//004D : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 58 73 1C 11 16 
        break;                                                                  //0086 : 06 CD 00 
      case 4 :                                                                  //0089 : 0A CA 00 24 04 
        Game_Desktop(Outer.Player.GUIDesktop).AddScreenMessage(Class'StringReferences'.default.Your_guild_has_been_disbanded.Text);//008E : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 68 72 1C 11 16 
        break;                                                                  //00C7 : 06 CD 00 
      default:                                                                  //00CA : 0A FF FF 
    }
    mGuildMembers.Length = 0;                                                   //00CD : 0F 37 01 98 BE 32 11 25 
    ClearGuildInfo();                                                           //00D5 : 1B 5E 0D 00 00 16 
    RefreshGuildList();                                                         //00DB : 1B 06 06 00 00 16 
    RefreshGuildRanks();                                                        //00E1 : 1B 07 06 00 00 16 
    //05 01 00 70 DF 32 11 0A 48 00 24 01 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 
    //0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 
    //E0 72 1C 11 16 06 CD 00 0A 89 00 24 02 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 
    //71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 
    //02 58 73 1C 11 16 06 CD 00 0A CA 00 24 04 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 
    //25 71 0F 05 00 04 01 90 C0 79 0F 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 
    //0C 02 68 72 1C 11 16 06 CD 00 0A FF FF 0F 37 01 98 BE 32 11 25 1B 5E 0D 00 00 16 1B 06 06 00 00 
    //16 1B 07 06 00 00 16 04 0B 47 
  }


  event CreateGuild(bool inviteAck) {
    if (inviteAck) {                                                            //0000 : 07 52 00 2D 00 08 E2 32 11 
      Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.You_have_joined_a_guild_.Text,Class'Game_Desktop'.7);//0009 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 71 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    } else {                                                                    //004F : 06 98 00 
      Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.You_have_created_a_guild_.Text,Class'Game_Desktop'.7);//0052 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 78 71 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    }
    //07 52 00 2D 00 08 E2 32 11 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 
    //04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F0 
    //71 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 98 00 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 
    //00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 
    //20 F7 60 01 05 00 0C 02 78 71 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 04 0B 47 
  }


  event SetGuildRank(int RankLevel,string rankName,int Rights) {
    local ranks Data;
    local int i;
    i = 0;                                                                      //0000 : 0F 00 70 E6 32 11 25 
    while (i < mRanks.Length) {                                                 //0007 : 07 69 00 96 00 70 E6 32 11 37 01 E8 B7 32 11 16 
      if (mRanks[i].Level == RankLevel) {                                       //0017 : 07 5F 00 9A 36 60 B8 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 00 30 E4 32 11 16 
        mRanks[i].Name = rankName;                                              //0031 : 0F 36 20 BE 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 00 E8 E6 32 11 
        mRanks[i].Rights = Rights;                                              //0047 : 0F 36 50 B9 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 00 60 E7 32 11 
        return;                                                                 //005D : 04 0B 
      }
      i++;                                                                      //005F : A5 00 70 E6 32 11 16 
    }
    i = 0;                                                                      //0069 : 0F 00 70 E6 32 11 25 
    while (i < mRanks.Length) {                                                 //0070 : 07 E8 00 96 00 70 E6 32 11 37 01 E8 B7 32 11 16 
      if (mRanks[i].Level == -1) {                                              //0080 : 07 DE 00 9A 36 60 B8 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 1D FF FF FF FF 16 
        mRanks[i].Name = rankName;                                              //009A : 0F 36 20 BE 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 00 E8 E6 32 11 
        mRanks[i].Rights = Rights;                                              //00B0 : 0F 36 50 B9 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 00 60 E7 32 11 
        mRanks[i].Level = RankLevel;                                            //00C6 : 0F 36 60 B8 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 00 30 E4 32 11 
        return;                                                                 //00DC : 04 0B 
      }
      i++;                                                                      //00DE : A5 00 70 E6 32 11 16 
    }
    Data.Name = rankName;                                                       //00E8 : 0F 36 20 BE 32 11 00 D8 E7 32 11 00 E8 E6 32 11 
    Data.Level = RankLevel;                                                     //00F8 : 0F 36 60 B8 32 11 00 D8 E7 32 11 00 30 E4 32 11 
    Data.Rights = Rights;                                                       //0108 : 0F 36 50 B9 32 11 00 D8 E7 32 11 00 60 E7 32 11 
    mRanks[mRanks.Length] = Data;                                               //0118 : 0F 10 37 01 E8 B7 32 11 01 E8 B7 32 11 00 D8 E7 32 11 
    //0F 00 70 E6 32 11 25 07 69 00 96 00 70 E6 32 11 37 01 E8 B7 32 11 16 07 5F 00 9A 36 60 B8 32 11 
    //10 00 70 E6 32 11 01 E8 B7 32 11 00 30 E4 32 11 16 0F 36 20 BE 32 11 10 00 70 E6 32 11 01 E8 B7 
    //32 11 00 E8 E6 32 11 0F 36 50 B9 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 00 60 E7 32 11 04 0B A5 
    //00 70 E6 32 11 16 06 07 00 0F 00 70 E6 32 11 25 07 E8 00 96 00 70 E6 32 11 37 01 E8 B7 32 11 16 
    //07 DE 00 9A 36 60 B8 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 1D FF FF FF FF 16 0F 36 20 BE 32 11 
    //10 00 70 E6 32 11 01 E8 B7 32 11 00 E8 E6 32 11 0F 36 50 B9 32 11 10 00 70 E6 32 11 01 E8 B7 32 
    //11 00 60 E7 32 11 0F 36 60 B8 32 11 10 00 70 E6 32 11 01 E8 B7 32 11 00 30 E4 32 11 04 0B A5 00 
    //70 E6 32 11 16 06 70 00 0F 36 20 BE 32 11 00 D8 E7 32 11 00 E8 E6 32 11 0F 36 60 B8 32 11 00 D8 
    //E7 32 11 00 30 E4 32 11 0F 36 50 B9 32 11 00 D8 E7 32 11 00 60 E7 32 11 0F 10 37 01 E8 B7 32 11 
    //01 E8 B7 32 11 00 D8 E7 32 11 04 0B 47 
  }


  event SetGuildMember(int CharacterID,int ClassType,int Level,string Name,int Location,int RankLevel,bool Online) {
    mGuildMembers.Insert(mGuildMembers.Length,1);                               //0000 : 40 01 98 BE 32 11 37 01 98 BE 32 11 26 
    mGuildMembers[mGuildMembers.Length - 1] = new Class'SBGuildMember';         //000D : 0F 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 11 0B 0B 0B 20 A8 C6 24 01 
    mGuildMembers[mGuildMembers.Length - 1].CharacterID = CharacterID;          //0026 : 0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 78 E9 32 11 
    mGuildMembers[mGuildMembers.Length - 1].ClassType = ClassType;              //0044 : 0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 F0 E9 32 11 00 68 EA 32 11 
    mGuildMembers[mGuildMembers.Length - 1].Level = Level;                      //0062 : 0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 E0 EA 32 11 00 58 EB 32 11 
    mGuildMembers[mGuildMembers.Length - 1].Name = Name;                        //0080 : 0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 00 01 C8 C8 32 11 00 D0 EB 32 11 
    mGuildMembers[mGuildMembers.Length - 1].Location = Location;                //009E : 0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 48 EC 32 11 00 C0 EC 32 11 
    mGuildMembers[mGuildMembers.Length - 1].RankLevel = RankLevel;              //00BC : 0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 10 BF 32 11 00 38 ED 32 11 
    mGuildMembers[mGuildMembers.Length - 1].Online = Online;                    //00DA : 14 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 06 00 04 2D 01 B0 ED 32 11 2D 00 28 EE 32 11 
    if (CharacterID == GetPlayerCharacterID()) {                                //00FA : 07 15 01 9A 00 78 E9 32 11 1B 4B 0C 00 00 16 16 
      mGuildYourRank = RankLevel;                                               //010A : 0F 01 80 C0 32 11 00 38 ED 32 11 
    }
    //40 01 98 BE 32 11 37 01 98 BE 32 11 26 0F 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 11 0B 0B 
    //0B 20 A8 C6 24 01 0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 
    //78 E9 32 11 0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 F0 E9 32 11 00 68 EA 
    //32 11 0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 E0 EA 32 11 00 58 EB 32 11 
    //0F 19 10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 00 01 C8 C8 32 11 00 D0 EB 32 11 0F 19 
    //10 93 37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 48 EC 32 11 00 C0 EC 32 11 0F 19 10 93 
    //37 01 98 BE 32 11 26 16 01 98 BE 32 11 05 00 04 01 10 BF 32 11 00 38 ED 32 11 14 19 10 93 37 01 
    //98 BE 32 11 26 16 01 98 BE 32 11 06 00 04 2D 01 B0 ED 32 11 2D 00 28 EE 32 11 07 15 01 9A 00 78 
    //E9 32 11 1B 4B 0C 00 00 16 16 0F 01 80 C0 32 11 00 38 ED 32 11 04 0B 47 
  }


  event SetGuild(int guildID,string guildName,int LogoId,int Color1,int Color2,int ranking,string motd) {
    mGuildMembers.Length = 0;                                                   //0000 : 0F 37 01 98 BE 32 11 25 
    ClearGuildInfo();                                                           //0008 : 1B 5E 0D 00 00 16 
    mGuildID = guildID;                                                         //000E : 0F 01 20 B4 32 11 00 50 EF 32 11 
    mGuildName = guildName;                                                     //0019 : 0F 01 88 F0 32 11 00 00 F1 32 11 
    mGuildLogoID = LogoId;                                                      //0024 : 0F 01 78 F1 32 11 39 3D 00 F0 F1 32 11 
    mGuildColor1 = Color1;                                                      //0031 : 0F 01 68 F2 32 11 39 3D 00 E0 F2 32 11 
    mGuildColor2 = Color2;                                                      //003E : 0F 01 58 F3 32 11 39 3D 00 D0 F3 32 11 
    mGuildRanking = ranking;                                                    //004B : 0F 01 48 F4 32 11 00 C0 F4 32 11 
    mGuildMOTD = motd;                                                          //0056 : 0F 01 98 B4 32 11 00 38 F5 32 11 
    mInGuild = True;                                                            //0061 : 14 2D 01 50 E8 32 11 27 
    //0F 37 01 98 BE 32 11 25 1B 5E 0D 00 00 16 0F 01 20 B4 32 11 00 50 EF 32 11 0F 01 88 F0 32 11 00 
    //00 F1 32 11 0F 01 78 F1 32 11 39 3D 00 F0 F1 32 11 0F 01 68 F2 32 11 39 3D 00 E0 F2 32 11 0F 01 
    //58 F3 32 11 39 3D 00 D0 F3 32 11 0F 01 48 F4 32 11 00 C0 F4 32 11 0F 01 98 B4 32 11 00 38 F5 32 
    //11 14 2D 01 50 E8 32 11 27 04 0B 47 
  }


  event OnFailResult(byte Result,optional string pawnName) {
    local string messageStr;
    switch (Result) {                                                           //0000 : 05 01 00 60 F6 32 11 
      case 16 :                                                                 //0007 : 0A 55 00 24 10 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_create_guild_.Text,Class'Game_Desktop'.7);//000C : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 28 76 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0052 : 06 DC 08 
      case 17 :                                                                 //0055 : 0A A3 00 24 11 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.You_do_not_have_enough_money_guild_.Text,Class'Game_Desktop'.7);//005A : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 76 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //00A0 : 06 DC 08 
      case 18 :                                                                 //00A3 : 0A F1 00 24 12 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.A_guild_with_that_name_already_exists_.Text,Class'Game_Desktop'.7);//00A8 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 77 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //00EE : 06 DC 08 
      case 19 :                                                                 //00F1 : 0A 3F 01 24 13 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_disband_guild_.Text,Class'Game_Desktop'.7);//00F6 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 77 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //013C : 06 DC 08 
      case 8 :                                                                  //013F : 0A 98 01 24 08 
        messageStr = Class'StringReferences'.default.You_are_currently_not_allowed_to_do_that_.Text;//0144 : 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 69 1C 11 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//015D : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0195 : 06 DC 08 
      case 20 :                                                                 //0198 : 0A E6 01 24 14 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_add_guild_member_.Text,Class'Game_Desktop'.7);//019D : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 78 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //01E3 : 06 DC 08 
      case 21 :                                                                 //01E6 : 0A EE 01 24 15 
        break;                                                                  //01EB : 06 DC 08 
      case 24 :                                                                 //01EE : 0A 3C 02 24 18 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_kick_guild_member_.Text,Class'Game_Desktop'.7);//01F3 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 78 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0239 : 06 DC 08 
      case 25 :                                                                 //023C : 0A 8A 02 24 19 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_leave_the_guild_.Text,Class'Game_Desktop'.7);//0241 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 79 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0287 : 06 DC 08 
      case 26 :                                                                 //028A : 0A D8 02 24 1A 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_promote_guild_member_.Text,Class'Game_Desktop'.7);//028F : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 7A 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //02D5 : 06 DC 08 
      case 27 :                                                                 //02D8 : 0A 26 03 24 1B 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_demote_guild_member_.Text,Class'Game_Desktop'.7);//02DD : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 7B 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0323 : 06 DC 08 
      case 28 :                                                                 //0326 : 0A 74 03 24 1C 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_add_the_guild_rank_.Text,Class'Game_Desktop'.7);//032B : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 7C 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0371 : 06 DC 08 
      case 29 :                                                                 //0374 : 0A C2 03 24 1D 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_set_the_guild_rank_.Text,Class'Game_Desktop'.7);//0379 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 7C 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //03BF : 06 DC 08 
      case 30 :                                                                 //03C2 : 0A 10 04 24 1E 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_delete_the_guild_rank_.Text,Class'Game_Desktop'.7);//03C7 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A8 7D 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //040D : 06 DC 08 
      case 31 :                                                                 //0410 : 0A 5E 04 24 1F 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_set_the_guild_rank_rights_.Text,Class'Game_Desktop'.7);//0415 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 7E 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //045B : 06 DC 08 
      case 32 :                                                                 //045E : 0A AC 04 24 20 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_set_the_guild_Message_of_the_Day_.Text,Class'Game_Desktop'.7);//0463 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 7E 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //04A9 : 06 DC 08 
      case 22 :                                                                 //04AC : 0A FA 04 24 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Failed_to_change_guild_member_rank_.Text,Class'Game_Desktop'.7);//04B1 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 7B 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //04F7 : 06 DC 08 
      case 33 :                                                                 //04FA : 0A FF 04 24 21 
      case 34 :                                                                 //04FF : 0A 04 05 24 22 
      case 35 :                                                                 //0504 : 0A 09 05 24 23 
      case 36 :                                                                 //0509 : 0A 57 05 24 24 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Guild_system_error_.Text,Class'Game_Desktop'.7);//050E : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 75 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0554 : 06 DC 08 
      case 1 :                                                                  //0557 : 0A 5C 05 24 01 
      case 6 :                                                                  //055C : 0A D3 05 24 06 
        messageStr = Class'StringReferences'.default.PLAYERNAME_is_busy_try_again_later_.Text;//0561 : 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 67 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //057A : 1C 30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0598 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //05D0 : 06 DC 08 
      case 3 :                                                                  //05D3 : 0A 4A 06 24 03 
        messageStr = Class'StringReferences'.default.PLAYERNAME_has_declined_to_join_your_guild_.Text;//05D8 : 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 6C 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //05F1 : 1C 30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//060F : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0647 : 06 DC 08 
      case 4 :                                                                  //064A : 0A C1 06 24 04 
        messageStr = Class'StringReferences'.default.You_have_invited_PLAYERNAME_to_your_guild_.Text;//064F : 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 6C 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //0668 : 1C 30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0686 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //06BE : 06 DC 08 
      case 5 :                                                                  //06C1 : 0A 38 07 24 05 
        messageStr = Class'StringReferences'.default.PLAYERNAME_is_already_in_another_guild_.Text;//06C6 : 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 70 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //06DF : 1C 30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//06FD : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0735 : 06 DC 08 
      case 10 :                                                                 //0738 : 0A AF 07 24 0A 
        messageStr = Class'StringReferences'.default.PLAYERNAME_is_unknown__check_the_spelling_.Text;//073D : 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 69 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //0756 : 1C 30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//0774 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //07AC : 06 DC 08 
      case 7 :                                                                  //07AF : 0A 26 08 24 07 
        messageStr = Class'StringReferences'.default.PLAYERNAME_ignored_you_.Text;//07B4 : 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 66 1C 11 
        static.ReplaceText(messageStr,"[PLAYERNAME]",pawnName);                 //07CD : 1C 30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",messageStr,Class'Game_Desktop'.7);//07EB : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0823 : 06 DC 08 
      case 9 :                                                                  //0826 : 0A 2B 08 24 09 
      case 11 :                                                                 //082B : 0A 30 08 24 0B 
      case 12 :                                                                 //0830 : 0A 35 08 24 0C 
      case 14 :                                                                 //0835 : 0A 83 08 24 0E 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.Guild_system_error_.Text,Class'Game_Desktop'.7);//083A : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 75 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //0880 : 06 DC 08 
      case 13 :                                                                 //0883 : 0A 8B 08 24 0D 
        break;                                                                  //0888 : 06 DC 08 
      case 15 :                                                                 //088B : 0A D9 08 24 0F 
        Game_Desktop(Outer.Player.GUIDesktop).AddMessage("",Class'StringReferences'.default.You_cannot_alter_the_three_default_guild_ranks_.Text,Class'Game_Desktop'.7);//0890 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 7F 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
        break;                                                                  //08D6 : 06 DC 08 
      default:                                                                  //08D9 : 0A FF FF 
    }
    //05 01 00 60 F6 32 11 0A 55 00 24 10 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 
    //0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 
    //0C 02 28 76 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A A3 00 24 11 19 2E 60 CE 5A 01 
    //19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 
    //00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 76 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    //06 DC 08 0A F1 00 24 12 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 
    //01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 77 
    //1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A 3F 01 24 13 19 2E 60 CE 5A 01 19 19 01 00 
    //E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 
    //6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 77 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A 
    //98 01 24 08 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 69 1C 11 19 2E 60 
    //CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 
    //00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A E6 01 24 14 19 2E 60 
    //CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 
    //00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 78 1C 11 12 20 60 CE 5A 01 02 00 04 
    //2C 07 16 06 DC 08 0A EE 01 24 15 06 DC 08 0A 3C 02 24 18 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 
    //05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 
    //20 20 F7 60 01 05 00 0C 02 F8 78 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A 8A 02 24 
    //19 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 
    //00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 79 1C 11 12 20 60 CE 5A 
    //01 02 00 04 2C 07 16 06 DC 08 0A D8 02 24 1A 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 
    //28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 
    //01 05 00 0C 02 D8 7A 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A 26 03 24 1B 19 2E 60 
    //CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 
    //00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 7B 1C 11 12 20 60 CE 5A 01 02 00 04 
    //2C 07 16 06 DC 08 0A 74 03 24 1C 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 
    //05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 
    //02 40 7C 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A C2 03 24 1D 19 2E 60 CE 5A 01 19 
    //19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 
    //36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 7C 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 
    //DC 08 0A 10 04 24 1E 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 
    //90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A8 7D 1C 
    //11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A 5E 04 24 1F 19 2E 60 CE 5A 01 19 19 01 00 E4 
    //6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 
    //0F 12 20 20 F7 60 01 05 00 0C 02 20 7E 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A AC 
    //04 24 20 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
    //26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 7E 1C 11 12 20 60 
    //CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A FA 04 24 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 
    //04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 
    //F7 60 01 05 00 0C 02 C8 7B 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A FF 04 24 21 0A 
    //04 05 24 22 0A 09 05 24 23 0A 57 05 24 24 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 
    //25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 B0 75 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A 5C 05 24 01 0A D3 05 24 
    //06 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 67 1C 11 1C 30 80 69 0F 00 
    //38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 19 2E 60 CE 5A 01 19 19 
    //01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 
    //38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A 4A 06 24 03 0F 00 38 03 33 11 36 58 
    //C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 6C 1C 11 1C 30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 
    //59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 
    //28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 
    //01 02 00 04 2C 07 16 06 DC 08 0A C1 06 24 04 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 
    //05 00 0C 02 50 6C 1C 11 1C 30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 
    //00 B0 03 33 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 
    //C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 
    //08 0A 38 07 24 05 0F 00 38 03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 70 1C 11 1C 
    //30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 19 2E 60 
    //CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 
    //00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A AF 07 24 0A 0F 00 38 
    //03 33 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 69 1C 11 1C 30 80 69 0F 00 38 03 33 11 
    //1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 B0 03 33 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 
    //0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 
    //12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A 26 08 24 07 0F 00 38 03 33 11 36 58 C6 6B 0F 12 
    //20 20 F7 60 01 05 00 0C 02 B0 66 1C 11 1C 30 80 69 0F 00 38 03 33 11 1F 5B 50 4C 41 59 45 52 4E 
    //41 4D 45 5D 00 00 B0 03 33 11 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 
    //05 00 04 01 90 C0 79 0F 18 00 00 1B 7E 04 00 00 1F 00 00 38 03 33 11 12 20 60 CE 5A 01 02 00 04 
    //2C 07 16 06 DC 08 0A 2B 08 24 09 0A 30 08 24 0B 0A 35 08 24 0C 0A 83 08 24 0E 19 2E 60 CE 5A 01 
    //19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 
    //00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 75 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    //06 DC 08 0A 8B 08 24 0D 06 DC 08 0A D9 08 24 0F 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 
    //01 28 25 71 0F 05 00 04 01 90 C0 79 0F 26 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 
    //60 01 05 00 0C 02 10 7F 1C 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 DC 08 0A FF FF 04 0B 47 
  }


  event OnSetClass(int CharacterID,int aNewClass) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 58 06 33 11 25 
    while (i < mGuildMembers.Length) {                                          //0007 : 07 62 00 96 00 58 06 33 11 37 01 98 BE 32 11 16 
      if (mGuildMembers[i].CharacterID == CharacterID) {                        //0017 : 07 58 00 9A 19 10 00 58 06 33 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 28 05 33 11 16 
        mGuildMembers[i].ClassType = aNewClass;                                 //0035 : 0F 19 10 00 58 06 33 11 01 98 BE 32 11 05 00 04 01 F0 E9 32 11 00 D0 06 33 11 
        RefreshGuildList();                                                     //004F : 1B 06 06 00 00 16 
        goto jl0062;                                                            //0055 : 06 62 00 
      }
      ++i;                                                                      //0058 : A3 00 58 06 33 11 16 
    }
    //0F 00 58 06 33 11 25 07 62 00 96 00 58 06 33 11 37 01 98 BE 32 11 16 07 58 00 9A 19 10 00 58 06 
    //33 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 28 05 33 11 16 0F 19 10 00 58 06 33 11 01 98 BE 
    //32 11 05 00 04 01 F0 E9 32 11 00 D0 06 33 11 1B 06 06 00 00 16 06 62 00 A3 00 58 06 33 11 16 06 
    //07 00 04 0B 47 
  }


  event OnLevelUp(int CharacterID,int aNewLevel) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 28 09 33 11 25 
    while (i < mGuildMembers.Length) {                                          //0007 : 07 62 00 96 00 28 09 33 11 37 01 98 BE 32 11 16 
      if (mGuildMembers[i].CharacterID == CharacterID) {                        //0017 : 07 58 00 9A 19 10 00 28 09 33 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 F8 07 33 11 16 
        mGuildMembers[i].Level = aNewLevel;                                     //0035 : 0F 19 10 00 28 09 33 11 01 98 BE 32 11 05 00 04 01 E0 EA 32 11 00 A0 09 33 11 
        RefreshGuildList();                                                     //004F : 1B 06 06 00 00 16 
        goto jl0062;                                                            //0055 : 06 62 00 
      }
      ++i;                                                                      //0058 : A3 00 28 09 33 11 16 
    }
    //0F 00 28 09 33 11 25 07 62 00 96 00 28 09 33 11 37 01 98 BE 32 11 16 07 58 00 9A 19 10 00 28 09 
    //33 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 F8 07 33 11 16 0F 19 10 00 28 09 33 11 01 98 BE 
    //32 11 05 00 04 01 E0 EA 32 11 00 A0 09 33 11 1B 06 06 00 00 16 06 62 00 A3 00 28 09 33 11 16 06 
    //07 00 04 0B 47 
  }


  event Offline(int pawnID) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 F0 0B 33 11 25 
    while (i < mGuildMembers.Length) {                                          //0007 : 07 5F 00 96 00 F0 0B 33 11 37 01 98 BE 32 11 16 
      if (mGuildMembers[i].CharacterID == pawnID) {                             //0017 : 07 55 00 9A 19 10 00 F0 0B 33 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 C8 0A 33 11 16 
        mGuildMembers[i].Online = False;                                        //0035 : 14 19 10 00 F0 0B 33 11 01 98 BE 32 11 06 00 04 2D 01 B0 ED 32 11 28 
        RefreshGuildList();                                                     //004C : 1B 06 06 00 00 16 
        goto jl005F;                                                            //0052 : 06 5F 00 
      }
      ++i;                                                                      //0055 : A3 00 F0 0B 33 11 16 
    }
    //0F 00 F0 0B 33 11 25 07 5F 00 96 00 F0 0B 33 11 37 01 98 BE 32 11 16 07 55 00 9A 19 10 00 F0 0B 
    //33 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 C8 0A 33 11 16 14 19 10 00 F0 0B 33 11 01 98 BE 
    //32 11 06 00 04 2D 01 B0 ED 32 11 28 1B 06 06 00 00 16 06 5F 00 A3 00 F0 0B 33 11 16 06 07 00 04 
    //0B 47 
  }


  delegate OnGuildOnline();


  event Online(int pawnID,int worldID) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 50 0F 33 11 25 
    while (i < mGuildMembers.Length) {                                          //0007 : 07 83 00 96 00 50 0F 33 11 37 01 98 BE 32 11 16 
      if (mGuildMembers[i].CharacterID == pawnID) {                             //0017 : 07 79 00 9A 19 10 00 50 0F 33 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 F8 0D 33 11 16 
        mGuildMembers[i].Online = True;                                         //0035 : 14 19 10 00 50 0F 33 11 01 98 BE 32 11 06 00 04 2D 01 B0 ED 32 11 27 
        mGuildMembers[i].Location = worldID;                                    //004C : 0F 19 10 00 50 0F 33 11 01 98 BE 32 11 05 00 04 01 48 EC 32 11 00 C8 0F 33 11 
        RefreshGuildList();                                                     //0066 : 1B 06 06 00 00 16 
        OnGuildOnline();                                                        //006C : 43 40 10 33 11 CD 05 00 00 16 
        goto jl0083;                                                            //0076 : 06 83 00 
      }
      ++i;                                                                      //0079 : A3 00 50 0F 33 11 16 
    }
    //0F 00 50 0F 33 11 25 07 83 00 96 00 50 0F 33 11 37 01 98 BE 32 11 16 07 79 00 9A 19 10 00 50 0F 
    //33 11 01 98 BE 32 11 05 00 04 01 08 C0 32 11 00 F8 0D 33 11 16 14 19 10 00 50 0F 33 11 01 98 BE 
    //32 11 06 00 04 2D 01 B0 ED 32 11 27 0F 19 10 00 50 0F 33 11 01 98 BE 32 11 05 00 04 01 48 EC 32 
    //11 00 C8 0F 33 11 1B 06 06 00 00 16 43 40 10 33 11 CD 05 00 00 16 06 83 00 A3 00 50 0F 33 11 16 
    //06 07 00 04 0B 47 
  }


  delegate OnGuildRanksRefresh();


  event RefreshGuildRanks() {
    SortRankList();                                                             //0000 : 1B DD 0D 00 00 16 
    OnGuildRanksRefresh();                                                      //0006 : 43 90 12 33 11 CE 05 00 00 16 
    //1B DD 0D 00 00 16 43 90 12 33 11 CE 05 00 00 16 04 0B 47 
  }


  delegate OnGuildListRefresh();


  event RefreshGuildList() {
    OnGuildListRefresh();                                                       //0000 : 43 E8 14 33 11 CC 05 00 00 16 
    mGuildChanged.Trigger();                                                    //000A : 19 01 60 15 33 11 06 00 00 1C 00 96 84 0F 16 
    //43 E8 14 33 11 CC 05 00 00 16 19 01 60 15 33 11 06 00 00 1C 00 96 84 0F 16 04 0B 47 
  }


  function int GetRankRights(int RankLevel) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 98 17 33 11 25 
    while (i < mRanks.Length) {                                                 //0007 : 07 4C 00 96 00 98 17 33 11 37 01 E8 B7 32 11 16 
      if (mRanks[i].Level == RankLevel) {                                       //0017 : 07 42 00 9A 36 60 B8 32 11 10 00 98 17 33 11 01 E8 B7 32 11 00 88 16 33 11 16 
        return mRanks[i].Rights;                                                //0031 : 04 36 50 B9 32 11 10 00 98 17 33 11 01 E8 B7 32 11 
      }
      ++i;                                                                      //0042 : A3 00 98 17 33 11 16 
    }
    return 0;                                                                   //004C : 04 25 
    //0F 00 98 17 33 11 25 07 4C 00 96 00 98 17 33 11 37 01 E8 B7 32 11 16 07 42 00 9A 36 60 B8 32 11 
    //10 00 98 17 33 11 01 E8 B7 32 11 00 88 16 33 11 16 04 36 50 B9 32 11 10 00 98 17 33 11 01 E8 B7 
    //32 11 A3 00 98 17 33 11 16 06 07 00 04 25 04 0B 47 
  }


  function SortRankList() {
    local int i;
    local int j;
    local ranks Data;
    i = 0;                                                                      //0000 : 0F 00 38 19 33 11 25 
    while (i < mRanks.Length - 1) {                                             //0007 : 07 AA 00 96 00 38 19 33 11 93 37 01 E8 B7 32 11 26 16 16 
      j = i + 1;                                                                //001A : 0F 00 C8 1A 33 11 92 00 38 19 33 11 26 16 
      while (j < mRanks.Length) {                                               //0028 : 07 A0 00 96 00 C8 1A 33 11 37 01 E8 B7 32 11 16 
        if (mRanks[i].Level < mRanks[j].Level) {                                //0038 : 07 96 00 96 36 60 B8 32 11 10 00 38 19 33 11 01 E8 B7 32 11 36 60 B8 32 11 10 00 C8 1A 33 11 01 E8 B7 32 11 16 
          Data = mRanks[i];                                                     //005D : 0F 00 40 1B 33 11 10 00 38 19 33 11 01 E8 B7 32 11 
          mRanks[i] = mRanks[j];                                                //006E : 0F 10 00 38 19 33 11 01 E8 B7 32 11 10 00 C8 1A 33 11 01 E8 B7 32 11 
          mRanks[j] = Data;                                                     //0085 : 0F 10 00 C8 1A 33 11 01 E8 B7 32 11 00 40 1B 33 11 
        }
        j++;                                                                    //0096 : A5 00 C8 1A 33 11 16 
      }
      i++;                                                                      //00A0 : A5 00 38 19 33 11 16 
    }
    //0F 00 38 19 33 11 25 07 AA 00 96 00 38 19 33 11 93 37 01 E8 B7 32 11 26 16 16 0F 00 C8 1A 33 11 
    //92 00 38 19 33 11 26 16 07 A0 00 96 00 C8 1A 33 11 37 01 E8 B7 32 11 16 07 96 00 96 36 60 B8 32 
    //11 10 00 38 19 33 11 01 E8 B7 32 11 36 60 B8 32 11 10 00 C8 1A 33 11 01 E8 B7 32 11 16 0F 00 40 
    //1B 33 11 10 00 38 19 33 11 01 E8 B7 32 11 0F 10 00 38 19 33 11 01 E8 B7 32 11 10 00 C8 1A 33 11 
    //01 E8 B7 32 11 0F 10 00 C8 1A 33 11 01 E8 B7 32 11 00 40 1B 33 11 A5 00 C8 1A 33 11 16 06 28 00 
    //A5 00 38 19 33 11 16 06 07 00 04 0B 47 
  }


  function string GetGuildRankName(int RankLevel) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 78 1D 33 11 25 
    while (i < mRanks.Length) {                                                 //0007 : 07 4C 00 96 00 78 1D 33 11 37 01 E8 B7 32 11 16 
      if (mRanks[i].Level == RankLevel) {                                       //0017 : 07 42 00 9A 36 60 B8 32 11 10 00 78 1D 33 11 01 E8 B7 32 11 00 68 1C 33 11 16 
        return mRanks[i].Name;                                                  //0031 : 04 36 20 BE 32 11 10 00 78 1D 33 11 01 E8 B7 32 11 
      }
      ++i;                                                                      //0042 : A3 00 78 1D 33 11 16 
    }
    return "";                                                                  //004C : 04 1F 00 
    //0F 00 78 1D 33 11 25 07 4C 00 96 00 78 1D 33 11 37 01 E8 B7 32 11 16 07 42 00 9A 36 60 B8 32 11 
    //10 00 78 1D 33 11 01 E8 B7 32 11 00 68 1C 33 11 16 04 36 20 BE 32 11 10 00 78 1D 33 11 01 E8 B7 
    //32 11 A3 00 78 1D 33 11 16 06 07 00 04 1F 00 04 0B 47 
  }


  function ClearGuildInfo() {
    local int i;
    mGuildID = 0;                                                               //0000 : 0F 01 20 B4 32 11 25 
    mGuildName = "";                                                            //0007 : 0F 01 88 F0 32 11 1F 00 
    mGuildLogoID = 0;                                                           //000F : 0F 01 78 F1 32 11 24 00 
    mGuildColor1 = 0;                                                           //0017 : 0F 01 68 F2 32 11 24 00 
    mGuildColor2 = 0;                                                           //001F : 0F 01 58 F3 32 11 24 00 
    mGuildRanking = 0;                                                          //0027 : 0F 01 48 F4 32 11 25 
    mGuildMOTD = "";                                                            //002E : 0F 01 98 B4 32 11 1F 00 
    mInGuild = False;                                                           //0036 : 14 2D 01 50 E8 32 11 28 
    i = 0;                                                                      //003E : 0F 00 18 1F 33 11 25 
    while (i < mRanks.Length) {                                                 //0045 : 07 9A 00 96 00 18 1F 33 11 37 01 E8 B7 32 11 16 
      mRanks[i].Level = -1;                                                     //0055 : 0F 36 60 B8 32 11 10 00 18 1F 33 11 01 E8 B7 32 11 1D FF FF FF FF 
      mRanks[i].Name = "";                                                      //006B : 0F 36 20 BE 32 11 10 00 18 1F 33 11 01 E8 B7 32 11 1F 00 
      mRanks[i].Rights = 0;                                                     //007E : 0F 36 50 B9 32 11 10 00 18 1F 33 11 01 E8 B7 32 11 25 
      ++i;                                                                      //0090 : A3 00 18 1F 33 11 16 
    }
    //0F 01 20 B4 32 11 25 0F 01 88 F0 32 11 1F 00 0F 01 78 F1 32 11 24 00 0F 01 68 F2 32 11 24 00 0F 
    //01 58 F3 32 11 24 00 0F 01 48 F4 32 11 25 0F 01 98 B4 32 11 1F 00 14 2D 01 50 E8 32 11 28 0F 00 
    //18 1F 33 11 25 07 9A 00 96 00 18 1F 33 11 37 01 E8 B7 32 11 16 0F 36 60 B8 32 11 10 00 18 1F 33 
    //11 01 E8 B7 32 11 1D FF FF FF FF 0F 36 20 BE 32 11 10 00 18 1F 33 11 01 E8 B7 32 11 1F 00 0F 36 
    //50 B9 32 11 10 00 18 1F 33 11 01 E8 B7 32 11 25 A3 00 18 1F 33 11 16 06 45 00 04 0B 47 
  }


  function bool AllowRights(int rankRightConst) {
    if ((GetRankRights(mGuildYourRank) & rankRightConst) == rankRightConst) {   //0000 : 07 1E 00 9A 9C 1B 37 0F 00 00 01 80 C0 32 11 16 00 40 21 33 11 16 00 40 21 33 11 16 
      return True;                                                              //001C : 04 27 
    }
    return False;                                                               //001E : 04 28 
    //07 1E 00 9A 9C 1B 37 0F 00 00 01 80 C0 32 11 16 00 40 21 33 11 16 00 40 21 33 11 16 04 27 04 28 
    //04 0B 47 
  }


  function int GetPlayerCharacterID() {
    return Game_Pawn(Outer.Pawn).GetCharacterID();                              //0000 : 04 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 
    //04 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 04 0B 
    //47 
  }


  native function GuildInviteAck(int guildID,string fromPawnName,int fromUserID,int responseCode);


  native function GetGuildInfo();


  native function GuildSetMOTD(string motd);


  native function GuildRankSetRights(int RankLevel,int rightsFlag);


  native function GuildRankDelete(int RankLevel);


  native function GuildRankSet(int RankLevel,string rankName);


  native function GuildDemote(int demotePawnID);


  native function GuildPromote(int promotePawnID);


  native function GuildLeave();


  native function GuildKick(int kickPawnID);


  native function GuildInvite(string toPawnName);


  native function GuildDisband();


  native function GuildCreate(string guildName,int LogoId,int col1,int col2);


  function cl_OnShutdown() {
    Super.cl_OnShutdown();                                                      //0000 : 1C 00 C4 19 11 16 
    mGuildChanged.Delete();                                                     //0006 : 19 01 60 15 33 11 06 00 00 1B 7B 0C 00 00 16 
    //1C 00 C4 19 11 16 19 01 60 15 33 11 06 00 00 1B 7B 0C 00 00 16 04 0B 47 
  }


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    GetGuildInfo();                                                             //0006 : 1B 48 0F 00 00 16 
    //1C E0 C4 19 11 16 1B 48 0F 00 00 16 04 0B 47 
  }


  function Init() {
    mGuildChanged = new Class'EventNotification';                               //0000 : 0F 01 60 15 33 11 11 0B 0B 0B 20 70 52 5B 01 
    //0F 01 60 15 33 11 11 0B 0B 0B 20 70 52 5B 01 04 0B 47 
  }



