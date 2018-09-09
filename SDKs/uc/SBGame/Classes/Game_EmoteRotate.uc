//==============================================================================
//  Game_EmoteRotate
//==============================================================================

class Game_EmoteRotate extends Game_Emote
    dependsOn(Game_Pawn)
  ;

  var int Yaw;


  function OnClientExecute(Game_Pawn aPawn) {
    Super.OnClientExecute(aPawn);                                               //0000 : 1C 28 C5 2A 11 00 50 D4 2A 11 16 
    //1C 28 C5 2A 11 00 50 D4 2A 11 16 04 0B 47 
  }


  function OnServerExecute(Game_Pawn aPawn) {
    local Rotator DesiredRotation;
    DesiredRotation.Yaw = Yaw;                                                  //0000 : 0F 36 20 BF 69 0F 00 F8 D5 2A 11 01 08 D5 2A 11 
    Super.OnServerExecute(aPawn);                                               //0010 : 1C D8 C5 2A 11 00 80 D5 2A 11 16 
    aPawn.SetRotation(DesiredRotation);                                         //001B : 19 00 80 D5 2A 11 0B 00 04 1C 70 01 6E 0F 00 F8 D5 2A 11 16 
    if (aPawn.IsPlayerPawn()) {                                                 //002F : 07 66 00 19 00 80 D5 2A 11 06 00 04 1B B9 0C 00 00 16 
      aPawn.sv_TeleportTo(aPawn.Location,DesiredRotation);                      //0041 : 19 00 80 D5 2A 11 19 00 04 1B 4A 07 00 00 19 00 80 D5 2A 11 05 00 0C 01 30 81 6C 0F 00 F8 D5 2A 11 16 
    } else {                                                                    //0063 : 06 88 00 
      aPawn.sv_TeleportTo(aPawn.Location,DesiredRotation);                      //0066 : 19 00 80 D5 2A 11 19 00 04 1B 4A 07 00 00 19 00 80 D5 2A 11 05 00 0C 01 30 81 6C 0F 00 F8 D5 2A 11 16 
    }
    //0F 36 20 BF 69 0F 00 F8 D5 2A 11 01 08 D5 2A 11 1C D8 C5 2A 11 00 80 D5 2A 11 16 19 00 80 D5 2A 
    //11 0B 00 04 1C 70 01 6E 0F 00 F8 D5 2A 11 16 07 66 00 19 00 80 D5 2A 11 06 00 04 1B B9 0C 00 00 
    //16 19 00 80 D5 2A 11 19 00 04 1B 4A 07 00 00 19 00 80 D5 2A 11 05 00 0C 01 30 81 6C 0F 00 F8 D5 
    //2A 11 16 06 88 00 19 00 80 D5 2A 11 19 00 04 1B 4A 07 00 00 19 00 80 D5 2A 11 05 00 0C 01 30 81 
    //6C 0F 00 F8 D5 2A 11 16 04 0B 47 
  }



