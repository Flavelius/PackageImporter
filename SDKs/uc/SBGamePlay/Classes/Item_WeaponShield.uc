//==============================================================================
//  Item_WeaponShield
//==============================================================================

class Item_WeaponShield extends Item_Type
    native
    dependsOn()
  ;


  event byte GetWeaponType() {
    return 7;                                                                   //0000 : 04 24 07 
    //04 24 07 04 0B 47 
  }



