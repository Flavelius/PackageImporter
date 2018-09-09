//==============================================================================
//  HUD_ItemAttunedTooltip
//==============================================================================

class HUD_ItemAttunedTooltip extends HUD_ItemTooltip
    dependsOn()
    Transient
    Config(User)
  ;


  function bool UpdateTooltipInfo() {
    if (mItem != None) {                                                        //0000 : 07 9D 00 77 01 F8 22 EC 25 2A 16 
      if (ContextMenuOpen()) {                                                  //000B : 07 16 00 1B 96 98 00 00 16 
        return False;                                                           //0014 : 04 28 
      }
      AddHeader(mItem.Type.GetName(),GetLevelString(),GetAttuned(),mItem.Type.GetTypeName(),mItem.Type.GetRarityColor(),GetLevelColor());//0016 : 1B 3C 98 00 00 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 00 00 16 1B D1 98 00 00 16 1B BD 99 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 1B D0 98 00 00 16 16 
      AddDescription(mItem.Type.Description.Text);                              //0076 : 1B 48 98 00 00 36 58 C6 6B 0F 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 
      return True;                                                              //0098 : 04 27 
    } else {                                                                    //009A : 06 9F 00 
      return False;                                                             //009D : 04 28 
    }
    //07 9D 00 77 01 F8 22 EC 25 2A 16 07 16 00 1B 96 98 00 00 16 04 28 1B 3C 98 00 00 19 19 01 F8 22 
    //EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 00 00 16 1B D1 98 00 00 16 1B BD 99 00 00 16 19 
    //19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 
    //04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 1B D0 98 00 00 16 16 1B 48 98 00 00 36 58 C6 6B 0F 
    //19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 04 27 06 9F 00 04 28 04 
    //0B 47 
  }



