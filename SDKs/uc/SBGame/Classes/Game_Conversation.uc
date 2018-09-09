//==============================================================================
//  Game_Conversation
//==============================================================================

class Game_Conversation extends Base_Component within Game_Controller
    native
    dependsOn(Game_Controller,Game_Pawn)
  ;


  protected function Game_Pawn GetPawn() {
    return Game_Pawn(Outer.Pawn);                                               //0000 : 04 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    //04 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 04 0B 47 
  }


  event OnFailConversation(Game_Pawn aPartner) {
    //04 0B 47 
  }


  function FailConversation(Game_Pawn aPartner) {
    local Game_Controller partnerController;
    partnerController = Game_Controller(aPartner.Controller);                   //0000 : 0F 00 80 71 30 11 2E 10 0E 5B 01 19 00 90 70 30 11 05 00 04 01 00 6E 6C 0F 
    partnerController.ConversationControl.OnFailConversation(GetPawn());        //0019 : 19 19 00 80 71 30 11 05 00 04 01 C8 07 1B 11 0C 00 00 1B C4 05 00 00 1B 2B 0C 00 00 16 16 
    //0F 00 80 71 30 11 2E 10 0E 5B 01 19 00 90 70 30 11 05 00 04 01 00 6E 6C 0F 19 19 00 80 71 30 11 
    //05 00 04 01 C8 07 1B 11 0C 00 00 1B C4 05 00 00 1B 2B 0C 00 00 16 16 04 0B 47 
  }


  event OnEndConversation(Game_Pawn aPartner) {
    //04 0B 47 
  }


  event EndAllConversations() {
    //04 0B 47 
  }


  event EndConversation(Game_Pawn aPartner) {
    local Game_Controller partnerController;
    partnerController = Game_Controller(aPartner.Controller);                   //0000 : 0F 00 D0 75 30 11 2E 10 0E 5B 01 19 00 E0 74 30 11 05 00 04 01 00 6E 6C 0F 
    partnerController.ConversationControl.OnEndConversation(GetPawn());         //0019 : 19 19 00 D0 75 30 11 05 00 04 01 C8 07 1B 11 0C 00 00 1B C1 05 00 00 1B 2B 0C 00 00 16 16 
    //0F 00 D0 75 30 11 2E 10 0E 5B 01 19 00 E0 74 30 11 05 00 04 01 00 6E 6C 0F 19 19 00 D0 75 30 11 
    //05 00 04 01 C8 07 1B 11 0C 00 00 1B C1 05 00 00 1B 2B 0C 00 00 16 16 04 0B 47 
  }


  event OnTopic(Game_Pawn aPartner,export editinline Conversation_Topic aTopic) {
    //04 0B 47 
  }


  function Topic(Game_Pawn aPartner,export editinline Conversation_Topic aTopic) {
    local Game_Controller partnerController;
    partnerController = Game_Controller(aPartner.Controller);                   //0000 : 0F 00 C0 79 30 11 2E 10 0E 5B 01 19 00 C8 78 30 11 05 00 04 01 00 6E 6C 0F 
    partnerController.ConversationControl.OnTopic(GetPawn(),aTopic);            //0019 : 19 19 00 C0 79 30 11 05 00 04 01 C8 07 1B 11 11 00 00 1B FA 05 00 00 1B 2B 0C 00 00 16 00 38 7A 30 11 16 
    //0F 00 C0 79 30 11 2E 10 0E 5B 01 19 00 C8 78 30 11 05 00 04 01 00 6E 6C 0F 19 19 00 C0 79 30 11 
    //05 00 04 01 C8 07 1B 11 11 00 00 1B FA 05 00 00 1B 2B 0C 00 00 16 00 38 7A 30 11 16 04 0B 47 
  }


  event OnResponse(Game_Pawn aPartner,export editinline Conversation_Response aResponse) {
    //04 0B 47 
  }


  function Response(Game_Pawn aPartner,export editinline Conversation_Response aResponse) {
    local Game_Controller partnerController;
    partnerController = Game_Controller(aPartner.Controller);                   //0000 : 0F 00 28 7E 30 11 2E 10 0E 5B 01 19 00 30 7D 30 11 05 00 04 01 00 6E 6C 0F 
    partnerController.ConversationControl.OnResponse(GetPawn(),aResponse);      //0019 : 19 19 00 28 7E 30 11 05 00 04 01 C8 07 1B 11 11 00 00 1B E9 05 00 00 1B 2B 0C 00 00 16 00 A0 7E 30 11 16 
    //0F 00 28 7E 30 11 2E 10 0E 5B 01 19 00 30 7D 30 11 05 00 04 01 00 6E 6C 0F 19 19 00 28 7E 30 11 
    //05 00 04 01 C8 07 1B 11 11 00 00 1B E9 05 00 00 1B 2B 0C 00 00 16 00 A0 7E 30 11 16 04 0B 47 
  }


  event OnConversation(Game_Pawn aPartner,export editinline Conversation_Topic aTopic,export editinline Conversation_Node aState,array<Conversation_Response> aResponses,array<Conversation_Topic> aTopics) {
    //04 0B 47 
  }


  function Converse(Game_Pawn aPartner,export editinline Conversation_Topic aTopic,export editinline Conversation_Node aState) {
    //04 0B 47 
  }


  event OnInteraction(Game_Pawn aSource) {
    //04 0B 47 
  }


  function Interact(Game_Pawn aTarget) {
    local Game_Controller targetController;
    targetController = Game_Controller(aTarget.Controller);                     //0000 : 0F 00 80 88 30 11 2E 10 0E 5B 01 19 00 90 87 30 11 05 00 04 01 00 6E 6C 0F 
    targetController.ConversationControl.OnInteraction(GetPawn());              //0019 : 19 19 00 80 88 30 11 05 00 04 01 C8 07 1B 11 0C 00 00 1B D1 05 00 00 1B 2B 0C 00 00 16 16 
    //0F 00 80 88 30 11 2E 10 0E 5B 01 19 00 90 87 30 11 05 00 04 01 00 6E 6C 0F 19 19 00 80 88 30 11 
    //05 00 04 01 C8 07 1B 11 0C 00 00 1B D1 05 00 00 1B 2B 0C 00 00 16 16 04 0B 47 
  }


  function Banner(Game_Pawn aTarget,export editinline Conversation_Topic aTopic) {
    //04 0B 47 
  }


  event OnReact(Game_Pawn aSource) {
    //04 0B 47 
  }


  event GetAvailableTopics(out array<Conversation_Topic> ret) {
    //04 0B 47 
  }


  final native function Conversation_Topic ChooseTopic(Game_Pawn aPartner);


  final native function bool CanConverse(Game_Pawn aPartner);



