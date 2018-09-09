//==============================================================================
//  GUI_Page
//==============================================================================

class GUI_Page extends GUI_Component
    native
    dependsOn()
    Transient
    Config(User)
  ;

  var int mPageStyle;
  var int mCurrentTabIndex;
  var GUI_ScrollBar mVScrollBar;
  var GUI_ScrollBar mHScrollBar;
  var (null);
  var int mPageData;


  event bool OnMouseWheel(bool isUp) {
    HandleMouseWheel(isUp);                                                     //0000 : 1B 8B 9B 00 00 2D 00 C0 FE 9D 19 16 
    return True;                                                                //000C : 04 27 
    //1B 8B 9B 00 00 2D 00 C0 FE 9D 19 16 04 27 04 0B 47 
  }


  native function HandleMouseWheel(bool isUp);


  native function AttachComponent(GUI_Component component);


  native function DetachComponent(GUI_Component component);


  native function TransferComponent(GUI_Component aComponent,GUI_Page aTarget);


  native function Clear();


  native function int GetVScrollOffset();


  event bool HiliteHandler(GUI_Component fromChild) {
    if (fromChild == None) {                                                    //0000 : 07 23 00 72 00 58 0F 9E 19 2A 16 
      if (mCurrentTabIndex == 0) {                                              //000B : 07 1D 00 9A 01 30 10 9E 19 25 16 
        mCurrentTabIndex = 1;                                                   //0016 : 0F 01 30 10 9E 19 26 
      }
      UpdateTabFocus();                                                         //001D : 1B 98 9B 00 00 16 
    }
    return False;                                                               //0023 : 04 28 
    //07 23 00 72 00 58 0F 9E 19 2A 16 07 1D 00 9A 01 30 10 9E 19 25 16 0F 01 30 10 9E 19 26 1B 98 9B 
    //00 00 16 04 28 04 0B 47 
  }


  native function GUI_Component PreviousTabComponent();


  native function GUI_Component NextTabComponent();


  native function AddTabComponent(GUI_Component aComponent);


  native function UpdateTabFocus();


  native function GUI_Component GetComponent(int Index);


  native function int GetComponentCount();


  event delegate OnScrollOffsetChanged(GUI_ScrollBar Source);


  native function BringToBottom(GUI_Component component);


  native function BringToTop(GUI_Component component);


  native function int FindComponent(string componentTitle);


  native function DestroyComponent(GUI_Component component);


  native function GUI_ListView CreateListView(string listviewClassName,int componentStyle,int pageStyle,int Left,int top,optional int width,optional int Height);


  native function GUI_Mesh CreateMesh(string pageClass,int componentStyle,string meshName,int Left,int top,int width,int Height,optional int Yaw,optional int Pitch,optional int Roll,optional float Distance,optional float FOV,optional bool ClearZ);


  native function GUI_TabCtrl CreateTabCtrl(string ctrlClass,int componentStyle,int pageStyle,int tabCtrlStyle,int Left,int top,optional int width,optional int Height,optional string componentTitle);


  native function GUI_Page CreatePage(string pageClass,int componentStyle,int pageStyle,int Left,int top,optional int width,optional int Height,optional string componentTitle,optional string tooltipText);


  native function GUI_ComboBox CreateComboBox(string comboBoxClass,int componentStyle,int comboBoxStyle,int Left,int top,optional int width,optional int Height,optional string componentTitle);


  native function GUI_EditBox CreateEditBox(string editBoxClass,int componentStyle,int editBoxStyle,int Left,int top,optional int width,optional int Height,optional string componentTitle);


  native function GUI_TextButton CreateTextButton(string buttonClass,int componentStyle,int buttonStyle,int Left,int top,optional int width,optional int Height,optional string componentTitle);


  native function GUI_Button CreateButton(string buttonClass,int componentStyle,int buttonStyle,int Left,int top,optional int width,optional int Height,optional string componentTitle);


  native function GUI_Label CreateLabel(string labelClass,int componentStyle,int labelStyle,int Left,int top,optional int width,optional int Height,optional string labelText);


  native function GUI_Component CreateComponent(string ComponentClass,int componentStyle,int Left,int top,optional int width,optional int Height,optional string componentTitle);


  native function float GetClientHeight();


  native function float GetClientWidth();


  native event PreLogin();


  native event OnLogin();


  function Initialize() {
    Super.Initialize();                                                         //0000 : 1C 70 DD 9D 19 16 
    __OnHilite__Delegate = HiliteHandler;                                       //0006 : 45 01 E8 E6 9D 19 44 CC 96 00 00 
    //1C 70 DD 9D 19 16 45 01 E8 E6 9D 19 44 CC 96 00 00 04 0B 47 
  }



