//==============================================================================
//  QT_Kill
//==============================================================================

class QT_Kill extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(NPC_Type,Class,StringReferences)
  ;

  var (Kill) const editinline array<NPC_Type> Targets;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 6A 00 7A 19 00 68 4D 33 19 05 00 00 01 08 9B 18 11 1F 54 00 16 
      if (aItem.Ordinality <= Targets.Length) {                                 //0016 : 07 5F 00 98 19 00 68 4D 33 19 05 00 04 01 08 9F 24 11 37 01 E8 4E 33 19 16 
        return Targets[aItem.Ordinality].GetActiveText(aItem.SubItem);          //002F : 04 19 10 19 00 68 4D 33 19 05 00 04 01 08 9F 24 11 01 E8 4E 33 19 14 00 00 1B 60 05 00 00 19 00 68 4D 33 19 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //005C : 06 6A 00 
        return "?Target?";                                                      //005F : 04 1F 3F 54 61 72 67 65 74 3F 00 
      }
    }
    if (aItem.Tag == "Q") {                                                     //006A : 07 90 00 7A 19 00 68 4D 33 19 05 00 00 01 08 9B 18 11 1F 51 00 16 
      return "" @ string(Targets.Length);                                       //0080 : 04 A8 1F 00 39 53 37 01 E8 4E 33 19 16 
    } else {                                                                    //008D : 06 9C 00 
      return Super.GetActiveText(aItem);                                        //0090 : 04 1C 18 CF 2F 11 00 68 4D 33 19 16 
    }
    //07 6A 00 7A 19 00 68 4D 33 19 05 00 00 01 08 9B 18 11 1F 54 00 16 07 5F 00 98 19 00 68 4D 33 19 
    //05 00 04 01 08 9F 24 11 37 01 E8 4E 33 19 16 04 19 10 19 00 68 4D 33 19 05 00 04 01 08 9F 24 11 
    //01 E8 4E 33 19 14 00 00 1B 60 05 00 00 19 00 68 4D 33 19 05 00 04 01 20 9D 18 11 16 06 6A 00 04 
    //1F 3F 54 61 72 67 65 74 3F 00 07 90 00 7A 19 00 68 4D 33 19 05 00 00 01 08 9B 18 11 1F 51 00 16 
    //04 A8 1F 00 39 53 37 01 E8 4E 33 19 16 06 9C 00 04 1C 18 CF 2F 11 00 68 4D 33 19 16 04 0B 47 
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    local int ti;
    local int killcount;
    if (Targets.Length > 1) {                                                   //0000 : 07 60 00 97 37 01 E8 4E 33 19 26 16 
      ti = 0;                                                                   //000C : 0F 00 B0 51 33 19 25 
      while (ti < Targets.Length) {                                             //0013 : 07 49 00 96 00 B0 51 33 19 37 01 E8 4E 33 19 16 
        if ((aProgress & 1 << ti) != 0) {                                       //0023 : 07 3F 00 9B 9C 00 28 52 33 19 94 26 00 B0 51 33 19 16 16 25 16 
          ++killcount;                                                          //0038 : A3 00 A0 52 33 19 16 
        }
        ++ti;                                                                   //003F : A3 00 B0 51 33 19 16 
      }
    }
    //07 60 00 97 37 01 E8 4E 33 19 26 16 0F 00 B0 51 33 19 25 07 49 00 96 00 B0 51 33 19 37 01 E8 4E 
    //33 19 16 07 3F 00 9B 9C 00 28 52 33 19 94 26 00 B0 51 33 19 16 16 25 16 A3 00 A0 52 33 19 16 A3 
    //00 B0 51 33 19 16 06 13 00 0E 61 43 00 88 50 33 19 70 39 53 00 A0 52 33 19 1F 2F 25 51 00 16 16 
    //04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_KillText.Text;                    //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 1E 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 1E 1C 11 04 0B 47 
  }



