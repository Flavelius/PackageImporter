//==============================================================================
//  IC_Consumable
//==============================================================================

class IC_Consumable extends Item_Component
    native
    editinlinenew
    dependsOn()
  ;

  enum IC_ConsumableType {
    ICT_Food ,
    ICT_Drink ,
    ICT_Potion 
  };

  var (Consumable) byte Type;



