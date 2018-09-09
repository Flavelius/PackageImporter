//==============================================================================
//  Modifier
//==============================================================================

class Modifier extends Material
    native
    abstract
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Modifier) editinline Material Material;


  function Trigger(Actor Other,Actor EventInstigator) {
    if (Material != None) {                                                     //0000 : 07 24 00 77 01 28 28 2C 11 2A 16 
      Material.Trigger(Other,EventInstigator);                                  //000B : 19 01 28 28 2C 11 10 00 00 1B 32 01 00 00 00 C8 05 3A 11 00 D0 06 3A 11 16 
    }
    if (FallbackMaterial != None) {                                             //0024 : 07 48 00 77 01 30 41 70 0F 2A 16 
      FallbackMaterial.Trigger(Other,EventInstigator);                          //002F : 19 01 30 41 70 0F 10 00 00 1B 32 01 00 00 00 C8 05 3A 11 00 D0 06 3A 11 16 
    }
    //07 24 00 77 01 28 28 2C 11 2A 16 19 01 28 28 2C 11 10 00 00 1B 32 01 00 00 00 C8 05 3A 11 00 D0 
    //06 3A 11 16 07 48 00 77 01 30 41 70 0F 2A 16 19 01 30 41 70 0F 10 00 00 1B 32 01 00 00 00 C8 05 
    //3A 11 00 D0 06 3A 11 16 04 0B 47 
  }


  function Reset() {
    if (Material != None) {                                                     //0000 : 07 1A 00 77 01 28 28 2C 11 2A 16 
      Material.Reset();                                                         //000B : 19 01 28 28 2C 11 06 00 00 1B 53 12 00 00 16 
    }
    if (FallbackMaterial != None) {                                             //001A : 07 34 00 77 01 30 41 70 0F 2A 16 
      FallbackMaterial.Reset();                                                 //0025 : 19 01 30 41 70 0F 06 00 00 1B 53 12 00 00 16 
    }
    //07 1A 00 77 01 28 28 2C 11 2A 16 19 01 28 28 2C 11 06 00 00 1B 53 12 00 00 16 07 34 00 77 01 30 
    //41 70 0F 2A 16 19 01 30 41 70 0F 06 00 00 1B 53 12 00 00 16 04 0B 47 
  }



