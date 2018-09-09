//==============================================================================
//  GUI_TabCtrl
//==============================================================================

class GUI_TabCtrl extends GUI_Page
    native
    dependsOn(GUI_Button)
    Transient
    Config(User)
  ;

  var int mTabCtrlStyle;
  var int mMaxButtonsX;
  var int mMaxButtonsY;
  var float mButtonWidthFactor;
  var GUI_Window mDragAndDropWindow;
  var string mDnDWindowClass;
  var string mBackgroundImageName;
  var string mBackgroundPackage;
  var string mBackgroundSheetfile;
  var float mButtonWidth;
  var float mButtonHeight;
  var float mButtonTop;
  var bool mHasFullTabs;
  var bool mCanDnDTabs;
  var Color mSelectedButtonColor;
  var Color mUnselectedButtonColor;
  var (null);
  var (null);
  var (null);
  var int mTabCtrlData;


  native function SetSelectedColor(int Index,Color aColor);


  native function SetUnselectedColor(int Index,Color aColor);


  event DropPage(GUI_Page aPage,string Title) {
    AttachComponent(aPage);                                                     //0000 : 1B 8D 9B 00 00 00 40 39 A5 19 16 
    AttachPage(aPage,Title,aPage.GetTooltipText());                             //000B : 1B 27 9B 00 00 00 40 39 A5 19 00 48 3A A5 19 19 00 40 39 A5 19 06 00 00 1B 7B 07 00 00 16 16 
    aPage.Invalidate();                                                         //002A : 19 00 40 39 A5 19 06 00 00 1B 1D 98 00 00 16 
    OnPageDock(self,aPage);                                                     //0039 : 43 28 95 A2 19 11 97 00 00 17 00 40 39 A5 19 16 
    //1B 8D 9B 00 00 00 40 39 A5 19 16 1B 27 9B 00 00 00 40 39 A5 19 00 48 3A A5 19 19 00 40 39 A5 19 
    //06 00 00 1B 7B 07 00 00 16 16 19 00 40 39 A5 19 06 00 00 1B 1D 98 00 00 16 43 28 95 A2 19 11 97 
    //00 00 17 00 40 39 A5 19 16 04 0B 47 
  }


  native function SetTabVisible(GUI_Page aTabPage,bool aVisible);


  function EnableDnD(bool Setting,string windowClass) {
    if (Setting) {                                                              //0000 : 07 2D 00 2D 00 48 3D A5 19 
      mDnDWindowClass = windowClass;                                            //0009 : 0F 01 C0 3D A5 19 00 38 3E A5 19 
      __OnDrag__Delegate = OnPageDrag;                                          //0014 : 45 01 F0 ED 9D 19 44 22 9B 00 00 
      __OnDrop__Delegate = OnPageDrop;                                          //001F : 45 01 68 EE 9D 19 44 26 9B 00 00 
    } else {                                                                    //002A : 06 4B 00 
      mDnDWindowClass = "";                                                     //002D : 0F 01 C0 3D A5 19 1F 00 
      __OnDrag__Delegate = None;                                                //0035 : 45 01 F0 ED 9D 19 44 00 00 00 00 
      __OnDrag__Delegate = None;                                                //0040 : 45 01 F0 ED 9D 19 44 00 00 00 00 
    }
    //07 2D 00 2D 00 48 3D A5 19 0F 01 C0 3D A5 19 00 38 3E A5 19 45 01 F0 ED 9D 19 44 22 9B 00 00 45 
    //01 68 EE 9D 19 44 26 9B 00 00 06 4B 00 0F 01 C0 3D A5 19 1F 00 45 01 F0 ED 9D 19 44 00 00 00 00 
    //45 01 F0 ED 9D 19 44 00 00 00 00 04 0B 47 
  }


  function SetEnabled(bool B) {
    local int i;
    local GUI_Button aButton;
    Super.SetEnabled(B);                                                        //0000 : 1C 70 84 9D 19 2D 00 60 3F A5 19 16 
    aButton = GetButton(0);                                                     //000C : 0F 00 78 40 A5 19 1B 2A 98 00 00 25 16 
    while (aButton != None) {                                                   //0019 : 07 54 00 77 00 78 40 A5 19 2A 16 
      aButton.SetEnabled(B);                                                    //0024 : 19 00 78 40 A5 19 0C 00 00 1B 5F 32 00 00 2D 00 60 3F A5 19 16 
      aButton = GetButton(i);                                                   //0039 : 0F 00 78 40 A5 19 1B 2A 98 00 00 00 F0 40 A5 19 16 
      ++i;                                                                      //004A : A3 00 F0 40 A5 19 16 
    }
    //1C 70 84 9D 19 2D 00 60 3F A5 19 16 0F 00 78 40 A5 19 1B 2A 98 00 00 25 16 07 54 00 77 00 78 40 
    //A5 19 2A 16 19 00 78 40 A5 19 0C 00 00 1B 5F 32 00 00 2D 00 60 3F A5 19 16 0F 00 78 40 A5 19 1B 
    //2A 98 00 00 00 F0 40 A5 19 16 A3 00 F0 40 A5 19 16 06 19 00 04 0B 47 
  }


  function SetBackgroundColors(float R,float G,float B,float A) {
    Super.SetBackgroundColors(R,G,B,A);                                         //0000 : 1C 40 3A 9D 19 00 18 42 A5 19 00 08 43 A5 19 00 80 43 A5 19 00 F8 43 A5 19 16 
    SetTabComponentColors(R,G,B,A);                                             //001A : 1B 21 9B 00 00 00 18 42 A5 19 00 08 43 A5 19 00 80 43 A5 19 00 F8 43 A5 19 16 
    //1C 40 3A 9D 19 00 18 42 A5 19 00 08 43 A5 19 00 80 43 A5 19 00 F8 43 A5 19 16 1B 21 9B 00 00 00 
    //18 42 A5 19 00 08 43 A5 19 00 80 43 A5 19 00 F8 43 A5 19 16 04 0B 47 
  }


  delegate OnPageUndocked(GUI_TabCtrl aSource,GUI_Window NewOwner,GUI_Page undockedPage);


  delegate OnPageDock(GUI_TabCtrl aSource,GUI_Page aPage);


  delegate OnTabChanged(GUI_TabCtrl aSource,GUI_Page aNewSelectedPage,GUI_Page aPreviousSelectedPage);


  native function GUI_Button FindButton(GUI_Page aPage);


  native function DestroyPage(GUI_Page aPage);


  native function AttachPage(GUI_Page aPage,string componentTitle,string tooltipText);


  native function bool OnPageDrop(GUI_DnDInfo dndInfo,float relMouseX,float relMouseY,GUI_Component fromChild);


  native function bool OnPageDrag(GUI_DnDInfo dndInfo,float relMouseX,float relMouseY,GUI_Component fromChild);


  native function SetTabComponentColors(float R,float G,float B,float A);


  native function SetTabTitle(string Title);


  native function string GetTabTitle();


  native function int GetTabCount();


  native function float GetPageHeight();


  native function SetBackground(string imageBaseName,optional string TexturePackage,optional string imageSet,optional int backgroundType);


  native function SetSelectedPage(GUI_Page aPage);


  native function GUI_Button GetButton(int Index);


  native function GUI_Button GetSelectedButton();


  native function GUI_Page GetSelectedPage();


  native function GUI_Page CreatePage(string pageClass,int componentStyle,int pageStyle,int Left,int top,optional int width,optional int Height,optional string componentTitle,optional string tooltipText);



