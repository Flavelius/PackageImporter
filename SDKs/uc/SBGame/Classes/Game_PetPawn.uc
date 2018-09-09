//==============================================================================
//  Game_PetPawn
//==============================================================================

class Game_PetPawn extends Game_NPCPawn
    native
    dependsOn(StringReferences,EventNotification,FSkill_Enums,LevelInfo)
    Config(User)
  ;

  const ErrorTimeOut =  3.0;
  var byte MoveState;
  var byte AttackState;
  var EventNotification MoveStateChanged;
  var EventNotification AttackStateChanged;
  var Game_Pawn PetOwner;
  var private bool ReceivedUpdate;
  var float LastErrorTime;


  function int GetAttackStateName() {
    switch (AttackState) {                                                      //0000 : 05 01 01 A0 A8 1E 11 
      case 0 :                                                                  //0007 : 0A 20 00 24 00 
        return Class'StringReferences'.default.Pet_Attack_Aggressive.Id;        //000C : 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 01 1C 11 
      case 1 :                                                                  //0020 : 0A 39 00 24 01 
        return Class'StringReferences'.default.Pet_Attack_Defensive.Id;         //0025 : 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 01 1C 11 
      case 2 :                                                                  //0039 : 0A 52 00 24 02 
        return Class'StringReferences'.default.Pet_Attack_Assist.Id;            //003E : 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 02 1C 11 
      case 3 :                                                                  //0052 : 0A 6B 00 24 03 
        return Class'StringReferences'.default.Pet_Attack_Passive.Id;           //0057 : 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 02 1C 11 
      default:                                                                  //006B : 0A FF FF 
      }
    }
    //05 01 01 A0 A8 1E 11 0A 20 00 24 00 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 01 1C 11 
    //0A 39 00 24 01 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 01 1C 11 0A 52 00 24 02 04 36 
    //D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 02 1C 11 0A 6B 00 24 03 04 36 D0 C6 6B 0F 12 20 20 
    //F7 60 01 05 00 0C 02 B8 02 1C 11 0A FF FF 04 0B 47 
  }


  function int GetMoveStateName() {
    switch (MoveState) {                                                        //0000 : 05 01 01 C0 AA 1E 11 
      case 1 :                                                                  //0007 : 0A 20 00 24 01 
        return Class'StringReferences'.default.Pet_Move_Follow.Id;              //000C : 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 03 1C 11 
      case 0 :                                                                  //0020 : 0A 39 00 24 00 
        return Class'StringReferences'.default.Pet_Move_Stay.Id;                //0025 : 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A8 03 1C 11 
      default:                                                                  //0039 : 0A FF FF 
      }
    }
    //05 01 01 C0 AA 1E 11 0A 20 00 24 01 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 03 1C 11 
    //0A 39 00 24 00 04 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 A8 03 1C 11 0A FF FF 04 0B 47 
  }


  function byte GetAttackState() {
    return AttackState;                                                         //0000 : 04 01 A0 A8 1E 11 
    //04 01 A0 A8 1E 11 04 0B 47 
  }


  function byte GetMoveState() {
    return MoveState;                                                           //0000 : 04 01 C0 AA 1E 11 
    //04 01 C0 AA 1E 11 04 0B 47 
  }


  event cl_OnBaseline() {
    Super.cl_OnBaseline();                                                      //0000 : 1C 00 5F 25 11 16 
    PetOwner.cl_SetPet(self);                                                   //0006 : 19 01 10 51 32 0F 07 00 00 1B 85 0C 00 00 17 16 
    MoveStateChanged.Trigger();                                                 //0016 : 19 01 20 AF 1E 11 06 00 00 1C 00 96 84 0F 16 
    AttackStateChanged.Trigger();                                               //0025 : 19 01 98 AF 1E 11 06 00 00 1C 00 96 84 0F 16 
    //1C 00 5F 25 11 16 19 01 10 51 32 0F 07 00 00 1B 85 0C 00 00 17 16 19 01 20 AF 1E 11 06 00 00 1C 
    //00 96 84 0F 16 19 01 98 AF 1E 11 06 00 00 1C 00 96 84 0F 16 04 0B 47 
  }


  protected native function sv2clrel_SetPetOwner_CallStub();


  event sv2clrel_SetPetOwner(Game_Pawn aOwner) {
    aOwner.cl_SetPet(self);                                                     //0000 : 19 00 70 B1 1E 11 07 00 00 1B 85 0C 00 00 17 16 
    //19 00 70 B1 1E 11 07 00 00 1B 85 0C 00 00 17 16 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C 70 5B 25 11 16 
    MoveStateChanged = new Class'EventNotification';                            //0006 : 0F 01 20 AF 1E 11 11 0B 0B 0B 20 70 52 5B 01 
    AttackStateChanged = new Class'EventNotification';                          //0015 : 0F 01 98 AF 1E 11 11 0B 0B 0B 20 70 52 5B 01 
    PetOwner.cl_SetPet(self);                                                   //0024 : 19 01 10 51 32 0F 07 00 00 1B 85 0C 00 00 17 16 
    //1C 70 5B 25 11 16 0F 01 20 AF 1E 11 11 0B 0B 0B 20 70 52 5B 01 0F 01 98 AF 1E 11 11 0B 0B 0B 20 
    //70 52 5B 01 19 01 10 51 32 0F 07 00 00 1B 85 0C 00 00 17 16 04 0B 47 
  }


  protected event sv_Callback() {
    PetOwner.sv2cl_AddRelayScrollingCombatMessage_CallStub(self,Class'StringReferences'.default.Pet_Command_Callback.Id,Class'FSkill_Enums'.17);//0000 : 19 01 10 51 32 0F 25 00 00 1B 62 0C 00 00 17 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 05 1C 11 12 20 00 31 5D 01 02 00 01 24 11 16 
    //19 01 10 51 32 0F 25 00 00 1B 62 0C 00 00 17 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 05 
    //1C 11 12 20 00 31 5D 01 02 00 01 24 11 16 04 0B 47 
  }


  protected event sv_Invalid() {
    local float CurrentTime;
    CurrentTime = Level.TimeSeconds;                                            //0000 : 0F 00 28 B5 1E 11 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    if (LastErrorTime < 0.00000000
      || CurrentTime > LastErrorTime + 3.00000000) {//0014 : 07 74 00 84 B0 01 70 B6 1E 11 1E 00 00 00 00 16 18 14 00 B1 00 28 B5 1E 11 AE 01 70 B6 1E 11 1E 00 00 40 40 16 16 16 
      PetOwner.sv2cl_AddRelayScrollingCombatMessage_CallStub(self,Class'StringReferences'.default.Pet_Command_Invalid.Id,Class'FSkill_Enums'.17);//003B : 19 01 10 51 32 0F 25 00 00 1B 62 0C 00 00 17 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 05 1C 11 12 20 00 31 5D 01 02 00 01 24 11 16 
      LastErrorTime = CurrentTime;                                              //0069 : 0F 01 70 B6 1E 11 00 28 B5 1E 11 
    }
    //0F 00 28 B5 1E 11 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 07 74 00 84 B0 01 70 B6 1E 11 1E 00 
    //00 00 00 16 18 14 00 B1 00 28 B5 1E 11 AE 01 70 B6 1E 11 1E 00 00 40 40 16 16 16 19 01 10 51 32 
    //0F 25 00 00 1B 62 0C 00 00 17 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 05 1C 11 12 20 00 
    //31 5D 01 02 00 01 24 11 16 0F 01 70 B6 1E 11 00 28 B5 1E 11 04 0B 47 
  }


  protected event sv_Defend(Game_Pawn aTarget) {
    PetOwner.sv2cl_AddRelayScrollingCombatMessage_CallStub(self,Class'StringReferences'.default.Pet_Command_Guard.Id,Class'FSkill_Enums'.17);//0000 : 19 01 10 51 32 0F 25 00 00 1B 62 0C 00 00 17 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 04 1C 11 12 20 00 31 5D 01 02 00 01 24 11 16 
    //19 01 10 51 32 0F 25 00 00 1B 62 0C 00 00 17 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 04 
    //1C 11 12 20 00 31 5D 01 02 00 01 24 11 16 04 0B 47 
  }


  protected event sv_Attack(Game_Pawn aTarget) {
    PetOwner.sv2cl_AddRelayScrollingCombatMessage_CallStub(self,Class'StringReferences'.default.Pet_Command_Attack.Id,Class'FSkill_Enums'.17);//0000 : 19 01 10 51 32 0F 25 00 00 1B 62 0C 00 00 17 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 04 1C 11 12 20 00 31 5D 01 02 00 01 24 11 16 
    //19 01 10 51 32 0F 25 00 00 1B 62 0C 00 00 17 36 D0 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 04 
    //1C 11 12 20 00 31 5D 01 02 00 01 24 11 16 04 0B 47 
  }


  protected native function sv2clrel_SetPetAttackState_CallStub();


  private event sv2clrel_SetPetAttackState(const byte aAttackState) {
    if (AttackState != aAttackState) {                                          //0000 : 07 2D 00 9B 39 3A 01 A0 A8 1E 11 39 3A 00 78 BB 1E 11 16 
      AttackState = aAttackState;                                               //0013 : 0F 01 A0 A8 1E 11 00 78 BB 1E 11 
      AttackStateChanged.Trigger();                                             //001E : 19 01 98 AF 1E 11 06 00 00 1C 00 96 84 0F 16 
    }
    //07 2D 00 9B 39 3A 01 A0 A8 1E 11 39 3A 00 78 BB 1E 11 16 0F 01 A0 A8 1E 11 00 78 BB 1E 11 19 01 
    //98 AF 1E 11 06 00 00 1C 00 96 84 0F 16 04 0B 47 
  }


  protected event sv_SetPetAttackState(const byte aAttackState) {
    AttackState = aAttackState;                                                 //0000 : 0F 01 A0 A8 1E 11 00 10 BD 1E 11 
    sv2clrel_SetPetAttackState_CallStub(AttackState);                           //000B : 1B C5 0D 00 00 01 A0 A8 1E 11 16 
    PetOwner.sv2cl_AddRelayScrollingCombatMessage_CallStub(self,GetAttackStateName(),17);//0016 : 19 01 10 51 32 0F 0F 00 00 1B 62 0C 00 00 17 1B C2 0D 00 00 16 24 11 16 
    //0F 01 A0 A8 1E 11 00 10 BD 1E 11 1B C5 0D 00 00 01 A0 A8 1E 11 16 19 01 10 51 32 0F 0F 00 00 1B 
    //62 0C 00 00 17 1B C2 0D 00 00 16 24 11 16 04 0B 47 
  }


  protected native function sv2clrel_SetPetMoveState_CallStub();


  private event sv2clrel_SetPetMoveState(const byte aMoveState) {
    if (MoveState != aMoveState) {                                              //0000 : 07 2D 00 9B 39 3A 01 C0 AA 1E 11 39 3A 00 58 BF 1E 11 16 
      MoveState = aMoveState;                                                   //0013 : 0F 01 C0 AA 1E 11 00 58 BF 1E 11 
      MoveStateChanged.Trigger();                                               //001E : 19 01 20 AF 1E 11 06 00 00 1C 00 96 84 0F 16 
    }
    //07 2D 00 9B 39 3A 01 C0 AA 1E 11 39 3A 00 58 BF 1E 11 16 0F 01 C0 AA 1E 11 00 58 BF 1E 11 19 01 
    //20 AF 1E 11 06 00 00 1C 00 96 84 0F 16 04 0B 47 
  }


  event sv_SetPetMoveState(const byte aMoveState) {
    MoveState = aMoveState;                                                     //0000 : 0F 01 C0 AA 1E 11 00 88 C0 1E 11 
    sv2clrel_SetPetMoveState_CallStub(MoveState);                               //000B : 1B C6 0D 00 00 01 C0 AA 1E 11 16 
    PetOwner.sv2cl_AddRelayScrollingCombatMessage_CallStub(self,GetMoveStateName(),17);//0016 : 19 01 10 51 32 0F 0F 00 00 1B 62 0C 00 00 17 1B C3 0D 00 00 16 24 11 16 
    //0F 01 C0 AA 1E 11 00 88 C0 1E 11 1B C6 0D 00 00 01 C0 AA 1E 11 16 19 01 10 51 32 0F 0F 00 00 1B 
    //62 0C 00 00 17 1B C3 0D 00 00 16 24 11 16 04 0B 47 
  }


  state Dead {

      function BeginState() {
        Super.BeginState();                                                     //0000 : 1C 40 15 25 11 16 
        if (SBRole == 1) {                                                      //0006 : 07 26 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
          PetOwner.sv_DestroyPet(False);                                        //0016 : 19 01 10 51 32 0F 07 00 00 1C 78 3D 34 0F 28 16 
        }
        //1C 40 15 25 11 16 07 26 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 19 01 10 51 32 0F 07 00 00 1C 
        //78 3D 34 0F 28 16 04 0B 47 
      }


    //08 47 

  }



