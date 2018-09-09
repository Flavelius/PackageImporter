//==============================================================================
//  Game_MirroredAppearance
//==============================================================================

class Game_MirroredAppearance extends Game_ShiftableAppearance within Game_Pawn
    native
    dependsOn()
  ;

  var private Game_Pawn mReferencedPawn;
  var private Game_AppearanceListener mListener;


  function InstallBaseAppearance(export editinline NPC_Type aNPCType) {
    //04 0B 47 
  }


  event bool sv_UnshiftAppearance() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event bool sv_ShiftAppearance(export editinline NPC_Type aOtherNPCType) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event NPC_Type GetShiftedNPCType() {
    if (mReferencedPawn != None) {                                              //0000 : 07 27 00 77 01 80 FC 33 19 2A 16 
      return mReferencedPawn.Appearance.GetShiftedNPCType();                    //000B : 04 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 06 00 04 1B 7F 05 00 00 16 
    } else {                                                                    //0024 : 06 29 00 
      return None;                                                              //0027 : 04 2A 
    }
    //07 27 00 77 01 80 FC 33 19 2A 16 04 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 06 00 04 1B 7F 
    //05 00 00 16 06 29 00 04 2A 04 0B 47 
  }


  event bool IsShifted() {
    if (mReferencedPawn != None) {                                              //0000 : 07 27 00 77 01 80 FC 33 19 2A 16 
      return mReferencedPawn.Appearance.IsShifted();                            //000B : 04 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 06 00 04 1B 2E 0C 00 00 16 
    } else {                                                                    //0024 : 06 29 00 
      return False;                                                             //0027 : 04 28 
    }
    //07 27 00 77 01 80 FC 33 19 2A 16 04 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 06 00 04 1B 2E 
    //0C 00 00 16 06 29 00 04 28 04 0B 47 
  }


  event Game_Appearance GetBase() {
    if (mReferencedPawn != None) {                                              //0000 : 07 27 00 77 01 80 FC 33 19 2A 16 
      return mReferencedPawn.Appearance.GetCurrent();                           //000B : 04 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 
    } else {                                                                    //0024 : 06 29 00 
      return None;                                                              //0027 : 04 2A 
    }
    //07 27 00 77 01 80 FC 33 19 2A 16 04 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 
    //05 00 00 16 06 29 00 04 2A 04 0B 47 
  }


  event Game_Appearance GetCurrent() {
    if (mReferencedPawn != None) {                                              //0000 : 07 27 00 77 01 80 FC 33 19 2A 16 
      return mReferencedPawn.Appearance.GetCurrent();                           //000B : 04 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 
    } else {                                                                    //0024 : 06 29 00 
      return None;                                                              //0027 : 04 2A 
    }
    //07 27 00 77 01 80 FC 33 19 2A 16 04 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 
    //05 00 00 16 06 29 00 04 2A 04 0B 47 
  }


  event SetReferencedPawn(Game_Pawn aNewReferencedPawn) {
    assert(aNewReferencedPawn == None
      || aNewReferencedPawn.Appearance != self);//0000 : 09 2E 00 84 72 00 58 02 34 19 2A 16 18 12 00 77 19 00 58 02 34 19 05 00 04 01 A8 83 18 11 17 16 16 
    if (mReferencedPawn == None) {                                              //0021 : 07 2C 00 72 01 80 FC 33 19 2A 16 
    }
    if (mReferencedPawn != aNewReferencedPawn) {                                //002C : 07 11 01 77 01 80 FC 33 19 00 58 02 34 19 16 
      if (mReferencedPawn != None) {                                            //003B : 07 96 00 77 01 80 FC 33 19 2A 16 
        assert(mListener != None);                                              //0046 : 09 49 00 77 01 78 04 34 19 2A 16 
        mListener.__OnAppearanceChanged__Delegate = None;                       //0051 : 45 19 01 78 04 34 19 05 00 08 01 70 78 20 11 44 00 00 00 00 
        assert(mReferencedPawn.Appearance != None);                             //0065 : 09 4B 00 77 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 2A 16 
        mReferencedPawn.Appearance.UnregisterAppearanceListener(mListener);     //0079 : 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 0B 00 00 1B 7A 0E 00 00 01 78 04 34 19 16 
      }
      mReferencedPawn = aNewReferencedPawn;                                     //0096 : 0F 01 80 FC 33 19 00 58 02 34 19 
      if (mReferencedPawn != None) {                                            //00A1 : 07 11 01 77 01 80 FC 33 19 2A 16 
        if (mListener == None) {                                                //00AC : 07 C6 00 72 01 78 04 34 19 2A 16 
          mListener = new Class'Game_AppearanceListener';                       //00B7 : 0F 01 78 04 34 19 11 0B 0B 0B 20 30 73 20 11 
        }
        mListener.__OnAppearanceChanged__Delegate = OnReferencedPawnsAppearanceChanged;//00C6 : 45 19 01 78 04 34 19 05 00 08 01 70 78 20 11 44 11 0E 00 00 
        assert(mReferencedPawn.Appearance != None);                             //00DA : 09 5B 00 77 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 2A 16 
        mReferencedPawn.Appearance.RegisterAppearanceListener(mListener);       //00EE : 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 0B 00 00 1B 26 0E 00 00 01 78 04 34 19 16 
        DressUp();                                                              //010B : 1C D0 30 19 11 16 
      }
    }
    //09 2E 00 84 72 00 58 02 34 19 2A 16 18 12 00 77 19 00 58 02 34 19 05 00 04 01 A8 83 18 11 17 16 
    //16 07 2C 00 72 01 80 FC 33 19 2A 16 07 11 01 77 01 80 FC 33 19 00 58 02 34 19 16 07 96 00 77 01 
    //80 FC 33 19 2A 16 09 49 00 77 01 78 04 34 19 2A 16 45 19 01 78 04 34 19 05 00 08 01 70 78 20 11 
    //44 00 00 00 00 09 4B 00 77 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 2A 16 19 19 01 80 FC 33 19 
    //05 00 04 01 A8 83 18 11 0B 00 00 1B 7A 0E 00 00 01 78 04 34 19 16 0F 01 80 FC 33 19 00 58 02 34 
    //19 07 11 01 77 01 80 FC 33 19 2A 16 07 C6 00 72 01 78 04 34 19 2A 16 0F 01 78 04 34 19 11 0B 0B 
    //0B 20 30 73 20 11 45 19 01 78 04 34 19 05 00 08 01 70 78 20 11 44 11 0E 00 00 09 5B 00 77 19 01 
    //80 FC 33 19 05 00 04 01 A8 83 18 11 2A 16 19 19 01 80 FC 33 19 05 00 04 01 A8 83 18 11 0B 00 00 
    //1B 26 0E 00 00 01 78 04 34 19 16 1C D0 30 19 11 16 04 0B 47 
  }


  function OnReferencedPawnsAppearanceChanged(Game_Pawn aPawn,export editinline Game_Appearance aAppearance) {
    assert(mReferencedPawn != None);                                            //0000 : 09 20 00 77 01 80 FC 33 19 2A 16 
    if (aPawn == mReferencedPawn) {                                             //000B : 07 20 00 72 00 F0 04 34 19 01 80 FC 33 19 16 
      DressUp();                                                                //001A : 1C D0 30 19 11 16 
    }
    //09 20 00 77 01 80 FC 33 19 2A 16 07 20 00 72 00 F0 04 34 19 01 80 FC 33 19 16 1C D0 30 19 11 16 
    //04 0B 47 
  }



