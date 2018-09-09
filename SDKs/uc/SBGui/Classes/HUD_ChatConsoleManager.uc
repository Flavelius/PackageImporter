//==============================================================================
//  HUD_ChatConsoleManager
//==============================================================================

class HUD_ChatConsoleManager extends Object
    native
    dependsOn(HUD_ChatConsole)
    Config(User)
  ;

  const MAX_CHAT_MESSAGE_LENGTH =  256;
  var HUD_Chat mChat;
  var array<HUD_ChatConsole> mConsoles;
  var globalconfig array<string> mConsoleNames;


  function AddConsole(string consoleClassName) {
    local class<Object> aClass;
    local HUD_ChatConsole Result;
    if (mChat != None) {                                                        //0000 : 07 9A 00 77 01 D8 89 A7 19 2A 16 
      aClass = Class<Object>(static.DynamicLoadObject(consoleClassName,Class'Class'));//000B : 0F 00 50 8A A7 19 13 48 3A 2A 10 1C 60 E7 69 0F 00 60 89 A7 19 20 D8 DE 1F 10 16 
      if (aClass != None) {                                                     //0026 : 07 9A 00 77 00 50 8A A7 19 2A 16 
        if (DoesConsoleExist(aClass) == -1) {                                   //0031 : 07 9A 00 9A 1B 9F 9A 00 00 00 50 8A A7 19 16 1D FF FF FF FF 16 
          Result = LoadConsole(consoleClassName);                               //0046 : 0F 00 D0 8A A7 19 1B D2 96 00 00 00 60 89 A7 19 16 
          if (Result != None) {                                                 //0057 : 07 9A 00 77 00 D0 8A A7 19 2A 16 
            Result.Initialize(mChat);                                           //0062 : 19 00 D0 8A A7 19 0B 00 00 1B 38 04 00 00 01 D8 89 A7 19 16 
            mConsoleNames[mConsoleNames.Length] = consoleClassName;             //0076 : 0F 10 37 01 48 8B A7 19 01 48 8B A7 19 00 60 89 A7 19 
            mConsoles[mConsoles.Length] = Result;                               //0088 : 0F 10 37 01 C0 8B A7 19 01 C0 8B A7 19 00 D0 8A A7 19 
          }
        }
      }
    }
    //07 9A 00 77 01 D8 89 A7 19 2A 16 0F 00 50 8A A7 19 13 48 3A 2A 10 1C 60 E7 69 0F 00 60 89 A7 19 
    //20 D8 DE 1F 10 16 07 9A 00 77 00 50 8A A7 19 2A 16 07 9A 00 9A 1B 9F 9A 00 00 00 50 8A A7 19 16 
    //1D FF FF FF FF 16 0F 00 D0 8A A7 19 1B D2 96 00 00 00 60 89 A7 19 16 07 9A 00 77 00 D0 8A A7 19 
    //2A 16 19 00 D0 8A A7 19 0B 00 00 1B 38 04 00 00 01 D8 89 A7 19 16 0F 10 37 01 48 8B A7 19 01 48 
    //8B A7 19 00 60 89 A7 19 0F 10 37 01 C0 8B A7 19 01 C0 8B A7 19 00 D0 8A A7 19 04 0B 47 
  }


  function int DoesConsoleExist(class<Object> aClass) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 90 8E A7 19 25 
    while (i < mConsoles.Length) {                                              //0007 : 07 45 00 96 00 90 8E A7 19 37 01 C0 8B A7 19 16 
      if (mConsoles[i].Class == aClass) {                                       //0017 : 07 3B 00 72 19 10 00 90 8E A7 19 01 C0 8B A7 19 05 00 04 01 68 E5 6B 0F 00 78 8D A7 19 16 
        return i;                                                               //0035 : 04 00 90 8E A7 19 
      }
      i++;                                                                      //003B : A5 00 90 8E A7 19 16 
    }
    return -1;                                                                  //0045 : 04 1D FF FF FF FF 
    //0F 00 90 8E A7 19 25 07 45 00 96 00 90 8E A7 19 37 01 C0 8B A7 19 16 07 3B 00 72 19 10 00 90 8E 
    //A7 19 01 C0 8B A7 19 05 00 04 01 68 E5 6B 0F 00 78 8D A7 19 16 04 00 90 8E A7 19 A5 00 90 8E A7 
    //19 16 06 07 00 04 1D FF FF FF FF 04 0B 47 
  }


  event HUD_ChatConsole LoadConsole(string ClassName) {
    local class<Object> aClass;
    aClass = Class<Object>(static.DynamicLoadObject(ClassName,Class'Class'));   //0000 : 0F 00 20 91 A7 19 13 48 3A 2A 10 1C 60 E7 69 0F 00 30 90 A7 19 20 D8 DE 1F 10 16 
    if (aClass != None) {                                                       //001B : 07 35 00 77 00 20 91 A7 19 2A 16 
      return HUD_ChatConsole(new aClass);                                       //0026 : 04 2E E0 81 31 1D 11 0B 0B 0B 00 20 91 A7 19 
    }
    return None;                                                                //0035 : 04 2A 
    //0F 00 20 91 A7 19 13 48 3A 2A 10 1C 60 E7 69 0F 00 30 90 A7 19 20 D8 DE 1F 10 16 07 35 00 77 00 
    //20 91 A7 19 2A 16 04 2E E0 81 31 1D 11 0B 0B 0B 00 20 91 A7 19 04 2A 04 0B 47 
  }


  function LoadConsoles() {
    local int i;
    local HUD_ChatConsole Result;
    mConsoles.Length = 0;                                                       //0000 : 0F 37 01 C0 8B A7 19 25 
    if (mChat != None) {                                                        //0008 : 07 7C 00 77 01 D8 89 A7 19 2A 16 
      i = 0;                                                                    //0013 : 0F 00 C8 92 A7 19 25 
      while (i < mConsoleNames.Length) {                                        //001A : 07 7C 00 96 00 C8 92 A7 19 37 01 48 8B A7 19 16 
        Result = LoadConsole(mConsoleNames[i]);                                 //002A : 0F 00 18 94 A7 19 1B D2 96 00 00 10 00 C8 92 A7 19 01 48 8B A7 19 16 
        if (Result != None) {                                                   //0041 : 07 72 00 77 00 18 94 A7 19 2A 16 
          Result.Initialize(mChat);                                             //004C : 19 00 18 94 A7 19 0B 00 00 1B 38 04 00 00 01 D8 89 A7 19 16 
          mConsoles[mConsoles.Length] = Result;                                 //0060 : 0F 10 37 01 C0 8B A7 19 01 C0 8B A7 19 00 18 94 A7 19 
        }
        i++;                                                                    //0072 : A5 00 C8 92 A7 19 16 
      }
    }
    //0F 37 01 C0 8B A7 19 25 07 7C 00 77 01 D8 89 A7 19 2A 16 0F 00 C8 92 A7 19 25 07 7C 00 96 00 C8 
    //92 A7 19 37 01 48 8B A7 19 16 0F 00 18 94 A7 19 1B D2 96 00 00 10 00 C8 92 A7 19 01 48 8B A7 19 
    //16 07 72 00 77 00 18 94 A7 19 2A 16 19 00 18 94 A7 19 0B 00 00 1B 38 04 00 00 01 D8 89 A7 19 16 
    //0F 10 37 01 C0 8B A7 19 01 C0 8B A7 19 00 18 94 A7 19 A5 00 C8 92 A7 19 16 06 1A 00 04 0B 47 
  }


  event bool HandleKeyEvent(GUI_Component component,out byte keyCode,out byte State,float delta) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 50 96 A7 19 25 
    while (i < mConsoles.Length) {                                              //0007 : 07 4A 00 96 00 50 96 A7 19 37 01 C0 8B A7 19 16 
      if (mConsoles[i].HandleKeyEvent(keyCode,State,delta)) {                   //0017 : 07 40 00 19 10 00 50 96 A7 19 01 C0 8B A7 19 15 00 04 1B C9 96 00 00 00 C8 96 A7 19 00 40 97 A7 19 00 B8 97 A7 19 16 
        return True;                                                            //003E : 04 27 
      }
      i++;                                                                      //0040 : A5 00 50 96 A7 19 16 
    }
    return False;                                                               //004A : 04 28 
    //0F 00 50 96 A7 19 25 07 4A 00 96 00 50 96 A7 19 37 01 C0 8B A7 19 16 07 40 00 19 10 00 50 96 A7 
    //19 01 C0 8B A7 19 15 00 04 1B C9 96 00 00 00 C8 96 A7 19 00 40 97 A7 19 00 B8 97 A7 19 16 04 27 
    //A5 00 50 96 A7 19 16 06 07 00 04 28 04 0B 47 
  }


  event bool HandleKeyType(GUI_Component component,out byte keyCode,string Unicode) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 D0 99 A7 19 25 
    while (i < mConsoles.Length) {                                              //0007 : 07 45 00 96 00 D0 99 A7 19 37 01 C0 8B A7 19 16 
      if (mConsoles[i].HandleKeyType(keyCode,Unicode)) {                        //0017 : 07 3B 00 19 10 00 D0 99 A7 19 01 C0 8B A7 19 10 00 04 1B CA 96 00 00 00 48 9A A7 19 00 C0 9A A7 19 16 
        return True;                                                            //0039 : 04 27 
      }
      i++;                                                                      //003B : A5 00 D0 99 A7 19 16 
    }
    return False;                                                               //0045 : 04 28 
    //0F 00 D0 99 A7 19 25 07 45 00 96 00 D0 99 A7 19 37 01 C0 8B A7 19 16 07 3B 00 19 10 00 D0 99 A7 
    //19 01 C0 8B A7 19 10 00 04 1B CA 96 00 00 00 48 9A A7 19 00 C0 9A A7 19 16 04 27 A5 00 D0 99 A7 
    //19 16 06 07 00 04 28 04 0B 47 
  }


  event HandleMessage(string sender,string Message,int Channel) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 70 9D A7 19 25 
    while (i < mConsoles.Length) {                                              //0007 : 07 4B 00 96 00 70 9D A7 19 37 01 C0 8B A7 19 16 
      if (mConsoles[i].HandleMessage(Message,sender,Channel)) {                 //0017 : 07 41 00 19 10 00 70 9D A7 19 01 C0 8B A7 19 15 00 04 1B CB 96 00 00 00 E8 9D A7 19 00 60 9C A7 19 00 60 9E A7 19 16 
        goto jl004B;                                                            //003E : 06 4B 00 
      }
      i++;                                                                      //0041 : A5 00 70 9D A7 19 16 
    }
    //0F 00 70 9D A7 19 25 07 4B 00 96 00 70 9D A7 19 37 01 C0 8B A7 19 16 07 41 00 19 10 00 70 9D A7 
    //19 01 C0 8B A7 19 15 00 04 1B CB 96 00 00 00 E8 9D A7 19 00 60 9C A7 19 00 60 9E A7 19 16 06 4B 
    //00 A5 00 70 9D A7 19 16 06 07 00 04 0B 47 
  }


  function HandleUserOutput(string Message,int Channel) {
    local int i;
    local string processedMessage;
    processedMessage = Left(Message,256);                                       //0000 : 0F 00 B0 A0 A7 19 80 00 88 9F A7 19 1D 00 01 00 00 16 
    i = 0;                                                                      //0012 : 0F 00 28 A1 A7 19 25 
    while (i < mConsoles.Length) {                                              //0019 : 07 58 00 96 00 28 A1 A7 19 37 01 C0 8B A7 19 16 
      if (mConsoles[i].HandleUserOutput(processedMessage,Channel)) {            //0029 : 07 4E 00 19 10 00 28 A1 A7 19 01 C0 8B A7 19 10 00 04 1B EE 98 00 00 00 B0 A0 A7 19 00 A0 A1 A7 19 16 
        goto jl0058;                                                            //004B : 06 58 00 
      }
      i++;                                                                      //004E : A5 00 28 A1 A7 19 16 
    }
    //0F 00 B0 A0 A7 19 80 00 88 9F A7 19 1D 00 01 00 00 16 0F 00 28 A1 A7 19 25 07 58 00 96 00 28 A1 
    //A7 19 37 01 C0 8B A7 19 16 07 4E 00 19 10 00 28 A1 A7 19 01 C0 8B A7 19 10 00 04 1B EE 98 00 00 
    //00 B0 A0 A7 19 00 A0 A1 A7 19 16 06 58 00 A5 00 28 A1 A7 19 16 06 19 00 04 0B 47 
  }


  function Initialize(HUD_Chat aChat) {
    mChat = aChat;                                                              //0000 : 0F 01 D8 89 A7 19 00 18 A2 A7 19 
    LoadConsoles();                                                             //000B : 1B A0 9A 00 00 16 
    //0F 01 D8 89 A7 19 00 18 A2 A7 19 1B A0 9A 00 00 16 04 0B 47 
  }



