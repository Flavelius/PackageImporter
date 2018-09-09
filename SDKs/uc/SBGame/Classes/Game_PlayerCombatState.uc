//==============================================================================
//  Game_PlayerCombatState
//==============================================================================

class Game_PlayerCombatState extends Game_CombatState within Game_PlayerPawn
    native
    dependsOn(Game_PlayerPawn,Game_PlayerController,Game_GUI,Game_PlayerInput,StringReferences,Game_Desktop,PvPSettings)
  ;


  protected native function sv2cl_SheatheWeapon_CallStub();


  private event sv2cl_SheatheWeapon() {
    local Game_PlayerController GPC;
    if (mDrawing) {                                                             //0000 : 07 14 00 2D 01 50 B7 26 11 
      mReSheathe = True;                                                        //0009 : 14 2D 01 C8 B7 26 11 27 
    } else {                                                                    //0011 : 06 3B 01 
      GPC = Game_PlayerController(Outer.Controller);                            //0014 : 0F 00 40 5D 32 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
      if (GPC != None) {                                                        //002D : 07 91 00 77 00 40 5D 32 11 2A 16 
        if (GPC.GUI != None) {                                                  //0038 : 07 64 00 77 19 00 40 5D 32 11 05 00 04 01 40 8A 1B 11 2A 16 
          GPC.GUI.HideCombatBar();                                              //004C : 19 19 00 40 5D 32 11 05 00 04 01 40 8A 1B 11 06 00 00 1B FF 0C 00 00 16 
        }
        if (GPC.Input != None) {                                                //0064 : 07 91 00 77 19 00 40 5D 32 11 05 00 04 01 B0 14 37 0F 2A 16 
          GPC.Input.EnableSkills(False);                                        //0078 : 19 19 00 40 5D 32 11 05 00 04 01 B0 14 37 0F 07 00 00 1B AD 0C 00 00 28 16 
        }
      }
      if (mCombatMode != 3 && mCombatMode != 0) {                               //0091 : 07 DA 00 82 9B 39 3A 01 B0 B4 26 11 39 3A 24 03 16 18 0E 00 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 16 
        Outer.PlaySheatheWeaponAnim(mWeaponFlag,False);                         //00B3 : 19 01 00 E4 6B 0F 0E 00 00 1B CD 0D 00 00 39 3A 01 38 B4 26 11 28 16 
        mWeaponFlag = ResolveWeaponFlag(0,None,None);                           //00CA : 0F 01 38 B4 26 11 1C B0 A7 26 11 24 00 2A 2A 16 
      }
      mSheathing = True;                                                        //00DA : 14 2D 01 E0 BD 26 11 27 
      mDrawSheatheTimer = cDrawSheatheTime;                                     //00E2 : 0F 01 A8 2A 27 11 01 20 2B 27 11 
      mCombatMode = 0;                                                          //00ED : 0F 01 B0 B4 26 11 24 00 
      Outer.SendDesktopMessage("",Class'StringReferences'.default.You_sheathe_your_weapon.Text,Class'Game_Desktop'.6);//00F5 : 19 01 00 E4 6B 0F 26 00 00 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 FC 1B 11 12 20 60 CE 5A 01 02 00 04 2C 06 16 
      if (CombatCollision) {                                                    //0124 : 07 3B 01 2D 01 28 B5 26 11 
        Outer.SetCollision(True,False);                                         //012D : 19 01 00 E4 6B 0F 05 00 00 61 06 27 28 16 
      }
    }
    //07 14 00 2D 01 50 B7 26 11 14 2D 01 C8 B7 26 11 27 06 3B 01 0F 00 40 5D 32 11 2E 90 18 5B 01 19 
    //01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 07 91 00 77 00 40 5D 32 11 2A 16 07 64 00 77 19 00 40 5D 
    //32 11 05 00 04 01 40 8A 1B 11 2A 16 19 19 00 40 5D 32 11 05 00 04 01 40 8A 1B 11 06 00 00 1B FF 
    //0C 00 00 16 07 91 00 77 19 00 40 5D 32 11 05 00 04 01 B0 14 37 0F 2A 16 19 19 00 40 5D 32 11 05 
    //00 04 01 B0 14 37 0F 07 00 00 1B AD 0C 00 00 28 16 07 DA 00 82 9B 39 3A 01 B0 B4 26 11 39 3A 24 
    //03 16 18 0E 00 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 16 19 01 00 E4 6B 0F 0E 00 00 1B CD 0D 00 
    //00 39 3A 01 38 B4 26 11 28 16 0F 01 38 B4 26 11 1C B0 A7 26 11 24 00 2A 2A 16 14 2D 01 E0 BD 26 
    //11 27 0F 01 A8 2A 27 11 01 20 2B 27 11 0F 01 B0 B4 26 11 24 00 19 01 00 E4 6B 0F 26 00 00 1B 12 
    //06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A0 FC 1B 11 12 20 60 CE 5A 01 02 00 
    //04 2C 06 16 07 3B 01 2D 01 28 B5 26 11 19 01 00 E4 6B 0F 05 00 00 61 06 27 28 16 04 0B 47 
  }


  protected function cl_DrawPlayerWeapon(byte aMode) {
    local export editinline Item_Type newMainWeapon;
    local export editinline Item_Type newOffhandWeapon;
    local Game_PlayerController GPC;
    GPC = Game_PlayerController(Outer.Controller);                              //0000 : 0F 00 D8 22 34 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
    if (GPC != None) {                                                          //0019 : 07 55 00 77 00 D8 22 34 11 2A 16 
      GPC.GUI.ShowCombatBar();                                                  //0024 : 19 19 00 D8 22 34 11 05 00 04 01 40 8A 1B 11 06 00 00 1B 79 0D 00 00 16 
      GPC.Input.EnableSkills(True);                                             //003C : 19 19 00 D8 22 34 11 05 00 04 01 B0 14 37 0F 07 00 00 1B AD 0C 00 00 27 16 
    }
    if (GetMainWeapon() == None) {                                              //0055 : 07 93 00 72 1B 72 05 00 00 16 2A 16 
      Outer.SendDesktopMessage("",Class'StringReferences'.default.You_draw_your_weapon.Text,Class'Game_Desktop'.6);//0061 : 19 01 00 E4 6B 0F 26 00 00 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 28 FC 1B 11 12 20 60 CE 5A 01 02 00 04 2C 06 16 
    } else {                                                                    //0090 : 06 A8 00 
      GetMainWeapon().OnSheathe(Outer);                                         //0093 : 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    }
    if (GetOffhandWeapon() != None) {                                           //00A8 : 07 C9 00 77 1B 76 05 00 00 16 2A 16 
      GetOffhandWeapon().OnSheathe(Outer);                                      //00B4 : 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    }
    ResolveWeapons(aMode,newMainWeapon,newOffhandWeapon);                       //00C9 : 1B 9D 0C 00 00 00 48 60 32 11 00 50 23 34 11 00 C8 23 34 11 16 
    if (newMainWeapon != None) {                                                //00DE : 07 01 01 77 00 50 23 34 11 2A 16 
      mMainWeapon = newMainWeapon.GetResourceId();                              //00E9 : 0F 01 98 B2 26 11 19 00 50 23 34 11 06 00 04 1C 08 90 20 11 16 
    } else {                                                                    //00FE : 06 08 01 
      mMainWeapon = 0;                                                          //0101 : 0F 01 98 B2 26 11 25 
    }
    if (newOffhandWeapon != None) {                                             //0108 : 07 2B 01 77 00 C8 23 34 11 2A 16 
      mOffhandWeapon = newOffhandWeapon.GetResourceId();                        //0113 : 0F 01 08 B0 26 11 19 00 C8 23 34 11 06 00 04 1C 08 90 20 11 16 
    } else {                                                                    //0128 : 06 32 01 
      mOffhandWeapon = 0;                                                       //012B : 0F 01 08 B0 26 11 25 
    }
    mWeaponFlag = ResolveWeaponFlag(aMode,newMainWeapon,newOffhandWeapon);      //0132 : 0F 01 38 B4 26 11 1C B0 A7 26 11 00 48 60 32 11 00 50 23 34 11 00 C8 23 34 11 16 
    if (aMode != 3) {                                                           //014D : 07 96 01 9B 39 3A 00 48 60 32 11 39 3A 24 03 16 
      Outer.PlayDrawWeaponAnim(mWeaponFlag,mCombatMode != 0);                   //015D : 19 01 00 E4 6B 0F 1A 00 00 1B CE 0D 00 00 39 3A 01 38 B4 26 11 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 16 
      mDrawing = True;                                                          //0180 : 14 2D 01 50 B7 26 11 27 
      mDrawSheatheTimer = cDrawSheatheTime;                                     //0188 : 0F 01 A8 2A 27 11 01 20 2B 27 11 
    } else {                                                                    //0193 : 06 CE 01 
      GetMainWeapon().OnSheathe(Outer);                                         //0196 : 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
      GetOffhandWeapon().OnSheathe(Outer);                                      //01AB : 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
      mMainWeapon = 0;                                                          //01C0 : 0F 01 98 B2 26 11 25 
      mOffhandWeapon = 0;                                                       //01C7 : 0F 01 08 B0 26 11 25 
    }
    mCombatMode = aMode;                                                        //01CE : 0F 01 B0 B4 26 11 00 48 60 32 11 
    Outer.SetCollision(True,CombatCollision);                                   //01D9 : 19 01 00 E4 6B 0F 0A 00 00 61 06 27 2D 01 28 B5 26 11 16 
    //0F 00 D8 22 34 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 07 55 00 77 00 D8 22 
    //34 11 2A 16 19 19 00 D8 22 34 11 05 00 04 01 40 8A 1B 11 06 00 00 1B 79 0D 00 00 16 19 19 00 D8 
    //22 34 11 05 00 04 01 B0 14 37 0F 07 00 00 1B AD 0C 00 00 27 16 07 93 00 72 1B 72 05 00 00 16 2A 
    //16 19 01 00 E4 6B 0F 26 00 00 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 
    //28 FC 1B 11 12 20 60 CE 5A 01 02 00 04 2C 06 16 06 A8 00 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 
    //00 00 01 00 E4 6B 0F 16 07 C9 00 77 1B 76 05 00 00 16 2A 16 19 1B 76 05 00 00 16 0B 00 00 1B F4 
    //05 00 00 01 00 E4 6B 0F 16 1B 9D 0C 00 00 00 48 60 32 11 00 50 23 34 11 00 C8 23 34 11 16 07 01 
    //01 77 00 50 23 34 11 2A 16 0F 01 98 B2 26 11 19 00 50 23 34 11 06 00 04 1C 08 90 20 11 16 06 08 
    //01 0F 01 98 B2 26 11 25 07 2B 01 77 00 C8 23 34 11 2A 16 0F 01 08 B0 26 11 19 00 C8 23 34 11 06 
    //00 04 1C 08 90 20 11 16 06 32 01 0F 01 08 B0 26 11 25 0F 01 38 B4 26 11 1C B0 A7 26 11 00 48 60 
    //32 11 00 50 23 34 11 00 C8 23 34 11 16 07 96 01 9B 39 3A 00 48 60 32 11 39 3A 24 03 16 19 01 00 
    //E4 6B 0F 1A 00 00 1B CE 0D 00 00 39 3A 01 38 B4 26 11 9B 39 3A 01 B0 B4 26 11 39 3A 24 00 16 16 
    //14 2D 01 50 B7 26 11 27 0F 01 A8 2A 27 11 01 20 2B 27 11 06 CE 01 19 1B 72 05 00 00 16 0B 00 00 
    //1B F4 05 00 00 01 00 E4 6B 0F 16 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    //0F 01 98 B2 26 11 25 0F 01 08 B0 26 11 25 0F 01 B0 B4 26 11 00 48 60 32 11 19 01 00 E4 6B 0F 0A 
    //00 00 61 06 27 2D 01 28 B5 26 11 16 04 0B 47 
  }


  protected native function sv2cl_DrawWeapon_CallStub();


  private event sv2cl_DrawWeapon(byte aMode) {
    if (mSheathing) {                                                           //0000 : 07 1F 00 2D 01 E0 BD 26 11 
      mReDrawMode = aMode;                                                      //0009 : 0F 01 58 BE 26 11 00 A0 25 34 11 
      mReDraw = True;                                                           //0014 : 14 2D 01 B0 C0 26 11 27 
    } else {                                                                    //001C : 06 49 00 
      if (mDrawing && mReSheathe) {                                             //001F : 07 3E 00 82 2D 01 50 B7 26 11 18 07 00 2D 01 C8 B7 26 11 16 
        mReSheathe = False;                                                     //0033 : 14 2D 01 C8 B7 26 11 28 
      } else {                                                                  //003B : 06 49 00 
        cl_DrawPlayerWeapon(aMode);                                             //003E : 1B 61 0F 00 00 00 A0 25 34 11 16 
      }
    }
    //07 1F 00 2D 01 E0 BD 26 11 0F 01 58 BE 26 11 00 A0 25 34 11 14 2D 01 B0 C0 26 11 27 06 49 00 07 
    //3E 00 82 2D 01 50 B7 26 11 18 07 00 2D 01 C8 B7 26 11 16 14 2D 01 C8 B7 26 11 28 06 49 00 1B 61 
    //0F 00 00 00 A0 25 34 11 16 04 0B 47 
  }


  protected native function sv2cl_SetWeapon_CallStub();


  private event sv2cl_SetWeapon(byte aMode) {
    local export editinline Item_Type newMainWeapon;
    local export editinline Item_Type newOffhandWeapon;
    GetMainWeapon().OnSheathe(Outer);                                           //0000 : 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    GetOffhandWeapon().OnSheathe(Outer);                                        //0015 : 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
    ResolveWeapons(aMode,newMainWeapon,newOffhandWeapon);                       //002A : 1B 9D 0C 00 00 00 08 28 34 11 00 88 2A 34 11 00 00 2B 34 11 16 
    if (newMainWeapon != None) {                                                //003F : 07 62 00 77 00 88 2A 34 11 2A 16 
      mMainWeapon = newMainWeapon.GetResourceId();                              //004A : 0F 01 98 B2 26 11 19 00 88 2A 34 11 06 00 04 1C 08 90 20 11 16 
    } else {                                                                    //005F : 06 69 00 
      mMainWeapon = 0;                                                          //0062 : 0F 01 98 B2 26 11 25 
    }
    if (newOffhandWeapon != None) {                                             //0069 : 07 8C 00 77 00 00 2B 34 11 2A 16 
      mOffhandWeapon = newOffhandWeapon.GetResourceId();                        //0074 : 0F 01 08 B0 26 11 19 00 00 2B 34 11 06 00 04 1C 08 90 20 11 16 
    } else {                                                                    //0089 : 06 93 00 
      mOffhandWeapon = 0;                                                       //008C : 0F 01 08 B0 26 11 25 
    }
    mWeaponFlag = ResolveWeaponFlag(aMode,newMainWeapon,newOffhandWeapon);      //0093 : 0F 01 38 B4 26 11 1C B0 A7 26 11 00 08 28 34 11 00 88 2A 34 11 00 00 2B 34 11 16 
    if (aMode != 3) {                                                           //00AE : 07 FF 00 9B 39 3A 00 08 28 34 11 39 3A 24 03 16 
      if (newMainWeapon != None) {                                              //00BE : 07 DD 00 77 00 88 2A 34 11 2A 16 
        newMainWeapon.OnDraw(Outer);                                            //00C9 : 19 00 88 2A 34 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
      }
      if (newOffhandWeapon != None) {                                           //00DD : 07 FC 00 77 00 00 2B 34 11 2A 16 
        newOffhandWeapon.OnDraw(Outer);                                         //00E8 : 19 00 00 2B 34 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 
      }
    } else {                                                                    //00FC : 06 37 01 
      GetMainWeapon().OnSheathe(Outer);                                         //00FF : 19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
      GetOffhandWeapon().OnSheathe(Outer);                                      //0114 : 19 1B 76 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 
      mMainWeapon = 0;                                                          //0129 : 0F 01 98 B2 26 11 25 
      mOffhandWeapon = 0;                                                       //0130 : 0F 01 08 B0 26 11 25 
    }
    Outer.ClearAnimsByType(1,0.30000001);                                       //0137 : 19 01 00 E4 6B 0F 0D 00 00 1B B6 0C 00 00 24 01 1E 9A 99 99 3E 16 
    mCombatMode = aMode;                                                        //014D : 0F 01 B0 B4 26 11 00 08 28 34 11 
    //19 1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 19 1B 76 05 00 00 16 0B 00 00 1B 
    //F4 05 00 00 01 00 E4 6B 0F 16 1B 9D 0C 00 00 00 08 28 34 11 00 88 2A 34 11 00 00 2B 34 11 16 07 
    //62 00 77 00 88 2A 34 11 2A 16 0F 01 98 B2 26 11 19 00 88 2A 34 11 06 00 04 1C 08 90 20 11 16 06 
    //69 00 0F 01 98 B2 26 11 25 07 8C 00 77 00 00 2B 34 11 2A 16 0F 01 08 B0 26 11 19 00 00 2B 34 11 
    //06 00 04 1C 08 90 20 11 16 06 93 00 0F 01 08 B0 26 11 25 0F 01 38 B4 26 11 1C B0 A7 26 11 00 08 
    //28 34 11 00 88 2A 34 11 00 00 2B 34 11 16 07 FF 00 9B 39 3A 00 08 28 34 11 39 3A 24 03 16 07 DD 
    //00 77 00 88 2A 34 11 2A 16 19 00 88 2A 34 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 07 FC 00 
    //77 00 00 2B 34 11 2A 16 19 00 00 2B 34 11 0B 00 00 1B C0 05 00 00 01 00 E4 6B 0F 16 06 37 01 19 
    //1B 72 05 00 00 16 0B 00 00 1B F4 05 00 00 01 00 E4 6B 0F 16 19 1B 76 05 00 00 16 0B 00 00 1B F4 
    //05 00 00 01 00 E4 6B 0F 16 0F 01 98 B2 26 11 25 0F 01 08 B0 26 11 25 19 01 00 E4 6B 0F 0D 00 00 
    //1B B6 0C 00 00 24 01 1E 9A 99 99 3E 16 0F 01 B0 B4 26 11 00 08 28 34 11 04 0B 47 
  }


  protected native function cl2sv_SwitchWeaponType_CallStub();


  event cl2sv_SwitchWeaponType(byte aWeaponType) {
    sv_SwitchToWeaponType(aWeaponType);                                         //0000 : 1B 49 07 00 00 00 D8 2C 34 11 16 
    //1B 49 07 00 00 00 D8 2C 34 11 16 04 0B 47 
  }


  protected native function sv2cl_DrawSheatheFailed_CallStub();


  event sv2cl_DrawSheatheFailed(byte aMode) {
    Outer.SendDesktopMessage("",Class'StringReferences'.default.Unable_to_draw_weapon.Text,Class'Game_Desktop'.6);//0000 : 19 01 00 E4 6B 0F 26 00 00 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 FB 1B 11 12 20 60 CE 5A 01 02 00 04 2C 06 16 
    //19 01 00 E4 6B 0F 26 00 00 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 
    //FB 1B 11 12 20 60 CE 5A 01 02 00 04 2C 06 16 04 0B 47 
  }


  protected native function cl2sv_DrawSheatheWeapon_CallStub();


  event cl2sv_DrawSheatheWeapon(byte aMode) {
    if (Outer.mPvPSettings != None
      && !Outer.mPvPSettings.AllowDrawWeapon) {//0000 : 07 39 00 82 77 19 01 00 E4 6B 0F 05 00 04 01 48 4F 7F 0F 2A 16 18 1B 00 81 19 19 01 00 E4 6B 0F 05 00 04 01 48 4F 7F 0F 06 00 04 2D 01 E0 C6 7C 0F 16 16 
      sv_SheatheWeapon();                                                       //0033 : 1B 3B 07 00 00 16 
    }
    if (mCombatMode == 0) {                                                     //0039 : 07 D0 00 9A 39 3A 01 B0 B4 26 11 39 3A 24 00 16 
      if (sv_DrawWeapon(aMode)) {                                               //0049 : 07 5C 00 1B 09 07 00 00 00 F8 30 34 11 16 
        return;                                                                 //0057 : 04 0B 
      } else {                                                                  //0059 : 06 CD 00 
        if (aMode != 1 && sv_DrawWeapon(1)) {                                   //005C : 07 7E 00 82 9B 39 3A 00 F8 30 34 11 39 3A 24 01 16 18 09 00 1B 09 07 00 00 24 01 16 16 
          return;                                                               //0079 : 04 0B 
        } else {                                                                //007B : 06 CD 00 
          if (aMode != 2 && sv_DrawWeapon(2)) {                                 //007E : 07 A0 00 82 9B 39 3A 00 F8 30 34 11 39 3A 24 02 16 18 09 00 1B 09 07 00 00 24 02 16 16 
            return;                                                             //009B : 04 0B 
          } else {                                                              //009D : 06 CD 00 
            if (aMode != 3 && sv_DrawWeapon(3)) {                               //00A0 : 07 C2 00 82 9B 39 3A 00 F8 30 34 11 39 3A 24 03 16 18 09 00 1B 09 07 00 00 24 03 16 16 
              return;                                                           //00BD : 04 0B 
            } else {                                                            //00BF : 06 CD 00 
              sv2cl_DrawSheatheFailed_CallStub(aMode);                          //00C2 : 1B EB 0E 00 00 00 F8 30 34 11 16 
            }
          }
        }
      }
    } else {                                                                    //00CD : 06 DB 00 
      if (!sv_SheatheWeapon()) {                                                //00D0 : 07 DB 00 81 1B 3B 07 00 00 16 16 
      }
    }
    //07 39 00 82 77 19 01 00 E4 6B 0F 05 00 04 01 48 4F 7F 0F 2A 16 18 1B 00 81 19 19 01 00 E4 6B 0F 
    //05 00 04 01 48 4F 7F 0F 06 00 04 2D 01 E0 C6 7C 0F 16 16 1B 3B 07 00 00 16 07 D0 00 9A 39 3A 01 
    //B0 B4 26 11 39 3A 24 00 16 07 5C 00 1B 09 07 00 00 00 F8 30 34 11 16 04 0B 06 CD 00 07 7E 00 82 
    //9B 39 3A 00 F8 30 34 11 39 3A 24 01 16 18 09 00 1B 09 07 00 00 24 01 16 16 04 0B 06 CD 00 07 A0 
    //00 82 9B 39 3A 00 F8 30 34 11 39 3A 24 02 16 18 09 00 1B 09 07 00 00 24 02 16 16 04 0B 06 CD 00 
    //07 C2 00 82 9B 39 3A 00 F8 30 34 11 39 3A 24 03 16 18 09 00 1B 09 07 00 00 24 03 16 16 04 0B 06 
    //CD 00 1B EB 0E 00 00 00 F8 30 34 11 16 06 DB 00 07 DB 00 81 1B 3B 07 00 00 16 16 04 0B 47 
  }


  function bool sv_SwitchToMode(byte aMode) {
    if (aMode != mCombatMode) {                                                 //0000 : 07 36 00 9B 39 3A 00 80 33 34 11 39 3A 01 B0 B4 26 11 16 
      if (Super.sv_SwitchToMode(aMode)) {                                       //0013 : 07 31 00 1C 60 20 27 11 00 80 33 34 11 16 
        sv2cl_SetWeapon_CallStub(aMode);                                        //0021 : 1B 92 0F 00 00 00 80 33 34 11 16 
        return True;                                                            //002C : 04 27 
      } else {                                                                  //002E : 06 33 00 
        return False;                                                           //0031 : 04 28 
      }
    } else {                                                                    //0033 : 06 38 00 
      return True;                                                              //0036 : 04 27 
    }
    //07 36 00 9B 39 3A 00 80 33 34 11 39 3A 01 B0 B4 26 11 16 07 31 00 1C 60 20 27 11 00 80 33 34 11 
    //16 1B 92 0F 00 00 00 80 33 34 11 16 04 27 06 33 00 04 28 06 38 00 04 27 04 0B 47 
  }


  function bool sv_SheatheWeapon() {
    if (Super.sv_SheatheWeapon()) {                                             //0000 : 07 3B 00 1C C8 22 27 11 16 
      sv2cl_SheatheWeapon_CallStub();                                           //0009 : 1B 60 0F 00 00 16 
      Game_PlayerController(Outer.Controller).Input.EnableSkills(False);        //000F : 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 07 00 00 1B AD 0C 00 00 28 16 
      return True;                                                              //0036 : 04 27 
    } else {                                                                    //0038 : 06 3D 00 
      return False;                                                             //003B : 04 28 
    }
    //07 3B 00 1C C8 22 27 11 16 1B 60 0F 00 00 16 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 
    //00 6E 6C 0F 05 00 04 01 B0 14 37 0F 07 00 00 1B AD 0C 00 00 28 16 04 27 06 3D 00 04 28 04 0B 47 
    //
  }


  function bool sv_DrawWeapon(byte aMode) {
    if (Super.sv_DrawWeapon(aMode)) {                                           //0000 : 07 45 00 1C 98 27 27 11 00 98 36 34 11 16 
      sv2cl_DrawWeapon_CallStub(aMode);                                         //000E : 1B 63 0F 00 00 00 98 36 34 11 16 
      Game_PlayerController(Outer.Controller).Input.EnableSkills(True);         //0019 : 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 07 00 00 1B AD 0C 00 00 27 16 
      return True;                                                              //0040 : 04 27 
    } else {                                                                    //0042 : 06 47 00 
      return False;                                                             //0045 : 04 28 
    }
    //07 45 00 1C 98 27 27 11 00 98 36 34 11 16 1B 63 0F 00 00 00 98 36 34 11 16 19 19 2E 90 18 5B 01 
    //19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 07 00 00 1B AD 0C 00 00 27 16 
    //04 27 06 47 00 04 28 04 0B 47 
  }



