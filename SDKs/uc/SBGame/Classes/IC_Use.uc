//==============================================================================
//  IC_Use
//==============================================================================

class IC_Use extends Item_Component
    native
    editinlinenew
    dependsOn(Content_Event)
  ;

  var (ContentEvent) const array<Content_Event> Events;


  event OnUse(Game_Pawn aPawn,Game_Item aItem) {
    local int ei;
    local export editinline Content_Event E;
    ei = 0;                                                                     //0000 : 0F 00 E8 09 36 19 25 
    while (ei < Events.Length) {                                                //0007 : 07 56 00 96 00 E8 09 36 19 37 01 60 0A 36 19 16 
      E = Events[ei];                                                           //0017 : 0F 00 D8 0A 36 19 10 00 E8 09 36 19 01 60 0A 36 19 
      if (E != None) {                                                          //0028 : 07 4C 00 77 00 D8 0A 36 19 2A 16 
        E.sv_Execute(aPawn,aPawn);                                              //0033 : 19 00 D8 0A 36 19 10 00 00 1B 23 0C 00 00 00 70 09 36 19 00 70 09 36 19 16 
      }
      ei++;                                                                     //004C : A5 00 E8 09 36 19 16 
    }
    //0F 00 E8 09 36 19 25 07 56 00 96 00 E8 09 36 19 37 01 60 0A 36 19 16 0F 00 D8 0A 36 19 10 00 E8 
    //09 36 19 01 60 0A 36 19 07 4C 00 77 00 D8 0A 36 19 2A 16 19 00 D8 0A 36 19 10 00 00 1B 23 0C 00 
    //00 00 70 09 36 19 00 70 09 36 19 16 A5 00 E8 09 36 19 16 06 07 00 04 0B 47 
  }


  event bool CanUse(Game_Pawn aPawn,Game_Item aItem) {
    local int ei;
    local export editinline Content_Event E;
    ei = 0;                                                                     //0000 : 0F 00 40 0C 36 19 25 
    while (ei < Events.Length) {                                                //0007 : 07 5F 00 96 00 40 0C 36 19 37 01 60 0A 36 19 16 
      E = Events[ei];                                                           //0017 : 0F 00 B8 0C 36 19 10 00 40 0C 36 19 01 60 0A 36 19 
      if (E != None && !E.sv_CanExecute(aPawn,aPawn)) {                         //0028 : 07 55 00 82 77 00 B8 0C 36 19 2A 16 18 1C 00 81 19 00 B8 0C 36 19 10 00 04 1B 22 0C 00 00 00 C8 0B 36 19 00 C8 0B 36 19 16 16 16 
        return False;                                                           //0053 : 04 28 
      }
      ei++;                                                                     //0055 : A5 00 40 0C 36 19 16 
    }
    return Super.CanUse(aPawn,aItem);                                           //005F : 04 1C 18 93 2E 11 00 C8 0B 36 19 00 30 0D 36 19 16 
    //0F 00 40 0C 36 19 25 07 5F 00 96 00 40 0C 36 19 37 01 60 0A 36 19 16 0F 00 B8 0C 36 19 10 00 40 
    //0C 36 19 01 60 0A 36 19 07 55 00 82 77 00 B8 0C 36 19 2A 16 18 1C 00 81 19 00 B8 0C 36 19 10 00 
    //04 1B 22 0C 00 00 00 C8 0B 36 19 00 C8 0B 36 19 16 16 16 04 28 A5 00 40 0C 36 19 16 06 07 00 04 
    //1C 18 93 2E 11 00 C8 0B 36 19 00 30 0D 36 19 16 04 0B 47 
  }



