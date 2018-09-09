//==============================================================================
//  Interaction_Move
//==============================================================================

class Interaction_Move extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Actor,InteractiveLevelElement)
  ;

  var (Interaction_Move) const Vector Movement;
  var (Interaction_Move) const Rotator Rotation;
  var (Interaction_Move) const float TimeSec;
  var transient Vector OriginalPosition;
  var transient Rotator OriginalOrientation;
  var transient float mTimer;


  function ClOnEnd(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.ClOnEnd(aOwner,aInstigator,aReverse);                                 //0000 : 1C A8 A6 32 13 00 80 E7 F8 13 00 40 E9 F8 13 2D 00 B8 E9 F8 13 16 
    if (!aReverse) {                                                            //0016 : 07 CD 00 81 2D 00 B8 E9 F8 13 16 
      if (TimeSec > 0.00000000) {                                               //0021 : 07 CD 00 B1 01 30 EA F8 13 1E 00 00 00 00 16 
        aOwner.Velocity = vect(0.000000, 0.000000, 0.000000);                   //0030 : 0F 19 00 80 E7 F8 13 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
        aOwner.RotationRate.Yaw = 0;                                            //004C : 0F 36 20 BF 69 0F 19 00 80 E7 F8 13 05 00 0C 01 30 E8 6E 0F 25 
        aOwner.RotationRate.Pitch = 0;                                          //0061 : 0F 36 A8 BE 69 0F 19 00 80 E7 F8 13 05 00 0C 01 30 E8 6E 0F 25 
        aOwner.RotationRate.Roll = 0;                                           //0076 : 0F 36 98 BF 69 0F 19 00 80 E7 F8 13 05 00 0C 01 30 E8 6E 0F 25 
        aOwner.SetLocation(OriginalPosition + Movement);                        //008B : 19 00 80 E7 F8 13 0F 00 04 61 0B D7 01 A8 EA F8 13 01 20 EB F8 13 16 16 
        aOwner.SetRotation(OriginalOrientation + Rotation);                     //00A3 : 19 00 80 E7 F8 13 13 00 04 1C 70 01 6E 0F 61 3C 01 98 EB F8 13 01 10 EC F8 13 16 16 
        aOwner.SetPhysics(0);                                                   //00BF : 19 00 80 E7 F8 13 05 00 00 6F 82 24 00 16 
      }
    }
    //1C A8 A6 32 13 00 80 E7 F8 13 00 40 E9 F8 13 2D 00 B8 E9 F8 13 16 07 CD 00 81 2D 00 B8 E9 F8 13 
    //16 07 CD 00 B1 01 30 EA F8 13 1E 00 00 00 00 16 0F 19 00 80 E7 F8 13 05 00 0C 01 A0 95 6C 0F 23 
    //00 00 00 00 00 00 00 00 00 00 00 00 0F 36 20 BF 69 0F 19 00 80 E7 F8 13 05 00 0C 01 30 E8 6E 0F 
    //25 0F 36 A8 BE 69 0F 19 00 80 E7 F8 13 05 00 0C 01 30 E8 6E 0F 25 0F 36 98 BF 69 0F 19 00 80 E7 
    //F8 13 05 00 0C 01 30 E8 6E 0F 25 19 00 80 E7 F8 13 0F 00 04 61 0B D7 01 A8 EA F8 13 01 20 EB F8 
    //13 16 16 19 00 80 E7 F8 13 13 00 04 1C 70 01 6E 0F 61 3C 01 98 EB F8 13 01 10 EC F8 13 16 16 19 
    //00 80 E7 F8 13 05 00 00 6F 82 24 00 16 04 0B 47 
  }


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.ClOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 78 A8 32 13 00 38 ED F8 13 00 C0 EF F8 13 2D 00 38 F0 F8 13 16 
    if (!aReverse) {                                                            //0016 : 07 E0 00 81 2D 00 38 F0 F8 13 16 
      if (TimeSec > 0.00000000) {                                               //0021 : 07 A0 00 B1 01 30 EA F8 13 1E 00 00 00 00 16 
        OriginalPosition = aOwner.Location;                                     //0030 : 0F 01 A8 EA F8 13 19 00 38 ED F8 13 05 00 0C 01 30 81 6C 0F 
        OriginalOrientation = aOwner.Rotation;                                  //0044 : 0F 01 98 EB F8 13 19 00 38 ED F8 13 05 00 0C 01 00 84 6C 0F 
        aOwner.Velocity = Movement / TimeSec;                                   //0058 : 0F 19 00 38 ED F8 13 05 00 0C 01 A0 95 6C 0F D6 01 20 EB F8 13 01 30 EA F8 13 16 
        aOwner.RotationRate = Rotation / TimeSec;                               //0073 : 0F 19 00 38 ED F8 13 05 00 0C 01 30 E8 6E 0F 61 21 01 10 EC F8 13 01 30 EA F8 13 16 
        aOwner.SetPhysics(7);                                                   //008F : 19 00 38 ED F8 13 05 00 00 6F 82 24 07 16 
      } else {                                                                  //009D : 06 DD 00 
        aOwner.SetLocation(aOwner.Location + Movement);                         //00A0 : 19 00 38 ED F8 13 18 00 04 61 0B D7 19 00 38 ED F8 13 05 00 0C 01 30 81 6C 0F 01 20 EB F8 13 16 16 
        aOwner.SetRotation(OriginalOrientation + Rotation);                     //00C1 : 19 00 38 ED F8 13 13 00 04 1C 70 01 6E 0F 61 3C 01 98 EB F8 13 01 10 EC F8 13 16 16 
      }
    } else {                                                                    //00DD : 06 60 01 
      aOwner.Velocity = vect(0.000000, 0.000000, 0.000000);                     //00E0 : 0F 19 00 38 ED F8 13 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
      aOwner.RotationRate.Yaw = 0;                                              //00FC : 0F 36 20 BF 69 0F 19 00 38 ED F8 13 05 00 0C 01 30 E8 6E 0F 25 
      aOwner.RotationRate.Pitch = 0;                                            //0111 : 0F 36 A8 BE 69 0F 19 00 38 ED F8 13 05 00 0C 01 30 E8 6E 0F 25 
      aOwner.RotationRate.Roll = 0;                                             //0126 : 0F 36 98 BF 69 0F 19 00 38 ED F8 13 05 00 0C 01 30 E8 6E 0F 25 
      aOwner.SetLocation(OriginalPosition);                                     //013B : 19 00 38 ED F8 13 08 00 04 61 0B 01 A8 EA F8 13 16 
      aOwner.SetRotation(OriginalOrientation);                                  //014C : 19 00 38 ED F8 13 0B 00 04 1C 70 01 6E 0F 01 98 EB F8 13 16 
    }
    //1C 78 A8 32 13 00 38 ED F8 13 00 C0 EF F8 13 2D 00 38 F0 F8 13 16 07 E0 00 81 2D 00 38 F0 F8 13 
    //16 07 A0 00 B1 01 30 EA F8 13 1E 00 00 00 00 16 0F 01 A8 EA F8 13 19 00 38 ED F8 13 05 00 0C 01 
    //30 81 6C 0F 0F 01 98 EB F8 13 19 00 38 ED F8 13 05 00 0C 01 00 84 6C 0F 0F 19 00 38 ED F8 13 05 
    //00 0C 01 A0 95 6C 0F D6 01 20 EB F8 13 01 30 EA F8 13 16 0F 19 00 38 ED F8 13 05 00 0C 01 30 E8 
    //6E 0F 61 21 01 10 EC F8 13 01 30 EA F8 13 16 19 00 38 ED F8 13 05 00 00 6F 82 24 07 16 06 DD 00 
    //19 00 38 ED F8 13 18 00 04 61 0B D7 19 00 38 ED F8 13 05 00 0C 01 30 81 6C 0F 01 20 EB F8 13 16 
    //16 19 00 38 ED F8 13 13 00 04 1C 70 01 6E 0F 61 3C 01 98 EB F8 13 01 10 EC F8 13 16 16 06 60 01 
    //0F 19 00 38 ED F8 13 05 00 0C 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 0F 36 20 BF 
    //69 0F 19 00 38 ED F8 13 05 00 0C 01 30 E8 6E 0F 25 0F 36 A8 BE 69 0F 19 00 38 ED F8 13 05 00 0C 
    //01 30 E8 6E 0F 25 0F 36 98 BF 69 0F 19 00 38 ED F8 13 05 00 0C 01 30 E8 6E 0F 25 19 00 38 ED F8 
    //13 08 00 04 61 0B 01 A8 EA F8 13 16 19 00 38 ED F8 13 0B 00 04 1C 70 01 6E 0F 01 98 EB F8 13 16 
    //04 0B 47 
  }


  function SvOnEnd(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    ile = InteractiveLevelElement(aOwner);                                      //0000 : 0F 00 D8 F2 F8 13 2E F8 C7 5C 01 00 60 F1 F8 13 
    if (ile != None) {                                                          //0010 : 07 83 00 77 00 D8 F2 F8 13 2A 16 
      if (!aReverse) {                                                          //001B : 07 83 00 81 2D 00 50 F3 F8 13 16 
        ile.SetLocation(OriginalPosition + Movement);                           //0026 : 19 00 D8 F2 F8 13 0F 00 04 61 0B D7 01 A8 EA F8 13 01 20 EB F8 13 16 16 
        ile.SetRotation(OriginalOrientation + Rotation);                        //003E : 19 00 D8 F2 F8 13 13 00 04 1C 70 01 6E 0F 61 3C 01 98 EB F8 13 01 10 EC F8 13 16 16 
        mTimer = TimeSec;                                                       //005A : 0F 01 C8 F3 F8 13 01 30 EA F8 13 
        if (TimeSec > 0.00000000) {                                             //0065 : 07 83 00 B1 01 30 EA F8 13 1E 00 00 00 00 16 
          ile.sv_EndClientSubAction();                                          //0074 : 19 00 D8 F2 F8 13 06 00 00 1B F6 0F 00 00 16 
        }
      }
    }
    Super.SvOnEnd(aOwner,aInstigator,aReverse);                                 //0083 : 1C 88 AD 32 13 00 60 F1 F8 13 00 40 F4 F8 13 2D 00 50 F3 F8 13 16 
    //0F 00 D8 F2 F8 13 2E F8 C7 5C 01 00 60 F1 F8 13 07 83 00 77 00 D8 F2 F8 13 2A 16 07 83 00 81 2D 
    //00 50 F3 F8 13 16 19 00 D8 F2 F8 13 0F 00 04 61 0B D7 01 A8 EA F8 13 01 20 EB F8 13 16 16 19 00 
    //D8 F2 F8 13 13 00 04 1C 70 01 6E 0F 61 3C 01 98 EB F8 13 01 10 EC F8 13 16 16 0F 01 C8 F3 F8 13 
    //01 30 EA F8 13 07 83 00 B1 01 30 EA F8 13 1E 00 00 00 00 16 19 00 D8 F2 F8 13 06 00 00 1B F6 0F 
    //00 00 16 1C 88 AD 32 13 00 60 F1 F8 13 00 40 F4 F8 13 2D 00 50 F3 F8 13 16 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,optional bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator);                                        //0000 : 1C 60 AF 32 13 00 B8 F4 F8 13 00 50 F6 F8 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0010 : 0F 00 C8 F6 F8 13 2E F8 C7 5C 01 00 B8 F4 F8 13 
    if (ile != None) {                                                          //0020 : 07 AF 00 77 00 C8 F6 F8 13 2A 16 
      if (!aReverse) {                                                          //002B : 07 7B 00 81 2D 00 40 F7 F8 13 16 
        OriginalPosition = ile.Location;                                        //0036 : 0F 01 A8 EA F8 13 19 00 C8 F6 F8 13 05 00 0C 01 30 81 6C 0F 
        OriginalOrientation = ile.Rotation;                                     //004A : 0F 01 98 EB F8 13 19 00 C8 F6 F8 13 05 00 0C 01 00 84 6C 0F 
        mTimer = 0.00000000;                                                    //005E : 0F 01 C8 F3 F8 13 1E 00 00 00 00 
        ile.sv_StartClientSubAction();                                          //0069 : 19 00 C8 F6 F8 13 06 00 00 1B C3 0F 00 00 16 
      } else {                                                                  //0078 : 06 AF 00 
        ile.SetLocation(OriginalPosition);                                      //007B : 19 00 C8 F6 F8 13 08 00 04 61 0B 01 A8 EA F8 13 16 
        ile.SetRotation(OriginalOrientation);                                   //008C : 19 00 C8 F6 F8 13 0B 00 04 1C 70 01 6E 0F 01 98 EB F8 13 16 
        ile.sv_StartClientSubAction();                                          //00A0 : 19 00 C8 F6 F8 13 06 00 00 1B C3 0F 00 00 16 
      }
    }
    //1C 60 AF 32 13 00 B8 F4 F8 13 00 50 F6 F8 13 16 0F 00 C8 F6 F8 13 2E F8 C7 5C 01 00 B8 F4 F8 13 
    //07 AF 00 77 00 C8 F6 F8 13 2A 16 07 7B 00 81 2D 00 40 F7 F8 13 16 0F 01 A8 EA F8 13 19 00 C8 F6 
    //F8 13 05 00 0C 01 30 81 6C 0F 0F 01 98 EB F8 13 19 00 C8 F6 F8 13 05 00 0C 01 00 84 6C 0F 0F 01 
    //C8 F3 F8 13 1E 00 00 00 00 19 00 C8 F6 F8 13 06 00 00 1B C3 0F 00 00 16 06 AF 00 19 00 C8 F6 F8 
    //13 08 00 04 61 0B 01 A8 EA F8 13 16 19 00 C8 F6 F8 13 0B 00 04 1C 70 01 6E 0F 01 98 EB F8 13 16 
    //19 00 C8 F6 F8 13 06 00 00 1B C3 0F 00 00 16 04 0B 47 
  }



