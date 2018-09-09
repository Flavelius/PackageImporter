//==============================================================================
//  MessageSender
//==============================================================================

class MessageSender extends Object
    dependsOn()
  ;

  const RANGE_UNKNOWN = 512;
  const RANGE_SYSTEM = 256;
  const RANGE_ERROR = 128;
  const RANGE_PRIVATE = 64;
  const RANGE_LOCAL = 32;
  const RANGE_BROADCAST = 16;
  const RANGE_HOUSE = 8;
  const RANGE_GUILD = 4;
  const RANGE_TEAM = 2;
  const RANGE_FRIENDS = 1;
  var Game_PlayerController PC;
  var int currentMessageRange;
  var float currentRadius;
  var string senderName;
  var string receiverName;
  var localized string NO_PLAYER_MSG;



