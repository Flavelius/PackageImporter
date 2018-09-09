//==============================================================================
//  IC_Recipe
//==============================================================================

class IC_Recipe extends Item_Component
    native
    exportstructs
    editinlinenew
    dependsOn(Item_Type)
  ;

  struct RecipeComponent {
      var (RecipeComponent) export editinline Item_Type Item;
      var (RecipeComponent) int Quantity;

  };


  var const array<RecipeComponent> Components;
  var const array<RecipeComponent> RecycleComponents;
  var const export editinline Item_Type ProducedItem;


  final event int GetCraftPrice() {
    return ProducedItem.GetSellValue() * 0.25000000;                            //0000 : 04 39 44 AB 39 3F 19 01 D8 47 2C 11 06 00 04 1C 28 D7 2B 11 16 1E 00 00 80 3E 16 
    //04 39 44 AB 39 3F 19 01 D8 47 2C 11 06 00 04 1C 28 D7 2B 11 16 1E 00 00 80 3E 16 04 0B 47 
  }



