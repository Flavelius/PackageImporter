//==============================================================================
//  SBConsole
//==============================================================================

class SBConsole extends Console
    native
    dependsOn(GUI_Desktop,Class,GED_Editor,Canvas,Game_Controller,GUI_DefaultToolkit)
    Config(System)
  ;

  var globalconfig int MaxScrollbackSize;
  var const globalconfig bool mConsoleEnabled;
  var private array<string> mScrollback;
  var private int mSBHead;
  var private int mSBPos;
  var private bool mCtrlPressed;
  var private bool mAltPressed;
  var private bool mShiftPressed;
  var private bool mConsoleHotKeyPressed;
  var private bool mCSplayer;
  var private Font mConsoleFont;
  var private int mCurrentMusicHandle;


  private final function AddMessage(string aMsg) {
    Log(aMsg);                                                                  //0000 : E7 00 A0 4D B0 1C 16 
    Message(aMsg,0.00000000);                                                   //0007 : 1B 37 03 00 00 00 A0 4D B0 1C 1E 00 00 00 00 16 
    //E7 00 A0 4D B0 1C 16 1B 37 03 00 00 00 A0 4D B0 1C 1E 00 00 00 00 16 04 0B 47 
  }


  exec function ConsoleToggle() {
    UnPressButtons();                                                           //0000 : 1B E6 11 00 00 16 
    if (GetStateName() == 'ConsoleVisible') {                                   //0006 : 07 1C 00 FE 61 1C 16 21 21 99 00 00 16 
      ConsoleClose();                                                           //0013 : 1B F5 0E 00 00 16 
    } else {                                                                    //0019 : 06 22 00 
      ConsoleOpen();                                                            //001C : 1B B6 2D 00 00 16 
    }
    //1B E6 11 00 00 16 07 1C 00 FE 61 1C 16 21 21 99 00 00 16 1B F5 0E 00 00 16 06 22 00 1B B6 2D 00 
    //00 16 04 0B 47 
  }


  function ConsoleClose() {
    TypedStr = "";                                                              //0000 : 0F 01 30 C7 7A 0F 1F 00 
    TypedStrPos = 0;                                                            //0008 : 0F 01 A8 C7 7A 0F 25 
    mCtrlPressed = False;                                                       //000F : 14 2D 01 A0 5B B0 1C 28 
    mAltPressed = False;                                                        //0017 : 14 2D 01 B0 69 B0 1C 28 
    mShiftPressed = False;                                                      //001F : 14 2D 01 28 6A B0 1C 28 
    if (GetStateName() == 'ConsoleVisible') {                                   //0027 : 07 3B 00 FE 61 1C 16 21 21 99 00 00 16 
      GotoState('None');                                                        //0034 : 71 21 00 00 00 00 16 
    }
    //0F 01 30 C7 7A 0F 1F 00 0F 01 A8 C7 7A 0F 25 14 2D 01 A0 5B B0 1C 28 14 2D 01 B0 69 B0 1C 28 14 
    //2D 01 28 6A B0 1C 28 07 3B 00 FE 61 1C 16 21 21 99 00 00 16 71 21 00 00 00 00 16 04 0B 47 
  }


  exec function CancelAction() {
    if (ViewportOwner != None
      || ViewportOwner.GUIDesktop != None) {      //0000 : 07 39 00 84 77 01 70 B7 71 0F 2A 16 18 12 00 77 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 2A 16 16 
      ViewportOwner.GUIDesktop.CancelAction();                                  //0021 : 19 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B 85 04 00 00 16 
    }
    //07 39 00 84 77 01 70 B7 71 0F 2A 16 18 12 00 77 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 2A 16 
    //16 19 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 06 00 00 1B 85 04 00 00 16 04 0B 47 
  }


  function Game_PlayerController GetPlayerController() {
    return Game_PlayerController(GUI_Desktop(ViewportOwner.GUIDesktop).ViewportOwner.Actor);//0000 : 04 2E 90 18 5B 01 19 19 2E 48 DB 2E 1D 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 
    //04 2E 90 18 5B 01 19 19 2E 48 DB 2E 1D 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 05 00 04 01 70 
    //B7 71 0F 05 00 04 01 50 BA 79 0F 04 0B 47 
  }


  function Game_Pawn GetPawn() {
    return Game_Pawn(Game_Controller(GUI_Desktop(ViewportOwner.GUIDesktop).ViewportOwner.Actor).Pawn);//0000 : 04 2E 18 38 5B 01 19 2E 10 0E 5B 01 19 19 2E 48 DB 2E 1D 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 88 83 6C 0F 
    //04 2E 18 38 5B 01 19 2E 10 0E 5B 01 19 19 2E 48 DB 2E 1D 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 
    //0F 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 88 83 6C 0F 04 0B 47 
  }


  function ConsoleOpen() {
    if (mConsoleEnabled || mCSplayer) {                                         //0000 : 07 48 00 84 2D 01 20 77 B0 1C 18 07 00 2D 01 F0 55 B0 1C 16 
      UnPressButtons();                                                         //0014 : 1B E6 11 00 00 16 
      TypedStr = "";                                                            //001A : 0F 01 30 C7 7A 0F 1F 00 
      TypedStrPos = 0;                                                          //0022 : 0F 01 A8 C7 7A 0F 25 
      mCtrlPressed = False;                                                     //0029 : 14 2D 01 A0 5B B0 1C 28 
      mAltPressed = False;                                                      //0031 : 14 2D 01 B0 69 B0 1C 28 
      mShiftPressed = False;                                                    //0039 : 14 2D 01 28 6A B0 1C 28 
      GotoState('ConsoleVisible');                                              //0041 : 71 21 21 99 00 00 16 
    }
    //07 48 00 84 2D 01 20 77 B0 1C 18 07 00 2D 01 F0 55 B0 1C 16 1B E6 11 00 00 16 0F 01 30 C7 7A 0F 
    //1F 00 0F 01 A8 C7 7A 0F 25 14 2D 01 A0 5B B0 1C 28 14 2D 01 B0 69 B0 1C 28 14 2D 01 28 6A B0 1C 
    //28 71 21 21 99 00 00 16 04 0B 47 
  }


  event NativeConsoleOpen() {
    ConsoleOpen();                                                              //0000 : 1B B6 2D 00 00 16 
    //1B B6 2D 00 00 16 04 0B 47 
  }


  event bool KeyEvent(byte aKey,byte aAction,float aDelta) {
    return Super.KeyEvent(aKey,aAction,aDelta);                                 //0000 : 04 1C 78 7B 7B 0F 00 10 5F B0 1C 00 D8 5F B0 1C 00 50 60 B0 1C 16 
    //04 1C 78 7B 7B 0F 00 10 5F B0 1C 00 D8 5F B0 1C 00 50 60 B0 1C 16 04 0B 47 
  }


  function bool InMouseLook() {
    local GUI_Desktop desktop;
    desktop = GUI_Desktop(ViewportOwner.GUIDesktop);                            //0000 : 0F 00 78 79 B0 1C 2E 48 DB 2E 1D 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 
    return desktop != None && !desktop.IsActive();                              //0019 : 04 82 77 00 78 79 B0 1C 2A 16 18 12 00 81 19 00 78 79 B0 1C 06 00 04 1B 34 0C 00 00 16 16 16 
    //0F 00 78 79 B0 1C 2E 48 DB 2E 1D 19 01 70 B7 71 0F 05 00 04 01 90 C0 79 0F 04 82 77 00 78 79 B0 
    //1C 2A 16 18 12 00 81 19 00 78 79 B0 1C 06 00 04 1B 34 0C 00 00 16 16 16 04 0B 47 
  }


  event Message(coerce string aMsg,float aMsgLife) {
    if (mCSplayer && aMsg == "") {                                              //0000 : 07 19 00 82 2D 01 F0 55 B0 1C 18 0A 00 7A 00 A0 7A B0 1C 1F 00 16 16 
      return;                                                                   //0017 : 04 0B 
    }
    if (mScrollback.Length >= MaxScrollbackSize) {                              //0019 : 07 3F 00 99 37 01 28 5A B0 1C 01 18 7B B0 1C 16 
      mScrollback.Remove(0,1);                                                  //0029 : 41 01 28 5A B0 1C 25 26 
      mSBHead = MaxScrollbackSize - 1;                                          //0031 : 0F 01 C0 58 B0 1C 93 01 18 7B B0 1C 26 16 
    }
    mScrollback.Length = mScrollback.Length + 1;                                //003F : 0F 37 01 28 5A B0 1C 92 37 01 28 5A B0 1C 26 16 
    mSBHead++;                                                                  //004F : A5 01 C0 58 B0 1C 16 
    mScrollback[mSBHead] = aMsg;                                                //0056 : 0F 10 01 C0 58 B0 1C 01 28 5A B0 1C 00 A0 7A B0 1C 
    //07 19 00 82 2D 01 F0 55 B0 1C 18 0A 00 7A 00 A0 7A B0 1C 1F 00 16 16 04 0B 07 3F 00 99 37 01 28 
    //5A B0 1C 01 18 7B B0 1C 16 41 01 28 5A B0 1C 25 26 0F 01 C0 58 B0 1C 93 01 18 7B B0 1C 26 16 0F 
    //37 01 28 5A B0 1C 92 37 01 28 5A B0 1C 26 16 A5 01 C0 58 B0 1C 16 0F 10 01 C0 58 B0 1C 01 28 5A 
    //B0 1C 00 A0 7A B0 1C 04 0B 47 
  }


  exec function CLS() {
    mSBHead = 0;                                                                //0000 : 0F 01 C0 58 B0 1C 25 
    mScrollback.Remove(0,mScrollback.Length);                                   //0007 : 41 01 28 5A B0 1C 25 37 01 28 5A B0 1C 
    //0F 01 C0 58 B0 1C 25 41 01 28 5A B0 1C 25 37 01 28 5A B0 1C 04 0B 47 
  }


  function MakeCSConsole() {
    mCSplayer = True;                                                           //0000 : 14 2D 01 F0 55 B0 1C 27 
    //14 2D 01 F0 55 B0 1C 27 04 0B 47 
  }


  state ConsoleVisible {

      function PostRender(Canvas aCanvas) {
        local float fw;
        local float fh;
        local float yclip;
        local float Y;
        local int idx;
        local float visiblePart;
        aCanvas.Font = mConsoleFont;                                            //0000 : 0F 19 00 A8 50 B0 1C 05 00 04 01 F0 26 77 0F 01 78 55 B0 1C 
        if (mCSplayer) {                                                        //0014 : 07 2B 00 2D 01 F0 55 B0 1C 
          visiblePart = 0.33000001;                                             //001D : 0F 00 68 56 B0 1C 1E C3 F5 A8 3E 
        } else {                                                                //0028 : 06 36 00 
          visiblePart = 0.50000000;                                             //002B : 0F 00 68 56 B0 1C 1E 00 00 00 3F 
        }
        yclip = aCanvas.ClipY * visiblePart;                                    //0036 : 0F 00 E0 56 B0 1C AB 19 00 A8 50 B0 1C 05 00 04 01 08 21 77 0F 00 68 56 B0 1C 16 
        aCanvas.StrLen("X",fw,fh);                                              //0051 : 19 00 A8 50 B0 1C 10 00 00 61 D0 1F 58 00 00 58 57 B0 1C 00 D0 57 B0 1C 16 
        aCanvas.SetPos(0.00000000,0.00000000);                                  //006A : 19 00 A8 50 B0 1C 10 00 00 1C 80 90 6C 0F 1E 00 00 00 00 1E 00 00 00 00 16 
        aCanvas.SetDrawColor(255,255,255,200);                                  //0083 : 19 00 A8 50 B0 1C 14 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 24 C8 16 
        if (mCSplayer) {                                                        //00A0 : 07 E2 00 2D 01 F0 55 B0 1C 
          aCanvas.Style = 5;                                                    //00A9 : 0F 19 00 A8 50 B0 1C 05 00 01 01 60 04 6C 0F 24 05 
          aCanvas.bForceAlpha = True;                                           //00BA : 14 19 00 A8 50 B0 1C 06 00 04 2D 01 D8 8C 77 0F 27 
          aCanvas.ForcedAlpha = 0.75000000;                                     //00CB : 0F 19 00 A8 50 B0 1C 05 00 04 01 C8 8D 77 0F 1E 00 00 40 3F 
        } else {                                                                //00DF : 06 F3 00 
          aCanvas.Style = 4;                                                    //00E2 : 0F 19 00 A8 50 B0 1C 05 00 01 01 60 04 6C 0F 24 04 
        }
        aCanvas.DrawTileStretched(Texture'MenuBlack',aCanvas.ClipX,yclip);      //00F3 : 19 00 A8 50 B0 1C 1E 00 00 1C 88 39 77 0F 20 F0 D2 7B 0F 19 00 A8 50 B0 1C 05 00 04 01 90 20 77 0F 00 E0 56 B0 1C 16 
        aCanvas.bForceAlpha = False;                                            //011A : 14 19 00 A8 50 B0 1C 06 00 04 2D 01 D8 8C 77 0F 28 
        aCanvas.Style = 1;                                                      //012B : 0F 19 00 A8 50 B0 1C 05 00 01 01 60 04 6C 0F 24 01 
        aCanvas.SetPos(0.00000000,yclip - 1);                                   //013C : 19 00 A8 50 B0 1C 15 00 00 1C 80 90 6C 0F 1E 00 00 00 00 AF 00 E0 56 B0 1C 39 3F 26 16 16 
        aCanvas.SetDrawColor(255,255,255,255);                                  //015A : 19 00 A8 50 B0 1C 16 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 
        aCanvas.DrawTile(Texture'MenuWhite',aCanvas.ClipX,2.00000000,0.00000000,0.00000000,64.00000000,2.00000000);//0179 : 19 00 A8 50 B0 1C 2F 00 00 61 D2 20 18 D2 7B 0F 19 00 A8 50 B0 1C 05 00 04 01 90 20 77 0F 1E 00 00 00 40 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 42 1E 00 00 00 40 16 
        aCanvas.SetDrawColor(255,255,255,255);                                  //01B1 : 19 00 A8 50 B0 1C 16 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 
        aCanvas.SetPos(0.00000000,yclip - 5 - fh);                              //01D0 : 19 00 A8 50 B0 1C 1D 00 00 1C 80 90 6C 0F 1E 00 00 00 00 AF AF 00 E0 56 B0 1C 39 3F 2C 05 16 00 D0 57 B0 1C 16 16 
        aCanvas.DrawTextClipped("(>" @ Left(TypedStr,TypedStrPos)
          $ Chr(4)
          $ Eval(TypedStrPos < Len(TypedStr),Mid(TypedStr,TypedStrPos),"_"),True);//01F6 : 19 00 A8 50 B0 1C 3D 00 00 61 D5 70 70 A8 1F 28 3E 00 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 16 EC 2C 04 16 16 CA 96 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 16 7F 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 1F 5F 00 16 16 27 16 
        idx = mSBHead - mSBPos;                                                 //023C : 0F 00 48 58 B0 1C 93 01 C0 58 B0 1C 01 38 59 B0 1C 16 
        Y = yclip - Y - 5 - fh * 2;                                             //024E : 0F 00 B0 59 B0 1C AF AF AF 00 E0 56 B0 1C 00 B0 59 B0 1C 16 39 3F 2C 05 16 AB 00 D0 57 B0 1C 39 3F 2C 02 16 16 
        if (mScrollback.Length == 0) {                                          //0273 : 07 81 02 9A 37 01 28 5A B0 1C 25 16 
          return;                                                               //027F : 04 0B 
        }
        aCanvas.SetDrawColor(255,255,255,255);                                  //0281 : 19 00 A8 50 B0 1C 16 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 
        while (Y > fh && idx >= 0) {                                            //02A0 : 07 08 03 82 B1 00 B0 59 B0 1C 00 D0 57 B0 1C 16 18 09 00 99 00 48 58 B0 1C 25 16 16 
          aCanvas.SetPos(0.00000000,Y - 1);                                     //02BC : 19 00 A8 50 B0 1C 15 00 00 1C 80 90 6C 0F 1E 00 00 00 00 AF 00 B0 59 B0 1C 39 3F 26 16 16 
          aCanvas.DrawText(mScrollback[idx],False);                             //02DA : 19 00 A8 50 B0 1C 0F 00 00 61 D1 10 00 48 58 B0 1C 01 28 5A B0 1C 28 16 
          idx--;                                                                //02F2 : A6 00 48 58 B0 1C 16 
          Y -= fh;                                                              //02F9 : B9 00 B0 59 B0 1C 00 D0 57 B0 1C 16 
        }
        //0F 19 00 A8 50 B0 1C 05 00 04 01 F0 26 77 0F 01 78 55 B0 1C 07 2B 00 2D 01 F0 55 B0 1C 0F 00 68 
        //56 B0 1C 1E C3 F5 A8 3E 06 36 00 0F 00 68 56 B0 1C 1E 00 00 00 3F 0F 00 E0 56 B0 1C AB 19 00 A8 
        //50 B0 1C 05 00 04 01 08 21 77 0F 00 68 56 B0 1C 16 19 00 A8 50 B0 1C 10 00 00 61 D0 1F 58 00 00 
        //58 57 B0 1C 00 D0 57 B0 1C 16 19 00 A8 50 B0 1C 10 00 00 1C 80 90 6C 0F 1E 00 00 00 00 1E 00 00 
        //00 00 16 19 00 A8 50 B0 1C 14 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 24 C8 16 
        //07 E2 00 2D 01 F0 55 B0 1C 0F 19 00 A8 50 B0 1C 05 00 01 01 60 04 6C 0F 24 05 14 19 00 A8 50 B0 
        //1C 06 00 04 2D 01 D8 8C 77 0F 27 0F 19 00 A8 50 B0 1C 05 00 04 01 C8 8D 77 0F 1E 00 00 40 3F 06 
        //F3 00 0F 19 00 A8 50 B0 1C 05 00 01 01 60 04 6C 0F 24 04 19 00 A8 50 B0 1C 1E 00 00 1C 88 39 77 
        //0F 20 F0 D2 7B 0F 19 00 A8 50 B0 1C 05 00 04 01 90 20 77 0F 00 E0 56 B0 1C 16 14 19 00 A8 50 B0 
        //1C 06 00 04 2D 01 D8 8C 77 0F 28 0F 19 00 A8 50 B0 1C 05 00 01 01 60 04 6C 0F 24 01 19 00 A8 50 
        //B0 1C 15 00 00 1C 80 90 6C 0F 1E 00 00 00 00 AF 00 E0 56 B0 1C 39 3F 26 16 16 19 00 A8 50 B0 1C 
        //16 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 19 00 A8 50 B0 1C 2F 
        //00 00 61 D2 20 18 D2 7B 0F 19 00 A8 50 B0 1C 05 00 04 01 90 20 77 0F 1E 00 00 00 40 1E 00 00 00 
        //00 1E 00 00 00 00 1E 00 00 80 42 1E 00 00 00 40 16 19 00 A8 50 B0 1C 16 00 00 1C 30 91 6C 0F 39 
        //3D 2C FF 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 19 00 A8 50 B0 1C 1D 00 00 1C 80 90 6C 0F 1E 00 
        //00 00 00 AF AF 00 E0 56 B0 1C 39 3F 2C 05 16 00 D0 57 B0 1C 16 16 19 00 A8 50 B0 1C 3D 00 00 61 
        //D5 70 70 A8 1F 28 3E 00 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 16 EC 2C 04 16 16 CA 96 01 A8 C7 7A 
        //0F 7D 01 30 C7 7A 0F 16 16 7F 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 1F 5F 00 16 16 27 16 0F 00 48 58 
        //B0 1C 93 01 C0 58 B0 1C 01 38 59 B0 1C 16 0F 00 B0 59 B0 1C AF AF AF 00 E0 56 B0 1C 00 B0 59 B0 
        //1C 16 39 3F 2C 05 16 AB 00 D0 57 B0 1C 39 3F 2C 02 16 16 07 81 02 9A 37 01 28 5A B0 1C 25 16 04 
        //0B 19 00 A8 50 B0 1C 16 00 00 1C 30 91 6C 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 
        //07 08 03 82 B1 00 B0 59 B0 1C 00 D0 57 B0 1C 16 18 09 00 99 00 48 58 B0 1C 25 16 16 19 00 A8 50 
        //B0 1C 15 00 00 1C 80 90 6C 0F 1E 00 00 00 00 AF 00 B0 59 B0 1C 39 3F 26 16 16 19 00 A8 50 B0 1C 
        //0F 00 00 61 D1 10 00 48 58 B0 1C 01 28 5A B0 1C 28 16 A6 00 48 58 B0 1C 16 B9 00 B0 59 B0 1C 00 
        //D0 57 B0 1C 16 06 A0 02 04 0B 47 
      }


      function EndState() {
        bVisible = False;                                                       //0000 : 14 2D 01 D8 CA 71 0F 28 
        mCtrlPressed = False;                                                   //0008 : 14 2D 01 A0 5B B0 1C 28 
        mConsoleHotKeyPressed = False;                                          //0010 : 14 2D 01 18 5C B0 1C 28 
        //14 2D 01 D8 CA 71 0F 28 14 2D 01 A0 5B B0 1C 28 14 2D 01 18 5C B0 1C 28 04 0B 47 
      }


      function BeginState() {
        mSBPos = 0;                                                             //0000 : 0F 01 38 59 B0 1C 25 
        bVisible = True;                                                        //0007 : 14 2D 01 D8 CA 71 0F 27 
        bIgnoreKeys = True;                                                     //000F : 14 2D 01 88 7C 7B 0F 27 
        mConsoleHotKeyPressed = False;                                          //0017 : 14 2D 01 18 5C B0 1C 28 
        HistoryCur = HistoryTop;                                                //001F : 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 
        mCtrlPressed = False;                                                   //002A : 14 2D 01 A0 5B B0 1C 28 
        //0F 01 38 59 B0 1C 25 14 2D 01 D8 CA 71 0F 27 14 2D 01 88 7C 7B 0F 27 14 2D 01 18 5C B0 1C 28 0F 
        //01 00 7D 7B 0F 01 78 7D 7B 0F 14 2D 01 A0 5B B0 1C 28 04 0B 47 
      }


      function bool KeyEvent(byte aKey,byte aAction,float aDelta) {
        local string tempString;
        local int i;
        if (aAction == 3) {                                                     //0000 : 07 A9 00 9A 39 3A 00 38 69 B0 1C 39 3A 24 03 16 
          if (aKey == ConsoleHotKey) {                                          //0010 : 07 34 00 9A 39 3A 00 F0 61 B0 1C 39 3A 01 60 9C 7B 0F 16 
            if (mConsoleHotKeyPressed) {                                        //0023 : 07 32 00 2D 01 18 5C B0 1C 
              ConsoleClose();                                                   //002C : 1B F5 0E 00 00 16 
            }
            return True;                                                        //0032 : 04 27 
          }
          switch (aKey) {                                                       //0034 : 05 01 00 F0 61 B0 1C 
            case 17 :                                                           //003B : 0A 4B 00 24 11 
              mCtrlPressed = False;                                             //0040 : 14 2D 01 A0 5B B0 1C 28 
              break;                                                            //0048 : 06 A6 00 
            case 18 :                                                           //004B : 0A 5B 00 24 12 
              mAltPressed = False;                                              //0050 : 14 2D 01 B0 69 B0 1C 28 
              break;                                                            //0058 : 06 A6 00 
            case 16 :                                                           //005B : 0A 6B 00 24 10 
              mShiftPressed = False;                                            //0060 : 14 2D 01 28 6A B0 1C 28 
              break;                                                            //0068 : 06 A6 00 
            case 27 :                                                           //006B : 0A A1 00 24 1B 
              if (TypedStr != "") {                                             //0070 : 07 99 00 7B 01 30 C7 7A 0F 1F 00 16 
                TypedStr = "";                                                  //007C : 0F 01 30 C7 7A 0F 1F 00 
                TypedStrPos = 0;                                                //0084 : 0F 01 A8 C7 7A 0F 25 
                HistoryCur = HistoryTop;                                        //008B : 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 
              } else {                                                          //0096 : 06 9F 00 
                ConsoleClose();                                                 //0099 : 1B F5 0E 00 00 16 
              }
              return True;                                                      //009F : 04 27 
            default:                                                            //00A1 : 0A FF FF 
              return True;                                                      //00A4 : 04 27 
          }
        } else {                                                                //00A6 : 06 CF 04 
          if (aAction == 1) {                                                   //00A9 : 07 CF 04 9A 39 3A 00 38 69 B0 1C 39 3A 24 01 16 
            bIgnoreKeys = False;                                                //00B9 : 14 2D 01 88 7C 7B 0F 28 
            if (aKey == ConsoleHotKey) {                                        //00C1 : 07 DE 00 9A 39 3A 00 F0 61 B0 1C 39 3A 01 60 9C 7B 0F 16 
              mConsoleHotKeyPressed = True;                                     //00D4 : 14 2D 01 18 5C B0 1C 27 
              return True;                                                      //00DC : 04 27 
            }
            switch (aKey) {                                                     //00DE : 05 01 00 F0 61 B0 1C 
              case 17 :                                                         //00E5 : 0A F5 00 24 11 
                mCtrlPressed = True;                                            //00EA : 14 2D 01 A0 5B B0 1C 27 
                break;                                                          //00F2 : 06 CF 04 
              case 18 :                                                         //00F5 : 0A 05 01 24 12 
                mAltPressed = True;                                             //00FA : 14 2D 01 B0 69 B0 1C 27 
                break;                                                          //0102 : 06 CF 04 
              case 16 :                                                         //0105 : 0A 15 01 24 10 
                mShiftPressed = True;                                           //010A : 14 2D 01 28 6A B0 1C 27 
                break;                                                          //0112 : 06 CF 04 
              case 27 :                                                         //0115 : 0A 1C 01 24 1B 
                return True;                                                    //011A : 04 27 
              case 13 :                                                         //011C : 0A F7 01 24 0D 
                if (TypedStr != "") {                                           //0121 : 07 F5 01 7B 01 30 C7 7A 0F 1F 00 16 
                  History[HistoryTop] = TypedStr;                               //012D : 0F 1A 01 78 7D 7B 0F 01 20 87 7B 0F 01 30 C7 7A 0F 
                  HistoryTop = (HistoryTop + 1) % 16;                           //013E : 0F 01 78 7D 7B 0F 39 44 AD 39 3F 92 01 78 7D 7B 0F 26 16 39 3F 2C 10 16 
                  if (HistoryBot == -1 || HistoryBot == HistoryTop) {           //0156 : 07 8E 01 84 9A 01 98 87 7B 0F 1D FF FF FF FF 16 18 0D 00 9A 01 98 87 7B 0F 01 78 7D 7B 0F 16 16 
                    HistoryBot = (HistoryBot + 1) % 16;                         //0176 : 0F 01 98 87 7B 0F 39 44 AD 39 3F 92 01 98 87 7B 0F 26 16 39 3F 2C 10 16 
                  }
                  HistoryCur = HistoryTop;                                      //018E : 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 
                  tempString = TypedStr;                                        //0199 : 0F 00 A0 6A B0 1C 01 30 C7 7A 0F 
                  TypedStr = "";                                                //01A4 : 0F 01 30 C7 7A 0F 1F 00 
                  TypedStrPos = 0;                                              //01AC : 0F 01 A8 C7 7A 0F 25 
                  if (!ConsoleCommand(tempString)) {                            //01B3 : 07 E8 01 81 1B 65 0C 00 00 00 A0 6A B0 1C 16 16 
                    Message(Localize("Errors","Exec","Core"),6.00000000);       //01C3 : 1B 37 03 00 00 1B F3 28 00 00 1F 45 72 72 6F 72 73 00 1F 45 78 65 63 00 1F 43 6F 72 65 00 16 1E 00 00 C0 40 16 
                  }
                  Message("",6.00000000);                                       //01E8 : 1B 37 03 00 00 1F 00 1E 00 00 C0 40 16 
                }
                return True;                                                    //01F5 : 04 27 
              case 38 :                                                         //01F7 : 0A 61 02 24 26 
                if (HistoryBot >= 0) {                                          //01FC : 07 5F 02 99 01 98 87 7B 0F 25 16 
                  if (HistoryCur == HistoryBot) {                               //0207 : 07 24 02 9A 01 00 7D 7B 0F 01 98 87 7B 0F 16 
                    HistoryCur = HistoryTop;                                    //0216 : 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 
                  } else {                                                      //0221 : 06 41 02 
                    HistoryCur--;                                               //0224 : A6 01 00 7D 7B 0F 16 
                    if (HistoryCur < 0) {                                       //022B : 07 41 02 96 01 00 7D 7B 0F 25 16 
                      HistoryCur = 16 - 1;                                      //0236 : 0F 01 00 7D 7B 0F 93 2C 10 26 16 
                    }
                  }
                  TypedStr = History[HistoryCur];                               //0241 : 0F 01 30 C7 7A 0F 1A 01 00 7D 7B 0F 01 20 87 7B 0F 
                  TypedStrPos = Len(TypedStr);                                  //0252 : 0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 
                }
                return True;                                                    //025F : 04 27 
              case 40 :                                                         //0261 : 0A C6 02 24 28 
                if (HistoryBot >= 0) {                                          //0266 : 07 C4 02 99 01 98 87 7B 0F 25 16 
                  if (HistoryCur == HistoryTop) {                               //0271 : 07 8E 02 9A 01 00 7D 7B 0F 01 78 7D 7B 0F 16 
                    HistoryCur = HistoryBot;                                    //0280 : 0F 01 00 7D 7B 0F 01 98 87 7B 0F 
                  } else {                                                      //028B : 06 A6 02 
                    HistoryCur = (HistoryCur + 1) % 16;                         //028E : 0F 01 00 7D 7B 0F 39 44 AD 39 3F 92 01 00 7D 7B 0F 26 16 39 3F 2C 10 16 
                  }
                  TypedStr = History[HistoryCur];                               //02A6 : 0F 01 30 C7 7A 0F 1A 01 00 7D 7B 0F 01 20 87 7B 0F 
                  TypedStrPos = Len(TypedStr);                                  //02B7 : 0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 
                }
                return True;                                                    //02C4 : 04 27 
              case 8 :                                                          //02C6 : 0A 0B 03 24 08 
                if (TypedStrPos > 0) {                                          //02CB : 07 09 03 97 01 A8 C7 7A 0F 25 16 
                  TypedStr = Left(TypedStr,TypedStrPos - 1)
                    $ Right(TypedStr,Len(TypedStr) - TypedStrPos);//02D6 : 0F 01 30 C7 7A 0F 70 80 01 30 C7 7A 0F 93 01 A8 C7 7A 0F 26 16 16 EA 01 30 C7 7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 
                  TypedStrPos--;                                                //0302 : A6 01 A8 C7 7A 0F 16 
                }
                return True;                                                    //0309 : 04 27 
              case 46 :                                                         //030B : 0A 4F 03 24 2E 
                if (TypedStrPos < Len(TypedStr)) {                              //0310 : 07 4D 03 96 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 16 
                  TypedStr = Left(TypedStr,TypedStrPos)
                    $ Right(TypedStr,Len(TypedStr) - TypedStrPos - 1);//0321 : 0F 01 30 C7 7A 0F 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 EA 01 30 C7 7A 0F 93 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 26 16 16 16 
                }
                return True;                                                    //034D : 04 27 
              case 37 :                                                         //034F : 0A A9 03 24 25 
                i = TypedStrPos - 1;                                            //0354 : 0F 00 18 6B B0 1C 93 01 A8 C7 7A 0F 26 16 
                if (mCtrlPressed) {                                             //0362 : 07 99 03 2D 01 A0 5B B0 1C 
                  while (i > 0
                    && Mid(string(TypedStrPos),i,1) != " ") {//036B : 07 99 03 82 97 00 18 6B B0 1C 25 16 18 15 00 7B 7F 39 53 01 A8 C7 7A 0F 00 18 6B B0 1C 26 16 1F 20 00 16 16 
                    i--;                                                        //038F : A6 00 18 6B B0 1C 16 
                  }
                }
                TypedStrPos = Max(0,i);                                         //0399 : 0F 01 A8 C7 7A 0F FA 25 00 18 6B B0 1C 16 
                return True;                                                    //03A7 : 04 27 
              case 39 :                                                         //03A9 : 0A 0D 04 24 27 
                i = TypedStrPos + 1;                                            //03AE : 0F 00 18 6B B0 1C 92 01 A8 C7 7A 0F 26 16 
                if (mCtrlPressed) {                                             //03BC : 07 F7 03 2D 01 A0 5B B0 1C 
                  while (i <= Len(TypedStr) && Mid(TypedStr,i,1) != " ") {      //03C5 : 07 F7 03 82 98 00 18 6B B0 1C 7D 01 30 C7 7A 0F 16 16 18 13 00 7B 7F 01 30 C7 7A 0F 00 18 6B B0 1C 26 16 1F 20 00 16 16 
                    i++;                                                        //03ED : A5 00 18 6B B0 1C 16 
                  }
                }
                TypedStrPos = Min(Len(TypedStr),i);                             //03F7 : 0F 01 A8 C7 7A 0F F9 7D 01 30 C7 7A 0F 16 00 18 6B B0 1C 16 
                return True;                                                    //040B : 04 27 
              case 36 :                                                         //040D : 0A 1B 04 24 24 
                TypedStrPos = 0;                                                //0412 : 0F 01 A8 C7 7A 0F 25 
                return True;                                                    //0419 : 04 27 
              case 35 :                                                         //041B : 0A 2F 04 24 23 
                TypedStrPos = Len(TypedStr);                                    //0420 : 0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 
                return True;                                                    //042D : 04 27 
              case 33 :                                                         //042F : 0A 34 04 24 21 
              case 236 :                                                        //0434 : 0A 89 04 24 EC 
                if (mSBPos < mScrollback.Length - 1) {                          //0439 : 07 87 04 96 01 38 59 B0 1C 93 37 01 28 5A B0 1C 26 16 16 
                  if (mCtrlPressed) {                                           //044C : 07 61 04 2D 01 A0 5B B0 1C 
                    mSBPos += 5;                                                //0455 : A1 01 38 59 B0 1C 2C 05 16 
                  } else {                                                      //045E : 06 68 04 
                    mSBPos++;                                                   //0461 : A5 01 38 59 B0 1C 16 
                  }
                  if (mSBPos >= mScrollback.Length) {                           //0468 : 07 87 04 99 01 38 59 B0 1C 37 01 28 5A B0 1C 16 
                    mSBPos = mScrollback.Length - 1;                            //0478 : 0F 01 38 59 B0 1C 93 37 01 28 5A B0 1C 26 16 
                  }
                }
                return True;                                                    //0487 : 04 27 
              case 34 :                                                         //0489 : 0A 8E 04 24 22 
              case 237 :                                                        //048E : 0A CC 04 24 ED 
                if (mSBPos > 0) {                                               //0493 : 07 CC 04 97 01 38 59 B0 1C 25 16 
                  if (mCtrlPressed) {                                           //049E : 07 B3 04 2D 01 A0 5B B0 1C 
                    mSBPos -= 5;                                                //04A7 : A2 01 38 59 B0 1C 2C 05 16 
                  } else {                                                      //04B0 : 06 BA 04 
                    mSBPos--;                                                   //04B3 : A6 01 38 59 B0 1C 16 
                  }
                  if (mSBPos < 0) {                                             //04BA : 07 CC 04 96 01 38 59 B0 1C 25 16 
                    mSBPos = 0;                                                 //04C5 : 0F 01 38 59 B0 1C 25 
                  }
                }
              default:                                                          //04CC : 0A FF FF 
            }
          }
        }
        return True;                                                            //04CF : 04 27 
        //07 A9 00 9A 39 3A 00 38 69 B0 1C 39 3A 24 03 16 07 34 00 9A 39 3A 00 F0 61 B0 1C 39 3A 01 60 9C 
        //7B 0F 16 07 32 00 2D 01 18 5C B0 1C 1B F5 0E 00 00 16 04 27 05 01 00 F0 61 B0 1C 0A 4B 00 24 11 
        //14 2D 01 A0 5B B0 1C 28 06 A6 00 0A 5B 00 24 12 14 2D 01 B0 69 B0 1C 28 06 A6 00 0A 6B 00 24 10 
        //14 2D 01 28 6A B0 1C 28 06 A6 00 0A A1 00 24 1B 07 99 00 7B 01 30 C7 7A 0F 1F 00 16 0F 01 30 C7 
        //7A 0F 1F 00 0F 01 A8 C7 7A 0F 25 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 06 9F 00 1B F5 0E 00 00 16 04 
        //27 0A FF FF 04 27 06 CF 04 07 CF 04 9A 39 3A 00 38 69 B0 1C 39 3A 24 01 16 14 2D 01 88 7C 7B 0F 
        //28 07 DE 00 9A 39 3A 00 F0 61 B0 1C 39 3A 01 60 9C 7B 0F 16 14 2D 01 18 5C B0 1C 27 04 27 05 01 
        //00 F0 61 B0 1C 0A F5 00 24 11 14 2D 01 A0 5B B0 1C 27 06 CF 04 0A 05 01 24 12 14 2D 01 B0 69 B0 
        //1C 27 06 CF 04 0A 15 01 24 10 14 2D 01 28 6A B0 1C 27 06 CF 04 0A 1C 01 24 1B 04 27 0A F7 01 24 
        //0D 07 F5 01 7B 01 30 C7 7A 0F 1F 00 16 0F 1A 01 78 7D 7B 0F 01 20 87 7B 0F 01 30 C7 7A 0F 0F 01 
        //78 7D 7B 0F 39 44 AD 39 3F 92 01 78 7D 7B 0F 26 16 39 3F 2C 10 16 07 8E 01 84 9A 01 98 87 7B 0F 
        //1D FF FF FF FF 16 18 0D 00 9A 01 98 87 7B 0F 01 78 7D 7B 0F 16 16 0F 01 98 87 7B 0F 39 44 AD 39 
        //3F 92 01 98 87 7B 0F 26 16 39 3F 2C 10 16 0F 01 00 7D 7B 0F 01 78 7D 7B 0F 0F 00 A0 6A B0 1C 01 
        //30 C7 7A 0F 0F 01 30 C7 7A 0F 1F 00 0F 01 A8 C7 7A 0F 25 07 E8 01 81 1B 65 0C 00 00 00 A0 6A B0 
        //1C 16 16 1B 37 03 00 00 1B F3 28 00 00 1F 45 72 72 6F 72 73 00 1F 45 78 65 63 00 1F 43 6F 72 65 
        //00 16 1E 00 00 C0 40 16 1B 37 03 00 00 1F 00 1E 00 00 C0 40 16 04 27 0A 61 02 24 26 07 5F 02 99 
        //01 98 87 7B 0F 25 16 07 24 02 9A 01 00 7D 7B 0F 01 98 87 7B 0F 16 0F 01 00 7D 7B 0F 01 78 7D 7B 
        //0F 06 41 02 A6 01 00 7D 7B 0F 16 07 41 02 96 01 00 7D 7B 0F 25 16 0F 01 00 7D 7B 0F 93 2C 10 26 
        //16 0F 01 30 C7 7A 0F 1A 01 00 7D 7B 0F 01 20 87 7B 0F 0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 04 
        //27 0A C6 02 24 28 07 C4 02 99 01 98 87 7B 0F 25 16 07 8E 02 9A 01 00 7D 7B 0F 01 78 7D 7B 0F 16 
        //0F 01 00 7D 7B 0F 01 98 87 7B 0F 06 A6 02 0F 01 00 7D 7B 0F 39 44 AD 39 3F 92 01 00 7D 7B 0F 26 
        //16 39 3F 2C 10 16 0F 01 30 C7 7A 0F 1A 01 00 7D 7B 0F 01 20 87 7B 0F 0F 01 A8 C7 7A 0F 7D 01 30 
        //C7 7A 0F 16 04 27 0A 0B 03 24 08 07 09 03 97 01 A8 C7 7A 0F 25 16 0F 01 30 C7 7A 0F 70 80 01 30 
        //C7 7A 0F 93 01 A8 C7 7A 0F 26 16 16 EA 01 30 C7 7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 
        //16 16 A6 01 A8 C7 7A 0F 16 04 27 0A 4F 03 24 2E 07 4D 03 96 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 
        //16 0F 01 30 C7 7A 0F 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 EA 01 30 C7 7A 0F 93 93 7D 01 30 C7 
        //7A 0F 16 01 A8 C7 7A 0F 16 26 16 16 16 04 27 0A A9 03 24 25 0F 00 18 6B B0 1C 93 01 A8 C7 7A 0F 
        //26 16 07 99 03 2D 01 A0 5B B0 1C 07 99 03 82 97 00 18 6B B0 1C 25 16 18 15 00 7B 7F 39 53 01 A8 
        //C7 7A 0F 00 18 6B B0 1C 26 16 1F 20 00 16 16 A6 00 18 6B B0 1C 16 06 6B 03 0F 01 A8 C7 7A 0F FA 
        //25 00 18 6B B0 1C 16 04 27 0A 0D 04 24 27 0F 00 18 6B B0 1C 92 01 A8 C7 7A 0F 26 16 07 F7 03 2D 
        //01 A0 5B B0 1C 07 F7 03 82 98 00 18 6B B0 1C 7D 01 30 C7 7A 0F 16 16 18 13 00 7B 7F 01 30 C7 7A 
        //0F 00 18 6B B0 1C 26 16 1F 20 00 16 16 A5 00 18 6B B0 1C 16 06 C5 03 0F 01 A8 C7 7A 0F F9 7D 01 
        //30 C7 7A 0F 16 00 18 6B B0 1C 16 04 27 0A 1B 04 24 24 0F 01 A8 C7 7A 0F 25 04 27 0A 2F 04 24 23 
        //0F 01 A8 C7 7A 0F 7D 01 30 C7 7A 0F 16 04 27 0A 34 04 24 21 0A 89 04 24 EC 07 87 04 96 01 38 59 
        //B0 1C 93 37 01 28 5A B0 1C 26 16 16 07 61 04 2D 01 A0 5B B0 1C A1 01 38 59 B0 1C 2C 05 16 06 68 
        //04 A5 01 38 59 B0 1C 16 07 87 04 99 01 38 59 B0 1C 37 01 28 5A B0 1C 16 0F 01 38 59 B0 1C 93 37 
        //01 28 5A B0 1C 26 16 04 27 0A 8E 04 24 22 0A CC 04 24 ED 07 CC 04 97 01 38 59 B0 1C 25 16 07 B3 
        //04 2D 01 A0 5B B0 1C A2 01 38 59 B0 1C 2C 05 16 06 BA 04 A6 01 38 59 B0 1C 16 07 CC 04 96 01 38 
        //59 B0 1C 25 16 0F 01 38 59 B0 1C 25 0A FF FF 04 27 04 0B 47 
      }


      function bool KeyType(byte aKey,optional string aUnicode) {
        local PlayerController PC;
        if (bIgnoreKeys || mConsoleHotKeyPressed) {                             //0000 : 07 16 00 84 2D 01 88 7C 7B 0F 18 07 00 2D 01 18 5C B0 1C 16 
          return True;                                                          //0014 : 04 27 
        }
        if (ViewportOwner != None) {                                            //0016 : 07 35 00 77 01 70 B7 71 0F 2A 16 
          PC = ViewportOwner.Actor;                                             //0021 : 0F 00 28 6F B0 1C 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 
        }
        if (mCtrlPressed && PC != None) {                                       //0035 : 07 E8 00 82 2D 01 A0 5B B0 1C 18 09 00 77 00 28 6F B0 1C 2A 16 16 
          if (aKey == 3) {                                                      //004B : 07 72 00 9A 39 3A 00 80 6C B0 1C 2C 03 16 
            PC.CopyToClipboard(TypedStr);                                       //0059 : 19 00 28 6F B0 1C 0B 00 00 1B 26 2E 00 00 01 30 C7 7A 0F 16 
            return True;                                                        //006D : 04 27 
          } else {                                                              //006F : 06 E8 00 
            if (aKey == 22) {                                                   //0072 : 07 B5 00 9A 39 3A 00 80 6C B0 1C 2C 16 16 
              TypedStrPos += Len(PC.PasteFromClipboard());                      //0098 : A1 01 A8 C7 7A 0F 7D 19 00 28 6F B0 1C 06 00 00 1B 27 2E 00 00 16 16 16 
              return True;                                                      //00B0 : 04 27 
            } else {                                                            //00B2 : 06 E8 00 
              if (aKey == 24) {                                                 //00B5 : 07 E8 00 9A 39 3A 00 80 6C B0 1C 2C 18 16 
                PC.CopyToClipboard(TypedStr);                                   //00C3 : 19 00 28 6F B0 1C 0B 00 00 1B 26 2E 00 00 01 30 C7 7A 0F 16 
                TypedStr = "";                                                  //00D7 : 0F 01 30 C7 7A 0F 1F 00 
                TypedStrPos = 0;                                                //00DF : 0F 01 A8 C7 7A 0F 25 
                return True;                                                    //00E6 : 04 27 
              }
            }
          }
        }
        if (aKey >= 32) {                                                       //00E8 : 07 72 01 99 39 3A 00 80 6C B0 1C 2C 20 16 
          if (aUnicode != "") {                                                 //00F6 : 07 35 01 7B 00 A0 6F B0 1C 1F 00 16 
            TypedStr = Left(TypedStr,TypedStrPos) $ aUnicode
              $ Right(TypedStr,Len(TypedStr) - TypedStrPos);//0102 : 0F 01 30 C7 7A 0F 70 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 00 A0 6F B0 1C 16 EA 01 30 C7 7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 
          } else {                                                              //0132 : 06 69 01 
            TypedStr = Left(TypedStr,TypedStrPos) $ Chr(aKey)
              $ Right(TypedStr,Len(TypedStr) - TypedStrPos);//0135 : 0F 01 30 C7 7A 0F 70 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 EC 39 3A 00 80 6C B0 1C 16 16 EA 01 30 C7 7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 
          }
          TypedStrPos++;                                                        //0169 : A5 01 A8 C7 7A 0F 16 
          return True;                                                          //0170 : 04 27 
        }
        return True;                                                            //0172 : 04 27 
        //07 16 00 84 2D 01 88 7C 7B 0F 18 07 00 2D 01 18 5C B0 1C 16 04 27 07 35 00 77 01 70 B7 71 0F 2A 
        //16 0F 00 28 6F B0 1C 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 07 E8 00 82 2D 01 A0 5B B0 1C 18 
        //09 00 77 00 28 6F B0 1C 2A 16 16 07 72 00 9A 39 3A 00 80 6C B0 1C 2C 03 16 19 00 28 6F B0 1C 0B 
        //00 00 1B 26 2E 00 00 01 30 C7 7A 0F 16 04 27 06 E8 00 07 B5 00 9A 39 3A 00 80 6C B0 1C 2C 16 16 
        //0E 61 42 01 30 C7 7A 0F 19 00 28 6F B0 1C 06 00 00 1B 27 2E 00 00 16 16 A1 01 A8 C7 7A 0F 7D 19 
        //00 28 6F B0 1C 06 00 00 1B 27 2E 00 00 16 16 16 04 27 06 E8 00 07 E8 00 9A 39 3A 00 80 6C B0 1C 
        //2C 18 16 19 00 28 6F B0 1C 0B 00 00 1B 26 2E 00 00 01 30 C7 7A 0F 16 0F 01 30 C7 7A 0F 1F 00 0F 
        //01 A8 C7 7A 0F 25 04 27 07 72 01 99 39 3A 00 80 6C B0 1C 2C 20 16 07 35 01 7B 00 A0 6F B0 1C 1F 
        //00 16 0F 01 30 C7 7A 0F 70 70 80 01 30 C7 7A 0F 01 A8 C7 7A 0F 16 00 A0 6F B0 1C 16 EA 01 30 C7 
        //7A 0F 93 7D 01 30 C7 7A 0F 16 01 A8 C7 7A 0F 16 16 16 06 69 01 0F 01 30 C7 7A 0F 70 70 80 01 30 
        //C7 7A 0F 01 A8 C7 7A 0F 16 EC 39 3A 00 80 6C B0 1C 16 16 EA 01 30 C7 7A 0F 93 7D 01 30 C7 7A 0F 
        //16 01 A8 C7 7A 0F 16 16 16 A5 01 A8 C7 7A 0F 16 04 27 04 27 04 0B 47 
      }


    //08 47 

  }



