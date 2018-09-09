//==============================================================================
//  HudOverlay
//==============================================================================

class HudOverlay extends Actor
    dependsOn(HUD)
  ;


  simulated function Destroyed() {
    if (HUD(Owner) != None) {                                                   //0000 : 07 25 00 77 2E 18 1A C2 00 01 B0 9F 6C 0F 2A 16 
      HUD(Owner).RemoveHudOverlay(self);                                        //0010 : 19 2E 18 1A C2 00 01 B0 9F 6C 0F 07 00 00 1B BF 2B 00 00 17 16 
    }
    Super.Destroyed();                                                          //0025 : 1C 30 8A 6D 0F 16 
    //07 25 00 77 2E 18 1A C2 00 01 B0 9F 6C 0F 2A 16 19 2E 18 1A C2 00 01 B0 9F 6C 0F 07 00 00 1B BF 
    //2B 00 00 17 16 1C 30 8A 6D 0F 16 04 0B 47 
  }


  simulated function Render(Canvas C);



