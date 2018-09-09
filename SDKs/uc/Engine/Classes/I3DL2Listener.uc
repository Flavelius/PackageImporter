//==============================================================================
//  I3DL2Listener
//==============================================================================

class I3DL2Listener extends Object
    native
    abstract
    editinlinenew
    dependsOn()
  ;

  var (I3DL2Listener) float EnvironmentSize;
  var (I3DL2Listener) float EnvironmentDiffusion;
  var (I3DL2Listener) int Room;
  var (I3DL2Listener) int RoomHF;
  var (I3DL2Listener) int RoomLF;
  var (I3DL2Listener) float DecayTime;
  var (I3DL2Listener) float DecayHFRatio;
  var (I3DL2Listener) float DecayLFRatio;
  var (I3DL2Listener) int Reflections;
  var (I3DL2Listener) float ReflectionsDelay;
  var (I3DL2Listener) Vector ReflectionsPan;
  var (I3DL2Listener) int Reverb;
  var (I3DL2Listener) float ReverbDelay;
  var (I3DL2Listener) Vector ReverbPan;
  var (I3DL2Listener) float EchoTime;
  var (I3DL2Listener) float EchoDepth;
  var (I3DL2Listener) float ModulationTime;
  var (I3DL2Listener) float ModulationDepth;
  var (I3DL2Listener) float RoomRolloffFactor;
  var (I3DL2Listener) float AirAbsorptionHF;
  var (I3DL2Listener) float HFReference;
  var (I3DL2Listener) float LFReference;
  var (I3DL2Listener) bool bDecayTimeScale;
  var (I3DL2Listener) bool bReflectionsScale;
  var (I3DL2Listener) bool bReflectionsDelayScale;
  var (I3DL2Listener) bool bReverbScale;
  var (I3DL2Listener) bool bReverbDelayScale;
  var (I3DL2Listener) bool bEchoTimeScale;
  var (I3DL2Listener) bool bModulationTimeScale;
  var (I3DL2Listener) bool bDecayHFLimit;
  var transient int Environment;
  var transient int Updated;



