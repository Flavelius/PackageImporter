//==============================================================================
//  HUD_Minimap
//==============================================================================

class HUD_Minimap extends GUI_Window
    native
    dependsOn(Game_PlayerController,Game_GUI,GUI_Label)
    Transient
    Config(User)
  ;

  const ZOOM_TIME_TO_TARGET =  0.5f;
  const CLAMP_MAX_ZOOM_STEP =  2;
  const CLAMP_MIN_ZOOM_STEP =  -4;
  const MAP_OFFSET_Y =  39;
  const MAP_OFFSET_X =  29;
  const ZOOM_OUT_OFFSET_Y =  150;
  const ZOOM_OUT_OFFSET_X =  113;
  const ZOOM_IN_OFFSET_Y =  128;
  const ZOOM_IN_OFFSET_X =  135;
  const MINIMAP_MASK_SCALE =  1.1;
  const MAP_VIEWPORT_RADIUS =  61;
  const MAP_VIEWPORT_HEIGHT =  122;
  const MAP_VIEWPORT_WIDTH =  122;
  var GUI_Page mBackgroundPage;
  var GUI_Button mZoomInButton;
  var GUI_Button mZoomOutButton;
  var GUI_Button mSystemButton;
  var GUI_TextButton mLockMenuButton;
  var GUI_TextButton mCompassMenuButton;
  var int mMoveDirection;
  var bool mIsPositionLocked;
  var globalconfig int mCurrentZoomStep;
  var float mCurrentDisplayedZoomStep;
  var float mCurrentDisplayedZoomScale;
  var private LocalizedString mZoomInHint;
  var private LocalizedString mZoomOutHint;
  var GUI_Image mMinimapCompass;
  var GUI_Image mMinimapNeedle;
  var TexRotator mRotatedNeedle;
  var GUI_Label mAreaName;
  var GUI_Image mMinimapPlayer;
  var TexRotator mRotatedPlayerArrow;
  var array<GUI_Image> mMinimapDot;
  var array<Shader> mMapTextures;
  var int mMapWidthInBlocks;
  var int mMapHeightInBlocks;
  var bool mIsMapPresent;
  var bool mForceCompass;
  var int mMapBlockSize;
  var int mMapUnitsPerPixel;
  var int mMapUnitsPerMapBlock;
  var float mMapMinX;
  var float mMapMinY;
  var float mMapMaxX;
  var float mMapMaxY;
  var int mMapMaxZoomStep;
  var int mMapMinZoomStep;
  var ZoneInfo mCurrentZoneInfo;
  var Shader mMapShader;
  var bool IsInitialized;
  var Texture mMinimapMask;
  var array<GUI_Image> mDayNightCycleImages;
  var Color mDayNightCycleColor;
  var array<Game_NPCPawn> mNPCs;
  var array<Game_PlayerPawn> mPlayers;
  var GUI_Page mInCombatPage;
  var Material mInCombatMaterial;
  var private class<Emitter> EmitterClassProvide;
  var private class<Emitter> EmitterClassMid;
  var private class<Emitter> EmitterClassFinish;


  event OnScroll(bool scrollIn) {
    if (scrollIn) {                                                             //0000 : 07 29 00 2D 00 80 4C A3 19 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.WindowFoldOut);              //0009 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 30 10 A2 19 16 
    } else {                                                                    //0026 : 06 46 00 
      mDesktop.PlaySound(Class'GUI_Sounds'.default.WindowFoldIn);               //0029 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 A8 10 A2 19 16 
    }
    //07 29 00 2D 00 80 4C A3 19 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 
    //02 30 10 A2 19 16 06 46 00 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 
    //02 A8 10 A2 19 16 04 0B 47 
  }


  function bool ShowCompassClick(GUI_Component clickedButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    mForceCompass = !mForceCompass;                                             //000F : 14 2D 01 88 4E A3 19 81 2D 01 88 4E A3 19 16 
    UpdateCompassButtonState();                                                 //001E : 1B 5F 97 00 00 16 
    UpdateZoomButtonState();                                                    //0024 : 1B 6A 97 00 00 16 
    return True;                                                                //002A : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 14 2D 01 88 4E A3 19 81 2D 01 88 4E A3 19 16 1B 5F 
    //97 00 00 16 1B 6A 97 00 00 16 04 27 04 0B 47 
  }


  function bool OpenWorldmapClick(GUI_Component clickedButton) {
    local Game_PlayerController PlayerController;
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    PlayerController = Game_PlayerController(GetPlayerController());            //000F : 0F 00 30 51 A3 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    if (PlayerController != None) {                                             //0020 : 07 43 00 77 00 30 51 A3 19 2A 16 
      PlayerController.GUI.ShowWorldmap();                                      //002B : 19 19 00 30 51 A3 19 05 00 04 01 40 8A 1B 11 06 00 00 1B 50 1A 00 00 16 
    }
    return True;                                                                //0043 : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 0F 00 30 51 A3 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 
    //07 43 00 77 00 30 51 A3 19 2A 16 19 19 00 30 51 A3 19 05 00 04 01 40 8A 1B 11 06 00 00 1B 50 1A 
    //00 00 16 04 27 04 0B 47 
  }


  function bool ToggleLockClick(GUI_Component aClickedButton) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    mIsPositionLocked = !mIsPositionLocked;                                     //000F : 14 2D 01 10 54 A3 19 81 2D 01 10 54 A3 19 16 
    if (mIsPositionLocked) {                                                    //001E : 07 4C 00 2D 01 10 54 A3 19 
      mLockMenuButton.SetText(Class'SBGuiStrings'.default.Unlock_Window.Text);  //0027 : 19 01 88 54 A3 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 41 99 19 16 
    } else {                                                                    //0049 : 06 6E 00 
      mLockMenuButton.SetText(Class'SBGuiStrings'.default.Lock_Window.Text);    //004C : 19 01 88 54 A3 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 41 99 19 16 
    }
    return True;                                                                //006E : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 14 2D 01 10 54 A3 19 81 2D 01 10 54 A3 19 16 07 4C 
    //00 2D 01 10 54 A3 19 19 01 88 54 A3 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 B8 41 99 19 16 06 6E 00 19 01 88 54 A3 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 40 41 99 19 16 04 27 04 0B 47 
  }


  event UpdateZoomButtonState() {
    if (mIsMapPresent && !mForceCompass) {                                      //0000 : 07 4F 00 82 2D 01 F0 56 A3 19 18 09 00 81 2D 01 88 4E A3 19 16 16 
      mZoomOutButton.SetEnabled(mCurrentZoomStep < mMapMaxZoomStep);            //0016 : 19 01 68 57 A3 19 12 00 00 1B 5F 32 00 00 96 01 E0 57 A3 19 01 58 58 A3 19 16 16 
      mZoomInButton.SetEnabled(mCurrentZoomStep > mMapMinZoomStep);             //0031 : 19 01 D0 58 A3 19 12 00 00 1B 5F 32 00 00 97 01 E0 57 A3 19 01 48 59 A3 19 16 16 
    } else {                                                                    //004C : 06 6F 00 
      mZoomOutButton.SetEnabled(False);                                         //004F : 19 01 68 57 A3 19 07 00 00 1B 5F 32 00 00 28 16 
      mZoomInButton.SetEnabled(False);                                          //005F : 19 01 D0 58 A3 19 07 00 00 1B 5F 32 00 00 28 16 
    }
    //07 4F 00 82 2D 01 F0 56 A3 19 18 09 00 81 2D 01 88 4E A3 19 16 16 19 01 68 57 A3 19 12 00 00 1B 
    //5F 32 00 00 96 01 E0 57 A3 19 01 58 58 A3 19 16 16 19 01 D0 58 A3 19 12 00 00 1B 5F 32 00 00 97 
    //01 E0 57 A3 19 01 48 59 A3 19 16 16 06 6F 00 19 01 68 57 A3 19 07 00 00 1B 5F 32 00 00 28 16 19 
    //01 D0 58 A3 19 07 00 00 1B 5F 32 00 00 28 16 04 0B 47 
  }


  event UpdateCompassButtonState() {
    if (mCompassMenuButton != None) {                                           //0000 : 07 B1 00 77 01 90 5B A3 19 2A 16 
      if (mIsMapPresent) {                                                      //000B : 07 77 00 2D 01 F0 56 A3 19 
        if (mForceCompass) {                                                    //0014 : 07 42 00 2D 01 88 4E A3 19 
          mCompassMenuButton.SetText(Class'SBGuiStrings'.default.Show_minimap.Text);//001D : 19 01 90 5B A3 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 40 99 19 16 
        } else {                                                                //003F : 06 64 00 
          mCompassMenuButton.SetText(Class'SBGuiStrings'.default.Show_compass.Text);//0042 : 19 01 90 5B A3 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 40 99 19 16 
        }
        mCompassMenuButton.SetEnabled(True);                                    //0064 : 19 01 90 5B A3 19 07 00 00 1B 5F 32 00 00 27 16 
      } else {                                                                  //0074 : 06 B1 00 
        mCompassMenuButton.SetText(Class'SBGuiStrings'.default.Show_minimap.Text);//0077 : 19 01 90 5B A3 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 40 99 19 16 
        mCompassMenuButton.SetEnabled(False);                                   //0099 : 19 01 90 5B A3 19 07 00 00 1B 5F 32 00 00 28 16 
        mForceCompass = False;                                                  //00A9 : 14 2D 01 88 4E A3 19 28 
      }
    }
    //07 B1 00 77 01 90 5B A3 19 2A 16 07 77 00 2D 01 F0 56 A3 19 07 42 00 2D 01 88 4E A3 19 19 01 90 
    //5B A3 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 40 99 19 16 06 
    //64 00 19 01 90 5B A3 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 
    //40 99 19 16 19 01 90 5B A3 19 07 00 00 1B 5F 32 00 00 27 16 06 B1 00 19 01 90 5B A3 19 19 00 00 
    //1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 40 99 19 16 19 01 90 5B A3 19 07 
    //00 00 1B 5F 32 00 00 28 16 14 2D 01 88 4E A3 19 28 04 0B 47 
  }


  function bool ZoomIn(GUI_Component clickedButton) {
    if (mCurrentZoomStep > mMapMinZoomStep) {                                   //0000 : 07 22 00 97 01 E0 57 A3 19 01 48 59 A3 19 16 
      mCurrentZoomStep--;                                                       //000F : A6 01 E0 57 A3 19 16 
      UpdateZoomButtonState();                                                  //0016 : 1B 6A 97 00 00 16 
      SaveConfig();                                                             //001C : 62 18 16 
      goto jl0022;                                                              //001F : 06 22 00 
    }
    return True;                                                                //0022 : 04 27 
    //07 22 00 97 01 E0 57 A3 19 01 48 59 A3 19 16 A6 01 E0 57 A3 19 16 1B 6A 97 00 00 16 62 18 16 06 
    //22 00 04 27 04 0B 47 
  }


  function bool ZoomOut(GUI_Component clickedButton) {
    if (mCurrentZoomStep < mMapMaxZoomStep) {                                   //0000 : 07 22 00 96 01 E0 57 A3 19 01 58 58 A3 19 16 
      mCurrentZoomStep++;                                                       //000F : A5 01 E0 57 A3 19 16 
      UpdateZoomButtonState();                                                  //0016 : 1B 6A 97 00 00 16 
      SaveConfig();                                                             //001C : 62 18 16 
      goto jl0022;                                                              //001F : 06 22 00 
    }
    return True;                                                                //0022 : 04 27 
    //07 22 00 96 01 E0 57 A3 19 01 58 58 A3 19 16 A5 01 E0 57 A3 19 16 1B 6A 97 00 00 16 62 18 16 06 
    //22 00 04 27 04 0B 47 
  }


  event InitializeMenu(GUI_Menu Menu) {
    local GUI_TextButton menuButton;
    menuButton = Menu.CreateMenuItem(Class'SBGuiStrings'.default.Open_worldmap.Text);//0000 : 0F 00 60 62 A3 19 19 00 B8 60 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 3F 99 19 16 
    menuButton.__OnClick__Delegate = OpenWorldmapClick;                         //0028 : 45 19 00 60 62 A3 19 05 00 08 01 98 EB 9D 19 44 3A 9A 00 00 
    mCompassMenuButton = Menu.CreateMenuItem(Class'SBGuiStrings'.default.Show_minimap.Text);//003C : 0F 01 90 5B A3 19 19 00 B8 60 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 40 99 19 16 
    mCompassMenuButton.__OnClick__Delegate = ShowCompassClick;                  //0064 : 45 19 01 90 5B A3 19 05 00 08 01 98 EB 9D 19 44 3B 9A 00 00 
    UpdateCompassButtonState();                                                 //0078 : 1B 5F 97 00 00 16 
    mLockMenuButton = Menu.CreateMenuItem(Class'SBGuiStrings'.default.Unlock_Window.Text);//007E : 0F 01 88 54 A3 19 19 00 B8 60 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 41 99 19 16 
    mLockMenuButton.__OnClick__Delegate = ToggleLockClick;                      //00A6 : 45 19 01 88 54 A3 19 05 00 08 01 98 EB 9D 19 44 39 9A 00 00 
    //0F 00 60 62 A3 19 19 00 B8 60 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 
    //00 0C 02 D8 3F 99 19 16 45 19 00 60 62 A3 19 05 00 08 01 98 EB 9D 19 44 3A 9A 00 00 0F 01 90 5B 
    //A3 19 19 00 B8 60 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 
    //40 99 19 16 45 19 01 90 5B A3 19 05 00 08 01 98 EB 9D 19 44 3B 9A 00 00 1B 5F 97 00 00 16 0F 01 
    //88 54 A3 19 19 00 B8 60 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 B8 41 99 19 16 45 19 01 88 54 A3 19 05 00 08 01 98 EB 9D 19 44 39 9A 00 00 04 0B 47 
  }


  function bool SystemClickHandler(GUI_Component aClickedButton) {
    ToggleContextMenu(aClickedButton);                                          //0000 : 1B 6F 98 00 00 00 88 63 A3 19 16 
    return True;                                                                //000B : 04 27 
    //1B 6F 98 00 00 00 88 63 A3 19 16 04 27 04 0B 47 
  }


  function SetAreaName(string aAreaName) {
    mAreaName.SetText(aAreaName);                                               //0000 : 19 01 28 66 A3 19 0B 00 00 1B 13 98 00 00 00 68 65 A3 19 16 
    //19 01 28 66 A3 19 0B 00 00 1B 13 98 00 00 00 68 65 A3 19 16 04 0B 47 
  }


  event Initialize() {
    SetBackground("Minimap","SBGuiTX.GUI_Styles","GUI_Styles");                 //0000 : 1B 1A 98 00 00 1F 4D 69 6E 69 6D 61 70 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mWidth = mTexWidth;                                                         //002F : 0F 01 60 87 31 16 01 F0 8A 31 16 
    mHeight = mTexHeight;                                                       //003A : 0F 01 40 88 31 16 01 E0 8B 31 16 
    mTop = 3.00000000;                                                          //0045 : 0F 01 80 86 31 16 1E 00 00 40 40 
    Super.Initialize();                                                         //0050 : 1C 28 9E 9E 19 16 
    mWindowStyle = mWindowStyle | 16384;                                        //0056 : 0F 01 70 61 9E 19 9E 01 70 61 9E 19 1D 00 40 00 00 16 
    SetComponentTitle("HUD_Minimap");                                           //0068 : 1B 42 97 00 00 1F 48 55 44 5F 4D 69 6E 69 6D 61 70 00 16 
    mInCombatPage = CreatePage("GUI_Page",524288,0,25,36,128,128);              //007B : 0F 01 B0 6F A3 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 2C 19 2C 24 2C 80 2C 80 16 
    mInCombatPage.SetIconMaterial(mInCombatMaterial,0.00000000,0.00000000);     //009F : 19 01 B0 6F A3 19 15 00 00 1B 34 98 00 00 01 28 70 A3 19 1E 00 00 00 00 1E 00 00 00 00 16 
    mInCombatPage.SetVisible(False);                                            //00BD : 19 01 B0 6F A3 19 07 00 00 1B 14 98 00 00 28 16 
    ClearBackground();                                                          //00CD : 1B AE 9B 00 00 16 
    mBackgroundPage = CreatePage("GUI_Page",524288,0,0,0,mWidth,mHeight);       //00D3 : 0F 01 A0 70 A3 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 25 25 39 44 01 60 87 31 16 39 44 01 40 88 31 16 16 
    mBackgroundPage.SetBackground("Minimap","SBGuiTX.GUI_Styles","GUI_Styles"); //00FF : 19 01 A0 70 A3 19 2F 00 00 1B 1A 98 00 00 1F 4D 69 6E 69 6D 61 70 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mSystemButton = mBackgroundPage.CreateButton("GUI_IconButton",0,0,3,3,17,23);//0137 : 0F 01 18 71 A3 19 19 01 A0 70 A3 19 20 00 04 1B 18 98 00 00 1F 47 55 49 5F 49 63 6F 6E 42 75 74 74 6F 6E 00 25 25 2C 03 2C 03 2C 11 2C 17 16 
    mSystemButton.__OnClick__Delegate = SystemClickHandler;                     //0166 : 45 19 01 18 71 A3 19 05 00 08 01 98 EB 9D 19 44 58 98 00 00 
    mSystemButton.SetContextMenuEnabled(True);                                  //017A : 19 01 18 71 A3 19 07 00 00 1B 77 98 00 00 27 16 
    mSystemButton.SetBackground("hud_header_worldmap","SBGuiTX.GUI_Styles","GUI_Styles");//018A : 19 01 18 71 A3 19 3B 00 00 1B 1A 98 00 00 1F 68 75 64 5F 68 65 61 64 65 72 5F 77 6F 72 6C 64 6D 61 70 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mAreaName = mBackgroundPage.CreateLabel("GUI_Label",0,512 | 2048,22,0,131,29);//01CE : 0F 01 28 66 A3 19 19 01 A0 70 A3 19 25 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 02 00 00 1D 00 08 00 00 16 2C 16 25 2C 83 2C 1D 16 
    mAreaName.SetTooltipText(Class'SBGuiStrings'.default.This_is_the_name_of_the_area_you_re_currently_in_.Text);//0202 : 19 01 28 66 A3 19 19 00 00 1B 54 97 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 EB 98 19 16 
    mAreaName.SetText("Unknown Area");                                          //0224 : 19 01 28 66 A3 19 14 00 00 1B 13 98 00 00 1F 55 6E 6B 6E 6F 77 6E 20 41 72 65 61 00 16 
    mAreaName.SetFont("SBFontsTX.Verdana10");                                   //0241 : 19 01 28 66 A3 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    mZoomInButton = mBackgroundPage.CreateButton("GUI_Button",0,0,135,128);     //0265 : 0F 01 D0 58 A3 19 19 01 A0 70 A3 19 18 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 2C 87 2C 80 16 
    mZoomInButton.SetBackground("Minimap_Plus","SBGuiTX.GUI_Styles","GUI_Styles");//028C : 19 01 D0 58 A3 19 34 00 00 1B 1A 98 00 00 1F 4D 69 6E 69 6D 61 70 5F 50 6C 75 73 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mZoomInButton.__OnClick__Delegate = ZoomIn;                                 //02C9 : 45 19 01 D0 58 A3 19 05 00 08 01 98 EB 9D 19 44 22 0D 00 00 
    mZoomOutButton = mBackgroundPage.CreateButton("GUI_Button",0,0,113,150);    //02DD : 0F 01 68 57 A3 19 19 01 A0 70 A3 19 18 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 2C 71 2C 96 16 
    mZoomOutButton.SetBackground("Minimap_Minus","SBGuiTX.GUI_Styles","GUI_Styles");//0304 : 19 01 68 57 A3 19 35 00 00 1B 1A 98 00 00 1F 4D 69 6E 69 6D 61 70 5F 4D 69 6E 75 73 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mZoomOutButton.__OnClick__Delegate = ZoomOut;                               //0342 : 45 19 01 68 57 A3 19 05 00 08 01 98 EB 9D 19 44 23 0D 00 00 
    mMinimapPlayer = CreateImage("minimaparrow","SBGuiTX.minimaparrow","Worldmap");//0356 : 0F 01 90 71 A3 19 1B 26 98 00 00 1F 6D 69 6E 69 6D 61 70 61 72 72 6F 77 00 1F 53 42 47 75 69 54 58 2E 6D 69 6E 69 6D 61 70 61 72 72 6F 77 00 1F 57 6F 72 6C 64 6D 61 70 00 16 
    mMinimapDot[0] = CreateImage("minimap_button01","SBGuiTX.GUI_Styles","GUI_Styles");//0390 : 0F 10 25 01 08 72 A3 19 1B 26 98 00 00 1F 6D 69 6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 31 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mMinimapDot[1] = CreateImage("minimap_button02","SBGuiTX.GUI_Styles","GUI_Styles");//03D0 : 0F 10 26 01 08 72 A3 19 1B 26 98 00 00 1F 6D 69 6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 32 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mMinimapDot[2] = CreateImage("minimap_button03","SBGuiTX.GUI_Styles","GUI_Styles");//0410 : 0F 10 2C 02 01 08 72 A3 19 1B 26 98 00 00 1F 6D 69 6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 33 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mMinimapDot[3] = CreateImage("minimap_button04","SBGuiTX.GUI_Styles","GUI_Styles");//0451 : 0F 10 2C 03 01 08 72 A3 19 1B 26 98 00 00 1F 6D 69 6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 34 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mMinimapDot[4] = CreateImage("minimap_button05","SBGuiTX.GUI_Styles","GUI_Styles");//0492 : 0F 10 2C 04 01 08 72 A3 19 1B 26 98 00 00 1F 6D 69 6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 35 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mRotatedPlayerArrow = CreateRotator(mMinimapPlayer);                        //04D3 : 0F 01 80 72 A3 19 1B 12 99 00 00 01 90 71 A3 19 16 
    mMinimapCompass = CreateImage("Minimap_Compass","SBGuiTX.GUI_Styles","GUI_Styles");//04E4 : 0F 01 F8 72 A3 19 1B 26 98 00 00 1F 4D 69 6E 69 6D 61 70 5F 43 6F 6D 70 61 73 73 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mMinimapNeedle = CreateImage("SBGuiTX.MinimapCompassArrow","SBGuiTX","");   //0521 : 0F 01 70 73 A3 19 1B 26 98 00 00 1F 53 42 47 75 69 54 58 2E 4D 69 6E 69 6D 61 70 43 6F 6D 70 61 73 73 41 72 72 6F 77 00 1F 53 42 47 75 69 54 58 00 1F 00 16 
    mRotatedNeedle = CreateRotator(mMinimapNeedle);                             //0555 : 0F 01 E8 73 A3 19 1B 12 99 00 00 01 70 73 A3 19 16 
    mDayNightCycleImages[0] = CreateImage("Dawn_b","SBGuiTX.GUI_Styles","GUI_Styles");//0566 : 0F 10 25 01 60 74 A3 19 1B 26 98 00 00 1F 44 61 77 6E 5F 62 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mDayNightCycleImages[1] = CreateImage("MidDay_b","SBGuiTX.GUI_Styles","GUI_Styles");//059C : 0F 10 26 01 60 74 A3 19 1B 26 98 00 00 1F 4D 69 64 44 61 79 5F 62 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mDayNightCycleImages[2] = CreateImage("Dusk_b","SBGuiTX.GUI_Styles","GUI_Styles");//05D4 : 0F 10 2C 02 01 60 74 A3 19 1B 26 98 00 00 1F 44 75 73 6B 5F 62 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mDayNightCycleImages[3] = CreateImage("Night_b","SBGuiTX.GUI_Styles","GUI_Styles");//060B : 0F 10 2C 03 01 60 74 A3 19 1B 26 98 00 00 1F 4E 69 67 68 74 5F 62 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    //1B 1A 98 00 00 1F 4D 69 6E 69 6D 61 70 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 
    //73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 60 87 31 16 01 F0 8A 31 16 0F 01 40 88 31 16 
    //01 E0 8B 31 16 0F 01 80 86 31 16 1E 00 00 40 40 1C 28 9E 9E 19 16 0F 01 70 61 9E 19 9E 01 70 61 
    //9E 19 1D 00 40 00 00 16 1B 42 97 00 00 1F 48 55 44 5F 4D 69 6E 69 6D 61 70 00 16 0F 01 B0 6F A3 
    //19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 2C 19 2C 24 2C 80 2C 80 16 19 
    //01 B0 6F A3 19 15 00 00 1B 34 98 00 00 01 28 70 A3 19 1E 00 00 00 00 1E 00 00 00 00 16 19 01 B0 
    //6F A3 19 07 00 00 1B 14 98 00 00 28 16 1B AE 9B 00 00 16 0F 01 A0 70 A3 19 1B 16 98 00 00 1F 47 
    //55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 25 25 39 44 01 60 87 31 16 39 44 01 40 88 31 16 16 19 
    //01 A0 70 A3 19 2F 00 00 1B 1A 98 00 00 1F 4D 69 6E 69 6D 61 70 00 1F 53 42 47 75 69 54 58 2E 47 
    //55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 18 71 A3 19 19 01 A0 
    //70 A3 19 20 00 04 1B 18 98 00 00 1F 47 55 49 5F 49 63 6F 6E 42 75 74 74 6F 6E 00 25 25 2C 03 2C 
    //03 2C 11 2C 17 16 45 19 01 18 71 A3 19 05 00 08 01 98 EB 9D 19 44 58 98 00 00 19 01 18 71 A3 19 
    //07 00 00 1B 77 98 00 00 27 16 19 01 18 71 A3 19 3B 00 00 1B 1A 98 00 00 1F 68 75 64 5F 68 65 61 
    //64 65 72 5F 77 6F 72 6C 64 6D 61 70 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 
    //00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 28 66 A3 19 19 01 A0 70 A3 19 25 00 04 1B 20 98 
    //00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 02 00 00 1D 00 08 00 00 16 2C 16 25 2C 83 2C 
    //1D 16 19 01 28 66 A3 19 19 00 00 1B 54 97 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 
    //EB 98 19 16 19 01 28 66 A3 19 14 00 00 1B 13 98 00 00 1F 55 6E 6B 6E 6F 77 6E 20 41 72 65 61 00 
    //16 19 01 28 66 A3 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 
    //61 31 30 00 16 0F 01 D0 58 A3 19 19 01 A0 70 A3 19 18 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 
    //74 74 6F 6E 00 25 25 2C 87 2C 80 16 19 01 D0 58 A3 19 34 00 00 1B 1A 98 00 00 1F 4D 69 6E 69 6D 
    //61 70 5F 50 6C 75 73 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 
    //5F 53 74 79 6C 65 73 00 16 45 19 01 D0 58 A3 19 05 00 08 01 98 EB 9D 19 44 22 0D 00 00 0F 01 68 
    //57 A3 19 19 01 A0 70 A3 19 18 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 2C 
    //71 2C 96 16 19 01 68 57 A3 19 35 00 00 1B 1A 98 00 00 1F 4D 69 6E 69 6D 61 70 5F 4D 69 6E 75 73 
    //00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 
    //00 16 45 19 01 68 57 A3 19 05 00 08 01 98 EB 9D 19 44 23 0D 00 00 0F 01 90 71 A3 19 1B 26 98 00 
    //00 1F 6D 69 6E 69 6D 61 70 61 72 72 6F 77 00 1F 53 42 47 75 69 54 58 2E 6D 69 6E 69 6D 61 70 61 
    //72 72 6F 77 00 1F 57 6F 72 6C 64 6D 61 70 00 16 0F 10 25 01 08 72 A3 19 1B 26 98 00 00 1F 6D 69 
    //6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 31 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 
    //65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 10 26 01 08 72 A3 19 1B 26 98 00 00 1F 6D 69 
    //6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 32 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 
    //65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 10 2C 02 01 08 72 A3 19 1B 26 98 00 00 1F 6D 
    //69 6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 33 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 
    //6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 10 2C 03 01 08 72 A3 19 1B 26 98 00 00 1F 
    //6D 69 6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 34 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 
    //79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 10 2C 04 01 08 72 A3 19 1B 26 98 00 00 
    //1F 6D 69 6E 69 6D 61 70 5F 62 75 74 74 6F 6E 30 35 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 
    //74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 80 72 A3 19 1B 12 99 00 00 01 90 
    //71 A3 19 16 0F 01 F8 72 A3 19 1B 26 98 00 00 1F 4D 69 6E 69 6D 61 70 5F 43 6F 6D 70 61 73 73 00 
    //1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 
    //16 0F 01 70 73 A3 19 1B 26 98 00 00 1F 53 42 47 75 69 54 58 2E 4D 69 6E 69 6D 61 70 43 6F 6D 70 
    //61 73 73 41 72 72 6F 77 00 1F 53 42 47 75 69 54 58 00 1F 00 16 0F 01 E8 73 A3 19 1B 12 99 00 00 
    //01 70 73 A3 19 16 0F 10 25 01 60 74 A3 19 1B 26 98 00 00 1F 44 61 77 6E 5F 62 00 1F 53 42 47 75 
    //69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 10 26 01 
    //60 74 A3 19 1B 26 98 00 00 1F 4D 69 64 44 61 79 5F 62 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 
    //53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 10 2C 02 01 60 74 A3 19 1B 26 98 
    //00 00 1F 44 75 73 6B 5F 62 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 
    //55 49 5F 53 74 79 6C 65 73 00 16 0F 10 2C 03 01 60 74 A3 19 1B 26 98 00 00 1F 4E 69 67 68 74 5F 
    //62 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 
    //73 00 16 04 0B 47 
  }



