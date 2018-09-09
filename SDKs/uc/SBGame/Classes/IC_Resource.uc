//==============================================================================
//  IC_Resource
//==============================================================================

class IC_Resource extends Item_Component
    native
    editinlinenew
    dependsOn()
  ;

  enum EResourceType {
    ERT_Wood ,
    ERT_Metal 
  };

  var (Key) const byte ResourceType;



