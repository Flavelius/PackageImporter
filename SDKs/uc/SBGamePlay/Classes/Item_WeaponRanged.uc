//==============================================================================
//  Item_WeaponRanged
//==============================================================================

class Item_WeaponRanged extends Item_Type
    native
    dependsOn()
  ;


  event byte GetWeaponType() {
    return 5;                                                                   //0000 : 04 24 05 
    //04 24 05 04 0B 47 
  }



