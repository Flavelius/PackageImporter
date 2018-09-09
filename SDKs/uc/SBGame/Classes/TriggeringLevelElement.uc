//==============================================================================
//  TriggeringLevelElement
//==============================================================================

class TriggeringLevelElement extends InteractiveLevelElement
    native
    exportstructs
    dependsOn()
    NotPlaceable
  ;

  struct MenuOptionRelationStruct {
      var (MenuOptionRelationStruct) byte Option;
      var (MenuOptionRelationStruct) editinline Actor TriggeredActor;
      var (MenuOptionRelationStruct) name EventName;

  };


  var (TriggeringLevelElement) array<MenuOptionRelationStruct> Triggers;


  function OnTargetDescription(Pawn anInstigator) {
    //04 0B 47 
  }


  function bool sv_OnRadialMenuOption(Game_Pawn anInstigator,int anOption) {
    local int i;
    if (!Super.sv_OnRadialMenuOption(anInstigator,anOption)) {                  //0000 : 07 17 00 81 1C 68 52 32 13 00 F0 5C 35 0F 00 D8 5E 35 0F 16 16 
      return False;                                                             //0015 : 04 28 
    }
    if (Triggers.Length == 0) {                                                 //0017 : 07 37 00 9A 37 01 78 5C 35 0F 25 16 
      TriggerEvent(Event,self,anInstigator);                                    //0023 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 F0 5C 35 0F 16 
    } else {                                                                    //0034 : 06 E9 00 
      i = 0;                                                                    //0037 : 0F 00 50 5F 35 0F 25 
      while (i < Triggers.Length) {                                             //003E : 07 E9 00 96 00 50 5F 35 0F 37 01 78 5C 35 0F 16 
        if (Triggers[i].Option == anOption) {                                   //004E : 07 DF 00 9A 39 3A 36 50 60 35 0F 10 00 50 5F 35 0F 01 78 5C 35 0F 00 D8 5E 35 0F 16 
          if (Triggers[i].TriggeredActor != None) {                             //006A : 07 A3 00 77 36 C8 60 35 0F 10 00 50 5F 35 0F 01 78 5C 35 0F 2A 16 
            Triggers[i].TriggeredActor.Trigger(self,anInstigator);              //0080 : 19 36 C8 60 35 0F 10 00 50 5F 35 0F 01 78 5C 35 0F 0C 00 00 1B 32 01 00 00 17 00 F0 5C 35 0F 16 
          } else {                                                              //00A0 : 06 DC 00 
            if (Triggers[i].EventName != 'None') {                              //00A3 : 07 DC 00 FF 36 40 61 35 0F 10 00 50 5F 35 0F 01 78 5C 35 0F 21 00 00 00 00 16 
              TriggerEvent(Triggers[i].EventName,self,anInstigator);            //00BD : 1C F8 B1 34 0F 36 40 61 35 0F 10 00 50 5F 35 0F 01 78 5C 35 0F 17 00 F0 5C 35 0F 16 
              goto jl00DC;                                                      //00D9 : 06 DC 00 
            }
          }
          goto jl00DF;                                                          //00DC : 06 DF 00 
        }
        ++i;                                                                    //00DF : A3 00 50 5F 35 0F 16 
      }
    }
    return True;                                                                //00E9 : 04 27 
    //07 17 00 81 1C 68 52 32 13 00 F0 5C 35 0F 00 D8 5E 35 0F 16 16 04 28 07 37 00 9A 37 01 78 5C 35 
    //0F 25 16 1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 F0 5C 35 0F 16 06 E9 00 0F 00 50 5F 35 0F 25 07 E9 
    //00 96 00 50 5F 35 0F 37 01 78 5C 35 0F 16 07 DF 00 9A 39 3A 36 50 60 35 0F 10 00 50 5F 35 0F 01 
    //78 5C 35 0F 00 D8 5E 35 0F 16 07 A3 00 77 36 C8 60 35 0F 10 00 50 5F 35 0F 01 78 5C 35 0F 2A 16 
    //19 36 C8 60 35 0F 10 00 50 5F 35 0F 01 78 5C 35 0F 0C 00 00 1B 32 01 00 00 17 00 F0 5C 35 0F 16 
    //06 DC 00 07 DC 00 FF 36 40 61 35 0F 10 00 50 5F 35 0F 01 78 5C 35 0F 21 00 00 00 00 16 1C F8 B1 
    //34 0F 36 40 61 35 0F 10 00 50 5F 35 0F 01 78 5C 35 0F 17 00 F0 5C 35 0F 16 06 DC 00 06 DF 00 A3 
    //00 50 5F 35 0F 16 06 3E 00 04 27 04 0B 47 
  }



