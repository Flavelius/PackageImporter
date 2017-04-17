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
    
    
    public class SparkEmitter : ParticleEmitter
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Spark")]
        public Range LineSegmentsRange;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Spark")]
        public Range TimeBeforeVisibleRange;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="Spark")]
        public Range TimeBetweenSegmentsRange;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public List<ParticleSparkData> SparkData = new List<ParticleSparkData>();
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public VertexBuffer VertexBuffer;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public IndexBuffer IndexBuffer;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public int NumSegments;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public int VerticesPerParticle;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public int IndicesPerParticle;
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        public int PrimitivesPerParticle;
        
        public SparkEmitter()
        {
        }
        
        public struct ParticleSparkData
        {
            
            public float TimeBeforeVisible;
            
            public float TimeBetweenSegments;
            
            public Vector StartLocation;
            
            public Vector StartVelocity;
        }
    }
}
