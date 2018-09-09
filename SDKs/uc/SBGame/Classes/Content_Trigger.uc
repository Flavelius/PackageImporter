//==============================================================================
//  Content_Trigger
//==============================================================================

class Content_Trigger extends InsideTrigger
    native
    dependsOn(Game_Pawn,Content_Event,Content_Requirement)
  ;

  var (PseudoScript) array<Content_Requirement> Requirements;
  var (PseudoScript) array<Content_Event> Actions;
  var (PseudoScript) array<Content_Event> Unactions;
  var (PseudoScript) array<Content_Event> FirstInActions;
  var (PseudoScript) array<Content_Event> LastOutUnactions;


  function OnLeavePawn(Game_Pawn aPawn) {
    local int actionI;
    local bool doExecute;
    if (aPawn.SBRole == 1) {                                                    //0000 : 07 8D 01 9A 39 3A 19 00 18 75 35 0F 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 
      doExecute = True;                                                         //0019 : 14 2D 00 90 75 35 0F 27 
      actionI = 0;                                                              //0021 : 0F 00 08 76 35 0F 25 
      while (actionI < Unactions.Length) {                                      //0028 : 07 84 00 96 00 08 76 35 0F 37 01 80 76 35 0F 16 
        if (Unactions[actionI] != None
          && !Unactions[actionI].sv_CanExecute(aPawn,aPawn)) {//0038 : 07 7A 00 82 77 10 00 08 76 35 0F 01 80 76 35 0F 2A 16 18 22 00 81 19 10 00 08 76 35 0F 01 80 76 35 0F 10 00 04 1B 22 0C 00 00 00 18 75 35 0F 00 18 75 35 0F 16 16 16 
          doExecute = False;                                                    //006F : 14 2D 00 90 75 35 0F 28 
          goto jl0084;                                                          //0077 : 06 84 00 
        }
        actionI++;                                                              //007A : A5 00 08 76 35 0F 16 
      }
      if (doExecute) {                                                          //0084 : 07 CD 00 2D 00 90 75 35 0F 
        actionI = 0;                                                            //008D : 0F 00 08 76 35 0F 25 
        while (actionI < Unactions.Length) {                                    //0094 : 07 CD 00 96 00 08 76 35 0F 37 01 80 76 35 0F 16 
          Unactions[actionI].sv_Execute(aPawn,aPawn);                           //00A4 : 19 10 00 08 76 35 0F 01 80 76 35 0F 10 00 00 1B 23 0C 00 00 00 18 75 35 0F 00 18 75 35 0F 16 
          actionI++;                                                            //00C3 : A5 00 08 76 35 0F 16 
        }
      }
      if (PawnsInside.Length == 0) {                                            //00CD : 07 8D 01 9A 37 01 D8 85 32 19 25 16 
        doExecute = True;                                                       //00D9 : 14 2D 00 90 75 35 0F 27 
        actionI = 0;                                                            //00E1 : 0F 00 08 76 35 0F 25 
        while (actionI < LastOutUnactions.Length) {                             //00E8 : 07 44 01 96 00 08 76 35 0F 37 01 F8 76 35 0F 16 
          if (LastOutUnactions[actionI] != None
            && !LastOutUnactions[actionI].sv_CanExecute(aPawn,aPawn)) {//00F8 : 07 3A 01 82 77 10 00 08 76 35 0F 01 F8 76 35 0F 2A 16 18 22 00 81 19 10 00 08 76 35 0F 01 F8 76 35 0F 10 00 04 1B 22 0C 00 00 00 18 75 35 0F 00 18 75 35 0F 16 16 16 
            doExecute = False;                                                  //012F : 14 2D 00 90 75 35 0F 28 
            goto jl0144;                                                        //0137 : 06 44 01 
          }
          actionI++;                                                            //013A : A5 00 08 76 35 0F 16 
        }
        if (doExecute) {                                                        //0144 : 07 8D 01 2D 00 90 75 35 0F 
          actionI = 0;                                                          //014D : 0F 00 08 76 35 0F 25 
          while (actionI < LastOutUnactions.Length) {                           //0154 : 07 8D 01 96 00 08 76 35 0F 37 01 F8 76 35 0F 16 
            LastOutUnactions[actionI].sv_Execute(aPawn,aPawn);                  //0164 : 19 10 00 08 76 35 0F 01 F8 76 35 0F 10 00 00 1B 23 0C 00 00 00 18 75 35 0F 00 18 75 35 0F 16 
            actionI++;                                                          //0183 : A5 00 08 76 35 0F 16 
          }
        }
      }
    }
    Super.OnLeavePawn(aPawn);                                                   //018D : 1C 08 C1 31 0F 00 18 75 35 0F 16 
    //07 8D 01 9A 39 3A 19 00 18 75 35 0F 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 14 2D 00 90 75 35 0F 
    //27 0F 00 08 76 35 0F 25 07 84 00 96 00 08 76 35 0F 37 01 80 76 35 0F 16 07 7A 00 82 77 10 00 08 
    //76 35 0F 01 80 76 35 0F 2A 16 18 22 00 81 19 10 00 08 76 35 0F 01 80 76 35 0F 10 00 04 1B 22 0C 
    //00 00 00 18 75 35 0F 00 18 75 35 0F 16 16 16 14 2D 00 90 75 35 0F 28 06 84 00 A5 00 08 76 35 0F 
    //16 06 28 00 07 CD 00 2D 00 90 75 35 0F 0F 00 08 76 35 0F 25 07 CD 00 96 00 08 76 35 0F 37 01 80 
    //76 35 0F 16 19 10 00 08 76 35 0F 01 80 76 35 0F 10 00 00 1B 23 0C 00 00 00 18 75 35 0F 00 18 75 
    //35 0F 16 A5 00 08 76 35 0F 16 06 94 00 07 8D 01 9A 37 01 D8 85 32 19 25 16 14 2D 00 90 75 35 0F 
    //27 0F 00 08 76 35 0F 25 07 44 01 96 00 08 76 35 0F 37 01 F8 76 35 0F 16 07 3A 01 82 77 10 00 08 
    //76 35 0F 01 F8 76 35 0F 2A 16 18 22 00 81 19 10 00 08 76 35 0F 01 F8 76 35 0F 10 00 04 1B 22 0C 
    //00 00 00 18 75 35 0F 00 18 75 35 0F 16 16 16 14 2D 00 90 75 35 0F 28 06 44 01 A5 00 08 76 35 0F 
    //16 06 E8 00 07 8D 01 2D 00 90 75 35 0F 0F 00 08 76 35 0F 25 07 8D 01 96 00 08 76 35 0F 37 01 F8 
    //76 35 0F 16 19 10 00 08 76 35 0F 01 F8 76 35 0F 10 00 00 1B 23 0C 00 00 00 18 75 35 0F 00 18 75 
    //35 0F 16 A5 00 08 76 35 0F 16 06 54 01 1C 08 C1 31 0F 00 18 75 35 0F 16 04 0B 47 
  }


  function OnEnterPawn(Game_Pawn aPawn) {
    local int actionI;
    local bool doExecute;
    Super.OnEnterPawn(aPawn);                                                   //0000 : 1C 68 C2 31 0F 00 60 D1 35 19 16 
    if (aPawn.SBRole == 1) {                                                    //000B : 07 98 01 9A 39 3A 19 00 60 D1 35 19 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 
      doExecute = True;                                                         //0024 : 14 2D 00 D8 D1 35 19 27 
      actionI = 0;                                                              //002C : 0F 00 50 D2 35 19 25 
      while (actionI < Actions.Length) {                                        //0033 : 07 8F 00 96 00 50 D2 35 19 37 01 C8 D2 35 19 16 
        if (Actions[actionI] != None
          && !Actions[actionI].sv_CanExecute(aPawn,aPawn)) {//0043 : 07 85 00 82 77 10 00 50 D2 35 19 01 C8 D2 35 19 2A 16 18 22 00 81 19 10 00 50 D2 35 19 01 C8 D2 35 19 10 00 04 1B 22 0C 00 00 00 60 D1 35 19 00 60 D1 35 19 16 16 16 
          doExecute = False;                                                    //007A : 14 2D 00 D8 D1 35 19 28 
          goto jl008F;                                                          //0082 : 06 8F 00 
        }
        actionI++;                                                              //0085 : A5 00 50 D2 35 19 16 
      }
      if (doExecute) {                                                          //008F : 07 D8 00 2D 00 D8 D1 35 19 
        actionI = 0;                                                            //0098 : 0F 00 50 D2 35 19 25 
        while (actionI < Actions.Length) {                                      //009F : 07 D8 00 96 00 50 D2 35 19 37 01 C8 D2 35 19 16 
          Actions[actionI].sv_Execute(aPawn,aPawn);                             //00AF : 19 10 00 50 D2 35 19 01 C8 D2 35 19 10 00 00 1B 23 0C 00 00 00 60 D1 35 19 00 60 D1 35 19 16 
          actionI++;                                                            //00CE : A5 00 50 D2 35 19 16 
        }
      }
      if (PawnsInside.Length == 1) {                                            //00D8 : 07 98 01 9A 37 01 D8 85 32 19 26 16 
        doExecute = True;                                                       //00E4 : 14 2D 00 D8 D1 35 19 27 
        actionI = 0;                                                            //00EC : 0F 00 50 D2 35 19 25 
        while (actionI < FirstInActions.Length) {                               //00F3 : 07 4F 01 96 00 50 D2 35 19 37 01 40 D3 35 19 16 
          if (FirstInActions[actionI] != None
            && !FirstInActions[actionI].sv_CanExecute(aPawn,aPawn)) {//0103 : 07 45 01 82 77 10 00 50 D2 35 19 01 40 D3 35 19 2A 16 18 22 00 81 19 10 00 50 D2 35 19 01 40 D3 35 19 10 00 04 1B 22 0C 00 00 00 60 D1 35 19 00 60 D1 35 19 16 16 16 
            doExecute = False;                                                  //013A : 14 2D 00 D8 D1 35 19 28 
            goto jl014F;                                                        //0142 : 06 4F 01 
          }
          actionI++;                                                            //0145 : A5 00 50 D2 35 19 16 
        }
        if (doExecute) {                                                        //014F : 07 98 01 2D 00 D8 D1 35 19 
          actionI = 0;                                                          //0158 : 0F 00 50 D2 35 19 25 
          while (actionI < FirstInActions.Length) {                             //015F : 07 98 01 96 00 50 D2 35 19 37 01 40 D3 35 19 16 
            FirstInActions[actionI].sv_Execute(aPawn,aPawn);                    //016F : 19 10 00 50 D2 35 19 01 40 D3 35 19 10 00 00 1B 23 0C 00 00 00 60 D1 35 19 00 60 D1 35 19 16 
            actionI++;                                                          //018E : A5 00 50 D2 35 19 16 
          }
        }
      }
    }
    //1C 68 C2 31 0F 00 60 D1 35 19 16 07 98 01 9A 39 3A 19 00 60 D1 35 19 05 00 01 01 40 B2 6C 0F 39 
    //3A 24 01 16 14 2D 00 D8 D1 35 19 27 0F 00 50 D2 35 19 25 07 8F 00 96 00 50 D2 35 19 37 01 C8 D2 
    //35 19 16 07 85 00 82 77 10 00 50 D2 35 19 01 C8 D2 35 19 2A 16 18 22 00 81 19 10 00 50 D2 35 19 
    //01 C8 D2 35 19 10 00 04 1B 22 0C 00 00 00 60 D1 35 19 00 60 D1 35 19 16 16 16 14 2D 00 D8 D1 35 
    //19 28 06 8F 00 A5 00 50 D2 35 19 16 06 33 00 07 D8 00 2D 00 D8 D1 35 19 0F 00 50 D2 35 19 25 07 
    //D8 00 96 00 50 D2 35 19 37 01 C8 D2 35 19 16 19 10 00 50 D2 35 19 01 C8 D2 35 19 10 00 00 1B 23 
    //0C 00 00 00 60 D1 35 19 00 60 D1 35 19 16 A5 00 50 D2 35 19 16 06 9F 00 07 98 01 9A 37 01 D8 85 
    //32 19 26 16 14 2D 00 D8 D1 35 19 27 0F 00 50 D2 35 19 25 07 4F 01 96 00 50 D2 35 19 37 01 40 D3 
    //35 19 16 07 45 01 82 77 10 00 50 D2 35 19 01 40 D3 35 19 2A 16 18 22 00 81 19 10 00 50 D2 35 19 
    //01 40 D3 35 19 10 00 04 1B 22 0C 00 00 00 60 D1 35 19 00 60 D1 35 19 16 16 16 14 2D 00 D8 D1 35 
    //19 28 06 4F 01 A5 00 50 D2 35 19 16 06 F3 00 07 98 01 2D 00 D8 D1 35 19 0F 00 50 D2 35 19 25 07 
    //98 01 96 00 50 D2 35 19 37 01 40 D3 35 19 16 19 10 00 50 D2 35 19 01 40 D3 35 19 10 00 00 1B 23 
    //0C 00 00 00 60 D1 35 19 00 60 D1 35 19 16 A5 00 50 D2 35 19 16 06 5F 01 04 0B 47 
  }


  function bool CheckPawn(Game_Pawn aPawn) {
    local int reqI;
    if (aPawn.SBRole == 1) {                                                    //0000 : 07 7E 00 9A 39 3A 19 00 30 D4 35 19 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 
      if (aPawn != None) {                                                      //0019 : 07 79 00 77 00 30 D4 35 19 2A 16 
        reqI = 0;                                                               //0024 : 0F 00 88 D5 35 19 25 
        while (reqI < Requirements.Length) {                                    //002B : 07 79 00 96 00 88 D5 35 19 37 01 B8 D3 35 19 16 
          if (Requirements[reqI] != None
            && !Requirements[reqI].CheckPawn(aPawn)) {//003B : 07 6F 00 82 77 10 00 88 D5 35 19 01 B8 D3 35 19 2A 16 18 1D 00 81 19 10 00 88 D5 35 19 01 B8 D3 35 19 0B 00 04 1C 90 E6 2B 11 00 30 D4 35 19 16 16 16 
            return False;                                                       //006D : 04 28 
          }
          reqI++;                                                               //006F : A5 00 88 D5 35 19 16 
        }
      }
      return True;                                                              //0079 : 04 27 
    } else {                                                                    //007B : 06 80 00 
      return False;                                                             //007E : 04 28 
    }
    //07 7E 00 9A 39 3A 19 00 30 D4 35 19 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 07 79 00 77 00 30 D4 
    //35 19 2A 16 0F 00 88 D5 35 19 25 07 79 00 96 00 88 D5 35 19 37 01 B8 D3 35 19 16 07 6F 00 82 77 
    //10 00 88 D5 35 19 01 B8 D3 35 19 2A 16 18 1D 00 81 19 10 00 88 D5 35 19 01 B8 D3 35 19 0B 00 04 
    //1C 90 E6 2B 11 00 30 D4 35 19 16 16 16 04 28 A5 00 88 D5 35 19 16 06 2B 00 04 27 06 80 00 04 28 
    //04 0B 47 
  }



