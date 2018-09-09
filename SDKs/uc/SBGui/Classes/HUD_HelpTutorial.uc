//==============================================================================
//  HUD_HelpTutorial
//==============================================================================

class HUD_HelpTutorial extends GUI_Window
    native
    dependsOn(SBDBSync,GUI_TextCtrl,GUI_Label)
    Transient
    Config(User)
  ;

  var private GUI_Page mMainPage;
  var private GUI_TextCtrl mHelpTitle;
  var private GUI_TextCtrl mHelpContent;
  var private GUI_Button mTutorialButton;
  var private GUI_Label mTutorialLabel;
  var private GUI_Button mCloseButton;
  var private export editinline Help_Article mRootArticle;


  native function Help_Article GetArticleByTag(string articleTag);


  native function SetTutorialsActive(bool Active);


  native function bool GetTutorialsActive();


  native function LoadContent(GUI_TextCtrl textTitle,GUI_TextCtrl textBody,export editinline Help_Article Article);


  function bool SetTutorialByTag(string articleTag) {
    local export editinline Help_Article Article;
    Article = GetArticleByTag(articleTag);                                      //0000 : 0F 00 60 E7 A2 19 1B 46 9B 00 00 00 78 E6 A2 19 16 
    LoadContent(mHelpTitle,mHelpContent,Article);                               //0011 : 1B 9A 98 00 00 01 D8 E7 A2 19 01 50 E8 A2 19 00 60 E7 A2 19 16 
    return Article != None;                                                     //0026 : 04 77 00 60 E7 A2 19 2A 16 
    //0F 00 60 E7 A2 19 1B 46 9B 00 00 00 78 E6 A2 19 16 1B 9A 98 00 00 01 D8 E7 A2 19 01 50 E8 A2 19 
    //00 60 E7 A2 19 16 04 77 00 60 E7 A2 19 2A 16 04 0B 47 
  }


  function bool SetTutorialByID(int articleID) {
    local export editinline Help_Article Article;
    Article = Help_Article(Class'SBDBSync'.GetResourceObject(articleID));       //0000 : 0F 00 E8 EA A2 19 2E 78 26 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 F0 E9 A2 19 16 
    LoadContent(mHelpTitle,mHelpContent,Article);                               //001F : 1B 9A 98 00 00 01 D8 E7 A2 19 01 50 E8 A2 19 00 E8 EA A2 19 16 
    return Article != None;                                                     //0034 : 04 77 00 E8 EA A2 19 2A 16 
    //0F 00 E8 EA A2 19 2E 78 26 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 F0 E9 A2 19 16 1B 
    //9A 98 00 00 01 D8 E7 A2 19 01 50 E8 A2 19 00 E8 EA A2 19 16 04 77 00 E8 EA A2 19 2A 16 04 0B 47 
    //
  }


  function bool CloseClick(GUI_Component clickedButton) {
    SetTutorialsActive(!mTutorialButton.isChecked());                           //0000 : 1B 4E 99 00 00 81 19 01 88 ED A2 19 06 00 04 1B 2F 98 00 00 16 16 16 
    mDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.69,Class'GUI_BaseDesktop'.2); //0017 : 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 45 12 20 00 68 D7 00 02 00 04 2C 02 16 
    return True;                                                                //003C : 04 27 
    //1B 4E 99 00 00 81 19 01 88 ED A2 19 06 00 04 1B 2F 98 00 00 16 16 16 19 01 48 0C 9D 19 1C 00 04 
    //1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 45 12 20 00 68 D7 00 02 00 04 2C 02 16 04 27 04 0B 
    //47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 28 EF A2 19 16 
    if (IsVisible()) {                                                          //000B : 07 2B 00 1C C0 E6 88 19 16 
      mTutorialButton.SetChecked(!GetTutorialsActive());                        //0014 : 19 01 88 ED A2 19 0E 00 00 1B 40 97 00 00 81 1B C4 98 00 00 16 16 16 
    }
    //1C 20 7A 9E 19 00 28 EF A2 19 16 07 2B 00 1C C0 E6 88 19 16 19 01 88 ED A2 19 0E 00 00 1B 40 97 
    //00 00 81 1B C4 98 00 00 16 16 16 04 0B 47 
  }


  event Initialize() {
    mWidth = 348.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 00 AE 43 
    mHeight = 170.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 00 2A 43 
    Super.Initialize();                                                         //0016 : 1C 28 9E 9E 19 16 
    SetIcon("header_questlog","SBGuiTX.GUI_Styles","GUI_Styles");               //001C : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 71 75 65 73 74 6C 6F 67 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mMainPage = CreatePage("GUI_Page",0,8,2,2,GetClientWidth() - 2 - 2,108);    //0053 : 0F 01 08 F0 A2 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 2C 08 2C 02 2C 02 39 44 AF AF 1B 17 98 00 00 16 39 3F 2C 02 16 39 3F 2C 02 16 2C 6C 16 
    mMainPage.SetStdBackground(7);                                              //0086 : 19 01 08 F0 A2 19 08 00 00 1B 22 98 00 00 2C 07 16 
    mHelpTitle = GUI_TextCtrl(mMainPage.CreatePage("GUI_TextCtrl",0,0,0,0,mMainPage.GetClientWidth() - 17,15));//0097 : 0F 01 D8 E7 A2 19 2E 20 79 2F 1D 19 01 08 F0 A2 19 31 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 25 25 39 44 AF 19 01 08 F0 A2 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 11 16 2C 0F 16 
    mHelpTitle.SetFont("SBFontsTX.Verdana10");                                  //00DC : 19 01 D8 E7 A2 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    mHelpTitle.SetColor(0,0,0);                                                 //0100 : 19 01 D8 E7 A2 19 09 00 00 1B 19 98 00 00 25 25 25 16 
    mHelpTitle.SetSolidBackground(183.00000000,182.00000000,188.00000000);      //0112 : 19 01 D8 E7 A2 19 15 00 00 1B 52 98 00 00 1E 00 00 37 43 1E 00 00 36 43 1E 00 00 3C 43 16 
    mHelpContent = GUI_TextCtrl(mMainPage.CreatePage("GUI_TextCtrl",0,0,0,15,mMainPage.GetClientWidth() - 17,118));//0130 : 0F 01 50 E8 A2 19 2E 20 79 2F 1D 19 01 08 F0 A2 19 32 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 25 2C 0F 39 44 AF 19 01 08 F0 A2 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 11 16 2C 76 16 
    mHelpContent.SetFont("SBFontsTX.Verdana10");                                //0176 : 19 01 50 E8 A2 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    mHelpContent.SetColor(255,255,255);                                         //019A : 19 01 50 E8 A2 19 0C 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 16 
    mTutorialButton = CreateButton("GUI_Button",4194304,4,2,108 + 6);           //01AF : 0F 01 88 ED A2 19 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 04 2C 02 92 2C 6C 2C 06 16 16 
    mTutorialLabel = CreateLabel("GUI_Label",0,256 | 2048,26,108 + 6,200,19);   //01D6 : 0F 01 80 F4 A2 19 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 01 00 00 1D 00 08 00 00 16 2C 1A 92 2C 6C 2C 06 16 2C C8 2C 13 16 
    mTutorialLabel.SetColor(255,255,255);                                       //0206 : 19 01 80 F4 A2 19 0C 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 16 
    mTutorialLabel.SetText(Class'SBGuiStrings'.default.Disable_tutorials.Text); //021B : 19 01 80 F4 A2 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 7B 2F 16 16 
    mCloseButton = CreateButton("GUI_Button",4194304,2,GetClientWidth() - 105 - 4,108 + 4);//023D : 0F 01 F8 F4 A2 19 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 39 44 AF AF 1B 17 98 00 00 16 39 3F 2C 69 16 39 3F 2C 04 16 92 2C 6C 2C 04 16 16 
    mCloseButton.SetText(Class'SBGuiStrings'.default.Continue.Text);            //0276 : 19 01 F8 F4 A2 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 CD 98 19 16 
    mCloseButton.__OnClick__Delegate = CloseClick;                              //0298 : 45 19 01 F8 F4 A2 19 05 00 08 01 98 EB 9D 19 44 56 99 00 00 
    LoadContent(mHelpTitle,mHelpContent,mRootArticle);                          //02AC : 1B 9A 98 00 00 01 D8 E7 A2 19 01 50 E8 A2 19 01 70 F5 A2 19 16 
    Invalidate();                                                               //02C1 : 1B 1D 98 00 00 16 
    //0F 01 60 87 31 16 1E 00 00 AE 43 0F 01 40 88 31 16 1E 00 00 2A 43 1C 28 9E 9E 19 16 1B 28 98 00 
    //00 1F 68 65 61 64 65 72 5F 71 75 65 73 74 6C 6F 67 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 
    //74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 01 08 F0 A2 19 1B 16 98 00 00 1F 47 
    //55 49 5F 50 61 67 65 00 25 2C 08 2C 02 2C 02 39 44 AF AF 1B 17 98 00 00 16 39 3F 2C 02 16 39 3F 
    //2C 02 16 2C 6C 16 19 01 08 F0 A2 19 08 00 00 1B 22 98 00 00 2C 07 16 0F 01 D8 E7 A2 19 2E 20 79 
    //2F 1D 19 01 08 F0 A2 19 31 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 
    //25 25 39 44 AF 19 01 08 F0 A2 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 11 16 2C 0F 16 19 01 D8 E7 
    //A2 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    //19 01 D8 E7 A2 19 09 00 00 1B 19 98 00 00 25 25 25 16 19 01 D8 E7 A2 19 15 00 00 1B 52 98 00 00 
    //1E 00 00 37 43 1E 00 00 36 43 1E 00 00 3C 43 16 0F 01 50 E8 A2 19 2E 20 79 2F 1D 19 01 08 F0 A2 
    //19 32 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 25 2C 0F 39 44 AF 19 
    //01 08 F0 A2 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 11 16 2C 76 16 19 01 50 E8 A2 19 1B 00 00 1B 
    //25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 19 01 50 E8 A2 19 
    //0C 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 16 0F 01 88 ED A2 19 1B 18 98 00 00 1F 47 55 49 5F 42 
    //75 74 74 6F 6E 00 1D 00 00 40 00 2C 04 2C 02 92 2C 6C 2C 06 16 16 0F 01 80 F4 A2 19 1B 20 98 00 
    //00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 01 00 00 1D 00 08 00 00 16 2C 1A 92 2C 6C 2C 06 
    //16 2C C8 2C 13 16 19 01 80 F4 A2 19 0C 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 16 19 01 80 F4 A2 
    //19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 7B 2F 16 16 0F 01 F8 
    //F4 A2 19 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 1D 00 00 40 00 2C 02 39 44 AF AF 1B 
    //17 98 00 00 16 39 3F 2C 69 16 39 3F 2C 04 16 92 2C 6C 2C 04 16 16 19 01 F8 F4 A2 19 19 00 00 1B 
    //13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 CD 98 19 16 45 19 01 F8 F4 A2 19 05 
    //00 08 01 98 EB 9D 19 44 56 99 00 00 1B 9A 98 00 00 01 D8 E7 A2 19 01 50 E8 A2 19 01 70 F5 A2 19 
    //16 1B 1D 98 00 00 16 04 0B 47 
  }



