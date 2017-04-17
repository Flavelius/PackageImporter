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


namespace SBGamePlay
{
    
    
    public class TriggerableBarrier : Game_Actor
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TriggerableBarrier")]
        public bool bInitiallyOpen;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="TriggerableBarrier")]
        public bool bAutoInvisibleEffect;
        
        public TriggerableBarrier()
        {
        }
    }
}
/*
function SetOpened(bool Open) {
if (IsServer()) {                                                           
sv_SetEnabled(!Open);                                                     
sv_SetCollision(!Open,!Open);                                             
}
}
event UnTrigger(Actor Other,Pawn EventInstigator) {
SetOpened(False);                                                           
}
event Trigger(Actor Other,Pawn EventInstigator) {
SetOpened(True);                                                            
}
function PostBeginPlay() {
local export editinline FSkill_EffectClass_AudioVisual_ColorModifier TransparentEffect;
SetOpened(bInitiallyOpen);                                                  
if (bAutoInvisibleEffect) {                                                 
TransparentEffect = FSkill_EffectClass_AudioVisual_ColorModifier(static.DynamicLoadObject("EffectsMiscGP.Transparent_Effect",Class'FSkill_EffectClass_AudioVisual_ColorModifier',True));
EnabledEffects[EnabledEffects.Length] = TransparentEffect;                
DisabledEffects[DisabledEffects.Length] = TransparentEffect;              
}
Super.PostBeginPlay();                                                      
}
*/
