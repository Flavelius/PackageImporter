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
    
    
    public class MeshObject : UObject
    {
        
        public MeshObject()
        {
        }
        
        public enum EMeshSectionMethod
        {
            
            MSM_SmoothOnly ,
            
            MSM_RigidOnly ,
            
            MSM_Mixed ,
            
            MSM_SinglePiece ,
            
            MSM_ForcedRigid,
        }
        
        public enum EImpLightMode
        {
            
            ILM_Unlit ,
            
            ILM_PseudoShaded ,
            
            ILM_Uniform,
        }
        
        public enum EImpDrawMode
        {
            
            IDM_Normal ,
            
            IDM_Fading,
        }
        
        public enum EImpSpaceMode
        {
            
            ISM_Sprite ,
            
            ISM_Fixed ,
            
            ISM_PivotVertical ,
            
            ISM_PivotHorizontal,
        }
    }
}
