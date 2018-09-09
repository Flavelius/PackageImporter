//==============================================================================
//  Interaction_RandomTimer
//==============================================================================

class Interaction_RandomTimer extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Interaction_RandomTimer) Range RangeSeconds;
  var transient float mTimer;


  function SvOnCancel(Game_Actor aOwner,Game_Pawn aInstigator) {
    Super.SvOnCancel(aOwner,aInstigator);                                       //0000 : 1C C0 AA 32 13 00 48 2A F9 13 00 18 2B F9 13 16 
    mTimer = 0.00000000;                                                        //0010 : 0F 01 90 2B F9 13 1E 00 00 00 00 
    //1C C0 AA 32 13 00 48 2A F9 13 00 18 2B F9 13 16 0F 01 90 2B F9 13 1E 00 00 00 00 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 80 2C F9 13 00 90 2D F9 13 2D 00 08 2E F9 13 16 
    if (!aReverse) {                                                            //0016 : 07 4D 00 81 2D 00 08 2E F9 13 16 
      mTimer = RangeSeconds.Min + FRand() * (RangeSeconds.Max - RangeSeconds.Min);//0021 : 0F 01 90 2B F9 13 AE 36 38 D6 6B 0F 01 08 2C F9 13 AB C3 16 AF 36 B0 D6 6B 0F 01 08 2C F9 13 36 38 D6 6B 0F 01 08 2C F9 13 16 16 16 
    }
    //1C 60 AF 32 13 00 80 2C F9 13 00 90 2D F9 13 2D 00 08 2E F9 13 16 07 4D 00 81 2D 00 08 2E F9 13 
    //16 0F 01 90 2B F9 13 AE 36 38 D6 6B 0F 01 08 2C F9 13 AB C3 16 AF 36 B0 D6 6B 0F 01 08 2C F9 13 
    //36 38 D6 6B 0F 01 08 2C F9 13 16 16 16 04 0B 47 
  }



