//==============================================================================
//  Interaction_Sit
//==============================================================================

class Interaction_Sit extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_CharacterStats)
  ;

  var private transient float mSitTimer;


  function SvOnCancel(Game_Actor aOwner,Game_Pawn aInstigator) {
    Super.SvOnCancel(aOwner,aInstigator);                                       //0000 : 1C C0 AA 32 13 00 D8 15 F9 13 00 98 16 F9 13 16 
    //1C C0 AA 32 13 00 D8 15 F9 13 00 98 16 F9 13 16 04 0B 47 
  }


  function SvOnEnd(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    //04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,optional bool aReverse) {
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 D0 19 F9 13 00 28 1B F9 13 2D 00 A0 1B F9 13 16 
    mSitTimer = 0.00000000;                                                     //0016 : 0F 01 58 19 F9 13 1E 00 00 00 00 
    if (aInstigator != None) {                                                  //0021 : 07 80 00 77 00 28 1B F9 13 2A 16 
      if (aInstigator.CharacterStats != None) {                                 //002C : 07 68 00 77 19 00 28 1B F9 13 05 00 04 01 08 43 34 0F 2A 16 
        aInstigator.CharacterStats.FreezeMovementTimed(1.20000005);             //0040 : 19 19 00 28 1B F9 13 05 00 04 01 08 43 34 0F 0B 00 00 1B A5 0C 00 00 1E 9A 99 99 3F 16 
        mSitTimer = 1.20000005;                                                 //005D : 0F 01 58 19 F9 13 1E 9A 99 99 3F 
      }
      aInstigator.sv_Sit(!aReverse,True);                                       //0068 : 19 00 28 1B F9 13 0F 00 00 1B 94 0C 00 00 81 2D 00 A0 1B F9 13 16 27 16 
    }
    //1C 60 AF 32 13 00 D0 19 F9 13 00 28 1B F9 13 2D 00 A0 1B F9 13 16 0F 01 58 19 F9 13 1E 00 00 00 
    //00 07 80 00 77 00 28 1B F9 13 2A 16 07 68 00 77 19 00 28 1B F9 13 05 00 04 01 08 43 34 0F 2A 16 
    //19 19 00 28 1B F9 13 05 00 04 01 08 43 34 0F 0B 00 00 1B A5 0C 00 00 1E 9A 99 99 3F 16 0F 01 58 
    //19 F9 13 1E 9A 99 99 3F 19 00 28 1B F9 13 0F 00 00 1B 94 0C 00 00 81 2D 00 A0 1B F9 13 16 27 16 
    //04 0B 47 
  }



