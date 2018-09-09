//==============================================================================
//  TooltipActor
//==============================================================================

class TooltipActor extends Actor
    native
    dependsOn()
    Placeable
  ;

  var (TooltipActor) LocalizedString mTooltipText;


  event string GetTooltipText() {
    return mTooltipText.Text;                                                   //0000 : 04 36 58 C6 6B 0F 01 F0 6D 30 0F 
    //04 36 58 C6 6B 0F 01 F0 6D 30 0F 04 0B 47 
  }



