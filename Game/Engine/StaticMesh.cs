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
    
    
    public class StaticMesh : Primitive
    {

        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category = "")]
        [TCosReborn.Framework.Attributes.IgnoreFieldExtraction]
        public List<StaticMeshMaterial> Materials = new List<StaticMeshMaterial>();

        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="")]
        public bool AutoUnwrap;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="")]
        public bool UseSimpleLineCollision;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="")]
        public bool UseSimpleBoxCollision;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="")]
        public bool UseVertexColor;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="")]
        public bool UseSimpleKarmaCollision;
        
        public StaticMesh()
        {
        }

        public struct StaticMeshMaterial
        {
            public bool EnableCollision;
            public Material Material;
        }
    }
}
