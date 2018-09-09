//==============================================================================
//  Game_PetController
//==============================================================================

class Game_PetController extends Game_AIController
    native
    dependsOn()
    Config(System)
  ;

  var Game_Pawn PetOwner;
  var Game_Pawn PetMaster;
  var Game_Pawn PetTarget;
  var float OwnerDistance;


  native function sv_PetCallBack();


  native function sv_PetAttack(Game_Pawn Target);


  native function byte sv_GetPetAttackState();


  native function byte sv_GetPetMoveState();


  native function sv_SetPetAttackState(byte aAttackState);


  native function sv_SetPetMoveState(byte aMoveState);


  function sv_SetPetOwner(Game_Pawn aOwner) {
    PetOwner = aOwner;                                                          //0000 : 0F 01 10 67 32 0F 00 88 67 32 0F 
    //0F 01 10 67 32 0F 00 88 67 32 0F 04 0B 47 
  }



