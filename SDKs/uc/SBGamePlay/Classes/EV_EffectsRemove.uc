//==============================================================================
//  EV_EffectsRemove
//==============================================================================

class EV_EffectsRemove extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Effects)
  ;

  var (Action) const bool RemoveFromObject;
  var (Action) const bool RemoveFromSubject;
  var (Action) const name Tag;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    if (RemoveFromObject) {                                                     //0000 : 07 26 00 2D 01 B8 A1 FF 13 
      aObject.Effects.sv_StopTagged(Tag);                                       //0009 : 19 19 00 A8 A0 FF 13 05 00 04 01 48 63 34 0F 0B 00 04 1C 58 ED 20 11 01 30 A2 FF 13 16 
    }
    if (RemoveFromSubject) {                                                    //0026 : 07 4C 00 2D 01 A8 A2 FF 13 
      aSubject.Effects.sv_StopTagged(Tag);                                      //002F : 19 19 00 20 A3 FF 13 05 00 04 01 48 63 34 0F 0B 00 04 1C 58 ED 20 11 01 30 A2 FF 13 16 
    }
    //07 26 00 2D 01 B8 A1 FF 13 19 19 00 A8 A0 FF 13 05 00 04 01 48 63 34 0F 0B 00 04 1C 58 ED 20 11 
    //01 30 A2 FF 13 16 07 4C 00 2D 01 A8 A2 FF 13 19 19 00 20 A3 FF 13 05 00 04 01 48 63 34 0F 0B 00 
    //04 1C 58 ED 20 11 01 30 A2 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return (aObject != None || aSubject != None)
      && (RemoveFromObject || RemoveFromSubject)
      && Tag != 'None';//0000 : 04 82 82 84 77 00 98 A3 FF 13 2A 16 18 09 00 77 00 90 A4 FF 13 2A 16 16 18 12 00 84 2D 01 B8 A1 FF 13 18 07 00 2D 01 A8 A2 FF 13 16 16 18 0D 00 FF 01 30 A2 FF 13 21 00 00 00 00 16 16 
    //04 82 82 84 77 00 98 A3 FF 13 2A 16 18 09 00 77 00 90 A4 FF 13 2A 16 16 18 12 00 84 2D 01 B8 A1 
    //FF 13 18 07 00 2D 01 A8 A2 FF 13 16 16 18 0D 00 FF 01 30 A2 FF 13 21 00 00 00 00 16 16 04 0B 47 
    //
  }



