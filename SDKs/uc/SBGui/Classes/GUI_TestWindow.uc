//==============================================================================
//  GUI_TestWindow
//==============================================================================

class GUI_TestWindow extends GUI_Window
    dependsOn(GUI_SplitCtrl)
    Transient
    Config(User)
  ;

  var GUI_Button mButton1;
  var GUI_Button mButton2;
  var GUI_Button mButton3;
  var GUI_SplitCtrl mSplitPage;
  var GUI_Page mLeftPage;
  var GUI_Page mMiddlePage;
  var GUI_Page mRightPage;
  var GUI_TabCtrl mTabPage;
  var GUI_Page mTabPage1;
  var GUI_Page mTabPage2;
  var GUI_Page mTabPage3;
  var GUI_Page mTabPage4;
  var GUI_Page mTabPage5;


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 28 9E 9E 19 16 
    mButton1 = CreateButton("GUI_Button",0,0,10,10,200,24);                     //0006 : 0F 01 60 B3 33 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 2C 0A 2C 0A 2C C8 2C 18 16 
    mButton1.SetBackground("textbutton");                                       //0028 : 19 01 60 B3 33 26 12 00 00 1B 1A 98 00 00 1F 74 65 78 74 62 75 74 74 6F 6E 00 16 
    mButton2 = CreateButton("GUI_Button",0,0,300,300);                          //0043 : 0F 01 78 B5 33 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 1D 2C 01 00 00 1D 2C 01 00 00 16 
    mButton2.SetBackground("textbutton");                                       //0067 : 19 01 78 B5 33 26 12 00 00 1B 1A 98 00 00 1F 74 65 78 74 62 75 74 74 6F 6E 00 16 
    mButton3 = CreateButton("GUI_Button",0,0,350,350);                          //0082 : 0F 01 D8 C5 33 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 1D 5E 01 00 00 1D 5E 01 00 00 16 
    mButton3.SetBackground("textbutton");                                       //00A6 : 19 01 D8 C5 33 26 12 00 00 1B 1A 98 00 00 1F 74 65 78 74 62 75 74 74 6F 6E 00 16 
    mSplitPage = GUI_SplitCtrl(CreatePage("GUI_SplitCtrl",0,0,50,50,200,200));  //00C1 : 0F 01 78 26 04 1B 2E 48 69 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 53 70 6C 69 74 43 74 72 6C 00 25 25 2C 32 2C 32 2C C8 2C C8 16 
    mSplitPage.SetStdBackground(Class'GUI_BaseDesktop'.4);                      //00EB : 19 01 78 26 04 1B 11 00 00 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 2C 04 16 
    mSplitPage.SetBorder(3,3,3,3,"windowsizableframe");                         //0105 : 19 01 78 26 04 1B 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    mLeftPage = mSplitPage.CreatePage("GUI_Page",0,0,0,0,50);                   //0130 : 0F 01 00 D1 33 26 19 01 78 26 04 1B 16 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 2C 32 16 
    mLeftPage.SetBorder(3,3,3,3,"windowsizableframe");                          //0155 : 19 01 00 D1 33 26 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    mMiddlePage = mSplitPage.CreatePage("GUI_Page",0,0,0,0,100);                //0180 : 0F 01 78 D1 33 26 19 01 78 26 04 1B 16 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 2C 64 16 
    mMiddlePage.SetBorder(3,3,3,3,"windowsizableframe");                        //01A5 : 19 01 78 D1 33 26 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    mRightPage = mSplitPage.CreatePage("GUI_Page",0,0,0,0,200);                 //01D0 : 0F 01 88 D0 33 26 19 01 78 26 04 1B 16 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 2C C8 16 
    mRightPage.SetBorder(3,3,3,3,"windowsizableframe");                         //01F5 : 19 01 88 D0 33 26 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    //1C 28 9E 9E 19 16 0F 01 60 B3 33 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 2C 
    //0A 2C 0A 2C C8 2C 18 16 19 01 60 B3 33 26 12 00 00 1B 1A 98 00 00 1F 74 65 78 74 62 75 74 74 6F 
    //6E 00 16 0F 01 78 B5 33 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 1D 2C 01 00 
    //00 1D 2C 01 00 00 16 19 01 78 B5 33 26 12 00 00 1B 1A 98 00 00 1F 74 65 78 74 62 75 74 74 6F 6E 
    //00 16 0F 01 D8 C5 33 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 1D 5E 01 00 00 
    //1D 5E 01 00 00 16 19 01 D8 C5 33 26 12 00 00 1B 1A 98 00 00 1F 74 65 78 74 62 75 74 74 6F 6E 00 
    //16 0F 01 78 26 04 1B 2E 48 69 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 53 70 6C 69 74 43 74 72 6C 00 
    //25 25 2C 32 2C 32 2C C8 2C C8 16 19 01 78 26 04 1B 11 00 00 1B 22 98 00 00 12 20 00 68 D7 00 02 
    //00 04 2C 04 16 19 01 78 26 04 1B 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 
    //6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 0F 01 00 D1 33 26 19 01 78 26 04 1B 16 00 04 1B 
    //16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 2C 32 16 19 01 00 D1 33 26 22 00 00 1B 2B 
    //98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    //0F 01 78 D1 33 26 19 01 78 26 04 1B 16 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 
    //25 25 2C 64 16 19 01 78 D1 33 26 22 00 00 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 
    //6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 0F 01 88 D0 33 26 19 01 78 26 04 1B 16 00 04 1B 
    //16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 2C C8 16 19 01 88 D0 33 26 22 00 00 1B 2B 
    //98 00 00 2C 03 2C 03 2C 03 2C 03 1F 77 69 6E 64 6F 77 73 69 7A 61 62 6C 65 66 72 61 6D 65 00 16 
    //04 0B 47 
  }



