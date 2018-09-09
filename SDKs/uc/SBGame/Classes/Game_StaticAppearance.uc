//==============================================================================
//  Game_StaticAppearance
//==============================================================================

class Game_StaticAppearance extends Game_Appearance within Game_Pawn
    native
    dependsOn()
  ;

  var StaticMesh StatMesh;
  var float CollisionRadius;
  var float CollisionHeight;
  var float SkillRadius;


  function app(int A) {
    Super.app(0);                                                               //0000 : 1C B0 14 21 11 25 16 
    if (A == 0) {                                                               //0007 : 07 31 00 9A 00 80 D2 E8 14 25 16 
      cl_ConsoleMessage("StaticMesh == " $ string(StatMesh));                   //0012 : 1B F1 0B 00 00 70 1F 53 74 61 74 69 63 4D 65 73 68 20 3D 3D 20 00 39 56 01 A8 C7 E8 14 16 16 
    }
    //1C B0 14 21 11 25 16 07 31 00 9A 00 80 D2 E8 14 25 16 1B F1 0B 00 00 70 1F 53 74 61 74 69 63 4D 
    //65 73 68 20 3D 3D 20 00 39 56 01 A8 C7 E8 14 16 16 04 0B 47 
  }


  function bool Check() {
    return StatMesh != None;                                                    //0000 : 04 77 01 A8 C7 E8 14 2A 16 
    //04 77 01 A8 C7 E8 14 2A 16 04 0B 47 
  }



