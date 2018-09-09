//==============================================================================
//  GUI_Menu
//==============================================================================

class GUI_Menu extends GUI_ContextWindow
    native
    dependsOn()
    Transient
    Config(User)
  ;

  var float mYOffset;
  var float mXOffset;
  var bool mIsRoot;
  var (null);
  var private int mMenuData;


  function bool ItemSelected(GUI_TextButton Button) {
    CloseMenu();                                                                //0000 : 1B D0 2B 00 00 16 
    return False;                                                               //0006 : 04 28 
    //1B D0 2B 00 00 16 04 28 04 0B 47 
  }


  delegate bool OnButtonChecked(GUI_TextButton aButton) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  function ButtonChecked(GUI_TextButton aButton,bool isChecked) {
    OnButtonChecked(aButton);                                                   //0000 : 43 78 99 9E 19 D7 96 00 00 00 E8 0A A5 19 16 
    //43 78 99 9E 19 D7 96 00 00 00 E8 0A A5 19 16 04 0B 47 
  }


  function bool OpenSubmenu(GUI_Component aComponent) {
    local GUI_Component subMenu;
    local float X;
    local float Y;
    local float W;
    local float H;
    if (mWatchedChild != None) {                                                //0000 : 07 94 00 77 01 B8 DC A2 19 2A 16 
      if (mWatchedChild.IsA('GUI_ContextWindow')) {                             //000B : 07 4B 00 19 01 B8 DC A2 19 08 00 04 61 2F 21 A1 97 00 00 16 
        GUI_ContextWindow(mWatchedChild).CloseMenu();                           //001F : 19 2E 28 9E 2F 1D 01 B8 DC A2 19 06 00 00 1B D0 2B 00 00 16 
        GUI_ContextWindow(mWatchedChild).mWatchedComponent = None;              //0033 : 0F 19 2E 28 9E 2F 1D 01 B8 DC A2 19 05 00 04 01 58 DD A2 19 2A 
      } else {                                                                  //0048 : 06 8D 00 
        if (mWatchedChild.IsA('GUI_Window')) {                                  //004B : 07 7D 00 19 01 B8 DC A2 19 08 00 04 61 2F 21 6E 97 00 00 16 
          mDesktop.ShowGUIWindow(GUI_Window(mWatchedChild),2);                  //005F : 19 01 48 0C 9D 19 12 00 00 1B 51 98 00 00 2E 38 EB 2E 1D 01 B8 DC A2 19 2C 02 16 
        } else {                                                                //007A : 06 8D 00 
          mWatchedChild.SetVisible(False);                                      //007D : 19 01 B8 DC A2 19 07 00 00 1B 14 98 00 00 28 16 
        }
      }
      mWatchedChild = None;                                                     //008D : 0F 01 B8 DC A2 19 2A 
    }
    subMenu = GetSubMenu(GUI_TextButton(aComponent));                           //0094 : 0F 00 48 84 A5 19 1B 70 98 00 00 2E F8 39 2F 1D 00 E0 7F A5 19 16 
    if (subMenu != None) {                                                      //00AA : 07 B9 02 77 00 48 84 A5 19 2A 16 
      mWatchedChild = subMenu;                                                  //00B5 : 0F 01 B8 DC A2 19 00 48 84 A5 19 
      aComponent.GetWindowRect(X,Y,W,H);                                        //00C0 : 19 00 E0 7F A5 19 1A 00 00 1B 6B 99 00 00 00 C0 84 A5 19 00 38 85 A5 19 00 B0 85 A5 19 00 28 86 A5 19 16 
      if (Y > mDesktop.GetScreenHeight() / 2.00000000) {                        //00E3 : 07 4B 01 B1 00 38 85 A5 19 AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 1E 00 00 00 40 16 16 
        mWatchedChild.mTop = Max(0,Y + aComponent.mHeight - mWatchedChild.mHeight - 8);//0103 : 0F 19 01 B8 DC A2 19 05 00 04 01 80 86 31 16 39 3F FA 25 39 44 AF 39 3F 39 44 AE 00 38 85 A5 19 19 00 E0 7F A5 19 05 00 04 01 40 88 31 16 16 AF 19 01 B8 DC A2 19 05 00 04 01 40 88 31 16 39 3F 2C 08 16 16 16 
      } else {                                                                  //0148 : 06 6C 01 
        mWatchedChild.mTop = Max(0,Y - 3);                                      //014B : 0F 19 01 B8 DC A2 19 05 00 04 01 80 86 31 16 39 3F FA 25 39 44 AF 00 38 85 A5 19 39 3F 2C 03 16 16 
      }
      if (aComponent.mLeft > mDesktop.GetScreenWidth() / 2.00000000) {          //016C : 07 C3 01 B1 19 00 E0 7F A5 19 05 00 04 01 08 86 31 16 AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 1E 00 00 00 40 16 16 
        mWatchedChild.mLeft = Max(0,X - mWatchedChild.mWidth);                  //0195 : 0F 19 01 B8 DC A2 19 05 00 04 01 08 86 31 16 39 3F FA 25 39 44 AF 00 C0 84 A5 19 19 01 B8 DC A2 19 05 00 04 01 60 87 31 16 16 16 
      } else {                                                                  //01C0 : 06 14 02 
        mWatchedChild.mLeft = Min(mDesktop.GetScreenWidth() - mWatchedChild.mWidth,X + aComponent.mWidth - 2);//01C3 : 0F 19 01 B8 DC A2 19 05 00 04 01 08 86 31 16 39 3F F9 39 44 AF 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 19 01 B8 DC A2 19 05 00 04 01 60 87 31 16 16 39 44 AF AE 00 C0 84 A5 19 19 00 E0 7F A5 19 05 00 04 01 60 87 31 16 16 39 3F 2C 02 16 16 
      }
      if (mWatchedChild.IsA('GUI_Window')) {                                    //0214 : 07 45 02 19 01 B8 DC A2 19 08 00 04 61 2F 21 6E 97 00 00 16 
        mDesktop.ShowGUIWindow(GUI_Window(mWatchedChild),1);                    //0228 : 19 01 48 0C 9D 19 11 00 00 1B 51 98 00 00 2E 38 EB 2E 1D 01 B8 DC A2 19 26 16 
      } else {                                                                  //0242 : 06 55 02 
        mWatchedChild.SetVisible(True);                                         //0245 : 19 01 B8 DC A2 19 07 00 00 1B 14 98 00 00 27 16 
      }
      if (mWatchedChild.IsA('GUI_Menu')) {                                      //0255 : 07 9A 02 19 01 B8 DC A2 19 08 00 04 61 2F 21 D9 97 00 00 16 
        GUI_Menu(mWatchedChild).mWatchedComponent = self;                       //0269 : 0F 19 2E 68 B8 2F 1D 01 B8 DC A2 19 05 00 04 01 58 DD A2 19 17 
        mDesktop.FocusWindow(GUI_Menu(mWatchedChild));                          //027E : 19 01 48 0C 9D 19 10 00 00 1B F3 11 00 00 2E 68 B8 2F 1D 01 B8 DC A2 19 16 
      } else {                                                                  //0297 : 06 AE 02 
        mDesktop.FocusComponent(mWatchedChild);                                 //029A : 19 01 48 0C 9D 19 0B 00 00 1B 89 98 00 00 01 B8 DC A2 19 16 
      }
      BringToTop(mWatchedChild);                                                //02AE : 1B 3E 98 00 00 01 B8 DC A2 19 16 
    }
    return True;                                                                //02B9 : 04 27 
    //07 94 00 77 01 B8 DC A2 19 2A 16 07 4B 00 19 01 B8 DC A2 19 08 00 04 61 2F 21 A1 97 00 00 16 19 
    //2E 28 9E 2F 1D 01 B8 DC A2 19 06 00 00 1B D0 2B 00 00 16 0F 19 2E 28 9E 2F 1D 01 B8 DC A2 19 05 
    //00 04 01 58 DD A2 19 2A 06 8D 00 07 7D 00 19 01 B8 DC A2 19 08 00 04 61 2F 21 6E 97 00 00 16 19 
    //01 48 0C 9D 19 12 00 00 1B 51 98 00 00 2E 38 EB 2E 1D 01 B8 DC A2 19 2C 02 16 06 8D 00 19 01 B8 
    //DC A2 19 07 00 00 1B 14 98 00 00 28 16 0F 01 B8 DC A2 19 2A 0F 00 48 84 A5 19 1B 70 98 00 00 2E 
    //F8 39 2F 1D 00 E0 7F A5 19 16 07 B9 02 77 00 48 84 A5 19 2A 16 0F 01 B8 DC A2 19 00 48 84 A5 19 
    //19 00 E0 7F A5 19 1A 00 00 1B 6B 99 00 00 00 C0 84 A5 19 00 38 85 A5 19 00 B0 85 A5 19 00 28 86 
    //A5 19 16 07 4B 01 B1 00 38 85 A5 19 AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 1E 00 00 00 
    //40 16 16 0F 19 01 B8 DC A2 19 05 00 04 01 80 86 31 16 39 3F FA 25 39 44 AF 39 3F 39 44 AE 00 38 
    //85 A5 19 19 00 E0 7F A5 19 05 00 04 01 40 88 31 16 16 AF 19 01 B8 DC A2 19 05 00 04 01 40 88 31 
    //16 39 3F 2C 08 16 16 16 06 6C 01 0F 19 01 B8 DC A2 19 05 00 04 01 80 86 31 16 39 3F FA 25 39 44 
    //AF 00 38 85 A5 19 39 3F 2C 03 16 16 07 C3 01 B1 19 00 E0 7F A5 19 05 00 04 01 08 86 31 16 AC 19 
    //01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 1E 00 00 00 40 16 16 0F 19 01 B8 DC A2 19 05 00 04 01 
    //08 86 31 16 39 3F FA 25 39 44 AF 00 C0 84 A5 19 19 01 B8 DC A2 19 05 00 04 01 60 87 31 16 16 16 
    //06 14 02 0F 19 01 B8 DC A2 19 05 00 04 01 08 86 31 16 39 3F F9 39 44 AF 19 01 48 0C 9D 19 06 00 
    //04 1B 31 98 00 00 16 19 01 B8 DC A2 19 05 00 04 01 60 87 31 16 16 39 44 AF AE 00 C0 84 A5 19 19 
    //00 E0 7F A5 19 05 00 04 01 60 87 31 16 16 39 3F 2C 02 16 16 07 45 02 19 01 B8 DC A2 19 08 00 04 
    //61 2F 21 6E 97 00 00 16 19 01 48 0C 9D 19 11 00 00 1B 51 98 00 00 2E 38 EB 2E 1D 01 B8 DC A2 19 
    //26 16 06 55 02 19 01 B8 DC A2 19 07 00 00 1B 14 98 00 00 27 16 07 9A 02 19 01 B8 DC A2 19 08 00 
    //04 61 2F 21 D9 97 00 00 16 0F 19 2E 68 B8 2F 1D 01 B8 DC A2 19 05 00 04 01 58 DD A2 19 17 19 01 
    //48 0C 9D 19 10 00 00 1B F3 11 00 00 2E 68 B8 2F 1D 01 B8 DC A2 19 16 06 AE 02 19 01 48 0C 9D 19 
    //0B 00 00 1B 89 98 00 00 01 B8 DC A2 19 16 1B 3E 98 00 00 01 B8 DC A2 19 16 04 27 04 0B 47 
  }


  function Initialize() {
    Super.Initialize();                                                         //0000 : 1C 18 DB A2 19 16 
    __OnHilite__Delegate = OpenSubmenu;                                         //0006 : 45 01 E8 E6 9D 19 44 7B 9A 00 00 
    //1C 18 DB A2 19 16 45 01 E8 E6 9D 19 44 7B 9A 00 00 04 0B 47 
  }


  native function CheckButton(int Index,bool newSetting);


  native function GUI_TextButton CreateMenuCheckbox(string menuItemName,bool isChecked);


  native function GUI_Window GetSubMenu(GUI_TextButton aButton);


  native function GUI_TextButton CreateSubMenu(string menuItemName,string menuClass,optional string menuSpecification);


  native function GUI_TextButton CreateMenuItem(string menuItemName);



