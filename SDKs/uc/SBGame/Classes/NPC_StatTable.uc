//==============================================================================
//  NPC_StatTable
//==============================================================================

class NPC_StatTable extends Content_Type
    native
    exportstructs
    dependsOn()
  ;

  struct StatPreview {
      var int B;
      var int M;
      var int F;

  };


  var (Preview) transient int PreviewLevel;
  var (Preview) const transient array<StatPreview> Preview;
  var (stat) int BasePoints;
  var (stat) int LevelPerPoints;
  var (stat) int PointsMultiplier;


  protected event MakePreview() {
    local int i;
    Preview.Length = PreviewLevel;                                              //0000 : 0F 37 01 C8 D6 33 11 01 40 D7 33 11 
    i = 0;                                                                      //000C : 0F 00 70 D5 33 11 25 
    while (i < Preview.Length) {                                                //0013 : 07 81 00 96 00 70 D5 33 11 37 01 C8 D6 33 11 16 
      Preview[i].B = GetBody(i);                                                //0023 : 0F 36 40 D8 33 11 10 00 70 D5 33 11 01 C8 D6 33 11 1B 9A 0C 00 00 00 70 D5 33 11 16 
      Preview[i].M = GetMind(i);                                                //003F : 0F 36 B8 D8 33 11 10 00 70 D5 33 11 01 C8 D6 33 11 1B 0E 0D 00 00 00 70 D5 33 11 16 
      Preview[i].F = GetFocus(i);                                               //005B : 0F 36 30 D9 33 11 10 00 70 D5 33 11 01 C8 D6 33 11 1B 0F 0D 00 00 00 70 D5 33 11 16 
      i++;                                                                      //0077 : A5 00 70 D5 33 11 16 
    }
    //0F 37 01 C8 D6 33 11 01 40 D7 33 11 0F 00 70 D5 33 11 25 07 81 00 96 00 70 D5 33 11 37 01 C8 D6 
    //33 11 16 0F 36 40 D8 33 11 10 00 70 D5 33 11 01 C8 D6 33 11 1B 9A 0C 00 00 00 70 D5 33 11 16 0F 
    //36 B8 D8 33 11 10 00 70 D5 33 11 01 C8 D6 33 11 1B 0E 0D 00 00 00 70 D5 33 11 16 0F 36 30 D9 33 
    //11 10 00 70 D5 33 11 01 C8 D6 33 11 1B 0F 0D 00 00 00 70 D5 33 11 16 A5 00 70 D5 33 11 16 06 13 
    //00 04 0B 47 
  }


  protected function int PointsAtLevel(int aLevel) {
    return BasePoints + aLevel / LevelPerPoints;                                //0000 : 04 92 01 18 DB 33 11 91 00 58 DA 33 11 01 90 DB 33 11 16 16 
    //04 92 01 18 DB 33 11 91 00 58 DA 33 11 01 90 DB 33 11 16 16 04 0B 47 
  }


  function int GetFocus(int aLevel) {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  function int GetMind(int aLevel) {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  function int GetBody(int aLevel) {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  function int GetHitpointsPerLevel(int aLevel) {
    return 10;                                                                  //0000 : 04 2C 0A 
    //04 2C 0A 04 0B 47 
  }


  function int GetBaseHitpoints(int aLevel) {
    return 100;                                                                 //0000 : 04 2C 64 
    //04 2C 64 04 0B 47 
  }



