using System;
using SBGame;
using Sirenix.OdinInspector;

namespace SBGamePlay
{
    [Serializable] public class NA_Static : NPC_Appearance
    {
        [FoldoutGroup("NA_Static")]
        public float Scale;

        [FoldoutGroup("NA_Static")]
        public bool Statue;

        [FoldoutGroup("NA_Static")]
        public bool Ghostly;

        [FoldoutGroup("NA_Static")]
        public float CollisionRadius;

        [FoldoutGroup("NA_Static")]
        public float CollisionHeight;

        [FoldoutGroup("NA_Static")]
        public float SkillRadius;

        protected override float GetSkillRadius()
        {
            return SkillRadius;
        }

        protected override float GetCollisionHeight()
        {
            return CollisionHeight;
        }

        protected override float GetCollisionRadius()
        {
            return CollisionRadius;
        }
    }
}
/*
function Game_Appearance CreateAppearance(Game_Pawn aPawn,export editinline Game_Appearance aAppearance,bool aShifting) {
local export editinline Game_StaticAppearance pawnAppearance;
aAppearance = ForceAppearanceClass(aPawn,aAppearance,Class'Game_StaticAppearance');
aAppearance = Super.CreateAppearance(aPawn,aAppearance,aShifting);          
pawnAppearance = Game_StaticAppearance(aAppearance);                        
pawnAppearance.StatMesh = StatMesh;                                         
pawnAppearance.SetScale(Scale);                                             
if (Statue) {                                                               
pawnAppearance.SetStatue(True);                                           
}
if (Ghostly) {                                                              
pawnAppearance.SetGhost(True);                                            
}
pawnAppearance.CollisionRadius = GetCollisionRadius();                      
pawnAppearance.CollisionHeight = GetCollisionHeight();                      
pawnAppearance.SkillRadius = GetSkillRadius();                              
return aAppearance;                                                         
}
*/