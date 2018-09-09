//==============================================================================
//  CR_Decline
//==============================================================================

class CR_Decline extends Conversation_Response
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Controller,Game_Conversation,Class,SBDBSync)
  ;


  event bool sv_OnResponse(Game_Pawn aSpeaker,Game_Pawn aPartner) {
    if (Super.sv_OnResponse(aSpeaker,aPartner)) {                               //0000 : 07 43 00 1C A8 36 38 11 00 A0 F4 F9 13 00 A8 F5 F9 13 16 
      Game_Controller(aSpeaker.Controller).ConversationControl.FailConversation(aPartner);//0013 : 19 19 2E 10 0E 5B 01 19 00 A0 F4 F9 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 0B 00 00 1B 30 10 00 00 00 A8 F5 F9 13 16 
      return True;                                                              //003E : 04 27 
    } else {                                                                    //0040 : 06 45 00 
      return False;                                                             //0043 : 04 28 
    }
    //07 43 00 1C A8 36 38 11 00 A0 F4 F9 13 00 A8 F5 F9 13 16 19 19 2E 10 0E 5B 01 19 00 A0 F4 F9 13 
    //05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 0B 00 00 1B 30 10 00 00 00 A8 F5 F9 13 16 04 27 
    //06 45 00 04 28 04 0B 47 
  }


  function string GetText() {
    return Class'SBDBSync'.GetDescription(1102871635);                          //0000 : 04 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 1D 53 7C BC 41 16 
    //04 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 1D 53 7C BC 41 16 04 0B 47 
  }



