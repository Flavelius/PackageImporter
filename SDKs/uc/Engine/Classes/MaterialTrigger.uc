//==============================================================================
//  MaterialTrigger
//==============================================================================

class MaterialTrigger extends Triggers
    dependsOn(Material)
  ;

  var (MaterialTrigger) array<Material> MaterialsToTrigger;


  function Trigger(Actor Other,Pawn EventInstigator) {
    local int i;
    if (Other == None) {                                                        //0000 : 07 12 00 72 00 08 4F F2 1C 2A 16 
      Other = self;                                                             //000B : 0F 00 08 4F F2 1C 17 
    }
    i = 0;                                                                      //0012 : 0F 00 48 6E F2 1C 25 
    while (i < MaterialsToTrigger.Length) {                                     //0019 : 07 63 00 96 00 48 6E F2 1C 37 01 40 89 F2 1C 16 
      if (MaterialsToTrigger[i] != None) {                                      //0029 : 07 59 00 77 10 00 48 6E F2 1C 01 40 89 F2 1C 2A 16 
        MaterialsToTrigger[i].Trigger(Other,EventInstigator);                   //003A : 19 10 00 48 6E F2 1C 01 40 89 F2 1C 10 00 00 1B 32 01 00 00 00 08 4F F2 1C 00 B8 D1 F2 1C 16 
      }
      i++;                                                                      //0059 : A5 00 48 6E F2 1C 16 
    }
    //07 12 00 72 00 08 4F F2 1C 2A 16 0F 00 08 4F F2 1C 17 0F 00 48 6E F2 1C 25 07 63 00 96 00 48 6E 
    //F2 1C 37 01 40 89 F2 1C 16 07 59 00 77 10 00 48 6E F2 1C 01 40 89 F2 1C 2A 16 19 10 00 48 6E F2 
    //1C 01 40 89 F2 1C 10 00 00 1B 32 01 00 00 00 08 4F F2 1C 00 B8 D1 F2 1C 16 A5 00 48 6E F2 1C 16 
    //06 19 00 04 0B 47 
  }


  function PostBeginPlay() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 58 6D F2 1C 25 
    while (i < MaterialsToTrigger.Length) {                                     //0007 : 07 47 00 96 00 58 6D F2 1C 37 01 40 89 F2 1C 16 
      if (MaterialsToTrigger[i] != None) {                                      //0017 : 07 3D 00 77 10 00 58 6D F2 1C 01 40 89 F2 1C 2A 16 
        MaterialsToTrigger[i].Reset();                                          //0028 : 19 10 00 58 6D F2 1C 01 40 89 F2 1C 06 00 00 1B 53 12 00 00 16 
      }
      i++;                                                                      //003D : A5 00 58 6D F2 1C 16 
    }
    //0F 00 58 6D F2 1C 25 07 47 00 96 00 58 6D F2 1C 37 01 40 89 F2 1C 16 07 3D 00 77 10 00 58 6D F2 
    //1C 01 40 89 F2 1C 2A 16 19 10 00 58 6D F2 1C 01 40 89 F2 1C 06 00 00 1B 53 12 00 00 16 A5 00 58 
    //6D F2 1C 16 06 07 00 04 0B 47 
  }



