//==============================================================================
//  MaterialSwitchTrigger
//==============================================================================

class MaterialSwitchTrigger extends Triggers
    dependsOn(MaterialSwitch)
  ;

  struct SpecificMaterial {
      var (SpecificMaterial) MaterialSwitch SwitchMaterial;
      var (SpecificMaterial) int SubMaterial;

  };


  var (MaterialSwitchTrigger) array<SpecificMaterial> MaterialsToTrigger;


  function Trigger(Actor Other,Pawn EventInstigator) {
    local int i;
    local MaterialSwitch switchMat;
    if (Other == None) {                                                        //0000 : 07 12 00 72 00 D0 FB 7C 19 2A 16 
      Other = self;                                                             //000B : 0F 00 D0 FB 7C 19 17 
    }
    i = 0;                                                                      //0012 : 0F 00 40 2C 65 22 25 
    while (i < MaterialsToTrigger.Length) {                                     //0019 : 07 8F 00 96 00 40 2C 65 22 37 01 A0 E9 62 22 16 
      switchMat = MaterialsToTrigger[i].SwitchMaterial;                         //0029 : 0F 00 40 9F EE 22 36 E8 FD 7C 19 10 00 40 2C 65 22 01 A0 E9 62 22 
      if (switchMat != None) {                                                  //003F : 07 85 00 77 00 40 9F EE 22 2A 16 
        switchMat.CurrentMaterialIndex = MaterialsToTrigger[i].SubMaterial - 1; //004A : 0F 19 00 40 9F EE 22 05 00 04 01 E0 D2 3A 19 93 36 48 93 61 22 10 00 40 2C 65 22 01 A0 E9 62 22 26 16 
        switchMat.Trigger(Other,EventInstigator);                               //006C : 19 00 40 9F EE 22 10 00 00 1B 32 01 00 00 00 D0 FB 7C 19 00 C0 93 61 22 16 
      }
      ++i;                                                                      //0085 : A3 00 40 2C 65 22 16 
    }
    //07 12 00 72 00 D0 FB 7C 19 2A 16 0F 00 D0 FB 7C 19 17 0F 00 40 2C 65 22 25 07 8F 00 96 00 40 2C 
    //65 22 37 01 A0 E9 62 22 16 0F 00 40 9F EE 22 36 E8 FD 7C 19 10 00 40 2C 65 22 01 A0 E9 62 22 07 
    //85 00 77 00 40 9F EE 22 2A 16 0F 19 00 40 9F EE 22 05 00 04 01 E0 D2 3A 19 93 36 48 93 61 22 10 
    //00 40 2C 65 22 01 A0 E9 62 22 26 16 19 00 40 9F EE 22 10 00 00 1B 32 01 00 00 00 D0 FB 7C 19 00 
    //C0 93 61 22 16 A3 00 40 2C 65 22 16 06 19 00 04 0B 47 
  }


  function PostBeginPlay() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 E0 FC 62 22 25 
    while (i < MaterialsToTrigger.Length) {                                     //0007 : 07 51 00 96 00 E0 FC 62 22 37 01 A0 E9 62 22 16 
      if (MaterialsToTrigger[i].SwitchMaterial != None) {                       //0017 : 07 47 00 77 36 E8 FD 7C 19 10 00 E0 FC 62 22 01 A0 E9 62 22 2A 16 
        MaterialsToTrigger[i].SwitchMaterial.Reset();                           //002D : 19 36 E8 FD 7C 19 10 00 E0 FC 62 22 01 A0 E9 62 22 06 00 00 1B 53 12 00 00 16 
      }
      ++i;                                                                      //0047 : A3 00 E0 FC 62 22 16 
    }
    //0F 00 E0 FC 62 22 25 07 51 00 96 00 E0 FC 62 22 37 01 A0 E9 62 22 16 07 47 00 77 36 E8 FD 7C 19 
    //10 00 E0 FC 62 22 01 A0 E9 62 22 2A 16 19 36 E8 FD 7C 19 10 00 E0 FC 62 22 01 A0 E9 62 22 06 00 
    //00 1B 53 12 00 00 16 A3 00 E0 FC 62 22 16 06 07 00 04 0B 47 
  }



