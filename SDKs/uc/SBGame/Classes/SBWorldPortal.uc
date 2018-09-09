//==============================================================================
//  SBWorldPortal
//==============================================================================

class SBWorldPortal extends SBBasePortal
    native
    dependsOn(Class,Actor,Game_PlayerPawn,Game_GameServer,Game_PlayerController)
  ;


  function Touch(Actor Other) {
    local Game_PlayerController PlayerController;
    local Game_PlayerPawn playerPawn;
    local Game_GameServer Engine;
    Super.Touch(Other);                                                         //0000 : 1C C0 26 7E 0F 00 18 54 35 0F 16 
    Engine = Game_GameServer(Class'Actor'.static.GetGameEngine());              //000B : 0F 00 90 54 35 0F 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
    if (Engine != None && NavigationTag != "") {                                //0025 : 07 DF 00 82 77 00 90 54 35 0F 2A 16 18 0A 00 7B 01 00 4D 35 0F 1F 00 16 16 
      playerPawn = Game_PlayerPawn(Other);                                      //003E : 0F 00 08 55 35 0F 2E F0 47 5B 01 00 18 54 35 0F 
      if (playerPawn != None) {                                                 //004E : 07 DF 00 77 00 08 55 35 0F 2A 16 
        PlayerController = Game_PlayerController(playerPawn.Controller);        //0059 : 0F 00 C8 A7 35 19 2E 90 18 5B 01 19 00 08 55 35 0F 05 00 04 01 00 6E 6C 0F 
        if (PlayerController != None) {                                         //0072 : 07 DF 00 77 00 C8 A7 35 19 2A 16 
          if (playerPawn.sv_IsPayingPlayer() == False
            && IsFreeToPlayAllowed(Engine.GetPortalDestinationWorldID(self)) == False) {//007D : 07 C1 00 82 F2 19 00 08 55 35 0F 06 00 04 1C 80 E6 7E 0F 16 28 16 18 1A 00 F2 1C 68 53 35 0F 19 00 90 54 35 0F 07 00 04 1B 2A 13 00 00 17 16 16 28 16 16 
            playerPawn.sv2cl_FreeToPlayPortalForbidden_CallStub();              //00B0 : 19 00 08 55 35 0F 06 00 00 1B B1 0D 00 00 16 
            return;                                                             //00BF : 04 0B 
          }
          Engine.LoginToWorldByPortal(self,PlayerController.CharacterID);       //00C1 : 19 00 90 54 35 0F 15 00 04 1B 29 13 00 00 17 19 00 C8 A7 35 19 05 00 04 01 68 3B 19 11 16 
        }
      }
    }
    //1C C0 26 7E 0F 00 18 54 35 0F 16 0F 00 90 54 35 0F 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 
    //78 2B 6E 0F 16 07 DF 00 82 77 00 90 54 35 0F 2A 16 18 0A 00 7B 01 00 4D 35 0F 1F 00 16 16 0F 00 
    //08 55 35 0F 2E F0 47 5B 01 00 18 54 35 0F 07 DF 00 77 00 08 55 35 0F 2A 16 0F 00 C8 A7 35 19 2E 
    //90 18 5B 01 19 00 08 55 35 0F 05 00 04 01 00 6E 6C 0F 07 DF 00 77 00 C8 A7 35 19 2A 16 07 C1 00 
    //82 F2 19 00 08 55 35 0F 06 00 04 1C 80 E6 7E 0F 16 28 16 18 1A 00 F2 1C 68 53 35 0F 19 00 90 54 
    //35 0F 07 00 04 1B 2A 13 00 00 17 16 16 28 16 16 19 00 08 55 35 0F 06 00 00 1B B1 0D 00 00 16 04 
    //0B 19 00 90 54 35 0F 15 00 04 1B 29 13 00 00 17 19 00 C8 A7 35 19 05 00 04 01 68 3B 19 11 16 04 
    //0B 47 
  }


  final native function bool IsFreeToPlayAllowed(int worldID);



