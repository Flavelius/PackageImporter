//==============================================================================
//  InteractiveShop
//==============================================================================

class InteractiveShop extends InteractiveLevelElement
    native
    dependsOn(Shop_Base,Game_Pawn,Game_Trading)
  ;

  var (InteractiveShop) editinline Shop_Base Shop;
  var (InteractiveShop) LocalizedString ShopSign;


  event RadialMenuSelect(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    if (aPlayerPawn != None && Shop != None
      && Shop.CanEnterShop(Game_PlayerPawn(aPlayerPawn),aSubOption)) {//0000 : 07 7B 00 82 82 77 00 A0 6F 30 0F 2A 16 18 09 00 77 01 58 7E F9 13 2A 16 16 18 1F 00 19 01 58 7E F9 13 15 00 04 1B 13 0D 00 00 2E F0 47 5B 01 00 A0 6F 30 0F 00 D0 7E F9 13 16 16 
      if (Game_Pawn(aPlayerPawn).Trading != None) {                             //003B : 07 7B 00 77 19 2E 18 38 5B 01 00 A0 6F 30 0F 05 00 04 01 C0 43 32 0F 2A 16 
        Game_Pawn(aPlayerPawn).Trading.cl_SetShop(Shop,aSubOption);             //0054 : 19 19 2E 18 38 5B 01 00 A0 6F 30 0F 05 00 04 01 C0 43 32 0F 10 00 00 1B 80 0F 00 00 01 58 7E F9 13 00 D0 7E F9 13 16 
      }
    }
    Super.RadialMenuSelect(aPlayerPawn,aMainOption,aSubOption);                 //007B : 1C 48 5A 32 13 00 A0 6F 30 0F 00 48 7F F9 13 00 D0 7E F9 13 16 
    //07 7B 00 82 82 77 00 A0 6F 30 0F 2A 16 18 09 00 77 01 58 7E F9 13 2A 16 16 18 1F 00 19 01 58 7E 
    //F9 13 15 00 04 1B 13 0D 00 00 2E F0 47 5B 01 00 A0 6F 30 0F 00 D0 7E F9 13 16 16 07 7B 00 77 19 
    //2E 18 38 5B 01 00 A0 6F 30 0F 05 00 04 01 C0 43 32 0F 2A 16 19 19 2E 18 38 5B 01 00 A0 6F 30 0F 
    //05 00 04 01 C0 43 32 0F 10 00 00 1B 80 0F 00 00 01 58 7E F9 13 00 D0 7E F9 13 16 1C 48 5A 32 13 
    //00 A0 6F 30 0F 00 48 7F F9 13 00 D0 7E F9 13 16 04 0B 47 
  }


  event string cl_GetToolTip() {
    return ShopSign.Text;                                                       //0000 : 04 36 58 C6 6B 0F 01 28 72 30 0F 
    //04 36 58 C6 6B 0F 01 28 72 30 0F 04 0B 47 
  }



