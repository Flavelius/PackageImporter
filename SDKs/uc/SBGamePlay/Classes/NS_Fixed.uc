//==============================================================================
//  NS_Fixed
//==============================================================================

class NS_Fixed extends NPC_StatTable
    native
    editinlinenew
    dependsOn()
  ;

  var (Stats) int Body;
  var (Stats) int Mind;
  var (Stats) int Focus;
  var (Stats) int Hitpoints;


  function int GetFocus(int aLevel) {
    return Focus;                                                               //0000 : 04 01 08 DC E9 14 
    //04 01 08 DC E9 14 04 0B 47 
  }


  function int GetMind(int aLevel) {
    return Mind;                                                                //0000 : 04 01 58 DE E9 14 
    //04 01 58 DE E9 14 04 0B 47 
  }


  function int GetBody(int aLevel) {
    return Body;                                                                //0000 : 04 01 A8 E0 E9 14 
    //04 01 A8 E0 E9 14 04 0B 47 
  }


  function int GetHitpointsPerLevel(int aLevel) {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  function int GetBaseHitpoints(int aLevel) {
    return Hitpoints;                                                           //0000 : 04 01 18 E4 E9 14 
    //04 01 18 E4 E9 14 04 0B 47 
  }



