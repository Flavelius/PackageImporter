//==============================================================================
//  QT_Use
//==============================================================================

class QT_Use extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(Item_Type,Class,StringReferences)
  ;

  var (Use) const export editinline Item_Type Item;
  var (Use) byte Option;
  var (Use) const int Amount;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "O") {                                                     //0000 : 07 50 00 7A 19 00 68 9A 32 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 
      if (Item != None) {                                                       //0016 : 07 42 00 77 01 E0 9A 32 19 2A 16 
        return Item.GetActiveText(aItem.SubItem);                               //0021 : 04 19 01 E0 9A 32 19 14 00 00 1B 60 05 00 00 19 00 68 9A 32 19 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //003F : 06 4D 00 
        return "?Object?";                                                      //0042 : 04 1F 3F 4F 62 6A 65 63 74 3F 00 
      }
    } else {                                                                    //004D : 06 81 00 
      if (aItem.Tag == "Q") {                                                   //0050 : 07 75 00 7A 19 00 68 9A 32 19 05 00 00 01 08 9B 18 11 1F 51 00 16 
        return "" @ string(Amount);                                             //0066 : 04 A8 1F 00 39 53 01 58 9B 32 19 16 
      } else {                                                                  //0072 : 06 81 00 
        return Super.GetActiveText(aItem);                                      //0075 : 04 1C 18 CF 2F 11 00 68 9A 32 19 16 
      }
    }
    //07 50 00 7A 19 00 68 9A 32 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 07 42 00 77 01 E0 9A 32 19 2A 
    //16 04 19 01 E0 9A 32 19 14 00 00 1B 60 05 00 00 19 00 68 9A 32 19 05 00 04 01 20 9D 18 11 16 06 
    //4D 00 04 1F 3F 4F 62 6A 65 63 74 3F 00 06 81 00 07 75 00 7A 19 00 68 9A 32 19 05 00 00 01 08 9B 
    //18 11 1F 51 00 16 04 A8 1F 00 39 53 01 58 9B 32 19 16 06 81 00 04 1C 18 CF 2F 11 00 68 9A 32 19 
    //16 04 0B 47 
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    if (Amount > 1) {                                                           //0000 : 07 22 00 97 01 58 9B 32 19 26 16 
    }
    //07 22 00 97 01 58 9B 32 19 26 16 0E 61 43 00 F8 9C 32 19 70 39 53 00 D0 9D 32 19 1F 2F 25 51 00 
    //16 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_UseText.Text;                     //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 2D 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 2D 1C 11 04 0B 47 
  }


  event RadialMenuCollect(Game_Pawn aPlayerPawn,Object aObject,byte aMainOption,out array<byte> aSubOptions) {
    if (aObject == None) {                                                      //0000 : 07 1D 00 72 00 88 A0 32 19 2A 16 
      aSubOptions[aSubOptions.Length] = Option;                                 //000B : 0F 10 37 00 00 A1 32 19 00 00 A1 32 19 01 78 A1 32 19 
    }
    //07 1D 00 72 00 88 A0 32 19 2A 16 0F 10 37 00 00 A1 32 19 00 00 A1 32 19 01 78 A1 32 19 04 0B 47 
    //
  }



