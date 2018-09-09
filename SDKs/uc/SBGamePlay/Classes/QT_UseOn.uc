//==============================================================================
//  QT_UseOn
//==============================================================================

class QT_UseOn extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(NPC_Type,Item_Type,Class,StringReferences)
  ;

  var (Use) const export editinline Item_Type Item;
  var (Use) const export editinline NPC_Type Target;
  var (Use) const int Amount;
  var (Use) byte Option;


  protected final native function NPC_Type GetTarget();


  event string GetActiveText(Game_ActiveTextItem aItem) {
    local export editinline NPC_Type t;
    if (aItem.Tag == "T") {                                                     //0000 : 07 5C 00 7A 19 00 70 6F 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 
      t = GetTarget();                                                          //0016 : 0F 00 48 71 32 19 1C B8 6C 32 19 16 
      if (t != None) {                                                          //0022 : 07 4E 00 77 00 48 71 32 19 2A 16 
        return t.GetActiveText(aItem.SubItem);                                  //002D : 04 19 00 48 71 32 19 14 00 00 1B 60 05 00 00 19 00 70 6F 32 19 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //004B : 06 59 00 
        return "?Target?";                                                      //004E : 04 1F 3F 54 61 72 67 65 74 3F 00 
      }
    } else {                                                                    //0059 : 06 DD 00 
      if (aItem.Tag == "O") {                                                   //005C : 07 AC 00 7A 19 00 70 6F 32 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 
        if (Item != None) {                                                     //0072 : 07 9E 00 77 01 C0 71 32 19 2A 16 
          return Item.GetActiveText(aItem.SubItem);                             //007D : 04 19 01 C0 71 32 19 14 00 00 1B 60 05 00 00 19 00 70 6F 32 19 05 00 04 01 20 9D 18 11 16 
        } else {                                                                //009B : 06 A9 00 
          return "?Object?";                                                    //009E : 04 1F 3F 4F 62 6A 65 63 74 3F 00 
        }
      } else {                                                                  //00A9 : 06 DD 00 
        if (aItem.Tag == "Q") {                                                 //00AC : 07 D1 00 7A 19 00 70 6F 32 19 05 00 00 01 08 9B 18 11 1F 51 00 16 
          return "" @ string(Amount);                                           //00C2 : 04 A8 1F 00 39 53 01 38 72 32 19 16 
        } else {                                                                //00CE : 06 DD 00 
          return Super.GetActiveText(aItem);                                    //00D1 : 04 1C 18 CF 2F 11 00 70 6F 32 19 16 
        }
      }
    }
    //07 5C 00 7A 19 00 70 6F 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 0F 00 48 71 32 19 1C B8 6C 32 
    //19 16 07 4E 00 77 00 48 71 32 19 2A 16 04 19 00 48 71 32 19 14 00 00 1B 60 05 00 00 19 00 70 6F 
    //32 19 05 00 04 01 20 9D 18 11 16 06 59 00 04 1F 3F 54 61 72 67 65 74 3F 00 06 DD 00 07 AC 00 7A 
    //19 00 70 6F 32 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 07 9E 00 77 01 C0 71 32 19 2A 16 04 19 01 
    //C0 71 32 19 14 00 00 1B 60 05 00 00 19 00 70 6F 32 19 05 00 04 01 20 9D 18 11 16 06 A9 00 04 1F 
    //3F 4F 62 6A 65 63 74 3F 00 06 DD 00 07 D1 00 7A 19 00 70 6F 32 19 05 00 00 01 08 9B 18 11 1F 51 
    //00 16 04 A8 1F 00 39 53 01 38 72 32 19 16 06 DD 00 04 1C 18 CF 2F 11 00 70 6F 32 19 16 04 0B 47 
    //
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    if (Amount > 1) {                                                           //0000 : 07 22 00 97 01 38 72 32 19 26 16 
    }
    //07 22 00 97 01 38 72 32 19 26 16 0E 61 43 00 D8 73 32 19 70 39 53 00 B0 74 32 19 1F 2F 25 51 00 
    //16 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_UseOnText.Text;                   //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 2D 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 2D 1C 11 04 0B 47 
  }


  event RadialMenuCollect(Game_Pawn aPlayerPawn,Object aObject,byte aMainOption,out array<byte> aSubOptions) {
    if (aObject != None && aObject == Target) {                                 //0000 : 07 2E 00 82 77 00 10 77 32 19 2A 16 18 0D 00 72 00 10 77 32 19 01 88 77 32 19 16 16 
      aSubOptions[aSubOptions.Length] = Option;                                 //001C : 0F 10 37 00 00 78 32 19 00 00 78 32 19 01 78 78 32 19 
    }
    //07 2E 00 82 77 00 10 77 32 19 2A 16 18 0D 00 72 00 10 77 32 19 01 88 77 32 19 16 16 0F 10 37 00 
    //00 78 32 19 00 00 78 32 19 01 78 78 32 19 04 0B 47 
  }



