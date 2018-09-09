//==============================================================================
//  HUD_UpgradeSkillTooltip
//==============================================================================

class HUD_UpgradeSkillTooltip extends HUD_SimpleSkillTooltip
    dependsOn(Class,SBGuiStrings,Canvas,Item_Type)
    Transient
    Config(User)
  ;


  function bool UpdateTooltipInfo() {
    local int idx;
    local int prvPos;
    local array<string> prvSkillTokenNames;
    local string curSkillTokenName;
    local bool alreadyHandled;
    if (Super.UpdateTooltipInfo()) {                                            //0000 : 07 22 03 1C A8 0B EC 25 16 
      if (mSkill.LegalSkillTokens.Length > 0) {                                 //0009 : 07 1D 03 97 37 19 01 40 DE 2C 26 05 00 00 01 10 B1 20 11 25 16 
        AddLine(Class'SBGuiStrings'.default.Legal_Sigils.Text,Class'Canvas'.static.MakeColor(151,147,164));//001E : 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 5F 99 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 97 24 93 24 A4 16 16 
        idx = 0;                                                                //004C : 0F 00 E8 3C 06 1B 25 
        while (idx < mSkill.LegalSkillTokens.Length) {                          //0053 : 07 1D 03 96 00 E8 3C 06 1B 37 19 01 40 DE 2C 26 05 00 00 01 10 B1 20 11 16 
          curSkillTokenName = mSkill.LegalSkillTokens[idx].Name.Text;           //006C : 0F 00 68 F0 EB 25 36 58 C6 6B 0F 19 10 00 E8 3C 06 1B 19 01 40 DE 2C 26 05 00 00 01 10 B1 20 11 05 00 0C 01 88 9E 1A 11 
          switch (Right(curSkillTokenName,2)) {                                 //0094 : 05 00 EA 00 68 F0 EB 25 2C 02 16 
            case " I" :                                                         //009F : 0A C1 00 1F 20 49 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 2);//00A6 : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 02 16 16 
              break;                                                            //00BE : 06 08 01 
            case " V" :                                                         //00C1 : 0A E3 00 1F 20 56 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 2);//00C8 : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 02 16 16 
              break;                                                            //00E0 : 06 08 01 
            case " X" :                                                         //00E3 : 0A 05 01 1F 20 58 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 2);//00EA : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 02 16 16 
              break;                                                            //0102 : 06 08 01 
            default:                                                            //0105 : 0A FF FF 
          }
          switch (Right(curSkillTokenName,3)) {                                 //0108 : 05 00 EA 00 68 F0 EB 25 2C 03 16 
            case " II" :                                                        //0113 : 0A 36 01 1F 20 49 49 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 3);//011B : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 
              break;                                                            //0133 : 06 C5 01 
            case " IV" :                                                        //0136 : 0A 59 01 1F 20 49 56 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 3);//013E : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 
              break;                                                            //0156 : 06 C5 01 
            case " VI" :                                                        //0159 : 0A 7C 01 1F 20 56 49 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 3);//0161 : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 
              break;                                                            //0179 : 06 C5 01 
            case " IX" :                                                        //017C : 0A 9F 01 1F 20 49 58 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 3);//0184 : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 
              break;                                                            //019C : 06 C5 01 
            case " XI" :                                                        //019F : 0A C2 01 1F 20 58 49 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 3);//01A7 : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 
              break;                                                            //01BF : 06 C5 01 
            default:                                                            //01C2 : 0A FF FF 
          }
          switch (Right(curSkillTokenName,4)) {                                 //01C5 : 05 00 EA 00 68 F0 EB 25 2C 04 16 
            case " III" :                                                       //01D0 : 0A F4 01 1F 20 49 49 49 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 4);//01D9 : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 04 16 16 
              break;                                                            //01F1 : 06 3F 02 
            case " VII" :                                                       //01F4 : 0A 18 02 1F 20 56 49 49 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 4);//01FD : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 04 16 16 
              break;                                                            //0215 : 06 3F 02 
            case " XII" :                                                       //0218 : 0A 3C 02 1F 20 58 49 49 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 4);//0221 : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 04 16 16 
              break;                                                            //0239 : 06 3F 02 
            default:                                                            //023C : 0A FF FF 
          }
          switch (Right(curSkillTokenName,5)) {                                 //023F : 05 00 EA 00 68 F0 EB 25 2C 05 16 
            case " VIII" :                                                      //024A : 0A 6F 02 1F 20 56 49 49 49 00 
              curSkillTokenName = Left(curSkillTokenName,Len(curSkillTokenName) - 5);//0254 : 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 05 16 16 
              break;                                                            //026C : 06 72 02 
            default:                                                            //026F : 0A FF FF 
          }
          alreadyHandled = False;                                               //0272 : 14 2D 00 58 41 06 1B 28 
          prvPos = 0;                                                           //027A : 0F 00 D8 3D 06 1B 25 
          while (prvPos < prvSkillTokenNames.Length
            && !alreadyHandled) {//0281 : 07 C1 02 82 96 00 D8 3D 06 1B 37 00 40 3F 06 1B 16 18 09 00 81 2D 00 58 41 06 1B 16 16 
            alreadyHandled = prvSkillTokenNames[prvPos] == curSkillTokenName;   //029E : 14 2D 00 58 41 06 1B 7A 10 00 D8 3D 06 1B 00 40 3F 06 1B 00 68 F0 EB 25 16 
            prvPos++;                                                           //02B7 : A5 00 D8 3D 06 1B 16 
          }
          if (!alreadyHandled) {                                                //02C1 : 07 13 03 81 2D 00 58 41 06 1B 16 
            AddLine(curSkillTokenName,Class'Canvas'.static.MakeColor(222,216,254),Class'Canvas'.static.MakeColor(72,64,87));//02CC : 1B AB 96 00 00 00 68 F0 EB 25 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 DE 24 D8 24 FE 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
            prvSkillTokenNames[prvSkillTokenNames.Length] = curSkillTokenName;  //0301 : 0F 10 37 00 40 3F 06 1B 00 40 3F 06 1B 00 68 F0 EB 25 
          }
          ++idx;                                                                //0313 : A3 00 E8 3C 06 1B 16 
        }
      }
      return True;                                                              //031D : 04 27 
    } else {                                                                    //031F : 06 24 03 
      return False;                                                             //0322 : 04 28 
    }
    //07 22 03 1C A8 0B EC 25 16 07 1D 03 97 37 19 01 40 DE 2C 26 05 00 00 01 10 B1 20 11 25 16 1B AB 
    //96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 5F 99 19 12 20 88 EE C2 00 0C 00 04 1C 
    //88 EB 76 0F 24 97 24 93 24 A4 16 16 0F 00 E8 3C 06 1B 25 07 1D 03 96 00 E8 3C 06 1B 37 19 01 40 
    //DE 2C 26 05 00 00 01 10 B1 20 11 16 0F 00 68 F0 EB 25 36 58 C6 6B 0F 19 10 00 E8 3C 06 1B 19 01 
    //40 DE 2C 26 05 00 00 01 10 B1 20 11 05 00 0C 01 88 9E 1A 11 05 00 EA 00 68 F0 EB 25 2C 02 16 0A 
    //C1 00 1F 20 49 00 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 02 16 16 06 08 
    //01 0A E3 00 1F 20 56 00 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 02 16 16 
    //06 08 01 0A 05 01 1F 20 58 00 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 02 
    //16 16 06 08 01 0A FF FF 05 00 EA 00 68 F0 EB 25 2C 03 16 0A 36 01 1F 20 49 49 00 0F 00 68 F0 EB 
    //25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 06 C5 01 0A 59 01 1F 20 49 56 00 0F 00 
    //68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 06 C5 01 0A 7C 01 1F 20 56 49 
    //00 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 06 C5 01 0A 9F 01 1F 
    //20 49 58 00 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 06 C5 01 0A 
    //C2 01 1F 20 58 49 00 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 03 16 16 06 
    //C5 01 0A FF FF 05 00 EA 00 68 F0 EB 25 2C 04 16 0A F4 01 1F 20 49 49 49 00 0F 00 68 F0 EB 25 80 
    //00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 04 16 16 06 3F 02 0A 18 02 1F 20 56 49 49 00 0F 00 68 
    //F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 04 16 16 06 3F 02 0A 3C 02 1F 20 58 49 49 
    //00 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 93 7D 00 68 F0 EB 25 16 2C 04 16 16 06 3F 02 0A FF FF 05 
    //00 EA 00 68 F0 EB 25 2C 05 16 0A 6F 02 1F 20 56 49 49 49 00 0F 00 68 F0 EB 25 80 00 68 F0 EB 25 
    //93 7D 00 68 F0 EB 25 16 2C 05 16 16 06 72 02 0A FF FF 14 2D 00 58 41 06 1B 28 0F 00 D8 3D 06 1B 
    //25 07 C1 02 82 96 00 D8 3D 06 1B 37 00 40 3F 06 1B 16 18 09 00 81 2D 00 58 41 06 1B 16 16 14 2D 
    //00 58 41 06 1B 7A 10 00 D8 3D 06 1B 00 40 3F 06 1B 00 68 F0 EB 25 16 A5 00 D8 3D 06 1B 16 06 81 
    //02 07 13 03 81 2D 00 58 41 06 1B 16 1B AB 96 00 00 00 68 F0 EB 25 12 20 88 EE C2 00 0C 00 04 1C 
    //88 EB 76 0F 24 DE 24 D8 24 FE 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 
    //16 0F 10 37 00 40 3F 06 1B 00 40 3F 06 1B 00 68 F0 EB 25 A3 00 E8 3C 06 1B 16 06 53 00 04 27 06 
    //24 03 04 28 04 0B 47 
  }



