//==============================================================================
//  Game_Perception
//==============================================================================

class Game_Perception extends Object
    dependsOn()
  ;

  var bool DebugTracking;


  function Notify(Game_Pawn aPawn) {
    if (DebugTracking) {                                                        //0000 : 07 09 00 2D 01 68 1B 6A 22 
    }
    //07 09 00 2D 01 68 1B 6A 22 04 0B 47 
  }


  function string DebugDescription() {
    return "Perception" @ string(self.Class);                                   //0000 : 04 A8 1F 50 65 72 63 65 70 74 69 6F 6E 00 39 56 19 17 05 00 04 01 68 E5 6B 0F 16 
    //04 A8 1F 50 65 72 63 65 70 74 69 6F 6E 00 39 56 19 17 05 00 04 01 68 E5 6B 0F 16 04 0B 47 
  }



