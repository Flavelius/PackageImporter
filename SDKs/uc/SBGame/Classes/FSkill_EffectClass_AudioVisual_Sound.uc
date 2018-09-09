//==============================================================================
//  FSkill_EffectClass_AudioVisual_Sound
//==============================================================================

class FSkill_EffectClass_AudioVisual_Sound extends FSkill_EffectClass_AudioVisual
    native
    dependsOn(Game_Pawn,Class,SBAudioManager)
  ;

  var (Sound) const string SoundName;
  var (Sound) const float Volume;
  var (Sound) const float Radius;
  var (Sound) const float Pitch;
  var (PlayerSound) const float PlayerSoundRadius;
  var (PlayerSound) const float PlayerSoundVolume;
  var (PlayerSound) const float PlayerSoundPitch;
  var (PlayerSound) const byte PlayerSound;
  var private transient bool ReportedMissingSound;
  var private transient Sound Sound;


  private final event bool LoadSound() {
    if (Len(SoundName) > 0 && (Sound == None || IsEditor())) {                  //0000 : 07 B8 00 82 97 7D 01 B0 C2 2B 11 16 25 16 18 14 00 84 72 01 E8 CF 2B 11 2A 16 18 07 00 1B 63 0C 00 00 16 16 16 
      if (ReportedMissingSound && !IsEditor()) {                                //0025 : 07 3D 00 82 2D 01 60 D0 2B 11 18 09 00 81 1B 63 0C 00 00 16 16 16 
        return False;                                                           //003B : 04 28 
      }
      if (InStr(SoundName,".") != -1) {                                         //003D : 07 6D 00 9B 7E 01 B0 C2 2B 11 1F 2E 00 16 1D FF FF FF FF 16 
        Sound = Sound(static.DynamicLoadObject(SoundName,Class'Sound',True));   //0051 : 0F 01 E8 CF 2B 11 2E 60 9D C2 00 1C 60 E7 69 0F 01 B0 C2 2B 11 20 60 9D C2 00 27 16 
      }
      if (Sound == None) {                                                      //006D : 07 B8 00 72 01 E8 CF 2B 11 2A 16 
        Sound = Sound(static.DynamicLoadObject("sfx_skills." $ SoundName,Class'Sound',True));//0078 : 0F 01 E8 CF 2B 11 2E 60 9D C2 00 1C 60 E7 69 0F 70 1F 73 66 78 5F 73 6B 69 6C 6C 73 2E 00 01 B0 C2 2B 11 16 20 60 9D C2 00 27 16 
        if (Sound == None) {                                                    //00A3 : 07 B8 00 72 01 E8 CF 2B 11 2A 16 
          ReportedMissingSound = True;                                          //00AE : 14 2D 01 60 D0 2B 11 27 
          return False;                                                         //00B6 : 04 28 
        }
      }
    }
    return True;                                                                //00B8 : 04 27 
    //07 B8 00 82 97 7D 01 B0 C2 2B 11 16 25 16 18 14 00 84 72 01 E8 CF 2B 11 2A 16 18 07 00 1B 63 0C 
    //00 00 16 16 16 07 3D 00 82 2D 01 60 D0 2B 11 18 09 00 81 1B 63 0C 00 00 16 16 16 04 28 07 6D 00 
    //9B 7E 01 B0 C2 2B 11 1F 2E 00 16 1D FF FF FF FF 16 0F 01 E8 CF 2B 11 2E 60 9D C2 00 1C 60 E7 69 
    //0F 01 B0 C2 2B 11 20 60 9D C2 00 27 16 07 B8 00 72 01 E8 CF 2B 11 2A 16 0F 01 E8 CF 2B 11 2E 60 
    //9D C2 00 1C 60 E7 69 0F 70 1F 73 66 78 5F 73 6B 69 6C 6C 73 2E 00 01 B0 C2 2B 11 16 20 60 9D C2 
    //00 27 16 07 B8 00 72 01 E8 CF 2B 11 2A 16 14 2D 01 60 D0 2B 11 27 04 28 04 27 04 0B 47 
  }


  final event int PlaySound(Game_Pawn aPawn) {
    if (PlayerSound != 80) {                                                    //0000 : 07 33 00 9B 39 3A 01 28 D2 2B 11 39 3A 24 50 16 
      aPawn.StaticPlaySoundEx(PlayerSound,PlayerSoundRadius,PlayerSoundVolume,PlayerSoundPitch);//0010 : 19 00 D8 D0 2B 11 1A 00 04 1B 2A 06 00 00 01 28 D2 2B 11 01 A0 D2 2B 11 01 18 D3 2B 11 01 90 D3 2B 11 16 
    }
    if (LoadSound()) {                                                          //0033 : 07 77 00 1C A8 BF 2B 11 16 
      if (Sound != None) {                                                      //003C : 07 77 00 77 01 E8 CF 2B 11 2A 16 
        return aPawn.PlaySBSound(Sound,Volume,Pitch,Radius,,Class'SBAudioManager'.4);//0047 : 04 19 00 D8 D0 2B 11 26 00 04 1B 2C 10 00 00 01 E8 CF 2B 11 01 08 D4 2B 11 01 80 D4 2B 11 01 F8 D4 2B 11 0B 12 20 80 AF D6 00 02 00 01 24 04 16 
      }
    }
    return -1;                                                                  //0077 : 04 1D FF FF FF FF 
    //07 33 00 9B 39 3A 01 28 D2 2B 11 39 3A 24 50 16 19 00 D8 D0 2B 11 1A 00 04 1B 2A 06 00 00 01 28 
    //D2 2B 11 01 A0 D2 2B 11 01 18 D3 2B 11 01 90 D3 2B 11 16 07 77 00 1C A8 BF 2B 11 16 07 77 00 77 
    //01 E8 CF 2B 11 2A 16 04 19 00 D8 D0 2B 11 26 00 04 1B 2C 10 00 00 01 E8 CF 2B 11 01 08 D4 2B 11 
    //01 80 D4 2B 11 01 F8 D4 2B 11 0B 12 20 80 AF D6 00 02 00 01 24 04 16 04 1D FF FF FF FF 04 0B 47 
    //
  }



