//==============================================================================
//  Interaction_Freeze
//==============================================================================

class Interaction_Freeze extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_CharacterStats)
  ;

  var (Interaction_Freeze) bool Freeze;
  var (Interaction_Freeze) bool FreezeMovement;
  var (Interaction_Freeze) bool FreezeRotation;
  var (Interaction_Freeze) bool FreezeAnimation;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 20 46 F9 13 00 98 46 F9 13 2D 00 10 47 F9 13 16 
    if (!aReverse) {                                                            //0016 : 07 35 00 81 2D 00 10 47 F9 13 16 
      DoFreeze(aInstigator,Freeze);                                             //0021 : 1B E0 6F 00 00 00 98 46 F9 13 2D 01 88 47 F9 13 16 
    } else {                                                                    //0032 : 06 48 00 
      DoFreeze(aInstigator,!Freeze);                                            //0035 : 1B E0 6F 00 00 00 98 46 F9 13 81 2D 01 88 47 F9 13 16 16 
    }
    //1C 60 AF 32 13 00 20 46 F9 13 00 98 46 F9 13 2D 00 10 47 F9 13 16 07 35 00 81 2D 00 10 47 F9 13 
    //16 1B E0 6F 00 00 00 98 46 F9 13 2D 01 88 47 F9 13 16 06 48 00 1B E0 6F 00 00 00 98 46 F9 13 81 
    //2D 01 88 47 F9 13 16 16 04 0B 47 
  }


  protected function DoFreeze(Game_Pawn aInstigator,bool aFreeze) {
    if (FreezeMovement) {                                                       //0000 : 07 27 00 2D 01 78 48 F9 13 
      aInstigator.CharacterStats.FreezeMovement(aFreeze);                       //0009 : 19 19 00 00 48 F9 13 05 00 04 01 08 43 34 0F 0C 00 00 1B A1 0C 00 00 2D 00 F0 48 F9 13 16 
    }
    if (FreezeRotation) {                                                       //0027 : 07 4E 00 2D 01 68 49 F9 13 
      aInstigator.CharacterStats.FreezeRotation(aFreeze);                       //0030 : 19 19 00 00 48 F9 13 05 00 04 01 08 43 34 0F 0C 00 00 1B B8 0C 00 00 2D 00 F0 48 F9 13 16 
    }
    if (FreezeAnimation) {                                                      //004E : 07 75 00 2D 01 E0 49 F9 13 
      aInstigator.CharacterStats.FreezeAnimation(aFreeze);                      //0057 : 19 19 00 00 48 F9 13 05 00 04 01 08 43 34 0F 0C 00 00 1B 0B 10 00 00 2D 00 F0 48 F9 13 16 
    }
    //07 27 00 2D 01 78 48 F9 13 19 19 00 00 48 F9 13 05 00 04 01 08 43 34 0F 0C 00 00 1B A1 0C 00 00 
    //2D 00 F0 48 F9 13 16 07 4E 00 2D 01 68 49 F9 13 19 19 00 00 48 F9 13 05 00 04 01 08 43 34 0F 0C 
    //00 00 1B B8 0C 00 00 2D 00 F0 48 F9 13 16 07 75 00 2D 01 E0 49 F9 13 19 19 00 00 48 F9 13 05 00 
    //04 01 08 43 34 0F 0C 00 00 1B 0B 10 00 00 2D 00 F0 48 F9 13 16 04 0B 47 
  }



