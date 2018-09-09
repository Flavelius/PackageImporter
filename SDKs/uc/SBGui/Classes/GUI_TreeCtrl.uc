//==============================================================================
//  GUI_TreeCtrl
//==============================================================================

class GUI_TreeCtrl extends GUI_Page
    native
    dependsOn()
    Transient
    Config(User)
  ;

  const GUI_TIS_EXPANDED = 2;
  const GUI_TIS_BUTTON = 1;
  var bool mHideRoot;
  var int mSelectedIndex;
  var GUI_Image mSelectionImage;
  var (null);
  var int mTreeCtrlData;


  event Initialize() {
    mSelectionImage = CreateImage("white_dot","SBGuiTX.GUI_Styles","GUI_Styles");//0000 : 0F 01 F8 E4 A5 19 1B 26 98 00 00 1F 77 68 69 74 65 5F 64 6F 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    SetBackgroundColors(179.00000000 / 255,172.00000000 / 255,190.00000000 / 255,255.00000000 / 255);//0037 : 1B 8F 98 00 00 AC 1E 00 00 33 43 39 3F 2C FF 16 AC 1E 00 00 2C 43 39 3F 2C FF 16 AC 1E 00 00 3E 43 39 3F 2C FF 16 AC 1E 00 00 7F 43 39 3F 2C FF 16 16 
    __OnComponentClick__Delegate = HandleComponentClick;                        //0069 : 45 01 20 EB 9D 19 44 D2 99 00 00 
    //0F 01 F8 E4 A5 19 1B 26 98 00 00 1F 77 68 69 74 65 5F 64 6F 74 00 1F 53 42 47 75 69 54 58 2E 47 
    //55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 1B 8F 98 00 00 AC 1E 00 00 
    //33 43 39 3F 2C FF 16 AC 1E 00 00 2C 43 39 3F 2C FF 16 AC 1E 00 00 3E 43 39 3F 2C FF 16 AC 1E 00 
    //00 7F 43 39 3F 2C FF 16 16 45 01 20 EB 9D 19 44 D2 99 00 00 04 0B 47 
  }


  function HideRoot(bool HideRoot) {
    mHideRoot = HideRoot;                                                       //0000 : 14 2D 01 D8 E6 A5 19 2D 00 20 E6 A5 19 
    //14 2D 01 D8 E6 A5 19 2D 00 20 E6 A5 19 04 0B 47 
  }


  delegate bool OnItemSelect(GUI_TreeCtrl Source,int itemIndex,string itemText,Object itemData);


  function int GetSelectedIndex() {
    return mSelectedIndex;                                                      //0000 : 04 01 E8 EB A5 19 
    //04 01 E8 EB A5 19 04 0B 47 
  }


  native function bool HandleComponentClick(GUI_Component clickedComponent,optional bool doubleClick);


  native function GUI_Component GetItemComponent(int itemIndex);


  native function int GetItemIndex(Object itemData);


  native function Object GetItemData(int itemIndex);


  native function SetItemData(int itemIndex,Object itemData);


  native function SelectItem(int itemIndex);


  native function CollapseItem(int itemIndex,bool collapseChildren);


  native function ExpandItem(int itemIndex,bool expandChildren);


  native function SetItemDrawn(int Index,bool IsVisible);


  native function ClearItemIcon(int itemIndex);


  native function SetItemIcon(int itemIndex,string imageBaseName,optional string TexturePackage,optional string imageSet);


  native function int SetItemText(int itemIndex,string newText);


  native function int RemoveAllItems();


  native function int AddItemText(int parentItem,int treeItemStyle,string Text,Color aColor,optional bool ownerEvents,optional int intTag);


  native function int RemoveItem(int itemID);


  native function int AddItem(int parentItem,int treeItemStyle,GUI_Component component);


  native function int SetRootText(int treeItemStyle,string Text,Color aColor);


  native function int SetRoot(int treeItemStyle,GUI_Component component);



