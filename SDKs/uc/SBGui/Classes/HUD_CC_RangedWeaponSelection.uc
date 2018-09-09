//==============================================================================
//  HUD_CC_RangedWeaponSelection
//==============================================================================

class HUD_CC_RangedWeaponSelection extends HUD_CC_WeaponSelection
    dependsOn(Game_Pawn,Game_ShiftableAppearance,Game_EquippedAppearance,Appearance_Set,Appearance_MainWeapon,Item_Type)
    Transient
    Config(User)
  ;

  var array<Appearance_MainWeapon> mWeaponAppearances;


  function Initialize() {
    local Game_Pawn aPawn;
    local export editinline Game_EquippedAppearance Equipment;
    local Appearance_Set appearanceSet;
    local int i;
    local string aWeaponName;
    local Appearance_MainWeapon currentWeapon;
    aPawn = GetPreviewPawn();                                                   //0000 : 0F 00 48 D2 06 1B 1B 50 99 00 00 16 
    Equipment = Game_EquippedAppearance(aPawn.Appearance.GetCurrent());         //000C : 0F 00 50 C6 33 26 2E 70 B8 5F 01 19 19 00 48 D2 06 1B 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 
    appearanceSet = Equipment.GetAppearanceSet();                               //002F : 0F 00 C0 CB 06 1B 19 00 50 C6 33 26 06 00 04 1B B4 0E 00 00 16 
    i = 0;                                                                      //0044 : 0F 00 D8 C7 04 1B 25 
    while (i < appearanceSet.MainWeaponSet.Length) {                            //004B : 07 3B 01 96 00 D8 C7 04 1B 37 19 00 C0 CB 06 1B 05 00 00 01 10 60 35 11 16 
      currentWeapon = Appearance_MainWeapon(appearanceSet.MainWeaponSet[i]);    //0064 : 0F 00 58 FE 2C 26 2E 20 56 60 01 10 00 D8 C7 04 1B 19 00 C0 CB 06 1B 05 00 00 01 10 60 35 11 
      if (currentWeapon != None
        && currentWeapon.SelectableInCharacterCreation) {//0083 : 07 1F 01 82 77 00 58 FE 2C 26 2A 16 18 10 00 19 00 58 FE 2C 26 06 00 04 2D 01 48 06 2C 11 16 
        if (currentWeapon.WeaponType == 4) {                                    //00A2 : 07 1F 01 9A 39 3A 19 00 58 FE 2C 26 05 00 01 01 90 B8 34 11 39 3A 24 04 16 
          aWeaponName = currentWeapon._IT.Description.Text;                     //00BB : 0F 00 D8 85 05 1B 36 58 C6 6B 0F 19 19 00 58 FE 2C 26 05 00 04 01 D8 73 21 11 05 00 0C 01 B0 F2 2B 11 
          if (aWeaponName == "") {                                              //00DD : 07 FA 00 7A 00 D8 85 05 1B 1F 00 16 
            aWeaponName = "<unnamed>";                                          //00E9 : 0F 00 D8 85 05 1B 1F 3C 75 6E 6E 61 6D 65 64 3E 00 
          }
          AddMesh(aWeaponName,currentWeapon.GetStaticAttachment(aPawn,0),i);    //00FA : 1B 63 99 00 00 00 D8 85 05 1B 19 00 58 FE 2C 26 0C 00 04 1C 60 00 2C 11 00 48 D2 06 1B 25 16 00 D8 C7 04 1B 16 
        }
      }
      mWeaponAppearances[mWeaponAppearances.Length] = currentWeapon;            //011F : 0F 10 37 01 C0 D2 06 1B 01 C0 D2 06 1B 00 58 FE 2C 26 
      i++;                                                                      //0131 : A5 00 D8 C7 04 1B 16 
    }
    Super.Initialize();                                                         //013B : 1C 80 CD 2C 26 16 
    mMeshMesh.SetActorRotation(rot(-1000, 0, 0));                               //0141 : 19 01 10 16 2B 26 13 00 00 1B 3B 97 00 00 22 18 FC FF FF 00 00 00 00 00 00 00 00 16 
    //0F 00 48 D2 06 1B 1B 50 99 00 00 16 0F 00 50 C6 33 26 2E 70 B8 5F 01 19 19 00 48 D2 06 1B 05 00 
    //04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 0F 00 C0 CB 06 1B 19 00 50 C6 33 26 06 00 04 1B B4 
    //0E 00 00 16 0F 00 D8 C7 04 1B 25 07 3B 01 96 00 D8 C7 04 1B 37 19 00 C0 CB 06 1B 05 00 00 01 10 
    //60 35 11 16 0F 00 58 FE 2C 26 2E 20 56 60 01 10 00 D8 C7 04 1B 19 00 C0 CB 06 1B 05 00 00 01 10 
    //60 35 11 07 1F 01 82 77 00 58 FE 2C 26 2A 16 18 10 00 19 00 58 FE 2C 26 06 00 04 2D 01 48 06 2C 
    //11 16 07 1F 01 9A 39 3A 19 00 58 FE 2C 26 05 00 01 01 90 B8 34 11 39 3A 24 04 16 0F 00 D8 85 05 
    //1B 36 58 C6 6B 0F 19 19 00 58 FE 2C 26 05 00 04 01 D8 73 21 11 05 00 0C 01 B0 F2 2B 11 07 FA 00 
    //7A 00 D8 85 05 1B 1F 00 16 0F 00 D8 85 05 1B 1F 3C 75 6E 6E 61 6D 65 64 3E 00 1B 63 99 00 00 00 
    //D8 85 05 1B 19 00 58 FE 2C 26 0C 00 04 1C 60 00 2C 11 00 48 D2 06 1B 25 16 00 D8 C7 04 1B 16 0F 
    //10 37 01 C0 D2 06 1B 01 C0 D2 06 1B 00 58 FE 2C 26 A5 00 D8 C7 04 1B 16 06 4B 00 1C 80 CD 2C 26 
    //16 19 01 10 16 2B 26 13 00 00 1B 3B 97 00 00 22 18 FC FF FF 00 00 00 00 00 00 00 00 16 04 0B 47 
    //
  }



