//==============================================================================
//  QC_Protect
//==============================================================================

class QC_Protect extends Quest_Condition
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_ActiveTextItem,NPC_Type,Class,StringReferences)
  ;

  var (Condition) const editinline array<NPC_Type> Targets;
  var (Condition) const int Slack;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 6D 00 7A 19 00 F8 5E 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 
      if (aItem.Ordinality <= Targets.Length) {                                 //0016 : 07 5F 00 98 19 00 F8 5E 32 19 05 00 04 01 08 9F 24 11 37 01 48 60 32 19 16 
        return Targets[aItem.Ordinality].GetActiveText(aItem.SubItem);          //002F : 04 19 10 19 00 F8 5E 32 19 05 00 04 01 08 9F 24 11 01 48 60 32 19 14 00 00 1B 60 05 00 00 19 00 F8 5E 32 19 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //005C : 06 6A 00 
        return "?Target?";                                                      //005F : 04 1F 3F 54 61 72 67 65 74 3F 00 
      }
    } else {                                                                    //006A : 06 79 00 
      return Super.GetActiveText(aItem);                                        //006D : 04 1C 18 CF 2F 11 00 F8 5E 32 19 16 
    }
    //07 6D 00 7A 19 00 F8 5E 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 07 5F 00 98 19 00 F8 5E 32 19 
    //05 00 04 01 08 9F 24 11 37 01 48 60 32 19 16 04 19 10 19 00 F8 5E 32 19 05 00 04 01 08 9F 24 11 
    //01 48 60 32 19 14 00 00 1B 60 05 00 00 19 00 F8 5E 32 19 05 00 04 01 20 9D 18 11 16 06 6A 00 04 
    //1F 3F 54 61 72 67 65 74 3F 00 06 79 00 04 1C 18 CF 2F 11 00 F8 5E 32 19 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QC_ProtectText.Text;                 //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 B6 1B 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 B6 1B 11 04 0B 47 
  }



