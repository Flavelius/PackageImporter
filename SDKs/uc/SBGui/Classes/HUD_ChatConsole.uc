//==============================================================================
//  HUD_ChatConsole
//==============================================================================

class HUD_ChatConsole extends Object
    native
    dependsOn()
  ;

  var HUD_Chat mChat;


  native function bool HandleMessage(out string Message,out string sender,out int Channel);


  native function bool HandleUserOutput(out string Message,out int Channel);


  native function bool HandleKeyEvent(out byte Key,out byte State,float delta);


  native function bool HandleKeyType(out byte Key,out string Unicode);


  function Initialize(HUD_Chat aChat) {
    mChat = aChat;                                                              //0000 : 0F 01 80 0E A7 19 00 F8 0E A7 19 
    //0F 01 80 0E A7 19 00 F8 0E A7 19 04 0B 47 
  }



