//==============================================================================
//  GUI_TitleBar
//==============================================================================

class GUI_TitleBar extends GUI_Page
    native
    dependsOn(GUI_Label,GUI_Button,GUI_Window)
    Transient
    Config(User)
  ;

  var GUI_Button mSystemButton;
  var GUI_Label mTitleLabel;
  var GUI_Button mCloseButton;
  var GUI_Button mMaximizeButton;
  var GUI_Button mMinimizeButton;
  var GUI_Button mRestoreButton;
  var GUI_Window mWindow;
  var private GUI_Image mWindowHeaderFrame;
  var private GUI_Image mOrnamentLeft;
  var private GUI_Image mOrnamentRight;
  var (null);


  event EnableMove(bool Setting) {
    if (Setting) {                                                              //0000 : 07 1A 00 2D 00 D8 4E A7 19 
      mMouseOverCursor = 1;                                                     //0009 : 0F 01 20 7D 9D 19 26 
      mMouseDownCursor = 1;                                                     //0010 : 0F 01 A0 E3 9D 19 26 
    } else {                                                                    //0017 : 06 28 00 
      mMouseOverCursor = 0;                                                     //001A : 0F 01 20 7D 9D 19 25 
      mMouseDownCursor = 0;                                                     //0021 : 0F 01 A0 E3 9D 19 25 
    }
    if (mTitleLabel != None) {                                                  //0028 : 07 7F 00 77 01 50 4F A7 19 2A 16 
      if (Setting) {                                                            //0033 : 07 5F 00 2D 00 D8 4E A7 19 
        mTitleLabel.mMouseOverCursor = 1;                                       //003C : 0F 19 01 50 4F A7 19 05 00 04 01 20 7D 9D 19 26 
        mTitleLabel.mMouseDownCursor = 1;                                       //004C : 0F 19 01 50 4F A7 19 05 00 04 01 A0 E3 9D 19 26 
      } else {                                                                  //005C : 06 7F 00 
        mTitleLabel.mMouseOverCursor = 0;                                       //005F : 0F 19 01 50 4F A7 19 05 00 04 01 20 7D 9D 19 25 
        mTitleLabel.mMouseDownCursor = 0;                                       //006F : 0F 19 01 50 4F A7 19 05 00 04 01 A0 E3 9D 19 25 
      }
    }
    //07 1A 00 2D 00 D8 4E A7 19 0F 01 20 7D 9D 19 26 0F 01 A0 E3 9D 19 26 06 28 00 0F 01 20 7D 9D 19 
    //25 0F 01 A0 E3 9D 19 25 07 7F 00 77 01 50 4F A7 19 2A 16 07 5F 00 2D 00 D8 4E A7 19 0F 19 01 50 
    //4F A7 19 05 00 04 01 20 7D 9D 19 26 0F 19 01 50 4F A7 19 05 00 04 01 A0 E3 9D 19 26 06 7F 00 0F 
    //19 01 50 4F A7 19 05 00 04 01 20 7D 9D 19 25 0F 19 01 50 4F A7 19 05 00 04 01 A0 E3 9D 19 25 04 
    //0B 47 
  }


  event EnableClose(bool Setting) {
    if (mCloseButton != None) {                                                 //0000 : 07 20 00 77 01 C0 51 A7 19 2A 16 
      mCloseButton.SetVisible(Setting);                                         //000B : 19 01 C0 51 A7 19 0C 00 00 1B 14 98 00 00 2D 00 78 50 A7 19 16 
    }
    if (Setting) {                                                              //0020 : 07 46 00 2D 00 78 50 A7 19 
      mTitleLabel.mWidth = mWidth - 56;                                         //0029 : 0F 19 01 50 4F A7 19 05 00 04 01 60 87 31 16 AF 01 60 87 31 16 39 3F 2C 38 16 
    } else {                                                                    //0043 : 06 66 00 
      mTitleLabel.mWidth = mWidth - 56 + 22;                                    //0046 : 0F 19 01 50 4F A7 19 05 00 04 01 60 87 31 16 AE AF 01 60 87 31 16 39 3F 2C 38 16 39 3F 2C 16 16 
    }
    mTitleLabel.Invalidate();                                                   //0066 : 19 01 50 4F A7 19 06 00 00 1B 1D 98 00 00 16 
    //07 20 00 77 01 C0 51 A7 19 2A 16 19 01 C0 51 A7 19 0C 00 00 1B 14 98 00 00 2D 00 78 50 A7 19 16 
    //07 46 00 2D 00 78 50 A7 19 0F 19 01 50 4F A7 19 05 00 04 01 60 87 31 16 AF 01 60 87 31 16 39 3F 
    //2C 38 16 06 66 00 0F 19 01 50 4F A7 19 05 00 04 01 60 87 31 16 AE AF 01 60 87 31 16 39 3F 2C 38 
    //16 39 3F 2C 16 16 19 01 50 4F A7 19 06 00 00 1B 1D 98 00 00 16 04 0B 47 
  }


  event EnableMinimize(bool Setting) {
    if (mMinimizeButton != None) {                                              //0000 : 07 20 00 77 01 B8 53 A7 19 2A 16 
      mMinimizeButton.SetVisible(Setting);                                      //000B : 19 01 B8 53 A7 19 0C 00 00 1B 14 98 00 00 2D 00 E8 52 A7 19 16 
    }
    //07 20 00 77 01 B8 53 A7 19 2A 16 19 01 B8 53 A7 19 0C 00 00 1B 14 98 00 00 2D 00 E8 52 A7 19 16 
    //04 0B 47 
  }


  function bool SystemClickHandler(GUI_Component clickedButton) {
    if (mWindow != None) {                                                      //0000 : 07 1F 00 77 01 B8 55 A7 19 2A 16 
      mWindow.ToggleContextMenu(clickedButton);                                 //000B : 19 01 B8 55 A7 19 0B 00 00 1B 6F 98 00 00 00 E0 54 A7 19 16 
    }
    return True;                                                                //001F : 04 27 
    //07 1F 00 77 01 B8 55 A7 19 2A 16 19 01 B8 55 A7 19 0B 00 00 1B 6F 98 00 00 00 E0 54 A7 19 16 04 
    //27 04 0B 47 
  }


  function bool CloseClickHandler(GUI_Component clickedButton) {
    OnCloseClick(GUI_Button(clickedButton));                                    //0000 : 43 98 53 A1 19 DF 96 00 00 2E 78 F0 2E 1D 00 58 57 A7 19 16 
    return True;                                                                //0014 : 04 27 
    //43 98 53 A1 19 DF 96 00 00 2E 78 F0 2E 1D 00 58 57 A7 19 16 04 27 04 0B 47 
  }


  native function SetIcon(string imageBaseName,optional string texturePackages,optional string imageSet);


  native function SetTitle(string Text);


  event SetWindow(GUI_Window aWindow) {
    mWindow = aWindow;                                                          //0000 : 0F 01 B8 55 A7 19 00 00 5D A7 19 
    //0F 01 B8 55 A7 19 00 00 5D A7 19 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    SetBackground("windowheader","SBGuiTX.GUI_Styles","GUI_Styles");            //0006 : 1B 1A 98 00 00 1F 77 69 6E 64 6F 77 68 65 61 64 65 72 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    SetAnchors(0.00000000,0.00000000,1.00000000,0.00000000);                    //003A : 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    mUseParentAlpha = False;                                                    //0054 : 14 2D 01 58 E0 9D 19 28 
    mSystemButton = CreateButton("GUI_IconButton",0,0,3,3,17,23);               //005C : 0F 01 38 62 A7 19 1B 18 98 00 00 1F 47 55 49 5F 49 63 6F 6E 42 75 74 74 6F 6E 00 25 25 2C 03 2C 03 2C 11 2C 17 16 
    mSystemButton.mIntTag = 2;                                                  //0082 : 0F 19 01 38 62 A7 19 05 00 04 01 58 90 31 16 2C 02 
    mSystemButton.__OnClick__Delegate = SystemClickHandler;                     //0093 : 45 19 01 38 62 A7 19 05 00 08 01 98 EB 9D 19 44 58 98 00 00 
    mSystemButton.SetContextMenuEnabled(True);                                  //00A7 : 19 01 38 62 A7 19 07 00 00 1B 77 98 00 00 27 16 
    mTitleLabel = CreateLabel("GUI_Label",524288,0,28,5,mWidth - 56,30);        //00B7 : 0F 01 50 4F A7 19 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 25 2C 1C 2C 05 39 44 AF 01 60 87 31 16 39 3F 2C 38 16 2C 1E 16 
    mTitleLabel.SetFont("SBFontsTX.Verdana12");                                 //00E7 : 19 01 50 4F A7 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 32 00 16 
    mTitleLabel.SetAnchors(0.00000000,0.00000000,1.00000000,0.00000000);        //010B : 19 01 50 4F A7 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    mCloseButton = CreateButton("GUI_Button",0,0,mWidth - 24,1,0,0);            //012E : 0F 01 C0 51 A7 19 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 39 44 AF 01 60 87 31 16 39 3F 2C 18 16 26 25 25 16 
    mCloseButton.SetBackground("close_button","SBGuiTX.GUI_Styles","GUI_Styles",6);//0158 : 19 01 C0 51 A7 19 36 00 00 1B 1A 98 00 00 1F 63 6C 6F 73 65 5F 62 75 74 74 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 2C 06 16 
    mCloseButton.mIntTag = 0;                                                   //0197 : 0F 19 01 C0 51 A7 19 05 00 04 01 58 90 31 16 25 
    mCloseButton.__OnClick__Delegate = CloseClickHandler;                       //01A7 : 45 19 01 C0 51 A7 19 05 00 08 01 98 EB 9D 19 44 2B 9B 00 00 
    mCloseButton.SetAnchors(1.00000000,0.00000000,1.00000000,0.00000000);       //01BB : 19 01 C0 51 A7 19 1A 00 00 1B 24 98 00 00 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    mWindowHeaderFrame = CreateImage("windowheaderframe","SBGuiTX.GUI_Styles","GUI_Styles");//01DE : 0F 01 B0 62 A7 19 1B 26 98 00 00 1F 77 69 6E 64 6F 77 68 65 61 64 65 72 66 72 61 6D 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mOrnamentLeft = CreateImage("windowheader_left","SBGuiTX.GUI_Styles","GUI_Styles");//021D : 0F 01 28 63 A7 19 1B 26 98 00 00 1F 77 69 6E 64 6F 77 68 65 61 64 65 72 5F 6C 65 66 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mOrnamentRight = CreateImage("windowheader_right","SBGuiTX.GUI_Styles","GUI_Styles");//025C : 0F 01 A0 63 A7 19 1B 26 98 00 00 1F 77 69 6E 64 6F 77 68 65 61 64 65 72 5F 72 69 67 68 74 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    Invalidate();                                                               //029C : 1B 1D 98 00 00 16 
    //1C 40 5B 9E 19 16 1B 1A 98 00 00 1F 77 69 6E 64 6F 77 68 65 61 64 65 72 00 1F 53 42 47 75 69 54 
    //58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 1B 24 98 00 00 1E 
    //00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 14 2D 01 58 E0 9D 19 28 0F 01 38 62 
    //A7 19 1B 18 98 00 00 1F 47 55 49 5F 49 63 6F 6E 42 75 74 74 6F 6E 00 25 25 2C 03 2C 03 2C 11 2C 
    //17 16 0F 19 01 38 62 A7 19 05 00 04 01 58 90 31 16 2C 02 45 19 01 38 62 A7 19 05 00 08 01 98 EB 
    //9D 19 44 58 98 00 00 19 01 38 62 A7 19 07 00 00 1B 77 98 00 00 27 16 0F 01 50 4F A7 19 1B 20 98 
    //00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 25 2C 1C 2C 05 39 44 AF 01 60 87 31 16 39 
    //3F 2C 38 16 2C 1E 16 19 01 50 4F A7 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 
    //56 65 72 64 61 6E 61 31 32 00 16 19 01 50 4F A7 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 
    //00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 0F 01 C0 51 A7 19 1B 18 98 00 00 1F 47 55 49 5F 42 75 
    //74 74 6F 6E 00 25 25 39 44 AF 01 60 87 31 16 39 3F 2C 18 16 26 25 25 16 19 01 C0 51 A7 19 36 00 
    //00 1B 1A 98 00 00 1F 63 6C 6F 73 65 5F 62 75 74 74 6F 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 
    //5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 2C 06 16 0F 19 01 C0 51 A7 19 05 00 
    //04 01 58 90 31 16 25 45 19 01 C0 51 A7 19 05 00 08 01 98 EB 9D 19 44 2B 9B 00 00 19 01 C0 51 A7 
    //19 1A 00 00 1B 24 98 00 00 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 0F 01 
    //B0 62 A7 19 1B 26 98 00 00 1F 77 69 6E 64 6F 77 68 65 61 64 65 72 66 72 61 6D 65 00 1F 53 42 47 
    //75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 28 
    //63 A7 19 1B 26 98 00 00 1F 77 69 6E 64 6F 77 68 65 61 64 65 72 5F 6C 65 66 74 00 1F 53 42 47 75 
    //69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 A0 63 
    //A7 19 1B 26 98 00 00 1F 77 69 6E 64 6F 77 68 65 61 64 65 72 5F 72 69 67 68 74 00 1F 53 42 47 75 
    //69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 1B 1D 98 00 
    //00 16 04 0B 47 
  }


  delegate bool OnCloseClick(GUI_Button clickedButton);



