//==============================================================================
//  HUD_AvatarDuffShareTooltip
//==============================================================================

class HUD_AvatarDuffShareTooltip extends GUI_ObjectTooltipPage
    dependsOn(SBGuiStrings,FSkill_EffectClass_DuffShare)
    Transient
    Config(User)
  ;

  var export editinline FSkill_EffectClass_DuffShare mDuffShare;


  function bool UpdateTooltipInfo() {
    if (mDuffShare != None) {                                                   //0000 : 07 43 00 77 01 18 51 07 1B 2A 16 
      AddHeader(Class'SBGuiStrings'.default.DuffShare.Text,"","","");           //000B : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 74 99 19 1F 00 1F 00 1F 00 16 
      AddDescription(mDuffShare.Description);                                   //002A : 1B 48 98 00 00 19 01 18 51 07 1B 05 00 00 01 B0 27 35 11 16 
      return True;                                                              //003E : 04 27 
    } else {                                                                    //0040 : 06 45 00 
      return False;                                                             //0043 : 04 28 
    }
    //07 43 00 77 01 18 51 07 1B 2A 16 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 
    //74 99 19 1F 00 1F 00 1F 00 16 1B 48 98 00 00 19 01 18 51 07 1B 05 00 00 01 B0 27 35 11 16 04 27 
    //06 45 00 04 28 04 0B 47 
  }


  function bool UpdateTooltipObject(Object aObject) {
    mDuffShare = FSkill_EffectClass_DuffShare(aObject);                         //0000 : 0F 01 18 51 07 1B 2E C0 51 5E 01 00 98 6E 33 26 
    return Super.UpdateTooltipObject(aObject);                                  //0010 : 04 1C C8 0B A6 19 00 98 6E 33 26 16 
    //0F 01 18 51 07 1B 2E C0 51 5E 01 00 98 6E 33 26 04 1C C8 0B A6 19 00 98 6E 33 26 16 04 0B 47 
  }



