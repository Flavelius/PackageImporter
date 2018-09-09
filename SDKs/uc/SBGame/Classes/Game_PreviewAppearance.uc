//==============================================================================
//  Game_PreviewAppearance
//==============================================================================

class Game_PreviewAppearance extends Game_EquippedAppearance within Game_Pawn
    native
    dependsOn()
  ;

  var (null);
  var (null);


  native function RemoveItem(Game_Item aItem);


  native function ApplyItem(Game_Item aNewItem);


  native function ApplyItems(array<Game_Item> aItems);


  native function InitFromPawn(Game_Pawn aPawn);


  event bool IsValidItem(byte aTestItemType) {
    return OnCheckItemTypeValidity(aTestItemType);                              //0000 : 04 43 28 EE 33 19 B9 05 00 00 00 B0 ED 33 19 16 
    //04 43 28 EE 33 19 B9 05 00 00 00 B0 ED 33 19 16 04 0B 47 
  }


  event bool IsValidPart(export editinline Game_EquippedAppearance aAppearance,byte aPartType,int aPartValue) {
    return OnCheckPartValidity(aAppearance,aPartType,aPartValue);               //0000 : 04 43 90 F0 33 19 BA 05 00 00 00 C8 EF 33 19 00 08 F1 33 19 00 80 F1 33 19 16 
    //04 43 90 F0 33 19 BA 05 00 00 00 C8 EF 33 19 00 08 F1 33 19 00 80 F1 33 19 16 04 0B 47 
  }


  delegate bool OnCheckItemTypeValidity(byte aTestItemType) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  delegate bool OnCheckPartValidity(export editinline Game_EquippedAppearance aAppearance,byte aPartType,int aPartValue) {
    return aAppearance != None;                                                 //0000 : 04 77 00 10 F4 33 19 2A 16 
    //04 77 00 10 F4 33 19 2A 16 04 0B 47 
  }



