//==============================================================================
//  Quest_Trigger
//==============================================================================

class Quest_Trigger extends InsideTrigger
    native
    exportstructs
    dependsOn(Game_Pawn,Game_Controller,Class,Content_Type)
  ;


  function OnLeavePawn(Game_Pawn aPawn) {
    local Game_Controller Controller;
    Controller = Game_Controller(aPawn.Controller);                             //0000 : 0F 00 10 90 32 19 2E 10 0E 5B 01 19 00 E0 8E 32 19 05 00 04 01 00 6E 6C 0F 
    if (Controller != None && aPawn.SBRole == 1) {                              //0019 : 07 5B 00 82 77 00 10 90 32 19 2A 16 18 17 00 9A 39 3A 19 00 E0 8E 32 19 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 16 
      Controller.sv_FireHook(Class'Content_Type'.5,self,0);                     //003F : 19 00 10 90 32 19 13 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 05 17 25 16 
    }
    Super.OnLeavePawn(aPawn);                                                   //005B : 1C 08 C1 31 0F 00 E0 8E 32 19 16 
    //0F 00 10 90 32 19 2E 10 0E 5B 01 19 00 E0 8E 32 19 05 00 04 01 00 6E 6C 0F 07 5B 00 82 77 00 10 
    //90 32 19 2A 16 18 17 00 9A 39 3A 19 00 E0 8E 32 19 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 16 19 
    //00 10 90 32 19 13 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 05 17 25 16 1C 08 C1 31 0F 
    //00 E0 8E 32 19 16 04 0B 47 
  }


  function OnEnterPawn(Game_Pawn aPawn) {
    local Game_Controller Controller;
    Controller = Game_Controller(aPawn.Controller);                             //0000 : 0F 00 B8 91 32 19 2E 10 0E 5B 01 19 00 88 90 32 19 05 00 04 01 00 6E 6C 0F 
    if (Controller != None && aPawn.SBRole == 1) {                              //0019 : 07 5B 00 82 77 00 B8 91 32 19 2A 16 18 17 00 9A 39 3A 19 00 88 90 32 19 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 16 
      Controller.sv_FireHook(Class'Content_Type'.5,self,1);                     //003F : 19 00 B8 91 32 19 13 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 05 17 26 16 
    }
    Super.OnEnterPawn(aPawn);                                                   //005B : 1C 68 C2 31 0F 00 88 90 32 19 16 
    //0F 00 B8 91 32 19 2E 10 0E 5B 01 19 00 88 90 32 19 05 00 04 01 00 6E 6C 0F 07 5B 00 82 77 00 B8 
    //91 32 19 2A 16 18 17 00 9A 39 3A 19 00 88 90 32 19 05 00 01 01 40 B2 6C 0F 39 3A 24 01 16 16 19 
    //00 B8 91 32 19 13 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 05 17 26 16 1C 68 C2 31 0F 
    //00 88 90 32 19 16 04 0B 47 
  }



