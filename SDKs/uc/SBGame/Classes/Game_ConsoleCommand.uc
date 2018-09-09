//==============================================================================
//  Game_ConsoleCommand
//==============================================================================

class Game_ConsoleCommand extends Object
    native
    dependsOn(Game_Pawn,Game_PlayerController,Game_PlayerInput)
  ;

  var string Command;
  var string Alias;
  var LocalizedString HelpText;


  native function ChatResponse(Game_Pawn aPawn,string aMessage);


  function bool Execute(Game_Pawn aPawn,array<string> Params,Game_Pawn aTarget) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool Attempt(Game_Pawn aPawn,array<string> aParams) {
    if (aParams.Length > 0 && Matches(aParams[0])) {                            //0000 : 07 55 00 82 97 37 00 F8 07 32 13 25 16 18 0E 00 1B 8F 0F 00 00 10 25 00 F8 07 32 13 16 16 
      return Execute(aPawn,aParams,Game_PlayerController(aPawn.Controller).Input.cl_GetTargetPawn());//001E : 04 1B B4 0C 00 00 00 80 07 32 13 00 F8 07 32 13 19 19 2E 90 18 5B 01 19 00 80 07 32 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 
    }
    return False;                                                               //0055 : 04 28 
    //07 55 00 82 97 37 00 F8 07 32 13 25 16 18 0E 00 1B 8F 0F 00 00 10 25 00 F8 07 32 13 16 16 04 1B 
    //B4 0C 00 00 00 80 07 32 13 00 F8 07 32 13 19 19 2E 90 18 5B 01 19 00 80 07 32 13 05 00 04 01 00 
    //6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 04 28 04 0B 47 
  }


  protected function bool Matches(string aCommand) {
    local string commandTag;
    if (aCommand != "" && Left(aCommand,1) == "/") {                            //0000 : 07 62 00 82 7B 00 D8 09 32 13 1F 00 16 18 0E 00 7A 80 00 D8 09 32 13 26 16 1F 2F 00 16 16 
      commandTag = Locs(Mid(aCommand,1));                                       //001E : 0F 00 50 0A 32 13 EE 7F 00 D8 09 32 13 26 16 16 
      if (commandTag == Locs(Command)
        || Alias != "" && commandTag == Locs(Alias)) {//002E : 07 62 00 84 7A 00 50 0A 32 13 EE 01 60 09 32 13 16 16 18 1D 00 82 7B 01 C8 0A 32 13 1F 00 16 18 0F 00 7A 00 50 0A 32 13 EE 01 C8 0A 32 13 16 16 16 16 
        return True;                                                            //0060 : 04 27 
      }
    }
    return False;                                                               //0062 : 04 28 
    //07 62 00 82 7B 00 D8 09 32 13 1F 00 16 18 0E 00 7A 80 00 D8 09 32 13 26 16 1F 2F 00 16 16 0F 00 
    //50 0A 32 13 EE 7F 00 D8 09 32 13 26 16 16 07 62 00 84 7A 00 50 0A 32 13 EE 01 60 09 32 13 16 16 
    //18 1D 00 82 7B 01 C8 0A 32 13 1F 00 16 18 0F 00 7A 00 50 0A 32 13 EE 01 C8 0A 32 13 16 16 16 16 
    //04 27 04 28 04 0B 47 
  }



