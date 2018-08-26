using System;
using System.Collections.Generic;
using Engine;
using Sirenix.OdinInspector;

namespace SBGame
{
    [Serializable]
    public class NPC_Group: Content_Type
    {
        [FoldoutGroup("Classes")]
        public List<GroupUnit> Units = new List<GroupUnit>();

        [FieldConst()]
        [TypeProxyDefinition(TypeName = "NPC_AI")]
        public TypeDescription GroupControllerType;

        [Serializable]
        public struct GroupUnit
        {
            public int Minimum;
            public int Maximum;
            public List<byte> RequestedClassTypes;
            public List<byte> ForbiddenClassTypes;
        }
    }
}