//==============================================================================
//  QT_UseAt
//==============================================================================

class QT_UseAt extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(Item_Type,Class,StringReferences,Quest_Trigger)
  ;

  var (Use) const export editinline Item_Type Item;
  var (Use) name UseLocationTag;
  var (Use) LocalizedString LocationDescription;
  var (Use) const int Amount;
  var (Use) byte Option;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 24 00 7A 19 00 B0 7C 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 
      return LocationDescription.Text;                                          //0016 : 04 36 58 C6 6B 0F 01 38 7E 32 19 
    } else {                                                                    //0021 : 06 A5 00 
      if (aItem.Tag == "O") {                                                   //0024 : 07 74 00 7A 19 00 B0 7C 32 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 
        if (Item != None) {                                                     //003A : 07 66 00 77 01 B0 7E 32 19 2A 16 
          return Item.GetActiveText(aItem.SubItem);                             //0045 : 04 19 01 B0 7E 32 19 14 00 00 1B 60 05 00 00 19 00 B0 7C 32 19 05 00 04 01 20 9D 18 11 16 
        } else {                                                                //0063 : 06 71 00 
          return "?Object?";                                                    //0066 : 04 1F 3F 4F 62 6A 65 63 74 3F 00 
        }
      } else {                                                                  //0071 : 06 A5 00 
        if (aItem.Tag == "Q") {                                                 //0074 : 07 99 00 7A 19 00 B0 7C 32 19 05 00 00 01 08 9B 18 11 1F 51 00 16 
          return "" @ string(Amount);                                           //008A : 04 A8 1F 00 39 53 01 28 7F 32 19 16 
        } else {                                                                //0096 : 06 A5 00 
          return Super.GetActiveText(aItem);                                    //0099 : 04 1C 18 CF 2F 11 00 B0 7C 32 19 16 
        }
      }
    }
    //07 24 00 7A 19 00 B0 7C 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 04 36 58 C6 6B 0F 01 38 7E 32 
    //19 06 A5 00 07 74 00 7A 19 00 B0 7C 32 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 07 66 00 77 01 B0 
    //7E 32 19 2A 16 04 19 01 B0 7E 32 19 14 00 00 1B 60 05 00 00 19 00 B0 7C 32 19 05 00 04 01 20 9D 
    //18 11 16 06 71 00 04 1F 3F 4F 62 6A 65 63 74 3F 00 06 A5 00 07 99 00 7A 19 00 B0 7C 32 19 05 00 
    //00 01 08 9B 18 11 1F 51 00 16 04 A8 1F 00 39 53 01 28 7F 32 19 16 06 A5 00 04 1C 18 CF 2F 11 00 
    //B0 7C 32 19 16 04 0B 47 
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    if (Amount > 1) {                                                           //0000 : 07 22 00 97 01 28 7F 32 19 26 16 
    }
    //07 22 00 97 01 28 7F 32 19 26 16 0E 61 43 00 C8 80 32 19 70 39 53 00 A0 81 32 19 1F 2F 25 51 00 
    //16 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_UseAtText.Text;                   //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 2D 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 2D 1C 11 04 0B 47 
  }


  event RadialMenuCollect(Game_Pawn aPlayerPawn,Object aObject,byte aMainOption,out array<byte> aSubOptions) {
    local Quest_Trigger Area;
    if (aObject == None) {                                                      //0000 : 07 50 00 72 00 A0 84 32 19 2A 16 
      foreach aPlayerPawn.TouchingActors(Class'Quest_Trigger',Area) {           //000B : 2F 19 00 88 83 32 19 0D 00 00 61 33 20 50 50 8D 01 00 50 C5 31 0F 16 4F 00 
        if (Area.Tag == UseLocationTag) {                                       //0024 : 07 4E 00 FE 19 00 50 C5 31 0F 05 00 04 01 C0 9E 6C 0F 01 C8 C5 31 0F 16 
          aSubOptions[aSubOptions.Length] = Option;                             //003C : 0F 10 37 00 40 C6 31 0F 00 40 C6 31 0F 01 B8 C6 31 0F 
        }
      }
    }
    //07 50 00 72 00 A0 84 32 19 2A 16 2F 19 00 88 83 32 19 0D 00 00 61 33 20 50 50 8D 01 00 50 C5 31 
    //0F 16 4F 00 07 4E 00 FE 19 00 50 C5 31 0F 05 00 04 01 C0 9E 6C 0F 01 C8 C5 31 0F 16 0F 10 37 00 
    //40 C6 31 0F 00 40 C6 31 0F 01 B8 C6 31 0F 31 30 04 0B 47 
  }



