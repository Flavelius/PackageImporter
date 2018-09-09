//==============================================================================
//  Game_EditorPawn
//==============================================================================

class Game_EditorPawn extends Game_Pawn
    native
    dependsOn()
    Config(User)
  ;

  var byte OverwriteEquippedWeaponFlag;


  event byte GetEquippedWeaponFlag() {
    return OverwriteEquippedWeaponFlag;                                         //0000 : 04 01 40 FF 35 11 
    //04 01 40 FF 35 11 04 0B 47 
  }


  event cl_OnFrame(float DeltaTime) {
    local array<int> animFlags;
    Super.cl_OnFrame(DeltaTime);                                                //0000 : 1C 98 21 19 11 00 68 00 36 11 16 
    if (!IsAnimating(0)) {                                                      //000B : 07 6B 00 81 61 1A 25 16 16 
      animFlags.Length = 2;                                                     //0014 : 0F 37 00 A0 01 36 11 2C 02 
      animFlags[0] = Class'SBAnimationFlags'.9;                                 //001D : 0F 10 25 00 A0 01 36 11 39 3A 12 20 10 BA D6 00 02 00 01 24 09 
      animFlags[1] = Class'SBAnimationFlags'.33;                                //0032 : 0F 10 26 00 A0 01 36 11 39 3A 12 20 10 BA D6 00 02 00 01 24 21 
      QueueAnimation(animFlags,0,1.00000000,0.00000000,0.00000000,False);       //0047 : 1B 0A 0F 00 00 00 A0 01 36 11 25 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 00 00 28 16 
      PlayQueuedAnimations(True,False);                                         //0063 : 1B 09 0F 00 00 27 28 16 
    }
    //1C 98 21 19 11 00 68 00 36 11 16 07 6B 00 81 61 1A 25 16 16 0F 37 00 A0 01 36 11 2C 02 0F 10 25 
    //00 A0 01 36 11 39 3A 12 20 10 BA D6 00 02 00 01 24 09 0F 10 26 00 A0 01 36 11 39 3A 12 20 10 BA 
    //D6 00 02 00 01 24 21 1B 0A 0F 00 00 00 A0 01 36 11 25 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 00 
    //00 28 16 1B 09 0F 00 00 27 28 16 04 0B 47 
  }


  event cl_OnShutdown() {
    //04 0B 47 
  }


  event cl_OnInit() {
    Character.cl_OnInit();                                                      //0000 : 19 01 68 2E 34 0F 06 00 00 1B 3F 05 00 00 16 
    //19 01 68 2E 34 0F 06 00 00 1B 3F 05 00 00 16 04 0B 47 
  }



