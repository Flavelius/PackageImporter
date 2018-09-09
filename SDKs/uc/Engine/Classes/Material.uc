//==============================================================================
//  Material
//==============================================================================

class Material extends Object
    native
    noexport
    collapsecategories
    dependsOn()
  ;

  enum ESurfaceTypes {
    EST_Default ,
    EST_Rock ,
    EST_Dirt ,
    EST_Metal ,
    EST_Wood ,
    EST_Plant ,
    EST_Flesh ,
    EST_Ice ,
    EST_Snow ,
    EST_Water ,
    EST_Glass ,
    EST_CreakyWood ,
    EST_Grass ,
    EST_Gravel ,
    EST_HardRock ,
    EST_Mud ,
    EST_Stone ,
    EST_Hardwood ,
    EST_WoodRug ,
    EST_Custom08 ,
    EST_Custom09 ,
    EST_Custom10 ,
    EST_Custom11 ,
    EST_Custom12 ,
    EST_Custom13 ,
    EST_Custom14 ,
    EST_Custom15 ,
    EST_Custom16 ,
    EST_Custom17 ,
    EST_Custom18 ,
    EST_Custom19 ,
    EST_Custom20 ,
    EST_Custom21 ,
    EST_Custom22 ,
    EST_Custom23 ,
    EST_Custom24 ,
    EST_Custom25 ,
    EST_Custom26 ,
    EST_Custom27 ,
    EST_Custom28 ,
    EST_Custom29 ,
    EST_Custom30 ,
    EST_Custom31 
  };

  var (Material) Material FallbackMaterial;
  var Material DefaultMaterial;
  var const transient bool UseFallback;
  var const transient bool Validated;
  var (Material) byte SurfaceType;
  var int MaterialType;


  native function int MaterialVSize();


  native function int MaterialUSize();


  function Trigger(Actor Other,Actor EventInstigator) {
    if (FallbackMaterial != None) {                                             //0000 : 07 24 00 77 01 30 41 70 0F 2A 16 
      FallbackMaterial.Trigger(Other,EventInstigator);                          //000B : 19 01 30 41 70 0F 10 00 00 1B 32 01 00 00 00 B8 40 70 0F 00 A8 41 70 0F 16 
    }
    //07 24 00 77 01 30 41 70 0F 2A 16 19 01 30 41 70 0F 10 00 00 1B 32 01 00 00 00 B8 40 70 0F 00 A8 
    //41 70 0F 16 04 0B 47 
  }


  function Reset() {
    if (FallbackMaterial != None) {                                             //0000 : 07 1A 00 77 01 30 41 70 0F 2A 16 
      FallbackMaterial.Reset();                                                 //000B : 19 01 30 41 70 0F 06 00 00 1B 53 12 00 00 16 
    }
    //07 1A 00 77 01 30 41 70 0F 2A 16 19 01 30 41 70 0F 06 00 00 1B 53 12 00 00 16 04 0B 47 
  }



