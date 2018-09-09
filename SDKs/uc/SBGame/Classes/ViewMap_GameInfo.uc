//==============================================================================
//  ViewMap_GameInfo
//==============================================================================

class ViewMap_GameInfo extends Game_GameInfo
    native
    dependsOn(GameInfo)
  ;

  var float GameSpeed;


  exec function SloMo(float t) {
    local float OldSpeed;
    OldSpeed = GameSpeed;                                                       //0000 : 0F 00 10 FC 35 0F 01 20 FB 35 0F 
    GameSpeed = FMax(t,0.10000000);                                             //000B : 0F 01 20 FB 35 0F F5 00 98 FB 35 0F 1E CD CC CC 3D 16 
    Level.TimeDilation = 1.10000002 * GameSpeed;                                //001D : 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 9D 74 0F AB 1E CD CC 8C 3F 01 20 FB 35 0F 16 
    if (GameSpeed != OldSpeed) {                                                //0038 : 07 61 00 B5 01 20 FB 35 0F 00 10 FC 35 0F 16 
      default.GameSpeed = GameSpeed;                                            //0047 : 0F 02 20 FB 35 0F 01 20 FB 35 0F 
      Class'GameInfo'.static.StaticSaveConfig();                                //0052 : 12 20 58 B6 C1 00 06 00 00 1C 98 A8 69 0F 16 
    }
    SetTimer(Level.TimeDilation,True);                                          //0061 : 61 18 19 01 D8 7E 6C 0F 05 00 04 01 A8 9D 74 0F 27 16 
    //0F 00 10 FC 35 0F 01 20 FB 35 0F 0F 01 20 FB 35 0F F5 00 98 FB 35 0F 1E CD CC CC 3D 16 0F 19 01 
    //D8 7E 6C 0F 05 00 04 01 A8 9D 74 0F AB 1E CD CC 8C 3F 01 20 FB 35 0F 16 07 61 00 B5 01 20 FB 35 
    //0F 00 10 FC 35 0F 16 0F 02 20 FB 35 0F 01 20 FB 35 0F 12 20 58 B6 C1 00 06 00 00 1C 98 A8 69 0F 
    //16 61 18 19 01 D8 7E 6C 0F 05 00 04 01 A8 9D 74 0F 27 16 04 0B 47 
  }



