//==============================================================================
//  Game_Emotes
//==============================================================================

class Game_Emotes extends Base_Component within Game_Pawn
    native
    exportstructs
    dependsOn(Game_Pawn,Game_Emote)
  ;

  struct EmoteMapping {
      var string Command;
      var int AnimIndex;
      var byte SoundIndex;

  };


  var array<Game_Emote> EmoteMappings;
  var float TimeBetweenSoundsFactor;
  var transient float SoundTimer;


  protected final function InitSoundTimer(float aBaseTime) {
    SoundTimer = aBaseTime * TimeBetweenSoundsFactor;                           //0000 : 0F 01 D0 AD 2A 11 AB 00 10 AD 2A 11 01 48 AE 2A 11 16 
    //0F 01 D0 AD 2A 11 AB 00 10 AD 2A 11 01 48 AE 2A 11 16 04 0B 47 
  }


  protected final function bool CanPlaySound() {
    return SoundTimer < 0.01000000;                                             //0000 : 04 B0 01 D0 AD 2A 11 1E 0A D7 23 3C 16 
    //04 B0 01 D0 AD 2A 11 1E 0A D7 23 3C 16 04 0B 47 
  }


  protected native function sv2cl_Emote_CallStub();


  protected final event sv2cl_Emote(byte aEmote) {
    PlayLocalEmote(aEmote);                                                     //0000 : 1C 18 14 25 11 00 88 B1 2A 11 16 
    //1C 18 14 25 11 00 88 B1 2A 11 16 04 0B 47 
  }


  protected native function sv2rel_Emote_CallStub();


  protected final event sv2rel_Emote(byte aEmote) {
    PlayLocalEmote(aEmote);                                                     //0000 : 1C 18 14 25 11 00 A0 B3 2A 11 16 
    //1C 18 14 25 11 00 A0 B3 2A 11 16 04 0B 47 
  }


  protected final event sv_Emote(byte aEmote) {
    if (Outer.IsDead()) {                                                       //0000 : 07 14 00 19 01 00 E4 6B 0F 06 00 04 1C D8 52 34 0F 16 
      return;                                                                   //0012 : 04 0B 
    }
    EmoteMappings[aEmote].OnServerExecute(Outer);                               //0014 : 19 10 39 3A 00 08 B5 2A 11 01 F0 B5 2A 11 0B 00 00 1B 1A 0D 00 00 01 00 E4 6B 0F 16 
    //07 14 00 19 01 00 E4 6B 0F 06 00 04 1C D8 52 34 0F 16 04 0B 19 10 39 3A 00 08 B5 2A 11 01 F0 B5 
    //2A 11 0B 00 00 1B 1A 0D 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function cl2sv_Emote_CallStub();


  protected final event cl2sv_Emote(byte aEmote) {
    if (Outer.IsDead()) {                                                       //0000 : 07 14 00 19 01 00 E4 6B 0F 06 00 04 1C D8 52 34 0F 16 
      return;                                                                   //0012 : 04 0B 
    }
    sv2rel_Emote_CallStub(aEmote);                                              //0014 : 1B B3 0E 00 00 00 18 B7 2A 11 16 
    sv_Emote(aEmote);                                                           //001F : 1C F0 B2 2A 11 00 18 B7 2A 11 16 
    //07 14 00 19 01 00 E4 6B 0F 06 00 04 1C D8 52 34 0F 16 04 0B 1B B3 0E 00 00 00 18 B7 2A 11 16 1C 
    //F0 B2 2A 11 00 18 B7 2A 11 16 04 0B 47 
  }


  final event PlayLocalEmote(byte aEmote) {
    if (Outer.IsDead()) {                                                       //0000 : 07 14 00 19 01 00 E4 6B 0F 06 00 04 1C D8 52 34 0F 16 
      return;                                                                   //0012 : 04 0B 
    }
    if (EmoteMappings[aEmote].AnimIndex >= 0) {                                 //0014 : 07 5A 00 99 19 10 39 3A 00 40 B8 2A 11 01 F0 B5 2A 11 05 00 04 01 98 BA 2A 11 25 16 
      Outer.Emote(EmoteMappings[aEmote].AnimIndex,1.00000000);                  //0030 : 19 01 00 E4 6B 0F 21 00 00 1B E2 0B 00 00 19 10 39 3A 00 40 B8 2A 11 01 F0 B5 2A 11 05 00 04 01 98 BA 2A 11 1E 00 00 80 3F 16 
    }
    if (EmoteMappings[aEmote].SoundIndex != 80) {                               //005A : 07 B4 00 9B 39 3A 19 10 39 3A 00 40 B8 2A 11 01 F0 B5 2A 11 05 00 01 01 10 BB 2A 11 39 3A 24 50 16 
      if (CanPlaySound()) {                                                     //007B : 07 B4 00 1C 60 AC 2A 11 16 
        InitSoundTimer(Outer.StaticPlaySound(EmoteMappings[aEmote].SoundIndex,2048.00000000));//0084 : 1C B0 AB 2A 11 19 01 00 E4 6B 0F 21 00 04 1B 29 06 00 00 19 10 39 3A 00 40 B8 2A 11 01 F0 B5 2A 11 05 00 01 01 10 BB 2A 11 1E 00 00 00 45 16 16 
      }
    }
    EmoteMappings[aEmote].OnClientExecute(Outer);                               //00B4 : 19 10 39 3A 00 40 B8 2A 11 01 F0 B5 2A 11 0B 00 00 1B 1B 0D 00 00 01 00 E4 6B 0F 16 
    //07 14 00 19 01 00 E4 6B 0F 06 00 04 1C D8 52 34 0F 16 04 0B 07 5A 00 99 19 10 39 3A 00 40 B8 2A 
    //11 01 F0 B5 2A 11 05 00 04 01 98 BA 2A 11 25 16 19 01 00 E4 6B 0F 21 00 00 1B E2 0B 00 00 19 10 
    //39 3A 00 40 B8 2A 11 01 F0 B5 2A 11 05 00 04 01 98 BA 2A 11 1E 00 00 80 3F 16 07 B4 00 9B 39 3A 
    //19 10 39 3A 00 40 B8 2A 11 01 F0 B5 2A 11 05 00 01 01 10 BB 2A 11 39 3A 24 50 16 07 B4 00 1C 60 
    //AC 2A 11 16 1C B0 AB 2A 11 19 01 00 E4 6B 0F 21 00 04 1B 29 06 00 00 19 10 39 3A 00 40 B8 2A 11 
    //01 F0 B5 2A 11 05 00 01 01 10 BB 2A 11 1E 00 00 00 45 16 16 19 10 39 3A 00 40 B8 2A 11 01 F0 B5 
    //2A 11 0B 00 00 1B 1B 0D 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  final native event sv_PlayContentEmote(byte aEmote);


  final native event bool cl_PerformEmote(string anEmote);


  event cl_OnFrame(float aDeltaTime) {
    if (SoundTimer > 0.00000000) {                                              //0000 : 07 1B 00 B1 01 D0 AD 2A 11 1E 00 00 00 00 16 
      SoundTimer -= aDeltaTime;                                                 //000F : B9 01 D0 AD 2A 11 00 C0 BE 2A 11 16 
    }
    //07 1B 00 B1 01 D0 AD 2A 11 1E 00 00 00 00 16 B9 01 D0 AD 2A 11 00 C0 BE 2A 11 16 04 0B 47 
  }



