//==============================================================================
//  MapNote
//==============================================================================

class MapNote extends Object
    native
    dependsOn()
  ;

  const MAX_TARGETS_SIZE =  8;
  enum MapNoteTargetEnum {
    MNTE_NPC ,
    MNTE_HostileNPC ,
    MNTE_Structure ,
    MNTE_Resource ,
    MNTE_Custom1 ,
    MNTE_Custom2 ,
    MNTE_Custom3 ,
    MNTE_Custom4 
  };

  var Material mTargetMaterials[8];
  var LocalizedString Title;
  var LocalizedString Level;
  var LocalizedString Information;
  var byte Target;
  var float X;
  var float Y;
  var int Id;
  var LocalizedString TargetTexts[8];



