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


namespace SBBase
{
    
    
    public class SBWorld : UObject
    {
        
        public int worldID;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public string WorldName = string.Empty;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public string WorldFile = string.Empty;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public Base_GameInfo GameInfo;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public SBWorldRules GameRules;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public byte WorldType;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public int InstanceMaxPlayers;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public int InstanceMaxInstances;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public int InstanceLingerTime;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public bool InstanceAutoDestroy;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public bool FreeToPlayAllowed;
        
        public List<SBRoute> ExitRoutes = new List<SBRoute>();
        
        public List<SBPortal> EntryPortals = new List<SBPortal>();
        
        public List<SBTravel> TravelNPCs = new List<SBTravel>();
        
        public string LoadingScreenTex = string.Empty;
        
        public string ExteriorMesh = string.Empty;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="world")]
        public float WorldWeight;
        
        public SBWorld()
        {
        }
        
        public enum eZoneWorldTypes
        {
            
            eZoneWorldTypes_RESERVED_0 ,
            
            ZWT_PERSISTENT ,
            
            ZWT_INSTANCED ,
            
            eZoneWorldTypes_RESERVED_3 ,
            
            ZWT_SUBINSTANCED,
        }
    }
}
