//==============================================================================
//  Editor_SpwnieControl
//==============================================================================

class Editor_SpwnieControl extends Base_Component within Game_GameMasterController
    dependsOn(Editor_Spwnie)
  ;

  var Editor_Spwnie mTarget;


  function SetTarget(Editor_Spwnie aTarget) {
    if (mTarget != None) {                                                      //0000 : 07 1B 00 77 01 B8 AA 34 11 2A 16 
      mTarget.SetSelected(False);                                               //000B : 19 01 B8 AA 34 11 07 00 00 1B 4E 0D 00 00 28 16 
    }
    mTarget = aTarget;                                                          //001B : 0F 01 B8 AA 34 11 00 30 AB 34 11 
    if (mTarget != None) {                                                      //0026 : 07 41 00 77 01 B8 AA 34 11 2A 16 
      mTarget.SetSelected(True);                                                //0031 : 19 01 B8 AA 34 11 07 00 00 1B 4E 0D 00 00 27 16 
    }
    //07 1B 00 77 01 B8 AA 34 11 2A 16 19 01 B8 AA 34 11 07 00 00 1B 4E 0D 00 00 28 16 0F 01 B8 AA 34 
    //11 00 30 AB 34 11 07 41 00 77 01 B8 AA 34 11 2A 16 19 01 B8 AA 34 11 07 00 00 1B 4E 0D 00 00 27 
    //16 04 0B 47 
  }



