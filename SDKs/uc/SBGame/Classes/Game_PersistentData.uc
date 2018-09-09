//==============================================================================
//  Game_PersistentData
//==============================================================================

class Game_PersistentData extends Base_Component within Game_Pawn
    native
    dependsOn()
    Config(System)
  ;

  var config bool mTutorialsActive;
  var config int mCurrentShardID;
  var config float mAudioRepeatTimer;


  native function bool IsMapSectionDiscovered(int section);


  native function Read();


  native function Write();



