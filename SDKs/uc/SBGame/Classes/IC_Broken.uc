//==============================================================================
//  IC_Broken
//==============================================================================

class IC_Broken extends Item_Component
    native
    editinlinenew
    dependsOn(Item_Type,IC_Recipe,IC_Appearance)
  ;

  var export editinline Item_Type Recipe;


  final event int GetRecipePrice() {
    local export editinline IC_Recipe recipeComp;
    if (Recipe != None) {                                                       //0000 : 07 6F 00 77 01 B0 31 22 11 2A 16 
      recipeComp = IC_Recipe(Recipe.GetComponentByClass(Class'IC_Recipe'));     //000B : 0F 00 00 E5 31 11 2E B8 2F 5C 01 19 01 B0 31 22 11 0B 00 04 1C 00 31 22 11 20 B8 2F 5C 01 16 
      if (recipeComp != None
        && recipeComp.ProducedItem != None) {      //002A : 07 6F 00 82 77 00 00 E5 31 11 2A 16 18 12 00 77 19 00 00 E5 31 11 05 00 04 01 D8 47 2C 11 2A 16 16 
        return recipeComp.ProducedItem.GetSellValue() * 0.05000000;             //004B : 04 39 44 AB 39 3F 19 19 00 00 E5 31 11 05 00 04 01 D8 47 2C 11 06 00 04 1C 28 D7 2B 11 16 1E CD CC 4C 3D 16 
      }
    }
    return 0;                                                                   //006F : 04 25 
    //07 6F 00 77 01 B0 31 22 11 2A 16 0F 00 00 E5 31 11 2E B8 2F 5C 01 19 01 B0 31 22 11 0B 00 04 1C 
    //00 31 22 11 20 B8 2F 5C 01 16 07 6F 00 82 77 00 00 E5 31 11 2A 16 18 12 00 77 19 00 00 E5 31 11 
    //05 00 04 01 D8 47 2C 11 2A 16 16 04 39 44 AB 39 3F 19 19 00 00 E5 31 11 05 00 04 01 D8 47 2C 11 
    //06 00 04 1C 28 D7 2B 11 16 1E CD CC 4C 3D 16 04 25 04 0B 47 
  }


  function Appearance_Base GetAppearance() {
    local export editinline IC_Recipe R;
    local export editinline IC_Appearance A;
    if (Recipe != None) {                                                       //0000 : 07 8D 00 77 01 B0 31 22 11 2A 16 
      R = IC_Recipe(Recipe.GetComponentByClass(Class'IC_Recipe'));              //000B : 0F 00 E0 E6 31 11 2E B8 2F 5C 01 19 01 B0 31 22 11 0B 00 04 1C 00 31 22 11 20 B8 2F 5C 01 16 
      if (R != None && R.ProducedItem != None) {                                //002A : 07 8D 00 82 77 00 E0 E6 31 11 2A 16 18 12 00 77 19 00 E0 E6 31 11 05 00 04 01 D8 47 2C 11 2A 16 16 
        A = IC_Appearance(R.ProducedItem.GetComponentByClass(Class'IC_Appearance'));//004B : 0F 00 58 E7 31 11 2E B8 F0 5B 01 19 19 00 E0 E6 31 11 05 00 04 01 D8 47 2C 11 0B 00 04 1C 00 31 22 11 20 B8 F0 5B 01 16 
        if (A != None) {                                                        //0073 : 07 8D 00 77 00 58 E7 31 11 2A 16 
          return A.Appearance;                                                  //007E : 04 19 00 58 E7 31 11 05 00 04 01 A0 5F 22 11 
        }
      }
    }
    return None;                                                                //008D : 04 2A 
    //07 8D 00 77 01 B0 31 22 11 2A 16 0F 00 E0 E6 31 11 2E B8 2F 5C 01 19 01 B0 31 22 11 0B 00 04 1C 
    //00 31 22 11 20 B8 2F 5C 01 16 07 8D 00 82 77 00 E0 E6 31 11 2A 16 18 12 00 77 19 00 E0 E6 31 11 
    //05 00 04 01 D8 47 2C 11 2A 16 16 0F 00 58 E7 31 11 2E B8 F0 5B 01 19 19 00 E0 E6 31 11 05 00 04 
    //01 D8 47 2C 11 0B 00 04 1C 00 31 22 11 20 B8 F0 5B 01 16 07 8D 00 77 00 58 E7 31 11 2A 16 04 19 
    //00 58 E7 31 11 05 00 04 01 A0 5F 22 11 04 2A 04 0B 47 
  }



