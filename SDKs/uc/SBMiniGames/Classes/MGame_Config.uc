//==============================================================================
//  MGame_Config
//==============================================================================

class MGame_Config extends Object
    dependsOn()
  ;

  const MGAME_CONFIG_ENABLED =  1;
  const MGAME_CONFIG_DISABLED =  0;
  const MGAME_CONFIG_COLOR_BLACK =  1;
  const MGAME_CONFIG_COLOR_WHITE =  0;
  const MGAME_CONFIG_TIME_30_MINUTES =  3;
  const MGAME_CONFIG_TIME_15_MINUTES =  2;
  const MGAME_CONFIG_TIME_10_MINUTES =  1;
  const MGAME_CONFIG_TIME_5_MINUTES =  0;
  var private array<int> mTimeConfig;
  var private array<int> mConfigValues;


  function int GetTime(int aTimeIndex) {
    return mTimeConfig[aTimeIndex];                                             //0000 : 04 10 00 A0 FB 18 11 01 18 FC 18 11 
    //04 10 00 A0 FB 18 11 01 18 FC 18 11 04 0B 47 
  }


  function int GetConfig(int aSetting) {
    return mConfigValues[aSetting];                                             //0000 : 04 10 00 B8 FD 18 11 01 70 FE 18 11 
    //04 10 00 B8 FD 18 11 01 70 FE 18 11 04 0B 47 
  }


  function SetConfig(int aSetting,int aValue) {
    mConfigValues[aSetting] = aValue;                                           //0000 : 0F 10 00 10 00 19 11 01 70 FE 18 11 00 D0 00 19 11 
    //0F 10 00 10 00 19 11 01 70 FE 18 11 00 D0 00 19 11 04 0B 47 
  }


  function SetConfigCount(int aConfigCount) {
    mConfigValues.Length = aConfigCount;                                        //0000 : 0F 37 01 70 FE 18 11 00 F8 01 19 11 
    //0F 37 01 70 FE 18 11 00 F8 01 19 11 04 0B 47 
  }


  function Initialize() {
    //04 0B 47 
  }



