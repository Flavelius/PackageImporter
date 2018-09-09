//==============================================================================
//  InteractiveMailbox
//==============================================================================

class InteractiveMailbox extends InteractiveLevelElement
    native
    dependsOn()
  ;

  var LocalizedString MailTooltip;


  event string cl_GetToolTip() {
    return MailTooltip.Text;                                                    //0000 : 04 36 58 C6 6B 0F 01 C8 73 30 0F 
    //04 36 58 C6 6B 0F 01 C8 73 30 0F 04 0B 47 
  }



