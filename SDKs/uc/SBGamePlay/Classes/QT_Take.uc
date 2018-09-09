//==============================================================================
//  QT_Take
//==============================================================================

class QT_Take extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(Content_Inventory,Class,StringReferences,Actor)
  ;

  var (Take) const editconst Content_Inventory Cargo;
  var (Take) name SourceTag;
  var (Take) LocalizedString SourceDescription;
  var (Take) byte Option;
  var (Take) const int Amount;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 24 00 7A 19 00 68 A4 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 
      return SourceDescription.Text;                                            //0016 : 04 36 58 C6 6B 0F 01 D0 A5 32 19 
    } else {                                                                    //0021 : 06 8C 00 
      if (aItem.Tag == "O") {                                                   //0024 : 07 5B 00 7A 19 00 68 A4 32 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 
        return Cargo.GetActiveText(aItem.SubItem);                              //003A : 04 19 01 48 A6 32 19 14 00 00 1B 60 05 00 00 19 00 68 A4 32 19 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //0058 : 06 8C 00 
        if (aItem.Tag == "Q") {                                                 //005B : 07 80 00 7A 19 00 68 A4 32 19 05 00 00 01 08 9B 18 11 1F 51 00 16 
          return "" @ string(Amount);                                           //0071 : 04 A8 1F 00 39 53 01 C0 A6 32 19 16 
        } else {                                                                //007D : 06 8C 00 
          return Super.GetActiveText(aItem);                                    //0080 : 04 1C 18 CF 2F 11 00 68 A4 32 19 16 
        }
      }
    }
    //07 24 00 7A 19 00 68 A4 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 04 36 58 C6 6B 0F 01 D0 A5 32 
    //19 06 8C 00 07 5B 00 7A 19 00 68 A4 32 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 04 19 01 48 A6 32 
    //19 14 00 00 1B 60 05 00 00 19 00 68 A4 32 19 05 00 04 01 20 9D 18 11 16 06 8C 00 07 80 00 7A 19 
    //00 68 A4 32 19 05 00 00 01 08 9B 18 11 1F 51 00 16 04 A8 1F 00 39 53 01 C0 A6 32 19 16 06 8C 00 
    //04 1C 18 CF 2F 11 00 68 A4 32 19 16 04 0B 47 
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    if (Amount > 1) {                                                           //0000 : 07 22 00 97 01 C0 A6 32 19 26 16 
    }
    //07 22 00 97 01 C0 A6 32 19 26 16 0E 61 43 00 60 A8 32 19 70 39 53 00 38 A9 32 19 1F 2F 25 51 00 
    //16 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_TakeText.Text;                    //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 20 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 20 1C 11 04 0B 47 
  }


  event RadialMenuCollect(Game_Pawn aPlayerPawn,Object aObject,byte aMainOption,out array<byte> aSubOptions) {
    local Actor act;
    act = Actor(aObject);                                                       //0000 : 0F 00 28 AC 32 19 2E F8 8B C1 00 00 A0 AC 32 19 
    if (act != None && act.Tag == SourceTag) {                                  //0010 : 07 47 00 82 77 00 28 AC 32 19 2A 16 18 16 00 FE 19 00 28 AC 32 19 05 00 04 01 C0 9E 6C 0F 01 18 AD 32 19 16 16 
      aSubOptions[aSubOptions.Length] = Option;                                 //0035 : 0F 10 37 00 08 00 33 19 00 08 00 33 19 01 80 00 33 19 
    }
    //0F 00 28 AC 32 19 2E F8 8B C1 00 00 A0 AC 32 19 07 47 00 82 77 00 28 AC 32 19 2A 16 18 16 00 FE 
    //19 00 28 AC 32 19 05 00 04 01 C0 9E 6C 0F 01 18 AD 32 19 16 16 0F 10 37 00 08 00 33 19 00 08 00 
    //33 19 01 80 00 33 19 04 0B 47 
  }



