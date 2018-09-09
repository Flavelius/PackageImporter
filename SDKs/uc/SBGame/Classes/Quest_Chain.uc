//==============================================================================
//  Quest_Chain
//==============================================================================

class Quest_Chain extends Content_Type
    native
    dependsOn()
  ;

  var (Chain) LocalizedString Name;
  var (Chain) byte QuestArea;
  var (Chain) array<Quest_Type> Quests;


  function bool ContainsQuest(export editinline Quest_Type aQuest) {
    local int i;
    if (aQuest == None) {                                                       //0000 : 07 0D 00 72 00 78 BC 38 11 2A 16 
      return False;                                                             //000B : 04 28 
    }
    i = 0;                                                                      //000D : 0F 00 F0 BC 38 11 25 
    while (i < Quests.Length) {                                                 //0014 : 07 45 00 96 00 F0 BC 38 11 37 01 68 BD 38 11 16 
      if (Quests[i] == aQuest) {                                                //0024 : 07 3B 00 72 10 00 F0 BC 38 11 01 68 BD 38 11 00 78 BC 38 11 16 
        return True;                                                            //0039 : 04 27 
      }
      i++;                                                                      //003B : A5 00 F0 BC 38 11 16 
    }
    return False;                                                               //0045 : 04 28 
    //07 0D 00 72 00 78 BC 38 11 2A 16 04 28 0F 00 F0 BC 38 11 25 07 45 00 96 00 F0 BC 38 11 37 01 68 
    //BD 38 11 16 07 3B 00 72 10 00 F0 BC 38 11 01 68 BD 38 11 00 78 BC 38 11 16 04 27 A5 00 F0 BC 38 
    //11 16 06 14 00 04 28 04 0B 47 
  }



