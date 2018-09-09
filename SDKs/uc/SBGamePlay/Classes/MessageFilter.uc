//==============================================================================
//  MessageFilter
//==============================================================================

class MessageFilter extends Object
    dependsOn()
  ;

  var int flags;


  function bool HasFlag(int Flag) {
    return (flags & Flag) > 0;                                                  //0000 : 04 97 9C 01 48 30 38 23 00 10 66 4C 23 16 25 16 
    //04 97 9C 01 48 30 38 23 00 10 66 4C 23 16 25 16 04 0B 47 
  }


  function RemoveFlag(int oldFlag) {
    flags = flags & ~oldFlag;                                                   //0000 : 0F 01 48 30 38 23 9C 01 48 30 38 23 8D 00 C0 63 4C 23 16 16 
    //0F 01 48 30 38 23 9C 01 48 30 38 23 8D 00 C0 63 4C 23 16 16 04 0B 47 
  }


  function AddFlag(int newFlag) {
    flags = flags | newFlag;                                                    //0000 : 0F 01 48 30 38 23 9E 01 48 30 38 23 00 98 62 4C 23 16 
    //0F 01 48 30 38 23 9E 01 48 30 38 23 00 98 62 4C 23 16 04 0B 47 
  }


  function int GetTotalFlags() {
    return flags;                                                               //0000 : 04 01 48 30 38 23 
    //04 01 48 30 38 23 04 0B 47 
  }


  function InitFlag(int NewValue) {
    flags = NewValue;                                                           //0000 : 0F 01 48 30 38 23 00 08 60 4C 23 
    //0F 01 48 30 38 23 00 08 60 4C 23 04 0B 47 
  }



