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
    
    
    public class RibbonEmitter : ParticleEmitter
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public float SampleRate;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public float DecayRate;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public int NumPoints;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public float RibbonWidth;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public byte GetPointAxisFrom;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public Vector AxisNormal;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public float MinSampleDist;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public float MinSampleDot;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public float PointOriginOffset;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonTexture")]
        public float RibbonTextureUScale;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonTexture")]
        public float RibbonTextureVScale;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonSheets")]
        public int NumSheets;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonSheets")]
        public List<float> SheetScale = new List<float>();
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonBones")]
        public Vector StartBoneOffset;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonBones")]
        public Vector EndBoneOffset;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonBones")]
        public NameProperty BoneNameStart;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonBones")]
        public NameProperty BoneNameEnd;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public List<RibbonPoint> RibbonPoints = new List<RibbonPoint>();
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public bool bSamplePoints;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public bool bDecayPoints;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public bool bDecayPointsWhenStopped;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Ribbon")]
        public bool bSyncDecayWhenKilled;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonTexture")]
        public bool bLengthBasedTextureU;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonSheets")]
        public bool bUseSheetScale;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonBones")]
        public bool bUseBones;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="RibbonBones")]
        public bool bUseBoneDistance;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float SampleTimer;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float DecayTimer;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float RealSampleRate;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public float RealDecayRate;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public int SheetsUsed;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public RibbonPoint LastSampledPoint;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public bool bKilled;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public bool bDecaying;
        
        public RibbonEmitter()
        {
        }
        
        public struct RibbonPoint
        {
            
            public Vector Location;
            
            public Vector AxisNormal;
            
            public float width;
        }
        
        public enum EGetPointAxis
        {
            
            PAXIS_OwnerX ,
            
            PAXIS_OwnerY ,
            
            PAXIS_OwnerZ ,
            
            PAXIS_BoneNormal ,
            
            PAXIS_StartBoneDirection ,
            
            PAXIS_AxisNormal,
        }
    }
}
