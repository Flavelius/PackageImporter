//==============================================================================
//  MusicTrigger
//==============================================================================

class MusicTrigger extends Triggers
    dependsOn()
  ;

  var (MusicTrigger) string Song;
  var (MusicTrigger) float FadeInTime;
  var (MusicTrigger) float FadeOutTime;
  var (MusicTrigger) bool FadeOutAllSongs;
  var transient bool Triggered;
  var transient int SongHandle;


  function Trigger(Actor Other,Pawn EventInstigator) {
    if (!Triggered) {                                                           //0000 : 07 40 00 81 2D 01 28 45 F2 1C 16 
      Triggered = True;                                                         //000B : 14 2D 01 28 45 F2 1C 27 
      if (FadeOutAllSongs) {                                                    //0013 : 07 27 00 2D 01 B0 CB 7C 19 
        StopAllMusic(FadeOutTime);                                              //001C : 1C 40 8E 6D 0F 01 D0 20 F2 1C 16 
      }
      SongHandle = PlayMusic(Song,FadeInTime);                                  //0027 : 0F 01 F0 40 F2 1C 1C 68 78 6B 0F 01 50 28 F7 1C 01 38 CB 7C 19 16 
    } else {                                                                    //003D : 06 86 00 
      Triggered = False;                                                        //0040 : 14 2D 01 28 45 F2 1C 28 
      if (SongHandle != 0) {                                                    //0048 : 07 66 00 9B 01 F0 40 F2 1C 25 16 
        StopMusic(SongHandle,FadeOutTime);                                      //0053 : 1C 40 77 6B 0F 01 F0 40 F2 1C 01 D0 20 F2 1C 16 
      } else {                                                                  //0063 : 06 86 00 
        Log("WARNING: invalid song handle");                                    //0066 : E7 1F 57 41 52 4E 49 4E 47 3A 20 69 6E 76 61 6C 69 64 20 73 6F 6E 67 20 68 61 6E 64 6C 65 00 16 
      }
    }
    //07 40 00 81 2D 01 28 45 F2 1C 16 14 2D 01 28 45 F2 1C 27 07 27 00 2D 01 B0 CB 7C 19 1C 40 8E 6D 
    //0F 01 D0 20 F2 1C 16 0F 01 F0 40 F2 1C 1C 68 78 6B 0F 01 50 28 F7 1C 01 38 CB 7C 19 16 06 86 00 
    //14 2D 01 28 45 F2 1C 28 07 66 00 9B 01 F0 40 F2 1C 25 16 1C 40 77 6B 0F 01 F0 40 F2 1C 01 D0 20 
    //F2 1C 16 06 86 00 E7 1F 57 41 52 4E 49 4E 47 3A 20 69 6E 76 61 6C 69 64 20 73 6F 6E 67 20 68 61 
    //6E 64 6C 65 00 16 04 0B 47 
  }



