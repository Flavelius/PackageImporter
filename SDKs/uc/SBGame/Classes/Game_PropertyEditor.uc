//==============================================================================
//  Game_PropertyEditor
//==============================================================================

class Game_PropertyEditor extends Base_Component within Game_GameMasterController
    native
    dependsOn()
  ;


  protected native function cl2sv_OpenEditObject_CallStub();


  native event cl2sv_OpenEditObject(string aClassName,string aName);


  protected native function cl2sv_SendChanges_CallStub();


  native event cl2sv_SendChanges(string aClassName,string aName,array<byte> aData);


  native function EditObject(Object aObject);



