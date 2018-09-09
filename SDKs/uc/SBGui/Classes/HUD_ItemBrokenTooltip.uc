//==============================================================================
//  HUD_ItemBrokenTooltip
//==============================================================================

class HUD_ItemBrokenTooltip extends HUD_ItemTooltip
    dependsOn(IC_Broken,IC_Recipe)
    Transient
    Config(User)
  ;


  function bool UpdateTooltipInfo() {
    local export editinline IC_Broken componentBroken;
    local export editinline IC_Recipe componentRecipe;
    local string producedItemName;
    if (mItem != None) {                                                        //0000 : 07 4C 01 77 01 F8 22 EC 25 2A 16 
      if (ContextMenuOpen()) {                                                  //000B : 07 16 00 1B 96 98 00 00 16 
        return False;                                                           //0014 : 04 28 
      }
      componentBroken = IC_Broken(mItem.Type.GetComponentByClass(Class'IC_Broken'));//0016 : 0F 00 48 34 06 1B 2E B8 44 5C 01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 B8 44 5C 01 16 
      if (componentBroken != None && componentBroken.Recipe != None) {          //003E : 07 C6 00 82 77 00 48 34 06 1B 2A 16 18 12 00 77 19 00 48 34 06 1B 05 00 04 01 B0 31 22 11 2A 16 16 
        componentRecipe = IC_Recipe(componentBroken.Recipe.GetComponentByClass(Class'IC_Recipe'));//005F : 0F 00 48 23 06 1B 2E B8 2F 5C 01 19 19 00 48 34 06 1B 05 00 04 01 B0 31 22 11 0B 00 04 1C 00 31 22 11 20 B8 2F 5C 01 16 
        if (componentRecipe != None
          && componentRecipe.ProducedItem != None) {//0087 : 07 C6 00 82 77 00 48 23 06 1B 2A 16 18 12 00 77 19 00 48 23 06 1B 05 00 04 01 D8 47 2C 11 2A 16 16 
          producedItemName = componentRecipe.ProducedItem.GetTypeName();        //00A8 : 0F 00 F0 00 34 26 19 19 00 48 23 06 1B 05 00 04 01 D8 47 2C 11 06 00 00 1B 0D 1A 00 00 16 
        }
      }
      AddHeader(mItem.Type.GetName(),GetLevelString(),producedItemName,mItem.Type.GetTypeName(),mItem.Type.GetRarityColor(),GetLevelColor());//00C6 : 1B 3C 98 00 00 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 00 00 16 1B D1 98 00 00 16 00 F0 00 34 26 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 1B D0 98 00 00 16 16 
      AddDescription(mItem.Type.Description.Text);                              //0125 : 1B 48 98 00 00 36 58 C6 6B 0F 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 
      return True;                                                              //0147 : 04 27 
    } else {                                                                    //0149 : 06 4E 01 
      return False;                                                             //014C : 04 28 
    }
    //07 4C 01 77 01 F8 22 EC 25 2A 16 07 16 00 1B 96 98 00 00 16 04 28 0F 00 48 34 06 1B 2E B8 44 5C 
    //01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 B8 44 5C 01 16 07 C6 
    //00 82 77 00 48 34 06 1B 2A 16 18 12 00 77 19 00 48 34 06 1B 05 00 04 01 B0 31 22 11 2A 16 16 0F 
    //00 48 23 06 1B 2E B8 2F 5C 01 19 19 00 48 34 06 1B 05 00 04 01 B0 31 22 11 0B 00 04 1C 00 31 22 
    //11 20 B8 2F 5C 01 16 07 C6 00 82 77 00 48 23 06 1B 2A 16 18 12 00 77 19 00 48 23 06 1B 05 00 04 
    //01 D8 47 2C 11 2A 16 16 0F 00 F0 00 34 26 19 19 00 48 23 06 1B 05 00 04 01 D8 47 2C 11 06 00 00 
    //1B 0D 1A 00 00 16 1B 3C 98 00 00 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 
    //00 00 16 1B D1 98 00 00 16 00 F0 00 34 26 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 
    //1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 1B D0 
    //98 00 00 16 16 1B 48 98 00 00 36 58 C6 6B 0F 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 05 00 
    //0C 01 B0 F2 2B 11 16 04 27 06 4E 01 04 28 04 0B 47 
  }



