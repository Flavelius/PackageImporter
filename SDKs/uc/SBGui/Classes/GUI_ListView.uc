//==============================================================================
//  GUI_ListView
//==============================================================================

class GUI_ListView extends GUI_Page
    native
    exportstructs
    dependsOn()
    Transient
    Config(User)
  ;

  const LV_HEADER_MARGIN =  4;
  const LV_HEADER_HEIGHT =  22;
  const LV_COL_ALIGN_RIGHT =  2;
  const LV_COL_ALIGN_CENTER =  1;
  const LV_COL_ALIGN_LEFT =  0;
  const LV_MODE_LIST =  1;
  const LV_MODE_REPORT =  0;
  struct ListViewItem {
      var string pageClass;
      var string Text;
      var int Sortable;

  };


  var int mRowHeight;
  var int mHorizMargin;
  var private GUI_ListViewHeader mHeader;
  var byte mListViewMode;
  var bool mShowColumnHeaders;
  var bool mAllowRowSelection;
  var bool mSorted;
  var int mSortColumn;
  var bool mSortAscending;
  var int mSelectedRow;
  var GUI_Page mRowsPage;
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var private int mData;


  native function bool OnHeaderComponentClickHandler(GUI_Component sender,bool hasDoubleClicked);


  native function bool OnRowMouseDownHandler(float aMouseX,float aMouseY,int aButtons);


  native function bool OnRowMouseUpHandler(float aMouseX,float aMouseY,int aButtons);


  native function bool OnRowComponentClickHandler(GUI_Component sender,bool hasDoubleClicked);


  native function Sort(int aColumnIndex);


  native function SelectRow(int aIndex);


  native function int GetSelectedRowId();


  native function int GetSelectedRow();


  native function SetImageMaterial(int aColumnIndex,int aRowIndex,Material aMaterial);


  native function SetImage(int aColumnIndex,int aRowIndex,string aImageBaseName,optional string aTexturePackage,optional string aImageSet);


  native function SetSortable(int aColumnIndex,int aRowIndex,int aSortable,bool aUpdate);


  native function SetText(int aColumnIndex,int aRowIndex,string aText);


  native function GUI_Page GetRowPage(int aColumnIndex,int aRowIndex);


  native function GUI_Label GetRowLabel(int aColumnIndex,int aRowIndex);


  native function array<string> GetRowTexts(int aRowIndex);


  native function string GetRowText(int aColumnIndex,int aRowIndex);


  native function int GetRowCount();


  native function RemoveAllRows();


  native function RemoveRow(int aIndex);


  static native function PackRowItem(out array<ListViewItem> aItems,string aPageClass,string aString,int aSortable);


  native function PostAddItems(optional int aRowIndex);


  native function int AddRowItems(int aRowId,array<ListViewItem> aColumnItems,optional bool aBulkInsert);


  native function int AddRowTexts(int aRowId,array<string> aColumnTexts,optional bool aBulkInsert);


  native function int GetRowID(int aRowIndex);


  native function int GetRowIndex(int aRowId);


  native function int GetColumnWidth(int aIndex);


  native function int GetColumnAlignment(int aIndex);


  native function string GetColumnName(int aIndex);


  native function int GetColumnCount();


  native function int InsertColumn(string aColumnName,int aAlignment,int aWidth,int aColumnIndex);


  native function RemoveColumn(int aColumnIndex);


  native function int AddColumn(string aColumnName,int aAlignment,int aWidth);


  native function ScrollToLastItem();


  native function ScaleToFit(bool aHideScrollbar);


  native function bool MayRowsBeSelected();


  native function AllowRowSelection(bool Allow);


  native function bool AreColumnHeadersShown();


  native function ShowColumnHeaders(bool Show);


  native function int GetViewMode();


  native function SetViewMode(byte aMode);


  function DefaultColumnHeaderClickHandler(GUI_ListView sender,int aColumnIndex) {
    sender.Sort(aColumnIndex);                                                  //0000 : 19 00 F0 A1 A4 19 0B 00 00 1B 88 30 00 00 00 B0 A2 A4 19 16 
    //19 00 F0 A1 A4 19 0B 00 00 1B 88 30 00 00 00 B0 A2 A4 19 16 04 0B 47 
  }


  delegate OnSelectionChange(GUI_ListView sender,int aNewSelectionIndex);


  delegate OnRowDblClick(GUI_ListView sender,int aColumnIndex,int aRowIndex);


  delegate OnRowRightClick(GUI_ListView sender,int aColumnIndex,int aRowIndex);


  delegate OnRowClick(GUI_ListView sender,int aColumnIndex,int aRowIndex);


  delegate OnColumnHeaderDblClick(GUI_ListView sender,int aColumnIndex);


  delegate OnColumnHeaderClick(GUI_ListView sender,int aColumnIndex);


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    __OnComponentClick__Delegate = OnHeaderComponentClickHandler;               //0006 : 45 01 20 EB 9D 19 44 1B 9B 00 00 
    mRowsPage = CreatePage("GUI_Page",0,8,0,22 + 4,GetClientWidth(),GetClientHeight() - 22 + 4);//0011 : 0F 01 48 B5 A4 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 2C 08 25 92 2C 16 2C 04 16 39 44 1B 17 98 00 00 16 39 44 AF 1B 1F 98 00 00 16 39 3F 92 2C 16 2C 04 16 16 16 
    mRowsPage.SetAnchors(0.00000000,0.00000000,1.00000000,1.00000000);          //004B : 19 01 48 B5 A4 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 
    mRowsPage.__OnComponentClick__Delegate = OnRowComponentClickHandler;        //006E : 45 19 01 48 B5 A4 19 05 00 08 01 20 EB 9D 19 44 1E 9B 00 00 
    mRowsPage.__OnMouseUp__Delegate = OnRowMouseUpHandler;                      //0082 : 45 19 01 48 B5 A4 19 05 00 08 01 C8 E8 9D 19 44 1D 9B 00 00 
    mRowsPage.__OnMouseDown__Delegate = OnRowMouseDownHandler;                  //0096 : 45 19 01 48 B5 A4 19 05 00 08 01 50 E8 9D 19 44 1C 9B 00 00 
    __OnColumnHeaderClick__Delegate = DefaultColumnHeaderClickHandler;          //00AA : 45 01 C0 B5 A4 19 44 25 9B 00 00 
    //1C 40 5B 9E 19 16 45 01 20 EB 9D 19 44 1B 9B 00 00 0F 01 48 B5 A4 19 1B 16 98 00 00 1F 47 55 49 
    //5F 50 61 67 65 00 25 2C 08 25 92 2C 16 2C 04 16 39 44 1B 17 98 00 00 16 39 44 AF 1B 1F 98 00 00 
    //16 39 3F 92 2C 16 2C 04 16 16 16 19 01 48 B5 A4 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 
    //00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 45 19 01 48 B5 A4 19 05 00 08 01 20 EB 9D 19 44 1E 9B 
    //00 00 45 19 01 48 B5 A4 19 05 00 08 01 C8 E8 9D 19 44 1D 9B 00 00 45 19 01 48 B5 A4 19 05 00 08 
    //01 50 E8 9D 19 44 1C 9B 00 00 45 01 C0 B5 A4 19 44 25 9B 00 00 04 0B 47 
  }



