﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Dieser Code wurde von einem Tool generiert.
//     Laufzeitversion:4.0.30319.42000
//
//     Änderungen an dieser Datei können falsches Verhalten verursachen und gehen verloren, wenn
//     der Code erneut generiert wird.
// </auto-generated>
//------------------------------------------------------------------------------

using Engine;
using SBAI;
using SBAIScripts;
using SBBase;
using SBGame;
using SBGamePlay;
using SBMiniGames;
using System;
using System.Collections;
using System.Collections.Generic;
using TCosReborn.Framework.Common;


namespace SBGame
{
    
    
    public class FSkill_EffectClass_AudioVisual_Sound : FSkill_EffectClass_AudioVisual
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Sound")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public string SoundName = string.Empty;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Sound")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float Volume;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Sound")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float Radius;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Sound")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float Pitch;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PlayerSound")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float PlayerSoundRadius;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PlayerSound")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float PlayerSoundVolume;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PlayerSound")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public float PlayerSoundPitch;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PlayerSound")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte PlayerSound;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        private bool ReportedMissingSound;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        private Sound Sound;
        
        public FSkill_EffectClass_AudioVisual_Sound()
        {
        }
    }
}
/*
private final event bool LoadSound() {
if (Len(SoundName) > 0 && (Sound == None || IsEditor())) {                  
if (ReportedMissingSound && !IsEditor()) {                                
return False;                                                           
}
if (InStr(SoundName,".") != -1) {                                         
Sound = Sound(static.DynamicLoadObject(SoundName,Class'Sound',True));   
}
if (Sound == None) {                                                      
Sound = Sound(static.DynamicLoadObject("sfx_skills." $ SoundName,Class'Sound',True));
if (Sound == None) {                                                    
ReportedMissingSound = True;                                          
return False;                                                         
}
}
}
return True;                                                                
}
final event int PlaySound(Game_Pawn aPawn) {
if (PlayerSound != 80) {                                                    
aPawn.StaticPlaySoundEx(PlayerSound,PlayerSoundRadius,PlayerSoundVolume,PlayerSoundPitch);
}
if (LoadSound()) {                                                          
if (Sound != None) {                                                      
return aPawn.PlaySBSound(Sound,Volume,Pitch,Radius,,Class'SBAudioManager'.4);
}
}
return -1;                                                                  
}
*/
