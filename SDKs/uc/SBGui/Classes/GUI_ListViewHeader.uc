//==============================================================================
//  GUI_ListViewHeader
//==============================================================================

class GUI_ListViewHeader extends GUI_Page
    native
    dependsOn(GUI_Label)
    Transient
    Config(User)
  ;

  var GUI_Label mLabel;
  var GUI_Page mArrowUp;
  var GUI_Page mArrowDn;


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    SetStdBackground(7);                                                        //0006 : 1B 22 98 00 00 2C 07 16 
    mLabel = CreateLabel("GUI_Label",524288,0,0,0,GetClientWidth(),GetClientHeight());//000E : 0F 01 C8 F4 A3 19 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 25 25 25 39 44 1B 17 98 00 00 16 39 44 1B 1F 98 00 00 16 16 
    mLabel.SetTextBorder(3.00000000,0.00000000);                                //003D : 19 01 C8 F4 A3 19 10 00 00 1B 49 98 00 00 1E 00 00 40 40 1E 00 00 00 00 16 
    mArrowUp = CreatePage("GUI_Page",768,0,0,0);                                //0056 : 0F 01 28 F8 A3 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 03 00 00 25 25 25 16 
    mArrowUp.SetBackground("tableview_up","SBGuiTX.GUI_Styles","GUI_Styles");   //0074 : 19 01 28 F8 A3 19 34 00 00 1B 1A 98 00 00 1F 74 61 62 6C 65 76 69 65 77 5F 75 70 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mArrowUp.SetPosition(GetClientWidth() - mArrowUp.mTexWidth - GetClientHeight() / 2 - mArrowUp.mTexHeight / 2,GetClientHeight() / 2 - mArrowUp.mTexHeight / 2,mArrowUp.mTexWidth,mArrowUp.mTexHeight);//00B1 : 19 01 28 F8 A3 19 7E 00 00 1B 23 98 00 00 AF AF 1B 17 98 00 00 16 19 01 28 F8 A3 19 05 00 04 01 F0 8A 31 16 16 AF AC 1B 1F 98 00 00 16 39 3F 2C 02 16 AC 19 01 28 F8 A3 19 05 00 04 01 E0 8B 31 16 39 3F 2C 02 16 16 16 AF AC 1B 1F 98 00 00 16 39 3F 2C 02 16 AC 19 01 28 F8 A3 19 05 00 04 01 E0 8B 31 16 39 3F 2C 02 16 16 19 01 28 F8 A3 19 05 00 04 01 F0 8A 31 16 19 01 28 F8 A3 19 05 00 04 01 E0 8B 31 16 16 
    mArrowUp.SetVisible(False);                                                 //0138 : 19 01 28 F8 A3 19 07 00 00 1B 14 98 00 00 28 16 
    mArrowDn = CreatePage("GUI_Page",768,0,0,0);                                //0148 : 0F 01 A0 F8 A3 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 03 00 00 25 25 25 16 
    mArrowDn.SetBackground("tableview_down","SBGuiTX.GUI_Styles","GUI_Styles"); //0166 : 19 01 A0 F8 A3 19 36 00 00 1B 1A 98 00 00 1F 74 61 62 6C 65 76 69 65 77 5F 64 6F 77 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mArrowDn.SetPosition(mArrowUp.mLeft,mArrowUp.mTop,mArrowDn.mTexWidth,mArrowDn.mTexHeight);//01A5 : 19 01 A0 F8 A3 19 3E 00 00 1B 23 98 00 00 19 01 28 F8 A3 19 05 00 04 01 08 86 31 16 19 01 28 F8 A3 19 05 00 04 01 80 86 31 16 19 01 A0 F8 A3 19 05 00 04 01 F0 8A 31 16 19 01 A0 F8 A3 19 05 00 04 01 E0 8B 31 16 16 
    mArrowDn.SetVisible(False);                                                 //01EC : 19 01 A0 F8 A3 19 07 00 00 1B 14 98 00 00 28 16 
    //1C 40 5B 9E 19 16 1B 22 98 00 00 2C 07 16 0F 01 C8 F4 A3 19 1B 20 98 00 00 1F 47 55 49 5F 4C 61 
    //62 65 6C 00 1D 00 00 08 00 25 25 25 39 44 1B 17 98 00 00 16 39 44 1B 1F 98 00 00 16 16 19 01 C8 
    //F4 A3 19 10 00 00 1B 49 98 00 00 1E 00 00 40 40 1E 00 00 00 00 16 0F 01 28 F8 A3 19 1B 16 98 00 
    //00 1F 47 55 49 5F 50 61 67 65 00 1D 00 03 00 00 25 25 25 16 19 01 28 F8 A3 19 34 00 00 1B 1A 98 
    //00 00 1F 74 61 62 6C 65 76 69 65 77 5F 75 70 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 
    //6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 19 01 28 F8 A3 19 7E 00 00 1B 23 98 00 00 AF 
    //AF 1B 17 98 00 00 16 19 01 28 F8 A3 19 05 00 04 01 F0 8A 31 16 16 AF AC 1B 1F 98 00 00 16 39 3F 
    //2C 02 16 AC 19 01 28 F8 A3 19 05 00 04 01 E0 8B 31 16 39 3F 2C 02 16 16 16 AF AC 1B 1F 98 00 00 
    //16 39 3F 2C 02 16 AC 19 01 28 F8 A3 19 05 00 04 01 E0 8B 31 16 39 3F 2C 02 16 16 19 01 28 F8 A3 
    //19 05 00 04 01 F0 8A 31 16 19 01 28 F8 A3 19 05 00 04 01 E0 8B 31 16 16 19 01 28 F8 A3 19 07 00 
    //00 1B 14 98 00 00 28 16 0F 01 A0 F8 A3 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 03 
    //00 00 25 25 25 16 19 01 A0 F8 A3 19 36 00 00 1B 1A 98 00 00 1F 74 61 62 6C 65 76 69 65 77 5F 64 
    //6F 77 6E 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 
    //6C 65 73 00 16 19 01 A0 F8 A3 19 3E 00 00 1B 23 98 00 00 19 01 28 F8 A3 19 05 00 04 01 08 86 31 
    //16 19 01 28 F8 A3 19 05 00 04 01 80 86 31 16 19 01 A0 F8 A3 19 05 00 04 01 F0 8A 31 16 19 01 A0 
    //F8 A3 19 05 00 04 01 E0 8B 31 16 16 19 01 A0 F8 A3 19 07 00 00 1B 14 98 00 00 28 16 04 0B 47 
  }



