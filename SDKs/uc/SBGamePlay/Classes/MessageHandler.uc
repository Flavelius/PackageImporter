//==============================================================================
//  MessageHandler
//==============================================================================

class MessageHandler extends Object
    dependsOn()
  ;

  const HANDLER_NOT_FOUND =  -1;
  struct CommandHandler {
      var string Command;
      var string handlerClassName;

  };


  var Game_PlayerController PC;
  var MessageFilter filter;
  var array<CommandHandler> handlers;



