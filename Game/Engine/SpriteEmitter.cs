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
    
    
    public class SpriteEmitter : ParticleEmitter
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Sprite")]
        public byte UseDirectionAs;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Sprite")]
        public Vector ProjectionNormal;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public Vector RealProjectionNormal;
        
        public SpriteEmitter()
        {
        }
        
        public enum EParticleDirectionUsage
        {
            
            PTDU_None ,
            
            PTDU_Up ,
            
            PTDU_Right ,
            
            PTDU_Forward ,
            
            PTDU_Normal ,
            
            PTDU_UpAndNormal ,
            
            PTDU_RightAndNormal ,
            
            PTDU_Scale,
        }
    }
}
