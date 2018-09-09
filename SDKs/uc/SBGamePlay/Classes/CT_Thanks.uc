//==============================================================================
//  CT_Thanks
//==============================================================================

class CT_Thanks extends CT_Target
    native
    dependsOn(QT_Fedex,Game_PlayerPawn,Game_QuestLog)
  ;


  event bool sv_OnFinish(Game_Pawn aSpeaker,Game_Pawn aPartner) {
    local export editinline Quest_Type quest;
    local export editinline QT_Fedex Target;
    Target = QT_Fedex(Outer);                                                   //0000 : 0F 00 18 15 FB 13 2E 10 8E 8D 01 01 00 E4 6B 0F 
    quest = Quest_Type(Target.Outer);                                           //0010 : 0F 00 90 15 FB 13 2E F0 9D 5C 01 19 00 18 15 FB 13 05 00 04 01 00 E4 6B 0F 
    if (Game_PlayerPawn(aPartner).questLog.sv_SetTargetAsCompleted(Target,aSpeaker)) {//0029 : 07 67 00 19 19 2E F0 47 5B 01 00 08 16 FB 13 05 00 04 01 F0 2F 7F 0F 10 00 04 1C 28 05 30 11 00 18 15 FB 13 00 E0 13 FB 13 16 
      return Super.sv_OnFinish(aSpeaker,aPartner);                              //0053 : 04 1C 00 A6 24 11 00 E0 13 FB 13 00 08 16 FB 13 16 
    } else {                                                                    //0064 : 06 69 00 
      return False;                                                             //0067 : 04 28 
    }
    //0F 00 18 15 FB 13 2E 10 8E 8D 01 01 00 E4 6B 0F 0F 00 90 15 FB 13 2E F0 9D 5C 01 19 00 18 15 FB 
    //13 05 00 04 01 00 E4 6B 0F 07 67 00 19 19 2E F0 47 5B 01 00 08 16 FB 13 05 00 04 01 F0 2F 7F 0F 
    //10 00 04 1C 28 05 30 11 00 18 15 FB 13 00 E0 13 FB 13 16 04 1C 00 A6 24 11 00 E0 13 FB 13 00 08 
    //16 FB 13 16 06 69 00 04 28 04 0B 47 
  }



