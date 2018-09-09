using System;
using System.Collections.Generic;
using SBBase;
using SBGame;

namespace SBAI
{
#pragma warning disable 414   

    [Serializable] public class MetaControllerManagerComponent : Base_Component
    {

        public new Game_AIController Outer { get { return base.Outer as Game_AIController; } }

        List<AI_MetaController> mMetaControllers = new List<AI_MetaController>();

        public int mControllerMessageMask1;

        public int mControllerMessageMask2;

        public bool HasMetaController(NPC_AI aController)
        {
            for (var i = 0; i < mMetaControllers.Count; i++)
            {
                if (aController == mMetaControllers[i])
                {
                    return true;
                }
            }
            return false;
        }

        public void RemoveMetaController(AI_MetaController aMetaController)
        {
            for (int i = 0; i < mMetaControllers.Count; i++)
            {
                if (mMetaControllers[i] == aMetaController)
                {
                    mMetaControllers.RemoveAt(i);
                    return;
                }
            }
        }

        public AI_MetaController AddMetaController(AI_MetaController aMetaController)
        {
            if (!mMetaControllers.Contains(aMetaController)) mMetaControllers.Add(aMetaController);
            return aMetaController;
        }

        protected void RecomputeControllerMask()
        {
            throw new NotImplementedException();
        }

        public bool WantMetaControllerMessage(byte aMessage)
        {
            throw new NotImplementedException();
        }
    }
}