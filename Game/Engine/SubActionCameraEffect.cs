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


namespace Engine
{
    
    
    public class SubActionCameraEffect : MatSubAction
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SubActionCameraEffect")]
        public CameraEffect CameraEffect;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SubActionCameraEffect")]
        public float StartAlpha;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SubActionCameraEffect")]
        public float EndAlpha;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="SubActionCameraEffect")]
        public bool DisableAfterDuration;
        
        public SubActionCameraEffect()
        {
        }
    }
}
