//==============================================================================
//  GUI_ComboBox
//==============================================================================

class GUI_ComboBox extends GUI_Page
    native
    dependsOn(GUI_ComboBoxDropDown,GUI_Button,GUI_Label,GUI_Desktop)
    Transient
    Config(User)
  ;

  var int mComboBoxStyle;
  var GUI_Label mSelectedLabel;
  var GUI_Button mExpandButton;
  var GUI_ComboBoxDropDown mOptionsDropDown;
  var (null);


  native function string GetItemData(int itemID);


  native function string GetItemText(int itemID);


  native function bool IsExpanded();


  native function int GetNumItems();


  native function int GetSelection();


  native function ExpandList(bool State);


  native function bool SelectItem(int itemID);


  native function int FindData(string itemData);


  native function int FindItem(string itemText);


  native function RemoveAllItems();


  native function RemoveItem(int itemID);


  native function AddItem(int itemID,string itemText,optional string itemData);


  delegate OnItemChange(GUI_Component sender,int newItemIndex);


  function bool SelectedLabelMouseDownHandler(float MouseX,float MouseY,int buttons) {
    mOptionsDropDown.mWatchedComponent = mSelectedLabel;                        //0000 : 0F 19 01 A0 AC A5 19 05 00 04 01 58 DD A2 19 01 18 AD A5 19 
    ExpandList(!mOptionsDropDown.IsVisible());                                  //0014 : 1B ED 99 00 00 81 19 01 A0 AC A5 19 06 00 04 1C C0 E6 88 19 16 16 16 
    return True;                                                                //002B : 04 27 
    //0F 19 01 A0 AC A5 19 05 00 04 01 58 DD A2 19 01 18 AD A5 19 1B ED 99 00 00 81 19 01 A0 AC A5 19 
    //06 00 04 1C C0 E6 88 19 16 16 16 04 27 04 0B 47 
  }


  function bool ExpandButtonMouseDownHandler(float MouseX,float MouseY,int buttons) {
    mOptionsDropDown.mWatchedComponent = mExpandButton;                         //0000 : 0F 19 01 A0 AC A5 19 05 00 04 01 58 DD A2 19 01 90 B0 A5 19 
    ExpandList(!mOptionsDropDown.IsVisible());                                  //0014 : 1B ED 99 00 00 81 19 01 A0 AC A5 19 06 00 04 1C C0 E6 88 19 16 16 16 
    return True;                                                                //002B : 04 27 
    //0F 19 01 A0 AC A5 19 05 00 04 01 58 DD A2 19 01 90 B0 A5 19 1B ED 99 00 00 81 19 01 A0 AC A5 19 
    //06 00 04 1C C0 E6 88 19 16 16 16 04 27 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    mExpandButton = CreateButton("GUI_Button",0,0,0,0);                         //0006 : 0F 01 90 B0 A5 19 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 25 16 
    mExpandButton.SetBackground("Dropdown_Button","SBGuiTX.GUI_Styles","GUI_Styles");//0022 : 19 01 90 B0 A5 19 37 00 00 1B 1A 98 00 00 1F 44 72 6F 70 64 6F 77 6E 5F 42 75 74 74 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mExpandButton.__OnMouseDown__Delegate = ExpandButtonMouseDownHandler;       //0062 : 45 19 01 90 B0 A5 19 05 00 08 01 50 E8 9D 19 44 2F 9B 00 00 
    mExpandButton.SetAnchors(1.00000000,0.00000000,1.00000000,0.00000000);      //0076 : 19 01 90 B0 A5 19 1A 00 00 1B 24 98 00 00 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    mSelectedLabel = CreateLabel("GUI_Label",0,0,0,0,mWidth - mExpandButton.mTexWidth,mExpandButton.mTexHeight);//0099 : 0F 01 18 AD A5 19 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 25 25 25 39 44 AF 01 60 87 31 16 19 01 90 B0 A5 19 05 00 04 01 F0 8A 31 16 16 39 44 19 01 90 B0 A5 19 05 00 04 01 E0 8B 31 16 16 
    mSelectedLabel.SetStdBackground(7);                                         //00DB : 19 01 18 AD A5 19 08 00 00 1B 22 98 00 00 2C 07 16 
    mSelectedLabel.SetTextBorder(11.00000000,0.00000000);                       //00EC : 19 01 18 AD A5 19 10 00 00 1B 49 98 00 00 1E 00 00 30 41 1E 00 00 00 00 16 
    mSelectedLabel.SetAnchors(0.00000000,0.00000000,1.00000000,0.00000000);     //0105 : 19 01 18 AD A5 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    mSelectedLabel.__OnMouseDown__Delegate = SelectedLabelMouseDownHandler;     //0128 : 45 19 01 18 AD A5 19 05 00 08 01 50 E8 9D 19 44 30 9B 00 00 
    mOptionsDropDown = GUI_ComboBoxDropDown(mDesktop.GetWindow(mDesktop.CreateWindow("GUI_ComboBoxDropDown",0,0,0,10,10,mWidth - mExpandButton.mTexWidth + 5,6,"ComboBoxDropDown")));//013C : 0F 01 A0 AC A5 19 2E F8 FA 2E 1D 19 01 48 0C 9D 19 63 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 54 00 04 1B 4C 2D 00 00 1F 47 55 49 5F 43 6F 6D 62 6F 42 6F 78 44 72 6F 70 44 6F 77 6E 00 25 25 25 2C 0A 2C 0A 39 44 AE AF 01 60 87 31 16 19 01 90 B0 A5 19 05 00 04 01 F0 8A 31 16 16 39 3F 2C 05 16 2C 06 1F 43 6F 6D 62 6F 42 6F 78 44 72 6F 70 44 6F 77 6E 00 16 16 
    mOptionsDropDown.mWatchedComponent = mExpandButton;                         //01B3 : 0F 19 01 A0 AC A5 19 05 00 04 01 58 DD A2 19 01 90 B0 A5 19 
    mDesktop.ShowWindow(mOptionsDropDown.GetWindowHandle(),2);                  //01C7 : 19 01 48 0C 9D 19 17 00 00 1B 57 2D 00 00 19 01 A0 AC A5 19 06 00 04 1B 9B 98 00 00 16 2C 02 16 
    mOptionsDropDown.ComboBox = self;                                           //01E7 : 0F 19 01 A0 AC A5 19 05 00 04 01 78 B6 A5 19 17 
    mHeight = mExpandButton.mTexHeight;                                         //01F7 : 0F 01 40 88 31 16 19 01 90 B0 A5 19 05 00 04 01 E0 8B 31 16 
    //1C 40 5B 9E 19 16 0F 01 90 B0 A5 19 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 25 
    //25 16 19 01 90 B0 A5 19 37 00 00 1B 1A 98 00 00 1F 44 72 6F 70 64 6F 77 6E 5F 42 75 74 74 6F 6E 
    //00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 
    //00 16 45 19 01 90 B0 A5 19 05 00 08 01 50 E8 9D 19 44 2F 9B 00 00 19 01 90 B0 A5 19 1A 00 00 1B 
    //24 98 00 00 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 0F 01 18 AD A5 19 1B 
    //20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 25 25 25 39 44 AF 01 60 87 31 16 19 01 90 B0 A5 
    //19 05 00 04 01 F0 8A 31 16 16 39 44 19 01 90 B0 A5 19 05 00 04 01 E0 8B 31 16 16 19 01 18 AD A5 
    //19 08 00 00 1B 22 98 00 00 2C 07 16 19 01 18 AD A5 19 10 00 00 1B 49 98 00 00 1E 00 00 30 41 1E 
    //00 00 00 00 16 19 01 18 AD A5 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 
    //80 3F 1E 00 00 00 00 16 45 19 01 18 AD A5 19 05 00 08 01 50 E8 9D 19 44 30 9B 00 00 0F 01 A0 AC 
    //A5 19 2E F8 FA 2E 1D 19 01 48 0C 9D 19 63 00 04 1B 1E 98 00 00 19 01 48 0C 9D 19 54 00 04 1B 4C 
    //2D 00 00 1F 47 55 49 5F 43 6F 6D 62 6F 42 6F 78 44 72 6F 70 44 6F 77 6E 00 25 25 25 2C 0A 2C 0A 
    //39 44 AE AF 01 60 87 31 16 19 01 90 B0 A5 19 05 00 04 01 F0 8A 31 16 16 39 3F 2C 05 16 2C 06 1F 
    //43 6F 6D 62 6F 42 6F 78 44 72 6F 70 44 6F 77 6E 00 16 16 0F 19 01 A0 AC A5 19 05 00 04 01 58 DD 
    //A2 19 01 90 B0 A5 19 19 01 48 0C 9D 19 17 00 00 1B 57 2D 00 00 19 01 A0 AC A5 19 06 00 04 1B 9B 
    //98 00 00 16 2C 02 16 0F 19 01 A0 AC A5 19 05 00 04 01 78 B6 A5 19 17 0F 01 40 88 31 16 19 01 90 
    //B0 A5 19 05 00 04 01 E0 8B 31 16 04 0B 47 
  }



