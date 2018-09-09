//==============================================================================
//  NA_RaceBodyGender
//==============================================================================

class NA_RaceBodyGender extends NPC_Appearance
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Basics) const byte Gender;
  var (Basics) const byte Race;
  var (Basics) const byte Bodytype;


  event byte GetGender() {
    return Gender;                                                              //0000 : 04 01 F0 B7 E8 14 
    //04 01 F0 B7 E8 14 04 0B 47 
  }


  event EditorVerify() {
    local bool CheckForFemaleHulky;
    local bool CheckForMaleHulky;
    local bool CheckForMaleSkinny;
    local bool CheckForNonNormalBodyTypes;
    local bool CheckForNonNormalGender;
    local bool CheckForNonSkinny;
    local bool CheckForNonMale;
    local bool CheckForNonNormalBodyTypesPlusChild;
    switch (Race) {                                                             //0000 : 05 01 01 80 BC E8 14 
      case 0 :                                                                  //0007 : 0A 0C 00 24 00 
      case 6 :                                                                  //000C : 0A 11 00 24 06 
      case 7 :                                                                  //0011 : 0A 16 00 24 07 
      case 8 :                                                                  //0016 : 0A 36 00 24 08 
        CheckForFemaleHulky = True;                                             //001B : 14 2D 00 68 B8 E8 14 27 
        CheckForNonNormalBodyTypes = True;                                      //0023 : 14 2D 00 F8 BC E8 14 27 
        CheckForNonNormalGender = True;                                         //002B : 14 2D 00 70 BD E8 14 27 
        break;                                                                  //0033 : 06 31 01 
      case 1 :                                                                  //0036 : 0A 5E 00 24 01 
        CheckForFemaleHulky = True;                                             //003B : 14 2D 00 68 B8 E8 14 27 
        CheckForMaleHulky = True;                                               //0043 : 14 2D 00 E8 BD E8 14 27 
        CheckForNonNormalBodyTypes = True;                                      //004B : 14 2D 00 F8 BC E8 14 27 
        CheckForNonNormalGender = True;                                         //0053 : 14 2D 00 70 BD E8 14 27 
        break;                                                                  //005B : 06 31 01 
      case 2 :                                                                  //005E : 0A 66 00 24 02 
        break;                                                                  //0063 : 06 31 01 
      case 3 :                                                                  //0066 : 0A 86 00 24 03 
        CheckForFemaleHulky = True;                                             //006B : 14 2D 00 68 B8 E8 14 27 
        CheckForNonNormalBodyTypes = True;                                      //0073 : 14 2D 00 F8 BC E8 14 27 
        CheckForNonNormalGender = True;                                         //007B : 14 2D 00 70 BD E8 14 27 
        break;                                                                  //0083 : 06 31 01 
      case 4 :                                                                  //0086 : 0A AE 00 24 04 
        CheckForFemaleHulky = True;                                             //008B : 14 2D 00 68 B8 E8 14 27 
        CheckForMaleSkinny = True;                                              //0093 : 14 2D 00 60 BE E8 14 27 
        CheckForNonNormalBodyTypes = True;                                      //009B : 14 2D 00 F8 BC E8 14 27 
        CheckForNonNormalGender = True;                                         //00A3 : 14 2D 00 70 BD E8 14 27 
        break;                                                                  //00AB : 06 31 01 
      case 5 :                                                                  //00AE : 0A CE 00 24 05 
        CheckForFemaleHulky = True;                                             //00B3 : 14 2D 00 68 B8 E8 14 27 
        CheckForNonNormalBodyTypes = True;                                      //00BB : 14 2D 00 F8 BC E8 14 27 
        CheckForNonNormalGender = True;                                         //00C3 : 14 2D 00 70 BD E8 14 27 
        break;                                                                  //00CB : 06 31 01 
      case 9 :                                                                  //00CE : 0A EE 00 24 09 
        CheckForNonNormalBodyTypes = True;                                      //00D3 : 14 2D 00 F8 BC E8 14 27 
        CheckForNonNormalGender = True;                                         //00DB : 14 2D 00 70 BD E8 14 27 
        CheckForNonSkinny = True;                                               //00E3 : 14 2D 00 D8 BE E8 14 27 
        break;                                                                  //00EB : 06 31 01 
      case 10 :                                                                 //00EE : 0A FE 00 24 0A 
        CheckForNonMale = True;                                                 //00F3 : 14 2D 00 50 BF E8 14 27 
        break;                                                                  //00FB : 06 31 01 
      case 11 :                                                                 //00FE : 0A 16 01 24 0B 
        CheckForNonMale = True;                                                 //0103 : 14 2D 00 50 BF E8 14 27 
        CheckForNonNormalBodyTypesPlusChild = True;                             //010B : 14 2D 00 C8 BF E8 14 27 
        break;                                                                  //0113 : 06 31 01 
      case 12 :                                                                 //0116 : 0A 2E 01 24 0C 
        CheckForNonMale = True;                                                 //011B : 14 2D 00 50 BF E8 14 27 
        CheckForNonNormalBodyTypes = True;                                      //0123 : 14 2D 00 F8 BC E8 14 27 
        break;                                                                  //012B : 06 31 01 
      default:                                                                  //012E : 0A FF FF 
    }
    if (CheckForFemaleHulky && Gender == 1
      && Bodytype == 3) {            //0131 : 07 66 01 82 82 2D 00 68 B8 E8 14 18 0E 00 9A 39 3A 01 F0 B7 E8 14 39 3A 24 01 16 16 18 0E 00 9A 39 3A 01 40 C0 E8 14 39 3A 24 03 16 16 
      Bodytype = 2;                                                             //015E : 0F 01 40 C0 E8 14 24 02 
    }
    if (CheckForMaleHulky && Gender == 0
      && Bodytype == 3) {              //0166 : 07 9B 01 82 82 2D 00 E8 BD E8 14 18 0E 00 9A 39 3A 01 F0 B7 E8 14 39 3A 24 00 16 16 18 0E 00 9A 39 3A 01 40 C0 E8 14 39 3A 24 03 16 16 
      Bodytype = 2;                                                             //0193 : 0F 01 40 C0 E8 14 24 02 
    }
    if (CheckForMaleSkinny && Gender == 0
      && Bodytype == 0) {             //019B : 07 D0 01 82 82 2D 00 60 BE E8 14 18 0E 00 9A 39 3A 01 F0 B7 E8 14 39 3A 24 00 16 16 18 0E 00 9A 39 3A 01 40 C0 E8 14 39 3A 24 00 16 16 
      Bodytype = 2;                                                             //01C8 : 0F 01 40 C0 E8 14 24 02 
    }
    if (CheckForNonNormalBodyTypes && Bodytype >= 4) {                          //01D0 : 07 F3 01 82 2D 00 F8 BC E8 14 18 0E 00 99 39 3A 01 40 C0 E8 14 39 3A 24 04 16 16 
      Bodytype = 2;                                                             //01EB : 0F 01 40 C0 E8 14 24 02 
    }
    if (CheckForNonNormalGender && Gender >= 2) {                               //01F3 : 07 16 02 82 2D 00 70 BD E8 14 18 0E 00 99 39 3A 01 F0 B7 E8 14 39 3A 24 02 16 16 
      Gender = 0;                                                               //020E : 0F 01 F0 B7 E8 14 24 00 
    }
    if (CheckForNonSkinny && Bodytype != 0) {                                   //0216 : 07 39 02 82 2D 00 D8 BE E8 14 18 0E 00 9B 39 3A 01 40 C0 E8 14 39 3A 24 00 16 16 
      Bodytype = 0;                                                             //0231 : 0F 01 40 C0 E8 14 24 00 
    }
    if (CheckForNonMale && Gender != 0) {                                       //0239 : 07 5C 02 82 2D 00 50 BF E8 14 18 0E 00 9B 39 3A 01 F0 B7 E8 14 39 3A 24 00 16 16 
      Gender = 0;                                                               //0254 : 0F 01 F0 B7 E8 14 24 00 
    }
    if (CheckForNonNormalBodyTypesPlusChild
      && Bodytype > 4) {            //025C : 07 7F 02 82 2D 00 C8 BF E8 14 18 0E 00 97 39 3A 01 40 C0 E8 14 39 3A 24 04 16 16 
      Bodytype = 2;                                                             //0277 : 0F 01 40 C0 E8 14 24 02 
    }
    //05 01 01 80 BC E8 14 0A 0C 00 24 00 0A 11 00 24 06 0A 16 00 24 07 0A 36 00 24 08 14 2D 00 68 B8 
    //E8 14 27 14 2D 00 F8 BC E8 14 27 14 2D 00 70 BD E8 14 27 06 31 01 0A 5E 00 24 01 14 2D 00 68 B8 
    //E8 14 27 14 2D 00 E8 BD E8 14 27 14 2D 00 F8 BC E8 14 27 14 2D 00 70 BD E8 14 27 06 31 01 0A 66 
    //00 24 02 06 31 01 0A 86 00 24 03 14 2D 00 68 B8 E8 14 27 14 2D 00 F8 BC E8 14 27 14 2D 00 70 BD 
    //E8 14 27 06 31 01 0A AE 00 24 04 14 2D 00 68 B8 E8 14 27 14 2D 00 60 BE E8 14 27 14 2D 00 F8 BC 
    //E8 14 27 14 2D 00 70 BD E8 14 27 06 31 01 0A CE 00 24 05 14 2D 00 68 B8 E8 14 27 14 2D 00 F8 BC 
    //E8 14 27 14 2D 00 70 BD E8 14 27 06 31 01 0A EE 00 24 09 14 2D 00 F8 BC E8 14 27 14 2D 00 70 BD 
    //E8 14 27 14 2D 00 D8 BE E8 14 27 06 31 01 0A FE 00 24 0A 14 2D 00 50 BF E8 14 27 06 31 01 0A 16 
    //01 24 0B 14 2D 00 50 BF E8 14 27 14 2D 00 C8 BF E8 14 27 06 31 01 0A 2E 01 24 0C 14 2D 00 50 BF 
    //E8 14 27 14 2D 00 F8 BC E8 14 27 06 31 01 0A FF FF 07 66 01 82 82 2D 00 68 B8 E8 14 18 0E 00 9A 
    //39 3A 01 F0 B7 E8 14 39 3A 24 01 16 16 18 0E 00 9A 39 3A 01 40 C0 E8 14 39 3A 24 03 16 16 0F 01 
    //40 C0 E8 14 24 02 07 9B 01 82 82 2D 00 E8 BD E8 14 18 0E 00 9A 39 3A 01 F0 B7 E8 14 39 3A 24 00 
    //16 16 18 0E 00 9A 39 3A 01 40 C0 E8 14 39 3A 24 03 16 16 0F 01 40 C0 E8 14 24 02 07 D0 01 82 82 
    //2D 00 60 BE E8 14 18 0E 00 9A 39 3A 01 F0 B7 E8 14 39 3A 24 00 16 16 18 0E 00 9A 39 3A 01 40 C0 
    //E8 14 39 3A 24 00 16 16 0F 01 40 C0 E8 14 24 02 07 F3 01 82 2D 00 F8 BC E8 14 18 0E 00 99 39 3A 
    //01 40 C0 E8 14 39 3A 24 04 16 16 0F 01 40 C0 E8 14 24 02 07 16 02 82 2D 00 70 BD E8 14 18 0E 00 
    //99 39 3A 01 F0 B7 E8 14 39 3A 24 02 16 16 0F 01 F0 B7 E8 14 24 00 07 39 02 82 2D 00 D8 BE E8 14 
    //18 0E 00 9B 39 3A 01 40 C0 E8 14 39 3A 24 00 16 16 0F 01 40 C0 E8 14 24 00 07 5C 02 82 2D 00 50 
    //BF E8 14 18 0E 00 9B 39 3A 01 F0 B7 E8 14 39 3A 24 00 16 16 0F 01 F0 B7 E8 14 24 00 07 7F 02 82 
    //2D 00 C8 BF E8 14 18 0E 00 97 39 3A 01 40 C0 E8 14 39 3A 24 04 16 16 0F 01 40 C0 E8 14 24 02 04 
    //0B 47 
  }



