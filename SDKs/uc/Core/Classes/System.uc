//==============================================================================
//  System
//==============================================================================

class System extends Subsystem
    native
    Transient
    Config(System)
  ;

  var config int PurgeCacheDays;
  var config string SavePath;
  var config string CachePath;
  var config string CacheExt;
  var config array<string> CacheRecordPath;
  var config array<string> MusicPath;
  var config string SpeechPath;
  var config array<string> Paths;
  var config array<name> Suppress;



