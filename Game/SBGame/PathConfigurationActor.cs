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
    
    
    public class PathConfigurationActor : Actor
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public bool mUseAccessmap;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public float mNoiseRatio;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public float mNoiseFactor;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public float mTrackerSpeed;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public int mLookAheadCount;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public int mMaxDepth;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public float mMinMoveDistance;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public float mReplanThreshold;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public float mMaxFailureDistance;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public float mRandomizationFactor;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public float mRandomDistance;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="PathConfigurationActor")]
        public float mFacingDistance;
        
        public PathConfigurationActor()
        {
        }
    }
}
