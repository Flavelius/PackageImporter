//==============================================================================
//  Item_WeaponOneHanded
//==============================================================================

class Item_WeaponOneHanded extends Item_Type
    native
    dependsOn()
  ;


  event byte GetWeaponType() {
    return 2;                                                                   //0000 : 04 24 02 
    //04 24 02 04 0B 47 
  }



