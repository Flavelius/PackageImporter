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
using Framework.Attributes;

namespace SBGamePlay
{
    
    
    [System.Serializable] public class Interaction_ChangeMesh : Interaction_Component
    {
        
        [FieldCategory(Category="Interaction_ChangeMesh")]
        [IgnoreFieldExtraction()]
        public StaticMesh Mesh;
        
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        public StaticMesh originalMesh;
        
        public Interaction_ChangeMesh()
        {
        }
    }
}
/*
function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
Super.ClOnStart(aOwner,aInstigator,aReverse);                               
if (aInstigator != None) {                                                  
if (!aReverse) {                                                          
originalMesh = aOwner.StaticMesh;                                       
aOwner.SetStaticMesh(Mesh);                                             
} else {                                                                  
aOwner.SetStaticMesh(originalMesh);                                     
}
}
}
function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
local InteractiveLevelElement ile;
Super.SvOnStart(aOwner,aInstigator,aReverse);                               
ile = InteractiveLevelElement(aOwner);                                      
if (ile != None) {                                                          
if (!aReverse) {                                                          
originalMesh = aOwner.StaticMesh;                                       
aOwner.SetStaticMesh(Mesh);                                             
ile.sv_StartClientSubAction();                                          
} else {                                                                  
aOwner.SetStaticMesh(originalMesh);                                     
ile.sv_StartClientSubAction();                                          
}
}
}
*/
