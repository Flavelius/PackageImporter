//==============================================================================
//  HUD_Guildlist_RankRightsPage
//==============================================================================

class HUD_Guildlist_RankRightsPage extends GUI_Page
    exportstructs
    dependsOn(Class,Game_PlayerGuilds,SBGuiStrings,GUI_Button)
    Transient
    Config(User)
  ;

  struct RightsCheckBox {
      var GUI_Button CheckBox;
      var string labelText;
      var int RightsConst;

  };


  var array<RightsCheckBox> RightsCheckBoxes;
  var (null);


  function InitialSetup() {
    local RightsCheckBox tempCheckBox;
    tempCheckBox.RightsConst = Class'Game_PlayerGuilds'.1;                      //0000 : 0F 36 28 02 2D 26 00 58 41 2C 26 12 20 70 BA 60 01 01 00 04 26 
    tempCheckBox.labelText = Class'SBGuiStrings'.default.Read_in_guild_chat.Text;//0015 : 0F 36 B8 F3 32 26 00 58 41 2C 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 C8 99 19 
    RightsCheckBoxes[RightsCheckBoxes.Length] = tempCheckBox;                   //0033 : 0F 10 37 01 F8 3F 8B 19 01 F8 3F 8B 19 00 58 41 2C 26 
    tempCheckBox.RightsConst = Class'Game_PlayerGuilds'.2;                      //0045 : 0F 36 28 02 2D 26 00 58 41 2C 26 12 20 70 BA 60 01 02 00 04 2C 02 
    tempCheckBox.labelText = Class'SBGuiStrings'.default.Write_in_guild_chat.Text;//005B : 0F 36 B8 F3 32 26 00 58 41 2C 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 C8 99 19 
    RightsCheckBoxes[RightsCheckBoxes.Length] = tempCheckBox;                   //0079 : 0F 10 37 01 F8 3F 8B 19 01 F8 3F 8B 19 00 58 41 2C 26 
    tempCheckBox.RightsConst = Class'Game_PlayerGuilds'.16;                     //008B : 0F 36 28 02 2D 26 00 58 41 2C 26 12 20 70 BA 60 01 02 00 04 2C 10 
    tempCheckBox.labelText = Class'SBGuiStrings'.default.Invite_players_to_the_guild.Text;//00A1 : 0F 36 B8 F3 32 26 00 58 41 2C 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 C9 99 19 
    RightsCheckBoxes[RightsCheckBoxes.Length] = tempCheckBox;                   //00BF : 0F 10 37 01 F8 3F 8B 19 01 F8 3F 8B 19 00 58 41 2C 26 
    tempCheckBox.RightsConst = Class'Game_PlayerGuilds'.32;                     //00D1 : 0F 36 28 02 2D 26 00 58 41 2C 26 12 20 70 BA 60 01 02 00 04 2C 20 
    tempCheckBox.labelText = Class'SBGuiStrings'.default.Set_message_of_the_day.Text;//00E7 : 0F 36 B8 F3 32 26 00 58 41 2C 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 C9 99 19 
    RightsCheckBoxes[RightsCheckBoxes.Length] = tempCheckBox;                   //0105 : 0F 10 37 01 F8 3F 8B 19 01 F8 3F 8B 19 00 58 41 2C 26 
    tempCheckBox.RightsConst = Class'Game_PlayerGuilds'.64;                     //0117 : 0F 36 28 02 2D 26 00 58 41 2C 26 12 20 70 BA 60 01 02 00 04 2C 40 
    tempCheckBox.labelText = Class'SBGuiStrings'.default.Promote_Demote_players.Text;//012D : 0F 36 B8 F3 32 26 00 58 41 2C 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 A0 31 16 
    RightsCheckBoxes[RightsCheckBoxes.Length] = tempCheckBox;                   //014B : 0F 10 37 01 F8 3F 8B 19 01 F8 3F 8B 19 00 58 41 2C 26 
    //0F 36 28 02 2D 26 00 58 41 2C 26 12 20 70 BA 60 01 01 00 04 26 0F 36 B8 F3 32 26 00 58 41 2C 26 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 78 C8 99 19 0F 10 37 01 F8 3F 8B 19 01 F8 3F 8B 19 
    //00 58 41 2C 26 0F 36 28 02 2D 26 00 58 41 2C 26 12 20 70 BA 60 01 02 00 04 2C 02 0F 36 B8 F3 32 
    //26 00 58 41 2C 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 C8 99 19 0F 10 37 01 F8 3F 8B 
    //19 01 F8 3F 8B 19 00 58 41 2C 26 0F 36 28 02 2D 26 00 58 41 2C 26 12 20 70 BA 60 01 02 00 04 2C 
    //10 0F 36 B8 F3 32 26 00 58 41 2C 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 C9 99 19 0F 
    //10 37 01 F8 3F 8B 19 01 F8 3F 8B 19 00 58 41 2C 26 0F 36 28 02 2D 26 00 58 41 2C 26 12 20 70 BA 
    //60 01 02 00 04 2C 20 0F 36 B8 F3 32 26 00 58 41 2C 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 E0 C9 99 19 0F 10 37 01 F8 3F 8B 19 01 F8 3F 8B 19 00 58 41 2C 26 0F 36 28 02 2D 26 00 58 41 
    //2C 26 12 20 70 BA 60 01 02 00 04 2C 40 0F 36 B8 F3 32 26 00 58 41 2C 26 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 08 A0 31 16 0F 10 37 01 F8 3F 8B 19 01 F8 3F 8B 19 00 58 41 2C 26 04 0B 47 
    //
  }


  function SetRightsEnabled(bool Enabled) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 F8 EB 05 1B 25 
    while (i < RightsCheckBoxes.Length) {                                       //0007 : 07 41 00 96 00 F8 EB 05 1B 37 01 F8 3F 8B 19 16 
      RightsCheckBoxes[i].CheckBox.SetEnabled(Enabled);                         //0017 : 19 36 68 92 89 19 10 00 F8 EB 05 1B 01 F8 3F 8B 19 0C 00 00 1B 5F 32 00 00 2D 00 E0 F3 35 26 16 
      i++;                                                                      //0037 : A5 00 F8 EB 05 1B 16 
    }
    //0F 00 F8 EB 05 1B 25 07 41 00 96 00 F8 EB 05 1B 37 01 F8 3F 8B 19 16 19 36 68 92 89 19 10 00 F8 
    //EB 05 1B 01 F8 3F 8B 19 0C 00 00 1B 5F 32 00 00 2D 00 E0 F3 35 26 16 A5 00 F8 EB 05 1B 16 06 07 
    //00 04 0B 47 
  }


  function int GetRights() {
    local int i;
    local int Rights;
    i = 0;                                                                      //0000 : 0F 00 20 3B 04 1B 25 
    while (i < RightsCheckBoxes.Length) {                                       //0007 : 07 5B 00 96 00 20 3B 04 1B 37 01 F8 3F 8B 19 16 
      if (RightsCheckBoxes[i].CheckBox.isChecked()) {                           //0017 : 07 51 00 19 36 68 92 89 19 10 00 20 3B 04 1B 01 F8 3F 8B 19 06 00 04 1B 2F 98 00 00 16 
        Rights = Rights | RightsCheckBoxes[i].RightsConst;                      //0034 : 0F 00 28 38 07 1B 9E 00 28 38 07 1B 36 28 02 2D 26 10 00 20 3B 04 1B 01 F8 3F 8B 19 16 
      }
      i++;                                                                      //0051 : A5 00 20 3B 04 1B 16 
    }
    return Rights;                                                              //005B : 04 00 28 38 07 1B 
    //0F 00 20 3B 04 1B 25 07 5B 00 96 00 20 3B 04 1B 37 01 F8 3F 8B 19 16 07 51 00 19 36 68 92 89 19 
    //10 00 20 3B 04 1B 01 F8 3F 8B 19 06 00 04 1B 2F 98 00 00 16 0F 00 28 38 07 1B 9E 00 28 38 07 1B 
    //36 28 02 2D 26 10 00 20 3B 04 1B 01 F8 3F 8B 19 16 A5 00 20 3B 04 1B 16 06 07 00 04 00 28 38 07 
    //1B 04 0B 47 
  }


  function SetRights(int rank_rights) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 20 12 04 1B 25 
    while (i < RightsCheckBoxes.Length) {                                       //0007 : 07 77 00 96 00 20 12 04 1B 37 01 F8 3F 8B 19 16 
      if ((rank_rights & RightsCheckBoxes[i].RightsConst) != 0) {               //0017 : 07 52 00 9B 9C 00 58 F4 35 26 36 28 02 2D 26 10 00 20 12 04 1B 01 F8 3F 8B 19 16 25 16 
        RightsCheckBoxes[i].CheckBox.SetChecked(True);                          //0034 : 19 36 68 92 89 19 10 00 20 12 04 1B 01 F8 3F 8B 19 07 00 00 1B 40 97 00 00 27 16 
      } else {                                                                  //004F : 06 6D 00 
        RightsCheckBoxes[i].CheckBox.SetChecked(False);                         //0052 : 19 36 68 92 89 19 10 00 20 12 04 1B 01 F8 3F 8B 19 07 00 00 1B 40 97 00 00 28 16 
      }
      i++;                                                                      //006D : A5 00 20 12 04 1B 16 
    }
    //0F 00 20 12 04 1B 25 07 77 00 96 00 20 12 04 1B 37 01 F8 3F 8B 19 16 07 52 00 9B 9C 00 58 F4 35 
    //26 36 28 02 2D 26 10 00 20 12 04 1B 01 F8 3F 8B 19 16 25 16 19 36 68 92 89 19 10 00 20 12 04 1B 
    //01 F8 3F 8B 19 07 00 00 1B 40 97 00 00 27 16 06 6D 00 19 36 68 92 89 19 10 00 20 12 04 1B 01 F8 
    //3F 8B 19 07 00 00 1B 40 97 00 00 28 16 A5 00 20 12 04 1B 16 06 07 00 04 0B 47 
  }


  function bool CheckBoxChecked(GUI_Button clickedButton,bool checkState) {
    OnRightsChanged(GetRights());                                               //0000 : 43 38 3D 08 1B 3D 9B 00 00 1B 3F 9B 00 00 16 16 
    return True;                                                                //0010 : 04 27 
    //43 38 3D 08 1B 3D 9B 00 00 1B 3F 9B 00 00 16 16 04 27 04 0B 47 
  }


  event Initialize() {
    local int i;
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    SetStdBackground(7);                                                        //0006 : 1B 22 98 00 00 2C 07 16 
    if (RightsCheckBoxes.Length == 0) {                                         //000E : 07 20 00 9A 37 01 F8 3F 8B 19 25 16 
      InitialSetup();                                                           //001A : 1B 41 9B 00 00 16 
    }
    i = 0;                                                                      //0020 : 0F 00 78 8F 2C 26 25 
    while (i < RightsCheckBoxes.Length) {                                       //0027 : 07 CE 00 96 00 78 8F 2C 26 37 01 F8 3F 8B 19 16 
      RightsCheckBoxes[i].CheckBox = CreateButton("GUI_Button",0,4,6,6 + i * 24,GetClientWidth() - 12,0);//0037 : 0F 36 68 92 89 19 10 00 78 8F 2C 26 01 F8 3F 8B 19 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 04 2C 06 92 2C 06 90 00 78 8F 2C 26 2C 18 16 16 39 44 AF 1B 17 98 00 00 16 39 3F 2C 0C 16 25 16 
      RightsCheckBoxes[i].CheckBox.SetText(RightsCheckBoxes[i].labelText);      //007B : 19 36 68 92 89 19 10 00 78 8F 2C 26 01 F8 3F 8B 19 16 00 00 1B 13 98 00 00 36 B8 F3 32 26 10 00 78 8F 2C 26 01 F8 3F 8B 19 16 
      RightsCheckBoxes[i].CheckBox.__OnCheck__Delegate = CheckBoxChecked;       //00A5 : 45 19 36 68 92 89 19 10 00 78 8F 2C 26 01 F8 3F 8B 19 05 00 08 01 18 F4 A1 19 44 3E 9B 00 00 
      i++;                                                                      //00C4 : A5 00 78 8F 2C 26 16 
    }
    //1C 40 5B 9E 19 16 1B 22 98 00 00 2C 07 16 07 20 00 9A 37 01 F8 3F 8B 19 25 16 1B 41 9B 00 00 16 
    //0F 00 78 8F 2C 26 25 07 CE 00 96 00 78 8F 2C 26 37 01 F8 3F 8B 19 16 0F 36 68 92 89 19 10 00 78 
    //8F 2C 26 01 F8 3F 8B 19 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 2C 04 2C 06 92 2C 
    //06 90 00 78 8F 2C 26 2C 18 16 16 39 44 AF 1B 17 98 00 00 16 39 3F 2C 0C 16 25 16 19 36 68 92 89 
    //19 10 00 78 8F 2C 26 01 F8 3F 8B 19 16 00 00 1B 13 98 00 00 36 B8 F3 32 26 10 00 78 8F 2C 26 01 
    //F8 3F 8B 19 16 45 19 36 68 92 89 19 10 00 78 8F 2C 26 01 F8 3F 8B 19 05 00 08 01 18 F4 A1 19 44 
    //3E 9B 00 00 A5 00 78 8F 2C 26 16 06 27 00 04 0B 47 
  }


  delegate OnRightsChanged(int newRights);



