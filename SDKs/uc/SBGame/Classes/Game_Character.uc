//==============================================================================
//  Game_Character
//==============================================================================

class Game_Character extends Base_Component within Game_Pawn
    native
    dependsOn(SBDBSync,NPC_Taxonomy,Game_Pawn,Game_ShiftableAppearance,NPC_Type)
  ;

  var export editinline NPC_Taxonomy mFaction;
  var int mFactionId;
  var export editinline NPC_Taxonomy mOldFaction;


  protected event cl_SetFaction(int aFactionId) {
    mFactionId = aFactionId;                                                    //0000 : 0F 01 B0 32 34 0F 00 58 9D 34 0F 
    if (aFactionId != 0) {                                                      //000B : 07 38 00 9B 00 58 9D 34 0F 25 16 
      mFaction = NPC_Taxonomy(Class'SBDBSync'.GetResourceObject(aFactionId));   //0016 : 0F 01 28 33 34 0F 2E 78 B1 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 58 9D 34 0F 16 
    } else {                                                                    //0035 : 06 3F 00 
      mFaction = None;                                                          //0038 : 0F 01 28 33 34 0F 2A 
    }
    //0F 01 B0 32 34 0F 00 58 9D 34 0F 07 38 00 9B 00 58 9D 34 0F 25 16 0F 01 28 33 34 0F 2E 78 B1 5B 
    //01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 58 9D 34 0F 16 06 3F 00 0F 01 28 33 34 0F 2A 04 
    //0B 47 
  }


  event bool UnshiftFaction() {
    if (IsShifted()) {                                                          //0000 : 07 1D 00 1B 2E 0C 00 00 16 
      mFaction = mOldFaction;                                                   //0009 : 0F 01 28 33 34 0F 01 C8 34 34 0F 
      mOldFaction = None;                                                       //0014 : 0F 01 C8 34 34 0F 2A 
      return True;                                                              //001B : 04 27 
    }
    return False;                                                               //001D : 04 28 
    //07 1D 00 1B 2E 0C 00 00 16 0F 01 28 33 34 0F 01 C8 34 34 0F 0F 01 C8 34 34 0F 2A 04 27 04 28 04 
    //0B 47 
  }


  event bool ShiftFaction(export editinline NPC_Taxonomy newFaction) {
    if (mFaction == newFaction) {                                               //0000 : 07 11 00 72 01 28 33 34 0F 00 B0 94 25 11 16 
      return False;                                                             //000F : 04 28 
    }
    UnshiftFaction();                                                           //0011 : 1B 5E 07 00 00 16 
    mOldFaction = mFaction;                                                     //0017 : 0F 01 C8 34 34 0F 01 28 33 34 0F 
    mFaction = newFaction;                                                      //0022 : 0F 01 28 33 34 0F 00 B0 94 25 11 
    return True;                                                                //002D : 04 27 
    //07 11 00 72 01 28 33 34 0F 00 B0 94 25 11 16 04 28 1B 5E 07 00 00 16 0F 01 C8 34 34 0F 01 28 33 
    //34 0F 0F 01 28 33 34 0F 00 B0 94 25 11 04 27 04 0B 47 
  }


  native function bool IsShifted();


  event NPC_Taxonomy GetFaction() {
    return mFaction;                                                            //0000 : 04 01 28 33 34 0F 
    //04 01 28 33 34 0F 04 0B 47 
  }


  protected native function sv2clrel_SetFaction_CallStub();


  protected event sv2clrel_SetFaction(int aFactionId) {
    cl_SetFaction(aFactionId);                                                  //0000 : 1B 4C 05 00 00 00 F8 99 25 11 16 
    //1B 4C 05 00 00 00 F8 99 25 11 16 04 0B 47 
  }


  event sv_SetFaction(export editinline NPC_Taxonomy aFaction) {
    mFaction = aFaction;                                                        //0000 : 0F 01 28 33 34 0F 00 B0 9A 25 11 
    if (mFaction != None) {                                                     //000B : 07 2E 00 77 01 28 33 34 0F 2A 16 
      mFactionId = aFaction.GetResourceId();                                    //0016 : 0F 01 B0 32 34 0F 19 00 B0 9A 25 11 06 00 04 1C 08 90 20 11 16 
    } else {                                                                    //002B : 06 35 00 
      mFactionId = 0;                                                           //002E : 0F 01 B0 32 34 0F 25 
    }
    sv2clrel_SetFaction_CallStub(mFactionId);                                   //0035 : 1B D7 0C 00 00 01 B0 32 34 0F 16 
    //0F 01 28 33 34 0F 00 B0 9A 25 11 07 2E 00 77 01 28 33 34 0F 2A 16 0F 01 B0 32 34 0F 19 00 B0 9A 
    //25 11 06 00 04 1C 08 90 20 11 16 06 35 00 0F 01 B0 32 34 0F 25 1B D7 0C 00 00 01 B0 32 34 0F 16 
    //04 0B 47 
  }


  final native function string sv_GetName();


  final event string cl_GetFullName() {
    if (Outer.Appearance.IsShifted()) {                                         //0000 : 07 41 00 19 19 01 00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 2E 0C 00 00 16 
      return Outer.Appearance.GetShiftedNPCType().GetLongName();                //001B : 04 19 19 19 01 00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 7F 05 00 00 16 06 00 00 1B 98 0C 00 00 16 
    } else {                                                                    //003E : 06 48 00 
      return cl_GetBaseFullName();                                              //0041 : 04 1B 6D 0C 00 00 16 
    }
    //07 41 00 19 19 01 00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 2E 0C 00 00 16 04 19 19 19 01 
    //00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 7F 05 00 00 16 06 00 00 1B 98 0C 00 00 16 06 48 
    //00 04 1B 6D 0C 00 00 16 04 0B 47 
  }


  final event string cl_GetName() {
    if (Outer.Appearance.IsShifted()) {                                         //0000 : 07 41 00 19 19 01 00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 2E 0C 00 00 16 
      return Outer.Appearance.GetShiftedNPCType().GetShortName();               //001B : 04 19 19 19 01 00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 7F 05 00 00 16 06 00 00 1B 9C 0C 00 00 16 
    } else {                                                                    //003E : 06 48 00 
      return cl_GetBaseName();                                                  //0041 : 04 1B 33 05 00 00 16 
    }
    //07 41 00 19 19 01 00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 2E 0C 00 00 16 04 19 19 19 01 
    //00 E4 6B 0F 05 00 04 01 A8 83 18 11 06 00 04 1B 7F 05 00 00 16 06 00 00 1B 9C 0C 00 00 16 06 48 
    //00 04 1B 33 05 00 00 16 04 0B 47 
  }


  function string cl_GetBaseFullName() {
    return "<Unspecified character>";                                           //0000 : 04 1F 3C 55 6E 73 70 65 63 69 66 69 65 64 20 63 68 61 72 61 63 74 65 72 3E 00 
    //04 1F 3C 55 6E 73 70 65 63 69 66 69 65 64 20 63 68 61 72 61 63 74 65 72 3E 00 04 0B 47 
  }


  event string cl_GetBaseName() {
    return "<Unknown>";                                                         //0000 : 04 1F 3C 55 6E 6B 6E 6F 77 6E 3E 00 
    //04 1F 3C 55 6E 6B 6E 6F 77 6E 3E 00 04 0B 47 
  }


  function string GetGuildName() {
    return "";                                                                  //0000 : 04 1F 00 
    //04 1F 00 04 0B 47 
  }


  final native function int GetMoney();


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    if (mFaction == None) {                                                     //0006 : 07 1C 00 72 01 28 33 34 0F 2A 16 
      cl_SetFaction(mFactionId);                                                //0011 : 1B 4C 05 00 00 01 B0 32 34 0F 16 
    }
    //1C E0 C4 19 11 16 07 1C 00 72 01 28 33 34 0F 2A 16 1B 4C 05 00 00 01 B0 32 34 0F 16 04 0B 47 
  }



