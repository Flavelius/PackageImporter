//==============================================================================
//  HUD_HelpKnowledgeBase
//==============================================================================

class HUD_HelpKnowledgeBase extends GUI_Window
    native
    dependsOn(GUI_Label,GED_Editor,GUI_TreeCtrl)
    Transient
    Config(User)
  ;

  var GUI_TreeCtrl mHelpSubjects;
  var GUI_Label mHelpTitle;
  var GUI_TextCtrl mHelpContent;
  var GUI_Button mTutorialButton;
  var GUI_Label mTutorialLabel;
  var GUI_Button mCloseButton;
  var export editinline Help_Article mRootArticle;


  native function SetTutorialsActive(bool Active);


  native function bool GetTutorialsActive();


  native function LoadContent(GUI_Label textTitle,GUI_TextCtrl textBody,export editinline Help_Article Article);


  native function LoadSubjects(GUI_TreeCtrl tree,export editinline Help_Article rootArticle);


  function bool CloseClick(GUI_Component clickedButton) {
    SetTutorialsActive(mTutorialButton.isChecked());                            //0000 : 1B 4E 99 00 00 19 01 D0 34 A3 19 06 00 04 1B 2F 98 00 00 16 16 
    mDesktop.ShowWindow(mWindowHandle,2);                                       //0015 : 19 01 48 0C 9D 19 0D 00 00 1B 57 2D 00 00 01 E8 77 9E 19 2C 02 16 
    return True;                                                                //002B : 04 27 
    //1B 4E 99 00 00 19 01 D0 34 A3 19 06 00 04 1B 2F 98 00 00 16 16 19 01 48 0C 9D 19 0D 00 00 1B 57 
    //2D 00 00 01 E8 77 9E 19 2C 02 16 04 27 04 0B 47 
  }


  function bool HelpSubjectItemSelect(GUI_TreeCtrl Source,int itemIndex,string itemText,Object itemData) {
    LoadContent(mHelpTitle,mHelpContent,Help_Article(itemData));                //0000 : 1B 9A 98 00 00 01 E8 36 A3 19 01 60 37 A3 19 2E 78 26 5D 01 00 D8 37 A3 19 16 
    return True;                                                                //001A : 04 27 
    //1B 9A 98 00 00 01 E8 36 A3 19 01 60 37 A3 19 2E 78 26 5D 01 00 D8 37 A3 19 16 04 27 04 0B 47 
  }


  event DoShowWindow(int flags) {
    local bool havePawn;
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 68 3A A3 19 16 
    if (IsVisible()) {                                                          //000B : 07 6C 00 1C C0 E6 88 19 16 
      havePawn = GetPawn() != None;                                             //0014 : 14 2D 00 A0 3B A3 19 77 1B 2B 0C 00 00 16 2A 16 
      mTutorialButton.SetVisible(havePawn);                                     //0024 : 19 01 D0 34 A3 19 0C 00 00 1B 14 98 00 00 2D 00 A0 3B A3 19 16 
      mTutorialLabel.SetVisible(havePawn);                                      //0039 : 19 01 18 3C A3 19 0C 00 00 1B 14 98 00 00 2D 00 A0 3B A3 19 16 
      if (havePawn) {                                                           //004E : 07 6C 00 2D 00 A0 3B A3 19 
        mTutorialButton.SetChecked(GetTutorialsActive());                       //0057 : 19 01 D0 34 A3 19 0C 00 00 1B 40 97 00 00 1B C4 98 00 00 16 16 
      }
    }
    //1C 20 7A 9E 19 00 68 3A A3 19 16 07 6C 00 1C C0 E6 88 19 16 14 2D 00 A0 3B A3 19 77 1B 2B 0C 00 
    //00 16 2A 16 19 01 D0 34 A3 19 0C 00 00 1B 14 98 00 00 2D 00 A0 3B A3 19 16 19 01 18 3C A3 19 0C 
    //00 00 1B 14 98 00 00 2D 00 A0 3B A3 19 16 07 6C 00 2D 00 A0 3B A3 19 19 01 D0 34 A3 19 0C 00 00 
    //1B 40 97 00 00 1B C4 98 00 00 16 16 04 0B 47 
  }


  event Initialize() {
    local GED_Editor Editor;
    mWidth = 665.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 40 26 44 
    mHeight = 500.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 00 FA 43 
    mTop = 100.00000000;                                                        //0016 : 0F 01 80 86 31 16 1E 00 00 C8 42 
    mLeft = 5.00000000;                                                         //0021 : 0F 01 08 86 31 16 1E 00 00 A0 40 
    Super.Initialize();                                                         //002C : 1C 28 9E 9E 19 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0032 : 0F 00 08 3D A3 19 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    Editor.Attach(self,"Help\KnowledgeBase.txt");                               //0057 : 19 00 08 3D A3 19 1F 00 00 1B 3F 01 00 00 17 1F 48 65 6C 70 5C 4B 6E 6F 77 6C 65 64 67 65 42 61 73 65 2E 74 78 74 00 16 
    mHelpSubjects = GUI_TreeCtrl(Editor.RetrieveComponent("mHelpSubjects"));    //007F : 0F 01 90 3C A3 19 2E 60 7E 2F 1D 19 00 08 3D A3 19 15 00 04 1B 15 98 00 00 1F 6D 48 65 6C 70 53 75 62 6A 65 63 74 73 00 16 
    mHelpSubjects.__OnItemSelect__Delegate = HelpSubjectItemSelect;             //00A8 : 45 19 01 90 3C A3 19 05 00 08 01 20 40 A3 19 44 44 9B 00 00 
    mHelpTitle = GUI_Label(Editor.RetrieveComponent("mHelpTitle"));             //00BC : 0F 01 E8 36 A3 19 2E 38 15 2F 1D 19 00 08 3D A3 19 12 00 04 1B 15 98 00 00 1F 6D 48 65 6C 70 54 69 74 6C 65 00 16 
    mHelpContent = GUI_TextCtrl(Editor.RetrieveComponent("mHelpContent"));      //00E2 : 0F 01 60 37 A3 19 2E 20 79 2F 1D 19 00 08 3D A3 19 14 00 04 1B 15 98 00 00 1F 6D 48 65 6C 70 43 6F 6E 74 65 6E 74 00 16 
    mTutorialButton = GUI_Button(Editor.RetrieveComponent("mTutorialButton"));  //010A : 0F 01 D0 34 A3 19 2E 78 F0 2E 1D 19 00 08 3D A3 19 17 00 04 1B 15 98 00 00 1F 6D 54 75 74 6F 72 69 61 6C 42 75 74 74 6F 6E 00 16 
    mTutorialLabel = GUI_Label(Editor.RetrieveComponent("mTutorialLabel"));     //0135 : 0F 01 18 3C A3 19 2E 38 15 2F 1D 19 00 08 3D A3 19 16 00 04 1B 15 98 00 00 1F 6D 54 75 74 6F 72 69 61 6C 4C 61 62 65 6C 00 16 
    mCloseButton = GUI_Button(Editor.RetrieveComponent("mCloseButton"));        //015F : 0F 01 98 40 A3 19 2E 78 F0 2E 1D 19 00 08 3D A3 19 14 00 04 1B 15 98 00 00 1F 6D 43 6C 6F 73 65 42 75 74 74 6F 6E 00 16 
    mCloseButton.__OnClick__Delegate = CloseClick;                              //0187 : 45 19 01 98 40 A3 19 05 00 08 01 98 EB 9D 19 44 56 99 00 00 
    LoadSubjects(mHelpSubjects,mRootArticle);                                   //019B : 1B 40 9B 00 00 01 90 3C A3 19 01 10 41 A3 19 16 
    LoadContent(mHelpTitle,mHelpContent,mRootArticle);                          //01AB : 1B 9A 98 00 00 01 E8 36 A3 19 01 60 37 A3 19 01 10 41 A3 19 16 
    Invalidate();                                                               //01C0 : 1B 1D 98 00 00 16 
    //0F 01 60 87 31 16 1E 00 40 26 44 0F 01 40 88 31 16 1E 00 00 FA 43 0F 01 80 86 31 16 1E 00 00 C8 
    //42 0F 01 08 86 31 16 1E 00 00 A0 40 1C 28 9E 9E 19 16 0F 00 08 3D A3 19 2E D8 2F 32 1D 19 01 48 
    //0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 19 00 08 3D A3 19 1F 00 00 
    //1B 3F 01 00 00 17 1F 48 65 6C 70 5C 4B 6E 6F 77 6C 65 64 67 65 42 61 73 65 2E 74 78 74 00 16 0F 
    //01 90 3C A3 19 2E 60 7E 2F 1D 19 00 08 3D A3 19 15 00 04 1B 15 98 00 00 1F 6D 48 65 6C 70 53 75 
    //62 6A 65 63 74 73 00 16 45 19 01 90 3C A3 19 05 00 08 01 20 40 A3 19 44 44 9B 00 00 0F 01 E8 36 
    //A3 19 2E 38 15 2F 1D 19 00 08 3D A3 19 12 00 04 1B 15 98 00 00 1F 6D 48 65 6C 70 54 69 74 6C 65 
    //00 16 0F 01 60 37 A3 19 2E 20 79 2F 1D 19 00 08 3D A3 19 14 00 04 1B 15 98 00 00 1F 6D 48 65 6C 
    //70 43 6F 6E 74 65 6E 74 00 16 0F 01 D0 34 A3 19 2E 78 F0 2E 1D 19 00 08 3D A3 19 17 00 04 1B 15 
    //98 00 00 1F 6D 54 75 74 6F 72 69 61 6C 42 75 74 74 6F 6E 00 16 0F 01 18 3C A3 19 2E 38 15 2F 1D 
    //19 00 08 3D A3 19 16 00 04 1B 15 98 00 00 1F 6D 54 75 74 6F 72 69 61 6C 4C 61 62 65 6C 00 16 0F 
    //01 98 40 A3 19 2E 78 F0 2E 1D 19 00 08 3D A3 19 14 00 04 1B 15 98 00 00 1F 6D 43 6C 6F 73 65 42 
    //75 74 74 6F 6E 00 16 45 19 01 98 40 A3 19 05 00 08 01 98 EB 9D 19 44 56 99 00 00 1B 40 9B 00 00 
    //01 90 3C A3 19 01 10 41 A3 19 16 1B 9A 98 00 00 01 E8 36 A3 19 01 60 37 A3 19 01 10 41 A3 19 16 
    //1B 1D 98 00 00 16 04 0B 47 
  }



