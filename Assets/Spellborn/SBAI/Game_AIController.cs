using System;
using System.Collections.Generic;
using Engine;
using SBGame;
using UnityEngine;

namespace SBAI
{
#pragma warning disable 414   

    [Serializable] public class Game_AIController : Game_NPCController
    {
        public const float cSpawnInTimer = 2F;

        private MetaControllerManagerComponent mMetaControl;
        public MovementComponent mMovement;
        public TargetComponent mTargeting;
        public HormoneComponent mHypothalamus;
        public float ChaseRange;
        public float VisualRange;
        public float LineOfSightRange;
        public float ThreatRange;
        public float FollowRange;
        public float AggressionFactor;
        public float FearFactor;
        public float SocialFactor;
        public float BoredomFactor;
        public Vector HomeLocation;
        public NPC_Habitat Habitat;
        public AIPoint ControlPoint;
        private List<AITimerStruct> mTimer = new List<AITimerStruct>();
        public float mSpawnInTimer;
        public AIStateMachine mAbortedMachine;
        public AIStateMachine mStateMachine;
        [TypeProxyDefinition(TypeName = "AIStateMachine")]
        public TypeDescription mMachineClass;
        public byte mTickResult;
        [FieldConfig()]
        public bool bProfileStateMachines;
        [FieldConfig()]
        public bool bProfileMovementModes;
        public List<UObject> mPausers = new List<UObject>();
        public Game_Pawn mLastAttackPawn;
        public FSkill_EffectClass mLastAttackEffect;

        [Serializable] public struct AITimerStruct
        {
            public Actor Instigator;
            public float Time;
            public float Timeout;
            public NameProperty Tag;
        }

        public NPC_Taxonomy GetFaction()
        {
            return (Pawn as Game_Pawn).Character.GetFaction();
        }

        public float GetVisualRange()
        {
            return VisualRange;
        }

        public override void Initialize()
        {
            base.Initialize();
            mMetaControl = gameObject.AddComponent<MetaControllerManagerComponent>();
            mMovement = gameObject.AddComponent<MovementComponent>();
            mTargeting = gameObject.AddComponent<TargetComponent>();
            mHypothalamus = gameObject.AddComponent<HormoneComponent>();
        }

        void sv_InitAI()
        {
            if (mStateMachine == null && mMachineClass != null)
            {
                SetStateMachine(mMachineClass);
            }
            MetaControllerMessage(1);
            mSpawnInTimer = 2f;
        }

        AIStateMachine SetStateMachine(Type type)
        {
            if(mStateMachine != null)
            {
                Destroy(mStateMachine); //TODO check deinit steps
            }
            mStateMachine = gameObject.AddComponent(type)as AIStateMachine;
            return mStateMachine;
        }

        public bool MetaControllerMessage(byte aMessage, Actor aCollaborator = null,string aTag = "", object aContext = null, float aValue = 0, Vector aLocation = new Vector())
        {
            throw new NotImplementedException();
        }

        void SetControlPoint(AIPoint aControlPoint)
        {
            ControlPoint = aControlPoint;
        }

        AI_MetaController AddMetaController(AI_MetaController aMetaController)
        {
            throw new NotImplementedException();
        }

        void RemoveMetaController(AI_MetaController aMetaController)
        {
            throw new NotImplementedException();
        }

        bool HasMetaController(NPC_AI aController)
        {
            return mMetaControl.HasMetaController(aController);
        }

        bool SpawnedIn()
        {
            throw new NotImplementedException();
        }

        public void StateSignal(byte aSignal)
        {
            Debug.LogWarning("StateSignal not implemented", this);
        }

        bool sv_OnAttack(Game_Pawn aPawn, FSkill_EffectClass aEffect, bool WasNegativeEffect, float aValue)
        {
            if (SpawnedIn())
            {
                return true;
            }
            if (WasNegativeEffect)
            {
                mLastAttackPawn = aPawn;
                mLastAttackEffect = aEffect;
                if (!MetaControllerMessage(8, aPawn,"", aEffect, aValue))
                {
                    StateSignal(35);
                    return false;
                }
                return true;
            }
            if (!MetaControllerMessage(7, aPawn,"", aEffect, aValue))
            {
                StateSignal(36);
                return false;
            }
            return true;
        }

        protected override bool sv_OnDamage(Game_Pawn aEnemy, int aDamage)
        {
            if (!base.sv_OnDamage(aEnemy, aDamage))
            {
                if (SpawnedIn())
                {
                    return true;
                }
                if (!MetaControllerMessage(6, aEnemy, "", null, aDamage))
                {
                    return false;
                }
            }
            return true;
        }

        void sv_OnOwnerAggression()
        {
            StateSignal(39);
        }

        void sv_OnOwnerAttack(bool wasNegativeEffect)
        {
            if (wasNegativeEffect)
            {
                StateSignal(37);
            }
            else
            {
                StateSignal(38);
            }
        }

        void SetTimerTimeout(Actor aInstigator, string aTag, float aDuration)
        {
            AITimerStruct newTimer;
            newTimer.Instigator = aInstigator;
            newTimer.Tag = aTag;
            newTimer.Timeout = aDuration;
            newTimer.Time = 0;
            mTimer.Add(newTimer);
        }

        void RemoveTimer(string aTag)
        {
            for (var i = mTimer.Count; i-->0;)
            {
                if (mTimer[i].Tag == aTag)
                {
                    mTimer.RemoveAt(i);
                }
            }
        }

        public void Trigger(Actor aTrigger, Pawn anInstigator)
        {
            MetaControllerMessage(17, aTrigger,"", anInstigator);
        }

        public Vector GetHomeLocation()
        {
            return HomeLocation;
        }

        public bool SetHomeLocation(Vector aLocation, bool aForce = false) //TODO when does this return false?
        {
            Debug.LogWarning("SetHomeLocation not implemented", this);
            return false;
        }

        public void PauseAI(UObject aPauser)
        {
            if (!mPausers.Contains(aPauser)) mPausers.Add(aPauser);
        }

        public bool IsAIPaused()
        {
            return mPausers.Count > 0;
        }

        public bool IsAIPausedBy(UObject aPauser)
        {
            return mPausers.Contains(aPauser);
        }

        public void ContinueAI(UObject aPauser)
        {
            mPausers.Remove(aPauser);
        }

        public void SetLineOfSightRange(float aLineOfSightRange)
        {
            LineOfSightRange = aLineOfSightRange;
        }

        public void SetVisualRange(float aVisualRange)
        {
            VisualRange = aVisualRange;
        }

        public AIState GetActiveAIState()
        {
            return mStateMachine.mCurrentState;
        }

    }
}
/*
delegate bool FollowFunction(Actor aActor);

state PawnDead {
event cl_OnTick(float DeltaTime) {
cl_OnTick(DeltaTime);                                                   
Game_Pawn(Pawn).StopMoving();                                           
}
function BeginState() {
if (SBRole == 1) {                                                      
MetaControllerMessage(13,Pawn);                                       
Super.BeginState();                                                   
}
}
}
*/