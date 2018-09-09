//==============================================================================
//  QC_Stealth
//==============================================================================

class QC_Stealth extends Quest_Condition
    native
    collapsecategories
    editinlinenew
    dependsOn(Class,StringReferences)
  ;

  var (Condition) const editinline array<NPC_Type> NamedTargets;
  var (Condition) const editinline array<NPC_Taxonomy> GroupedTargets;


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QC_StealthText.Text;                 //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 B6 1B 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 B6 1B 11 04 0B 47 
  }



