//==============================================================================
//  HUD_RequestTrading
//==============================================================================

class HUD_RequestTrading extends GUI_Window
    dependsOn(Game_Pawn,Game_Trading,GUI_Label)
    Transient
    Config(User)
  ;

  var private GUI_Page mRequestedPage;
  var private GUI_Label mRequestedATradeLabel;
  var private GUI_Button mAcceptButton;
  var private GUI_Button mDeclineButton;
  var private GUI_Page mRequestingPage;
  var private GUI_Page mRequestingTextPage;
  var private GUI_Label mRequestingTradeWithLabel;
  var private GUI_Page mRequestingButtonPage;
  var private GUI_Button mCancelButton;


  function bool ClickHandler(GUI_Component clickedButton) {
    local Game_Pawn gp;
    gp = GetPawn();                                                             //0000 : 0F 00 C0 4C 08 1B 1B 2B 0C 00 00 16 
    if (gp != None && gp.Trading != None) {                                     //000C : 07 AA 00 82 77 00 C0 4C 08 1B 2A 16 18 12 00 77 19 00 C0 4C 08 1B 05 00 04 01 C0 43 32 0F 2A 16 16 
      if (clickedButton == mAcceptButton) {                                     //002D : 07 57 00 72 00 98 82 07 1B 01 E8 18 06 1B 16 
        gp.Trading.cl_AcceptTradeRequest();                                     //003C : 19 19 00 C0 4C 08 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B 3A 1B 00 00 16 
      } else {                                                                  //0054 : 06 AA 00 
        if (clickedButton == mDeclineButton) {                                  //0057 : 07 83 00 72 00 98 82 07 1B 01 60 19 06 1B 16 
          gp.Trading.cl_RejectTradeRequest(7);                                  //0066 : 19 19 00 C0 4C 08 1B 05 00 04 01 C0 43 32 0F 08 00 00 1B 12 0F 00 00 24 07 16 
        } else {                                                                //0080 : 06 AA 00 
          if (clickedButton == mCancelButton) {                                 //0083 : 07 AA 00 72 00 98 82 07 1B 01 E0 2D 06 1B 16 
            gp.Trading.cl_CancelTradeRequest();                                 //0092 : 19 19 00 C0 4C 08 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B 39 1B 00 00 16 
          }
        }
      }
    }
    return True;                                                                //00AA : 04 27 
    //0F 00 C0 4C 08 1B 1B 2B 0C 00 00 16 07 AA 00 82 77 00 C0 4C 08 1B 2A 16 18 12 00 77 19 00 C0 4C 
    //08 1B 05 00 04 01 C0 43 32 0F 2A 16 16 07 57 00 72 00 98 82 07 1B 01 E8 18 06 1B 16 19 19 00 C0 
    //4C 08 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B 3A 1B 00 00 16 06 AA 00 07 83 00 72 00 98 82 07 1B 
    //01 60 19 06 1B 16 19 19 00 C0 4C 08 1B 05 00 04 01 C0 43 32 0F 08 00 00 1B 12 0F 00 00 24 07 16 
    //06 AA 00 07 AA 00 72 00 98 82 07 1B 01 E0 2D 06 1B 16 19 19 00 C0 4C 08 1B 05 00 04 01 C0 43 32 
    //0F 06 00 00 1B 39 1B 00 00 16 04 27 04 0B 47 
  }


  function SetupRequest() {
    local Game_Pawn Pawn;
    Pawn = GetPawn();                                                           //0000 : 0F 00 48 20 04 1B 1B 2B 0C 00 00 16 
    if (Pawn != None && Pawn.Trading != None) {                                 //000C : 07 94 01 82 77 00 48 20 04 1B 2A 16 18 12 00 77 19 00 48 20 04 1B 05 00 04 01 C0 43 32 0F 2A 16 16 
      if (Pawn.Trading.cl_GetTradeState() == Class'Game_Trading'.1) {           //002D : 07 18 01 9A 39 3A 19 19 00 48 20 04 1B 05 00 04 01 C0 43 32 0F 06 00 01 1B 37 1B 00 00 16 39 3A 12 20 B0 78 5F 01 02 00 01 24 01 16 
        mRequestedPage.SetVisible(False);                                       //0059 : 19 01 70 45 8A 19 07 00 00 1B 14 98 00 00 28 16 
        mRequestingPage.SetVisible(True);                                       //0069 : 19 01 58 00 05 1B 07 00 00 1B 14 98 00 00 27 16 
        mRequestingTradeWithLabel.SetText(Class'SBGuiStrings'.default.Requesting_trade_with.Text
          @ Pawn.Trading.cl_GetPartnerName());//0079 : 19 01 20 3B 08 1B 33 00 00 1B 13 98 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 E6 98 19 19 19 00 48 20 04 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B E7 0E 00 00 16 16 16 
        Resize(400.00000000,173.00000000);                                      //00B5 : 1B B9 98 00 00 1E 00 00 C8 43 1E 00 00 2D 43 16 
        SetPosition(mDesktop.GetScreenWidth() / 2.00000000 - GetClientWidth() / 2.00000000,mDesktop.GetScreenHeight() / 2.00000000 - GetClientHeight() / 2.00000000);//00C5 : 1B 23 98 00 00 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 1E 00 00 00 40 16 AC 1B 17 98 00 00 16 1E 00 00 00 40 16 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 1E 00 00 00 40 16 AC 1B 1F 98 00 00 16 1E 00 00 00 40 16 16 16 
      } else {                                                                  //0115 : 06 94 01 
        mRequestedATradeLabel.SetText(Pawn.Trading.cl_GetPartnerName()
          @ Class'SBGuiStrings'.default.Has_requested_a_trade.Text);//0118 : 19 01 F8 6B 07 1B 33 00 00 1B 13 98 00 00 A8 19 19 00 48 20 04 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B E7 0E 00 00 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 E7 98 19 16 16 
        mRequestedPage.SetVisible(True);                                        //0154 : 19 01 70 45 8A 19 07 00 00 1B 14 98 00 00 27 16 
        mRequestingPage.SetVisible(False);                                      //0164 : 19 01 58 00 05 1B 07 00 00 1B 14 98 00 00 28 16 
        Resize(348.00000000,102.00000000);                                      //0174 : 1B B9 98 00 00 1E 00 00 AE 43 1E 00 00 CC 42 16 
        mDesktop.StartTrayWindow(self);                                         //0184 : 19 01 48 0C 9D 19 07 00 00 1B 16 99 00 00 17 16 
      }
    }
    //0F 00 48 20 04 1B 1B 2B 0C 00 00 16 07 94 01 82 77 00 48 20 04 1B 2A 16 18 12 00 77 19 00 48 20 
    //04 1B 05 00 04 01 C0 43 32 0F 2A 16 16 07 18 01 9A 39 3A 19 19 00 48 20 04 1B 05 00 04 01 C0 43 
    //32 0F 06 00 01 1B 37 1B 00 00 16 39 3A 12 20 B0 78 5F 01 02 00 01 24 01 16 19 01 70 45 8A 19 07 
    //00 00 1B 14 98 00 00 28 16 19 01 58 00 05 1B 07 00 00 1B 14 98 00 00 27 16 19 01 20 3B 08 1B 33 
    //00 00 1B 13 98 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 E6 98 19 19 19 00 48 20 
    //04 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B E7 0E 00 00 16 16 16 1B B9 98 00 00 1E 00 00 C8 43 1E 
    //00 00 2D 43 16 1B 23 98 00 00 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 1E 00 00 00 40 
    //16 AC 1B 17 98 00 00 16 1E 00 00 00 40 16 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 
    //1E 00 00 00 40 16 AC 1B 1F 98 00 00 16 1E 00 00 00 40 16 16 16 06 94 01 19 01 F8 6B 07 1B 33 00 
    //00 1B 13 98 00 00 A8 19 19 00 48 20 04 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B E7 0E 00 00 16 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 E7 98 19 16 16 19 01 70 45 8A 19 07 00 00 1B 14 98 
    //00 00 27 16 19 01 58 00 05 1B 07 00 00 1B 14 98 00 00 28 16 1B B9 98 00 00 1E 00 00 AE 43 1E 00 
    //00 CC 42 16 19 01 48 0C 9D 19 07 00 00 1B 16 99 00 00 17 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    local Game_Pawn Pawn;
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 A8 81 07 1B 16 
    if (flags == 1) {                                                           //000B : 07 1F 00 9A 00 A8 81 07 1B 26 16 
      SetupRequest();                                                           //0016 : 1B C2 9A 00 00 16 
    } else {                                                                    //001C : 06 E5 00 
      if (flags == 2) {                                                         //001F : 07 E5 00 9A 00 A8 81 07 1B 2C 02 16 
        Pawn = GetPawn();                                                       //002B : 0F 00 30 05 2D 26 1B 2B 0C 00 00 16 
        if (Pawn != None && Pawn.Trading != None) {                             //0037 : 07 E5 00 82 77 00 30 05 2D 26 2A 16 18 12 00 77 19 00 30 05 2D 26 05 00 04 01 C0 43 32 0F 2A 16 16 
          if (Pawn.Trading.cl_GetTradeState() == Class'Game_Trading'.1) {       //0058 : 07 9F 00 9A 39 3A 19 19 00 30 05 2D 26 05 00 04 01 C0 43 32 0F 06 00 01 1B 37 1B 00 00 16 39 3A 12 20 B0 78 5F 01 02 00 01 24 01 16 
            Pawn.Trading.cl_CancelTradeRequest();                               //0084 : 19 19 00 30 05 2D 26 05 00 04 01 C0 43 32 0F 06 00 00 1B 39 1B 00 00 16 
          } else {                                                              //009C : 06 E5 00 
            if (Pawn.Trading.cl_GetTradeState() == Class'Game_Trading'.2) {     //009F : 07 E5 00 9A 39 3A 19 19 00 30 05 2D 26 05 00 04 01 C0 43 32 0F 06 00 01 1B 37 1B 00 00 16 39 3A 12 20 B0 78 5F 01 02 00 01 24 02 16 
              Pawn.Trading.cl_RejectTradeRequest(7);                            //00CB : 19 19 00 30 05 2D 26 05 00 04 01 C0 43 32 0F 08 00 00 1B 12 0F 00 00 24 07 16 
            }
          }
        }
      }
    }
    //1C 20 7A 9E 19 00 A8 81 07 1B 16 07 1F 00 9A 00 A8 81 07 1B 26 16 1B C2 9A 00 00 16 06 E5 00 07 
    //E5 00 9A 00 A8 81 07 1B 2C 02 16 0F 00 30 05 2D 26 1B 2B 0C 00 00 16 07 E5 00 82 77 00 30 05 2D 
    //26 2A 16 18 12 00 77 19 00 30 05 2D 26 05 00 04 01 C0 43 32 0F 2A 16 16 07 9F 00 9A 39 3A 19 19 
    //00 30 05 2D 26 05 00 04 01 C0 43 32 0F 06 00 01 1B 37 1B 00 00 16 39 3A 12 20 B0 78 5F 01 02 00 
    //01 24 01 16 19 19 00 30 05 2D 26 05 00 04 01 C0 43 32 0F 06 00 00 1B 39 1B 00 00 16 06 E5 00 07 
    //E5 00 9A 39 3A 19 19 00 30 05 2D 26 05 00 04 01 C0 43 32 0F 06 00 01 1B 37 1B 00 00 16 39 3A 12 
    //20 B0 78 5F 01 02 00 01 24 02 16 19 19 00 30 05 2D 26 05 00 04 01 C0 43 32 0F 08 00 00 1B 12 0F 
    //00 00 24 07 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 28 9E 9E 19 16 
    SetTitle(Class'SBGuiStrings'.default.Trade_request.Text);                   //0006 : 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 E6 98 19 16 
    SetIcon("header_trade","SBGuiTX.GUI_Styles","GUI_Styles");                  //001F : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 74 72 61 64 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mRequestedPage = CreatePage("GUI_Page",0,0,2,2,348 - 6 - 4,66 - 4);         //0053 : 0F 01 70 45 8A 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 02 2C 02 93 93 1D 5C 01 00 00 2C 06 16 2C 04 16 93 2C 42 2C 04 16 16 
    mRequestedPage.SetStdBackground(7);                                         //0082 : 19 01 70 45 8A 19 08 00 00 1B 22 98 00 00 2C 07 16 
    mRequestedATradeLabel = mRequestedPage.CreateLabel("GUI_Label",524288,512,2,8,mRequestedPage.GetClientWidth() - 4,23);//0093 : 0F 01 F8 6B 07 1B 19 01 70 45 8A 19 38 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 1D 00 02 00 00 2C 02 2C 08 39 44 AF 19 01 70 45 8A 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 04 16 2C 17 16 
    mRequestedATradeLabel.SetFont("SBFontsTX.Verdana10");                       //00DA : 19 01 F8 6B 07 1B 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    mAcceptButton = mRequestedPage.CreateButton("GUI_Button",0,2,60,mRequestedPage.GetClientHeight() - 24 - 2,105,24);//00FE : 0F 01 E8 18 06 1B 19 01 70 45 8A 19 38 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 3C 39 44 AF AF 19 01 70 45 8A 19 06 00 04 1B 1F 98 00 00 16 39 3F 2C 18 16 39 3F 2C 02 16 2C 69 2C 18 16 
    mAcceptButton.SetText(Class'SBGuiStrings'.default.Accept.Text);             //0145 : 19 01 E8 18 06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 8F 98 19 16 
    mAcceptButton.__OnClick__Delegate = ClickHandler;                           //0167 : 45 19 01 E8 18 06 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mDeclineButton = mRequestedPage.CreateButton("GUI_Button",0,2,167,mRequestedPage.GetClientHeight() - 24 - 2,105,24);//017B : 0F 01 60 19 06 1B 19 01 70 45 8A 19 38 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C A7 39 44 AF AF 19 01 70 45 8A 19 06 00 04 1B 1F 98 00 00 16 39 3F 2C 18 16 39 3F 2C 02 16 2C 69 2C 18 16 
    mDeclineButton.SetText(Class'SBGuiStrings'.default.Decline.Text);           //01C2 : 19 01 60 19 06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 AF 98 19 16 
    mDeclineButton.__OnClick__Delegate = ClickHandler;                          //01E4 : 45 19 01 60 19 06 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    mRequestingPage = CreatePage("GUI_Page",0,0,0,0,394,141);                   //01F8 : 0F 01 58 00 05 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 1D 8A 01 00 00 2C 8D 16 
    mRequestingTextPage = mRequestingPage.CreatePage("GUI_Page",0,0,6,21,382,66);//0219 : 0F 01 08 72 07 1B 19 01 58 00 05 1B 1D 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 7E 01 00 00 2C 42 16 
    mRequestingTextPage.SetStdBackground(7);                                    //0245 : 19 01 08 72 07 1B 08 00 00 1B 22 98 00 00 2C 07 16 
    mRequestingTradeWithLabel = mRequestingTextPage.CreateLabel("GUI_Label",524288,512,0,22,375,23);//0256 : 0F 01 20 3B 08 1B 19 01 08 72 07 1B 25 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 1D 00 02 00 00 25 2C 16 1D 77 01 00 00 2C 17 16 
    mRequestingButtonPage = mRequestingPage.CreatePage("GUI_Page",0,0,6,93,382,42);//028A : 0F 01 30 81 07 1B 19 01 58 00 05 1B 1D 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 5D 1D 7E 01 00 00 2C 2A 16 
    mRequestingButtonPage.SetStdBackground(7);                                  //02B6 : 19 01 30 81 07 1B 08 00 00 1B 22 98 00 00 2C 07 16 
    mCancelButton = mRequestingButtonPage.CreateButton("GUI_Button",0,2,136,6,105,24);//02C7 : 0F 01 E0 2D 06 1B 19 01 30 81 07 1B 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 88 2C 06 2C 69 2C 18 16 
    mCancelButton.SetText(Class'SBGuiStrings'.default.Cancel.Text);             //02F3 : 19 01 E0 2D 06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 16 
    mCancelButton.__OnClick__Delegate = ClickHandler;                           //0315 : 45 19 01 E0 2D 06 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
    //1C 28 9E 9E 19 16 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 E6 98 19 16 1B 
    //28 98 00 00 1F 68 65 61 64 65 72 5F 74 72 61 64 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 
    //74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 70 45 8A 19 1B 16 98 00 00 1F 47 
    //55 49 5F 50 61 67 65 00 25 25 2C 02 2C 02 93 93 1D 5C 01 00 00 2C 06 16 2C 04 16 93 2C 42 2C 04 
    //16 16 19 01 70 45 8A 19 08 00 00 1B 22 98 00 00 2C 07 16 0F 01 F8 6B 07 1B 19 01 70 45 8A 19 38 
    //00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 1D 00 02 00 00 2C 02 2C 08 
    //39 44 AF 19 01 70 45 8A 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 04 16 2C 17 16 19 01 F8 6B 07 1B 
    //1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 0F 01 
    //E8 18 06 1B 19 01 70 45 8A 19 38 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 
    //02 2C 3C 39 44 AF AF 19 01 70 45 8A 19 06 00 04 1B 1F 98 00 00 16 39 3F 2C 18 16 39 3F 2C 02 16 
    //2C 69 2C 18 16 19 01 E8 18 06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 
    //0C 02 50 8F 98 19 16 45 19 01 E8 18 06 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 01 60 19 06 
    //1B 19 01 70 45 8A 19 38 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C A7 
    //39 44 AF AF 19 01 70 45 8A 19 06 00 04 1B 1F 98 00 00 16 39 3F 2C 18 16 39 3F 2C 02 16 2C 69 2C 
    //18 16 19 01 60 19 06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 
    //AF 98 19 16 45 19 01 60 19 06 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 01 58 00 05 1B 1B 16 
    //98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 1D 8A 01 00 00 2C 8D 16 0F 01 08 72 07 1B 19 
    //01 58 00 05 1B 1D 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 7E 01 
    //00 00 2C 42 16 19 01 08 72 07 1B 08 00 00 1B 22 98 00 00 2C 07 16 0F 01 20 3B 08 1B 19 01 08 72 
    //07 1B 25 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 1D 00 02 00 00 25 
    //2C 16 1D 77 01 00 00 2C 17 16 0F 01 30 81 07 1B 19 01 58 00 05 1B 1D 00 04 1B 16 98 00 00 1F 47 
    //55 49 5F 50 61 67 65 00 25 25 2C 06 2C 5D 1D 7E 01 00 00 2C 2A 16 19 01 30 81 07 1B 08 00 00 1B 
    //22 98 00 00 2C 07 16 0F 01 E0 2D 06 1B 19 01 30 81 07 1B 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 
    //42 75 74 74 6F 6E 00 25 2C 02 2C 88 2C 06 2C 69 2C 18 16 19 01 E0 2D 06 1B 19 00 00 1B 13 98 00 
    //00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 16 45 19 01 E0 2D 06 1B 05 00 08 01 
    //98 EB 9D 19 44 21 98 00 00 04 0B 47 
  }



