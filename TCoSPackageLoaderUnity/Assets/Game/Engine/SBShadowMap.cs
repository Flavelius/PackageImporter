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

namespace Engine
{
#pragma warning disable 414   
    
    [System.Serializable] public class SBShadowMap : UObject
    {
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private float mMaxTraceDistance;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private float mProjWidth;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private float mProjHeight;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private Vector mFrustumOrigin;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private Vector mLocation;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private Rotator mRotation;
        
        [FieldConst()]
        private Light mLight;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private Matrix mWorldToCamera;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private Matrix mCameraToScreen;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private float mViewportScale;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private float mNearClippingPlane;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private float mFarClippingPlane;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private float mPCFRadiusInTexels;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private float mProjectorScale;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        private int mTextureInterface;
        
        [FieldConst()]
        [IgnoreFieldExtraction()]
        [FieldTransient()]
        [ArraySizeForExtraction(Size=6)]
        private int[] mCubemapFaces = new int[0];
        
        public SBShadowMap()
        {
        }
    }
}
