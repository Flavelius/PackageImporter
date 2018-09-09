//==============================================================================
//  CT_ProvideQuest
//==============================================================================

class CT_ProvideQuest extends CT_Quest
    native
    dependsOn()
  ;

  var (CT_ProvideQuest) export editinline Conversation_Response Accept;
  var (CT_ProvideQuest) export editinline Conversation_Response Decline;


  event bool sv_OnFinish(Game_Pawn aSpeaker,Game_Pawn aPartner) {
    local export editinline Quest_Type quest;
    quest = Quest_Type(Outer);                                                  //0000 : 0F 00 28 2B FB 13 2E F0 9D 5C 01 01 00 E4 6B 0F 
    if (ObtainQuest(aPartner,quest)) {                                          //0010 : 07 37 00 1B F0 0F 00 00 00 A0 2B FB 13 00 28 2B FB 13 16 
      return Super.sv_OnFinish(aSpeaker,aPartner);                              //0023 : 04 1C 00 A6 24 11 00 30 2A FB 13 00 A0 2B FB 13 16 
    } else {                                                                    //0034 : 06 39 00 
      return False;                                                             //0037 : 04 28 
    }
    //0F 00 28 2B FB 13 2E F0 9D 5C 01 01 00 E4 6B 0F 07 37 00 1B F0 0F 00 00 00 A0 2B FB 13 00 28 2B 
    //FB 13 16 04 1C 00 A6 24 11 00 30 2A FB 13 00 A0 2B FB 13 16 06 39 00 04 28 04 0B 47 
  }



