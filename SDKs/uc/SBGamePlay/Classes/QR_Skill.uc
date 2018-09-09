//==============================================================================
//  QR_Skill
//==============================================================================

class QR_Skill extends Quest_Reward
    native
    collapsecategories
    editinlinenew
    dependsOn(FSkill_Type)
  ;

  var (reward) export editinline FSkill_Type learnedSkill;


  function string GetText() {
    if (learnedSkill != None) {                                                 //0000 : 07 1E 00 77 01 A8 55 33 19 2A 16 
      return learnedSkill.GetName();                                            //000B : 04 19 01 A8 55 33 19 06 00 00 1C 68 A6 20 11 16 
    } else {                                                                    //001B : 06 2B 00 
      return "<No skill>";                                                      //001E : 04 1F 3C 4E 6F 20 73 6B 69 6C 6C 3E 00 
    }
    //07 1E 00 77 01 A8 55 33 19 2A 16 04 19 01 A8 55 33 19 06 00 00 1C 68 A6 20 11 16 06 2B 00 04 1F 
    //3C 4E 6F 20 73 6B 69 6C 6C 3E 00 04 0B 47 
  }



