//==============================================================================
//  AnimNotify_Trigger
//==============================================================================

class AnimNotify_Trigger extends AnimNotify_Scripted
    collapsecategories
    editinlinenew
    dependsOn(Actor)
  ;

  var (AnimNotify_Trigger) name EventName;


  event Notify(Actor Owner) {
    Owner.TriggerEvent(EventName,Owner,Pawn(Owner));                            //0000 : 19 00 B0 67 F2 1C 1A 00 00 1C F8 B1 34 0F 01 80 D3 F2 1C 00 B0 67 F2 1C 2E 50 31 D4 00 00 B0 67 F2 1C 16 
    //19 00 B0 67 F2 1C 1A 00 00 1C F8 B1 34 0F 01 80 D3 F2 1C 00 B0 67 F2 1C 2E 50 31 D4 00 00 B0 67 
    //F2 1C 16 04 0B 47 
  }



