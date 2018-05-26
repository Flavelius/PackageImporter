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
using Framework.Attributes;

namespace SBGame
{
    
    
    [System.Serializable] public class Appearance_MainWeapon : Appearance_Base
    {
        
        [FieldCategory(Category="MainWeapon")]
        public byte WeaponType;
        
        [FieldCategory(Category="MainWeapon")]
        public byte WeaponClassification;
        
        [FieldCategory(Category="MainWeapon")]
        public byte WeaponTracerType;
        
        [FieldCategory(Category="MainWeapon")]
        public Vector WeaponTracerBeginOffset;
        
        [FieldCategory(Category="MainWeapon")]
        public Vector WeaponTracerEndOffset;
        
        public Appearance_MainWeapon()
        {
        }
        
        public enum EWeaponTracerType
        {
            
            EWTT_Custom ,
            
            EWTT_NoTracer ,
            
            EWTT_Sword_sh ,
            
            EWTT_Sword_dh ,
            
            EWTT_Axe_sh ,
            
            EWTT_Axe_dh ,
            
            EWTT_Mace_sh ,
            
            EWTT_Mace_dh ,
            
            EWTT_Dag_sh ,
            
            EWTT_Pole_sh,
        }
        
        public enum EWeaponClassification
        {
            
            EWC_Undetermined ,
            
            EWC_Axe ,
            
            EWC_DoubleHandedAxe ,
            
            EWC_Sword ,
            
            EWC_DoubleHandedSword ,
            
            EWC_Mace ,
            
            EWC_DoubleHandedMace ,
            
            EWC_Hammer ,
            
            EWC_DoubleHandedHammer ,
            
            EWC_Dagger ,
            
            EWC_Bow ,
            
            EWC_Shields,
        }
        
        public enum EAppMainWeaponType
        {
            
            EMW_Undetermined ,
            
            EMW_SingleHanded ,
            
            EMW_DoubleHanded ,
            
            EMW_DualWielding ,
            
            EMW_Ranged,
        }
    }
}
/*
native function GetWeaponTracerBoneOffsets(out Vector StartBoneOffset,out Vector EndBoneOffset);
static native function string GetWeaponClassName(byte aClassification);
*/
