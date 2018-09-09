//==============================================================================
//  NPC_Group
//==============================================================================

class NPC_Group extends Content_Type
    native
    exportstructs
    dependsOn()
  ;

  struct GroupUnit {
      var (GroupUnit) int Minimum;
      var (GroupUnit) int Maximum;
      var (GroupUnit) array<byte> RequestedClassTypes;
      var (GroupUnit) array<byte> ForbiddenClassTypes;

  };


  var (Classes) array<GroupUnit> Units;
  var const class<NPC_AI> GroupControllerType;



