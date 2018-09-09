//==============================================================================
//  StreamInteraction
//==============================================================================

class StreamInteraction extends Interaction
    native
    dependsOn(StreamInterface,StreamPlaylistManager,Player,PlayerController,Class,StreamBase,Stream,StreamTag,LevelInfo)
    Config(User)
  ;

  const INVALIDSONGHANDLE =  0;
  var (StreamInteraction) config float FadeInSeconds;
  var (StreamInteraction) config float FadeOutSeconds;
  var (StreamInteraction) config string PlaylistManagerType;
  var (StreamInteraction) editconst editinline StreamPlaylistManager PlaylistManager;
  var (StreamInteraction) editconst editinline StreamInterface FileManager;
  var (StreamInteraction) editconst int CurrentSongHandle;
  var (StreamInteraction) editconst float CurrentSongPosition;
  var (StreamInteraction) editconst float LastPlayTime;
  var (StreamInteraction) editconst float CurrentSongDuration;
  var (StreamInteraction) editconst string CurrentSong;
  var (StreamInteraction) editconst Stream CurrentStreamAttachment;
  var (StreamInteraction) config bool bAutoStart;
  var (StreamInteraction) config bool bDisplayTrackChanges;
  var (StreamInteraction) transient editconst bool bRestartTrack;
  var (StreamInteraction) transient editconst bool bTrackWaiting;
  var (null);
  var (null);
  var (null);


  protected function PlayerController PC() {
    if (HasPlayer()) {                                                          //0000 : 07 18 00 1B 86 2A 00 00 16 
      return ViewportOwner.Actor;                                               //0009 : 04 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 
    }
    return None;                                                                //0018 : 04 2A 
    //07 18 00 1B 86 2A 00 00 16 04 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 04 2A 04 0B 47 
  }


  protected function KillMusic() {
    if (!HasPlayer()) {                                                         //0000 : 07 0D 00 81 1B 86 2A 00 00 16 16 
      return;                                                                   //000B : 04 0B 
    }
    PC().StopAllMusic();                                                        //000D : 19 1B AA 1C 00 00 16 06 00 00 1C 40 8E 6D 0F 16 
    PC().AllowMusicPlayback(False);                                             //001D : 19 1B AA 1C 00 00 16 07 00 00 1C E0 84 6B 0F 28 16 
    //07 0D 00 81 1B 86 2A 00 00 16 16 04 0B 19 1B AA 1C 00 00 16 06 00 00 1C 40 8E 6D 0F 16 19 1B AA 
    //1C 00 00 16 07 00 00 1C E0 84 6B 0F 28 16 04 0B 47 
  }


  function ClearSongInfo() {
    SetStreamAttachment(None);                                                  //0000 : 1B 25 2B 00 00 2A 16 
    CurrentSong = "";                                                           //0007 : 0F 01 78 F2 38 19 1F 00 
    CurrentSongHandle = 0;                                                      //000F : 0F 01 F0 F2 38 19 25 
    CurrentSongPosition = 0.00000000;                                           //0016 : 0F 01 68 F3 38 19 1E 00 00 00 00 
    CurrentSongDuration = 0.00000000;                                           //0021 : 0F 01 E0 F3 38 19 1E 00 00 00 00 
    //1B 25 2B 00 00 2A 16 0F 01 78 F2 38 19 1F 00 0F 01 F0 F2 38 19 25 0F 01 68 F3 38 19 1E 00 00 00 
    //00 0F 01 E0 F3 38 19 1E 00 00 00 00 04 0B 47 
  }


  function bool HasPlayer() {
    if (ViewportOwner == None) {                                                //0000 : 07 48 00 72 01 70 B7 71 0F 2A 16 
      Log("StreamInteraction::HasPlayer() - No ViewportOwner!",'MusicPlayer');  //000B : E7 1F 53 74 72 65 61 6D 49 6E 74 65 72 61 63 74 69 6F 6E 3A 3A 48 61 73 50 6C 61 79 65 72 28 29 20 2D 20 4E 6F 20 56 69 65 77 70 6F 72 74 4F 77 6E 65 72 21 00 21 4E 03 00 00 16 
      return False;                                                             //0046 : 04 28 
    }
    if (ViewportOwner.Actor == None) {                                          //0048 : 07 9C 00 72 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 2A 16 
      Log("StreamInteraction::HasPlayer() - No PlayerController!",'MusicPlayer');//005C : E7 1F 53 74 72 65 61 6D 49 6E 74 65 72 61 63 74 69 6F 6E 3A 3A 48 61 73 50 6C 61 79 65 72 28 29 20 2D 20 4E 6F 20 50 6C 61 79 65 72 43 6F 6E 74 72 6F 6C 6C 65 72 21 00 21 4E 03 00 00 16 
      return False;                                                             //009A : 04 28 
    }
    return True;                                                                //009C : 04 27 
    //07 48 00 72 01 70 B7 71 0F 2A 16 E7 1F 53 74 72 65 61 6D 49 6E 74 65 72 61 63 74 69 6F 6E 3A 3A 
    //48 61 73 50 6C 61 79 65 72 28 29 20 2D 20 4E 6F 20 56 69 65 77 70 6F 72 74 4F 77 6E 65 72 21 00 
    //21 4E 03 00 00 16 04 28 07 9C 00 72 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 2A 16 E7 1F 53 74 
    //72 65 61 6D 49 6E 74 65 72 61 63 74 69 6F 6E 3A 3A 48 61 73 50 6C 61 79 65 72 28 29 20 2D 20 4E 
    //6F 20 50 6C 61 79 65 72 43 6F 6E 74 72 6F 6C 6C 65 72 21 00 21 4E 03 00 00 16 04 28 04 27 04 0B 
    //47 
  }


  function bool IsPlaying() {
    return CurrentSongHandle != 0;                                              //0000 : 04 9B 01 F0 F2 38 19 25 16 
    //04 9B 01 F0 F2 38 19 25 16 04 0B 47 
  }


  function float GetStreamDuration() {
    if (!IsPlaying()) {                                                         //0000 : 07 11 00 81 1B A2 05 00 00 16 16 
      return 0.00000000;                                                        //000B : 04 1E 00 00 00 00 
    }
    if (CurrentSongDuration == 0.00000000) {                                    //0011 : 07 4E 00 B4 01 E0 F3 38 19 1E 00 00 00 00 16 
      CurrentSongDuration = float(PC().ConsoleCommand("GETDURATION" @ string(CurrentSongHandle)));//0020 : 0F 01 E0 F3 38 19 39 4C 19 1B AA 1C 00 00 16 1C 00 00 1B 65 0C 00 00 A8 1F 47 45 54 44 55 52 41 54 49 4F 4E 00 39 53 01 F0 F2 38 19 16 16 
    }
    return CurrentSongDuration;                                                 //004E : 04 01 E0 F3 38 19 
    //07 11 00 81 1B A2 05 00 00 16 16 04 1E 00 00 00 00 07 4E 00 B4 01 E0 F3 38 19 1E 00 00 00 00 16 
    //0F 01 E0 F3 38 19 39 4C 19 1B AA 1C 00 00 16 1C 00 00 1B 65 0C 00 00 A8 1F 47 45 54 44 55 52 41 
    //54 49 4F 4E 00 39 53 01 F0 F2 38 19 16 16 04 01 E0 F3 38 19 04 0B 47 
  }


  function float GetStreamVolume() {
    if (HasPlayer()) {                                                          //0000 : 07 4B 00 1B 86 2A 00 00 16 
      return float(PC().ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"));//0009 : 04 39 4C 19 1B AA 1C 00 00 16 35 00 00 1B 65 0C 00 00 1F 67 65 74 20 69 6E 69 3A 45 6E 67 69 6E 65 2E 45 6E 67 69 6E 65 2E 41 75 64 69 6F 44 65 76 69 63 65 20 4D 75 73 69 63 56 6F 6C 75 6D 65 00 16 
    }
    return 0.80000001;                                                          //004B : 04 1E CD CC 4C 3F 
    //07 4B 00 1B 86 2A 00 00 16 04 39 4C 19 1B AA 1C 00 00 16 35 00 00 1B 65 0C 00 00 1F 67 65 74 20 
    //69 6E 69 3A 45 6E 67 69 6E 65 2E 45 6E 67 69 6E 65 2E 41 75 64 69 6F 44 65 76 69 63 65 20 4D 75 
    //73 69 63 56 6F 6C 75 6D 65 00 16 04 1E CD CC 4C 3F 04 0B 47 
  }


  function float GetStreamPosition() {
    return CurrentSongPosition;                                                 //0000 : 04 01 68 F3 38 19 
    //04 01 68 F3 38 19 04 0B 47 
  }


  function PlayStream(string fileName,optional int SeekSeconds) {
    local int LastSongHandle;
    if (fileName != "") {                                                       //0000 : 07 98 01 7B 00 18 FD 38 19 1F 00 16 
      if (fileName == CurrentSong && IsPaused()
        && SeekSeconds == 0.00000000) {//000C : 07 41 00 82 82 7A 00 18 FD 38 19 01 78 F2 38 19 16 18 07 00 1C 90 FD 38 19 16 16 18 0F 00 B4 39 3F 00 40 FE 38 19 1E 00 00 00 00 16 16 
        PauseSong();                                                            //0039 : 1B E8 2B 00 00 16 
        return;                                                                 //003F : 04 0B 
      }
      SeekSeconds = 0;                                                          //0041 : 0F 00 40 FE 38 19 25 
      LastSongHandle = CurrentSongHandle;                                       //0048 : 0F 00 B8 FE 38 19 01 F0 F2 38 19 
      if (SeekSeconds > 0.00000000 && CurrentSong == fileName) {                //0053 : 07 94 00 82 B1 39 3F 00 40 FE 38 19 1E 00 00 00 00 16 18 0D 00 7A 01 78 F2 38 19 00 18 FD 38 19 16 16 
        CurrentSongHandle = PC().PlayStream(fileName,True);                     //0075 : 0F 01 F0 F2 38 19 19 1B AA 1C 00 00 16 0C 00 04 1C 08 83 6B 0F 00 18 FD 38 19 27 16 
      } else {                                                                  //0091 : 06 B0 00 
        CurrentSongHandle = PC().PlayStream(fileName,True);                     //0094 : 0F 01 F0 F2 38 19 19 1B AA 1C 00 00 16 0C 00 04 1C 08 83 6B 0F 00 18 FD 38 19 27 16 
      }
      if (CurrentSongHandle == 0) {                                             //00B0 : 07 FE 00 9A 01 F0 F2 38 19 25 16 
        Log("StreamInteraction::PlaySong() Invalid song name:"
          @ fileName,'MusicPlayer');//00BB : E7 A8 1F 53 74 72 65 61 6D 49 6E 74 65 72 61 63 74 69 6F 6E 3A 3A 50 6C 61 79 53 6F 6E 67 28 29 20 49 6E 76 61 6C 69 64 20 73 6F 6E 67 20 6E 61 6D 65 3A 00 00 18 FD 38 19 16 21 4E 03 00 00 16 
      } else {                                                                  //00FB : 06 95 01 
        KillMusic();                                                            //00FE : 1B DA 2B 00 00 16 
        CurrentSongPosition = SeekSeconds;                                      //0104 : 0F 01 68 F3 38 19 39 3F 00 40 FE 38 19 
        CurrentSongDuration = 0.00000000;                                       //0111 : 0F 01 E0 F3 38 19 1E 00 00 00 00 
        if (LastSongHandle != 0) {                                              //011C : 07 7B 01 9B 00 B8 FE 38 19 25 16 
          if (SeekSeconds > 0.00000000 && CurrentSong == fileName) {            //0127 : 07 61 01 82 B1 39 3F 00 40 FE 38 19 1E 00 00 00 00 16 18 0D 00 7A 01 78 F2 38 19 00 18 FD 38 19 16 16 
            PC().StopStream(LastSongHandle);                                    //0149 : 19 1B AA 1C 00 00 16 0B 00 00 1C B8 80 6B 0F 00 B8 FE 38 19 16 
          } else {                                                              //015E : 06 7B 01 
            PC().StopStream(LastSongHandle,FadeOutSeconds);                     //0161 : 19 1B AA 1C 00 00 16 10 00 00 1C B8 80 6B 0F 00 B8 FE 38 19 01 30 FF 38 19 16 
          }
        }
        CurrentSong = fileName;                                                 //017B : 0F 01 78 F2 38 19 00 18 FD 38 19 
        OnStreamChanged(CurrentSong);                                           //0186 : 43 A8 FF 38 19 A2 2B 00 00 01 78 F2 38 19 16 
      }
    } else {                                                                    //0195 : 06 BA 01 
      if (CurrentSongHandle == 0) {                                             //0198 : 07 BA 01 9A 01 F0 F2 38 19 25 16 
        PC().AllowMusicPlayback(True);                                          //01A3 : 19 1B AA 1C 00 00 16 07 00 00 1C E0 84 6B 0F 27 16 
        ClearSongInfo();                                                        //01B4 : 1B F4 2A 00 00 16 
      }
    }
    //07 98 01 7B 00 18 FD 38 19 1F 00 16 07 41 00 82 82 7A 00 18 FD 38 19 01 78 F2 38 19 16 18 07 00 
    //1C 90 FD 38 19 16 16 18 0F 00 B4 39 3F 00 40 FE 38 19 1E 00 00 00 00 16 16 1B E8 2B 00 00 16 04 
    //0B 0F 00 40 FE 38 19 25 0F 00 B8 FE 38 19 01 F0 F2 38 19 07 94 00 82 B1 39 3F 00 40 FE 38 19 1E 
    //00 00 00 00 16 18 0D 00 7A 01 78 F2 38 19 00 18 FD 38 19 16 16 0F 01 F0 F2 38 19 19 1B AA 1C 00 
    //00 16 0C 00 04 1C 08 83 6B 0F 00 18 FD 38 19 27 16 06 B0 00 0F 01 F0 F2 38 19 19 1B AA 1C 00 00 
    //16 0C 00 04 1C 08 83 6B 0F 00 18 FD 38 19 27 16 07 FE 00 9A 01 F0 F2 38 19 25 16 E7 A8 1F 53 74 
    //72 65 61 6D 49 6E 74 65 72 61 63 74 69 6F 6E 3A 3A 50 6C 61 79 53 6F 6E 67 28 29 20 49 6E 76 61 
    //6C 69 64 20 73 6F 6E 67 20 6E 61 6D 65 3A 00 00 18 FD 38 19 16 21 4E 03 00 00 16 06 95 01 1B DA 
    //2B 00 00 16 0F 01 68 F3 38 19 39 3F 00 40 FE 38 19 0F 01 E0 F3 38 19 1E 00 00 00 00 07 7B 01 9B 
    //00 B8 FE 38 19 25 16 07 61 01 82 B1 39 3F 00 40 FE 38 19 1E 00 00 00 00 16 18 0D 00 7A 01 78 F2 
    //38 19 00 18 FD 38 19 16 16 19 1B AA 1C 00 00 16 0B 00 00 1C B8 80 6B 0F 00 B8 FE 38 19 16 06 7B 
    //01 19 1B AA 1C 00 00 16 10 00 00 1C B8 80 6B 0F 00 B8 FE 38 19 01 30 FF 38 19 16 0F 01 78 F2 38 
    //19 00 18 FD 38 19 43 A8 FF 38 19 A2 2B 00 00 01 78 F2 38 19 16 06 BA 01 07 BA 01 9A 01 F0 F2 38 
    //19 25 16 19 1B AA 1C 00 00 16 07 00 00 1C E0 84 6B 0F 27 16 1B F4 2A 00 00 16 04 0B 47 
  }


  function bool Seek(float SeekSeconds) {
    return False;                                                               //0000 : 04 28 
    if (CurrentSongHandle != 0) {                                               //0002 : 07 3A 00 9B 01 F0 F2 38 19 25 16 
      if (PC().SeekStream(CurrentSongHandle,SeekSeconds) > 0) {                 //000D : 07 3A 00 97 19 1B AA 1C 00 00 16 10 00 04 1C 68 7E 6B 0F 01 F0 F2 38 19 00 D0 00 39 19 16 25 16 
        CurrentSongPosition = SeekSeconds;                                      //002D : 0F 01 68 F3 38 19 00 D0 00 39 19 
        return True;                                                            //0038 : 04 27 
      }
    }
    return False;                                                               //003A : 04 28 
    //04 28 07 3A 00 9B 01 F0 F2 38 19 25 16 07 3A 00 97 19 1B AA 1C 00 00 16 10 00 04 1C 68 7E 6B 0F 
    //01 F0 F2 38 19 00 D0 00 39 19 16 25 16 0F 01 68 F3 38 19 00 D0 00 39 19 04 27 04 28 04 0B 47 
  }


  function SeekStream(float Seconds) {
    Seek(Seconds);                                                              //0000 : 1B E2 2B 00 00 00 F0 02 39 19 16 
    //1B E2 2B 00 00 00 F0 02 39 19 16 04 0B 47 
  }


  function SetMusicVolume(float NewVolume) {
    if (HasPlayer()) {                                                          //0000 : 07 3E 00 1B 86 2A 00 00 16 
      PC().AdjustVolume(CurrentSongHandle,FClamp(NewVolume,0.00000000,1.00000000));//0009 : 19 1B AA 1C 00 00 16 1C 00 04 1C 90 7C 6B 0F 01 F0 F2 38 19 F6 00 58 04 39 19 1E 00 00 00 00 1E 00 00 80 3F 16 16 
      OnAdjustVolume(NewVolume);                                                //002F : 43 58 05 39 19 AB 2B 00 00 00 58 04 39 19 16 
    }
    //07 3E 00 1B 86 2A 00 00 16 19 1B AA 1C 00 00 16 1C 00 04 1C 90 7C 6B 0F 01 F0 F2 38 19 F6 00 58 
    //04 39 19 1E 00 00 00 00 1E 00 00 80 3F 16 16 43 58 05 39 19 AB 2B 00 00 00 58 04 39 19 16 04 0B 
    //47 
  }


  function StopSong() {
    if (!HasPlayer()) {                                                         //0000 : 07 0D 00 81 1B 86 2A 00 00 16 16 
      return;                                                                   //000B : 04 0B 
    }
    if (CurrentSongHandle != 0) {                                               //000D : 07 32 00 9B 01 F0 F2 38 19 25 16 
      PC().StopStream(CurrentSongHandle,FadeOutSeconds);                        //0018 : 19 1B AA 1C 00 00 16 10 00 00 1C B8 80 6B 0F 01 F0 F2 38 19 01 30 FF 38 19 16 
    }
    PC().AllowMusicPlayback(True);                                              //0032 : 19 1B AA 1C 00 00 16 07 00 00 1C E0 84 6B 0F 27 16 
    ClearSongInfo();                                                            //0043 : 1B F4 2A 00 00 16 
    //07 0D 00 81 1B 86 2A 00 00 16 16 04 0B 07 32 00 9B 01 F0 F2 38 19 25 16 19 1B AA 1C 00 00 16 10 
    //00 00 1C B8 80 6B 0F 01 F0 F2 38 19 01 30 FF 38 19 16 19 1B AA 1C 00 00 16 07 00 00 1C E0 84 6B 
    //0F 27 16 1B F4 2A 00 00 16 04 0B 47 
  }


  function PlaySong(string SongName,float InitialTime) {
    if (!HasPlayer()) {                                                         //0000 : 07 0D 00 81 1B 86 2A 00 00 16 16 
      return;                                                                   //000B : 04 0B 
    }
    PlayStream(SongName,InitialTime);                                           //000D : 1B A6 2A 00 00 00 30 07 39 19 39 44 00 A8 07 39 19 16 
    //07 0D 00 81 1B 86 2A 00 00 16 16 04 0B 1B A6 2A 00 00 00 30 07 39 19 39 44 00 A8 07 39 19 16 04 
    //0B 47 
  }


  function PauseSong() {
    if (!HasPlayer()) {                                                         //0000 : 07 0D 00 81 1B 86 2A 00 00 16 16 
      return;                                                                   //000B : 04 0B 
    }
    if (CurrentSongHandle != 0) {                                               //000D : 07 2D 00 9B 01 F0 F2 38 19 25 16 
      PC().PauseStream(CurrentSongHandle);                                      //0018 : 19 1B AA 1C 00 00 16 0B 00 04 1C 40 7A 6B 0F 01 F0 F2 38 19 16 
    }
    //07 0D 00 81 1B 86 2A 00 00 16 16 04 0B 07 2D 00 9B 01 F0 F2 38 19 25 16 19 1B AA 1C 00 00 16 0B 
    //00 04 1C 40 7A 6B 0F 01 F0 F2 38 19 16 04 0B 47 
  }


  function PrevSong(optional bool bForce) {
    if (!HasPlayer()) {                                                         //0000 : 07 0D 00 81 1B 86 2A 00 00 16 16 
      return;                                                                   //000B : 04 0B 
    }
    bTrackWaiting = False;                                                      //000D : 14 2D 01 68 0A 39 19 28 
    if (CurrentSongPosition > 3.00000000) {                                     //0015 : 07 32 00 B1 01 68 F3 38 19 1E 00 00 40 40 16 
      PlayStream(CurrentSong);                                                  //0024 : 1B A6 2A 00 00 01 78 F2 38 19 16 
    } else {                                                                    //002F : 06 4D 00 
      PlayStream(PlaylistManager.PrevSong(bForce));                             //0032 : 1B A6 2A 00 00 19 01 E0 0A 39 19 0C 00 00 1B C1 2A 00 00 2D 00 F0 09 39 19 16 16 
    }
    //07 0D 00 81 1B 86 2A 00 00 16 16 04 0B 14 2D 01 68 0A 39 19 28 07 32 00 B1 01 68 F3 38 19 1E 00 
    //00 40 40 16 1B A6 2A 00 00 01 78 F2 38 19 16 06 4D 00 1B A6 2A 00 00 19 01 E0 0A 39 19 0C 00 00 
    //1B C1 2A 00 00 2D 00 F0 09 39 19 16 16 04 0B 47 
  }


  function NextSong(optional bool bForce) {
    if (!HasPlayer()) {                                                         //0000 : 07 0D 00 81 1B 86 2A 00 00 16 16 
      return;                                                                   //000B : 04 0B 
    }
    bTrackWaiting = False;                                                      //000D : 14 2D 01 68 0A 39 19 28 
    PlayStream(PlaylistManager.NextSong(bForce));                               //0015 : 1B A6 2A 00 00 19 01 E0 0A 39 19 0C 00 00 1B A4 2A 00 00 2D 00 08 0C 39 19 16 16 
    //07 0D 00 81 1B 86 2A 00 00 16 16 04 0B 14 2D 01 68 0A 39 19 28 1B A6 2A 00 00 19 01 E0 0A 39 19 
    //0C 00 00 1B A4 2A 00 00 2D 00 08 0C 39 19 16 16 04 0B 47 
  }


  function int CurrentHandle() {
    return CurrentSongHandle;                                                   //0000 : 04 01 F0 F2 38 19 
    //04 01 F0 F2 38 19 04 0B 47 
  }


  function string GetCurrentStream() {
    HasPlayer();                                                                //0000 : 1B 86 2A 00 00 16 
    Log("CurrentSongHandle:" $ string(CurrentSongHandle)
      @ "CurrentSong:"
      $ CurrentSong
      @ "IsPaused:"
      $ string(IsPaused()));//0006 : E7 70 A8 70 A8 70 1F 43 75 72 72 65 6E 74 53 6F 6E 67 48 61 6E 64 6C 65 3A 00 39 53 01 F0 F2 38 19 16 1F 43 75 72 72 65 6E 74 53 6F 6E 67 3A 00 16 01 78 F2 38 19 16 1F 49 73 50 61 75 73 65 64 3A 00 16 39 54 1C 90 FD 38 19 16 16 16 
    return CurrentSong;                                                         //0053 : 04 01 78 F2 38 19 
    //1B 86 2A 00 00 16 E7 70 A8 70 A8 70 1F 43 75 72 72 65 6E 74 53 6F 6E 67 48 61 6E 64 6C 65 3A 00 
    //39 53 01 F0 F2 38 19 16 1F 43 75 72 72 65 6E 74 53 6F 6E 67 3A 00 16 01 78 F2 38 19 16 1F 49 73 
    //50 61 75 73 65 64 3A 00 16 39 54 1C 90 FD 38 19 16 16 16 04 01 78 F2 38 19 04 0B 47 
  }


  event NotifyLevelChange() {
    if (CurrentSongHandle != 0 && CurrentSong != "") {                          //0000 : 07 21 00 82 9B 01 F0 F2 38 19 25 16 18 0A 00 7B 01 78 F2 38 19 1F 00 16 16 
      bRestartTrack = True;                                                     //0019 : 14 2D 01 98 10 39 19 27 
    }
    //07 21 00 82 9B 01 F0 F2 38 19 25 16 18 0A 00 7B 01 78 F2 38 19 1F 00 16 16 14 2D 01 98 10 39 19 
    //27 04 0B 47 
  }


  function StreamFinished(int Handle,byte Reason) {
    Super.StreamFinished(Handle,Reason);                                        //0000 : 1C F0 B1 71 0F 00 C0 11 39 19 00 38 12 39 19 16 
    PlaylistManager.Save();                                                     //0010 : 19 01 E0 0A 39 19 06 00 00 1B A0 2A 00 00 16 
    Log("StreamFinished() Handle:" $ string(Handle)
      @ "Reason:"
      $ string(static.GetEnum(Enum'EStreamFinishReason',Reason)),'MusicPlayer');//001F : E7 70 A8 70 1F 53 74 72 65 61 6D 46 69 6E 69 73 68 65 64 28 29 20 48 61 6E 64 6C 65 3A 00 39 53 00 C0 11 39 19 16 1F 52 65 61 73 6F 6E 3A 00 16 39 57 1C B8 E9 69 0F 20 A0 70 37 0F 39 3A 00 38 12 39 19 16 16 21 4E 03 00 00 16 
    if (Handle == CurrentSongHandle && CurrentSongHandle != 0) {                //006A : 07 0B 01 82 9A 00 C0 11 39 19 01 F0 F2 38 19 16 18 09 00 9B 01 F0 F2 38 19 25 16 16 
      Log("CurrentSongPosition:"
        $ Class'StreamBase'.static.FormatTimeDisplay(CurrentSongPosition)
        @ "Total song time:"
        $ Class'StreamBase'.static.FormatTimeDisplay(GetStreamDuration()));//0086 : E7 70 A8 70 1F 43 75 72 72 65 6E 74 53 6F 6E 67 50 6F 73 69 74 69 6F 6E 3A 00 12 20 A8 73 D6 00 0B 00 00 1C 00 8A 38 19 01 68 F3 38 19 16 16 1F 54 6F 74 61 6C 20 73 6F 6E 67 20 74 69 6D 65 3A 00 16 12 20 A8 73 D6 00 0C 00 00 1C 00 8A 38 19 1B DD 2B 00 00 16 16 16 16 
      CurrentSongPosition = 0.00000000;                                         //00DF : 0F 01 68 F3 38 19 1E 00 00 00 00 
      CurrentSongHandle = 0;                                                    //00EA : 0F 01 F0 F2 38 19 25 
      SetStreamAttachment(None);                                                //00F1 : 1B 25 2B 00 00 2A 16 
      OnStreamingStopped();                                                     //00F8 : 43 B0 12 39 19 A1 2B 00 00 16 
      QueueNextSong();                                                          //0102 : 1B 22 2B 00 00 16 
    } else {                                                                    //0108 : 06 3F 01 
      Log(string(Name)
        @ "StreamFinished Invalid Song Handle",'MusicPlayer');//010B : E7 A8 39 57 01 F0 E4 6B 0F 1F 53 74 72 65 61 6D 46 69 6E 69 73 68 65 64 20 49 6E 76 61 6C 69 64 20 53 6F 6E 67 20 48 61 6E 64 6C 65 00 16 21 4E 03 00 00 16 
    }
    //1C F0 B1 71 0F 00 C0 11 39 19 00 38 12 39 19 16 19 01 E0 0A 39 19 06 00 00 1B A0 2A 00 00 16 E7 
    //70 A8 70 1F 53 74 72 65 61 6D 46 69 6E 69 73 68 65 64 28 29 20 48 61 6E 64 6C 65 3A 00 39 53 00 
    //C0 11 39 19 16 1F 52 65 61 73 6F 6E 3A 00 16 39 57 1C B8 E9 69 0F 20 A0 70 37 0F 39 3A 00 38 12 
    //39 19 16 16 21 4E 03 00 00 16 07 0B 01 82 9A 00 C0 11 39 19 01 F0 F2 38 19 16 18 09 00 9B 01 F0 
    //F2 38 19 25 16 16 E7 70 A8 70 1F 43 75 72 72 65 6E 74 53 6F 6E 67 50 6F 73 69 74 69 6F 6E 3A 00 
    //12 20 A8 73 D6 00 0B 00 00 1C 00 8A 38 19 01 68 F3 38 19 16 16 1F 54 6F 74 61 6C 20 73 6F 6E 67 
    //20 74 69 6D 65 3A 00 16 12 20 A8 73 D6 00 0C 00 00 1C 00 8A 38 19 1B DD 2B 00 00 16 16 16 16 0F 
    //01 68 F3 38 19 1E 00 00 00 00 0F 01 F0 F2 38 19 25 1B 25 2B 00 00 2A 16 43 B0 12 39 19 A1 2B 00 
    //00 16 1B 22 2B 00 00 16 06 3F 01 E7 A8 39 57 01 F0 E4 6B 0F 1F 53 74 72 65 61 6D 46 69 6E 69 73 
    //68 65 64 20 49 6E 76 61 6C 69 64 20 53 6F 6E 67 20 48 61 6E 64 6C 65 00 16 21 4E 03 00 00 16 04 
    //0B 47 
  }


  function SetStreamAttachment(Stream StreamObj) {
    local StreamTag sTag;
    CurrentStreamAttachment = StreamObj;                                        //0000 : 0F 01 48 14 39 19 00 28 13 39 19 
    if (CurrentStreamAttachment != None) {                                      //000B : 07 58 00 77 01 48 14 39 19 2A 16 
      sTag = CurrentStreamAttachment.GetTag();                                  //0016 : 0F 00 C0 14 39 19 19 01 48 14 39 19 06 00 04 1B ED 2B 00 00 16 
      if (sTag != None) {                                                       //002B : 07 58 00 77 00 C0 14 39 19 2A 16 
        CurrentSongDuration = float(sTag.Duration.FieldValue) / 1000.00000000;  //0036 : 0F 01 E0 F3 38 19 AC 39 4C 36 28 AB 38 19 19 00 C0 14 39 19 05 00 1C 01 08 B6 38 19 1E 00 00 7A 44 16 
      }
    }
    //0F 01 48 14 39 19 00 28 13 39 19 07 58 00 77 01 48 14 39 19 2A 16 0F 00 C0 14 39 19 19 01 48 14 
    //39 19 06 00 04 1B ED 2B 00 00 16 07 58 00 77 00 C0 14 39 19 2A 16 0F 01 E0 F3 38 19 AC 39 4C 36 
    //28 AB 38 19 19 00 C0 14 39 19 05 00 1C 01 08 B6 38 19 1E 00 00 7A 44 16 04 0B 47 
  }


  final native function bool IsPaused(optional int SongHandle);


  event Tick(float DeltaTime) {
    if (bTrackWaiting) {                                                        //0000 : 07 12 00 2D 01 68 0A 39 19 
      NextSong();                                                               //0009 : 1B A4 2A 00 00 16 
    } else {                                                                    //000F : 06 7E 00 
      if (bRestartTrack) {                                                      //0012 : 07 38 00 2D 01 98 10 39 19 
        bRestartTrack = False;                                                  //001B : 14 2D 01 98 10 39 19 28 
        PlayStream(CurrentSong,CurrentSongPosition);                            //0023 : 1B A6 2A 00 00 01 78 F2 38 19 39 44 01 68 F3 38 19 16 
      } else {                                                                  //0035 : 06 7E 00 
        if (!IsPaused() && CurrentSongHandle != 0) {                            //0038 : 07 7E 00 82 81 1C 90 FD 38 19 16 16 18 09 00 9B 01 F0 F2 38 19 25 16 16 
          CurrentSongPosition += DeltaTime / ViewportOwner.Actor.Level.TimeDilation;//0050 : B8 01 68 F3 38 19 AC 00 88 17 39 19 19 19 19 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 9D 74 0F 16 16 
        }
      }
    }
    //07 12 00 2D 01 68 0A 39 19 1B A4 2A 00 00 16 06 7E 00 07 38 00 2D 01 98 10 39 19 14 2D 01 98 10 
    //39 19 28 1B A6 2A 00 00 01 78 F2 38 19 39 44 01 68 F3 38 19 16 06 7E 00 07 7E 00 82 81 1C 90 FD 
    //38 19 16 16 18 09 00 9B 01 F0 F2 38 19 25 16 16 B8 01 68 F3 38 19 AC 00 88 17 39 19 19 19 19 01 
    //70 B7 71 0F 05 00 04 01 50 BA 79 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 9D 74 0F 16 16 04 0B 
    //47 
  }


  function QueueNextSong() {
    bTrackWaiting = True;                                                       //0000 : 14 2D 01 68 0A 39 19 27 
    //14 2D 01 68 0A 39 19 27 04 0B 47 
  }


  function StreamPlaylistManager CreatePlaylistManager() {
    local class<StreamPlaylistManager> PlaylistManagerClass;
    if (PlaylistManagerType != "") {                                            //0000 : 07 27 00 7B 01 B8 1A 39 19 1F 00 16 
      PlaylistManagerClass = Class<StreamPlaylistManager>(static.DynamicLoadObject(PlaylistManagerType,Class'Class'));//000C : 0F 00 30 1B 39 19 13 B0 1B 39 19 1C 60 E7 69 0F 01 B8 1A 39 19 20 D8 DE 1F 10 16 
    }
    if (PlaylistManagerClass == None) {                                         //0027 : 07 3D 00 72 00 30 1B 39 19 2A 16 
      PlaylistManagerClass = Class'StreamPlaylistManager';                      //0032 : 0F 00 30 1B 39 19 20 B0 1B 39 19 
    }
    return new PlaylistManagerClass;                                            //003D : 04 11 0B 0B 0B 00 30 1B 39 19 
    //07 27 00 7B 01 B8 1A 39 19 1F 00 16 0F 00 30 1B 39 19 13 B0 1B 39 19 1C 60 E7 69 0F 01 B8 1A 39 
    //19 20 D8 DE 1F 10 16 07 3D 00 72 00 30 1B 39 19 2A 16 0F 00 30 1B 39 19 20 B0 1B 39 19 04 11 0B 
    //0B 0B 00 30 1B 39 19 04 0B 47 
  }


  function StreamInterface CreateFileManager() {
    return new Class'StreamInterface';                                          //0000 : 04 11 0B 0B 0B 20 28 7E D6 00 
    //04 11 0B 0B 0B 20 28 7E D6 00 04 0B 47 
  }


  event Initialized() {
    Super.Initialized();                                                        //0000 : 1C 70 C1 71 0F 16 
    ClearSongInfo();                                                            //0006 : 1B F4 2A 00 00 16 
    FileManager = CreateFileManager();                                          //000C : 0F 01 40 23 39 19 1B 1F 2C 00 00 16 
    PlaylistManager = CreatePlaylistManager();                                  //0018 : 0F 01 E0 0A 39 19 1B F6 2B 00 00 16 
    if (PlaylistManager != None) {                                              //0024 : 07 43 00 77 01 E0 0A 39 19 2A 16 
      PlaylistManager.Initialize(FileManager);                                  //002F : 19 01 E0 0A 39 19 0B 00 00 1B 38 04 00 00 01 40 23 39 19 16 
    }
    if (bAutoStart) {                                                           //0043 : 07 52 00 2D 01 B8 23 39 19 
      QueueNextSong();                                                          //004C : 1B 22 2B 00 00 16 
    }
    //1C 70 C1 71 0F 16 1B F4 2A 00 00 16 0F 01 40 23 39 19 1B 1F 2C 00 00 16 0F 01 E0 0A 39 19 1B F6 
    //2B 00 00 16 07 43 00 77 01 E0 0A 39 19 2A 16 19 01 E0 0A 39 19 0B 00 00 1B 38 04 00 00 01 40 23 
    //39 19 16 07 52 00 2D 01 B8 23 39 19 1B 22 2B 00 00 16 04 0B 47 
  }


  delegate OnAdjustVolume(float NewVolume);


  delegate OnStreamingStopped();


  delegate OnStreamChanged(string NewStreamFileName);



