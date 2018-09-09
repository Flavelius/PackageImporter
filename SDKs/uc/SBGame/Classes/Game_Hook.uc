//==============================================================================
//  Game_Hook
//==============================================================================

class Game_Hook extends Object
    native
    dependsOn()
  ;

  var byte HookType;
  var export editinline Content_Type Owner;
  var bool Fire;


  event string GetDescription() {
    return "[Hook: Initiator=" @ string(Owner)
      @ "Type=]"
      @ string(HookType);//0000 : 04 A8 A8 A8 1F 5B 48 6F 6F 6B 3A 20 49 6E 69 74 69 61 74 6F 72 3D 00 39 56 01 98 F9 1A 11 16 1F 54 79 70 65 3D 5D 00 16 39 52 01 B8 F7 1A 11 16 
    //04 A8 A8 A8 1F 5B 48 6F 6F 6B 3A 20 49 6E 69 74 69 61 74 6F 72 3D 00 39 56 01 98 F9 1A 11 16 1F 
    //54 79 70 65 3D 5D 00 16 39 52 01 B8 F7 1A 11 16 04 0B 47 
  }



