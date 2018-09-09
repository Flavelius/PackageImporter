//==============================================================================
//  IC_TokenSkill
//==============================================================================

class IC_TokenSkill extends Item_Component
    native
    editinlinenew
    dependsOn(Game_Pawn,Game_Skills)
  ;

  var (Token) const int TokenRank;
  var (Token) const byte Effect1;
  var (Token) const byte Effect2;
  var (Token) const byte Effect3;
  var (Token) const byte Effect4;
  var (Token) const byte Effect5;
  var (Token) const byte Effect6;
  var (Token) const byte Effect7;
  var (Token) const byte Effect8;
  var (Token) const float Value;
  var (Token) const byte ValueMode;


  static native function Item_Type FindSkillTokenItemByName(string aTokenName);


  static native function GetAllSkillTokenItems(out array<Item_Type> SkillTokenItems);


  final event sv_StopToken(Game_Pawn aPawn,export editinline FSkill_Type aSkill) {
    if (aPawn != None && aPawn.Skills != None) {                                //0000 : 07 94 01 82 77 00 08 AF 38 11 2A 16 18 12 00 77 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 2A 16 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect1,ValueMode,-Value);     //0021 : 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 F8 AF 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect2,ValueMode,-Value);     //004F : 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 60 B1 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect3,ValueMode,-Value);     //007D : 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 D8 B1 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect4,ValueMode,-Value);     //00AB : 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 50 B2 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect5,ValueMode,-Value);     //00D9 : 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 C8 B2 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect6,ValueMode,-Value);     //0107 : 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 40 B3 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect7,ValueMode,-Value);     //0135 : 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 B8 B3 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect8,ValueMode,-Value);     //0163 : 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 30 B4 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 
      goto jl0194;                                                              //0191 : 06 94 01 
    }
    //07 94 01 82 77 00 08 AF 38 11 2A 16 18 12 00 77 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 2A 16 
    //16 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 F8 AF 
    //38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 
    //00 1C A8 31 23 11 00 80 AF 38 11 01 60 B1 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 19 19 00 
    //08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 D8 B1 38 11 01 70 
    //B0 38 11 A9 01 E8 B0 38 11 16 16 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 
    //23 11 00 80 AF 38 11 01 50 B2 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 19 19 00 08 AF 38 11 
    //05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 C8 B2 38 11 01 70 B0 38 11 A9 
    //01 E8 B0 38 11 16 16 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 
    //AF 38 11 01 40 B3 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 19 19 00 08 AF 38 11 05 00 04 01 
    //08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 B8 B3 38 11 01 70 B0 38 11 A9 01 E8 B0 38 
    //11 16 16 19 19 00 08 AF 38 11 05 00 04 01 08 28 18 11 1C 00 00 1C A8 31 23 11 00 80 AF 38 11 01 
    //30 B4 38 11 01 70 B0 38 11 A9 01 E8 B0 38 11 16 16 06 94 01 04 0B 47 
  }


  final event int sv_StartToken(Game_Pawn aPawn,export editinline FSkill_Type aSkill) {
    local int Handle;
    if (aPawn != None && aPawn.Skills != None) {                                //0000 : 07 84 01 82 77 00 20 B5 38 11 2A 16 18 12 00 77 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 2A 16 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect1,ValueMode,Value);      //0021 : 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 F8 AF 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect2,ValueMode,Value);      //004D : 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 60 B1 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect3,ValueMode,Value);      //0079 : 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 D8 B1 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect4,ValueMode,Value);      //00A5 : 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 50 B2 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect5,ValueMode,Value);      //00D1 : 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 C8 B2 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect6,ValueMode,Value);      //00FD : 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 40 B3 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect7,ValueMode,Value);      //0129 : 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 B8 B3 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 
      aPawn.Skills.sv_IncreaseTokenEffect(aSkill,Effect8,ValueMode,Value);      //0155 : 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 30 B4 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 
      goto jl0184;                                                              //0181 : 06 84 01 
    }
    return Handle;                                                              //0184 : 04 00 60 B8 38 11 
    //07 84 01 82 77 00 20 B5 38 11 2A 16 18 12 00 77 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 2A 16 
    //16 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 F8 AF 
    //38 11 01 70 B0 38 11 01 E8 B0 38 11 16 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C 
    //A8 31 23 11 00 E8 B7 38 11 01 60 B1 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 19 19 00 20 B5 38 11 
    //05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 D8 B1 38 11 01 70 B0 38 11 01 
    //E8 B0 38 11 16 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 
    //11 01 50 B2 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 
    //1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 C8 B2 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 19 19 00 
    //20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 40 B3 38 11 01 70 
    //B0 38 11 01 E8 B0 38 11 16 19 19 00 20 B5 38 11 05 00 04 01 08 28 18 11 1A 00 00 1C A8 31 23 11 
    //00 E8 B7 38 11 01 B8 B3 38 11 01 70 B0 38 11 01 E8 B0 38 11 16 19 19 00 20 B5 38 11 05 00 04 01 
    //08 28 18 11 1A 00 00 1C A8 31 23 11 00 E8 B7 38 11 01 30 B4 38 11 01 70 B0 38 11 01 E8 B0 38 11 
    //16 06 84 01 04 00 60 B8 38 11 04 0B 47 
  }



