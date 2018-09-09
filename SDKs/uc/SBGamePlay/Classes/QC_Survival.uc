//==============================================================================
//  QC_Survival
//==============================================================================

class QC_Survival extends Quest_Condition
    native
    collapsecategories
    editinlinenew
    dependsOn(Class,StringReferences)
  ;

  var (Survival) const float DefeatFraction;


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QC_SurvivalText.Text;                //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 2E 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 2E 1C 11 04 0B 47 
  }



