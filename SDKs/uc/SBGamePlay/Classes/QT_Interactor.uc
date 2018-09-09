//==============================================================================
//  QT_Interactor
//==============================================================================

class QT_Interactor extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(Actor,Class,StringReferences)
  ;

  var (Interact) name TargetTag;
  var (Interact) byte Option;
  var (Interact) LocalizedString TargetDescription;
  var (Interact) const int Amount;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 24 00 7A 19 00 08 B1 31 0F 05 00 00 01 08 9B 18 11 1F 54 00 16 
      return TargetDescription.Text;                                            //0016 : 04 36 58 C6 6B 0F 01 40 3A 33 19 
    } else {                                                                    //0021 : 06 55 00 
      if (aItem.Tag == "Q") {                                                   //0024 : 07 49 00 7A 19 00 08 B1 31 0F 05 00 00 01 08 9B 18 11 1F 51 00 16 
        return "" @ string(Amount);                                             //003A : 04 A8 1F 00 39 53 01 B8 3A 33 19 16 
      } else {                                                                  //0046 : 06 55 00 
        return Super.GetActiveText(aItem);                                      //0049 : 04 1C 18 CF 2F 11 00 08 B1 31 0F 16 
      }
    }
    //07 24 00 7A 19 00 08 B1 31 0F 05 00 00 01 08 9B 18 11 1F 54 00 16 04 36 58 C6 6B 0F 01 40 3A 33 
    //19 06 55 00 07 49 00 7A 19 00 08 B1 31 0F 05 00 00 01 08 9B 18 11 1F 51 00 16 04 A8 1F 00 39 53 
    //01 B8 3A 33 19 16 06 55 00 04 1C 18 CF 2F 11 00 08 B1 31 0F 16 04 0B 47 
  }


  event RadialMenuCollect(Game_Pawn aPlayerPawn,Object aObject,byte aMainOption,out array<byte> aSubOptions) {
    local Actor act;
    act = Actor(aObject);                                                       //0000 : 0F 00 60 3D 33 19 2E F8 8B C1 00 00 D8 3D 33 19 
    if (act != None && act.Tag == TargetTag) {                                  //0010 : 07 47 00 82 77 00 60 3D 33 19 2A 16 18 16 00 FE 19 00 60 3D 33 19 05 00 04 01 C0 9E 6C 0F 01 50 3E 33 19 16 16 
      aSubOptions[aSubOptions.Length] = Option;                                 //0035 : 0F 10 37 00 C8 3E 33 19 00 C8 3E 33 19 01 40 3F 33 19 
    }
    //0F 00 60 3D 33 19 2E F8 8B C1 00 00 D8 3D 33 19 07 47 00 82 77 00 60 3D 33 19 2A 16 18 16 00 FE 
    //19 00 60 3D 33 19 05 00 04 01 C0 9E 6C 0F 01 50 3E 33 19 16 16 0F 10 37 00 C8 3E 33 19 00 C8 3E 
    //33 19 01 40 3F 33 19 04 0B 47 
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    if (Amount > 1) {                                                           //0000 : 07 22 00 97 01 B8 3A 33 19 26 16 
    }
    //07 22 00 97 01 B8 3A 33 19 26 16 0E 61 43 00 58 41 33 19 70 39 53 00 30 42 33 19 1F 2F 25 51 00 
    //16 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_InteractText.Text;                //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 60 1E 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 60 1E 1C 11 04 0B 47 
  }



