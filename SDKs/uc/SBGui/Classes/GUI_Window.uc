//==============================================================================
//  GUI_Window
//==============================================================================

class GUI_Window extends GUI_Page
    native
    dependsOn(Class,GUI_BaseDesktop,GUI_TitleBar,GUI_Desktop,GUI_Sounds,GUI_Button,GUI_TextButton,GUI_Menu,SBGuiStrings)
    Transient
    Config(User)
  ;

  const WINDOW_MIN_HEIGHT =  20.0f;
  const WINDOW_MIN_WIDTH =  20.0f;
  var int mWindowHandle;
  var string mWindowTitle;
  var string mClassName;
  var int mWindowStyle;
  var GUI_TitleBar mTitleBar;
  var GUI_Window mOwnerWindow;
  var int mDockingStyle;
  var int mCurrentDocking;
  var float mRenderWindowRect[4];
  var float mDockLeft;
  var float mDockTop;
  var float mSnapLeft;
  var float mSnapTop;
  var float mDockingBorders[4];
  var GUI_Image mInnerOrnament;
  var private bool mMinimized;
  var private bool mMaximized;
  var private bool mMinimizeFadeIn;
  var private bool mMinimizeFadeOut;
  var private bool mMaximizeFadeIn;
  var private bool mMaximizeFadeOut;
  var float mMinimizedLeft;
  var float mMinimizedTop;
  var float mRestoreLeft;
  var float mRestoreTop;
  var float mRestoreWidth;
  var float mRestoreHeight;
  var private GUI_Component mFocusedComponent;
  var GUI_Menu mSystemMenu;
  var GUI_Menu mTransparencyMenu;
  var GUI_TextButton mAutoplaceMenuItem;
  var GUI_TextButton mCloseMenuItem;
  var (null);
  var int mWindowData;


  function int GetWindowStyle() {
    return mWindowStyle;                                                        //0000 : 04 01 70 61 9E 19 
    //04 01 70 61 9E 19 04 0B 47 
  }


  event EnableClose(bool Setting) {
    if (Setting) {                                                              //0000 : 07 29 00 2D 00 98 62 9E 19 
      mWindowStyle = mWindowStyle & ~Class'GUI_BaseDesktop'.4096;               //0009 : 0F 01 70 61 9E 19 9C 01 70 61 9E 19 8D 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 16 16 
    } else {                                                                    //0026 : 06 44 00 
      mWindowStyle = mWindowStyle | Class'GUI_BaseDesktop'.4096;                //0029 : 0F 01 70 61 9E 19 9E 01 70 61 9E 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 16 
    }
    mTitleBar.EnableClose((mWindowStyle & Class'GUI_BaseDesktop'.4096) == 0);   //0044 : 19 01 D8 63 9E 19 1E 00 00 1B BD 96 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 16 25 16 16 
    UpdateMenuItems();                                                          //006B : 1B 63 97 00 00 16 
    //07 29 00 2D 00 98 62 9E 19 0F 01 70 61 9E 19 9C 01 70 61 9E 19 8D 12 20 00 68 D7 00 05 00 04 1D 
    //00 10 00 00 16 16 06 44 00 0F 01 70 61 9E 19 9E 01 70 61 9E 19 12 20 00 68 D7 00 05 00 04 1D 00 
    //10 00 00 16 19 01 D8 63 9E 19 1E 00 00 1B BD 96 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 05 
    //00 04 1D 00 10 00 00 16 25 16 16 1B 63 97 00 00 16 04 0B 47 
  }


  event EnableMovement(bool Setting) {
    if (!Setting) {                                                             //0000 : 07 28 00 81 2D 00 00 65 9E 19 16 
      mWindowStyle = mWindowStyle & ~Class'GUI_BaseDesktop'.4;                  //000B : 0F 01 70 61 9E 19 9C 01 70 61 9E 19 8D 12 20 00 68 D7 00 02 00 04 2C 04 16 16 
    } else {                                                                    //0025 : 06 40 00 
      mWindowStyle = mWindowStyle | Class'GUI_BaseDesktop'.4;                   //0028 : 0F 01 70 61 9E 19 9E 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 04 16 
    }
    mTitleBar.EnableMove((mWindowStyle & Class'GUI_BaseDesktop'.4) != 0);       //0040 : 19 01 D8 63 9E 19 1B 00 00 1B BF 96 00 00 9B 9C 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 16 
    UpdateMenuItems();                                                          //0064 : 1B 63 97 00 00 16 
    //07 28 00 81 2D 00 00 65 9E 19 16 0F 01 70 61 9E 19 9C 01 70 61 9E 19 8D 12 20 00 68 D7 00 02 00 
    //04 2C 04 16 16 06 40 00 0F 01 70 61 9E 19 9E 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 04 16 
    //19 01 D8 63 9E 19 1B 00 00 1B BF 96 00 00 9B 9C 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 04 
    //16 25 16 16 1B 63 97 00 00 16 04 0B 47 
  }


  event EnableMinimize(bool Setting) {
    if (Setting) {                                                              //0000 : 07 26 00 2D 00 28 66 9E 19 
      mWindowStyle = mWindowStyle & ~Class'GUI_BaseDesktop'.2;                  //0009 : 0F 01 70 61 9E 19 9C 01 70 61 9E 19 8D 12 20 00 68 D7 00 02 00 04 2C 02 16 16 
    } else {                                                                    //0023 : 06 3E 00 
      mWindowStyle = mWindowStyle | Class'GUI_BaseDesktop'.2;                   //0026 : 0F 01 70 61 9E 19 9E 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 
    }
    mTitleBar.EnableMinimize((mWindowStyle & Class'GUI_BaseDesktop'.2) == 0);   //003E : 19 01 D8 63 9E 19 1B 00 00 1B BE 96 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 16 
    UpdateMenuItems();                                                          //0062 : 1B 63 97 00 00 16 
    //07 26 00 2D 00 28 66 9E 19 0F 01 70 61 9E 19 9C 01 70 61 9E 19 8D 12 20 00 68 D7 00 02 00 04 2C 
    //02 16 16 06 3E 00 0F 01 70 61 9E 19 9E 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 19 01 
    //D8 63 9E 19 1B 00 00 1B BE 96 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 
    //16 16 1B 63 97 00 00 16 04 0B 47 
  }


  native function SetIcon(string imageBaseName,optional string texturePackages,optional string imageSet);


  native function SetTitle(string NewTitle);


  native function Resize(float newWidth,float NewHeight);


  native function Move(float newX,float newY);


  function SetDockingStyle(int dockingSytle) {
    mWindowStyle = mWindowStyle | dockingSytle;                                 //0000 : 0F 01 70 61 9E 19 9E 01 70 61 9E 19 00 78 6F 9E 19 16 
    //0F 01 70 61 9E 19 9E 01 70 61 9E 19 00 78 6F 9E 19 16 04 0B 47 
  }


  native function float GetClientHeight();


  native function float GetClientWidth();


  event OnEndMoving();


  function OnUpdate(optional int intParam,optional Object objParam,optional string stringParam,optional int intParam2);


  function int GetWindowHandle() {
    return mWindowHandle;                                                       //0000 : 04 01 E8 77 9E 19 
    //04 01 E8 77 9E 19 04 0B 47 
  }


  native function Restore();


  native function Minimize();


  native function Maximize();


  event DoShowWindow(int flags) {
    if ((mWindowStyle & 1) != 0) {                                              //0000 : 07 64 00 9B 9C 01 70 61 9E 19 26 16 25 16 
      switch (flags) {                                                          //000E : 05 04 00 B0 7B 9E 19 
        case 1 :                                                                //0015 : 0A 39 00 26 
          mDesktop.PlaySound(Class'GUI_Sounds'.default.WindowOpen);             //0019 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 20 82 9E 19 16 
          break;                                                                //0036 : 06 64 00 
        case 2 :                                                                //0039 : 0A 5E 00 2C 02 
          mDesktop.PlaySound(Class'GUI_Sounds'.default.WindowClose);            //003E : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 98 82 9E 19 16 
          break;                                                                //005B : 06 64 00 
        default:                                                                //005E : 0A FF FF 
          break;                                                                //0061 : 06 64 00 
      }
    }
    //07 64 00 9B 9C 01 70 61 9E 19 26 16 25 16 05 04 00 B0 7B 9E 19 0A 39 00 26 19 01 48 0C 9D 19 14 
    //00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 20 82 9E 19 16 06 64 00 0A 5E 00 2C 02 19 01 
    //48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 98 82 9E 19 16 06 64 00 0A FF 
    //FF 06 64 00 04 0B 47 
  }


  native function ToggleContextMenu(GUI_Component aClickedButton);


  function GUI_Component GetLastFocusedComponent() {
    return mFocusedComponent;                                                   //0000 : 04 01 D0 85 9E 19 
    //04 01 D0 85 9E 19 04 0B 47 
  }


  function bool IsFocused() {
    return mDesktop.GetFocusedWindow() == self;                                 //0000 : 04 72 19 01 48 0C 9D 19 06 00 04 1C A8 06 89 19 16 17 16 
    //04 72 19 01 48 0C 9D 19 06 00 04 1C A8 06 89 19 16 17 16 04 0B 47 
  }


  function bool TitleBarClickHandler(GUI_Button clickedButton) {
    if (clickedButton.mIntTag == 0) {                                           //0000 : 07 1D 00 9A 19 00 68 88 9E 19 05 00 04 01 58 90 31 16 25 16 
      TryCloseWindow();                                                         //0014 : 1B 5E 97 00 00 16 
    } else {                                                                    //001A : 06 63 00 
      if (clickedButton.mIntTag == 1) {                                         //001D : 07 63 00 9A 19 00 68 88 9E 19 05 00 04 01 58 90 31 16 26 16 
        if ((mWindowStyle & Class'GUI_BaseDesktop'.2) == 0) {                   //0031 : 07 63 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 
          if (!mMinimized) {                                                    //0049 : 07 5D 00 81 2D 01 98 89 9E 19 16 
            Minimize();                                                         //0054 : 1B 78 9B 00 00 16 
          } else {                                                              //005A : 06 63 00 
            Restore();                                                          //005D : 1B 77 9B 00 00 16 
          }
        }
      }
    }
    return True;                                                                //0063 : 04 27 
    //07 1D 00 9A 19 00 68 88 9E 19 05 00 04 01 58 90 31 16 25 16 1B 5E 97 00 00 16 06 63 00 07 63 00 
    //9A 19 00 68 88 9E 19 05 00 04 01 58 90 31 16 26 16 07 63 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 
    //00 02 00 04 2C 02 16 25 16 07 5D 00 81 2D 01 98 89 9E 19 16 1B 78 9B 00 00 16 06 63 00 1B 77 9B 
    //00 00 16 04 27 04 0B 47 
  }


  event bool TryCloseWindow() {
    local bool handleCancel;
    handleCancel = False;                                                       //0000 : 14 2D 00 68 8C 9E 19 28 
    if ((mWindowStyle & 32) != 0) {                                             //0008 : 07 1F 00 9B 9C 01 70 61 9E 19 2C 20 16 25 16 
      handleCancel = True;                                                      //0017 : 14 2D 00 68 8C 9E 19 27 
    }
    if ((mWindowStyle & 4096) == 0) {                                           //001F : 07 5B 00 9A 9C 01 70 61 9E 19 1D 00 10 00 00 16 25 16 
      mDesktop.ShowWindow(mWindowHandle,Class'GUI_BaseDesktop'.2);              //0031 : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 
      OnWindowClosed(self);                                                     //0050 : 43 E0 8C 9E 19 2E 97 00 00 17 16 
    }
    return handleCancel;                                                        //005B : 04 2D 00 68 8C 9E 19 
    //14 2D 00 68 8C 9E 19 28 07 1F 00 9B 9C 01 70 61 9E 19 2C 20 16 25 16 14 2D 00 68 8C 9E 19 27 07 
    //5B 00 9A 9C 01 70 61 9E 19 1D 00 10 00 00 16 25 16 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 
    //E8 77 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 43 E0 8C 9E 19 2E 97 00 00 17 16 04 2D 00 68 8C 
    //9E 19 04 0B 47 
  }


  function bool CloseMenuItemHandler(GUI_Component aClickedComponent) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    TryCloseWindow();                                                           //000F : 1B 5E 97 00 00 16 
    return True;                                                                //0015 : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 1B 5E 97 00 00 16 04 27 04 0B 47 
  }


  function bool AutoplaceMenuItemHandler(GUI_TextButton clickedButton,bool checkState) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    if (checkState) {                                                           //000F : 07 2B 00 2D 00 F0 90 9E 19 
      mDesktop.StartAutoWindow(self);                                           //0018 : 19 01 48 0C 9D 19 07 00 00 1B 2A 99 00 00 17 16 
    } else {                                                                    //0028 : 06 3B 00 
      mDesktop.StopAutoWindow(self);                                            //002B : 19 01 48 0C 9D 19 07 00 00 1B 10 9A 00 00 17 16 
    }
    return True;                                                                //003B : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 07 2B 00 2D 00 F0 90 9E 19 19 01 48 0C 9D 19 07 00 
    //00 1B 2A 99 00 00 17 16 06 3B 00 19 01 48 0C 9D 19 07 00 00 1B 10 9A 00 00 17 16 04 27 04 0B 47 
    //
  }


  function bool ChangeTransparencySetting(GUI_TextButton aButton) {
    if (aButton.mChecked) {                                                     //0000 : 07 99 00 19 00 90 92 9E 19 06 00 04 2D 01 08 93 9E 19 
      switch (aButton.mIntTag) {                                                //0012 : 05 04 19 00 90 92 9E 19 05 00 04 01 58 90 31 16 
        case 0 :                                                                //0022 : 0A 3D 00 25 
          mDesktop.WindowBackgroundAlpha = 1.00000000;                          //0026 : 0F 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 80 3F 
          break;                                                                //003A : 06 93 00 
        case 1 :                                                                //003D : 0A 58 00 26 
          mDesktop.WindowBackgroundAlpha = 0.75000000;                          //0041 : 0F 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 40 3F 
          break;                                                                //0055 : 06 93 00 
        case 2 :                                                                //0058 : 0A 74 00 2C 02 
          mDesktop.WindowBackgroundAlpha = 0.50000000;                          //005D : 0F 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 00 3F 
          break;                                                                //0071 : 06 93 00 
        case 3 :                                                                //0074 : 0A 90 00 2C 03 
          mDesktop.WindowBackgroundAlpha = 0.25000000;                          //0079 : 0F 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 80 3E 
          break;                                                                //008D : 06 93 00 
        default:                                                                //0090 : 0A FF FF 
      }
      UpdateMenuItems();                                                        //0093 : 1B 63 97 00 00 16 
    }
    return True;                                                                //0099 : 04 27 
    //07 99 00 19 00 90 92 9E 19 06 00 04 2D 01 08 93 9E 19 05 04 19 00 90 92 9E 19 05 00 04 01 58 90 
    //31 16 0A 3D 00 25 0F 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 80 3F 06 93 00 0A 58 00 
    //26 0F 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 40 3F 06 93 00 0A 74 00 2C 02 0F 19 01 
    //48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 00 3F 06 93 00 0A 90 00 2C 03 0F 19 01 48 0C 9D 19 
    //05 00 04 01 68 D2 97 19 1E 00 00 80 3E 06 93 00 0A FF FF 1B 63 97 00 00 16 04 27 04 0B 47 
  }


  event UpdateMenuItems() {
    if (mTransparencyMenu != None) {                                            //0000 : 07 A1 00 77 01 70 96 9E 19 2A 16 
      mTransparencyMenu.CheckButton(0,mDesktop.WindowBackgroundAlpha == 1.00000000);//000B : 19 01 70 96 9E 19 1C 00 00 1B 7A 98 00 00 25 B4 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 80 3F 16 16 
      mTransparencyMenu.CheckButton(1,mDesktop.WindowBackgroundAlpha == 0.75000000);//0030 : 19 01 70 96 9E 19 1C 00 00 1B 7A 98 00 00 26 B4 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 40 3F 16 16 
      mTransparencyMenu.CheckButton(2,mDesktop.WindowBackgroundAlpha == 0.50000000);//0055 : 19 01 70 96 9E 19 1D 00 00 1B 7A 98 00 00 2C 02 B4 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 00 3F 16 16 
      mTransparencyMenu.CheckButton(3,mDesktop.WindowBackgroundAlpha == 0.25000000);//007B : 19 01 70 96 9E 19 1D 00 00 1B 7A 98 00 00 2C 03 B4 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 80 3E 16 16 
    }
    if (mAutoplaceMenuItem != None) {                                           //00A1 : 07 FA 00 77 01 E8 96 9E 19 2A 16 
      mAutoplaceMenuItem.SetEnabled((mWindowStyle & 4096) == 0 && (mWindowStyle & 4) != 0);//00AC : 19 01 E8 96 9E 19 26 00 00 1B 5F 32 00 00 82 9A 9C 01 70 61 9E 19 1D 00 10 00 00 16 25 16 18 0D 00 9B 9C 01 70 61 9E 19 2C 04 16 25 16 16 16 
      mAutoplaceMenuItem.mChecked = (mWindowStyle & 8192) != 0;                 //00DB : 14 19 01 E8 96 9E 19 06 00 04 2D 01 08 93 9E 19 9B 9C 01 70 61 9E 19 1D 00 20 00 00 16 25 16 
    }
    if (mCloseMenuItem != None) {                                               //00FA : 07 2C 01 77 01 60 97 9E 19 2A 16 
      mCloseMenuItem.SetEnabled((mWindowStyle & Class'GUI_BaseDesktop'.4096) == 0);//0105 : 19 01 60 97 9E 19 1E 00 00 1B 5F 32 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 16 25 16 16 
    }
    //07 A1 00 77 01 70 96 9E 19 2A 16 19 01 70 96 9E 19 1C 00 00 1B 7A 98 00 00 25 B4 19 01 48 0C 9D 
    //19 05 00 04 01 68 D2 97 19 1E 00 00 80 3F 16 16 19 01 70 96 9E 19 1C 00 00 1B 7A 98 00 00 26 B4 
    //19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 40 3F 16 16 19 01 70 96 9E 19 1D 00 00 1B 7A 
    //98 00 00 2C 02 B4 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 00 3F 16 16 19 01 70 96 9E 
    //19 1D 00 00 1B 7A 98 00 00 2C 03 B4 19 01 48 0C 9D 19 05 00 04 01 68 D2 97 19 1E 00 00 80 3E 16 
    //16 07 FA 00 77 01 E8 96 9E 19 2A 16 19 01 E8 96 9E 19 26 00 00 1B 5F 32 00 00 82 9A 9C 01 70 61 
    //9E 19 1D 00 10 00 00 16 25 16 18 0D 00 9B 9C 01 70 61 9E 19 2C 04 16 25 16 16 16 14 19 01 E8 96 
    //9E 19 06 00 04 2D 01 08 93 9E 19 9B 9C 01 70 61 9E 19 1D 00 20 00 00 16 25 16 07 2C 01 77 01 60 
    //97 9E 19 2A 16 19 01 60 97 9E 19 1E 00 00 1B 5F 32 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 
    //05 00 04 1D 00 10 00 00 16 25 16 16 04 0B 47 
  }


  event InitializeMenu(GUI_Menu Menu) {
    local GUI_TextButton newMenuItem;
    newMenuItem = Menu.CreateSubMenu(Class'SBGuiStrings'.default.Transparency.Text,"GUI_Menu");//0000 : 0F 00 00 99 9E 19 19 00 88 98 9E 19 23 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 42 99 19 1F 47 55 49 5F 4D 65 6E 75 00 16 
    mTransparencyMenu = GUI_Menu(Menu.GetSubMenu(newMenuItem));                 //0032 : 0F 01 70 96 9E 19 2E 68 B8 2F 1D 19 00 88 98 9E 19 0B 00 04 1B 70 98 00 00 00 00 99 9E 19 16 
    mTransparencyMenu.__OnButtonChecked__Delegate = ChangeTransparencySetting;  //0051 : 45 19 01 70 96 9E 19 05 00 08 01 78 99 9E 19 44 89 9B 00 00 
    newMenuItem = mTransparencyMenu.CreateMenuCheckbox("75%",False);            //0065 : 0F 00 00 99 9E 19 19 01 70 96 9E 19 0C 00 04 1B 5B 98 00 00 1F 37 35 25 00 28 16 
    newMenuItem.mIntTag = 3;                                                    //0080 : 0F 19 00 00 99 9E 19 05 00 04 01 58 90 31 16 2C 03 
    newMenuItem = mTransparencyMenu.CreateMenuCheckbox("50%",False);            //0091 : 0F 00 00 99 9E 19 19 01 70 96 9E 19 0C 00 04 1B 5B 98 00 00 1F 35 30 25 00 28 16 
    newMenuItem.mIntTag = 2;                                                    //00AC : 0F 19 00 00 99 9E 19 05 00 04 01 58 90 31 16 2C 02 
    newMenuItem = mTransparencyMenu.CreateMenuCheckbox("25%",False);            //00BD : 0F 00 00 99 9E 19 19 01 70 96 9E 19 0C 00 04 1B 5B 98 00 00 1F 32 35 25 00 28 16 
    newMenuItem.mIntTag = 1;                                                    //00D8 : 0F 19 00 00 99 9E 19 05 00 04 01 58 90 31 16 26 
    newMenuItem = mTransparencyMenu.CreateMenuCheckbox("0%",False);             //00E8 : 0F 00 00 99 9E 19 19 01 70 96 9E 19 0B 00 04 1B 5B 98 00 00 1F 30 25 00 28 16 
    newMenuItem.mIntTag = 0;                                                    //0102 : 0F 19 00 00 99 9E 19 05 00 04 01 58 90 31 16 25 
    mAutoplaceMenuItem = Menu.CreateMenuCheckbox(Class'SBGuiStrings'.default.Autoplace.Text,(mWindowStyle & 8192) != 0);//0112 : 0F 01 E8 96 9E 19 19 00 88 98 9E 19 28 00 04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 42 99 19 9B 9C 01 70 61 9E 19 1D 00 20 00 00 16 25 16 16 
    mAutoplaceMenuItem.__OnCheck__Delegate = AutoplaceMenuItemHandler;          //0149 : 45 19 01 E8 96 9E 19 05 00 08 01 F0 99 9E 19 44 87 9B 00 00 
    mCloseMenuItem = Menu.CreateMenuItem(Class'SBGuiStrings'.default.Close.Text);//015D : 0F 01 60 97 9E 19 19 00 88 98 9E 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 A6 98 19 16 
    mCloseMenuItem.__OnClick__Delegate = CloseMenuItemHandler;                  //0185 : 45 19 01 60 97 9E 19 05 00 08 01 98 EB 9D 19 44 7F 9B 00 00 
    //0F 00 00 99 9E 19 19 00 88 98 9E 19 23 00 04 1B 76 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 
    //00 0C 02 30 42 99 19 1F 47 55 49 5F 4D 65 6E 75 00 16 0F 01 70 96 9E 19 2E 68 B8 2F 1D 19 00 88 
    //98 9E 19 0B 00 04 1B 70 98 00 00 00 00 99 9E 19 16 45 19 01 70 96 9E 19 05 00 08 01 78 99 9E 19 
    //44 89 9B 00 00 0F 00 00 99 9E 19 19 01 70 96 9E 19 0C 00 04 1B 5B 98 00 00 1F 37 35 25 00 28 16 
    //0F 19 00 00 99 9E 19 05 00 04 01 58 90 31 16 2C 03 0F 00 00 99 9E 19 19 01 70 96 9E 19 0C 00 04 
    //1B 5B 98 00 00 1F 35 30 25 00 28 16 0F 19 00 00 99 9E 19 05 00 04 01 58 90 31 16 2C 02 0F 00 00 
    //99 9E 19 19 01 70 96 9E 19 0C 00 04 1B 5B 98 00 00 1F 32 35 25 00 28 16 0F 19 00 00 99 9E 19 05 
    //00 04 01 58 90 31 16 26 0F 00 00 99 9E 19 19 01 70 96 9E 19 0B 00 04 1B 5B 98 00 00 1F 30 25 00 
    //28 16 0F 19 00 00 99 9E 19 05 00 04 01 58 90 31 16 25 0F 01 E8 96 9E 19 19 00 88 98 9E 19 28 00 
    //04 1B 5B 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 42 99 19 9B 9C 01 70 61 9E 19 
    //1D 00 20 00 00 16 25 16 16 45 19 01 E8 96 9E 19 05 00 08 01 F0 99 9E 19 44 87 9B 00 00 0F 01 60 
    //97 9E 19 19 00 88 98 9E 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //48 A6 98 19 16 45 19 01 60 97 9E 19 05 00 08 01 98 EB 9D 19 44 7F 9B 00 00 04 0B 47 
  }


  event Flush() {
    mSystemMenu = None;                                                         //0000 : 0F 01 70 9B 9E 19 2A 
    mTransparencyMenu = None;                                                   //0007 : 0F 01 70 96 9E 19 2A 
    mAutoplaceMenuItem = None;                                                  //000E : 0F 01 E8 96 9E 19 2A 
    mCloseMenuItem = None;                                                      //0015 : 0F 01 60 97 9E 19 2A 
    //0F 01 70 9B 9E 19 2A 0F 01 70 96 9E 19 2A 0F 01 E8 96 9E 19 2A 0F 01 60 97 9E 19 2A 04 0B 47 
  }


  event delegate OnWindowClosed(GUI_Window aWindow);


  function Invalidate() {
    Super.Invalidate();                                                         //0000 : 1C 60 D6 9D 19 16 
    //1C 60 D6 9D 19 16 04 0B 47 
  }


  function SetBorder(int offsetX,int offsetY,int offsetW,int offsetH,optional string imageBaseName,optional string texturePackages,optional string imageSet) {
    if ((mWindowStyle & Class'GUI_BaseDesktop'.1024) != 0) {                    //0000 : 07 3F 00 9B 9C 01 70 61 9E 19 12 20 00 68 D7 00 05 00 04 1D 00 04 00 00 16 25 16 
      offsetX += 11;                                                            //001B : A1 00 D8 9E 9E 19 2C 0B 16 
      offsetY += 11;                                                            //0024 : A1 00 50 9F 9E 19 2C 0B 16 
      offsetW += 11;                                                            //002D : A1 00 C8 50 A1 19 2C 0B 16 
      offsetH += 11;                                                            //0036 : A1 00 40 51 A1 19 2C 0B 16 
    }
    Super.SetBorder(offsetX,offsetY,offsetW,offsetH,imageBaseName,texturePackages,imageSet);//003F : 1C 28 6A 9D 19 00 D8 9E 9E 19 00 50 9F 9E 19 00 C8 50 A1 19 00 40 51 A1 19 00 B8 51 A1 19 00 30 52 A1 19 00 A8 52 A1 19 16 
    //07 3F 00 9B 9C 01 70 61 9E 19 12 20 00 68 D7 00 05 00 04 1D 00 04 00 00 16 25 16 A1 00 D8 9E 9E 
    //19 2C 0B 16 A1 00 50 9F 9E 19 2C 0B 16 A1 00 C8 50 A1 19 2C 0B 16 A1 00 40 51 A1 19 2C 0B 16 1C 
    //28 6A 9D 19 00 D8 9E 9E 19 00 50 9F 9E 19 00 C8 50 A1 19 00 40 51 A1 19 00 B8 51 A1 19 00 30 52 
    //A1 19 00 A8 52 A1 19 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    if ((mWindowStyle & Class'GUI_BaseDesktop'.1) != 0) {                       //0006 : 07 6B 01 9B 9C 01 70 61 9E 19 12 20 00 68 D7 00 01 00 04 26 16 25 16 
      if (mBackgroundType == Class'GUI_BaseDesktop'.0
        && (mWindowStyle & Class'GUI_BaseDesktop'.2048) == 0) {//001D : 07 5F 00 82 9A 01 B0 83 31 16 12 20 00 68 D7 00 01 00 04 25 16 18 19 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 05 00 04 1D 00 08 00 00 16 25 16 16 
        SetStdBackground(Class'GUI_BaseDesktop'.4);                             //004E : 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 2C 04 16 
      }
      mTitleBar = GUI_TitleBar(CreatePage("GUI_TitleBar",Class'GUI_BaseDesktop'.2048 | Class'GUI_BaseDesktop'.1024,0,0,0,mWidth,0));//005F : 0F 01 D8 63 9E 19 2E 38 3F 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 69 74 6C 65 42 61 72 00 9E 12 20 00 68 D7 00 05 00 04 1D 00 08 00 00 12 20 00 68 D7 00 05 00 04 1D 00 04 00 00 16 25 25 25 39 44 01 60 87 31 16 25 16 
      mTitleBar.SetTitle(mWindowTitle);                                         //00A7 : 19 01 D8 63 9E 19 0B 00 00 1B 0A 2C 00 00 01 20 53 A1 19 16 
      mTitleBar.SetWindow(self);                                                //00BB : 19 01 D8 63 9E 19 07 00 00 1B 57 97 00 00 17 16 
      mTitleBar.__OnCloseClick__Delegate = TitleBarClickHandler;                //00CB : 45 19 01 D8 63 9E 19 05 00 08 01 98 53 A1 19 44 7D 9B 00 00 
      mTitleBar.EnableMinimize((mWindowStyle & Class'GUI_BaseDesktop'.2) == 0); //00DF : 19 01 D8 63 9E 19 1B 00 00 1B BE 96 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 25 16 16 
      mTitleBar.EnableClose((mWindowStyle & Class'GUI_BaseDesktop'.4096) == 0); //0103 : 19 01 D8 63 9E 19 1E 00 00 1B BD 96 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 05 00 04 1D 00 10 00 00 16 25 16 16 
      mTitleBar.EnableMove((mWindowStyle & Class'GUI_BaseDesktop'.65536) == 0
        && (mWindowStyle & Class'GUI_BaseDesktop'.4) != 0);//012A : 19 01 D8 63 9E 19 38 00 00 1B BF 96 00 00 82 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 05 00 04 1D 00 00 01 00 16 25 16 18 16 00 9B 9C 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 04 16 25 16 16 16 
    }
    //1C 40 5B 9E 19 16 07 6B 01 9B 9C 01 70 61 9E 19 12 20 00 68 D7 00 01 00 04 26 16 25 16 07 5F 00 
    //82 9A 01 B0 83 31 16 12 20 00 68 D7 00 01 00 04 25 16 18 19 00 9A 9C 01 70 61 9E 19 12 20 00 68 
    //D7 00 05 00 04 1D 00 08 00 00 16 25 16 16 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 2C 04 16 0F 
    //01 D8 63 9E 19 2E 38 3F 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 69 74 6C 65 42 61 72 00 9E 12 20 
    //00 68 D7 00 05 00 04 1D 00 08 00 00 12 20 00 68 D7 00 05 00 04 1D 00 04 00 00 16 25 25 25 39 44 
    //01 60 87 31 16 25 16 19 01 D8 63 9E 19 0B 00 00 1B 0A 2C 00 00 01 20 53 A1 19 16 19 01 D8 63 9E 
    //19 07 00 00 1B 57 97 00 00 17 16 45 19 01 D8 63 9E 19 05 00 08 01 98 53 A1 19 44 7D 9B 00 00 19 
    //01 D8 63 9E 19 1B 00 00 1B BE 96 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 02 00 04 2C 02 16 
    //25 16 16 19 01 D8 63 9E 19 1E 00 00 1B BD 96 00 00 9A 9C 01 70 61 9E 19 12 20 00 68 D7 00 05 00 
    //04 1D 00 10 00 00 16 25 16 16 19 01 D8 63 9E 19 38 00 00 1B BF 96 00 00 82 9A 9C 01 70 61 9E 19 
    //12 20 00 68 D7 00 05 00 04 1D 00 00 01 00 16 25 16 18 16 00 9B 9C 01 70 61 9E 19 12 20 00 68 D7 
    //00 02 00 04 2C 04 16 25 16 16 16 04 0B 47 
  }



