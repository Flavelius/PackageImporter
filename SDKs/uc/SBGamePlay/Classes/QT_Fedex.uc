//==============================================================================
//  QT_Fedex
//==============================================================================

class QT_Fedex extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(NPC_Type,Content_Inventory,Item_Type,Class,StringReferences)
  ;

  var (Fedex) const export editinline NPC_Type Address;
  var (Fedex) const editconst Content_Inventory Cargo;
  var (Fedex) const int Price;
  var (Talk) const export editconst editinline Conversation_Topic ThankYou;


  protected final native function NPC_Type GetTarget();


  event string GetActiveText(Game_ActiveTextItem aItem) {
    local export editinline NPC_Type A;
    if (aItem.Tag == "T") {                                                     //0000 : 07 7F 00 7A 19 00 C8 1A FB 13 05 00 00 01 08 9B 18 11 1F 54 00 16 
      A = Address;                                                              //0016 : 0F 00 E0 1C FB 13 01 58 1D FB 13 
      if (A == None) {                                                          //0021 : 07 45 00 72 00 E0 1C FB 13 2A 16 
        A = Quest_Type(Outer).Finisher;                                         //002C : 0F 00 E0 1C FB 13 19 2E F0 9D 5C 01 01 00 E4 6B 0F 05 00 04 01 E8 4E 2E 11 
      }
      if (A != None) {                                                          //0045 : 07 71 00 77 00 E0 1C FB 13 2A 16 
        return A.GetActiveText(aItem.SubItem);                                  //0050 : 04 19 00 E0 1C FB 13 14 00 00 1B 60 05 00 00 19 00 C8 1A FB 13 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //006E : 06 7C 00 
        return "?Target?";                                                      //0071 : 04 1F 3F 54 61 72 67 65 74 3F 00 
      }
    } else {                                                                    //007C : 06 0A 01 
      if (aItem.Tag == "O") {                                                   //007F : 07 FE 00 7A 19 00 C8 1A FB 13 05 00 00 01 08 9B 18 11 1F 4F 00 16 
        if (Cargo.Count() >= aItem.Ordinality) {                                //0095 : 07 F0 00 99 19 01 D0 1D FB 13 06 00 04 1C 18 8A 31 11 16 19 00 C8 1A FB 13 05 00 04 01 08 9F 24 11 16 
          return Cargo.GetItem(aItem.Ordinality).GetActiveText(aItem.SubItem);  //00B7 : 04 19 19 01 D0 1D FB 13 14 00 04 1C C0 81 31 11 19 00 C8 1A FB 13 05 00 04 01 08 9F 24 11 16 14 00 00 1B 60 05 00 00 19 00 C8 1A FB 13 05 00 04 01 20 9D 18 11 16 
        } else {                                                                //00ED : 06 FB 00 
          return "?Object?";                                                    //00F0 : 04 1F 3F 4F 62 6A 65 63 74 3F 00 
        }
      } else {                                                                  //00FB : 06 0A 01 
        return Super.GetActiveText(aItem);                                      //00FE : 04 1C 18 CF 2F 11 00 C8 1A FB 13 16 
      }
    }
    //07 7F 00 7A 19 00 C8 1A FB 13 05 00 00 01 08 9B 18 11 1F 54 00 16 0F 00 E0 1C FB 13 01 58 1D FB 
    //13 07 45 00 72 00 E0 1C FB 13 2A 16 0F 00 E0 1C FB 13 19 2E F0 9D 5C 01 01 00 E4 6B 0F 05 00 04 
    //01 E8 4E 2E 11 07 71 00 77 00 E0 1C FB 13 2A 16 04 19 00 E0 1C FB 13 14 00 00 1B 60 05 00 00 19 
    //00 C8 1A FB 13 05 00 04 01 20 9D 18 11 16 06 7C 00 04 1F 3F 54 61 72 67 65 74 3F 00 06 0A 01 07 
    //FE 00 7A 19 00 C8 1A FB 13 05 00 00 01 08 9B 18 11 1F 4F 00 16 07 F0 00 99 19 01 D0 1D FB 13 06 
    //00 04 1C 18 8A 31 11 16 19 00 C8 1A FB 13 05 00 04 01 08 9F 24 11 16 04 19 19 01 D0 1D FB 13 14 
    //00 04 1C C0 81 31 11 19 00 C8 1A FB 13 05 00 04 01 08 9F 24 11 16 14 00 00 1B 60 05 00 00 19 00 
    //C8 1A FB 13 05 00 04 01 20 9D 18 11 16 06 FB 00 04 1F 3F 4F 62 6A 65 63 74 3F 00 06 0A 01 04 1C 
    //18 CF 2F 11 00 C8 1A FB 13 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_FedexText.Text;                   //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 1C 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 1C 1C 11 04 0B 47 
  }



