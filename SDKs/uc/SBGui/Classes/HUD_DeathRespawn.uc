//==============================================================================
//  HUD_DeathRespawn
//==============================================================================

class HUD_DeathRespawn extends GUI_Window
    dependsOn(Game_PlayerController,Game_PlayerInput,GED_Editor,Game_Pawn,GameInfo)
    Transient
    Config(User)
  ;


  function bool OnRespawn(GUI_Component clickedButton) {
    Game_PlayerController(GetPlayerController()).Input.cl2sv_Resurrect_CallStub();//0000 : 19 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 B0 14 37 0F 06 00 00 1B 8F 0E 00 00 16 
    mDesktop.ShowWindow(GetWindowHandle(),2);                                   //001E : 19 01 48 0C 9D 19 0E 00 00 1B 57 2D 00 00 1B 9B 98 00 00 16 2C 02 16 
    return False;                                                               //0035 : 04 28 
    //19 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 B0 14 37 0F 06 00 00 1B 8F 0E 00 00 16 19 01 
    //48 0C 9D 19 0E 00 00 1B 57 2D 00 00 1B 9B 98 00 00 16 2C 02 16 04 28 04 0B 47 
  }


  event Initialize() {
    local GUI_Page mContentPage;
    local GED_Editor Editor;
    local GUI_Button respawnButton;
    Super.Initialize();                                                         //0000 : 1C 28 9E 9E 19 16 
    SetIcon("Header_Death","SBGuiTX.GUI_Styles","GUI_Styles");                  //0006 : 1B 28 98 00 00 1F 48 65 61 64 65 72 5F 44 65 61 74 68 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //003A : 0F 00 68 BA 2B 26 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    if (Editor != None) {                                                       //005F : 07 25 02 77 00 68 BA 2B 26 2A 16 
      Editor.Attach(self,"StandardDialog.txt");                                 //006A : 19 00 68 BA 2B 26 1B 00 00 1B 3F 01 00 00 17 1F 53 74 61 6E 64 61 72 64 44 69 61 6C 6F 67 2E 74 78 74 00 16 
      mContentPage = GUI_Page(Editor.RetrieveComponent("mContentPage"));        //008E : 0F 00 10 B3 05 1B 2E D8 E5 2E 1D 19 00 68 BA 2B 26 14 00 04 1B 15 98 00 00 1F 6D 43 6F 6E 74 65 6E 74 50 61 67 65 00 16 
      if (GetPawn().GetGameInfo().IsA('Deadspell_GameInfo')) {                  //00B6 : 07 26 01 19 19 1B 2B 0C 00 00 16 06 00 04 1C 38 E1 6C 0F 16 08 00 04 61 2F 21 E2 09 00 00 16 
        Editor.Attach(mContentPage,"DeathWindows\ShardshipDeath.txt");          //00D5 : 19 00 68 BA 2B 26 2C 00 00 1B 3F 01 00 00 00 10 B3 05 1B 1F 44 65 61 74 68 57 69 6E 64 6F 77 73 5C 53 68 61 72 64 73 68 69 70 44 65 61 74 68 2E 74 78 74 00 16 
        SetTitle(Class'SBGuiStrings'.default.death.Text);                       //010A : 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 66 98 19 16 
      } else {                                                                  //0123 : 06 EA 01 
        if (GetPawn().GetGameInfo().IsA('Ancestral_GameInfo')) {                //0126 : 07 96 01 19 19 1B 2B 0C 00 00 16 06 00 04 1C 38 E1 6C 0F 16 08 00 04 61 2F 21 D9 9B 00 00 16 
          Editor.Attach(mContentPage,"DeathWindows\AncestralDeath.txt");        //0145 : 19 00 68 BA 2B 26 2C 00 00 1B 3F 01 00 00 00 10 B3 05 1B 1F 44 65 61 74 68 57 69 6E 64 6F 77 73 5C 41 6E 63 65 73 74 72 61 6C 44 65 61 74 68 2E 74 78 74 00 16 
          SetTitle(Class'SBGuiStrings'.default.Ancestral_Death.Text);           //017A : 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 66 98 19 16 
        } else {                                                                //0193 : 06 EA 01 
          Editor.Attach(mContentPage,"DeathWindows\PersistentWorldDeath.txt");  //0196 : 19 00 68 BA 2B 26 32 00 00 1B 3F 01 00 00 00 10 B3 05 1B 1F 44 65 61 74 68 57 69 6E 64 6F 77 73 5C 50 65 72 73 69 73 74 65 6E 74 57 6F 72 6C 64 44 65 61 74 68 2E 74 78 74 00 16 
          SetTitle(Class'SBGuiStrings'.default.death.Text);                     //01D1 : 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 66 98 19 16 
        }
      }
      respawnButton = GUI_Button(Editor.RetrieveComponent("DeathButton"));      //01EA : 0F 00 30 9E 33 26 2E 78 F0 2E 1D 19 00 68 BA 2B 26 13 00 04 1B 15 98 00 00 1F 44 65 61 74 68 42 75 74 74 6F 6E 00 16 
      respawnButton.__OnClick__Delegate = OnRespawn;                            //0211 : 45 19 00 30 9E 33 26 05 00 08 01 98 EB 9D 19 44 A6 9A 00 00 
    }
    mLeft = mDesktop.GetScreenWidth() / 2.00000000 - mWidth / 2.00000000;       //0225 : 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 1E 00 00 00 40 16 AC 01 60 87 31 16 1E 00 00 00 40 16 16 
    mTop = mDesktop.GetScreenHeight() / 2.00000000 - mHeight / 2.00000000;      //024F : 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 2E 98 00 00 16 1E 00 00 00 40 16 AC 01 40 88 31 16 1E 00 00 00 40 16 16 
    //1C 28 9E 9E 19 16 1B 28 98 00 00 1F 48 65 61 64 65 72 5F 44 65 61 74 68 00 1F 53 42 47 75 69 54 
    //58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 00 68 BA 2B 26 
    //2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 07 
    //25 02 77 00 68 BA 2B 26 2A 16 19 00 68 BA 2B 26 1B 00 00 1B 3F 01 00 00 17 1F 53 74 61 6E 64 61 
    //72 64 44 69 61 6C 6F 67 2E 74 78 74 00 16 0F 00 10 B3 05 1B 2E D8 E5 2E 1D 19 00 68 BA 2B 26 14 
    //00 04 1B 15 98 00 00 1F 6D 43 6F 6E 74 65 6E 74 50 61 67 65 00 16 07 26 01 19 19 1B 2B 0C 00 00 
    //16 06 00 04 1C 38 E1 6C 0F 16 08 00 04 61 2F 21 E2 09 00 00 16 19 00 68 BA 2B 26 2C 00 00 1B 3F 
    //01 00 00 00 10 B3 05 1B 1F 44 65 61 74 68 57 69 6E 64 6F 77 73 5C 53 68 61 72 64 73 68 69 70 44 
    //65 61 74 68 2E 74 78 74 00 16 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 66 
    //98 19 16 06 EA 01 07 96 01 19 19 1B 2B 0C 00 00 16 06 00 04 1C 38 E1 6C 0F 16 08 00 04 61 2F 21 
    //D9 9B 00 00 16 19 00 68 BA 2B 26 2C 00 00 1B 3F 01 00 00 00 10 B3 05 1B 1F 44 65 61 74 68 57 69 
    //6E 64 6F 77 73 5C 41 6E 63 65 73 74 72 61 6C 44 65 61 74 68 2E 74 78 74 00 16 1B 0A 2C 00 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 66 98 19 16 06 EA 01 19 00 68 BA 2B 26 32 00 00 1B 
    //3F 01 00 00 00 10 B3 05 1B 1F 44 65 61 74 68 57 69 6E 64 6F 77 73 5C 50 65 72 73 69 73 74 65 6E 
    //74 57 6F 72 6C 64 44 65 61 74 68 2E 74 78 74 00 16 1B 0A 2C 00 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 10 66 98 19 16 0F 00 30 9E 33 26 2E 78 F0 2E 1D 19 00 68 BA 2B 26 13 00 04 1B 15 
    //98 00 00 1F 44 65 61 74 68 42 75 74 74 6F 6E 00 16 45 19 00 30 9E 33 26 05 00 08 01 98 EB 9D 19 
    //44 A6 9A 00 00 0F 01 08 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 1B 31 98 00 00 16 1E 00 00 00 
    //40 16 AC 01 60 87 31 16 1E 00 00 00 40 16 16 0F 01 80 86 31 16 AF AC 19 01 48 0C 9D 19 06 00 04 
    //1B 2E 98 00 00 16 1E 00 00 00 40 16 AC 01 40 88 31 16 1E 00 00 00 40 16 16 04 0B 47 
  }



