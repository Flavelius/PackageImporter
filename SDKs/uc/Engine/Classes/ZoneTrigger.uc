//==============================================================================
//  ZoneTrigger
//==============================================================================

class ZoneTrigger extends Trigger
    dependsOn(ZoneInfo)
  ;


  function UnTouch(Actor Other) {
    local ZoneInfo Z;
    if (IsRelevant(Other)) {                                                    //0000 : 07 69 00 1B B1 2A 00 00 00 A0 C2 3B 19 16 
      if (Event != 'None') {                                                    //000E : 07 69 00 FF 01 38 9F 6C 0F 21 00 00 00 00 16 
        foreach AllActors(Class'ZoneInfo',Z) {                                  //001D : 2F 61 30 20 D8 C0 C1 00 00 D8 C3 3B 19 16 68 00 
          if (Z.ZoneTag == Event) {                                             //002D : 07 67 00 FE 19 00 D8 C3 3B 19 05 00 04 01 E8 7C 72 0F 01 38 9F 6C 0F 16 
            Z.UnTrigger(Other,Other.Instigator);                                //0045 : 19 00 D8 C3 3B 19 19 00 00 1B 33 01 00 00 00 A0 C2 3B 19 19 00 A0 C2 3B 19 05 00 04 01 B8 80 6C 0F 16 
          }
        }
      }
    }
    //07 69 00 1B B1 2A 00 00 00 A0 C2 3B 19 16 07 69 00 FF 01 38 9F 6C 0F 21 00 00 00 00 16 2F 61 30 
    //20 D8 C0 C1 00 00 D8 C3 3B 19 16 68 00 07 67 00 FE 19 00 D8 C3 3B 19 05 00 04 01 E8 7C 72 0F 01 
    //38 9F 6C 0F 16 19 00 D8 C3 3B 19 19 00 00 1B 33 01 00 00 00 A0 C2 3B 19 19 00 A0 C2 3B 19 05 00 
    //04 01 B8 80 6C 0F 16 31 30 04 0B 47 
  }


  function Touch(Actor Other) {
    local ZoneInfo Z;
    if (IsRelevant(Other)) {                                                    //0000 : 07 76 00 1B B1 2A 00 00 00 50 C4 3B 19 16 
      if (Event != 'None') {                                                    //000E : 07 69 00 FF 01 38 9F 6C 0F 21 00 00 00 00 16 
        foreach AllActors(Class'ZoneInfo',Z) {                                  //001D : 2F 61 30 20 D8 C0 C1 00 00 C8 C4 3B 19 16 68 00 
          if (Z.ZoneTag == Event) {                                             //002D : 07 67 00 FE 19 00 C8 C4 3B 19 05 00 04 01 E8 7C 72 0F 01 38 9F 6C 0F 16 
            Z.Trigger(Other,Other.Instigator);                                  //0045 : 19 00 C8 C4 3B 19 19 00 00 1B 32 01 00 00 00 50 C4 3B 19 19 00 50 C4 3B 19 05 00 04 01 B8 80 6C 0F 16 
          }
        }
      }
      if (bTriggerOnceOnly) {                                                   //0069 : 07 76 00 2D 01 D8 24 7E 0F 
        SetCollision(False);                                                    //0072 : 61 06 28 16 
      }
    }
    //07 76 00 1B B1 2A 00 00 00 50 C4 3B 19 16 07 69 00 FF 01 38 9F 6C 0F 21 00 00 00 00 16 2F 61 30 
    //20 D8 C0 C1 00 00 C8 C4 3B 19 16 68 00 07 67 00 FE 19 00 C8 C4 3B 19 05 00 04 01 E8 7C 72 0F 01 
    //38 9F 6C 0F 16 19 00 C8 C4 3B 19 19 00 00 1B 32 01 00 00 00 50 C4 3B 19 19 00 50 C4 3B 19 05 00 
    //04 01 B8 80 6C 0F 16 31 30 07 76 00 2D 01 D8 24 7E 0F 61 06 28 16 04 0B 47 
  }



