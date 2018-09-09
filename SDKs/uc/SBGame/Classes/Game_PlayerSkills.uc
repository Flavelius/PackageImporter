//==============================================================================
//  Game_PlayerSkills
//==============================================================================

class Game_PlayerSkills extends Game_Skills within Game_Pawn
    native
    dependsOn(Game_PlayerStats,DB_SkillDeck,DB_CharacterSheet,SBDBAsync,DB_Character,Game_PlayerController)
  ;


  final function cl_SaveSkilldeckSkills(array<int> aNewSkilldeckSkills) {
    local int i;
    local bool skilldeckChanged;
    local int oldResourceId;
    if (aNewSkilldeckSkills.Length != SkilldeckSkills.Length) {                 //0000 : 07 1C 00 9B 37 00 98 17 2B 11 37 01 C8 3D 24 11 16 
      skilldeckChanged = True;                                                  //0011 : 14 2D 00 28 19 2B 11 27 
    } else {                                                                    //0019 : 06 89 00 
      i = 0;                                                                    //001C : 0F 00 A0 19 2B 11 25 
      while (i < aNewSkilldeckSkills.Length) {                                  //0023 : 07 89 00 96 00 A0 19 2B 11 37 00 98 17 2B 11 16 
        if (SkilldeckSkills[i] != None) {                                       //0033 : 07 5F 00 77 10 00 A0 19 2B 11 01 C8 3D 24 11 2A 16 
          oldResourceId = SkilldeckSkills[i].GetResourceId();                   //0044 : 0F 00 18 1A 2B 11 19 10 00 A0 19 2B 11 01 C8 3D 24 11 06 00 04 1C 08 90 20 11 16 
        }
        if (aNewSkilldeckSkills[i] != oldResourceId) {                          //005F : 07 7F 00 9B 10 00 A0 19 2B 11 00 98 17 2B 11 00 18 1A 2B 11 16 
          skilldeckChanged = True;                                              //0074 : 14 2D 00 28 19 2B 11 27 
          goto jl0089;                                                          //007C : 06 89 00 
        }
        ++i;                                                                    //007F : A3 00 A0 19 2B 11 16 
      }
    }
    if (skilldeckChanged) {                                                     //0089 : 07 A8 00 2D 00 28 19 2B 11 
      cl2sv_SaveSkilldeckSkills_CallStub(aNewSkilldeckSkills);                  //0092 : 1B B2 0D 00 00 00 98 17 2B 11 16 
      cl_UpdateSkilldeckSkills(aNewSkilldeckSkills);                            //009D : 1B 40 0D 00 00 00 98 17 2B 11 16 
    }
    //07 1C 00 9B 37 00 98 17 2B 11 37 01 C8 3D 24 11 16 14 2D 00 28 19 2B 11 27 06 89 00 0F 00 A0 19 
    //2B 11 25 07 89 00 96 00 A0 19 2B 11 37 00 98 17 2B 11 16 07 5F 00 77 10 00 A0 19 2B 11 01 C8 3D 
    //24 11 2A 16 0F 00 18 1A 2B 11 19 10 00 A0 19 2B 11 01 C8 3D 24 11 06 00 04 1C 08 90 20 11 16 07 
    //7F 00 9B 10 00 A0 19 2B 11 00 98 17 2B 11 00 18 1A 2B 11 16 14 2D 00 28 19 2B 11 27 06 89 00 A3 
    //00 A0 19 2B 11 16 06 23 00 07 A8 00 2D 00 28 19 2B 11 1B B2 0D 00 00 00 98 17 2B 11 16 1B 40 0D 
    //00 00 00 98 17 2B 11 16 04 0B 47 
  }


  protected native function cl2sv_SaveSkilldeckSkills_CallStub();


  protected event cl2sv_SaveSkilldeckSkills(array<int> aNewSkilldeckSkills) {
    local int i;
    local int j;
    local bool skillValid;
    local Game_Controller gc;
    gc = Game_Controller(Outer.Controller);                                     //0000 : 0F 00 D0 1E 2B 11 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
    i = 0;                                                                      //0019 : 0F 00 48 1F 2B 11 25 
    while (i < aNewSkilldeckSkills.Length) {                                    //0020 : 07 B3 00 96 00 48 1F 2B 11 37 00 68 1C 2B 11 16 
      skillValid = False;                                                       //0030 : 14 2D 00 C0 1F 2B 11 28 
      j = 0;                                                                    //0038 : 0F 00 38 20 2B 11 25 
      while (j < gc.DBCharacterSkills.Length) {                                 //003F : 07 91 00 96 00 38 20 2B 11 37 19 00 D0 1E 2B 11 05 00 00 01 E0 18 1B 11 16 
        if (aNewSkilldeckSkills[i] == gc.DBCharacterSkills[j]) {                //0058 : 07 87 00 9A 10 00 48 1F 2B 11 00 68 1C 2B 11 10 00 38 20 2B 11 19 00 D0 1E 2B 11 05 00 00 01 E0 18 1B 11 16 
          skillValid = True;                                                    //007C : 14 2D 00 C0 1F 2B 11 27 
          goto jl0091;                                                          //0084 : 06 91 00 
        }
        ++j;                                                                    //0087 : A3 00 38 20 2B 11 16 
      }
      if (!skillValid) {                                                        //0091 : 07 A9 00 81 2D 00 C0 1F 2B 11 16 
        aNewSkilldeckSkills[i] = 0;                                             //009C : 0F 10 00 48 1F 2B 11 00 68 1C 2B 11 25 
      }
      ++i;                                                                      //00A9 : A3 00 48 1F 2B 11 16 
    }
    i = GetSkilldeckIndex(gc.DBCharacterSheet.SelectedSkilldeckID);             //00B3 : 0F 00 48 1F 2B 11 1C 90 10 24 11 19 19 00 D0 1E 2B 11 05 00 04 01 30 18 1B 11 05 00 04 01 B0 20 2B 11 16 
    Class'SBDBAsync'.SetCharacterSkilldeckSkills(Outer,gc.DBCharacter.Id,gc.DBCharacterSheet.SelectedSkilldeckID,aNewSkilldeckSkills);//00D6 : 12 20 70 87 24 01 3E 00 00 1B 5B 13 00 00 01 00 E4 6B 0F 19 19 00 D0 1E 2B 11 05 00 04 01 30 2F 19 11 05 00 04 01 60 82 1A 11 19 19 00 D0 1E 2B 11 05 00 04 01 30 18 1B 11 05 00 04 01 B0 20 2B 11 00 68 1C 2B 11 16 
    gc.DBSkilldecks[i].mSkills = aNewSkilldeckSkills;                           //011D : 0F 19 10 00 48 1F 2B 11 19 00 D0 1E 2B 11 05 00 00 01 08 1B 1B 11 05 00 00 01 28 21 2B 11 00 68 1C 2B 11 
    sv_UpdateSkilldeckSkills();                                                 //0140 : 1B 4E 07 00 00 16 
    //0F 00 D0 1E 2B 11 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 0F 00 48 1F 2B 11 25 
    //07 B3 00 96 00 48 1F 2B 11 37 00 68 1C 2B 11 16 14 2D 00 C0 1F 2B 11 28 0F 00 38 20 2B 11 25 07 
    //91 00 96 00 38 20 2B 11 37 19 00 D0 1E 2B 11 05 00 00 01 E0 18 1B 11 16 07 87 00 9A 10 00 48 1F 
    //2B 11 00 68 1C 2B 11 10 00 38 20 2B 11 19 00 D0 1E 2B 11 05 00 00 01 E0 18 1B 11 16 14 2D 00 C0 
    //1F 2B 11 27 06 91 00 A3 00 38 20 2B 11 16 06 3F 00 07 A9 00 81 2D 00 C0 1F 2B 11 16 0F 10 00 48 
    //1F 2B 11 00 68 1C 2B 11 25 A3 00 48 1F 2B 11 16 06 20 00 0F 00 48 1F 2B 11 1C 90 10 24 11 19 19 
    //00 D0 1E 2B 11 05 00 04 01 30 18 1B 11 05 00 04 01 B0 20 2B 11 16 12 20 70 87 24 01 3E 00 00 1B 
    //5B 13 00 00 01 00 E4 6B 0F 19 19 00 D0 1E 2B 11 05 00 04 01 30 2F 19 11 05 00 04 01 60 82 1A 11 
    //19 19 00 D0 1E 2B 11 05 00 04 01 30 18 1B 11 05 00 04 01 B0 20 2B 11 00 68 1C 2B 11 16 0F 19 10 
    //00 48 1F 2B 11 19 00 D0 1E 2B 11 05 00 00 01 08 1B 1B 11 05 00 00 01 28 21 2B 11 00 68 1C 2B 11 
    //1B 4E 07 00 00 16 04 0B 47 
  }


  protected function cl_UpdateSkilldeckSkills(array<int> aSkilldeckSkills) {
    local int i;
    SkilldeckSkills.Length = mTiers * mTierSlots;                               //0000 : 0F 37 01 C8 3D 24 11 90 01 50 39 24 11 01 B8 3A 24 11 16 
    i = 0;                                                                      //0013 : 0F 00 40 23 2B 11 25 
    while (i < aSkilldeckSkills.Length) {                                       //001A : 07 92 00 96 00 40 23 2B 11 37 00 C8 22 2B 11 16 
      if (i < aSkilldeckSkills.Length && aSkilldeckSkills[i] != 0) {            //002A : 07 7B 00 82 96 00 40 23 2B 11 37 00 C8 22 2B 11 16 18 0F 00 9B 10 00 40 23 2B 11 00 C8 22 2B 11 25 16 16 
        SkilldeckSkills[i] = FSkill_Type(Class'SBDBSync'.GetResourceObject(aSkilldeckSkills[i]));//004D : 0F 10 00 40 23 2B 11 01 C8 3D 24 11 2E 40 36 5D 01 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 40 23 2B 11 00 C8 22 2B 11 16 
      } else {                                                                  //0078 : 06 88 00 
        SkilldeckSkills[i] = None;                                              //007B : 0F 10 00 40 23 2B 11 01 C8 3D 24 11 2A 
      }
      ++i;                                                                      //0088 : A3 00 40 23 2B 11 16 
    }
    OnSkilldeckChanged();                                                       //0092 : 43 88 58 24 11 F6 05 00 00 16 
    //0F 37 01 C8 3D 24 11 90 01 50 39 24 11 01 B8 3A 24 11 16 0F 00 40 23 2B 11 25 07 92 00 96 00 40 
    //23 2B 11 37 00 C8 22 2B 11 16 07 7B 00 82 96 00 40 23 2B 11 37 00 C8 22 2B 11 16 18 0F 00 9B 10 
    //00 40 23 2B 11 00 C8 22 2B 11 25 16 16 0F 10 00 40 23 2B 11 01 C8 3D 24 11 2E 40 36 5D 01 12 20 
    //30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 40 23 2B 11 00 C8 22 2B 11 16 06 88 00 0F 10 00 40 23 
    //2B 11 01 C8 3D 24 11 2A A3 00 40 23 2B 11 16 06 1A 00 43 88 58 24 11 F6 05 00 00 16 04 0B 47 
  }


  protected native event sv_UpdateSkilldeckSkills();


  protected function cl_AddActiveSkill(int aSkillID,float aStartTime,float aDuration,float aSkillSpeed,bool aFreezeMovement,bool aFreezeRotation,int aTokenItemID,int AnimVarNr,Vector aLocation,Rotator aRotation) {
    Super.cl_AddActiveSkill(aSkillID,aStartTime,aDuration,aSkillSpeed,aFreezeMovement,aFreezeRotation,aTokenItemID,AnimVarNr,aLocation,aRotation);//0000 : 1C 60 7F 23 11 00 C0 25 2B 11 00 38 26 2B 11 00 B0 26 2B 11 00 28 27 2B 11 2D 00 A0 27 2B 11 2D 00 18 28 2B 11 00 90 28 2B 11 00 08 29 2B 11 00 80 29 2B 11 00 F8 29 2B 11 16 
    StartSkillAnimation(LastSkill.Skill,AnimVarNr,LastSkill.SkillSpeed);        //003A : 1C B8 AA 23 11 36 60 84 23 11 01 D8 84 23 11 00 08 29 2B 11 36 30 87 23 11 01 D8 84 23 11 16 
    if (LastSkill.LockedMovement) {                                             //0059 : 07 80 00 2D 36 20 88 23 11 01 D8 84 23 11 
      Outer.CharacterStats.FreezeMovement(True);                                //0067 : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 07 00 00 1B A1 0C 00 00 27 16 
    }
    if (LastSkill.LockedRotation) {                                             //0080 : 07 A7 00 2D 36 10 89 23 11 01 D8 84 23 11 
      Outer.CharacterStats.FreezeRotation(True);                                //008E : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 07 00 00 1B B8 0C 00 00 27 16 
    }
    cl_StartSkillTracers(LastSkill.Skill,Item_Type(Class'SBDBSync'.GetResourceObject(aTokenItemID)),AnimVarNr);//00A7 : 1C D8 73 23 11 36 60 84 23 11 01 D8 84 23 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 90 28 2B 11 16 00 08 29 2B 11 16 
    //1C 60 7F 23 11 00 C0 25 2B 11 00 38 26 2B 11 00 B0 26 2B 11 00 28 27 2B 11 2D 00 A0 27 2B 11 2D 
    //00 18 28 2B 11 00 90 28 2B 11 00 08 29 2B 11 00 80 29 2B 11 00 F8 29 2B 11 16 1C B8 AA 23 11 36 
    //60 84 23 11 01 D8 84 23 11 00 08 29 2B 11 36 30 87 23 11 01 D8 84 23 11 16 07 80 00 2D 36 20 88 
    //23 11 01 D8 84 23 11 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 07 00 00 1B A1 0C 00 00 27 16 
    //07 A7 00 2D 36 10 89 23 11 01 D8 84 23 11 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 07 00 00 
    //1B B8 0C 00 00 27 16 1C D8 73 23 11 36 60 84 23 11 01 D8 84 23 11 2E 70 EB 5B 01 12 20 30 82 24 
    //01 0B 00 04 1B E5 0B 00 00 00 90 28 2B 11 16 00 08 29 2B 11 16 04 0B 47 
  }


  final native function LoadTokens();


  final function cl_SetSkills(array<int> aCharacterSkills,array<int> aSkilldeckSkills) {
    local Object skillResource;
    local int i;
    CharacterSkills.Length = aCharacterSkills.Length;                           //0000 : 0F 37 01 C0 E7 21 11 37 00 00 2C 2B 11 
    i = 0;                                                                      //000D : 0F 00 50 2D 2B 11 25 
    while (i < aCharacterSkills.Length) {                                       //0014 : 07 64 00 96 00 50 2D 2B 11 37 00 00 2C 2B 11 16 
      skillResource = Class'SBDBSync'.GetResourceObject(aCharacterSkills[i]);   //0024 : 0F 00 C8 2D 2B 11 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 50 2D 2B 11 00 00 2C 2B 11 16 
      CharacterSkills[i] = FSkill_Type(skillResource);                          //0044 : 0F 10 00 50 2D 2B 11 01 C0 E7 21 11 2E 40 36 5D 01 00 C8 2D 2B 11 
      ++i;                                                                      //005A : A3 00 50 2D 2B 11 16 
    }
    cl_UpdateSkilldeckSkills(aSkilldeckSkills);                                 //0064 : 1B 40 0D 00 00 00 40 2E 2B 11 16 
    OnCharacterSkillsChanged();                                                 //006F : 43 38 E8 21 11 B7 05 00 00 16 
    //0F 37 01 C0 E7 21 11 37 00 00 2C 2B 11 0F 00 50 2D 2B 11 25 07 64 00 96 00 50 2D 2B 11 37 00 00 
    //2C 2B 11 16 0F 00 C8 2D 2B 11 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 50 2D 2B 11 00 00 
    //2C 2B 11 16 0F 10 00 50 2D 2B 11 01 C0 E7 21 11 2E 40 36 5D 01 00 C8 2D 2B 11 A3 00 50 2D 2B 11 
    //16 06 14 00 1B 40 0D 00 00 00 40 2E 2B 11 16 43 38 E8 21 11 B7 05 00 00 16 04 0B 47 
  }


  protected native function sv2cl_SetSkills_CallStub();


  final event sv2cl_SetSkills(array<int> aCharacterSkills,array<int> aSkilldeckSkills) {
    cl_SetSkills(aCharacterSkills,aSkilldeckSkills);                            //0000 : 1C 70 2A 2B 11 00 08 31 2B 11 00 C8 31 2B 11 16 
    //1C 70 2A 2B 11 00 08 31 2B 11 00 C8 31 2B 11 16 04 0B 47 
  }


  function cl_OnInit() {
    local Game_PlayerController Controller;
    local int Index;
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    if (Outer.IsLocalPlayer()) {                                                //0006 : 07 8B 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 
      LoadTokens();                                                             //0018 : 1C 10 25 2B 11 16 
      Controller = Game_PlayerController(Outer.Controller);                     //001E : 0F 00 E0 33 2B 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
      Index = GetSkilldeckIndex(Controller.DBCharacterSheet.SelectedSkilldeckID);//0037 : 0F 00 48 35 2B 11 1C 90 10 24 11 19 19 00 E0 33 2B 11 05 00 04 01 30 18 1B 11 05 00 04 01 B0 20 2B 11 16 
      cl_SetSkills(Controller.DBCharacterSkills,Controller.DBSkilldecks[Index].mSkills);//005A : 1C 70 2A 2B 11 19 00 E0 33 2B 11 05 00 00 01 E0 18 1B 11 19 10 00 48 35 2B 11 19 00 E0 33 2B 11 05 00 00 01 08 1B 1B 11 05 00 00 01 28 21 2B 11 16 
    }
    //1C E0 C4 19 11 16 07 8B 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 1C 10 25 2B 11 16 0F 00 
    //E0 33 2B 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 0F 00 48 35 2B 11 1C 90 10 
    //24 11 19 19 00 E0 33 2B 11 05 00 04 01 30 18 1B 11 05 00 04 01 B0 20 2B 11 16 1C 70 2A 2B 11 19 
    //00 E0 33 2B 11 05 00 00 01 E0 18 1B 11 19 10 00 48 35 2B 11 19 00 E0 33 2B 11 05 00 00 01 08 1B 
    //1B 11 05 00 00 01 28 21 2B 11 16 04 0B 47 
  }


  native function ReportError(export editinline FSkill_Type aSkillType,byte ssf);



