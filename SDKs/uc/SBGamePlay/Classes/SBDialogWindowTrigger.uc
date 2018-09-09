//==============================================================================
//  SBDialogWindowTrigger
//==============================================================================

class SBDialogWindowTrigger extends Trigger
    dependsOn(Game_PlayerController,Game_GUI)
  ;

  enum windowType {
    SBDWT_EnterArena 
  };

  var (SBDialogWindowTrigger) byte windowToTrigger;


  function Touch(Actor Other) {
    local Game_PlayerController touchingPlayer;
    Super.Touch(Other);                                                         //0000 : 1C C0 26 7E 0F 00 48 85 A8 22 16 
    if (IsServer()) {                                                           //000B : 07 79 00 1B FF 0B 00 00 16 
      touchingPlayer = Game_PlayerController(Pawn(Other).Controller);           //0014 : 0F 00 E0 07 E7 23 2E 90 18 5B 01 19 2E 50 31 D4 00 00 48 85 A8 22 05 00 04 01 00 6E 6C 0F 
      if (Pawn(Other) != None && touchingPlayer != None) {                      //0032 : 07 79 00 82 77 2E 50 31 D4 00 00 48 85 A8 22 2A 16 18 09 00 77 00 E0 07 E7 23 2A 16 16 
        switch (windowToTrigger) {                                              //004F : 05 01 01 68 5E 4C 23 
          case 0 :                                                              //0056 : 0A 76 00 24 00 
            touchingPlayer.GUI.sv2cl_ShowEnterArena_CallStub();                 //005B : 19 19 00 E0 07 E7 23 05 00 04 01 40 8A 1B 11 06 00 00 1B 2E 10 00 00 16 
            break;                                                              //0073 : 06 79 00 
          default:                                                              //0076 : 0A FF FF 
        }
      }
    }
    //1C C0 26 7E 0F 00 48 85 A8 22 16 07 79 00 1B FF 0B 00 00 16 0F 00 E0 07 E7 23 2E 90 18 5B 01 19 
    //2E 50 31 D4 00 00 48 85 A8 22 05 00 04 01 00 6E 6C 0F 07 79 00 82 77 2E 50 31 D4 00 00 48 85 A8 
    //22 2A 16 18 09 00 77 00 E0 07 E7 23 2A 16 16 05 01 01 68 5E 4C 23 0A 76 00 24 00 19 19 00 E0 07 
    //E7 23 05 00 04 01 40 8A 1B 11 06 00 00 1B 2E 10 00 00 16 06 79 00 0A FF FF 04 0B 47 
  }



