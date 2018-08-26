using System;
using System.Collections.Generic;
using SBBase;
using UnityEngine;

namespace SBGame
{
    [Serializable]
    public class Game_Emotes: Base_Component
    {
        public List<Game_Emote> EmoteMappings = new List<Game_Emote>();

        [Serializable]
        public struct EmoteMapping
        {
            public string Command;
            public int AnimIndex;
            public byte SoundIndex;
        }

        public void cl2sv_Emote(byte aEmote)
        {
            if ((Outer as Game_Pawn).IsDead()) return;
            //sv2rel_Emote_CallStub(aEmote);
            sv_Emote(aEmote);
        }

        void sv_Emote(byte aEmote)
        {
            if ((Outer as Game_Pawn).IsDead()) return;
            if (EmoteMappings.Count < aEmote)
            {
                Debug.LogWarning("Emote mappings not initialized correctly, TODO find out how");
            }
            EmoteMappings[aEmote].OnServerExecute(Outer as Game_Pawn);
        }
    }
}
/*
protected final function InitSoundTimer(float aBaseTime) {
SoundTimer = aBaseTime * TimeBetweenSoundsFactor;                           
}
protected final function bool CanPlaySound() {
return SoundTimer < 0.01000000;                                             
}
protected native function sv2cl_Emote_CallStub();
protected final event sv2cl_Emote(byte aEmote) {
PlayLocalEmote(aEmote);                                                     
}
protected native function sv2rel_Emote_CallStub();
protected final event sv2rel_Emote(byte aEmote) {
PlayLocalEmote(aEmote);                                                     
}
protected native function cl2sv_Emote_CallStub();
final event PlayLocalEmote(byte aEmote) {
if (Outer.IsDead()) {                                                       
return;                                                                   
}
if (EmoteMappings[aEmote].AnimIndex >= 0) {                                 
Outer.Emote(EmoteMappings[aEmote].AnimIndex,1.00000000);                  
}
if (EmoteMappings[aEmote].SoundIndex != 80) {                               
if (CanPlaySound()) {                                                     
InitSoundTimer(Outer.StaticPlaySound(EmoteMappings[aEmote].SoundIndex,2048.00000000));
}
}
EmoteMappings[aEmote].OnClientExecute(Outer);                               
}
final native event sv_PlayContentEmote(byte aEmote);
final native event bool cl_PerformEmote(string anEmote);
event cl_OnFrame(float aDeltaTime) {
if (SoundTimer > 0.00000000) {                                              
SoundTimer -= aDeltaTime;                                                 
}
}
*/
