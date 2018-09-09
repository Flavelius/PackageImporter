//==============================================================================
//  ViewMap_Pawn
//==============================================================================

class ViewMap_Pawn extends Game_Pawn
    native
    dependsOn(Controller)
    Config(User)
  ;

  var bool GhostMode;
  var bool GodMode;


  function bool CheatGhost() {
    UnderWaterTime = -1.00000000;                                               //0000 : 0F 01 40 0E 38 0F 1E 00 00 80 BF 
    SetCollision(False,False);                                                  //000B : 61 06 28 28 16 
    bCollideWorld = False;                                                      //0010 : 14 2D 01 60 E8 35 0F 28 
    return True;                                                                //0018 : 04 27 
    //0F 01 40 0E 38 0F 1E 00 00 80 BF 61 06 28 28 16 14 2D 01 60 E8 35 0F 28 04 27 04 0B 47 
  }


  function bool CheatWalk() {
    UnderWaterTime = default.UnderWaterTime;                                    //0000 : 0F 01 40 0E 38 0F 02 40 0E 38 0F 
    SetCollision(True,True);                                                    //000B : 61 06 27 27 16 
    SetPhysics(1);                                                              //0010 : 6F 82 24 01 16 
    bCollideWorld = True;                                                       //0015 : 14 2D 01 60 E8 35 0F 27 
    return True;                                                                //001D : 04 27 
    //0F 01 40 0E 38 0F 02 40 0E 38 0F 61 06 27 27 16 6F 82 24 01 16 14 2D 01 60 E8 35 0F 27 04 27 04 
    //0B 47 
  }


  exec function Ghost() {
    if (GhostMode == False) {                                                   //0000 : 07 2D 00 F2 2D 01 78 D0 35 0F 28 16 
      GhostMode = True;                                                         //000C : 14 2D 01 78 D0 35 0F 27 
      Controller.GotoState('PlayerFlying');                                     //0014 : 19 01 00 6E 6C 0F 07 00 00 71 21 EC 0E 00 00 16 
      CheatGhost();                                                             //0024 : 1B 0D 0F 00 00 16 
    } else {                                                                    //002A : 06 4B 00 
      GhostMode = False;                                                        //002D : 14 2D 01 78 D0 35 0F 28 
      Controller.GotoState('Walking');                                          //0035 : 19 01 00 6E 6C 0F 07 00 00 71 21 8E 13 00 00 16 
      CheatWalk();                                                              //0045 : 1B 0E 0F 00 00 16 
    }
    //07 2D 00 F2 2D 01 78 D0 35 0F 28 16 14 2D 01 78 D0 35 0F 27 19 01 00 6E 6C 0F 07 00 00 71 21 EC 
    //0E 00 00 16 1B 0D 0F 00 00 16 06 4B 00 14 2D 01 78 D0 35 0F 28 19 01 00 6E 6C 0F 07 00 00 71 21 
    //8E 13 00 00 16 1B 0E 0F 00 00 16 04 0B 47 
  }


  exec function God() {
    if (GodMode) {                                                              //0000 : 07 13 00 2D 01 F8 D1 35 0F 
      GodMode = False;                                                          //0009 : 14 2D 01 F8 D1 35 0F 28 
      return;                                                                   //0011 : 04 0B 
    }
    GodMode = True;                                                             //0013 : 14 2D 01 F8 D1 35 0F 27 
    //07 13 00 2D 01 F8 D1 35 0F 14 2D 01 F8 D1 35 0F 28 04 0B 14 2D 01 F8 D1 35 0F 27 04 0B 47 
  }


  event bool CanJump() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  simulated exec function Walk() {
    Controller.GotoState('PlayerWalking');                                      //0000 : 19 01 00 6E 6C 0F 07 00 00 71 21 C3 12 00 00 16 
    //19 01 00 6E 6C 0F 07 00 00 71 21 C3 12 00 00 16 04 0B 47 
  }


  simulated exec function Fly() {
    Controller.GotoState('PlayerFlying');                                       //0000 : 19 01 00 6E 6C 0F 07 00 00 71 21 EC 0E 00 00 16 
    //19 01 00 6E 6C 0F 07 00 00 71 21 EC 0E 00 00 16 04 0B 47 
  }


  native exec function ViewMapEditAppearance();


  native event SetCharacterStatsDefaults();


  event cl_OnInit() {
    Appearance.cl_OnInit();                                                     //0000 : 19 01 A8 83 18 11 06 00 00 1B 3F 05 00 00 16 
    Game_PlayerAppearance(Appearance.GetBase()).SetRandom(65535,65535,True,False);//000F : 19 2E B0 BD 5F 01 19 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 12 00 00 1B E9 0E 00 00 1D FF FF 00 00 1D FF FF 00 00 27 28 16 
    SetCharacterStatsDefaults();                                                //0039 : 1B 15 06 00 00 16 
    //19 01 A8 83 18 11 06 00 00 1B 3F 05 00 00 16 19 2E B0 BD 5F 01 19 01 A8 83 18 11 06 00 04 1B 63 
    //05 00 00 16 12 00 00 1B E9 0E 00 00 1D FF FF 00 00 1D FF FF 00 00 27 28 16 1B 15 06 00 00 16 04 
    //0B 47 
  }



