//==============================================================================
//  HUD_CharacterDeleteConfirmation
//==============================================================================

class HUD_CharacterDeleteConfirmation extends GUI_Window
    dependsOn(PlayerController,Character_GameInfo,GUI_EditBox,GUI_TextCtrl,GUI_Component,Character_Pawn,HUD_CharacterSelection,Game_Character,HUD_AvatarImagePage,GUI_Label)
    Transient
    Config(User)
  ;

  const DELETE_BUTTON_RETRY =  3;
  const DELETE_BUTTON_CLOSE =  2;
  const DELETE_BUTTON_CANCEL =  1;
  const DELETE_BUTTON_CONFIRM =  0;
  var private Character_Pawn mSelectedPawn;
  var private HUD_AvatarImagePage mPawnAvatar;
  var private GUI_Page mAreYouSurePage;
  var private GUI_Page mAuthorizePage;
  var private GUI_TextCtrl mAreYouSureText;
  var private GUI_TextCtrl mAuthorizeText;
  var private GUI_EditBox mPasswordBox;
  var private GUI_Button mConfirmButton;
  var private GUI_Button mCancelButton;
  var private GUI_Button mRetryButton;
  var private GUI_Button mCloseButton;


  event OnComponentDestroyed() {
    Character_GameInfo(GetPlayerController().GetGameInfo()).__HandleCharacterDeletionResult__Delegate = None;//0000 : 45 19 2E 10 E4 5A 01 19 1B 0E 2F 00 00 16 06 00 04 1C 38 E1 6C 0F 16 05 00 08 01 B0 50 37 19 44 00 00 00 00 
    Super.OnComponentDestroyed();                                               //0024 : 1C E0 DA 9D 19 16 
    //45 19 2E 10 E4 5A 01 19 1B 0E 2F 00 00 16 06 00 04 1C 38 E1 6C 0F 16 05 00 08 01 B0 50 37 19 44 
    //00 00 00 00 1C E0 DA 9D 19 16 04 0B 47 
  }


  function bool OnEnterPassword(GUI_EditBox editBox) {
    OnButtonClick(mConfirmButton);                                              //0000 : 1B 8D 98 00 00 01 D8 68 2B 26 16 
    return True;                                                                //000B : 04 27 
    //1B 8D 98 00 00 01 D8 68 2B 26 16 04 27 04 0B 47 
  }


  function bool OnPasswordChanged(GUI_EditBox editBox) {
    mConfirmButton.SetEnabled(Len(editBox.GetText()) > 0);                      //0000 : 19 01 D8 68 2B 26 1A 00 00 1B 5F 32 00 00 97 7D 19 00 58 15 34 26 06 00 00 1B 92 0C 00 00 16 16 25 16 16 
    return True;                                                                //0023 : 04 27 
    //19 01 D8 68 2B 26 1A 00 00 1B 5F 32 00 00 97 7D 19 00 58 15 34 26 06 00 00 1B 92 0C 00 00 16 16 
    //25 16 16 04 27 04 0B 47 
  }


  function HandleCharacterDeletionResult(bool aSuccess,string aMessage) {
    mAuthorizeText.SetText(aMessage);                                           //0000 : 19 01 E0 EA 8A 19 0B 00 00 1B 13 98 00 00 00 30 14 34 26 16 
    if (aSuccess) {                                                             //0014 : 07 6E 00 2D 00 B8 13 34 26 
      mCloseButton.SetVisible(True);                                            //001D : 19 01 68 9D 2C 26 07 00 00 1B 14 98 00 00 27 16 
      mCancelButton.SetVisible(False);                                          //002D : 19 01 38 5A 8A 19 07 00 00 1B 14 98 00 00 28 16 
      mConfirmButton.SetVisible(False);                                         //003D : 19 01 D8 68 2B 26 07 00 00 1B 14 98 00 00 28 16 
      mDesktop.UpdateStdWindow(Class'GUI_BaseDesktop'.22,0,None,"");            //004D : 19 01 48 0C 9D 19 15 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 16 25 2A 1F 00 16 
    } else {                                                                    //006B : 06 9E 00 
      mConfirmButton.SetVisible(False);                                         //006E : 19 01 D8 68 2B 26 07 00 00 1B 14 98 00 00 28 16 
      mRetryButton.SetVisible(True);                                            //007E : 19 01 D8 4A 04 1B 07 00 00 1B 14 98 00 00 27 16 
      mCancelButton.SetEnabled(True);                                           //008E : 19 01 38 5A 8A 19 07 00 00 1B 5F 32 00 00 27 16 
    }
    //19 01 E0 EA 8A 19 0B 00 00 1B 13 98 00 00 00 30 14 34 26 16 07 6E 00 2D 00 B8 13 34 26 19 01 68 
    //9D 2C 26 07 00 00 1B 14 98 00 00 27 16 19 01 38 5A 8A 19 07 00 00 1B 14 98 00 00 28 16 19 01 D8 
    //68 2B 26 07 00 00 1B 14 98 00 00 28 16 19 01 48 0C 9D 19 15 00 00 1B 02 0C 00 00 12 20 00 68 D7 
    //00 02 00 04 2C 16 25 2A 1F 00 16 06 9E 00 19 01 D8 68 2B 26 07 00 00 1B 14 98 00 00 28 16 19 01 
    //D8 4A 04 1B 07 00 00 1B 14 98 00 00 27 16 19 01 38 5A 8A 19 07 00 00 1B 5F 32 00 00 27 16 04 0B 
    //47 
  }


  function bool OnButtonClick(GUI_Component aButton) {
    local Character_GameInfo GameInfo;
    GameInfo = Character_GameInfo(GetPlayerController().GetGameInfo());         //0000 : 0F 00 30 8B 05 1B 2E 10 E4 5A 01 19 1B 0E 2F 00 00 16 06 00 04 1C 38 E1 6C 0F 16 
    switch (aButton.mIntTag) {                                                  //001B : 05 04 19 00 90 12 34 26 05 00 04 01 58 90 31 16 
      case 0 :                                                                  //002B : 0A 91 00 25 
        if (Len(mPasswordBox.GetText()) > 0) {                                  //002F : 07 8E 00 97 7D 19 01 58 EB 8A 19 06 00 00 1B 92 0C 00 00 16 16 25 16 
          GameInfo.__HandleCharacterDeletionResult__Delegate = HandleCharacterDeletionResult;//0046 : 45 19 00 30 8B 05 1B 05 00 08 01 B0 50 37 19 44 8F 05 00 00 
          GameInfo.cl_DeleteCharacter(mSelectedPawn.GetCharacterID(),mPasswordBox.GetText());//005A : 19 00 30 8B 05 1B 24 00 00 1C 60 0F 36 0F 19 01 E0 81 05 1B 06 00 04 1C 38 DD 18 11 16 19 01 58 EB 8A 19 06 00 00 1B 92 0C 00 00 16 16 
          SetupComponents(False);                                               //0087 : 1B 69 99 00 00 28 16 
        }
        break;                                                                  //008E : 06 25 01 
      case 1 :                                                                  //0091 : 0A B7 00 26 
        mDesktop.ShowWindow(mWindowHandle,Class'GUI_Desktop'.2);                //0095 : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 
        break;                                                                  //00B4 : 06 25 01 
      case 2 :                                                                  //00B7 : 0A 13 01 2C 02 
        mDesktop.ShowWindow(mWindowHandle,Class'GUI_Desktop'.2);                //00BC : 19 01 48 0C 9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 
        if (GameInfo.cl_GetCharacterCount() == 0) {                             //00DB : 07 10 01 9A 19 00 30 8B 05 1B 06 00 04 1C B0 0C 36 0F 16 25 16 
          HUD_CharacterSelection(mDesktop.GetStdWindow(22)).GotoCC();           //00F0 : 19 2E 78 03 31 1D 19 01 48 0C 9D 19 08 00 04 1B 1B 98 00 00 2C 16 16 06 00 00 1B 96 99 00 00 16 
        }
        break;                                                                  //0110 : 06 25 01 
      case 3 :                                                                  //0113 : 0A 22 01 2C 03 
        SetupComponents(True);                                                  //0118 : 1B 69 99 00 00 27 16 
        break;                                                                  //011F : 06 25 01 
      default:                                                                  //0122 : 0A FF FF 
    }
    return True;                                                                //0125 : 04 27 
    //0F 00 30 8B 05 1B 2E 10 E4 5A 01 19 1B 0E 2F 00 00 16 06 00 04 1C 38 E1 6C 0F 16 05 04 19 00 90 
    //12 34 26 05 00 04 01 58 90 31 16 0A 91 00 25 07 8E 00 97 7D 19 01 58 EB 8A 19 06 00 00 1B 92 0C 
    //00 00 16 16 25 16 45 19 00 30 8B 05 1B 05 00 08 01 B0 50 37 19 44 8F 05 00 00 19 00 30 8B 05 1B 
    //24 00 00 1C 60 0F 36 0F 19 01 E0 81 05 1B 06 00 04 1C 38 DD 18 11 16 19 01 58 EB 8A 19 06 00 00 
    //1B 92 0C 00 00 16 16 1B 69 99 00 00 28 16 06 25 01 0A B7 00 26 19 01 48 0C 9D 19 16 00 00 1B 57 
    //2D 00 00 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 06 25 01 0A 13 01 2C 02 19 01 48 0C 
    //9D 19 16 00 00 1B 57 2D 00 00 01 E8 77 9E 19 12 20 48 DB 2E 1D 02 00 04 2C 02 16 07 10 01 9A 19 
    //00 30 8B 05 1B 06 00 04 1C B0 0C 36 0F 16 25 16 19 2E 78 03 31 1D 19 01 48 0C 9D 19 08 00 04 1B 
    //1B 98 00 00 2C 16 16 06 00 00 1B 96 99 00 00 16 06 25 01 0A 22 01 2C 03 1B 69 99 00 00 27 16 06 
    //25 01 0A FF FF 04 27 04 0B 47 
  }


  function SetupComponents(bool aFirstPage) {
    mAreYouSurePage.SetVisible(aFirstPage);                                     //0000 : 19 01 18 5C 8A 19 0C 00 00 1B 14 98 00 00 2D 00 90 CB 04 1B 16 
    mAuthorizePage.SetVisible(!aFirstPage);                                     //0015 : 19 01 D0 82 05 1B 0E 00 00 1B 14 98 00 00 81 2D 00 90 CB 04 1B 16 16 
    mConfirmButton.SetVisible(True);                                            //002C : 19 01 D8 68 2B 26 07 00 00 1B 14 98 00 00 27 16 
    mCancelButton.SetVisible(True);                                             //003C : 19 01 38 5A 8A 19 07 00 00 1B 14 98 00 00 27 16 
    mCloseButton.SetVisible(False);                                             //004C : 19 01 68 9D 2C 26 07 00 00 1B 14 98 00 00 28 16 
    mRetryButton.SetVisible(False);                                             //005C : 19 01 D8 4A 04 1B 07 00 00 1B 14 98 00 00 28 16 
    mConfirmButton.SetEnabled(False);                                           //006C : 19 01 D8 68 2B 26 07 00 00 1B 5F 32 00 00 28 16 
    mCancelButton.SetEnabled(aFirstPage);                                       //007C : 19 01 38 5A 8A 19 0C 00 00 1B 5F 32 00 00 2D 00 90 CB 04 1B 16 
    mPasswordBox.SetText("");                                                   //0091 : 19 01 58 EB 8A 19 08 00 00 1B 13 98 00 00 1F 00 16 
    if (aFirstPage) {                                                           //00A2 : 07 BA 00 2D 00 90 CB 04 1B 
      mPasswordBox.SetFocus();                                                  //00AB : 19 01 58 EB 8A 19 06 00 00 1B 3A 2D 00 00 16 
    }
    if (aFirstPage) {                                                           //00BA : 07 07 01 2D 00 90 CB 04 1B 
      mAreYouSureText.SetText(Class'SBGuiStrings'.default.Are_you_sure_you_want_to_delete_this_character_.Text
        $ ":"
        @ mSelectedPawn.Character.cl_GetBaseName());//00C3 : 19 01 48 83 05 1B 38 00 00 1B 13 98 00 00 A8 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 8E 97 19 1F 3A 00 16 19 19 01 E0 81 05 1B 05 00 04 01 68 2E 34 0F 06 00 00 1B 33 05 00 00 16 16 16 
    } else {                                                                    //0104 : 06 48 01 
      mAuthorizeText.SetText(Class'SBGuiStrings'.default.Deleting_character.Text
        $ ":"
        @ mSelectedPawn.Character.cl_GetBaseName());//0107 : 19 01 E0 EA 8A 19 38 00 00 1B 13 98 00 00 A8 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 CA 98 19 1F 3A 00 16 19 19 01 E0 81 05 1B 05 00 04 01 68 2E 34 0F 06 00 00 1B 33 05 00 00 16 16 16 
    }
    //19 01 18 5C 8A 19 0C 00 00 1B 14 98 00 00 2D 00 90 CB 04 1B 16 19 01 D0 82 05 1B 0E 00 00 1B 14 
    //98 00 00 81 2D 00 90 CB 04 1B 16 16 19 01 D8 68 2B 26 07 00 00 1B 14 98 00 00 27 16 19 01 38 5A 
    //8A 19 07 00 00 1B 14 98 00 00 27 16 19 01 68 9D 2C 26 07 00 00 1B 14 98 00 00 28 16 19 01 D8 4A 
    //04 1B 07 00 00 1B 14 98 00 00 28 16 19 01 D8 68 2B 26 07 00 00 1B 5F 32 00 00 28 16 19 01 38 5A 
    //8A 19 0C 00 00 1B 5F 32 00 00 2D 00 90 CB 04 1B 16 19 01 58 EB 8A 19 08 00 00 1B 13 98 00 00 1F 
    //00 16 07 BA 00 2D 00 90 CB 04 1B 19 01 58 EB 8A 19 06 00 00 1B 3A 2D 00 00 16 07 07 01 2D 00 90 
    //CB 04 1B 19 01 48 83 05 1B 38 00 00 1B 13 98 00 00 A8 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 
    //0C 02 C0 8E 97 19 1F 3A 00 16 19 19 01 E0 81 05 1B 05 00 04 01 68 2E 34 0F 06 00 00 1B 33 05 00 
    //00 16 16 16 06 48 01 19 01 E0 EA 8A 19 38 00 00 1B 13 98 00 00 A8 70 36 58 C6 6B 0F 12 20 70 4B 
    //32 1D 05 00 0C 02 98 CA 98 19 1F 3A 00 16 19 19 01 E0 81 05 1B 05 00 04 01 68 2E 34 0F 06 00 00 
    //1B 33 05 00 00 16 16 16 04 0B 47 
  }


  function SetSelectedPawn(Character_Pawn aPawn) {
    mSelectedPawn = aPawn;                                                      //0000 : 0F 01 E0 81 05 1B 00 60 CD 06 1B 
    mPawnAvatar.SetAvatarPawn(aPawn);                                           //000B : 19 01 10 D0 33 26 0B 00 00 1B 3D 97 00 00 00 60 CD 06 1B 16 
    aPawn.cl_PlayDeleteEmote();                                                 //001F : 19 00 60 CD 06 1B 06 00 00 1B 44 05 00 00 16 
    SetupComponents(True);                                                      //002E : 1B 69 99 00 00 27 16 
    //0F 01 E0 81 05 1B 00 60 CD 06 1B 19 01 10 D0 33 26 0B 00 00 1B 3D 97 00 00 00 60 CD 06 1B 16 19 
    //00 60 CD 06 1B 06 00 00 1B 44 05 00 00 16 1B 69 99 00 00 27 16 04 0B 47 
  }


  function Initialize() {
    local GUI_Page lAvatarCircle;
    local GUI_Page lButtonPage;
    local GUI_Label lPasswordLabel;
    mWidth = 406.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 00 CB 43 
    mHeight = 222.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 00 5E 43 
    mAreYouSurePage = CreatePage("GUI_Page",0,0,6,21,388,101);                  //0016 : 0F 01 18 5C 8A 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 84 01 00 00 2C 65 16 
    mAreYouSurePage.SetStdBackground(7);                                        //0039 : 19 01 18 5C 8A 19 08 00 00 1B 22 98 00 00 2C 07 16 
    mPawnAvatar = HUD_AvatarImagePage(mAreYouSurePage.CreatePage("HUD_AvatarImagePage",524288,0,8,8,82,82));//004A : 0F 01 10 D0 33 26 2E C8 FC 2F 1D 19 01 18 5C 8A 19 29 00 04 1B 16 98 00 00 1F 48 55 44 5F 41 76 61 74 61 72 49 6D 61 67 65 50 61 67 65 00 1D 00 00 08 00 25 2C 08 2C 08 2C 52 2C 52 16 
    lAvatarCircle = mAreYouSurePage.CreatePage("GUI_Page",524288,0,5,5,86,86);  //0087 : 0F 00 F8 CD 33 26 19 01 18 5C 8A 19 1E 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 1D 00 00 08 00 25 2C 05 2C 05 2C 56 2C 56 16 
    lAvatarCircle.SetBackground("cs_avatarcircle","SBGuiTX.CC_Styles","CC_Styles");//00B4 : 19 00 F8 CD 33 26 35 00 00 1B 1A 98 00 00 1F 63 73 5F 61 76 61 74 61 72 63 69 72 63 6C 65 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 
    mAreYouSureText = GUI_TextCtrl(mAreYouSurePage.CreatePage("GUI_TextCtrl",524288,4096,103,14,269,44));//00F2 : 0F 01 48 83 05 1B 2E 20 79 2F 1D 19 01 18 5C 8A 19 29 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 1D 00 00 08 00 1D 00 10 00 00 2C 67 2C 0E 1D 0D 01 00 00 2C 2C 16 
    mAreYouSureText.SetFont("SBFontsTX.Verdana11");                             //012F : 19 01 48 83 05 1B 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 
    mAreYouSureText.SetColor(184,180,197,255);                                  //0153 : 19 01 48 83 05 1B 0E 00 00 1B 19 98 00 00 2C B8 2C B4 2C C5 2C FF 16 
    lPasswordLabel = mAreYouSurePage.CreateLabel("GUI_Label",0,0,103,67,82,14); //016A : 0F 00 68 88 05 1B 19 01 18 5C 8A 19 1B 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 25 2C 67 2C 43 2C 52 2C 0E 16 
    lPasswordLabel.SetFont("SBFontsTX.Verdana11");                              //0194 : 19 00 68 88 05 1B 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 
    lPasswordLabel.SetColor(184,180,197,255);                                   //01B8 : 19 00 68 88 05 1B 0E 00 00 1B 19 98 00 00 2C B8 2C B4 2C C5 2C FF 16 
    lPasswordLabel.SetText(Class'SBGuiStrings'.default.Password.Text
      @ ":");//01CF : 19 00 68 88 05 1B 1E 00 00 1B 13 98 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 41 98 19 1F 3A 00 16 16 
    mPasswordBox = mAreYouSurePage.CreateEditBox("GUI_EditBox",4194304,8192,184,62,187,28);//01F6 : 0F 01 58 EB 8A 19 19 01 18 5C 8A 19 25 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 1D 00 00 40 00 1D 00 20 00 00 2C B8 2C 3E 2C BB 2C 1C 16 
    mPasswordBox.SetColor(255.00000000,255.00000000,255.00000000);              //022A : 19 01 58 EB 8A 19 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    mPasswordBox.SetBackground("textfield","SBGuiTX.GUI_Styles","GUI_Styles");  //0248 : 19 01 58 EB 8A 19 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    mPasswordBox.__OnTextChanged__Delegate = OnPasswordChanged;                 //0282 : 45 19 01 58 EB 8A 19 05 00 08 01 10 CF A4 19 44 90 9A 00 00 
    mPasswordBox.__OnEnter__Delegate = OnEnterPassword;                         //0296 : 45 19 01 58 EB 8A 19 05 00 08 01 08 97 A2 19 44 91 9A 00 00 
    mAuthorizePage = CreatePage("GUI_Page",0,0,6,21,388,101);                   //02AA : 0F 01 D0 82 05 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 84 01 00 00 2C 65 16 
    mAuthorizePage.SetStdBackground(7);                                         //02CD : 19 01 D0 82 05 1B 08 00 00 1B 22 98 00 00 2C 07 16 
    mAuthorizeText = GUI_TextCtrl(mAuthorizePage.CreatePage("GUI_TextCtrl",524288,0,12,38,364,50));//02DE : 0F 01 E0 EA 8A 19 2E 20 79 2F 1D 19 01 D0 82 05 1B 25 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 1D 00 00 08 00 25 2C 0C 2C 26 1D 6C 01 00 00 2C 32 16 
    mAuthorizeText.mLabelStyle = mAuthorizeText.mLabelStyle | 4096;             //0317 : 0F 19 01 E0 EA 8A 19 05 00 04 01 20 CC A2 19 9E 19 01 E0 EA 8A 19 05 00 04 01 20 CC A2 19 1D 00 10 00 00 16 
    mAuthorizeText.mLabelStyle = mAuthorizeText.mLabelStyle | 512;              //033B : 0F 19 01 E0 EA 8A 19 05 00 04 01 20 CC A2 19 9E 19 01 E0 EA 8A 19 05 00 04 01 20 CC A2 19 1D 00 02 00 00 16 
    mAuthorizeText.SetFont("SBFontsTX.Verdana12");                              //035F : 19 01 E0 EA 8A 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 32 00 16 
    mAuthorizeText.SetColor(184,180,197,255);                                   //0383 : 19 01 E0 EA 8A 19 0E 00 00 1B 19 98 00 00 2C B8 2C B4 2C C5 2C FF 16 
    lButtonPage = CreatePage("GUI_Page",0,0,6,129,386,54);                      //039A : 0F 00 00 59 04 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 81 1D 82 01 00 00 2C 36 16 
    lButtonPage.SetStdBackground(7);                                            //03BD : 19 00 00 59 04 1B 08 00 00 1B 22 98 00 00 2C 07 16 
    mConfirmButton = lButtonPage.CreateButton("GUI_Button",0,2,35,11,152,24);   //03CE : 0F 01 D8 68 2B 26 19 00 00 59 04 1B 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 23 2C 0B 2C 98 2C 18 16 
    mConfirmButton.SetText(Class'SBGuiStrings'.default.Confirm.Text);           //03FA : 19 01 D8 68 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 43 98 19 16 
    mConfirmButton.__OnClick__Delegate = OnButtonClick;                         //041C : 45 19 01 D8 68 2B 26 05 00 08 01 98 EB 9D 19 44 8D 98 00 00 
    mConfirmButton.mIntTag = 0;                                                 //0430 : 0F 19 01 D8 68 2B 26 05 00 04 01 58 90 31 16 25 
    mCancelButton = lButtonPage.CreateButton("GUI_Button",0,2,192,11,152,24);   //0440 : 0F 01 38 5A 8A 19 19 00 00 59 04 1B 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C C0 2C 0B 2C 98 2C 18 16 
    mCancelButton.SetText(Class'SBGuiStrings'.default.Cancel.Text);             //046C : 19 01 38 5A 8A 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 16 
    mCancelButton.__OnClick__Delegate = OnButtonClick;                          //048E : 45 19 01 38 5A 8A 19 05 00 08 01 98 EB 9D 19 44 8D 98 00 00 
    mCancelButton.mIntTag = 1;                                                  //04A2 : 0F 19 01 38 5A 8A 19 05 00 04 01 58 90 31 16 26 
    mCloseButton = lButtonPage.CreateButton("GUI_Button",0,2,113,11,152,24);    //04B2 : 0F 01 68 9D 2C 26 19 00 00 59 04 1B 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 71 2C 0B 2C 98 2C 18 16 
    mCloseButton.SetText(Class'SBGuiStrings'.default.Close.Text);               //04DE : 19 01 68 9D 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 A6 98 19 16 
    mCloseButton.__OnClick__Delegate = OnButtonClick;                           //0500 : 45 19 01 68 9D 2C 26 05 00 08 01 98 EB 9D 19 44 8D 98 00 00 
    mCloseButton.mIntTag = 2;                                                   //0514 : 0F 19 01 68 9D 2C 26 05 00 04 01 58 90 31 16 2C 02 
    mRetryButton = lButtonPage.CreateButton("GUI_Button",0,2,35,11,152,24);     //0525 : 0F 01 D8 4A 04 1B 19 00 00 59 04 1B 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 23 2C 0B 2C 98 2C 18 16 
    mRetryButton.SetText(Class'SBGuiStrings'.default.Retry.Text);               //0551 : 19 01 D8 4A 04 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 CC 98 19 16 
    mRetryButton.__OnClick__Delegate = OnButtonClick;                           //0573 : 45 19 01 D8 4A 04 1B 05 00 08 01 98 EB 9D 19 44 8D 98 00 00 
    mRetryButton.mIntTag = 3;                                                   //0587 : 0F 19 01 D8 4A 04 1B 05 00 04 01 58 90 31 16 2C 03 
    Super.Initialize();                                                         //0598 : 1C 28 9E 9E 19 16 
    //0F 01 60 87 31 16 1E 00 00 CB 43 0F 01 40 88 31 16 1E 00 00 5E 43 0F 01 18 5C 8A 19 1B 16 98 00 
    //00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 15 1D 84 01 00 00 2C 65 16 19 01 18 5C 8A 19 08 
    //00 00 1B 22 98 00 00 2C 07 16 0F 01 10 D0 33 26 2E C8 FC 2F 1D 19 01 18 5C 8A 19 29 00 04 1B 16 
    //98 00 00 1F 48 55 44 5F 41 76 61 74 61 72 49 6D 61 67 65 50 61 67 65 00 1D 00 00 08 00 25 2C 08 
    //2C 08 2C 52 2C 52 16 0F 00 F8 CD 33 26 19 01 18 5C 8A 19 1E 00 04 1B 16 98 00 00 1F 47 55 49 5F 
    //50 61 67 65 00 1D 00 00 08 00 25 2C 05 2C 05 2C 56 2C 56 16 19 00 F8 CD 33 26 35 00 00 1B 1A 98 
    //00 00 1F 63 73 5F 61 76 61 74 61 72 63 69 72 63 6C 65 00 1F 53 42 47 75 69 54 58 2E 43 43 5F 53 
    //74 79 6C 65 73 00 1F 43 43 5F 53 74 79 6C 65 73 00 16 0F 01 48 83 05 1B 2E 20 79 2F 1D 19 01 18 
    //5C 8A 19 29 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 1D 00 00 08 00 1D 00 
    //10 00 00 2C 67 2C 0E 1D 0D 01 00 00 2C 2C 16 19 01 48 83 05 1B 1B 00 00 1B 25 98 00 00 1F 53 42 
    //46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 19 01 48 83 05 1B 0E 00 00 1B 19 98 00 
    //00 2C B8 2C B4 2C C5 2C FF 16 0F 00 68 88 05 1B 19 01 18 5C 8A 19 1B 00 04 1B 20 98 00 00 1F 47 
    //55 49 5F 4C 61 62 65 6C 00 25 25 2C 67 2C 43 2C 52 2C 0E 16 19 00 68 88 05 1B 1B 00 00 1B 25 98 
    //00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 19 00 68 88 05 1B 0E 00 
    //00 1B 19 98 00 00 2C B8 2C B4 2C C5 2C FF 16 19 00 68 88 05 1B 1E 00 00 1B 13 98 00 00 A8 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 41 98 19 1F 3A 00 16 16 0F 01 58 EB 8A 19 19 01 18 5C 
    //8A 19 25 00 04 1B 60 98 00 00 1F 47 55 49 5F 45 64 69 74 42 6F 78 00 1D 00 00 40 00 1D 00 20 00 
    //00 2C B8 2C 3E 2C BB 2C 1C 16 19 01 58 EB 8A 19 15 00 00 1B 19 98 00 00 1E 00 00 7F 43 1E 00 00 
    //7F 43 1E 00 00 7F 43 16 19 01 58 EB 8A 19 31 00 00 1B 1A 98 00 00 1F 74 65 78 74 66 69 65 6C 64 
    //00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 
    //00 16 45 19 01 58 EB 8A 19 05 00 08 01 10 CF A4 19 44 90 9A 00 00 45 19 01 58 EB 8A 19 05 00 08 
    //01 08 97 A2 19 44 91 9A 00 00 0F 01 D0 82 05 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 
    //25 2C 06 2C 15 1D 84 01 00 00 2C 65 16 19 01 D0 82 05 1B 08 00 00 1B 22 98 00 00 2C 07 16 0F 01 
    //E0 EA 8A 19 2E 20 79 2F 1D 19 01 D0 82 05 1B 25 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 
    //43 74 72 6C 00 1D 00 00 08 00 25 2C 0C 2C 26 1D 6C 01 00 00 2C 32 16 0F 19 01 E0 EA 8A 19 05 00 
    //04 01 20 CC A2 19 9E 19 01 E0 EA 8A 19 05 00 04 01 20 CC A2 19 1D 00 10 00 00 16 0F 19 01 E0 EA 
    //8A 19 05 00 04 01 20 CC A2 19 9E 19 01 E0 EA 8A 19 05 00 04 01 20 CC A2 19 1D 00 02 00 00 16 19 
    //01 E0 EA 8A 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 
    //32 00 16 19 01 E0 EA 8A 19 0E 00 00 1B 19 98 00 00 2C B8 2C B4 2C C5 2C FF 16 0F 00 00 59 04 1B 
    //1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 2C 06 2C 81 1D 82 01 00 00 2C 36 16 19 00 00 
    //59 04 1B 08 00 00 1B 22 98 00 00 2C 07 16 0F 01 D8 68 2B 26 19 00 00 59 04 1B 1D 00 04 1B 18 98 
    //00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 23 2C 0B 2C 98 2C 18 16 19 01 D8 68 2B 26 
    //19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 43 98 19 16 45 19 01 D8 
    //68 2B 26 05 00 08 01 98 EB 9D 19 44 8D 98 00 00 0F 19 01 D8 68 2B 26 05 00 04 01 58 90 31 16 25 
    //0F 01 38 5A 8A 19 19 00 00 59 04 1B 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 
    //25 2C 02 2C C0 2C 0B 2C 98 2C 18 16 19 01 38 5A 8A 19 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 08 43 98 19 16 45 19 01 38 5A 8A 19 05 00 08 01 98 EB 9D 19 44 8D 98 
    //00 00 0F 19 01 38 5A 8A 19 05 00 04 01 58 90 31 16 26 0F 01 68 9D 2C 26 19 00 00 59 04 1B 1D 00 
    //04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 02 2C 71 2C 0B 2C 98 2C 18 16 19 01 
    //68 9D 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 A6 98 19 16 
    //45 19 01 68 9D 2C 26 05 00 08 01 98 EB 9D 19 44 8D 98 00 00 0F 19 01 68 9D 2C 26 05 00 04 01 58 
    //90 31 16 2C 02 0F 01 D8 4A 04 1B 19 00 00 59 04 1B 1D 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 
    //74 74 6F 6E 00 25 2C 02 2C 23 2C 0B 2C 98 2C 18 16 19 01 D8 4A 04 1B 19 00 00 1B 13 98 00 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 00 CC 98 19 16 45 19 01 D8 4A 04 1B 05 00 08 01 98 EB 
    //9D 19 44 8D 98 00 00 0F 19 01 D8 4A 04 1B 05 00 04 01 58 90 31 16 2C 03 1C 28 9E 9E 19 16 04 0B 
    //47 
  }



