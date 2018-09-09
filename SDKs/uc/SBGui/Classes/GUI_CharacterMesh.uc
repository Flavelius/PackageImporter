//==============================================================================
//  GUI_CharacterMesh
//==============================================================================

class GUI_CharacterMesh extends GUI_RotatableMesh
    dependsOn(Game_Pawn,Class,SBAnimationFlags,SBAnimatedPawn)
    Transient
    Config(User)
  ;


  function PlayCasualAnimation() {
    local array<int> animFlags;
    local Game_Pawn animatingPawn;
    animatingPawn = Game_Pawn(mMeshActor);                                      //0000 : 0F 00 F0 F0 32 26 2E 18 38 5B 01 01 08 0C A3 19 
    if (animatingPawn != None && !animatingPawn.IsAnimating(0)) {               //0010 : 07 C7 00 82 77 00 F0 F0 32 26 2A 16 18 10 00 81 19 00 F0 F0 32 26 04 00 04 61 1A 25 16 16 16 
      animFlags.Length = 2;                                                     //002F : 0F 37 00 20 68 05 1B 2C 02 
      animFlags[0] = Class'SBAnimationFlags'.7;                                 //0038 : 0F 10 25 00 20 68 05 1B 39 3A 12 20 10 BA D6 00 02 00 01 24 07 
      animFlags[1] = Class'SBAnimationFlags'.33;                                //004D : 0F 10 26 00 20 68 05 1B 39 3A 12 20 10 BA D6 00 02 00 01 24 21 
      animatingPawn.QueueAnimation(animFlags,0,1.00000000,0.00000000,0.00000000,True,Class'SBAnimatedPawn'.1);//0062 : 19 00 F0 F0 32 26 29 00 00 1B 0A 0F 00 00 00 20 68 05 1B 25 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 00 00 27 39 3A 12 20 D0 B4 D6 00 02 00 01 24 01 16 
      animatingPawn.PlayQueuedAnimations(True,False);                           //0094 : 19 00 F0 F0 32 26 08 00 00 1B 09 0F 00 00 27 28 16 
      if (!animatingPawn.bIsPreviewPawn) {                                      //00A5 : 07 C7 00 81 19 00 F0 F0 32 26 06 00 04 2D 01 30 D4 76 0F 16 
        animatingPawn.SetPhysics(1);                                            //00B9 : 19 00 F0 F0 32 26 05 00 00 6F 82 24 01 16 
      }
    }
    //0F 00 F0 F0 32 26 2E 18 38 5B 01 01 08 0C A3 19 07 C7 00 82 77 00 F0 F0 32 26 2A 16 18 10 00 81 
    //19 00 F0 F0 32 26 04 00 04 61 1A 25 16 16 16 0F 37 00 20 68 05 1B 2C 02 0F 10 25 00 20 68 05 1B 
    //39 3A 12 20 10 BA D6 00 02 00 01 24 07 0F 10 26 00 20 68 05 1B 39 3A 12 20 10 BA D6 00 02 00 01 
    //24 21 19 00 F0 F0 32 26 29 00 00 1B 0A 0F 00 00 00 20 68 05 1B 25 1E 00 00 80 3F 1E 00 00 00 00 
    //1E 00 00 00 00 27 39 3A 12 20 D0 B4 D6 00 02 00 01 24 01 16 19 00 F0 F0 32 26 08 00 00 1B 09 0F 
    //00 00 27 28 16 07 C7 00 81 19 00 F0 F0 32 26 06 00 04 2D 01 30 D4 76 0F 16 19 00 F0 F0 32 26 05 
    //00 00 6F 82 24 01 16 04 0B 47 
  }



