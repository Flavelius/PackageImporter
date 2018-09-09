//==============================================================================
//  MaterialSwitch
//==============================================================================

class MaterialSwitch extends Modifier
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (MaterialSwitch) transient int CurrentMaterialIndex;
  var (MaterialSwitch) editinline array<Material> Materials;


  function Trigger(Actor Other,Actor EventInstigator) {
    CurrentMaterialIndex++;                                                     //0000 : A5 01 E0 D2 3A 19 16 
    if (CurrentMaterialIndex >= Materials.Length) {                             //0007 : 07 1E 00 99 01 E0 D2 3A 19 37 01 58 D3 3A 19 16 
      CurrentMaterialIndex = 0;                                                 //0017 : 0F 01 E0 D2 3A 19 25 
    }
    if (Materials.Length > 0) {                                                 //001E : 07 3E 00 97 37 01 58 D3 3A 19 25 16 
      Material = Materials[CurrentMaterialIndex];                               //002A : 0F 01 28 28 2C 11 10 01 E0 D2 3A 19 01 58 D3 3A 19 
    } else {                                                                    //003B : 06 45 00 
      Material = None;                                                          //003E : 0F 01 28 28 2C 11 2A 
    }
    if (Material != None) {                                                     //0045 : 07 69 00 77 01 28 28 2C 11 2A 16 
      Material.Trigger(Other,EventInstigator);                                  //0050 : 19 01 28 28 2C 11 10 00 00 1B 32 01 00 00 00 78 D1 3A 19 00 D0 D3 3A 19 16 
    }
    if (FallbackMaterial != None) {                                             //0069 : 07 8D 00 77 01 30 41 70 0F 2A 16 
      FallbackMaterial.Trigger(Other,EventInstigator);                          //0074 : 19 01 30 41 70 0F 10 00 00 1B 32 01 00 00 00 78 D1 3A 19 00 D0 D3 3A 19 16 
    }
    //A5 01 E0 D2 3A 19 16 07 1E 00 99 01 E0 D2 3A 19 37 01 58 D3 3A 19 16 0F 01 E0 D2 3A 19 25 07 3E 
    //00 97 37 01 58 D3 3A 19 25 16 0F 01 28 28 2C 11 10 01 E0 D2 3A 19 01 58 D3 3A 19 06 45 00 0F 01 
    //28 28 2C 11 2A 07 69 00 77 01 28 28 2C 11 2A 16 19 01 28 28 2C 11 10 00 00 1B 32 01 00 00 00 78 
    //D1 3A 19 00 D0 D3 3A 19 16 07 8D 00 77 01 30 41 70 0F 2A 16 19 01 30 41 70 0F 10 00 00 1B 32 01 
    //00 00 00 78 D1 3A 19 00 D0 D3 3A 19 16 04 0B 47 
  }


  function Reset() {
    CurrentMaterialIndex = 0;                                                   //0000 : 0F 01 E0 D2 3A 19 25 
    if (Materials.Length > 0) {                                                 //0007 : 07 23 00 97 37 01 58 D3 3A 19 25 16 
      Material = Materials[0];                                                  //0013 : 0F 01 28 28 2C 11 10 25 01 58 D3 3A 19 
    } else {                                                                    //0020 : 06 2A 00 
      Material = None;                                                          //0023 : 0F 01 28 28 2C 11 2A 
    }
    if (Material != None) {                                                     //002A : 07 44 00 77 01 28 28 2C 11 2A 16 
      Material.Reset();                                                         //0035 : 19 01 28 28 2C 11 06 00 00 1B 53 12 00 00 16 
    }
    if (FallbackMaterial != None) {                                             //0044 : 07 5E 00 77 01 30 41 70 0F 2A 16 
      FallbackMaterial.Reset();                                                 //004F : 19 01 30 41 70 0F 06 00 00 1B 53 12 00 00 16 
    }
    //0F 01 E0 D2 3A 19 25 07 23 00 97 37 01 58 D3 3A 19 25 16 0F 01 28 28 2C 11 10 25 01 58 D3 3A 19 
    //06 2A 00 0F 01 28 28 2C 11 2A 07 44 00 77 01 28 28 2C 11 2A 16 19 01 28 28 2C 11 06 00 00 1B 53 
    //12 00 00 16 07 5E 00 77 01 30 41 70 0F 2A 16 19 01 30 41 70 0F 06 00 00 1B 53 12 00 00 16 04 0B 
    //47 
  }



