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
    
    
    public class MatAction : MatObject
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="MatAction")]
        public InterpolationPoint IntPoint;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="MatAction")]
        public string Comment = string.Empty;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Time")]
        public float Duration;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Sub")]
        public List<MatSubAction> SubActions = new List<MatSubAction>();
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Path")]
        public bool bSmoothCorner;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Path")]
        public Vector StartControlPoint;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Path")]
        public Vector EndControlPoint;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Path")]
        public bool bConstantPathVelocity;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Path")]
        public float PathVelocity;
        
        public float PathLength;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public List<Vector> SampleLocations = new List<Vector>();
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float PctStarting;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float PctEnding;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float PctDuration;
        
        public MatAction()
        {
        }
    }
}
