//==============================================================================
//  HUD_SkillDebugLog
//==============================================================================

class HUD_SkillDebugLog extends GUI_Window
    dependsOn(Game_Pawn,Game_Skills,GUI_TextCtrl,GUI_ComboBox)
    Transient
    Config(User)
  ;

  const COMBOBOX_HEIGHT =  500;
  const COMBOBOX_WIDTH =  150;
  const HOR_SPACING =  10;
  const BUTTON_WIDTH =  80;
  const spacing =  4;
  const TOP_MARGE =  32;
  var GUI_TextCtrl mTextCtrl;
  var GUI_Button mClear;
  var GUI_Button mExport;
  var GUI_ComboBox mLogLevel;


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 00 36 08 1B 16 
    GetPawn().Skills.cl2sv_EnableSkillLog_CallStub(flags == Class'GUI_BaseDesktop'.1);//000B : 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 17 00 00 1B EB 1B 00 00 9A 00 00 36 08 1B 12 20 00 68 D7 00 01 00 04 26 16 16 
    //1C 20 7A 9E 19 00 00 36 08 1B 16 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 17 00 00 1B EB 
    //1B 00 00 9A 00 00 36 08 1B 12 20 00 68 D7 00 01 00 04 26 16 16 04 0B 47 
  }


  function bool ExportHandler(GUI_Component clickedButton) {
    mTextCtrl.ExportToFile();                                                   //0000 : 19 01 68 43 04 1B 06 00 00 1B 18 9B 00 00 16 
    return True;                                                                //000F : 04 27 
    //19 01 68 43 04 1B 06 00 00 1B 18 9B 00 00 16 04 27 04 0B 47 
  }


  function bool ClearHandler(GUI_Component clickedButton) {
    mTextCtrl.Empty();                                                          //0000 : 19 01 68 43 04 1B 06 00 00 1B BE 1A 00 00 16 
    return True;                                                                //000F : 04 27 
    //19 01 68 43 04 1B 06 00 00 1B BE 1A 00 00 16 04 27 04 0B 47 
  }


  function SkillLogHandler(int aLogLevel,string aString) {
    local int sel;
    sel = mLogLevel.GetSelection();                                             //0000 : 0F 00 68 8B 07 1B 19 01 40 91 2B 26 06 00 04 1B 27 98 00 00 16 
    if (sel == 0 || aLogLevel <= sel) {                                         //0015 : 07 59 00 84 9A 00 68 8B 07 1B 25 16 18 0D 00 98 00 F0 36 08 1B 00 68 8B 07 1B 16 16 
      mTextCtrl.AddText("<" $ string(aLogLevel) $ "> " $ aString);              //0031 : 19 01 68 43 04 1B 1F 00 00 1B AE 96 00 00 70 70 70 1F 3C 00 39 53 00 F0 36 08 1B 16 1F 3E 20 00 16 00 50 4F 34 26 16 16 
    }
    //0F 00 68 8B 07 1B 19 01 40 91 2B 26 06 00 04 1B 27 98 00 00 16 07 59 00 84 9A 00 68 8B 07 1B 25 
    //16 18 0D 00 98 00 F0 36 08 1B 00 68 8B 07 1B 16 16 19 01 68 43 04 1B 1F 00 00 1B AE 96 00 00 70 
    //70 70 1F 3C 00 39 53 00 F0 36 08 1B 16 1F 3E 20 00 16 00 50 4F 34 26 16 16 04 0B 47 
  }


  event OnComponentDestroyed() {
    GetPawn().Skills.__OnSkillLog__Delegate = None;                             //0000 : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 88 1D 24 11 44 00 00 00 00 
    Super.OnComponentDestroyed();                                               //001E : 1C E0 DA 9D 19 16 
    //45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 88 1D 24 11 44 00 00 00 00 1C E0 
    //DA 9D 19 16 04 0B 47 
  }


  event Initialize() {
    local GUI_Page textContainer;
    mWidth = 400.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 00 C8 43 
    mHeight = 300.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 00 96 43 
    Super.Initialize();                                                         //0016 : 1C 28 9E 9E 19 16 
    textContainer = GUI_TextCtrl(CreatePage("GUI_TextCtrl",0,Class'GUI_Desktop'.2,10,32,GetClientWidth() - 10 * 2,GetClientHeight() - 32));//001C : 0F 00 88 86 07 1B 2E 20 79 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 12 20 48 DB 2E 1D 02 00 04 2C 02 2C 0A 2C 20 39 44 AF 1B 17 98 00 00 16 39 3F 90 2C 0A 2C 02 16 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 20 16 16 
    textContainer.SetAnchors(0.00000000,0.00000000,1.00000000,1.00000000);      //006B : 19 00 88 86 07 1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 
    mTextCtrl = GUI_TextCtrl(textContainer.CreatePage("GUI_TextCtrl",0,0,10,32,GetClientWidth(),GetClientHeight() - 32));//008E : 0F 01 68 43 04 1B 2E 20 79 2F 1D 19 00 88 86 07 1B 30 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 2C 0A 2C 20 39 44 1B 17 98 00 00 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 20 16 16 
    mTextCtrl.SetAnchors(0.00000000,0.00000000,1.00000000,1.00000000);          //00D2 : 19 01 68 43 04 1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 
    mClear = CreateButton("GUI_Button",0,Class'GUI_BaseDesktop'.2,2 * 10 + 150,4,80,32 - 4 * 2);//00F5 : 0F 01 B0 24 06 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 12 20 00 68 D7 00 02 00 04 2C 02 92 90 2C 02 2C 0A 16 2C 96 16 2C 04 2C 50 93 2C 20 90 2C 04 2C 02 16 16 16 
    mClear.SetText("Clear");                                                    //0131 : 19 01 B0 24 06 1B 0D 00 00 1B 13 98 00 00 1F 43 6C 65 61 72 00 16 
    mClear.__OnClick__Delegate = ClearHandler;                                  //0147 : 45 19 01 B0 24 06 1B 05 00 08 01 98 EB 9D 19 44 C6 9A 00 00 
    mClear.SetAnchors(0.00000000,0.00000000,0.00000000,0.00000000);             //015B : 19 01 B0 24 06 1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 
    mExport = CreateButton("GUI_Button",0,Class'GUI_BaseDesktop'.2,3 * 10 + 150 + 80,4,80,32 - 4 * 2);//017E : 0F 01 28 25 06 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 12 20 00 68 D7 00 02 00 04 2C 02 92 92 90 2C 03 2C 0A 16 2C 96 16 2C 50 16 2C 04 2C 50 93 2C 20 90 2C 04 2C 02 16 16 16 
    mExport.SetText("Export");                                                  //01BE : 19 01 28 25 06 1B 0E 00 00 1B 13 98 00 00 1F 45 78 70 6F 72 74 00 16 
    mExport.__OnClick__Delegate = ExportHandler;                                //01D5 : 45 19 01 28 25 06 1B 05 00 08 01 98 EB 9D 19 44 C7 9A 00 00 
    mExport.SetAnchors(0.00000000,0.00000000,0.00000000,0.00000000);            //01E9 : 19 01 28 25 06 1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 
    mLogLevel = CreateComboBox("GUI_ComboBox",0,Class'GUI_BaseDesktop'.1,10,4,150,500);//020C : 0F 01 40 91 2B 26 1B 1F 99 00 00 1F 47 55 49 5F 43 6F 6D 62 6F 42 6F 78 00 25 12 20 00 68 D7 00 01 00 04 26 2C 0A 2C 04 2C 96 1D F4 01 00 00 16 
    mLogLevel.SetAnchors(0.00000000,0.00000000,0.00000000,0.00000000);          //023C : 19 01 40 91 2B 26 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 
    mLogLevel.AddItem(0,"All");                                                 //025F : 19 01 40 91 2B 26 0C 00 00 1B 52 10 00 00 25 1F 41 6C 6C 00 16 
    mLogLevel.AddItem(1,"Errors");                                              //0274 : 19 01 40 91 2B 26 0F 00 00 1B 52 10 00 00 26 1F 45 72 72 6F 72 73 00 16 
    mLogLevel.AddItem(2,"Warnings");                                            //028C : 19 01 40 91 2B 26 12 00 00 1B 52 10 00 00 2C 02 1F 57 61 72 6E 69 6E 67 73 00 16 
    mLogLevel.AddItem(3,"Hints");                                               //02A7 : 19 01 40 91 2B 26 0F 00 00 1B 52 10 00 00 2C 03 1F 48 69 6E 74 73 00 16 
    mLogLevel.AddItem(4,"Debug");                                               //02BF : 19 01 40 91 2B 26 0F 00 00 1B 52 10 00 00 2C 04 1F 44 65 62 75 67 00 16 
    mLogLevel.AddItem(5,"Trace");                                               //02D7 : 19 01 40 91 2B 26 0F 00 00 1B 52 10 00 00 2C 05 1F 54 72 61 63 65 00 16 
    mLogLevel.SelectItem(0);                                                    //02EF : 19 01 40 91 2B 26 07 00 04 1B 42 98 00 00 25 16 
    GetPawn().Skills.__OnSkillLog__Delegate = SkillLogHandler;                  //02FF : 45 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 88 1D 24 11 44 C3 9A 00 00 
    mTextCtrl.AddText("Initialized window...");                                 //031D : 19 01 68 43 04 1B 1D 00 00 1B AE 96 00 00 1F 49 6E 69 74 69 61 6C 69 7A 65 64 20 77 69 6E 64 6F 77 2E 2E 2E 00 16 
    //0F 01 60 87 31 16 1E 00 00 C8 43 0F 01 40 88 31 16 1E 00 00 96 43 1C 28 9E 9E 19 16 0F 00 88 86 
    //07 1B 2E 20 79 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 12 20 48 DB 2E 
    //1D 02 00 04 2C 02 2C 0A 2C 20 39 44 AF 1B 17 98 00 00 16 39 3F 90 2C 0A 2C 02 16 16 39 44 AF 1B 
    //1F 98 00 00 16 39 3F 2C 20 16 16 19 00 88 86 07 1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 
    //00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 0F 01 68 43 04 1B 2E 20 79 2F 1D 19 00 88 86 07 1B 30 
    //00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 2C 0A 2C 20 39 44 1B 17 98 
    //00 00 16 39 44 AF 1B 1F 98 00 00 16 39 3F 2C 20 16 16 19 01 68 43 04 1B 1A 00 00 1B 24 98 00 00 
    //1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 80 3F 16 0F 01 B0 24 06 1B 1B 18 98 00 00 
    //1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 12 20 00 68 D7 00 02 00 04 2C 02 92 90 2C 02 2C 0A 16 2C 
    //96 16 2C 04 2C 50 93 2C 20 90 2C 04 2C 02 16 16 16 19 01 B0 24 06 1B 0D 00 00 1B 13 98 00 00 1F 
    //43 6C 65 61 72 00 16 45 19 01 B0 24 06 1B 05 00 08 01 98 EB 9D 19 44 C6 9A 00 00 19 01 B0 24 06 
    //1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 0F 01 
    //28 25 06 1B 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 12 20 00 68 D7 00 02 00 04 2C 
    //02 92 92 90 2C 03 2C 0A 16 2C 96 16 2C 50 16 2C 04 2C 50 93 2C 20 90 2C 04 2C 02 16 16 16 19 01 
    //28 25 06 1B 0E 00 00 1B 13 98 00 00 1F 45 78 70 6F 72 74 00 16 45 19 01 28 25 06 1B 05 00 08 01 
    //98 EB 9D 19 44 C7 9A 00 00 19 01 28 25 06 1B 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 
    //00 1E 00 00 00 00 1E 00 00 00 00 16 0F 01 40 91 2B 26 1B 1F 99 00 00 1F 47 55 49 5F 43 6F 6D 62 
    //6F 42 6F 78 00 25 12 20 00 68 D7 00 01 00 04 26 2C 0A 2C 04 2C 96 1D F4 01 00 00 16 19 01 40 91 
    //2B 26 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 19 
    //01 40 91 2B 26 0C 00 00 1B 52 10 00 00 25 1F 41 6C 6C 00 16 19 01 40 91 2B 26 0F 00 00 1B 52 10 
    //00 00 26 1F 45 72 72 6F 72 73 00 16 19 01 40 91 2B 26 12 00 00 1B 52 10 00 00 2C 02 1F 57 61 72 
    //6E 69 6E 67 73 00 16 19 01 40 91 2B 26 0F 00 00 1B 52 10 00 00 2C 03 1F 48 69 6E 74 73 00 16 19 
    //01 40 91 2B 26 0F 00 00 1B 52 10 00 00 2C 04 1F 44 65 62 75 67 00 16 19 01 40 91 2B 26 0F 00 00 
    //1B 52 10 00 00 2C 05 1F 54 72 61 63 65 00 16 19 01 40 91 2B 26 07 00 04 1B 42 98 00 00 25 16 45 
    //19 19 1B 2B 0C 00 00 16 05 00 04 01 08 28 18 11 05 00 08 01 88 1D 24 11 44 C3 9A 00 00 19 01 68 
    //43 04 1B 1D 00 00 1B AE 96 00 00 1F 49 6E 69 74 69 61 6C 69 7A 65 64 20 77 69 6E 64 6F 77 2E 2E 
    //2E 00 16 04 0B 47 
  }



