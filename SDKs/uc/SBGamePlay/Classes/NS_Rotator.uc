//==============================================================================
//  NS_Rotator
//==============================================================================

class NS_Rotator extends NPC_StatTable
    native
    editinlinenew
    dependsOn()
  ;

  enum ERotStatPriority {
    ERSP_Body ,
    ERSP_Focus ,
    ERSP_Mind 
  };

  var (stat) array<byte> Rotation;
  var (stat) int DefaultBody;
  var (stat) int DefaultMind;
  var (stat) int DefaultFocus;
  var (stat) int Hitpoints;
  var (stat) int HpPerLevel;


  protected function int GetPointsForStat(int aLevel,byte aStat) {
    local int totalPoints;
    local int i;
    local int ret;
    ret = 0;                                                                    //0000 : 0F 00 80 6D 31 0F 25 
    totalPoints = PointsAtLevel(aLevel);                                        //0007 : 0F 00 F8 6D 31 0F 1B 60 10 00 00 00 50 75 31 0F 16 
    if (Rotation.Length != 0) {                                                 //0018 : 07 77 00 9B 37 01 70 6E 31 0F 25 16 
      i = 0;                                                                    //0024 : 0F 00 E8 6E 31 0F 25 
      while (i < totalPoints) {                                                 //002B : 07 77 00 96 00 E8 6E 31 0F 00 F8 6D 31 0F 16 
        if (Rotation[i % Rotation.Length] == aStat) {                           //003A : 07 6D 00 9A 39 3A 10 39 44 AD 39 3F 00 E8 6E 31 0F 39 3F 37 01 70 6E 31 0F 16 01 70 6E 31 0F 39 3A 00 60 6F 31 0F 16 
          ret += PointsMultiplier;                                              //0061 : A1 00 80 6D 31 0F 01 38 E6 33 11 16 
        }
        i++;                                                                    //006D : A5 00 E8 6E 31 0F 16 
      }
    }
    return ret;                                                                 //0077 : 04 00 80 6D 31 0F 
    //0F 00 80 6D 31 0F 25 0F 00 F8 6D 31 0F 1B 60 10 00 00 00 50 75 31 0F 16 07 77 00 9B 37 01 70 6E 
    //31 0F 25 16 0F 00 E8 6E 31 0F 25 07 77 00 96 00 E8 6E 31 0F 00 F8 6D 31 0F 16 07 6D 00 9A 39 3A 
    //10 39 44 AD 39 3F 00 E8 6E 31 0F 39 3F 37 01 70 6E 31 0F 16 01 70 6E 31 0F 39 3A 00 60 6F 31 0F 
    //16 A1 00 80 6D 31 0F 01 38 E6 33 11 16 A5 00 E8 6E 31 0F 16 06 2B 00 04 00 80 6D 31 0F 04 0B 47 
    //
  }


  function int GetFocus(int aLevel) {
    return DefaultFocus + GetPointsForStat(aLevel,1);                           //0000 : 04 92 01 C8 71 31 0F 1B D1 6F 00 00 00 00 71 31 0F 24 01 16 16 
    //04 92 01 C8 71 31 0F 1B D1 6F 00 00 00 00 71 31 0F 24 01 16 16 04 0B 47 
  }


  function int GetMind(int aLevel) {
    return DefaultMind + GetPointsForStat(aLevel,2);                            //0000 : 04 92 01 08 D0 E9 14 1B D1 6F 00 00 00 68 73 31 0F 24 02 16 16 
    //04 92 01 08 D0 E9 14 1B D1 6F 00 00 00 68 73 31 0F 24 02 16 16 04 0B 47 
  }


  function int GetBody(int aLevel) {
    return DefaultBody + GetPointsForStat(aLevel,0);                            //0000 : 04 92 01 20 D2 E9 14 1B D1 6F 00 00 00 A8 D1 E9 14 24 00 16 16 
    //04 92 01 20 D2 E9 14 1B D1 6F 00 00 00 A8 D1 E9 14 24 00 16 16 04 0B 47 
  }


  function int GetHitpointsPerLevel(int aLevel) {
    return HpPerLevel;                                                          //0000 : 04 01 70 D4 E9 14 
    //04 01 70 D4 E9 14 04 0B 47 
  }


  function int GetBaseHitpoints(int aLevel) {
    return Hitpoints;                                                           //0000 : 04 01 10 D6 E9 14 
    //04 01 10 D6 E9 14 04 0B 47 
  }



