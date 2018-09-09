//==============================================================================
//  SBMover
//==============================================================================

class SBMover extends Mover
    native
    dependsOn()
  ;

  enum SBMoverLabel {
    SBML_None ,
    SBML_Open ,
    SBML_Close ,
    SBML_Running ,
    SBML_Stopping ,
    SBML_Begin 
  };

  enum SBMoverState {
    SBMS_None ,
    SBMS_OpenTimedMover ,
    SBMS_WasOpenTimedMover ,
    SBMS_StandOpenTimed ,
    SBMS_BumpOpenTimed ,
    SBMS_TriggerOpenTimed ,
    SBMS_LoopMove ,
    SBMS_TriggerToggle ,
    SBMS_TriggerControl ,
    SBMS_WasTriggerControl ,
    SBMS_TriggerPound ,
    SBMS_WasTriggerPound ,
    SBMS_TriggerAdvance ,
    SBMS_WasTriggerAdvance ,
    SBMS_BumpButton ,
    SBMS_WasBumpButton ,
    SBMS_ConstantLoop ,
    SBMS_LeadInOutLooper ,
    SBMS_LeadInOutLooping ,
    SBMS_RotatingMover 
  };

  var transient Vector mNetOldPos;
  var transient int mNetOldRotPitch;
  var transient int mNetOldRotYaw;
  var transient int mNetOldRotRoll;
  var transient Vector mNetInterpolate;
  var transient Vector mOldNetInterpolate;
  var transient byte ClientStop;
  var transient byte StoppedPosition;
  var transient byte mNetActiveSound;
  var transient byte mNetState;
  var transient byte mNetStateLabel;


  function SetStoppedPosition(byte NewPos) {
    StoppedPosition = NewPos;                                                   //0000 : 0F 01 F8 62 38 19 00 40 62 38 19 
    //0F 01 F8 62 38 19 00 40 62 38 19 04 0B 47 
  }


  function InterpolateTo(byte NewKeyNum,float Seconds) {
    Super.InterpolateTo(NewKeyNum,Seconds);                                     //0000 : 1C 20 19 79 0F 00 20 64 38 19 00 B0 65 38 19 16 
    if (IsServer()) {                                                           //0010 : 07 AB 00 1B FF 0B 00 00 16 
      mNetOldPos = OldPos;                                                      //0019 : 0F 01 28 66 38 19 01 30 1F 79 0F 
      mNetOldRotYaw = OldRot.Yaw;                                               //0024 : 0F 01 10 91 36 0F 36 20 BF 69 0F 01 A8 1F 79 0F 
      mNetOldRotPitch = OldRot.Pitch;                                           //0034 : 0F 01 88 91 36 0F 36 A8 BE 69 0F 01 A8 1F 79 0F 
      mNetOldRotRoll = OldRot.Roll;                                             //0044 : 0F 01 00 92 36 0F 36 98 BF 69 0F 01 A8 1F 79 0F 
      mNetInterpolate.X = 100.00000000 * PhysAlpha;                             //0054 : 0F 36 48 C4 69 0F 01 78 92 36 0F AB 1E 00 00 C8 42 01 F8 34 78 0F 16 
      mNetInterpolate.Y = 100.00000000 * FMax(0.00100000,PhysRate);             //006B : 0F 36 C0 C4 69 0F 01 78 92 36 0F AB 1E 00 00 C8 42 F5 1E 6F 12 83 3A 01 98 20 79 0F 16 16 
      mNetInterpolate.Z = 256.00000000 * PrevKeyNum + KeyNum;                   //0089 : 0F 36 38 C5 69 0F 01 78 92 36 0F AE AB 1E 00 00 80 43 39 3C 01 08 34 78 0F 16 39 3C 01 80 34 78 0F 16 
    }
    //1C 20 19 79 0F 00 20 64 38 19 00 B0 65 38 19 16 07 AB 00 1B FF 0B 00 00 16 0F 01 28 66 38 19 01 
    //30 1F 79 0F 0F 01 10 91 36 0F 36 20 BF 69 0F 01 A8 1F 79 0F 0F 01 88 91 36 0F 36 A8 BE 69 0F 01 
    //A8 1F 79 0F 0F 01 00 92 36 0F 36 98 BF 69 0F 01 A8 1F 79 0F 0F 36 48 C4 69 0F 01 78 92 36 0F AB 
    //1E 00 00 C8 42 01 F8 34 78 0F 16 0F 36 C0 C4 69 0F 01 78 92 36 0F AB 1E 00 00 C8 42 F5 1E 6F 12 
    //83 3A 01 98 20 79 0F 16 16 0F 36 38 C5 69 0F 01 78 92 36 0F AE AB 1E 00 00 80 43 39 3C 01 08 34 
    //78 0F 16 39 3C 01 80 34 78 0F 16 04 0B 47 
  }


  function UpdateState() {
    ResolveStateChange(mNetState,mNetStateLabel);                               //0000 : 1B B5 2B 00 00 01 A0 93 36 0F 01 18 94 36 0F 16 
    UpdateInterpolation();                                                      //0010 : 1C 90 94 36 0F 16 
    //1B B5 2B 00 00 01 A0 93 36 0F 01 18 94 36 0F 16 1C 90 94 36 0F 16 04 0B 47 
  }


  function SBGotoState(optional name aNewState,optional name aLabel) {
    if (IsServer()) {                                                           //0000 : 07 19 00 1B FF 0B 00 00 16 
      ResolveState(aNewState,aLabel);                                           //0009 : 1B AF 2B 00 00 00 F0 95 36 0F 00 D0 96 36 0F 16 
    }
    Super.SBGotoState(aNewState,aLabel);                                        //0019 : 1C C8 6F 78 0F 00 F0 95 36 0F 00 D0 96 36 0F 16 
    //07 19 00 1B FF 0B 00 00 16 1B AF 2B 00 00 00 F0 95 36 0F 00 D0 96 36 0F 16 1C C8 6F 78 0F 00 F0 
    //95 36 0F 00 D0 96 36 0F 16 04 0B 47 
  }


  function ResolveState(optional name aNewState,optional name aLabel) {
    switch (aNewState) {                                                        //0000 : 05 04 00 F8 97 36 0F 
      case 'OpenTimedMover' :                                                   //0007 : 0A 1A 00 21 39 2B 00 00 
        mNetState = 1;                                                          //000F : 0F 01 A0 93 36 0F 24 01 
        break;                                                                  //0017 : 06 7E 01 
      case 'WasOpenTimedMover' :                                                //001A : 0A 2D 00 21 F5 2A 00 00 
        mNetState = 2;                                                          //0022 : 0F 01 A0 93 36 0F 24 02 
        break;                                                                  //002A : 06 7E 01 
      case 'StandOpenTimed' :                                                   //002D : 0A 40 00 21 DB 2A 00 00 
        mNetState = 3;                                                          //0035 : 0F 01 A0 93 36 0F 24 03 
        break;                                                                  //003D : 06 7E 01 
      case 'BumpOpenTimed' :                                                    //0040 : 0A 53 00 21 DC 2A 00 00 
        mNetState = 4;                                                          //0048 : 0F 01 A0 93 36 0F 24 04 
        break;                                                                  //0050 : 06 7E 01 
      case 'TriggerOpenTimed' :                                                 //0053 : 0A 66 00 21 F1 2A 00 00 
        mNetState = 5;                                                          //005B : 0F 01 A0 93 36 0F 24 05 
        break;                                                                  //0063 : 06 7E 01 
      case 'LoopMove' :                                                         //0066 : 0A 79 00 21 C8 2A 00 00 
        mNetState = 6;                                                          //006E : 0F 01 A0 93 36 0F 24 06 
        break;                                                                  //0076 : 06 7E 01 
      case 'TriggerToggle' :                                                    //0079 : 0A 8C 00 21 B0 2A 00 00 
        mNetState = 7;                                                          //0081 : 0F 01 A0 93 36 0F 24 07 
        break;                                                                  //0089 : 06 7E 01 
      case 'TriggerControl' :                                                   //008C : 0A 9F 00 21 AD 2A 00 00 
        mNetState = 8;                                                          //0094 : 0F 01 A0 93 36 0F 24 08 
        break;                                                                  //009C : 06 7E 01 
      case 'WasTriggerControl' :                                                //009F : 0A B2 00 21 F0 2A 00 00 
        mNetState = 9;                                                          //00A7 : 0F 01 A0 93 36 0F 24 09 
        break;                                                                  //00AF : 06 7E 01 
      case 'TriggerPound' :                                                     //00B2 : 0A C5 00 21 CB 2A 00 00 
        mNetState = 10;                                                         //00BA : 0F 01 A0 93 36 0F 24 0A 
        break;                                                                  //00C2 : 06 7E 01 
      case 'WasTriggerPound' :                                                  //00C5 : 0A D8 00 21 EC 2A 00 00 
        mNetState = 11;                                                         //00CD : 0F 01 A0 93 36 0F 24 0B 
        break;                                                                  //00D5 : 06 7E 01 
      case 'TriggerAdvance' :                                                   //00D8 : 0A EB 00 21 98 2A 00 00 
        mNetState = 12;                                                         //00E0 : 0F 01 A0 93 36 0F 24 0C 
        break;                                                                  //00E8 : 06 7E 01 
      case 'WasTriggerAdvance' :                                                //00EB : 0A FE 00 21 16 2B 00 00 
        mNetState = 13;                                                         //00F3 : 0F 01 A0 93 36 0F 24 0D 
        break;                                                                  //00FB : 06 7E 01 
      case 'BumpButton' :                                                       //00FE : 0A 11 01 21 C6 2A 00 00 
        mNetState = 14;                                                         //0106 : 0F 01 A0 93 36 0F 24 0E 
        break;                                                                  //010E : 06 7E 01 
      case 'WasBumpButton' :                                                    //0111 : 0A 24 01 21 E8 2A 00 00 
        mNetState = 15;                                                         //0119 : 0F 01 A0 93 36 0F 24 0F 
        break;                                                                  //0121 : 06 7E 01 
      case 'ConstantLoop' :                                                     //0124 : 0A 37 01 21 E9 2A 00 00 
        mNetState = 16;                                                         //012C : 0F 01 A0 93 36 0F 24 10 
        break;                                                                  //0134 : 06 7E 01 
      case 'LeadInOutLooper' :                                                  //0137 : 0A 4A 01 21 ED 2A 00 00 
        mNetState = 17;                                                         //013F : 0F 01 A0 93 36 0F 24 11 
        break;                                                                  //0147 : 06 7E 01 
      case 'LeadInOutLooping' :                                                 //014A : 0A 5D 01 21 EE 2A 00 00 
        mNetState = 18;                                                         //0152 : 0F 01 A0 93 36 0F 24 12 
        break;                                                                  //015A : 06 7E 01 
      case 'RotatingMover' :                                                    //015D : 0A 70 01 21 7F 2B 00 00 
        mNetState = 19;                                                         //0165 : 0F 01 A0 93 36 0F 24 13 
        break;                                                                  //016D : 06 7E 01 
      default:                                                                  //0170 : 0A FF FF 
        mNetState = 0;                                                          //0173 : 0F 01 A0 93 36 0F 24 00 
        break;                                                                  //017B : 06 7E 01 
    }
    switch (aLabel) {                                                           //017E : 05 04 00 A8 72 38 19 
      case 'Open' :                                                             //0185 : 0A 98 01 21 6C 2A 00 00 
        mNetStateLabel = 1;                                                     //018D : 0F 01 18 94 36 0F 24 01 
        break;                                                                  //0195 : 06 F2 01 
      case 'Close' :                                                            //0198 : 0A AB 01 21 6E 2A 00 00 
        mNetStateLabel = 2;                                                     //01A0 : 0F 01 18 94 36 0F 24 02 
        break;                                                                  //01A8 : 06 F2 01 
      case 'Running' :                                                          //01AB : 0A BE 01 21 23 26 00 00 
        mNetStateLabel = 3;                                                     //01B3 : 0F 01 18 94 36 0F 24 03 
        break;                                                                  //01BB : 06 F2 01 
      case 'Stopping' :                                                         //01BE : 0A D1 01 21 EF 2A 00 00 
        mNetStateLabel = 4;                                                     //01C6 : 0F 01 18 94 36 0F 24 04 
        break;                                                                  //01CE : 06 F2 01 
      case 'Begin' :                                                            //01D1 : 0A E4 01 21 64 00 00 00 
        mNetStateLabel = 5;                                                     //01D9 : 0F 01 18 94 36 0F 24 05 
        break;                                                                  //01E1 : 06 F2 01 
      default:                                                                  //01E4 : 0A FF FF 
        mNetStateLabel = 0;                                                     //01E7 : 0F 01 18 94 36 0F 24 00 
        break;                                                                  //01EF : 06 F2 01 
    }
    //05 04 00 F8 97 36 0F 0A 1A 00 21 39 2B 00 00 0F 01 A0 93 36 0F 24 01 06 7E 01 0A 2D 00 21 F5 2A 
    //00 00 0F 01 A0 93 36 0F 24 02 06 7E 01 0A 40 00 21 DB 2A 00 00 0F 01 A0 93 36 0F 24 03 06 7E 01 
    //0A 53 00 21 DC 2A 00 00 0F 01 A0 93 36 0F 24 04 06 7E 01 0A 66 00 21 F1 2A 00 00 0F 01 A0 93 36 
    //0F 24 05 06 7E 01 0A 79 00 21 C8 2A 00 00 0F 01 A0 93 36 0F 24 06 06 7E 01 0A 8C 00 21 B0 2A 00 
    //00 0F 01 A0 93 36 0F 24 07 06 7E 01 0A 9F 00 21 AD 2A 00 00 0F 01 A0 93 36 0F 24 08 06 7E 01 0A 
    //B2 00 21 F0 2A 00 00 0F 01 A0 93 36 0F 24 09 06 7E 01 0A C5 00 21 CB 2A 00 00 0F 01 A0 93 36 0F 
    //24 0A 06 7E 01 0A D8 00 21 EC 2A 00 00 0F 01 A0 93 36 0F 24 0B 06 7E 01 0A EB 00 21 98 2A 00 00 
    //0F 01 A0 93 36 0F 24 0C 06 7E 01 0A FE 00 21 16 2B 00 00 0F 01 A0 93 36 0F 24 0D 06 7E 01 0A 11 
    //01 21 C6 2A 00 00 0F 01 A0 93 36 0F 24 0E 06 7E 01 0A 24 01 21 E8 2A 00 00 0F 01 A0 93 36 0F 24 
    //0F 06 7E 01 0A 37 01 21 E9 2A 00 00 0F 01 A0 93 36 0F 24 10 06 7E 01 0A 4A 01 21 ED 2A 00 00 0F 
    //01 A0 93 36 0F 24 11 06 7E 01 0A 5D 01 21 EE 2A 00 00 0F 01 A0 93 36 0F 24 12 06 7E 01 0A 70 01 
    //21 7F 2B 00 00 0F 01 A0 93 36 0F 24 13 06 7E 01 0A FF FF 0F 01 A0 93 36 0F 24 00 06 7E 01 05 04 
    //00 A8 72 38 19 0A 98 01 21 6C 2A 00 00 0F 01 18 94 36 0F 24 01 06 F2 01 0A AB 01 21 6E 2A 00 00 
    //0F 01 18 94 36 0F 24 02 06 F2 01 0A BE 01 21 23 26 00 00 0F 01 18 94 36 0F 24 03 06 F2 01 0A D1 
    //01 21 EF 2A 00 00 0F 01 18 94 36 0F 24 04 06 F2 01 0A E4 01 21 64 00 00 00 0F 01 18 94 36 0F 24 
    //05 06 F2 01 0A FF FF 0F 01 18 94 36 0F 24 00 06 F2 01 04 0B 47 
  }


  function ResolveStateChange(byte aStateName,byte aStateLabel) {
    local name stateName;
    local name stateLabel;
    switch (aStateName) {                                                       //0000 : 05 01 00 D0 73 38 19 
      case 1 :                                                                  //0007 : 0A 1A 00 24 01 
        stateName = 'OpenTimedMover';                                           //000C : 0F 00 48 74 38 19 21 39 2B 00 00 
        break;                                                                  //0017 : 06 81 01 
      case 2 :                                                                  //001A : 0A 2D 00 24 02 
        stateName = 'WasOpenTimedMover';                                        //001F : 0F 00 48 74 38 19 21 F5 2A 00 00 
        break;                                                                  //002A : 06 81 01 
      case 3 :                                                                  //002D : 0A 40 00 24 03 
        stateName = 'StandOpenTimed';                                           //0032 : 0F 00 48 74 38 19 21 DB 2A 00 00 
        break;                                                                  //003D : 06 81 01 
      case 4 :                                                                  //0040 : 0A 53 00 24 04 
        stateName = 'BumpOpenTimed';                                            //0045 : 0F 00 48 74 38 19 21 DC 2A 00 00 
        break;                                                                  //0050 : 06 81 01 
      case 5 :                                                                  //0053 : 0A 66 00 24 05 
        stateName = 'TriggerOpenTimed';                                         //0058 : 0F 00 48 74 38 19 21 F1 2A 00 00 
        break;                                                                  //0063 : 06 81 01 
      case 6 :                                                                  //0066 : 0A 79 00 24 06 
        stateName = 'LoopMove';                                                 //006B : 0F 00 48 74 38 19 21 C8 2A 00 00 
        break;                                                                  //0076 : 06 81 01 
      case 7 :                                                                  //0079 : 0A 8C 00 24 07 
        stateName = 'TriggerToggle';                                            //007E : 0F 00 48 74 38 19 21 B0 2A 00 00 
        break;                                                                  //0089 : 06 81 01 
      case 8 :                                                                  //008C : 0A 9F 00 24 08 
        stateName = 'TriggerControl';                                           //0091 : 0F 00 48 74 38 19 21 AD 2A 00 00 
        break;                                                                  //009C : 06 81 01 
      case 9 :                                                                  //009F : 0A B2 00 24 09 
        stateName = 'WasTriggerControl';                                        //00A4 : 0F 00 48 74 38 19 21 F0 2A 00 00 
        break;                                                                  //00AF : 06 81 01 
      case 10 :                                                                 //00B2 : 0A C5 00 24 0A 
        stateName = 'TriggerPound';                                             //00B7 : 0F 00 48 74 38 19 21 CB 2A 00 00 
        break;                                                                  //00C2 : 06 81 01 
      case 11 :                                                                 //00C5 : 0A D8 00 24 0B 
        stateName = 'WasTriggerPound';                                          //00CA : 0F 00 48 74 38 19 21 EC 2A 00 00 
        break;                                                                  //00D5 : 06 81 01 
      case 12 :                                                                 //00D8 : 0A EB 00 24 0C 
        stateName = 'TriggerAdvance';                                           //00DD : 0F 00 48 74 38 19 21 98 2A 00 00 
        break;                                                                  //00E8 : 06 81 01 
      case 13 :                                                                 //00EB : 0A FE 00 24 0D 
        stateName = 'WasTriggerAdvance';                                        //00F0 : 0F 00 48 74 38 19 21 16 2B 00 00 
        break;                                                                  //00FB : 06 81 01 
      case 14 :                                                                 //00FE : 0A 11 01 24 0E 
        stateName = 'BumpButton';                                               //0103 : 0F 00 48 74 38 19 21 C6 2A 00 00 
        break;                                                                  //010E : 06 81 01 
      case 15 :                                                                 //0111 : 0A 24 01 24 0F 
        stateName = 'WasBumpButton';                                            //0116 : 0F 00 48 74 38 19 21 E8 2A 00 00 
        break;                                                                  //0121 : 06 81 01 
      case 16 :                                                                 //0124 : 0A 37 01 24 10 
        stateName = 'ConstantLoop';                                             //0129 : 0F 00 48 74 38 19 21 E9 2A 00 00 
        break;                                                                  //0134 : 06 81 01 
      case 17 :                                                                 //0137 : 0A 4A 01 24 11 
        stateName = 'LeadInOutLooper';                                          //013C : 0F 00 48 74 38 19 21 ED 2A 00 00 
        break;                                                                  //0147 : 06 81 01 
      case 18 :                                                                 //014A : 0A 5D 01 24 12 
        stateName = 'LeadInOutLooping';                                         //014F : 0F 00 48 74 38 19 21 EE 2A 00 00 
        break;                                                                  //015A : 06 81 01 
      case 19 :                                                                 //015D : 0A 70 01 24 13 
        stateName = 'RotatingMover';                                            //0162 : 0F 00 48 74 38 19 21 7F 2B 00 00 
        break;                                                                  //016D : 06 81 01 
      default:                                                                  //0170 : 0A FF FF 
        stateName = 'None';                                                     //0173 : 0F 00 48 74 38 19 21 00 00 00 00 
        break;                                                                  //017E : 06 81 01 
    }
    switch (aStateLabel) {                                                      //0181 : 05 01 00 C0 74 38 19 
      case 1 :                                                                  //0188 : 0A 9B 01 24 01 
        stateLabel = 'Open';                                                    //018D : 0F 00 38 75 38 19 21 6C 2A 00 00 
        break;                                                                  //0198 : 06 F8 01 
      case 2 :                                                                  //019B : 0A AE 01 24 02 
        stateLabel = 'Close';                                                   //01A0 : 0F 00 38 75 38 19 21 6E 2A 00 00 
        break;                                                                  //01AB : 06 F8 01 
      case 3 :                                                                  //01AE : 0A C1 01 24 03 
        stateLabel = 'Running';                                                 //01B3 : 0F 00 38 75 38 19 21 23 26 00 00 
        break;                                                                  //01BE : 06 F8 01 
      case 4 :                                                                  //01C1 : 0A D4 01 24 04 
        stateLabel = 'Stopping';                                                //01C6 : 0F 00 38 75 38 19 21 EF 2A 00 00 
        break;                                                                  //01D1 : 06 F8 01 
      case 5 :                                                                  //01D4 : 0A E7 01 24 05 
        stateLabel = 'Begin';                                                   //01D9 : 0F 00 38 75 38 19 21 64 00 00 00 
        break;                                                                  //01E4 : 06 F8 01 
      default:                                                                  //01E7 : 0A FF FF 
        stateLabel = 'None';                                                    //01EA : 0F 00 38 75 38 19 21 00 00 00 00 
        break;                                                                  //01F5 : 06 F8 01 
    }
    GotoState(stateName,stateLabel);                                            //01F8 : 71 00 48 74 38 19 00 38 75 38 19 16 
    //05 01 00 D0 73 38 19 0A 1A 00 24 01 0F 00 48 74 38 19 21 39 2B 00 00 06 81 01 0A 2D 00 24 02 0F 
    //00 48 74 38 19 21 F5 2A 00 00 06 81 01 0A 40 00 24 03 0F 00 48 74 38 19 21 DB 2A 00 00 06 81 01 
    //0A 53 00 24 04 0F 00 48 74 38 19 21 DC 2A 00 00 06 81 01 0A 66 00 24 05 0F 00 48 74 38 19 21 F1 
    //2A 00 00 06 81 01 0A 79 00 24 06 0F 00 48 74 38 19 21 C8 2A 00 00 06 81 01 0A 8C 00 24 07 0F 00 
    //48 74 38 19 21 B0 2A 00 00 06 81 01 0A 9F 00 24 08 0F 00 48 74 38 19 21 AD 2A 00 00 06 81 01 0A 
    //B2 00 24 09 0F 00 48 74 38 19 21 F0 2A 00 00 06 81 01 0A C5 00 24 0A 0F 00 48 74 38 19 21 CB 2A 
    //00 00 06 81 01 0A D8 00 24 0B 0F 00 48 74 38 19 21 EC 2A 00 00 06 81 01 0A EB 00 24 0C 0F 00 48 
    //74 38 19 21 98 2A 00 00 06 81 01 0A FE 00 24 0D 0F 00 48 74 38 19 21 16 2B 00 00 06 81 01 0A 11 
    //01 24 0E 0F 00 48 74 38 19 21 C6 2A 00 00 06 81 01 0A 24 01 24 0F 0F 00 48 74 38 19 21 E8 2A 00 
    //00 06 81 01 0A 37 01 24 10 0F 00 48 74 38 19 21 E9 2A 00 00 06 81 01 0A 4A 01 24 11 0F 00 48 74 
    //38 19 21 ED 2A 00 00 06 81 01 0A 5D 01 24 12 0F 00 48 74 38 19 21 EE 2A 00 00 06 81 01 0A 70 01 
    //24 13 0F 00 48 74 38 19 21 7F 2B 00 00 06 81 01 0A FF FF 0F 00 48 74 38 19 21 00 00 00 00 06 81 
    //01 05 01 00 C0 74 38 19 0A 9B 01 24 01 0F 00 38 75 38 19 21 6C 2A 00 00 06 F8 01 0A AE 01 24 02 
    //0F 00 38 75 38 19 21 6E 2A 00 00 06 F8 01 0A C1 01 24 03 0F 00 38 75 38 19 21 23 26 00 00 06 F8 
    //01 0A D4 01 24 04 0F 00 38 75 38 19 21 EF 2A 00 00 06 F8 01 0A E7 01 24 05 0F 00 38 75 38 19 21 
    //64 00 00 00 06 F8 01 0A FF FF 0F 00 38 75 38 19 21 00 00 00 00 06 F8 01 71 00 48 74 38 19 00 38 
    //75 38 19 16 04 0B 47 
  }


  event cl_OnBaseline() {
    Super.cl_OnBaseline();                                                      //0000 : 1C B8 29 6E 0F 16 
    UpdateState();                                                              //0006 : 1B AE 2B 00 00 16 
    //1C B8 29 6E 0F 16 1B AE 2B 00 00 16 04 0B 47 
  }


  final native function TriggerSound(byte aSoundType);


  final native function UpdateInterpolation();



