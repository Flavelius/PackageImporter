//==============================================================================
//  Game_ItemContainerListener
//==============================================================================

class Game_ItemContainerListener extends Object
    native
    dependsOn()
  ;

  var byte mLocationType;
  var int mLocationSlot;
  var int mLocationID;
  var (null);
  var (null);
  var (null);


  event SetItemLocation(byte aLocationType,int aLocationSlot,optional int aLocationID) {
    mLocationType = aLocationType;                                              //0000 : 0F 01 08 47 35 11 00 30 46 35 11 
    mLocationSlot = aLocationSlot;                                              //000B : 0F 01 80 47 35 11 00 F8 47 35 11 
    mLocationID = aLocationID;                                                  //0016 : 0F 01 70 48 35 11 00 E8 48 35 11 
    //0F 01 08 47 35 11 00 30 46 35 11 0F 01 80 47 35 11 00 F8 47 35 11 0F 01 70 48 35 11 00 E8 48 35 
    //11 04 0B 47 
  }


  delegate OnUsedItem();


  delegate OnSetContainerLock(bool aLock);


  delegate OnUpdateContainer(Game_Item aItem);



