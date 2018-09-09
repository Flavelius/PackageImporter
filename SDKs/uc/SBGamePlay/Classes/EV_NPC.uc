//==============================================================================
//  EV_NPC
//==============================================================================

class EV_NPC extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) const export editinline NPC_Type NPC;
  var (Action) const export editinline Content_Event NPCAction;
  var (Action) const editinline float Radius;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_Pawn npcPawn;
    if (aObject != None) {                                                      //0000 : 07 26 00 77 00 A0 42 FF 13 2A 16 
      npcPawn = FindNPC(aObject,NPC,Radius);                                    //000B : 0F 00 D0 43 FF 13 1B DA 0F 00 00 00 A0 42 FF 13 01 48 44 FF 13 01 C0 44 FF 13 16 
    }
    if (npcPawn == None) {                                                      //0026 : 07 4C 00 72 00 D0 43 FF 13 2A 16 
      npcPawn = FindNPC(aSubject,NPC,Radius);                                   //0031 : 0F 00 D0 43 FF 13 1B DA 0F 00 00 00 38 45 FF 13 01 48 44 FF 13 01 C0 44 FF 13 16 
    }
    NPCAction.sv_Execute(npcPawn,aSubject);                                     //004C : 19 01 B0 45 FF 13 10 00 00 1B 23 0C 00 00 00 D0 43 FF 13 00 38 45 FF 13 16 
    //07 26 00 77 00 A0 42 FF 13 2A 16 0F 00 D0 43 FF 13 1B DA 0F 00 00 00 A0 42 FF 13 01 48 44 FF 13 
    //01 C0 44 FF 13 16 07 4C 00 72 00 D0 43 FF 13 2A 16 0F 00 D0 43 FF 13 1B DA 0F 00 00 00 38 45 FF 
    //13 01 48 44 FF 13 01 C0 44 FF 13 16 19 01 B0 45 FF 13 10 00 00 1B 23 0C 00 00 00 D0 43 FF 13 00 
    //38 45 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_Pawn npcPawn;
    if (NPCAction != None) {                                                    //0000 : 07 7C 00 77 01 B0 45 FF 13 2A 16 
      if (aObject != None) {                                                    //000B : 07 31 00 77 00 28 46 FF 13 2A 16 
        npcPawn = FindNPC(aObject,NPC,Radius);                                  //0016 : 0F 00 A0 46 FF 13 1B DA 0F 00 00 00 28 46 FF 13 01 48 44 FF 13 01 C0 44 FF 13 16 
      }
      if (npcPawn == None) {                                                    //0031 : 07 57 00 72 00 A0 46 FF 13 2A 16 
        npcPawn = FindNPC(aSubject,NPC,Radius);                                 //003C : 0F 00 A0 46 FF 13 1B DA 0F 00 00 00 18 47 FF 13 01 48 44 FF 13 01 C0 44 FF 13 16 
      }
      if (npcPawn != None) {                                                    //0057 : 07 7C 00 77 00 A0 46 FF 13 2A 16 
        return NPCAction.sv_CanExecute(npcPawn,aSubject);                       //0062 : 04 19 01 B0 45 FF 13 10 00 04 1B 22 0C 00 00 00 A0 46 FF 13 00 18 47 FF 13 16 
      }
    }
    return False;                                                               //007C : 04 28 
    //07 7C 00 77 01 B0 45 FF 13 2A 16 07 31 00 77 00 28 46 FF 13 2A 16 0F 00 A0 46 FF 13 1B DA 0F 00 
    //00 00 28 46 FF 13 01 48 44 FF 13 01 C0 44 FF 13 16 07 57 00 72 00 A0 46 FF 13 2A 16 0F 00 A0 46 
    //FF 13 1B DA 0F 00 00 00 18 47 FF 13 01 48 44 FF 13 01 C0 44 FF 13 16 07 7C 00 77 00 A0 46 FF 13 
    //2A 16 04 19 01 B0 45 FF 13 10 00 04 1B 22 0C 00 00 00 A0 46 FF 13 00 18 47 FF 13 16 04 28 04 0B 
    //47 
  }



