//==============================================================================
//  CCom_Help
//==============================================================================

class CCom_Help extends Game_ConsoleCommand
    native
    dependsOn(Class,SBGamePlayStrings)
  ;


  function bool Execute(Game_Pawn aPawn,array<string> Params,Game_Pawn aTarget) {
    local string output;
    local Game_ConsoleCommand comObj;
    if (Params.Length >= 2) {                                                   //0000 : 07 16 01 99 37 00 58 0F 32 13 2C 02 16 
      foreach AllObjects(Class'Game_ConsoleCommand',comObj) {                   //000D : 2F C5 20 B8 A0 5E 01 00 D0 0F 32 13 16 F2 00 
        if (comObj.Matches("/" $ Params[1])) {                                  //001C : 07 F1 00 19 00 D0 0F 32 13 12 00 04 1B 8F 0F 00 00 70 1F 2F 00 10 26 00 58 0F 32 13 16 16 
          output = comObj.Command;                                              //003A : 0F 00 48 10 32 13 19 00 D0 0F 32 13 05 00 00 01 60 09 32 13 
          if (comObj.Alias != "") {                                             //004E : 07 84 00 7B 19 00 D0 0F 32 13 05 00 00 01 C8 0A 32 13 1F 00 16 
          }
          if (comObj.HelpText.Text != "") {                                     //0084 : 07 C2 00 7B 36 58 C6 6B 0F 19 00 D0 0F 32 13 05 00 0C 01 B8 0B 32 13 1F 00 16 
          } else {                                                              //00BF : 06 DE 00 
          }
          ChatResponse(aPawn,output);                                           //00DE : 1B F5 0F 00 00 00 E0 0C 32 13 00 48 10 32 13 16 
          return True;                                                          //00EF : 04 27 
        }
      }
      ChatResponse(aPawn,Class'SBGamePlayStrings'.default.No_help_found.Text);  //00F3 : 1B F5 0F 00 00 00 E0 0C 32 13 36 58 C6 6B 0F 12 20 68 D9 92 01 05 00 0C 02 18 70 67 0F 16 
      return True;                                                              //0111 : 04 27 
      goto jl014E;                                                              //0113 : 06 4E 01 
    }
    foreach AllObjects(Class'Game_ConsoleCommand',comObj) {                     //0116 : 2F C5 20 B8 A0 5E 01 00 D0 0F 32 13 16 3D 01 
    }
    ChatResponse(aPawn,output);                                                 //013E : 1B F5 0F 00 00 00 E0 0C 32 13 00 48 10 32 13 16 
    return True;                                                                //014E : 04 27 
    //07 16 01 99 37 00 58 0F 32 13 2C 02 16 2F C5 20 B8 A0 5E 01 00 D0 0F 32 13 16 F2 00 07 F1 00 19 
    //00 D0 0F 32 13 12 00 04 1B 8F 0F 00 00 70 1F 2F 00 10 26 00 58 0F 32 13 16 16 0F 00 48 10 32 13 
    //19 00 D0 0F 32 13 05 00 00 01 60 09 32 13 07 84 00 7B 19 00 D0 0F 32 13 05 00 00 01 C8 0A 32 13 
    //1F 00 16 0E 61 43 00 48 10 32 13 70 70 1F 28 00 19 00 D0 0F 32 13 05 00 00 01 C8 0A 32 13 16 1F 
    //29 00 16 16 07 C2 00 7B 36 58 C6 6B 0F 19 00 D0 0F 32 13 05 00 0C 01 B8 0B 32 13 1F 00 16 0E 61 
    //43 00 48 10 32 13 A8 1F 3A 00 36 58 C6 6B 0F 19 00 D0 0F 32 13 05 00 0C 01 B8 0B 32 13 16 16 06 
    //DE 00 0E 61 43 00 48 10 32 13 36 58 C6 6B 0F 12 20 68 D9 92 01 05 00 0C 02 18 70 67 0F 16 1B F5 
    //0F 00 00 00 E0 0C 32 13 00 48 10 32 13 16 30 04 27 31 30 1B F5 0F 00 00 00 E0 0C 32 13 36 58 C6 
    //6B 0F 12 20 68 D9 92 01 05 00 0C 02 18 70 67 0F 16 04 27 06 4E 01 2F C5 20 B8 A0 5E 01 00 D0 0F 
    //32 13 16 3D 01 0E 61 43 00 48 10 32 13 19 00 D0 0F 32 13 05 00 00 01 60 09 32 13 16 31 30 1B F5 
    //0F 00 00 00 E0 0C 32 13 00 48 10 32 13 16 04 27 04 0B 47 
  }



