//==============================================================================
//  SBClock
//==============================================================================

class SBClock extends Base_Component within Base_GameInfo
    native
    exportstructs
    dependsOn(Base_GameInfo)
  ;

  enum EDayTime {
    EDT_Night ,
    EDT_Morning ,
    EDT_Afternoon ,
    EDT_Evening 
  };

  var private int mReplicatedRealWorldTime;
  var private int mCurrentRealWorldTime;
  var private transient int mSBTime;
  var private float mLastUpdate;
  var private int mInitialUpdatePerformed;
  var private float mTimeSpeedUpFactor;
  var private int mTimeDelta;


  function string NaturalFormat(float aRelativeTimeOfDay) {
    local int hours;
    local int minutes;
    minutes = aRelativeTimeOfDay * 24 * 60;                                     //0000 : 0F 00 18 D0 26 11 39 44 AB AB 00 C8 CE 26 11 39 3F 2C 18 16 39 3F 2C 3C 16 
    hours = minutes / 60;                                                       //0019 : 0F 00 90 D0 26 11 91 00 18 D0 26 11 2C 3C 16 
    minutes -= hours * 60;                                                      //0028 : A2 00 18 D0 26 11 90 00 90 D0 26 11 2C 3C 16 16 
    if (minutes > 10) {                                                         //0038 : 07 61 00 97 00 18 D0 26 11 2C 0A 16 
      return "" $ string(hours) $ ":" $ string(minutes);                        //0044 : 04 70 70 70 1F 00 39 53 00 90 D0 26 11 16 1F 3A 00 16 39 53 00 18 D0 26 11 16 
    } else {                                                                    //005E : 06 7C 00 
      return "" $ string(hours) $ ":0" $ string(minutes);                       //0061 : 04 70 70 70 1F 00 39 53 00 90 D0 26 11 16 1F 3A 30 00 16 39 53 00 18 D0 26 11 16 
    }
    //0F 00 18 D0 26 11 39 44 AB AB 00 C8 CE 26 11 39 3F 2C 18 16 39 3F 2C 3C 16 0F 00 90 D0 26 11 91 
    //00 18 D0 26 11 2C 3C 16 A2 00 18 D0 26 11 90 00 90 D0 26 11 2C 3C 16 16 07 61 00 97 00 18 D0 26 
    //11 2C 0A 16 04 70 70 70 1F 00 39 53 00 90 D0 26 11 16 1F 3A 00 16 39 53 00 18 D0 26 11 16 06 7C 
    //00 04 70 70 70 1F 00 39 53 00 90 D0 26 11 16 1F 3A 30 00 16 39 53 00 18 D0 26 11 16 04 0B 47 
  }


  event float SetFixedRelativeTimeOfDay(float aFixedRelativeTimeOfDay) {
    if (aFixedRelativeTimeOfDay < 0) {                                          //0000 : 07 24 00 B0 00 30 D2 26 11 39 3F 25 16 
      Outer.mFixedRelativeTimeOfDay = -1.00000000;                              //000D : 0F 19 01 00 E4 6B 0F 05 00 04 01 B0 8A 28 11 1E 00 00 80 BF 
    } else {                                                                    //0021 : 06 44 00 
      Outer.mFixedRelativeTimeOfDay = FClamp(aFixedRelativeTimeOfDay,0.00000000,0.99900001);//0024 : 0F 19 01 00 E4 6B 0F 05 00 04 01 B0 8A 28 11 F6 00 30 D2 26 11 1E 00 00 00 00 1E 77 BE 7F 3F 16 
    }
    return Outer.mFixedRelativeTimeOfDay;                                       //0044 : 04 19 01 00 E4 6B 0F 05 00 04 01 B0 8A 28 11 
    //07 24 00 B0 00 30 D2 26 11 39 3F 25 16 0F 19 01 00 E4 6B 0F 05 00 04 01 B0 8A 28 11 1E 00 00 80 
    //BF 06 44 00 0F 19 01 00 E4 6B 0F 05 00 04 01 B0 8A 28 11 F6 00 30 D2 26 11 1E 00 00 00 00 1E 77 
    //BE 7F 3F 16 04 19 01 00 E4 6B 0F 05 00 04 01 B0 8A 28 11 04 0B 47 
  }


  event SetTimeSpeedUpFactor(float aSpeedUpFactor) {
    mTimeSpeedUpFactor = aSpeedUpFactor;                                        //0000 : 0F 01 28 D5 26 11 00 70 D4 26 11 
    //0F 01 28 D5 26 11 00 70 D4 26 11 04 0B 47 
  }


  native function byte GetTimeOfDay();


  function int GetCurrentTime() {
    return mCurrentRealWorldTime;                                               //0000 : 04 01 A8 D8 26 11 
    //04 01 A8 D8 26 11 04 0B 47 
  }


  native function string GetFormatted(string aFormat);


  native function float GetRelativeTimeOfDay();


  native event cl_OnUpdate();


  native event cl_OnFrame(float delta);



