//==============================================================================
//  Game_SkeletalAppearance
//==============================================================================

class Game_SkeletalAppearance extends Game_Appearance within Game_Pawn
    native
    dependsOn()
  ;

  var Mesh SkeletalMesh;
  var Mesh SkeletalMeshAddition;
  var Material SkinTexture;
  var float CollisionRadius;
  var float CollisionHeight;
  var float SkillRadius;


  function app(int A) {
    Super.app(0);                                                               //0000 : 1C B0 14 21 11 25 16 
    if (A == 0) {                                                               //0007 : 07 2B 00 9A 00 A0 F1 E8 14 25 16 
      cl_ConsoleMessage("Mesh == " $ string(SkeletalMesh));                     //0012 : 1B F1 0B 00 00 70 1F 4D 65 73 68 20 3D 3D 20 00 39 56 01 60 E9 E8 14 16 16 
    }
    //1C B0 14 21 11 25 16 07 2B 00 9A 00 A0 F1 E8 14 25 16 1B F1 0B 00 00 70 1F 4D 65 73 68 20 3D 3D 
    //20 00 39 56 01 60 E9 E8 14 16 16 04 0B 47 
  }


  function bool Check() {
    return SkeletalMesh != None;                                                //0000 : 04 77 01 60 E9 E8 14 2A 16 
    //04 77 01 60 E9 E8 14 2A 16 04 0B 47 
  }



