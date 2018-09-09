using System;
using SBBase;

namespace SBGame
{
    [Serializable]
    public abstract class Game_Character: Base_Component, IActorAddStream
    {

        public new Game_Pawn Outer { get { return base.Outer as Game_Pawn; } }

        [NonSerialized] public NPC_Taxonomy mFaction;
        [NonSerialized] public int mFactionId;
        [NonSerialized] public NPC_Taxonomy mOldFaction;

        public abstract void WriteAddStream(IPacketWriter writer);

        public virtual string GetGuildName()
        {
            return string.Empty;
        }

        public virtual string sv_GetName()
        {
            return "<Unknown>";
        }

        public virtual int GetMoney()
        {
            return 0;
        }

        public bool ShiftFaction(NPC_Taxonomy newFaction)
        {
            if (mFaction == newFaction)
            {
                return false;
            }
            UnshiftFaction();
            mOldFaction = mFaction;
            mFaction = newFaction;
            return true;
        }

        public bool UnshiftFaction()
        {
            if (IsShifted())
            {
                mFaction = mOldFaction;
                mOldFaction = null;
                return true;
            }
            return false;
        }

        public bool IsShifted()
        {
            throw new NotImplementedException();
        }

        public NPC_Taxonomy GetFaction()
        {
            return mFaction;
        }

        public void sv_SetFaction(NPC_Taxonomy aFaction)
        {
            mFaction = aFaction;
            if (mFaction != null)
            {
                mFactionId = aFaction.GetResourceId();
            }
            else
            {
                mFactionId = 0;
            }
            //sv2clrel_SetFaction_CallStub(mFactionId);                                   
        }

        public string cl_GetFullName()
        {
            if (Outer.Appearance.IsShifted())
            {
                return Outer.Appearance.GetShiftedNPCType().GetLongName();
            }
            return cl_GetBaseFullName();
        }

        string cl_GetBaseFullName()
        {
            return "<Unspecified character>";
        }
    }
}
/*
protected event cl_SetFaction(int aFactionId) {
mFactionId = aFactionId;                                                    
if (aFactionId != 0) {                                                      
mFaction = NPC_Taxonomy(Class'SBDBSync'.GetResourceObject(aFactionId));   
} else {                                                                    
mFaction = None;                                                          
}
}
protected native function sv2clrel_SetFaction_CallStub();
protected event sv2clrel_SetFaction(int aFactionId) {
cl_SetFaction(aFactionId);                                                  
}
final event string cl_GetName() {
if (Outer.Appearance.IsShifted()) {                                         
return Outer.Appearance.GetShiftedNPCType().GetShortName();               
} else {                                                                    
return cl_GetBaseName();                                                  
}
}
event string cl_GetBaseName() {
return "<Unknown>";                                                         
}

function cl_OnInit() {
Super.cl_OnInit();                                                          
if (mFaction == None) {                                                     
cl_SetFaction(mFactionId);                                                
}
}
*/
