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
    
    
    public class FSkill_EffectClass_DirectState : FSkill_EffectClass_Direct
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="State")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public byte State;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="State")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public FSkill_ValueSpecifier Value;
        
        public FSkill_EffectClass_DirectState()
        {
        }
    }
}
/*
event cl_CombatMessage(export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
local string prefix;
local string Message;
prefix = Class'StringReferences'.default.EffectSourceText.Text;             
if (aDuffEvent != None) {                                                   
Message = Class'StringReferences'.default.EffectDirectStateDuffText.Text; 
} else {                                                                    
if (aTarget != None && aTarget.IsLocalPlayer()) {                         
Message = Class'StringReferences'.default.EffectDirectStateSelfText.Text;
} else {                                                                  
Message = Class'StringReferences'.default.EffectDirectStateTargetText.Text;
}
}
cl_CombatLogMessage(prefix,Message,aSkill,aDuffEvent,aSource,aTarget,aAmount,aAmount2,aAmount3);
if (aTarget != None) {                                                      
aTarget.cl_AddScrollingCombatTypeValue(State,aAmount);                    
}
CheckAutoTarget(aSource,aTarget);                                           
}
*/
