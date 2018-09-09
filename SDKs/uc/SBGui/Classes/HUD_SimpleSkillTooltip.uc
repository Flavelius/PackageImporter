//==============================================================================
//  HUD_SimpleSkillTooltip
//==============================================================================

class HUD_SimpleSkillTooltip extends GUI_ObjectTooltipPage
    dependsOn(FSkill_Type)
    Transient
    Config(User)
  ;

  var export editinline FSkill_Type mSkill;


  function bool UpdateTooltipInfo() {
    if (mSkill != None) {                                                       //0000 : 07 44 00 77 01 40 DE 2C 26 2A 16 
      AddHeader(mSkill.GetName(),"","","");                                     //000B : 1B 3C 98 00 00 19 01 40 DE 2C 26 06 00 00 1C 68 A6 20 11 16 1F 00 1F 00 1F 00 16 
      AddDescription(mSkill.Description.Text);                                  //0026 : 1B 48 98 00 00 36 58 C6 6B 0F 19 01 40 DE 2C 26 05 00 0C 01 E0 B3 20 11 16 
      return True;                                                              //003F : 04 27 
    } else {                                                                    //0041 : 06 46 00 
      return False;                                                             //0044 : 04 28 
    }
    //07 44 00 77 01 40 DE 2C 26 2A 16 1B 3C 98 00 00 19 01 40 DE 2C 26 06 00 00 1C 68 A6 20 11 16 1F 
    //00 1F 00 1F 00 16 1B 48 98 00 00 36 58 C6 6B 0F 19 01 40 DE 2C 26 05 00 0C 01 E0 B3 20 11 16 04 
    //27 06 46 00 04 28 04 0B 47 
  }


  function bool UpdateTooltipObject(Object aObject) {
    mSkill = FSkill_Type(aObject);                                              //0000 : 0F 01 40 DE 2C 26 2E 40 36 5D 01 00 88 EB 33 26 
    return Super.UpdateTooltipObject(aObject);                                  //0010 : 04 1C C8 0B A6 19 00 88 EB 33 26 16 
    //0F 01 40 DE 2C 26 2E 40 36 5D 01 00 88 EB 33 26 04 1C C8 0B A6 19 00 88 EB 33 26 16 04 0B 47 
  }



