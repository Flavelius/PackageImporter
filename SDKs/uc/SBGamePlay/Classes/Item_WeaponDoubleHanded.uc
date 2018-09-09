//==============================================================================
//  Item_WeaponDoubleHanded
//==============================================================================

class Item_WeaponDoubleHanded extends Item_Type
    native
    dependsOn()
  ;


  event byte GetWeaponType() {
    return 3;                                                                   //0000 : 04 24 03 
    //04 24 03 04 0B 47 
  }



