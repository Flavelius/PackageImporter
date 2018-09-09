//==============================================================================
//  QT_Deliver
//==============================================================================

class QT_Deliver extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(NPC_Type,Item_Type,Content_Inventory,Class,StringReferences)
  ;

  var (Deliver) const export editinline NPC_Type Address;
  var (Deliver) const export editinline Item_Type Cargo;
  var (Deliver) const int Amount;
  var (Deliver) const export editconst editinline Conversation_Topic DeliveryConversation;


  protected final native function NPC_Type GetTarget();


  event string GetActiveText(Game_ActiveTextItem aItem) {
    local Game_ActiveTextItem pluralityItem;
    local export editinline NPC_Type t;
    if (aItem.Tag == "T") {                                                     //0000 : 07 5C 00 7A 19 00 F8 0D FA 13 05 00 00 01 08 9B 18 11 1F 54 00 16 
      t = GetTarget();                                                          //0016 : 0F 00 90 10 FA 13 1C 40 0B FA 13 16 
      if (t != None) {                                                          //0022 : 07 4E 00 77 00 90 10 FA 13 2A 16 
        return t.GetActiveText(aItem.SubItem);                                  //002D : 04 19 00 90 10 FA 13 14 00 00 1B 60 05 00 00 19 00 F8 0D FA 13 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //004B : 06 59 00 
        return "?Target?";                                                      //004E : 04 1F 3F 54 61 72 67 65 74 3F 00 
      }
    } else {                                                                    //0059 : 06 68 01 
      if (aItem.Tag == "Q") {                                                   //005C : 07 81 00 7A 19 00 F8 0D FA 13 05 00 00 01 08 9B 18 11 1F 51 00 16 
        return "" @ string(Amount);                                             //0072 : 04 A8 1F 00 39 53 01 08 11 FA 13 16 
      } else {                                                                  //007E : 06 68 01 
        if (aItem.Tag == "O") {                                                 //0081 : 07 D1 00 7A 19 00 F8 0D FA 13 05 00 00 01 08 9B 18 11 1F 4F 00 16 
          if (Cargo != None) {                                                  //0097 : 07 C3 00 77 01 80 11 FA 13 2A 16 
            return Cargo.GetActiveText(aItem.SubItem);                          //00A2 : 04 19 01 80 11 FA 13 14 00 00 1B 60 05 00 00 19 00 F8 0D FA 13 05 00 04 01 20 9D 18 11 16 
          } else {                                                              //00C0 : 06 CE 00 
            return "?Object?";                                                  //00C3 : 04 1F 3F 4F 62 6A 65 63 74 3F 00 
          }
        } else {                                                                //00CE : 06 68 01 
          if (aItem.Tag == "OS") {                                              //00D1 : 07 5C 01 7A 19 00 F8 0D FA 13 05 00 00 01 08 9B 18 11 1F 4F 53 00 16 
            if (Cargo != None) {                                                //00E8 : 07 4E 01 77 01 80 11 FA 13 2A 16 
              pluralityItem.Tag = "Q";                                          //00F3 : 0F 19 00 F8 11 FA 13 05 00 00 01 08 9B 18 11 1F 51 00 
              pluralityItem.Ordinality = Amount;                                //0105 : 0F 19 00 F8 11 FA 13 05 00 04 01 08 9F 24 11 01 08 11 FA 13 
              pluralityItem.SubItem = aItem.SubItem;                            //0119 : 0F 19 00 F8 11 FA 13 05 00 04 01 20 9D 18 11 19 00 F8 0D FA 13 05 00 04 01 20 9D 18 11 
              return Cargo.GetActiveText(pluralityItem);                        //0136 : 04 19 01 80 11 FA 13 0B 00 00 1B 60 05 00 00 00 F8 11 FA 13 16 
            } else {                                                            //014B : 06 59 01 
              return "?Object?";                                                //014E : 04 1F 3F 4F 62 6A 65 63 74 3F 00 
            }
          } else {                                                              //0159 : 06 68 01 
            return Super.GetActiveText(aItem);                                  //015C : 04 1C 18 CF 2F 11 00 F8 0D FA 13 16 
          }
        }
      }
    }
    //07 5C 00 7A 19 00 F8 0D FA 13 05 00 00 01 08 9B 18 11 1F 54 00 16 0F 00 90 10 FA 13 1C 40 0B FA 
    //13 16 07 4E 00 77 00 90 10 FA 13 2A 16 04 19 00 90 10 FA 13 14 00 00 1B 60 05 00 00 19 00 F8 0D 
    //FA 13 05 00 04 01 20 9D 18 11 16 06 59 00 04 1F 3F 54 61 72 67 65 74 3F 00 06 68 01 07 81 00 7A 
    //19 00 F8 0D FA 13 05 00 00 01 08 9B 18 11 1F 51 00 16 04 A8 1F 00 39 53 01 08 11 FA 13 16 06 68 
    //01 07 D1 00 7A 19 00 F8 0D FA 13 05 00 00 01 08 9B 18 11 1F 4F 00 16 07 C3 00 77 01 80 11 FA 13 
    //2A 16 04 19 01 80 11 FA 13 14 00 00 1B 60 05 00 00 19 00 F8 0D FA 13 05 00 04 01 20 9D 18 11 16 
    //06 CE 00 04 1F 3F 4F 62 6A 65 63 74 3F 00 06 68 01 07 5C 01 7A 19 00 F8 0D FA 13 05 00 00 01 08 
    //9B 18 11 1F 4F 53 00 16 07 4E 01 77 01 80 11 FA 13 2A 16 0F 19 00 F8 11 FA 13 05 00 00 01 08 9B 
    //18 11 1F 51 00 0F 19 00 F8 11 FA 13 05 00 04 01 08 9F 24 11 01 08 11 FA 13 0F 19 00 F8 11 FA 13 
    //05 00 04 01 20 9D 18 11 19 00 F8 0D FA 13 05 00 04 01 20 9D 18 11 04 19 01 80 11 FA 13 0B 00 00 
    //1B 60 05 00 00 00 F8 11 FA 13 16 06 59 01 04 1F 3F 4F 62 6A 65 63 74 3F 00 06 68 01 04 1C 18 CF 
    //2F 11 00 F8 0D FA 13 16 04 0B 47 
  }


  function bool sv_OnComplete(Game_Pawn aPawn,optional Game_Pawn aTargetPawn) {
    local Content_Inventory tempInventory;
    if (Super.sv_OnComplete(aPawn,aTargetPawn)) {                               //0000 : 07 54 00 1C A8 D5 2F 11 00 98 13 FA 13 00 B8 14 FA 13 16 
      tempInventory = new Class'Content_Inventory';                             //0013 : 0F 00 30 15 FA 13 11 0B 0B 0B 20 C0 67 5B 01 
      tempInventory.AddItem(Cargo,Amount,0,0);                                  //0022 : 19 00 30 15 FA 13 14 00 04 1B 52 10 00 00 01 80 11 FA 13 01 08 11 FA 13 24 00 24 00 16 
      if (RemoveItems(aPawn,tempInventory)) {                                   //003F : 07 54 00 1B FE 0F 00 00 00 98 13 FA 13 00 30 15 FA 13 16 
        return True;                                                            //0052 : 04 27 
      }
    }
    return False;                                                               //0054 : 04 28 
    //07 54 00 1C A8 D5 2F 11 00 98 13 FA 13 00 B8 14 FA 13 16 0F 00 30 15 FA 13 11 0B 0B 0B 20 C0 67 
    //5B 01 19 00 30 15 FA 13 14 00 04 1B 52 10 00 00 01 80 11 FA 13 01 08 11 FA 13 24 00 24 00 16 07 
    //54 00 1B FE 0F 00 00 00 98 13 FA 13 00 30 15 FA 13 16 04 27 04 28 04 0B 47 
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    if (aProgress > Amount) {                                                   //0000 : 07 1A 00 97 00 C8 17 FA 13 01 08 11 FA 13 16 
      aProgress = Amount;                                                       //000F : 0F 00 C8 17 FA 13 01 08 11 FA 13 
    }
    if (Amount > 1) {                                                           //001A : 07 3C 00 97 01 08 11 FA 13 26 16 
    }
    //07 1A 00 97 00 C8 17 FA 13 01 08 11 FA 13 16 0F 00 C8 17 FA 13 01 08 11 FA 13 07 3C 00 97 01 08 
    //11 FA 13 26 16 0E 61 43 00 D0 16 FA 13 70 39 53 00 C8 17 FA 13 1F 2F 25 51 00 16 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_DeliverText.Text;                 //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 1B 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 90 1B 1C 11 04 0B 47 
  }



