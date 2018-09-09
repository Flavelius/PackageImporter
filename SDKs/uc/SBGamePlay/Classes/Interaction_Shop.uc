//==============================================================================
//  Interaction_Shop
//==============================================================================

class Interaction_Shop extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Shop_Base)
  ;

  var (Interaction_Shop) Shop_Base Shop;
  var (Interaction_Shop) byte ShopOption;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 68 0D F9 13 00 78 0E F9 13 2D 00 F0 0E F9 13 16 
    if (!aReverse && Shop != None) {                                            //0016 : 07 4C 00 82 81 2D 00 F0 0E F9 13 16 18 09 00 77 01 F0 0C F9 13 2A 16 16 
      Shop.sv_EnterShop(Game_PlayerPawn(aInstigator),ShopOption);               //002E : 19 01 F0 0C F9 13 15 00 00 1B BC 0C 00 00 2E F0 47 5B 01 00 78 0E F9 13 01 68 0F F9 13 16 
    }
    //1C 60 AF 32 13 00 68 0D F9 13 00 78 0E F9 13 2D 00 F0 0E F9 13 16 07 4C 00 82 81 2D 00 F0 0E F9 
    //13 16 18 09 00 77 01 F0 0C F9 13 2A 16 16 19 01 F0 0C F9 13 15 00 00 1B BC 0C 00 00 2E F0 47 5B 
    //01 00 78 0E F9 13 01 68 0F F9 13 16 04 0B 47 
  }



