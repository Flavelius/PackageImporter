//==============================================================================
//  Game_Chat
//==============================================================================

class Game_Chat extends Base_Component within Game_PlayerController
    native
    dependsOn(SBDBSync,Game_PlayerController,Player,GUI_BaseDesktop,Game_GUI,Game_PlayerFriends,Game_Desktop,Game_Pawn,Game_Character,Game_PlayerPawn)
  ;

  const MAX_CHAT_MESSAGE_LENGTH =  256;
  enum EGameChatRanges {
    GCR_LOCAL ,
    GCR_WORLD ,
    GCR_TRADE ,
    GCR_TEAM ,
    GCR_GUILD ,
    GCR_PRIVATE ,
    GCR_COMBAT ,
    GCR_SYSTEM ,
    GCR_BROADCAST 
  };

  var (null);
  var (null);
  var (null);


  protected native function sv2cl_SendOnScreenMessage_CallStub();


  event sv2cl_SendOnScreenMessage(int aLocalizedStringID,optional Color aColor) {
    local string lMessage;
    lMessage = Class'SBDBSync'.GetDescription(aLocalizedStringID);              //0000 : 0F 00 80 7A 1E 11 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 68 79 1E 11 16 
    if (lMessage != "") {                                                       //001A : 07 54 00 7B 00 80 7A 1E 11 1F 00 16 
      Outer.Player.GUIDesktop.AddScreenMessage(lMessage,aColor);                //0026 : 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 10 00 00 1B EF 0B 00 00 00 80 7A 1E 11 00 F8 7A 1E 11 16 
      goto jl0054;                                                              //0051 : 06 54 00 
    }
    //0F 00 80 7A 1E 11 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 68 79 1E 11 16 07 54 00 7B 00 80 
    //7A 1E 11 1F 00 16 19 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 10 00 
    //00 1B EF 0B 00 00 00 80 7A 1E 11 00 F8 7A 1E 11 16 06 54 00 04 0B 47 
  }


  exec function SlashChatMessage() {
    if (Outer.GUI.ChatHandle == 0) {                                            //0000 : 07 35 00 9A 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 05 00 04 01 A8 7C 1E 11 25 16 
      Outer.GUI.ShowChat();                                                     //001D : 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B FB 0C 00 00 16 
    }
    OnBeginSlashChatMessageEntry();                                             //0035 : 43 20 7D 1E 11 B5 05 00 00 16 
    //07 35 00 9A 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 05 00 04 01 A8 7C 1E 11 25 16 19 19 01 
    //00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B FB 0C 00 00 16 43 20 7D 1E 11 B5 05 00 00 16 04 
    //0B 47 
  }


  exec function EnterChatMessage(optional string aMessage) {
    if (Outer.GUI.ChatHandle == 0) {                                            //0000 : 07 35 00 9A 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 05 00 04 01 A8 7C 1E 11 25 16 
      Outer.GUI.ShowChat();                                                     //001D : 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B FB 0C 00 00 16 
    }
    OnBeginChatMessageEntry(aMessage);                                          //0035 : 43 50 7F 1E 11 B4 05 00 00 00 48 7E 1E 11 16 
    //07 35 00 9A 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 05 00 04 01 A8 7C 1E 11 25 16 19 19 01 
    //00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B FB 0C 00 00 16 43 50 7F 1E 11 B4 05 00 00 00 48 
    //7E 1E 11 16 04 0B 47 
  }


  function cl_OnMessage(string aSender,string aMessage,int aChannel) {
    if (!Outer.GroupingFriends.IsIgnoringName(aSender)) {                       //0000 : 07 57 00 81 19 19 01 00 E4 6B 0F 05 00 04 01 50 A2 1B 11 0B 00 04 1B 4F 0F 00 00 00 78 80 1E 11 16 16 
      Game_Desktop(Outer.Player.GUIDesktop).AddMessage(aSender,aMessage,aChannel);//0022 : 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 15 00 00 1B 7E 04 00 00 00 78 80 1E 11 00 F0 80 1E 11 00 68 81 1E 11 16 
    }
    //07 57 00 81 19 19 01 00 E4 6B 0F 05 00 04 01 50 A2 1B 11 0B 00 04 1B 4F 0F 00 00 00 78 80 1E 11 
    //16 16 19 2E 60 CE 5A 01 19 19 01 00 E4 6B 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 15 
    //00 00 1B 7E 04 00 00 00 78 80 1E 11 00 F0 80 1E 11 00 68 81 1E 11 16 04 0B 47 
  }


  function cl_NPCMessage(string aSender,string aMessage) {
    cl_OnMessage(aSender,aMessage,Class'Game_Desktop'.0);                       //0000 : 1B FA 0C 00 00 00 90 82 1E 11 00 08 83 1E 11 12 20 60 CE 5A 01 01 00 04 25 16 
    //1B FA 0C 00 00 00 90 82 1E 11 00 08 83 1E 11 12 20 60 CE 5A 01 01 00 04 25 16 04 0B 47 
  }


  protected native function sv2cl_OnMessage_CallStub();


  event sv2cl_OnMessage(string aSender,string aMessage,int aChannel) {
    cl_OnMessage(aSender,aMessage,aChannel);                                    //0000 : 1B FA 0C 00 00 00 E0 84 1E 11 00 A8 85 1E 11 00 20 86 1E 11 16 
    //1B FA 0C 00 00 00 E0 84 1E 11 00 A8 85 1E 11 00 20 86 1E 11 16 04 0B 47 
  }


  native function SendMessageToUniverse(byte aRange,int aSenderID,string aReceiver,string aMessage);


  protected native function cl2sv_SendMessage_CallStub();


  private event cl2sv_SendMessage(byte aRange,string aReceiver,string aMessage) {
    local Game_PlayerController PlayerController;
    local bool isMe;
    if (Game_Pawn(Outer.Pawn).IsMuted(aRange)) {                                //0000 : 07 50 00 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0B 00 04 1B EF 0C 00 00 00 88 8A 1E 11 16 
      sv2cl_OnMessage_CallStub("","You are muted on this channel!",0);          //0025 : 1B 73 0C 00 00 1F 00 1F 59 6F 75 20 61 72 65 20 6D 75 74 65 64 20 6F 6E 20 74 68 69 73 20 63 68 61 6E 6E 65 6C 21 00 25 16 
      return;                                                                   //004E : 04 0B 
    }
    aMessage = Left(aMessage,256);                                              //0050 : 0F 00 30 8F 1E 11 80 00 30 8F 1E 11 1D 00 01 00 00 16 
    LogChatMessage(Outer.AccountID,Game_Pawn(Outer.Pawn).Character.sv_GetName(),aMessage);//0062 : 1B F5 0D 00 00 19 01 00 E4 6B 0F 05 00 04 01 28 4D 18 11 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 00 30 8F 1E 11 16 
    isMe = StrCmp(aMessage,"/me",3,False) == 0;                                 //00A1 : 14 2D 00 A8 8F 1E 11 9A C8 00 30 8F 1E 11 1F 2F 6D 65 00 2C 03 28 16 25 16 
    if (isMe) {                                                                 //00BA : 07 DB 00 2D 00 A8 8F 1E 11 
      aMessage = Right(aMessage,Len(aMessage) - 3);                             //00C3 : 0F 00 30 8F 1E 11 EA 00 30 8F 1E 11 93 7D 00 30 8F 1E 11 16 2C 03 16 16 
    }
    switch (aRange) {                                                           //00DB : 05 01 00 88 8A 1E 11 
      case 0 :                                                                  //00E2 : 0A 3C 01 24 00 
        Game_PlayerPawn(Outer.Pawn).sv2rel_SendMessage_CallStub(Game_PlayerPawn(Outer.Pawn).Character.sv_GetName(),aMessage,Class'Game_Desktop'.0);//00E7 : 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 3B 00 00 1B B6 0D 00 00 19 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 00 30 8F 1E 11 12 20 60 CE 5A 01 01 00 04 25 16 
        break;                                                                  //0139 : 06 E9 02 
      case 1 :                                                                  //013C : 0A D7 01 24 01 
        foreach Outer.AllActors(Class'Game_PlayerController',PlayerController,'None') {//0141 : 2F 19 01 00 E4 6B 0F 12 00 00 61 30 20 90 18 5B 01 00 20 90 1E 11 21 00 00 00 00 16 D3 01 
          if (PlayerController != Game_PlayerPawn(Outer.Pawn).Controller) {     //015F : 07 D2 01 77 00 20 90 1E 11 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 00 6E 6C 0F 16 
            PlayerController.Chat.sv2cl_OnMessage_CallStub(Game_Pawn(Outer.Pawn).Character.sv_GetName(),aMessage,Class'Game_Desktop'.1);//0185 : 19 19 00 20 90 1E 11 05 00 04 01 E8 A0 1B 11 3B 00 00 1B 73 0C 00 00 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 00 30 8F 1E 11 12 20 60 CE 5A 01 01 00 04 26 16 
          }
      }
      goto jl02E9;                                                              //01D4 : 06 E9 02 
    case 2 :                                                                    //01D7 : 0A 73 02 24 02 
      foreach Outer.AllActors(Class'Game_PlayerController',PlayerController,'None') {//01DC : 2F 19 01 00 E4 6B 0F 12 00 00 61 30 20 90 18 5B 01 00 20 90 1E 11 21 00 00 00 00 16 6F 02 
        if (PlayerController != Game_PlayerPawn(Outer.Pawn).Controller) {       //01FA : 07 6E 02 77 00 20 90 1E 11 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 00 6E 6C 0F 16 
          PlayerController.Chat.sv2cl_OnMessage_CallStub(Game_Pawn(Outer.Pawn).Character.sv_GetName(),aMessage,Class'Game_Desktop'.2);//0220 : 19 19 00 20 90 1E 11 05 00 04 01 E8 A0 1B 11 3C 00 00 1B 73 0C 00 00 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 00 30 8F 1E 11 12 20 60 CE 5A 01 02 00 04 2C 02 16 
        }
      }
      goto jl02E9;                                                              //0270 : 06 E9 02 
    case 3 :                                                                    //0273 : 0A 78 02 24 03 
    case 4 :                                                                    //0278 : 0A AF 02 24 04 
      SendMessageToUniverse(aRange,Game_PlayerPawn(Outer.Pawn).GetCharacterID(),"",aMessage);//027D : 1B 00 0D 00 00 00 88 8A 1E 11 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 1F 00 00 30 8F 1E 11 16 
      goto jl02E9;                                                              //02AC : 06 E9 02 
    case 5 :                                                                    //02AF : 0A E6 02 24 05 
      SendMessageToUniverse(5,Game_PlayerPawn(Outer.Pawn).GetCharacterID(),aReceiver,aMessage);//02B4 : 1B 00 0D 00 00 24 05 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 00 98 90 1E 11 00 30 8F 1E 11 16 
      goto jl02E9;                                                              //02E3 : 06 E9 02 
    default:                                                                    //02E6 : 0A FF FF 
    }
    //07 50 00 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0B 00 04 1B EF 0C 00 00 00 
    //88 8A 1E 11 16 1B 73 0C 00 00 1F 00 1F 59 6F 75 20 61 72 65 20 6D 75 74 65 64 20 6F 6E 20 74 68 
    //69 73 20 63 68 61 6E 6E 65 6C 21 00 25 16 04 0B 0F 00 30 8F 1E 11 80 00 30 8F 1E 11 1D 00 01 00 
    //00 16 1B F5 0D 00 00 19 01 00 E4 6B 0F 05 00 04 01 28 4D 18 11 19 19 2E 18 38 5B 01 19 01 00 E4 
    //6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 00 30 8F 1E 11 
    //16 14 2D 00 A8 8F 1E 11 9A C8 00 30 8F 1E 11 1F 2F 6D 65 00 2C 03 28 16 25 16 07 DB 00 2D 00 A8 
    //8F 1E 11 0F 00 30 8F 1E 11 EA 00 30 8F 1E 11 93 7D 00 30 8F 1E 11 16 2C 03 16 16 05 01 00 88 8A 
    //1E 11 0A 3C 01 24 00 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 3B 00 00 1B B6 
    //0D 00 00 19 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 
    //06 00 00 1C 78 E1 18 11 16 00 30 8F 1E 11 12 20 60 CE 5A 01 01 00 04 25 16 06 E9 02 0A D7 01 24 
    //01 2F 19 01 00 E4 6B 0F 12 00 00 61 30 20 90 18 5B 01 00 20 90 1E 11 21 00 00 00 00 16 D3 01 07 
    //D2 01 77 00 20 90 1E 11 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 
    //00 6E 6C 0F 16 19 19 00 20 90 1E 11 05 00 04 01 E8 A0 1B 11 3B 00 00 1B 73 0C 00 00 19 19 2E 18 
    //38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 
    //11 16 00 30 8F 1E 11 12 20 60 CE 5A 01 01 00 04 26 16 31 30 06 E9 02 0A 73 02 24 02 2F 19 01 00 
    //E4 6B 0F 12 00 00 61 30 20 90 18 5B 01 00 20 90 1E 11 21 00 00 00 00 16 6F 02 07 6E 02 77 00 20 
    //90 1E 11 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 00 6E 6C 0F 16 
    //19 19 00 20 90 1E 11 05 00 04 01 E8 A0 1B 11 3C 00 00 1B 73 0C 00 00 19 19 2E 18 38 5B 01 19 01 
    //00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 00 30 8F 
    //1E 11 12 20 60 CE 5A 01 02 00 04 2C 02 16 31 30 06 E9 02 0A 78 02 24 03 0A AF 02 24 04 1B 00 0D 
    //00 00 00 88 8A 1E 11 19 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 
    //DD 18 11 16 1F 00 00 30 8F 1E 11 16 06 E9 02 0A E6 02 24 05 1B 00 0D 00 00 24 05 19 2E F0 47 5B 
    //01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 00 98 90 1E 11 00 30 8F 
    //1E 11 16 06 E9 02 0A FF FF 04 0B 47 
  }


  event cl_SendMessageTo(byte aRange,string aReceiver,string aMessage) {
    cl2sv_SendMessage_CallStub(aRange,aReceiver,aMessage);                      //0000 : 1B 67 0D 00 00 00 C0 91 1E 11 00 88 92 1E 11 00 00 93 1E 11 16 
    //1B 67 0D 00 00 00 C0 91 1E 11 00 88 92 1E 11 00 00 93 1E 11 16 04 0B 47 
  }


  event cl_SendMessage(byte aRange,string aMessage) {
    cl2sv_SendMessage_CallStub(aRange,"",aMessage);                             //0000 : 1B 67 0D 00 00 00 28 94 1E 11 1F 00 00 E8 94 1E 11 16 
    //1B 67 0D 00 00 00 28 94 1E 11 1F 00 00 E8 94 1E 11 16 04 0B 47 
  }


  native function LogChatMessage(int aAccountID,string aCharacterName,string aMessage);


  delegate OnBeginSlashChatMessageEntry();


  delegate OnBeginChatMessageEntry(optional string aMessage);


  delegate OnChatMessageReceived(byte aRange,string aSender,string aMessage,optional bool me);



