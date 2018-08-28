using System;
using System.Collections.Generic;
using Engine;
using Sirenix.OdinInspector;
using UnityEngine;

namespace SBGame
{
    [Serializable]
    public class NPC_StatTable: Content_Type
    {
        [FoldoutGroup("Preview")]
        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public int PreviewLevel;

        [FoldoutGroup("Preview")]
        [FieldConst()]
        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public List<StatPreview> Preview = new List<StatPreview>();

        [FoldoutGroup("stat")]
        public int BasePoints;

        [FoldoutGroup("stat")]
        public int LevelPerPoints;

        [FoldoutGroup("stat")]
        public int PointsMultiplier;

        [Serializable]
        public struct StatPreview
        {
            public int B;
            public int M;
            public int F;
        }

        protected int PointsAtLevel(int aLevel)
        {
            return BasePoints + aLevel / LevelPerPoints;
        }

        public int GetFocus(int aLevel)
        {
            return aLevel; //guessed
        }

        public int GetMind(int aLevel)
        {
            return aLevel; //guessed
        }

        public int GetBody(int aLevel)
        {
            return aLevel; //guessed
        }

        public int GetHitpointsPerLevel(int aLevel)
        {
            return 10;
        }

        public int GetBaseHitpoints(int aLevel)
        {
            return 100;
        }
    }
}
/*
protected event MakePreview() {
local int i;
Preview.Length = PreviewLevel;                                              
i = 0;                                                                      
while (i < Preview.Length) {                                                
Preview[i].B = GetBody(i);                                                
Preview[i].M = GetMind(i);                                                
Preview[i].F = GetFocus(i);                                               
i++;                                                                      
}
}
*/
