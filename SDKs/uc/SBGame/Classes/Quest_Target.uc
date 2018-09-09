//==============================================================================
//  Quest_Target
//==============================================================================

class Quest_Target extends Content_Type
    native
    abstract
    exportstructs
    collapsecategories
    editinlinenew
    dependsOn(Game_ActiveTextItem,Quest_Type,Game_Pawn,Content_Event)
  ;

  struct QuestInventory {
      var export editinline Item_Type Item;
      var int Amount;

  };


  var (Target) editinline array<Quest_Target> Pretargets;
  var (Target) bool AlwaysVisible;
  var (Target) editinline array<Content_Event> CompleteEvents;
  var (Target) LocalizedString Description;


  final native function int GetCompletedProgressValue();


  event RadialMenuCollect(Game_Pawn aPlayerPawn,Object aObject,byte aMainOption,out array<byte> aSubOptions) {
    //04 0B 47 
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    //04 0B 47 
  }


  event string GetActiveText(Game_ActiveTextItem aItem) {
    local export editinline Quest_Type quest;
    if (aItem == None) {                                                        //0000 : 07 16 00 72 00 98 D1 2F 11 2A 16 
      return GetDescription(0);                                                 //000B : 04 1C 18 D3 2F 11 25 16 
    } else {                                                                    //0013 : 06 8F 00 
      if (aItem.Tag == "D") {                                                   //0016 : 07 44 00 7A 19 00 98 D1 2F 11 05 00 00 01 08 9B 18 11 1F 44 00 16 
        return GetDescription(aItem.Ordinality);                                //002C : 04 1C 18 D3 2F 11 19 00 98 D1 2F 11 05 00 04 01 08 9F 24 11 16 
      } else {                                                                  //0041 : 06 8F 00 
        if (aItem.Tag == "Q") {                                                 //0044 : 07 8F 00 7A 19 00 98 D1 2F 11 05 00 00 01 08 9B 18 11 1F 51 00 16 
          quest = GetQuest();                                                   //005A : 0F 00 C8 D3 2F 11 1C C0 1C 20 11 16 
          if (quest != None) {                                                  //0066 : 07 8F 00 77 00 C8 D3 2F 11 2A 16 
            return quest.GetActiveText(aItem.SubItem);                          //0071 : 04 19 00 C8 D3 2F 11 14 00 00 1B 60 05 00 00 19 00 98 D1 2F 11 05 00 04 01 20 9D 18 11 16 
          }
        }
      }
    }
    return Super.GetActiveText(aItem);                                          //008F : 04 1C 60 3C 1F 11 00 98 D1 2F 11 16 
    //07 16 00 72 00 98 D1 2F 11 2A 16 04 1C 18 D3 2F 11 25 16 06 8F 00 07 44 00 7A 19 00 98 D1 2F 11 
    //05 00 00 01 08 9B 18 11 1F 44 00 16 04 1C 18 D3 2F 11 19 00 98 D1 2F 11 05 00 04 01 08 9F 24 11 
    //16 06 8F 00 07 8F 00 7A 19 00 98 D1 2F 11 05 00 00 01 08 9B 18 11 1F 51 00 16 0F 00 C8 D3 2F 11 
    //1C C0 1C 20 11 16 07 8F 00 77 00 C8 D3 2F 11 2A 16 04 19 00 C8 D3 2F 11 14 00 00 1B 60 05 00 00 
    //19 00 98 D1 2F 11 05 00 04 01 20 9D 18 11 16 04 1C 60 3C 1F 11 00 98 D1 2F 11 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return "objective default descriptions must be overriden";                  //0000 : 04 1F 6F 62 6A 65 63 74 69 76 65 20 64 65 66 61 75 6C 74 20 64 65 73 63 72 69 70 74 69 6F 6E 73 20 6D 75 73 74 20 62 65 20 6F 76 65 72 72 69 64 65 6E 00 
    //04 1F 6F 62 6A 65 63 74 69 76 65 20 64 65 66 61 75 6C 74 20 64 65 73 63 72 69 70 74 69 6F 6E 73 
    //20 6D 75 73 74 20 62 65 20 6F 76 65 72 72 69 64 65 6E 00 04 0B 47 
  }


  final function string GetDescription(int aProgress) {
    local string ret;
    if (Len(Description.Text) > 0) {                                            //0000 : 07 25 00 97 7D 36 58 C6 6B 0F 01 D0 D6 2F 11 16 25 16 
      ret = Description.Text;                                                   //0012 : 0F 00 48 D7 2F 11 36 58 C6 6B 0F 01 D0 D6 2F 11 
    } else {                                                                    //0022 : 06 31 00 
      ret = GetDefaultDescription();                                            //0025 : 0F 00 48 D7 2F 11 1B B2 0F 00 00 16 
    }
    AppendProgressText(ret,aProgress);                                          //0031 : 1B B4 0F 00 00 00 48 D7 2F 11 00 58 D6 2F 11 16 
    return ret;                                                                 //0041 : 04 00 48 D7 2F 11 
    //07 25 00 97 7D 36 58 C6 6B 0F 01 D0 D6 2F 11 16 25 16 0F 00 48 D7 2F 11 36 58 C6 6B 0F 01 D0 D6 
    //2F 11 06 31 00 0F 00 48 D7 2F 11 1B B2 0F 00 00 16 1B B4 0F 00 00 00 48 D7 2F 11 00 58 D6 2F 11 
    //16 04 00 48 D7 2F 11 04 0B 47 
  }


  event bool sv_OnComplete(Game_Pawn aPawn,optional Game_Pawn aTargetPawn) {
    local int ei;
    if (aTargetPawn == None
      || !aTargetPawn.IsA('Game_NPCPawn')) {        //0000 : 07 2E 00 84 72 00 38 F1 2F 11 2A 16 18 14 00 81 19 00 38 F1 2F 11 08 00 04 61 2F 21 47 08 00 00 16 16 16 
      aTargetPawn = aPawn;                                                      //0023 : 0F 00 38 F1 2F 11 00 38 D8 2F 11 
    }
    ei = 0;                                                                     //002E : 0F 00 B0 F1 2F 11 25 
    while (ei < CompleteEvents.Length) {                                        //0035 : 07 88 00 96 00 B0 F1 2F 11 37 01 28 F2 2F 11 16 
      if (CompleteEvents[ei] != None
        && !CompleteEvents[ei].sv_CanExecute(aTargetPawn,aPawn)) {//0045 : 07 7E 00 82 77 10 00 B0 F1 2F 11 01 28 F2 2F 11 2A 16 18 22 00 81 19 10 00 B0 F1 2F 11 01 28 F2 2F 11 10 00 04 1B 22 0C 00 00 00 38 F1 2F 11 00 38 D8 2F 11 16 16 16 
        return False;                                                           //007C : 04 28 
      }
      ei++;                                                                     //007E : A5 00 B0 F1 2F 11 16 
    }
    ei = 0;                                                                     //0088 : 0F 00 B0 F1 2F 11 25 
    while (ei < CompleteEvents.Length) {                                        //008F : 07 C8 00 96 00 B0 F1 2F 11 37 01 28 F2 2F 11 16 
      CompleteEvents[ei].sv_Execute(aTargetPawn,aPawn);                         //009F : 19 10 00 B0 F1 2F 11 01 28 F2 2F 11 10 00 00 1B 23 0C 00 00 00 38 F1 2F 11 00 38 D8 2F 11 16 
      ei++;                                                                     //00BE : A5 00 B0 F1 2F 11 16 
    }
    return True;                                                                //00C8 : 04 27 
    //07 2E 00 84 72 00 38 F1 2F 11 2A 16 18 14 00 81 19 00 38 F1 2F 11 08 00 04 61 2F 21 47 08 00 00 
    //16 16 16 0F 00 38 F1 2F 11 00 38 D8 2F 11 0F 00 B0 F1 2F 11 25 07 88 00 96 00 B0 F1 2F 11 37 01 
    //28 F2 2F 11 16 07 7E 00 82 77 10 00 B0 F1 2F 11 01 28 F2 2F 11 2A 16 18 22 00 81 19 10 00 B0 F1 
    //2F 11 01 28 F2 2F 11 10 00 04 1B 22 0C 00 00 00 38 F1 2F 11 00 38 D8 2F 11 16 16 16 04 28 A5 00 
    //B0 F1 2F 11 16 06 35 00 0F 00 B0 F1 2F 11 25 07 C8 00 96 00 B0 F1 2F 11 37 01 28 F2 2F 11 16 19 
    //10 00 B0 F1 2F 11 01 28 F2 2F 11 10 00 00 1B 23 0C 00 00 00 38 F1 2F 11 00 38 D8 2F 11 16 A5 00 
    //B0 F1 2F 11 16 06 8F 00 04 27 04 0B 47 
  }


  final native function Quest_Type GetQuest();


  final native function int GetIndex();


  final native function bool Active(int aValue);


  final native function bool NearlyDone(int aValue);


  final native function bool Failed(int aValue);


  final native function bool Check(int aValue);


  final native function int ComputeValue(Game_Pawn aPawn);


  final native function bool sv_CanAccept(Game_Pawn aPawn);



