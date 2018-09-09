//==============================================================================
//  GUI_ComboBoxDropDown
//==============================================================================

class GUI_ComboBoxDropDown extends GUI_ContextWindow
    native
    dependsOn()
    Transient
    Config(User)
  ;

  var int mSelectedID;
  var int mNumItems;
  var GUI_ComboBox ComboBox;
  var int mComboBoxData;


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 18 DB A2 19 16 
    //1C 18 DB A2 19 16 04 0B 47 
  }



