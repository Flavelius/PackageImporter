//==============================================================================
//  Console
//==============================================================================

class Console extends Interaction
    native
    dependsOn(Player,GUI_BaseDesktop,PlayerController)
    Config(System)
  ;

  var config byte ConsoleHotKey;
  var int HistoryTop;
  var int HistoryBot;
  var int HistoryCur;
  var string TypedStr;
  var string History[16];
  var int TypedStrPos;
  var bool bTyping;
  var bool bIgnoreKeys;
  var (Console) transient bool bRunningDemo;
  var (Console) transient bool bHoldingStart;
  var (Console) transient bool bHoldingBack;
  var (Console) transient float TimeIdle;
  var (Console) transient float TimeHoldingReboot;
  var (Console) globalconfig float TimePerTitle;
  var (Console) globalconfig float TimePerDemo;
  var (Console) globalconfig float TimeTooIdle;
  var (Console) globalconfig float TimeBeforeReboot;
  var (Console) globalconfig float TimePerSoak;
  var (Console) globalconfig string DemoLevels[64];
  var array<string> BufferedConsoleCommands;


  exec function PreviousTabStop() {
    ViewportOwner.GUIDesktop.PreviousTabStop();                                 //0000 : 19 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B FD 0E 00 00 16 
    //19 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B FD 0E 00 00 16 04 0B 47 
  }


  exec function NextTabStop() {
    ViewportOwner.GUIDesktop.NextTabStop();                                     //0000 : 19 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B 37 0D 00 00 16 
    //19 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B 37 0D 00 00 16 04 0B 47 
  }


  function MakeCSConsole();


  function string SetInitialMusic(string NewSong) {
    return NewSong;                                                             //0000 : 04 00 D0 6D 7B 0F 
    //04 00 D0 6D 7B 0F 04 0B 47 
  }


  function SetMusic(string NewSong);


  event ConnectFailure(string FailCode,string URL);


  simulated event Tick(float delta) {
    while (BufferedConsoleCommands.Length > 0) {                                //0000 : 07 37 00 97 37 01 B0 77 7B 0F 25 16 
      BufferedConsoleCommands.Remove(0,1);                                      //002C : 41 01 B0 77 7B 0F 25 26 
    }
    //07 37 00 97 37 01 B0 77 7B 0F 25 16 0E 19 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 0D 00 00 1B 
    //65 0C 00 00 10 25 01 B0 77 7B 0F 16 41 01 B0 77 7B 0F 25 26 06 00 00 04 0B 47 
  }


  function TypingClose() {
    bTyping = False;                                                            //0000 : 14 2D 01 B8 C6 7A 0F 28 
    if (ViewportOwner != None && ViewportOwner.Actor != None) {                 //0008 : 07 47 00 82 77 01 70 B7 71 0F 2A 16 18 12 00 77 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 2A 16 16 
      ViewportOwner.Actor.Typing(bTyping);                                      //0029 : 19 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 0C 00 00 1B BB 2A 00 00 2D 01 B8 C6 7A 0F 16 
    }
    TypedStr = "";                                                              //0047 : 0F 01 30 C7 7A 0F 1F 00 
    TypedStrPos = 0;                                                            //004F : 0F 01 A8 C7 7A 0F 25 
    if (GetStateName() == 'Typing') {                                           //0056 : 07 6A 00 FE 61 1C 16 21 BB 2A 00 00 16 
      GotoState('None');                                                        //0063 : 71 21 00 00 00 00 16 
    }
    //14 2D 01 B8 C6 7A 0F 28 07 47 00 82 77 01 70 B7 71 0F 2A 16 18 12 00 77 19 01 70 B7 71 0F 05 00 
    //04 01 50 BA 79 0F 2A 16 16 19 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 0C 00 00 1B BB 2A 00 00 
    //2D 01 B8 C6 7A 0F 16 0F 01 30 C7 7A 0F 1F 00 0F 01 A8 C7 7A 0F 25 07 6A 00 FE 61 1C 16 21 BB 2A 
    //00 00 16 71 21 00 00 00 00 16 04 0B 47 
  }


  function TypingOpen() {
    bTyping = True;                                                             //0000 : 14 2D 01 B8 C6 7A 0F 27 
    if (ViewportOwner != None && ViewportOwner.Actor != None) {                 //0008 : 07 47 00 82 77 01 70 B7 71 0F 2A 16 18 12 00 77 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 2A 16 16 
      ViewportOwner.Actor.Typing(bTyping);                                      //0029 : 19 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 0C 00 00 1B BB 2A 00 00 2D 01 B8 C6 7A 0F 16 
    }
    GotoState('Typing');                                                        //0047 : 71 21 BB 2A 00 00 16 
    //14 2D 01 B8 C6 7A 0F 27 07 47 00 82 77 01 70 B7 71 0F 2A 16 18 12 00 77 19 01 70 B7 71 0F 05 00 
    //04 01 50 BA 79 0F 2A 16 16 19 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 0C 00 00 1B BB 2A 00 00 
    //2D 01 B8 C6 7A 0F 16 71 21 BB 2A 00 00 16 04 0B 47 
  }


  event bool KeyEvent(byte Key,byte Action,float delta) {
    if (Action != 1) {                                                          //0000 : 07 12 00 9B 39 3A 00 18 7F 7B 0F 39 3A 24 01 16 
      return False;                                                             //0010 : 04 28 
    }
    return False;                                                               //0012 : 04 28 
    //07 12 00 9B 39 3A 00 18 7F 7B 0F 39 3A 24 01 16 04 28 04 28 04 0B 47 
  }


  function DelayedConsoleCommand(string Command) {
    BufferedConsoleCommands.Length = BufferedConsoleCommands.Length + 1;        //0000 : 0F 37 01 B0 77 7B 0F 92 37 01 B0 77 7B 0F 26 16 
    BufferedConsoleCommands[BufferedConsoleCommands.Length - 1] = Command;      //0010 : 0F 10 93 37 01 B0 77 7B 0F 26 16 01 B0 77 7B 0F 00 50 91 7B 0F 
    //0F 37 01 B0 77 7B 0F 92 37 01 B0 77 7B 0F 26 16 0F 10 93 37 01 B0 77 7B 0F 26 16 01 B0 77 7B 0F 
    //00 50 91 7B 0F 04 0B 47 
  }


  event NotifyLevelChange() {
    ConsoleClose();                                                             //0000 : 1B F5 0E 00 00 16 
    //1B F5 0E 00 00 16 04 0B 47 
  }


  event Message(coerce string Msg,float MsgLife);


  exec function ConsoleToggle();


  function ConsoleClose();


  function ConsoleOpen();


  exec function TeamTalk() {
    TypedStr = "TeamSay ";                                                      //0000 : 0F 01 30 C7 7A 0F 1F 54 65 61 6D 53 61 79 20 00 
    TypedStrPos = 8;                                                            //0010 : 0F 01 A8 C7 7A 0F 2C 08 
    TypingOpen();                                                               //0018 : 1B EB 2A 00 00 16 
    //0F 01 30 C7 7A 0F 1F 54 65 61 6D 53 61 79 20 00 0F 01 A8 C7 7A 0F 2C 08 1B EB 2A 00 00 16 04 0B 
    //47 
  }


  exec function Talk() {
    TypedStr = "Say ";                                                          //0000 : 0F 01 30 C7 7A 0F 1F 53 61 79 20 00 
    TypedStrPos = 4;                                                            //000C : 0F 01 A8 C7 7A 0F 2C 04 
    TypingOpen();                                                               //0014 : 1B EB 2A 00 00 16 
    //0F 01 30 C7 7A 0F 1F 53 61 79 20 00 0F 01 A8 C7 7A 0F 2C 04 1B EB 2A 00 00 16 04 0B 47 
  }


  exec function Type() {
    TypedStr = "";                                                              //0000 : 0F 01 30 C7 7A 0F 1F 00 
    TypedStrPos = 0;                                                            //0008 : 0F 01 A8 C7 7A 0F 25 
    TypingOpen();                                                               //000F : 1B EB 2A 00 00 16 
    //0F 01 30 C7 7A 0F 1F 00 0F 01 A8 C7 7A 0F 25 1B EB 2A 00 00 16 04 0B 47 
  }


  function UnPressButtons() {
    local PlayerController PC;
    if (ViewportOwner != None) {                                                //0000 : 07 39 00 77 01 70 B7 71 0F 2A 16 
      PC = ViewportOwner.Actor;                                                 //000B : 0F 00 88 99 7B 0F 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 
      if (PC != None) {                                                         //001F : 07 39 00 77 00 88 99 7B 0F 2A 16 
        PC.UnPressButtons();                                                    //002A : 19 00 88 99 7B 0F 06 00 00 1B E6 11 00 00 16 
      }
    }
    //07 39 00 77 01 70 B7 71 0F 2A 16 0F 00 88 99 7B 0F 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 07 
    //39 00 77 00 88 99 7B 0F 2A 16 19 00 88 99 7B 0F 06 00 00 1B E6 11 00 00 16 04 0B 47 
  }


  event NativeConsoleOpen() {
    //04 0B 47 
  }


  event ViewportInitialized() {
    if (ViewportOwner.ConfiguredInternetSpeed == 0) {                           //0000 : 07 3C 00 9A 19 01 70 B7 71 0F 05 00 04 01 10 BE 79 0F 25 16 
      ViewportOwner.static.ResetConfig("ConfiguredInternetSpeed");              //0014 : 19 01 70 B7 71 0F 1F 00 00 1C 38 A7 69 0F 1F 43 6F 6E 66 69 67 75 72 65 64 49 6E 74 65 72 6E 65 74 53 70 65 65 64 00 16 
    }
    if (ViewportOwner.ConfiguredLanSpeed == 0) {                                //003C : 07 73 00 9A 19 01 70 B7 71 0F 05 00 04 01 88 BE 79 0F 25 16 
      ViewportOwner.static.ResetConfig("ConfiguredLanSpeed");                   //0050 : 19 01 70 B7 71 0F 1A 00 00 1C 38 A7 69 0F 1F 43 6F 6E 66 69 67 75 72 65 64 4C 61 6E 53 70 65 65 64 00 16 
    }
    //07 3C 00 9A 19 01 70 B7 71 0F 05 00 04 01 10 BE 79 0F 25 16 19 01 70 B7 71 0F 1F 00 00 1C 38 A7 
    //69 0F 1F 43 6F 6E 66 69 67 75 72 65 64 49 6E 74 65 72 6E 65 74 53 70 65 65 64 00 16 07 73 00 9A 
    //19 01 70 B7 71 0F 05 00 04 01 88 BE 79 0F 25 16 19 01 70 B7 71 0F 1A 00 00 1C 38 A7 69 0F 1F 43 
    //6F 6E 66 69 67 75 72 65 64 4C 61 6E 53 70 65 65 64 00 16 04 0B 47 
  }


  event Initialized() {
    if (IsSoaking()) {                                                          //0000 : 07 1F 00 1C 88 9E 69 0F 16 
      TimePerTitle = 1.00000000;                                                //0009 : 0F 01 30 9D 7B 0F 1E 00 00 80 3F 
      TimePerDemo = TimePerSoak;                                                //0014 : 0F 01 A8 9D 7B 0F 01 20 9E 7B 0F 
    }
    //07 1F 00 1C 88 9E 69 0F 16 0F 01 30 9D 7B 0F 1E 00 00 80 3F 0F 01 A8 9D 7B 0F 01 20 9E 7B 0F 04 
    //0B 47 
  }


  state Typing {

      function EndState() {
        ConsoleCommand("toggleime 0");                                          //0000 : 1B 65 0C 00 00 1F 74 6F 67 67 6C 65 69 6D 65 20 30 00 16 
        bTyping = False;                                                        //0013 : 14 2D 01 B8 C6 7A 0F 28 
        bVisible = False;                                                       //001B : 14 2D 01 D8 CA 71 0F 28 
        //1B 65 0C 00 00 1F 74 6F 67 67 6C 65 69 6D 65 20 30 00 16 14 2D 01 B8 C6 7A 0F 28 14 2D 01 D8 CA 
        //71 0F 28 04 0B 47 
      }


      function BeginState() {
        bTyping = True;                                                         //0000 : 14 2D 01 B8 C6 7A 0F 27 
        bVisible = True;                                                        //0008 : 14 2D 01 D8 CA 71 0F 27 
        bIgnoreKeys = True;                                                     //0010 : 14 2D 01 88 7C 7B 0F 27 
        HistoryCur = HistoryTop;                                                //0018 : 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 
        //14 2D 01 B8 C6 7A 0F 27 14 2D 01 D8 CA 71 0F 27 14 2D 01 88 7C 7B 0F 27 0F 01 00 7D 7B 0F 01 78 
        //7D 7B 0F 04 0B 47 
      }


      function bool KeyEvent(byte Key,byte Action,float delta) {
        local string Temp;
        if (Action == 1) {                                                      //0000 : 07 18 00 9A 39 3A 00 A8 86 7B 0F 39 3A 24 01 16 
          bIgnoreKeys = False;                                                  //0010 : 14 2D 01 88 7C 7B 0F 28 
        }
        if (Key == 27) {                                                        //0018 : 07 5E 00 9A 39 3A 00 30 81 7B 0F 39 3A 24 1B 16 
          if (TypedStr != "") {                                                 //0028 : 07 53 00 7B 01 30 C7 7A 0F 1F 00 16 
            TypedStr = "";                                                      //0034 : 0F 01 30 C7 7A 0F 1F 00 
            TypedStrPos = 0;                                                    //003C : 0F 01 A8 C7 7A 0F 25 
            HistoryCur = HistoryTop;                                            //0043 : 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 
            return True;                                                        //004E : 04 27 
          } else {                                                              //0050 : 06 5B 00 
            TypingClose();                                                      //0053 : 1B E7 2A 00 00 16 
            return True;                                                        //0059 : 04 27 
          }
        } else {                                                                //005B : 06 7D 03 
          if (Action != 1) {                                                    //005E : 07 73 00 9B 39 3A 00 A8 86 7B 0F 39 3A 24 01 16 
            return False;                                                       //006E : 04 28 
          } else {                                                              //0070 : 06 7D 03 
            if (Key == 13) {                                                    //0073 : 07 62 01 9A 39 3A 00 30 81 7B 0F 39 3A 24 0D 16 
              if (TypedStr != "") {                                             //0083 : 07 57 01 7B 01 30 C7 7A 0F 1F 00 16 
                History[HistoryTop] = TypedStr;                                 //008F : 0F 1A 01 78 7D 7B 0F 01 20 87 7B 0F 01 30 C7 7A 0F 
                HistoryTop = (HistoryTop + 1) % 16;                             //00A0 : 0F 01 78 7D 7B 0F 39 44 AD 39 3F 92 01 78 7D 7B 0F 26 16 39 3F 2C 10 16 
                if (HistoryBot == -1 || HistoryBot == HistoryTop) {             //00B8 : 07 F0 00 84 9A 01 98 87 7B 0F 1D FF FF FF FF 16 18 0D 00 9A 01 98 87 7B 0F 01 78 7D 7B 0F 16 16 
                  HistoryBot = (HistoryBot + 1) % 16;                           //00D8 : 0F 01 98 87 7B 0F 39 44 AD 39 3F 92 01 98 87 7B 0F 26 16 39 3F 2C 10 16 
                }
                HistoryCur = HistoryTop;                                        //00F0 : 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 
                Temp = TypedStr;                                                //00FB : 0F 00 10 88 7B 0F 01 30 C7 7A 0F 
                TypedStr = "";                                                  //0106 : 0F 01 30 C7 7A 0F 1F 00 
                TypedStrPos = 0;                                                //010E : 0F 01 A8 C7 7A 0F 25 
                if (!ConsoleCommand(Temp)) {                                    //0115 : 07 4A 01 81 1B 65 0C 00 00 00 10 88 7B 0F 16 16 
                  Message(Localize("Errors","Exec","Core"),6.00000000);         //0125 : 1B 37 03 00 00 1B F3 28 00 00 1F 45 72 72 6F 72 73 00 1F 45 78 65 63 00 1F 43 6F 72 65 00 16 1E 00 00 C0 40 16 
                }
                Message("",6.00000000);                                         //014A : 1B 37 03 00 00 1F 00 1E 00 00 C0 40 16 
              }
              TypingClose();                                                    //0157 : 1B E7 2A 00 00 16 
              return True;                                                      //015D : 04 27 
            } else {                                                            //015F : 06 7D 03 
              if (Key == 38) {                                                  //0162 : 07 DA 01 9A 39 3A 00 30 81 7B 0F 39 3A 24 26 16 
                if (HistoryBot >= 0) {                                          //0172 : 07 D5 01 99 01 98 87 7B 0F 25 16 
                  if (HistoryCur == HistoryBot) {                               //017D : 07 9A 01 9A 01 00 7D 7B 0F 01 98 87 7B 0F 16 
                    HistoryCur = HistoryTop;                                    //018C : 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 
                  } else {                                                      //0197 : 06 B7 01 
                    HistoryCur--;                                               //019A : A6 01 00 7D 7B 0F 16 
                    if (HistoryCur < 0) {                                       //01A1 : 07 B7 01 96 01 00 7D 7B 0F 25 16 
                      HistoryCur = 16 - 1;                                      //01AC : 0F 01 00 7D 7B 0F 93 2C 10 26 16 
                    }
                  }
                  TypedStr = History[HistoryCur];                               //01B7 : 0F 01 30 C7 7A 0F 1A 01 00 7D 7B 0F 01 20 87 7B 0F 
                  TypedStrPos = Len(TypedStr);                                  //01C8 : 0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 
                }
                return True;                                                    //01D5 : 04 27 
              } else {                                                          //01D7 : 06 7D 03 
                if (Key == 40) {                                                //01DA : 07 4B 02 9A 39 3A 00 30 81 7B 0F 39 3A 24 28 16 
                  if (HistoryBot >= 0) {                                        //01EA : 07 48 02 99 01 98 87 7B 0F 25 16 
                    if (HistoryCur == HistoryTop) {                             //01F5 : 07 12 02 9A 01 00 7D 7B 0F 01 78 7D 7B 0F 16 
                      HistoryCur = HistoryBot;                                  //0204 : 0F 01 00 7D 7B 0F 01 98 87 7B 0F 
                    } else {                                                    //020F : 06 2A 02 
                      HistoryCur = (HistoryCur + 1) % 16;                       //0212 : 0F 01 00 7D 7B 0F 39 44 AD 39 3F 92 01 00 7D 7B 0F 26 16 39 3F 2C 10 16 
                    }
                    TypedStr = History[HistoryCur];                             //022A : 0F 01 30 C7 7A 0F 1A 01 00 7D 7B 0F 01 20 87 7B 0F 
                    TypedStrPos = Len(TypedStr);                                //023B : 0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 
                  }
                } else {                                                        //0248 : 06 7D 03 
                  if (Key == 8) {                                               //024B : 07 9E 02 9A 39 3A 00 30 81 7B 0F 39 3A 24 08 16 
                    if (TypedStrPos > 0) {                                      //025B : 07 99 02 97 01 A8 C7 7A 0F 25 16 
                      TypedStr = Left(TypedStr,TypedStrPos - 1)
                        $ Right(TypedStr,Len(TypedStr) - TypedStrPos);//0266 : 0F 01 30 C7 7A 0F 70 80 01 30 C7 7A 0F 93 01 A8 C7 7A 0F 26 16 16 EA 01 30 C7 7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 
                      TypedStrPos--;                                            //0292 : A6 01 A8 C7 7A 0F 16 
                    }
                    return True;                                                //0299 : 04 27 
                  } else {                                                      //029B : 06 7D 03 
                    if (Key == 46) {                                            //029E : 07 F0 02 9A 39 3A 00 30 81 7B 0F 39 3A 24 2E 16 
                      if (TypedStrPos < Len(TypedStr)) {                        //02AE : 07 EB 02 96 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 16 
                        TypedStr = Left(TypedStr,TypedStrPos)
                          $ Right(TypedStr,Len(TypedStr) - TypedStrPos - 1);//02BF : 0F 01 30 C7 7A 0F 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 EA 01 30 C7 7A 0F 93 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 26 16 16 16 
                      }
                      return True;                                              //02EB : 04 27 
                    } else {                                                    //02ED : 06 7D 03 
                      if (Key == 37) {                                          //02F0 : 07 16 03 9A 39 3A 00 30 81 7B 0F 39 3A 24 25 16 
                        TypedStrPos = Max(0,TypedStrPos - 1);                   //0300 : 0F 01 A8 C7 7A 0F FA 25 93 01 A8 C7 7A 0F 26 16 16 
                        return True;                                            //0311 : 04 27 
                      } else {                                                  //0313 : 06 7D 03 
                        if (Key == 39) {                                        //0316 : 07 42 03 9A 39 3A 00 30 81 7B 0F 39 3A 24 27 16 
                          TypedStrPos = Min(Len(TypedStr),TypedStrPos + 1);     //0326 : 0F 01 A8 C7 7A 0F F9 7D 01 30 C7 7A 0F 16 92 01 A8 C7 7A 0F 26 16 16 
                          return True;                                          //033D : 04 27 
                        } else {                                                //033F : 06 7D 03 
                          if (Key == 36) {                                      //0342 : 07 5E 03 9A 39 3A 00 30 81 7B 0F 39 3A 24 24 16 
                            TypedStrPos = 0;                                    //0352 : 0F 01 A8 C7 7A 0F 25 
                            return True;                                        //0359 : 04 27 
                          } else {                                              //035B : 06 7D 03 
                            if (Key == 35) {                                    //035E : 07 7D 03 9A 39 3A 00 30 81 7B 0F 39 3A 24 23 16 
                              TypedStrPos = Len(TypedStr);                      //036E : 0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 
                              return True;                                      //037B : 04 27 
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        return True;                                                            //037D : 04 27 
        //07 18 00 9A 39 3A 00 A8 86 7B 0F 39 3A 24 01 16 14 2D 01 88 7C 7B 0F 28 07 5E 00 9A 39 3A 00 30 
        //81 7B 0F 39 3A 24 1B 16 07 53 00 7B 01 30 C7 7A 0F 1F 00 16 0F 01 30 C7 7A 0F 1F 00 0F 01 A8 C7 
        //7A 0F 25 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 04 27 06 5B 00 1B E7 2A 00 00 16 04 27 06 7D 03 07 73 
        //00 9B 39 3A 00 A8 86 7B 0F 39 3A 24 01 16 04 28 06 7D 03 07 62 01 9A 39 3A 00 30 81 7B 0F 39 3A 
        //24 0D 16 07 57 01 7B 01 30 C7 7A 0F 1F 00 16 0F 1A 01 78 7D 7B 0F 01 20 87 7B 0F 01 30 C7 7A 0F 
        //0F 01 78 7D 7B 0F 39 44 AD 39 3F 92 01 78 7D 7B 0F 26 16 39 3F 2C 10 16 07 F0 00 84 9A 01 98 87 
        //7B 0F 1D FF FF FF FF 16 18 0D 00 9A 01 98 87 7B 0F 01 78 7D 7B 0F 16 16 0F 01 98 87 7B 0F 39 44 
        //AD 39 3F 92 01 98 87 7B 0F 26 16 39 3F 2C 10 16 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 0F 00 10 88 7B 
        //0F 01 30 C7 7A 0F 0F 01 30 C7 7A 0F 1F 00 0F 01 A8 C7 7A 0F 25 07 4A 01 81 1B 65 0C 00 00 00 10 
        //88 7B 0F 16 16 1B 37 03 00 00 1B F3 28 00 00 1F 45 72 72 6F 72 73 00 1F 45 78 65 63 00 1F 43 6F 
        //72 65 00 16 1E 00 00 C0 40 16 1B 37 03 00 00 1F 00 1E 00 00 C0 40 16 1B E7 2A 00 00 16 04 27 06 
        //7D 03 07 DA 01 9A 39 3A 00 30 81 7B 0F 39 3A 24 26 16 07 D5 01 99 01 98 87 7B 0F 25 16 07 9A 01 
        //9A 01 00 7D 7B 0F 01 98 87 7B 0F 16 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 06 B7 01 A6 01 00 7D 7B 0F 
        //16 07 B7 01 96 01 00 7D 7B 0F 25 16 0F 01 00 7D 7B 0F 93 2C 10 26 16 0F 01 30 C7 7A 0F 1A 01 00 
        //7D 7B 0F 01 20 87 7B 0F 0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 04 27 06 7D 03 07 4B 02 9A 39 3A 
        //00 30 81 7B 0F 39 3A 24 28 16 07 48 02 99 01 98 87 7B 0F 25 16 07 12 02 9A 01 00 7D 7B 0F 01 78 
        //7D 7B 0F 16 0F 01 00 7D 7B 0F 01 98 87 7B 0F 06 2A 02 0F 01 00 7D 7B 0F 39 44 AD 39 3F 92 01 00 
        //7D 7B 0F 26 16 39 3F 2C 10 16 0F 01 30 C7 7A 0F 1A 01 00 7D 7B 0F 01 20 87 7B 0F 0F 01 A8 C7 7A 
        //0F 7D 01 30 C7 7A 0F 16 06 7D 03 07 9E 02 9A 39 3A 00 30 81 7B 0F 39 3A 24 08 16 07 99 02 97 01 
        //A8 C7 7A 0F 25 16 0F 01 30 C7 7A 0F 70 80 01 30 C7 7A 0F 93 01 A8 C7 7A 0F 26 16 16 EA 01 30 C7 
        //7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 A6 01 A8 C7 7A 0F 16 04 27 06 7D 03 07 F0 
        //02 9A 39 3A 00 30 81 7B 0F 39 3A 24 2E 16 07 EB 02 96 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 16 0F 
        //01 30 C7 7A 0F 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 EA 01 30 C7 7A 0F 93 93 7D 01 30 C7 7A 0F 
        //16 01 A8 C7 7A 0F 16 26 16 16 16 04 27 06 7D 03 07 16 03 9A 39 3A 00 30 81 7B 0F 39 3A 24 25 16 
        //0F 01 A8 C7 7A 0F FA 25 93 01 A8 C7 7A 0F 26 16 16 04 27 06 7D 03 07 42 03 9A 39 3A 00 30 81 7B 
        //0F 39 3A 24 27 16 0F 01 A8 C7 7A 0F F9 7D 01 30 C7 7A 0F 16 92 01 A8 C7 7A 0F 26 16 16 04 27 06 
        //7D 03 07 5E 03 9A 39 3A 00 30 81 7B 0F 39 3A 24 24 16 0F 01 A8 C7 7A 0F 25 04 27 06 7D 03 07 7D 
        //03 9A 39 3A 00 30 81 7B 0F 39 3A 24 23 16 0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 04 27 04 27 04 
        //0B 47 
      }


      function bool KeyType(byte Key,optional string Unicode) {
        if (bIgnoreKeys) {                                                      //0000 : 07 0B 00 2D 01 88 7C 7B 0F 
          return True;                                                          //0009 : 04 27 
        }
        if (Key >= 32) {                                                        //000B : 07 95 00 99 39 3A 00 D8 8A 7B 0F 2C 20 16 
          if (Unicode != "") {                                                  //0019 : 07 58 00 7B 00 50 8C 7B 0F 1F 00 16 
            TypedStr = Left(TypedStr,TypedStrPos) $ Unicode
              $ Right(TypedStr,Len(TypedStr) - TypedStrPos);//0025 : 0F 01 30 C7 7A 0F 70 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 00 50 8C 7B 0F 16 EA 01 30 C7 7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 
          } else {                                                              //0055 : 06 8C 00 
            TypedStr = Left(TypedStr,TypedStrPos) $ Chr(Key)
              $ Right(TypedStr,Len(TypedStr) - TypedStrPos);//0058 : 0F 01 30 C7 7A 0F 70 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 EC 39 3A 00 D8 8A 7B 0F 16 16 EA 01 30 C7 7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 
          }
          TypedStrPos++;                                                        //008C : A5 01 A8 C7 7A 0F 16 
          return True;                                                          //0093 : 04 27 
        }
        return False;                                                           //0095 : 04 28 
        //07 0B 00 2D 01 88 7C 7B 0F 04 27 07 95 00 99 39 3A 00 D8 8A 7B 0F 2C 20 16 07 58 00 7B 00 50 8C 
        //7B 0F 1F 00 16 0F 01 30 C7 7A 0F 70 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 00 50 8C 7B 0F 16 EA 
        //01 30 C7 7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 06 8C 00 0F 01 30 C7 7A 0F 70 70 
        //80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 EC 39 3A 00 D8 8A 7B 0F 16 16 EA 01 30 C7 7A 0F 93 7D 01 30 
        //C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 A5 01 A8 C7 7A 0F 16 04 27 04 28 04 0B 47 
      }


      exec function Type() {
        TypedStr = "";                                                          //0000 : 0F 01 30 C7 7A 0F 1F 00 
        TypedStrPos = 0;                                                        //0008 : 0F 01 A8 C7 7A 0F 25 
        TypingClose();                                                          //000F : 1B E7 2A 00 00 16 
        //0F 01 30 C7 7A 0F 1F 00 0F 01 A8 C7 7A 0F 25 1B E7 2A 00 00 16 04 0B 47 
      }


    //08 47 

  }



