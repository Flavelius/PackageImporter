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
    
    
    public class IC_TokenItem : Item_Component
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="IC_TokenItem")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public int TokenRank;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="IC_TokenItem")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte SlotType;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="IC_TokenItem")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public int ForgePrice;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="IC_TokenItem")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public int ForgeReplacePrice;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="IC_TokenItem")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public int ForgeRemovePrice;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="IC_TokenItem")]
        public List<FSkill_EffectClass_Duff> EquipEffects = new List<FSkill_EffectClass_Duff>();
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="IC_TokenItem")]
        public List<FSkill_EffectClass_AudioVisual> WeaponTracers = new List<FSkill_EffectClass_AudioVisual>();
        
        public IC_TokenItem()
        {
        }
    }
}
/*
private final native function int sv_GetNextTokenHandle();
final event sv_StopToken(Game_Pawn aPawn,out int aHandle) {
local int Count;
if (aHandle != 0 && aPawn != None && aPawn.Skills != None) {                
Count = aPawn.Skills.sv_RemoveSpecialDuffEffect(aHandle);                 
aHandle = 0;                                                              
}
}
final event int sv_StartToken(Game_Pawn aPawn) {
local int Handle;
local int i;
if (aPawn != None && aPawn.Skills != None) {                                
Handle = sv_GetNextTokenHandle();                                         
i = 0;                                                                    
while (i < EquipEffects.Length) {                                         
aPawn.Skills.sv_AddSpecialDuffEffect(EquipEffects[i],0.00000000,Handle);
++i;                                                                    
}
}
return Handle;                                                              
}
*/
