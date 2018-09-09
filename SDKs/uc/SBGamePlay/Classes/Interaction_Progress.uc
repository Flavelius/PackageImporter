//==============================================================================
//  Interaction_Progress
//==============================================================================

class Interaction_Progress extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_PlayerController,Player,GUI_BaseDesktop,Actor,InteractiveLevelElement,Game_PlayerPawn,Game_Skills)
  ;

  var (Interaction_Progress) string AnimationName;
  var (Interaction_Progress) const float speed;
  var (Interaction_Progress) editinline StaticMesh Tool;
  var (Interaction_Progress) float ProgressSeconds;
  var transient float mTimer;
  var transient bool mAborted;
  var transient Game_PlayerPawn mInstigatorPawn;
  var transient Vector mLocation;
  var transient float mHealth;
  var transient bool mIsShifted;
  var transient int mActiveSkillsNum;
  var transient name mAttachmentName;


  function ClOnCancel(Game_Actor aOwner,Game_Pawn aInstigator) {
    Super.ClOnCancel(aOwner,aInstigator);                                       //0000 : 1C F8 A5 32 13 00 40 5D 30 0F 00 50 9A F8 13 16 
    if (aInstigator != None && aInstigator.IsLocalPlayer()) {                   //0010 : 07 AF 00 82 77 00 50 9A F8 13 2A 16 18 10 00 19 00 50 9A F8 13 06 00 04 1C 18 1A 76 0F 16 16 
      aInstigator.ClearAnimsByType(9,0.00000000);                               //002F : 19 00 50 9A F8 13 0D 00 00 1B B6 0C 00 00 24 09 1E 00 00 00 00 16 
      Game_PlayerController(aInstigator.Controller).Player.GUIDesktop.UpdateStdWindow(87,2,None,"",0);//0045 : 19 19 19 2E 90 18 5B 01 19 00 50 9A F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0E 00 00 1B 02 0C 00 00 2C 57 2C 02 2A 1F 00 25 16 
      Game_PlayerController(aInstigator.Controller).Player.GUIDesktop.ShowStdWindow(87,2);//007C : 19 19 19 2E 90 18 5B 01 19 00 50 9A F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 2C 57 2C 02 16 
    }
    //1C F8 A5 32 13 00 40 5D 30 0F 00 50 9A F8 13 16 07 AF 00 82 77 00 50 9A F8 13 2A 16 18 10 00 19 
    //00 50 9A F8 13 06 00 04 1C 18 1A 76 0F 16 16 19 00 50 9A F8 13 0D 00 00 1B B6 0C 00 00 24 09 1E 
    //00 00 00 00 16 19 19 19 2E 90 18 5B 01 19 00 50 9A F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 
    //25 71 0F 05 00 04 01 90 C0 79 0F 0E 00 00 1B 02 0C 00 00 2C 57 2C 02 2A 1F 00 25 16 19 19 19 2E 
    //90 18 5B 01 19 00 50 9A F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 
    //79 0F 0A 00 04 1B DF 0B 00 00 2C 57 2C 02 16 04 0B 47 
  }


  function ClOnEnd(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local Actor attachmentActor;
    if (!aReverse) {                                                            //0000 : 07 D5 00 81 2D 00 88 9D F8 13 16 
      if (aInstigator != None && aInstigator.IsLocalPlayer()) {                 //000B : 07 D5 00 82 77 00 00 9E F8 13 2A 16 18 10 00 19 00 00 9E F8 13 06 00 04 1C 18 1A 76 0F 16 16 
        aInstigator.ClearAnimsByType(9,0.00000000);                             //002A : 19 00 00 9E F8 13 0D 00 00 1B B6 0C 00 00 24 09 1E 00 00 00 00 16 
        if (Tool != None) {                                                     //0040 : 07 A2 00 77 01 78 9E F8 13 2A 16 
          attachmentActor = aInstigator.FindAttachment(mAttachmentName,name("Weapon1"));//004B : 0F 00 F0 9E F8 13 19 00 00 9E F8 13 16 00 04 1C 60 AF 6D 0F 01 68 9F F8 13 39 5A 1F 57 65 61 70 6F 6E 31 00 16 
          if (attachmentActor != None) {                                        //0070 : 07 A2 00 77 00 F0 9E F8 13 2A 16 
            aInstigator.DetachFromBone(attachmentActor);                        //007B : 19 00 00 9E F8 13 0B 00 04 1C C0 B0 6D 0F 00 F0 9E F8 13 16 
            attachmentActor.Destroy();                                          //008F : 19 00 F0 9E F8 13 03 00 04 61 17 16 
            attachmentActor = None;                                             //009B : 0F 00 F0 9E F8 13 2A 
          }
        }
        Game_PlayerController(aInstigator.Controller).Player.GUIDesktop.ShowStdWindow(87,2);//00A2 : 19 19 19 2E 90 18 5B 01 19 00 00 9E F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 2C 57 2C 02 16 
      }
    }
    Super.ClOnEnd(aOwner,aInstigator,aReverse);                                 //00D5 : 1C A8 A6 32 13 00 A0 9B F8 13 00 00 9E F8 13 2D 00 88 9D F8 13 16 
    //07 D5 00 81 2D 00 88 9D F8 13 16 07 D5 00 82 77 00 00 9E F8 13 2A 16 18 10 00 19 00 00 9E F8 13 
    //06 00 04 1C 18 1A 76 0F 16 16 19 00 00 9E F8 13 0D 00 00 1B B6 0C 00 00 24 09 1E 00 00 00 00 16 
    //07 A2 00 77 01 78 9E F8 13 2A 16 0F 00 F0 9E F8 13 19 00 00 9E F8 13 16 00 04 1C 60 AF 6D 0F 01 
    //68 9F F8 13 39 5A 1F 57 65 61 70 6F 6E 31 00 16 07 A2 00 77 00 F0 9E F8 13 2A 16 19 00 00 9E F8 
    //13 0B 00 04 1C C0 B0 6D 0F 00 F0 9E F8 13 16 19 00 F0 9E F8 13 03 00 04 61 17 16 0F 00 F0 9E F8 
    //13 2A 19 19 19 2E 90 18 5B 01 19 00 00 9E F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 
    //05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 2C 57 2C 02 16 1C A8 A6 32 13 00 A0 9B F8 13 00 
    //00 9E F8 13 2D 00 88 9D F8 13 16 04 0B 47 
  }


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local Actor attachmentActor;
    Super.ClOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 78 A8 32 13 00 90 A0 F8 13 00 08 A3 F8 13 2D 00 80 A3 F8 13 16 
    if (!aReverse) {                                                            //0016 : 07 54 01 81 2D 00 80 A3 F8 13 16 
      if (aInstigator != None && aInstigator.IsLocalPlayer()) {                 //0021 : 07 54 01 82 77 00 08 A3 F8 13 2A 16 18 10 00 19 00 08 A3 F8 13 06 00 04 1C 18 1A 76 0F 16 16 
        aInstigator.PlayTopLevelAnim(name(AnimationName),speed,0.20000000,True,False);//0040 : 19 00 08 A3 F8 13 19 00 00 1B B0 2D 00 00 39 5A 01 F8 A3 F8 13 01 70 A4 F8 13 1E CD CC 4C 3E 27 28 16 
        if (Tool != None) {                                                     //0062 : 07 E6 00 77 01 78 9E F8 13 2A 16 
          attachmentActor = aInstigator.Spawn(Class'SBAttachment',aInstigator,'None');//006D : 0F 00 E8 A4 F8 13 19 00 08 A3 F8 13 12 00 04 61 16 20 00 7D D7 00 00 08 A3 F8 13 21 00 00 00 00 16 
          attachmentActor.SetDrawType(8);                                       //008E : 19 00 E8 A4 F8 13 08 00 00 1C 48 93 6B 0F 24 08 16 
          attachmentActor.SetStaticMesh(Tool);                                  //009F : 19 00 E8 A4 F8 13 0B 00 00 1C A8 94 6B 0F 01 78 9E F8 13 16 
          aInstigator.AttachToBone(attachmentActor,name("Weapon1"));            //00B3 : 19 00 08 A3 F8 13 16 00 04 1C 10 B3 6D 0F 00 E8 A4 F8 13 39 5A 1F 57 65 61 70 6F 6E 31 00 16 
          mAttachmentName = attachmentActor.Name;                               //00D2 : 0F 01 68 9F F8 13 19 00 E8 A4 F8 13 05 00 04 01 F0 E4 6B 0F 
        }
        Game_PlayerController(aInstigator.Controller).Player.GUIDesktop.UpdateStdWindow(87,1,None,"",ProgressSeconds);//00E6 : 19 19 19 2E 90 18 5B 01 19 00 08 A3 F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 13 00 00 1B 02 0C 00 00 2C 57 26 2A 1F 00 39 44 01 48 54 36 0F 16 
        Game_PlayerController(aInstigator.Controller).Player.GUIDesktop.ShowStdWindow(87,1);//0122 : 19 19 19 2E 90 18 5B 01 19 00 08 A3 F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 57 26 16 
      }
    }
    //1C 78 A8 32 13 00 90 A0 F8 13 00 08 A3 F8 13 2D 00 80 A3 F8 13 16 07 54 01 81 2D 00 80 A3 F8 13 
    //16 07 54 01 82 77 00 08 A3 F8 13 2A 16 18 10 00 19 00 08 A3 F8 13 06 00 04 1C 18 1A 76 0F 16 16 
    //19 00 08 A3 F8 13 19 00 00 1B B0 2D 00 00 39 5A 01 F8 A3 F8 13 01 70 A4 F8 13 1E CD CC 4C 3E 27 
    //28 16 07 E6 00 77 01 78 9E F8 13 2A 16 0F 00 E8 A4 F8 13 19 00 08 A3 F8 13 12 00 04 61 16 20 00 
    //7D D7 00 00 08 A3 F8 13 21 00 00 00 00 16 19 00 E8 A4 F8 13 08 00 00 1C 48 93 6B 0F 24 08 16 19 
    //00 E8 A4 F8 13 0B 00 00 1C A8 94 6B 0F 01 78 9E F8 13 16 19 00 08 A3 F8 13 16 00 04 1C 10 B3 6D 
    //0F 00 E8 A4 F8 13 39 5A 1F 57 65 61 70 6F 6E 31 00 16 0F 01 68 9F F8 13 19 00 E8 A4 F8 13 05 00 
    //04 01 F0 E4 6B 0F 19 19 19 2E 90 18 5B 01 19 00 08 A3 F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 
    //28 25 71 0F 05 00 04 01 90 C0 79 0F 13 00 00 1B 02 0C 00 00 2C 57 26 2A 1F 00 39 44 01 48 54 36 
    //0F 16 19 19 19 2E 90 18 5B 01 19 00 08 A3 F8 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 
    //05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 57 26 16 04 0B 47 
  }


  function SvOnCancel(Game_Actor aOwner,Game_Pawn aInstigator) {
    local InteractiveLevelElement ile;
    Super.SvOnCancel(aOwner,aInstigator);                                       //0000 : 1C C0 AA 32 13 00 70 55 36 0F 00 68 56 36 0F 16 
    ile = InteractiveLevelElement(aOwner);                                      //0010 : 0F 00 E0 56 36 0F 2E F8 C7 5C 01 00 70 55 36 0F 
    if (ile != None) {                                                          //0020 : 07 3A 00 77 00 E0 56 36 0F 2A 16 
      ile.sv_CancelClientSubAction();                                           //002B : 19 00 E0 56 36 0F 06 00 00 1B 65 10 00 00 16 
    }
    //1C C0 AA 32 13 00 70 55 36 0F 00 68 56 36 0F 16 0F 00 E0 56 36 0F 2E F8 C7 5C 01 00 70 55 36 0F 
    //07 3A 00 77 00 E0 56 36 0F 2A 16 19 00 E0 56 36 0F 06 00 00 1B 65 10 00 00 16 04 0B 47 
  }


  function SvOnEnd(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    ile = InteractiveLevelElement(aOwner);                                      //0000 : 0F 00 38 A6 F8 13 2E F8 C7 5C 01 00 08 58 36 0F 
    if (ile != None) {                                                          //0010 : 07 62 00 77 00 38 A6 F8 13 2A 16 
      if (!aReverse) {                                                          //001B : 07 62 00 81 2D 00 B0 A6 F8 13 16 
        mTimer = 0.00000000;                                                    //0026 : 0F 01 28 A7 F8 13 1E 00 00 00 00 
        mInstigatorPawn = None;                                                 //0031 : 0F 01 A0 A7 F8 13 2A 
        if (mAborted) {                                                         //0038 : 07 53 00 2D 01 18 A8 F8 13 
          ile.sv_CancelOptionActions();                                         //0041 : 19 00 38 A6 F8 13 06 00 00 1B FD 06 00 00 16 
        } else {                                                                //0050 : 06 62 00 
          ile.sv_EndClientSubAction();                                          //0053 : 19 00 38 A6 F8 13 06 00 00 1B F6 0F 00 00 16 
        }
      }
    }
    Super.SvOnEnd(aOwner,aInstigator,aReverse);                                 //0062 : 1C 88 AD 32 13 00 08 58 36 0F 00 90 A8 F8 13 2D 00 B0 A6 F8 13 16 
    //0F 00 38 A6 F8 13 2E F8 C7 5C 01 00 08 58 36 0F 07 62 00 77 00 38 A6 F8 13 2A 16 07 62 00 81 2D 
    //00 B0 A6 F8 13 16 0F 01 28 A7 F8 13 1E 00 00 00 00 0F 01 A0 A7 F8 13 2A 07 53 00 2D 01 18 A8 F8 
    //13 19 00 38 A6 F8 13 06 00 00 1B FD 06 00 00 16 06 62 00 19 00 38 A6 F8 13 06 00 00 1B F6 0F 00 
    //00 16 1C 88 AD 32 13 00 08 58 36 0F 00 90 A8 F8 13 2D 00 B0 A6 F8 13 16 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 08 A9 F8 13 00 C8 AA F8 13 2D 00 80 AC F8 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 F8 AC F8 13 2E F8 C7 5C 01 00 08 A9 F8 13 
    if (ile != None) {                                                          //0026 : 07 CB 00 77 00 F8 AC F8 13 2A 16 
      if (!aReverse) {                                                          //0031 : 07 CB 00 81 2D 00 80 AC F8 13 16 
        mInstigatorPawn = Game_PlayerPawn(aInstigator);                         //003C : 0F 01 A0 A7 F8 13 2E F0 47 5B 01 00 C8 AA F8 13 
        mLocation = mInstigatorPawn.Location;                                   //004C : 0F 01 70 AD F8 13 19 01 A0 A7 F8 13 05 00 0C 01 30 81 6C 0F 
        mHealth = mInstigatorPawn.GetHealth();                                  //0060 : 0F 01 E8 AD F8 13 19 01 A0 A7 F8 13 06 00 04 1B 12 10 00 00 16 
        mIsShifted = mInstigatorPawn.IsShifted();                               //0075 : 14 2D 01 60 AE F8 13 19 01 A0 A7 F8 13 06 00 04 1B 2E 0C 00 00 16 
        mActiveSkillsNum = mInstigatorPawn.Skills.GetActiveSkillCount();        //008B : 0F 01 D8 AE F8 13 19 19 01 A0 A7 F8 13 05 00 04 01 08 28 18 11 06 00 04 1C 28 19 23 11 16 
        mTimer = ProgressSeconds;                                               //00A9 : 0F 01 28 A7 F8 13 01 48 54 36 0F 
        mAborted = False;                                                       //00B4 : 14 2D 01 18 A8 F8 13 28 
        ile.sv_StartClientSubAction();                                          //00BC : 19 00 F8 AC F8 13 06 00 00 1B C3 0F 00 00 16 
      }
    }
    //1C 60 AF 32 13 00 08 A9 F8 13 00 C8 AA F8 13 2D 00 80 AC F8 13 16 0F 00 F8 AC F8 13 2E F8 C7 5C 
    //01 00 08 A9 F8 13 07 CB 00 77 00 F8 AC F8 13 2A 16 07 CB 00 81 2D 00 80 AC F8 13 16 0F 01 A0 A7 
    //F8 13 2E F0 47 5B 01 00 C8 AA F8 13 0F 01 70 AD F8 13 19 01 A0 A7 F8 13 05 00 0C 01 30 81 6C 0F 
    //0F 01 E8 AD F8 13 19 01 A0 A7 F8 13 06 00 04 1B 12 10 00 00 16 14 2D 01 60 AE F8 13 19 01 A0 A7 
    //F8 13 06 00 04 1B 2E 0C 00 00 16 0F 01 D8 AE F8 13 19 19 01 A0 A7 F8 13 05 00 04 01 08 28 18 11 
    //06 00 04 1C 28 19 23 11 16 0F 01 28 A7 F8 13 01 48 54 36 0F 14 2D 01 18 A8 F8 13 28 19 00 F8 AC 
    //F8 13 06 00 00 1B C3 0F 00 00 16 04 0B 47 
  }



