//==============================================================================
//  Interaction_ChangeMesh
//==============================================================================

class Interaction_ChangeMesh extends Interaction_Component
    native
    editinlinenew
    dependsOn(Game_Actor,InteractiveLevelElement)
  ;

  var (Interaction_ChangeMesh) StaticMesh Mesh;
  var transient StaticMesh originalMesh;


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.ClOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 78 A8 32 13 00 80 E0 F8 13 00 B8 E1 F8 13 2D 00 30 E2 F8 13 16 
    if (aInstigator != None) {                                                  //0016 : 07 6B 00 77 00 B8 E1 F8 13 2A 16 
      if (!aReverse) {                                                          //0021 : 07 57 00 81 2D 00 30 E2 F8 13 16 
        originalMesh = aOwner.StaticMesh;                                       //002C : 0F 01 A8 E2 F8 13 19 00 80 E0 F8 13 05 00 04 01 30 01 38 0F 
        aOwner.SetStaticMesh(Mesh);                                             //0040 : 19 00 80 E0 F8 13 0B 00 00 1C A8 94 6B 0F 01 20 E3 F8 13 16 
      } else {                                                                  //0054 : 06 6B 00 
        aOwner.SetStaticMesh(originalMesh);                                     //0057 : 19 00 80 E0 F8 13 0B 00 00 1C A8 94 6B 0F 01 A8 E2 F8 13 16 
      }
    }
    //1C 78 A8 32 13 00 80 E0 F8 13 00 B8 E1 F8 13 2D 00 30 E2 F8 13 16 07 6B 00 77 00 B8 E1 F8 13 2A 
    //16 07 57 00 81 2D 00 30 E2 F8 13 16 0F 01 A8 E2 F8 13 19 00 80 E0 F8 13 05 00 04 01 30 01 38 0F 
    //19 00 80 E0 F8 13 0B 00 00 1C A8 94 6B 0F 01 20 E3 F8 13 16 06 6B 00 19 00 80 E0 F8 13 0B 00 00 
    //1C A8 94 6B 0F 01 A8 E2 F8 13 16 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 98 E3 F8 13 00 10 E4 F8 13 2D 00 88 E4 F8 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 00 E5 F8 13 2E F8 C7 5C 01 00 98 E3 F8 13 
    if (ile != None) {                                                          //0026 : 07 99 00 77 00 00 E5 F8 13 2A 16 
      if (!aReverse) {                                                          //0031 : 07 76 00 81 2D 00 88 E4 F8 13 16 
        originalMesh = aOwner.StaticMesh;                                       //003C : 0F 01 A8 E2 F8 13 19 00 98 E3 F8 13 05 00 04 01 30 01 38 0F 
        aOwner.SetStaticMesh(Mesh);                                             //0050 : 19 00 98 E3 F8 13 0B 00 00 1C A8 94 6B 0F 01 20 E3 F8 13 16 
        ile.sv_StartClientSubAction();                                          //0064 : 19 00 00 E5 F8 13 06 00 00 1B C3 0F 00 00 16 
      } else {                                                                  //0073 : 06 99 00 
        aOwner.SetStaticMesh(originalMesh);                                     //0076 : 19 00 98 E3 F8 13 0B 00 00 1C A8 94 6B 0F 01 A8 E2 F8 13 16 
        ile.sv_StartClientSubAction();                                          //008A : 19 00 00 E5 F8 13 06 00 00 1B C3 0F 00 00 16 
      }
    }
    //1C 60 AF 32 13 00 98 E3 F8 13 00 10 E4 F8 13 2D 00 88 E4 F8 13 16 0F 00 00 E5 F8 13 2E F8 C7 5C 
    //01 00 98 E3 F8 13 07 99 00 77 00 00 E5 F8 13 2A 16 07 76 00 81 2D 00 88 E4 F8 13 16 0F 01 A8 E2 
    //F8 13 19 00 98 E3 F8 13 05 00 04 01 30 01 38 0F 19 00 98 E3 F8 13 0B 00 00 1C A8 94 6B 0F 01 20 
    //E3 F8 13 16 19 00 00 E5 F8 13 06 00 00 1B C3 0F 00 00 16 06 99 00 19 00 98 E3 F8 13 0B 00 00 1C 
    //A8 94 6B 0F 01 A8 E2 F8 13 16 19 00 00 E5 F8 13 06 00 00 1B C3 0F 00 00 16 04 0B 47 
  }



