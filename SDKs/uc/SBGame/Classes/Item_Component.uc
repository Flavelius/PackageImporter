//==============================================================================
//  Item_Component
//==============================================================================

class Item_Component extends Object
    native
    editinlinenew
    dependsOn()
  ;


  event Item_Component ReplaceComponent() {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  function ToConsole(Console C) {
    //04 0B 47 
  }


  event bool IsNPCItem() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event Appearance_Base GetAppearance() {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  event byte GetWeaponType() {
    return 0;                                                                   //0000 : 04 24 00 
    //04 24 00 04 0B 47 
  }


  event OnSheathe(Game_Pawn aPawn) {
    //04 0B 47 
  }


  event OnDraw(Game_Pawn aPawn) {
    //04 0B 47 
  }


  event OnUnequip(Game_Pawn aPawn,Game_Item aItem) {
    //04 0B 47 
  }


  event OnEquip(Game_Pawn aPawn,Game_Item aItem) {
    //04 0B 47 
  }


  event OnUse(Game_Pawn aPawn,Game_Item aItem) {
    //04 0B 47 
  }


  event bool CanEquip(Game_Pawn aPawn,Game_Item aItem) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  event bool CanUse(Game_Pawn aPawn,Game_Item aItem) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }



