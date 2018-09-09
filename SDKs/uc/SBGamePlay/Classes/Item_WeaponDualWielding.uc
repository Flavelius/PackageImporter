//==============================================================================
//  Item_WeaponDualWielding
//==============================================================================

class Item_WeaponDualWielding extends Item_Type
    native
    dependsOn()
  ;


  event byte GetWeaponType() {
    return 4;                                                                   //0000 : 04 24 04 
    //04 24 04 04 0B 47 
  }



