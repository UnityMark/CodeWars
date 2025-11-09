
Shader "Stylized Toon"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Toggle(_USERIMLIGHT_ON)] _UseRimLight("UseRim Light", Float) = 0
		[Toggle(_USEOUTLINE_ON)] _UseOutline("UseOutline", Float) = 0
		[Toggle(_USESPECULAR_ON)] _UseSpecular("UseSpecular Highlights", Float) = 1
		_SpecColor("Specular Value", Color) = (1,1,1,0)
		_Thicnkess("Thickness", Range( 0 , 0.1)) = 0
		_AdaptiveThicnkess("Adaptive Thickness", Range( 0 , 1)) = 0
		[KeywordEnum(Normal,Position,UVBaked)] _OutlineType("Outline Type", Float) = 0
		[HDR]_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_Color("Color", Color) = (0.6792453,0.6792453,0.6792453,1)
		_SpecularFaloff("Specular Falloff", Range( 0 , 1)) = 0
		_LightRampOffset("Light Ramp Offset", Range( -1 , 1)) = 0
		_MainTex("Albedo Texture", 2D) = "white" {}
		[NoScaleOffset][SingleLineTexture]_LightRampTexture("Light Ramp Texture", 2D) = "white" {}
		_SideShineHardness("Side Shine Hardness", Range( 0 , 0.5)) = 0
		_BacklightHardness("Backlight Hardness", Range( 0 , 0.5)) = 0
		_StepOffset("Step Offset", Range( -0.5 , 0.5)) = 0
		[KeywordEnum(Step,DiffuseRamp,Posterize)] _UseLightRamp("Shading Mode", Float) = 0
		[HideInInspector]_RampDiffuseTextureLoaded("RampDiffuseTextureLoaded", Float) = 1
		[NoScaleOffset][SingleLineTexture]_DiffuseWarpNoise("Diffuse Warp Noise", 2D) = "white" {}
		[NoScaleOffset][SingleLineTexture]_SpecularMaskTexture("Specular Mask Texture", 2D) = "white" {}
		_SpecularMaskStrength("Specular Mask Strength", Range( 0 , 1)) = 0.1856417
		_WarpStrength("Warp Strength", Range( -1 , 1)) = 0
		_SpecularMaskScale("Specular Mask Tiling", Float) = 1
		_WarpTextureScale("UV Tiling", Float) = 1
		[Toggle]_UseDiffuseWarp("UseDiffuse Warp", Float) = 0
		[Toggle]_UseSpecularMask("UseSpecular Mask", Float) = 0
		[HDR]_RimColor("Rim Color", Color) = (1,1,1,0)
		_RimThickness("Rim Thickness", Range( 0 , 3)) = 1
		_RimPower("Rim Power", Range( 1 , 12)) = 2
		_RimSmoothness("Rim Smoothness", Range( 0 , 0.5)) = 0
		[Normal]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalMapStrength("Normal Map Strength", Float) = 1
		_SpecularPosterizeSteps("Specular Posterize Steps", Range( 0 , 15)) = 0
		_OutlineNoiseScale("Outline Noise Scale", Float) = 10
		_OutlineNoiseIntesity("Outline Noise Intensity", Range( 0 , 2)) = 1
		_OutlineDynamicSpeed("Outline Dynamic Speed", Range( 0 , 0.05)) = 0
		[Toggle(_USEDYNAMICOUTLINE_ON)] _UseDynamicOutline("Use Sketch Outline", Float) = 0
		[Toggle(_USEENVIRONMENTREFLETION_ON)] _UseEnvironmentRefletion("UseEnvironment Reflections", Float) = 0
		_Strength("Strength", Range( 0 , 1)) = 0
		[NoScaleOffset][SingleLineTexture]_SpecGlossMap("Specular Map", 2D) = "white" {}
		_Glossiness("Smoothness", Range( 0 , 1)) = 0.5
		_Cutoff("Alpha Clip Threshold", Range( 0 , 1)) = 0
		[HDR]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		[HDR][NoScaleOffset][SingleLineTexture]_EmissionMap("Emission Map", 2D) = "white" {}
		_UseEmission("UseEmission", Float) = 0
		_IndirectLightStrength("Indirect Light Strength", Range( 0 , 1)) = 1
		_SpecularShadowMask("Specular Shadow Mask", Range( 0 , 1)) = 0
		_WarpTextureRotation("UV Rotation", Range( 0 , 180)) = 0
		_SpecularMaskRotation("Specular Mask Rotation", Range( 0 , 180)) = 0
		_BacklightAmount("Backlight Amount", Range( 0 , 1)) = 0.5
		[Toggle]_UseShadows("Use Shadows", Float) = 1
		_BacklightIntensity("Backlight Intensity", Range( 0 , 4)) = 1
		[Toggle(_USEBACKLIGHT_ON)] _UseBacklight("Rim As Backlight & Side Shine", Float) = 0
		_SideShineIntensity("Side Shine Intensity", Range( 0 , 4)) = 1
		_SideShineAmount("Side Shine Amount", Range( 0 , 0.7)) = 0.2717647
		[NoScaleOffset][SingleLineTexture]_HalftoneTexture("Halftone Texture", 2D) = "white" {}
		_HalftoneSmoothness("Halftone Smoothness", Range( 0 , 2)) = 0.3
		_HalftoneEdgeOffset("Halftone Edge Offset", Range( -1 , 1)) = 0.1
		_HalftoneThreshold("Halftone Threshold", Range( 0 , 0.15)) = 0.1
		_HalftoneColor("Halftone Color", Color) = (0,0,0,1)
		[NoScaleOffset]_Hatch2("Hatch Texture Brighter", 2D) = "white" {}
		[NoScaleOffset]_Hatch1("Hatch Texture Darker", 2D) = "white" {}
		_MaxScaleDependingOnCamera("Max Scale Depends On Camera", Range( 1 , 10)) = 1
		[Toggle(_USEHATCHINGCONSTANTSCALE_ON)] _UseHatchingConstantScale("Hatching Constant Scale", Float) = 1
		[KeywordEnum(None,Haftone,Hatching)] _OverlayMode1("Overlay Mode", Float) = 0
		_ShapeSmoothness("Transition Smoothness", Range( 0 , 1)) = 0.2
		_OverlayRotation("UV Rotation", Range( 0 , 180)) = 0
		_OverlayUVTilling("UV Tiling", Float) = 0
		[Toggle(_USESCREENUVS_ON)] _UseScreenUvs("Screen Uvs", Float) = 0
		[Toggle(_USESCREENUVSSPECULAR_ON)] _UseScreenUvsSpecular("Screen Uvs", Float) = 0
		_Darken("Darken", Range( -1 , 1)) = 0
		_Lighten("Lighten", Range( -1 , 1)) = 0
		_AdditionalLightsSmoothnessMultiplier("Additional Lights Specular Size", Range( 0 , 2)) = 1
		_SmoothnessMultiplier("Main Specular Size", Range( 0 , 2)) = 1
		_AdditionalLightsIntesity("Additional Lights Intensity", Range( 0 , 6)) = 1
		[Toggle(_USEADDITIONALLIGHTSDIFFUSE_ON)] _UseAdditionalLightsDiffuse("UseAdditional Lights", Float) = 1
		_AdditionalLightsAmount("Additional Lights Size", Range( 0 , 1)) = 1
		_AdditionalLightsFaloff("Additional Lights Falloff", Range( 0 , 1)) = 1
		_HatchingColor("Hatching Color", Color) = (0,0,0,1)
		[KeywordEnum(None,Haftone,Hatching)] _OverlayMode("Overlay Mode", Float) = 0
		[Toggle(_USEPURESKETCH_ON)] _UsePureSketch("Pure Sketch", Float) = 1
		_UVAnimationSpeedWarp("UV Animation Speed", Range( 0 , 5)) = 0
		_UVAnimationSpeedSpec("UV Animation Speed", Range( 0 , 5)) = 0
		_UVAnimationSpeed("UV Animation Speed", Range( 0 , 5)) = 0
		_UVSrcrollAngleSpec("UV Scroll Angle", Range( 0 , 360)) = 0
		_UVSrcrollAngle("UV Scroll Angle", Range( 0 , 360)) = 0
		_UVSrcrollAngleWarp("UV Scroll Angle", Range( 0 , 360)) = 0
		_UVScrollSpeedWarp("UV Scroll Speed", Range( 0 , 0.1)) = 0
		_UVScrollSpeed("UV Scroll Speed", Range( 0 , 0.1)) = 0
		_UVScrollSpeedSpec("UV Scroll Speed", Range( 0 , 0.1)) = 0
		_DiffusePosterizeSteps("Posterize Steps", Range( 1 , 10)) = 3
		_DiffusePosterizePower("Posterize Power", Range( 0.5 , 3)) = 1
		_DiffusePosterizeOffset("Posterize Offset", Range( -0.5 , 0.5)) = 0
		_MainLightIntesity("Main Light Intensity", Range( 0 , 6)) = 1
		_OutlineTextureStrength("Texture Strength ", Range( 0 , 1)) = 0
		_ShadowColor("Shadow Color", Color) = (0,0,0,0)
		_HalftoneToonAffect("Toon Affect", Range( 0 , 1)) = 0
		_IndirectLightAffectOnHatch("Indirect Light Affect On Hatch", Range( 0 , 1)) = 0
		[Toggle(_USEDIFFUSEWARPASOVERLAY_ON)] _UseDiffuseWarpAsOverlay("Impact Shadows", Float) = 0
		[Toggle(_DIFFUSEWARPAFFECTHALFTONE_ON)] _DiffuseWarpAffectHalftone("Diffuse Warp Affect Halftone", Float) = 0
		_DiffuseWarpBrightnessOffset("Brightness Offset", Float) = 1.12
		[Toggle(_USESCREENUVSWARP_ON)] _UseScreenUvsWarp("Screen Uvs", Float) = 0
		[Toggle]_StepHalftoneTexture("Step Halftone Texture", Float) = 0
		_HaltonePatternSize("Halftone Pattern Size", Range( 0 , 1)) = 0
		_RimShadowColor("Rim Shadow Color", Color) = (0,0.05551431,0.9622642,0)
		[KeywordEnum(NoSplit,MultiplyWithDiffuse,UseSecondColor)] _RimSplitColor("Rim Split Color", Float) = 0
		_OcclusionMap("Occlusion Map", 2D) = "white" {}
		_OcclusionStrength("Occlusion Strength ", Range( 0 , 1)) = 1
		[Toggle(_USEADAPTIVESCREENUVS_ON)] _UseAdaptiveScreenUvs("Adaptive Screen Uvs", Float) = 0
		[Toggle(_USEADAPTIVEUVSSPECULAR_ON)] _UseAdaptiveUvsSpecular("Adaptive Screen Uvs", Float) = 0
		[Toggle(_USEADAPTIVESCREENUVSWARP_ON)] _UseAdaptiveScreenUvsWarp("Adaptive Screen Uvs ", Float) = 0
		[Toggle(_INVERSEMASK_ON)] _InverseMask("Inverse Mask", Float) = 0
		_PaperTilling("Paper Tiling", Float) = 1
		[NoScaleOffset]_PaperTexture("Paper Texture", 2D) = "white" {}


		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Unlit" }

		Cull Back
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			Name "ExtraPrePass"
			

			Blend One Zero
			Cull Front
			ZWrite On
			ZTest LEqual
			Offset 0,0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140011


			

			#pragma vertex vert
			#pragma fragment frag

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _USEOUTLINE_ON
			#pragma shader_feature_local _USEDYNAMICOUTLINE_ON
			#pragma shader_feature_local _OUTLINETYPE_NORMAL _OUTLINETYPE_POSITION _OUTLINETYPE_UVBAKED


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _RimShadowColor;
			float4 _HalftoneColor;
			float4 _RimColor;
			float4 _Color;
			float4 _EmissionColor;
			float4 _OcclusionMap_ST;
			float4 _SpecColor;
			float4 _HatchingColor;
			float4 _OutlineColor;
			float _SmoothnessMultiplier;
			float _UseSpecularMask;
			float _MainLightIntesity;
			float _StepHalftoneTexture;
			float _SpecularMaskScale;
			float _UVAnimationSpeedSpec;
			float _AdditionalLightsIntesity;
			float _UVScrollSpeedSpec;
			float _UVSrcrollAngleSpec;
			float _SpecularMaskRotation;
			float _HaltonePatternSize;
			float _SpecularMaskStrength;
			float _SpecularFaloff;
			float _RampDiffuseTextureLoaded;
			float _RimSmoothness;
			float _Strength;
			float _MaxScaleDependingOnCamera;
			float _Lighten;
			float _Darken;
			float _IndirectLightAffectOnHatch;
			float _UseEmission;
			float _SideShineAmount;
			float _SpecularShadowMask;
			float _SideShineHardness;
			float _BacklightAmount;
			float _BacklightHardness;
			float _BacklightIntensity;
			float _RimPower;
			float _RimThickness;
			float _SpecularPosterizeSteps;
			float _SideShineIntensity;
			float _AdditionalLightsSmoothnessMultiplier;
			float _UVAnimationSpeed;
			float _OverlayRotation;
			float _WarpStrength;
			float _WarpTextureRotation;
			float _UVAnimationSpeedWarp;
			float _UVSrcrollAngleWarp;
			float _UVScrollSpeedWarp;
			float _WarpTextureScale;
			float _UseDiffuseWarp;
			float _StepOffset;
			float _OcclusionStrength;
			float _OutlineTextureStrength;
			float _Thicnkess;
			float _OutlineNoiseIntesity;
			float _OutlineNoiseScale;
			float _OutlineDynamicSpeed;
			float _AdaptiveThicnkess;
			float _NormalMapStrength;
			float _Glossiness;
			float _UseShadows;
			float _LightRampOffset;
			float _PaperTilling;
			float _UVSrcrollAngle;
			float _UVScrollSpeed;
			float _OverlayUVTilling;
			float _HalftoneSmoothness;
			float _HalftoneEdgeOffset;
			float _HalftoneThreshold;
			float _ShapeSmoothness;
			float _HalftoneToonAffect;
			float _IndirectLightStrength;
			float _AdditionalLightsFaloff;
			float _AdditionalLightsAmount;
			float _DiffusePosterizeSteps;
			float _DiffusePosterizePower;
			float _DiffusePosterizeOffset;
			float _DiffuseWarpBrightnessOffset;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _OcclusionMap;


			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float lerpResult59 = lerp( 1.0 , distance( _WorldSpaceCameraPos , ase_worldPos ) , _AdaptiveThicnkess);
				#if defined( _OUTLINETYPE_NORMAL )
				float3 staticSwitch57 = v.normalOS;
				#elif defined( _OUTLINETYPE_POSITION )
				float3 staticSwitch57 = v.positionOS.xyz;
				#elif defined( _OUTLINETYPE_UVBAKED )
				float3 staticSwitch57 = float3( v.ase_texcoord3.xy ,  0.0 );
				#else
				float3 staticSwitch57 = v.normalOS;
				#endif
				float2 temp_cast_1 = (( ( _TimeParameters.x ) * _OutlineDynamicSpeed )).xx;
				float2 texCoord591 = v.ase_texcoord.xy * float2( 1,1 ) + temp_cast_1;
				float simplePerlin2D590 = snoise( texCoord591*_OutlineNoiseScale );
				simplePerlin2D590 = simplePerlin2D590*0.5 + 0.5;
				#ifdef _USEDYNAMICOUTLINE_ON
				float3 staticSwitch606 = ( ( simplePerlin2D590 * _OutlineNoiseIntesity ) * staticSwitch57 );
				#else
				float3 staticSwitch606 = staticSwitch57;
				#endif
				#ifdef _USEOUTLINE_ON
				float3 staticSwitch365 = ( lerpResult59 * ( staticSwitch606 * _Thicnkess ) );
				#else
				float3 staticSwitch365 = float3( 0,0,0 );
				#endif
				
				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch365;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				#ifdef ASE_FOG
					o.fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_OcclusionMap = IN.ase_texcoord4.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				float4 tex2DNode362 = tex2D( _MainTex, uv_OcclusionMap );
				float4 lerpResult1448 = lerp( float4( 1,1,1,0 ) , tex2DNode362 , _OutlineTextureStrength);
				
				float lerpResult1655 = lerp( 1.0 , tex2D( _OcclusionMap, uv_OcclusionMap ).r , _OcclusionStrength);
				float4 appendResult1656 = (float4(lerpResult1655 , lerpResult1655 , lerpResult1655 , 1.0));
				float4 MainTexture364 = ( _Color * tex2DNode362 * appendResult1656 );
				float temp_output_673_0 = ( MainTexture364.a * 1.0 );
				#ifdef _USEOUTLINE_ON
				float staticSwitch1349 = temp_output_673_0;
				#else
				float staticSwitch1349 = -2.0;
				#endif
				

				float3 Color = ( _OutlineColor * lerpResult1448 ).rgb;
				float Alpha = staticSwitch1349;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140011


			

			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3

			

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_UNLIT

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _OVERLAYMODE_NONE _OVERLAYMODE_HAFTONE _OVERLAYMODE_HATCHING
			#pragma shader_feature_local _USELIGHTRAMP_STEP _USELIGHTRAMP_DIFFUSERAMP _USELIGHTRAMP_POSTERIZE
			#pragma shader_feature_local _USESCREENUVSWARP_ON
			#pragma shader_feature_local _USEADAPTIVESCREENUVSWARP_ON
			#pragma shader_feature_local _USEDIFFUSEWARPASOVERLAY_ON
			#pragma shader_feature_local _USEADDITIONALLIGHTSDIFFUSE_ON
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma shader_feature_local _DIFFUSEWARPAFFECTHALFTONE_ON
			#pragma shader_feature_local _USESCREENUVS_ON
			#pragma shader_feature_local _USEADAPTIVESCREENUVS_ON
			#pragma shader_feature_local _USESPECULAR_ON
			#pragma shader_feature_local _INVERSEMASK_ON
			#pragma shader_feature_local _USESCREENUVSSPECULAR_ON
			#pragma shader_feature_local _USEADAPTIVEUVSSPECULAR_ON
			#pragma shader_feature_local _OVERLAYMODE1_NONE _OVERLAYMODE1_HAFTONE _OVERLAYMODE1_HATCHING
			#pragma shader_feature_local _USEENVIRONMENTREFLETION_ON
			#pragma shader_feature_local _RIMSPLITCOLOR_NOSPLIT _RIMSPLITCOLOR_MULTIPLYWITHDIFFUSE _RIMSPLITCOLOR_USESECONDCOLOR
			#pragma shader_feature_local _USERIMLIGHT_ON
			#pragma shader_feature_local _USEBACKLIGHT_ON
			#pragma shader_feature_local _USEPURESKETCH_ON
			#pragma shader_feature_local _USEHATCHINGCONSTANTSCALE_ON
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _FORWARD_PLUS


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 lightmapUVOrVertexSH : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _RimShadowColor;
			float4 _HalftoneColor;
			float4 _RimColor;
			float4 _Color;
			float4 _EmissionColor;
			float4 _OcclusionMap_ST;
			float4 _SpecColor;
			float4 _HatchingColor;
			float4 _OutlineColor;
			float _SmoothnessMultiplier;
			float _UseSpecularMask;
			float _MainLightIntesity;
			float _StepHalftoneTexture;
			float _SpecularMaskScale;
			float _UVAnimationSpeedSpec;
			float _AdditionalLightsIntesity;
			float _UVScrollSpeedSpec;
			float _UVSrcrollAngleSpec;
			float _SpecularMaskRotation;
			float _HaltonePatternSize;
			float _SpecularMaskStrength;
			float _SpecularFaloff;
			float _RampDiffuseTextureLoaded;
			float _RimSmoothness;
			float _Strength;
			float _MaxScaleDependingOnCamera;
			float _Lighten;
			float _Darken;
			float _IndirectLightAffectOnHatch;
			float _UseEmission;
			float _SideShineAmount;
			float _SpecularShadowMask;
			float _SideShineHardness;
			float _BacklightAmount;
			float _BacklightHardness;
			float _BacklightIntensity;
			float _RimPower;
			float _RimThickness;
			float _SpecularPosterizeSteps;
			float _SideShineIntensity;
			float _AdditionalLightsSmoothnessMultiplier;
			float _UVAnimationSpeed;
			float _OverlayRotation;
			float _WarpStrength;
			float _WarpTextureRotation;
			float _UVAnimationSpeedWarp;
			float _UVSrcrollAngleWarp;
			float _UVScrollSpeedWarp;
			float _WarpTextureScale;
			float _UseDiffuseWarp;
			float _StepOffset;
			float _OcclusionStrength;
			float _OutlineTextureStrength;
			float _Thicnkess;
			float _OutlineNoiseIntesity;
			float _OutlineNoiseScale;
			float _OutlineDynamicSpeed;
			float _AdaptiveThicnkess;
			float _NormalMapStrength;
			float _Glossiness;
			float _UseShadows;
			float _LightRampOffset;
			float _PaperTilling;
			float _UVSrcrollAngle;
			float _UVScrollSpeed;
			float _OverlayUVTilling;
			float _HalftoneSmoothness;
			float _HalftoneEdgeOffset;
			float _HalftoneThreshold;
			float _ShapeSmoothness;
			float _HalftoneToonAffect;
			float _IndirectLightStrength;
			float _AdditionalLightsFaloff;
			float _AdditionalLightsAmount;
			float _DiffusePosterizeSteps;
			float _DiffusePosterizePower;
			float _DiffusePosterizeOffset;
			float _DiffuseWarpBrightnessOffset;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _DiffuseWarpNoise;
			sampler2D _BumpMap;
			sampler2D _OcclusionMap;
			sampler2D _LightRampTexture;
			sampler2D _MainTex;
			sampler2D _HalftoneTexture;
			sampler2D _SpecGlossMap;
			sampler2D _SpecularMaskTexture;
			sampler2D _EmissionMap;
			sampler2D _Hatch1;
			sampler2D _Hatch2;
			sampler2D _PaperTexture;


			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			float Posterize1331( float In, float Steps )
			{
				return  floor(In / (1 / Steps)) * (1 / Steps);
			}
			
			float4 Shadowmask1831(  )
			{
				 float2 lightmapUV;
				    OUTPUT_LIGHTMAP_UV(LightmapUV, unity_LightmapST, lightmapUV);
				return SAMPLE_SHADOWMASK(lightmapUV);
			}
			
			float3 AdditionalLight( float3 WorldPosition, float3 WorldNormal, float3 LightWrapVector, float SMin, float SMax, float Faloff, float4 shadowmask, float2 ScreenUV )
			{
				float3 Color = 0;
					
					
				#define SUM_LIGHT(Light)\
						float3 DotVector = dot(light.direction,WorldNormal);	\
					half3 AttLightColor = (light.shadowAttenuation * light.distanceAttenuation);\
					 float3 colout = max(float3(0.f,0.f,0.f),LightWrapVector + (1-LightWrapVector) * DotVector )*AttLightColor*light.color; \
					float maxColor = max(colout.r,max(colout.g,colout.b));\
					float3 outColor = smoothstep(SMin,SMax,maxColor)*light.color;\
					 Color += outColor;
					InputData inputData = (InputData)0;
					inputData.normalizedScreenSpaceUV = ScreenUV;
					inputData.positionWS = WorldPosition;
					uint meshRenderingLayers = GetMeshRenderingLayer();
					uint pixelLightCount = GetAdditionalLightsCount();
					#if USE_FORWARD_PLUS
					for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
					{
						FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK
						Light light = GetAdditionalLight(lightIndex, WorldPosition,shadowmask);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition,shadowmask);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHT( light );
						}
					LIGHT_LOOP_END
				return Color;
			}
			
			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			
			float3 AdditionalLightsSpecularMy( float3 WorldPosition, float3 WorldNormal, float3 WorldView, float3 SpecColor, float Smoothness, float Steps, float SpecFaloff )
			{
				float3 Color = 0;
				Smoothness = exp2(10 * Smoothness + 1);
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
					
							#if VERSION_GREATER_EQUAL(10, 1)
							Light light = GetAdditionalLight(i, WorldPosition, half4(1,1,1,1));
							// see AdditionalLights_float for explanation of this
						#else
							Light light = GetAdditionalLight(i, WorldPosition);
						#endif
					
					half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation);
					Color += LightingSpecular(AttLightColor, light.direction, WorldNormal, WorldView, half4(SpecColor, 0), Smoothness);	
				}
				float IN = max(Color.b,max(Color.r,Color.g));
				float minOut = 0.5 * SpecFaloff - 0.005;
				float faloff = lerp(IN, smoothstep(minOut, 0.5, IN), SpecFaloff);
				if(Steps < 1)
				{
				    return Color *faloff;
				}
				else
				{
				    return  Color *floor(faloff / (1 / Steps)) * (1 / Steps);
				}
			}
			
			float FaloffPosterize( float IN, float SpecFaloff, float Steps )
			{
				float minOut = 0.5 * SpecFaloff - 0.005;
				float faloff = lerp(IN, smoothstep(minOut, 0.5, IN), SpecFaloff);
				if(Steps < 1)
				{
				    return faloff;
				}
				else
				{
				    return  floor(faloff / (1 / Steps)) * (1 / Steps);
				}
			}
			
			float3 Hatching476( float2 _uv, float color, sampler2D _Hatch0, sampler2D _Hatch1 )
			{
				float intensity = color;
				    float3 hatch0 = tex2D(_Hatch0, _uv).rgb;
				    float3 hatch1 = tex2D(_Hatch1, _uv).rgb;
				    float3 overbright = max(0, intensity - 1.0);
				    float3 weightsA = saturate((intensity * 6.0) + float3(-0, -1, -2));
				    float3 weightsB = saturate((intensity * 6.0) + float3(-3, -4, -5));
				    weightsA.xy -= weightsA.yz;
				    weightsA.z -= weightsB.x;
				    weightsB.xy -= weightsB.yz;
				    hatch0 = hatch0 * weightsA;
				    hatch1 = hatch1 * weightsB;
				    float3 hatching = overbright + hatch0.r +
				        hatch0.g + hatch0.b +
				        hatch1.r + hatch1.g +
				        hatch1.b;
				    return hatching;
				    return hatching;
			}
			
			float3 HatchingConstantScale491( float2 _uv, float _intensity, sampler2D _Hatch0, sampler2D _Hatch1, float _dist, float _MaxScaleDependingOnCamera )
			{
					float log2_dist = log2(_dist)-0.2;
					
					float2 floored_log_dist = floor( (log2_dist + float2(0.0, 1.0) ) * 0.5) *2.0 - float2(0.0, 1.0);				
					float2 uv_scale = min(_MaxScaleDependingOnCamera, pow(2.0, floored_log_dist));
					
					float uv_blend = abs(frac(log2_dist * 0.5) * 2.0 - 1.0);
					
					float2 scaledUVA = _uv / uv_scale.x; // 16
					float2 scaledUVB = _uv / uv_scale.y; // 8 
					float3 hatch0A = tex2D(_Hatch0, scaledUVA).rgb;
					float3 hatch1A = tex2D(_Hatch1, scaledUVA).rgb;
					float3 hatch0B = tex2D(_Hatch0, scaledUVB).rgb;
					float3 hatch1B = tex2D(_Hatch1, scaledUVB).rgb;
					float3 hatch0 = lerp(hatch0A, hatch0B, uv_blend);
					float3 hatch1 = lerp(hatch1A, hatch1B, uv_blend);
					float3 overbright = max(0, _intensity - 1.0);
					float3 weightsA = saturate((_intensity * 6.0) + float3(-0, -1, -2));
					float3 weightsB = saturate((_intensity * 6.0) + float3(-3, -4, -5));
					weightsA.xy -= weightsA.yz;
					weightsA.z -= weightsB.x;
					weightsB.xy -= weightsB.yz;
					hatch0 = hatch0 * weightsA;
					hatch1 = hatch1 * weightsB;
					float3 hatching = overbright + hatch0.r +
						hatch0.g + hatch0.b +
						hatch1.r + hatch1.g +
						hatch1.b;
					return hatching;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord6.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord7.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( ase_worldNormal, o.lightmapUVOrVertexSH.xyz );
				
				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				o.ase_texcoord5 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#ifdef ASE_FOG
					o.fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_tangent = v.ase_tangent;
				o.texcoord1 = v.texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
				#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
				#endif
				 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float temp_output_371_0 = ( _StepOffset + 0.5 );
				float2 temp_cast_0 = (_WarpTextureScale).xx;
				float mulTime1523 = _TimeParameters.x * _UVScrollSpeedWarp;
				float temp_output_1518_0 = radians( _UVSrcrollAngleWarp );
				float2 appendResult1520 = (float2(cos( temp_output_1518_0 ) , sin( temp_output_1518_0 )));
				float2 temp_output_1522_0 = ( mulTime1523 * appendResult1520 );
				float2 texCoord1495 = IN.ase_texcoord4.xy * temp_cast_0 + temp_output_1522_0;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ScreenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 appendResult1847 = (float2(( _WarpTextureScale * ( _ScreenParams.x / _ScreenParams.y ) ) , _WarpTextureScale));
				float4 unityObjectToClipPos2_g211 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord5.xyz));
				float4 computeScreenPos3_g211 = ComputeScreenPos( unityObjectToClipPos2_g211 );
				float temp_output_29_0_g211 = ( _WarpTextureScale / 4.0 );
				float4 unityObjectToClipPos13_g211 = TransformWorldToHClip(TransformObjectToWorld(float3(0,0,0)));
				float4 computeScreenPos17_g211 = ComputeScreenPos( unityObjectToClipPos13_g211 );
				float4 transform20_g211 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float4 break22_g211 = ( ( ( ( computeScreenPos3_g211 / (computeScreenPos3_g211).w ) * temp_output_29_0_g211 ) - ( temp_output_29_0_g211 * ( computeScreenPos17_g211 / (computeScreenPos17_g211).w ) ) ) * distance( ( float4( _WorldSpaceCameraPos , 0.0 ) - transform20_g211 ) , float4( 0,0,0,0 ) ) );
				float4 break26_g211 = _ScreenParams;
				float4 appendResult24_g211 = (float4(( break22_g211.x * ( break26_g211.x / break26_g211.y ) ) , break22_g211.y , break22_g211.z , break22_g211.w));
				#ifdef _USEADAPTIVESCREENUVSWARP_ON
				float4 staticSwitch1664 = appendResult24_g211;
				#else
				float4 staticSwitch1664 = ( ase_grabScreenPosNorm * float4( appendResult1847, 0.0 , 0.0 ) );
				#endif
				float mulTime1525 = _TimeParameters.x * _UVAnimationSpeedWarp;
				float temp_output_1527_0 = ( floor( ( mulTime1525 % 2.0 ) ) * 0.5 );
				float2 appendResult1531 = (float2(temp_output_1527_0 , temp_output_1527_0));
				#ifdef _USESCREENUVSWARP_ON
				float4 staticSwitch1514 = ( staticSwitch1664 + float4( appendResult1531, 0.0 , 0.0 ) + float4( temp_output_1522_0, 0.0 , 0.0 ) );
				#else
				float4 staticSwitch1514 = float4( texCoord1495, 0.0 , 0.0 );
				#endif
				float cos1489 = cos( radians( _WarpTextureRotation ) );
				float sin1489 = sin( radians( _WarpTextureRotation ) );
				float2 rotator1489 = mul( staticSwitch1514.xy - float2( 0.5,0.5 ) , float2x2( cos1489 , -sin1489 , sin1489 , cos1489 )) + float2( 0.5,0.5 );
				float BNLightWarpVector250 = ( _UseDiffuseWarp == 1.0 ? ( tex2D( _DiffuseWarpNoise, rotator1489 ).r * _WarpStrength ) : 0.0 );
				float2 uv_OcclusionMap = IN.ase_texcoord4.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				float3 lerpResult1536 = lerp( float3(0,0,1) , UnpackNormalScale( tex2D( _BumpMap, uv_OcclusionMap ), 1.0f ) , _NormalMapStrength);
				float3 ase_worldTangent = IN.ase_texcoord6.xyz;
				float3 ase_worldNormal = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal1537 = lerpResult1536;
				float3 worldNormal1537 = normalize( float3(dot(tanToWorld0,tanNormal1537), dot(tanToWorld1,tanNormal1537), dot(tanToWorld2,tanNormal1537)) );
				float3 BNCurrentNormal1538 = worldNormal1537;
				float dotResult234 = dot( BNCurrentNormal1538 , _MainLightPosition.xyz );
				float BNNDotL233 = dotResult234;
				float3 temp_cast_7 = (( BNLightWarpVector250 + ( ( 1.0 - BNLightWarpVector250 ) * BNNDotL233 ) )).xxx;
				float localLightAttenuation1412 = ( 0.0 );
				float3 WorldPos1412 = WorldPosition;
				float DistanceAtten1412 = 0;
				float ShadowAtten1412 = 0;
				{
				    #if SHADOWS_SCREEN
				        half4 clipPos = TransformWorldToHClip(WorldPos1412);
				        half4 shadowCoord = ComputeScreenPos(clipPos);
				    #else
				        half4 shadowCoord = TransformWorldToShadowCoord(WorldPos1412);
				    #endif
				    Light mainLight = GetMainLight(shadowCoord);
				    DistanceAtten1412 = mainLight.distanceAttenuation;
				    ShadowAtten1412 = mainLight.shadowAttenuation;
				}
				float3 BNAttenuationColor244 = ( ase_lightColor.rgb * DistanceAtten1412 );
				float3 temp_output_260_0 = ( max( temp_cast_7 , float3(0,0,0) ) * BNAttenuationColor244 );
				float3 break3_g205 = temp_output_260_0;
				float temp_output_1188_0 = max( max( break3_g205.x , break3_g205.y ) , break3_g205.z );
				float smoothstepResult444 = smoothstep( ( temp_output_371_0 - 0.009 ) , temp_output_371_0 , temp_output_1188_0);
				float4 lerpResult1619 = lerp( _ShadowColor , ase_lightColor , saturate( smoothstepResult444 ));
				float4 temp_cast_8 = (ShadowAtten1412).xxxx;
				float4 ShadowAtten1415 = ( 1.0 == _UseShadows ? temp_cast_8 : float4(1,1,1,1) );
				#ifdef _USEDIFFUSEWARPASOVERLAY_ON
				float4 staticSwitch1470 = saturate( ( ShadowAtten1415 + BNLightWarpVector250 + ( _DiffuseWarpBrightnessOffset * float4( -1,0,0,0 ) * ( 1.0 - ShadowAtten1415 ) ) ) );
				#else
				float4 staticSwitch1470 = ShadowAtten1415;
				#endif
				float4 lerpResult1626 = lerp( _ShadowColor , lerpResult1619 , staticSwitch1470);
				float2 appendResult356 = (float2(( _LightRampOffset + temp_output_1188_0 ) , 0.0));
				float2 temp_cast_10 = (0.01).xx;
				float2 temp_cast_11 = (0.98).xx;
				float2 clampResult358 = clamp( appendResult356 , temp_cast_10 , temp_cast_11 );
				float4 lerpResult1617 = lerp( tex2D( _LightRampTexture, float2( 0.02,0 ) ) , ( tex2D( _LightRampTexture, clampResult358 ) * ase_lightColor ) , staticSwitch1470);
				float In1331 = pow( saturate( ( temp_output_1188_0 + ( _DiffusePosterizeOffset * -1.0 ) ) ) , _DiffusePosterizePower );
				float Steps1331 = round( _DiffusePosterizeSteps );
				float localPosterize1331 = Posterize1331( In1331 , Steps1331 );
				float4 lerpResult1629 = lerp( _ShadowColor , ase_lightColor , localPosterize1331);
				float4 lerpResult1628 = lerp( _ShadowColor , lerpResult1629 , staticSwitch1470);
				#if defined( _USELIGHTRAMP_STEP )
				float4 staticSwitch372 = lerpResult1626;
				#elif defined( _USELIGHTRAMP_DIFFUSERAMP )
				float4 staticSwitch372 = lerpResult1617;
				#elif defined( _USELIGHTRAMP_POSTERIZE )
				float4 staticSwitch372 = lerpResult1628;
				#else
				float4 staticSwitch372 = lerpResult1626;
				#endif
				float3 WorldPosition1181 = WorldPosition;
				float3 WorldNormal1181 = BNCurrentNormal1538;
				float3 temp_cast_14 = (BNLightWarpVector250).xxx;
				float3 LightWrapVector1181 = temp_cast_14;
				float temp_output_1203_0 = ( 1.0 - ( (2.0 + (_AdditionalLightsAmount - 0.0) * (2.9 - 2.0) / (1.0 - 0.0)) + -2.0 ) );
				float temp_output_1241_0 = ( ( temp_output_1203_0 * _AdditionalLightsFaloff ) - 0.005 );
				float SMin1181 = temp_output_1241_0;
				float SMax1181 = temp_output_1203_0;
				float Faloff1181 = 0.0;
				float4 localShadowmask1831 = Shadowmask1831();
				float4 Shadowmask1839 = localShadowmask1831;
				float4 shadowmask1181 = Shadowmask1839;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV1181 = (ase_screenPosNorm).xy;
				float3 localAdditionalLight1181 = AdditionalLight( WorldPosition1181 , WorldNormal1181 , LightWrapVector1181 , SMin1181 , SMax1181 , Faloff1181 , shadowmask1181 , ScreenUV1181 );
				#ifdef _USEADDITIONALLIGHTSDIFFUSE_ON
				float3 staticSwitch1143 = localAdditionalLight1181;
				#else
				float3 staticSwitch1143 = float3( 0,0,0 );
				#endif
				float3 AdditionalLightsDiffuse1144 = staticSwitch1143;
				float4 BNDiffuse391 = ( staticSwitch372 + float4( AdditionalLightsDiffuse1144 , 0.0 ) );
				#if defined( _OVERLAYMODE_NONE )
				float4 staticSwitch1266 = BNDiffuse391;
				#elif defined( _OVERLAYMODE_HAFTONE )
				float4 staticSwitch1266 = BNDiffuse391;
				#elif defined( _OVERLAYMODE_HATCHING )
				float4 staticSwitch1266 = BNDiffuse391;
				#else
				float4 staticSwitch1266 = BNDiffuse391;
				#endif
				float4 tex2DNode362 = tex2D( _MainTex, uv_OcclusionMap );
				float lerpResult1655 = lerp( 1.0 , tex2D( _OcclusionMap, uv_OcclusionMap ).r , _OcclusionStrength);
				float4 appendResult1656 = (float4(lerpResult1655 , lerpResult1655 , lerpResult1655 , 1.0));
				float4 MainTexture364 = ( _Color * tex2DNode362 * appendResult1656 );
				float3 bakedGI276 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, BNCurrentNormal1538);
				Light ase_mainLight = GetMainLight( ShadowCoords );
				MixRealtimeAndBakedGI(ase_mainLight, BNCurrentNormal1538, bakedGI276, half4(0,0,0,0));
				float IndirectLightStrength1221 = _IndirectLightStrength;
				float3 lerpResult692 = lerp( float3( 0,0,0 ) , bakedGI276 , IndirectLightStrength1221);
				float4 IndirectDiffuseLight1269 = ( MainTexture364 * float4( lerpResult692 , 0.0 ) );
				float4 BNFinalDiffuse239 = ( ( staticSwitch1266 * MainTexture364 ) + IndirectDiffuseLight1269 );
				float4 BNDiffuseNoAdditionalLights1554 = staticSwitch372;
				float4 lerpResult1462 = lerp( ase_lightColor , BNDiffuseNoAdditionalLights1554 , _HalftoneToonAffect);
				float4 temp_output_1225_0 = ( ( lerpResult1462 + float4( AdditionalLightsDiffuse1144 , 0.0 ) ) * MainTexture364 );
				float4 lerpResult1784 = lerp( temp_output_1225_0 , _HalftoneColor , _HalftoneColor.a);
				float3 break3_g210 = AdditionalLightsDiffuse1144;
				float3 temp_cast_20 = (BNNDotL233).xxx;
				float3 temp_cast_23 = (( BNLightWarpVector250 + ( ( 1.0 - BNLightWarpVector250 ) * BNNDotL233 ) )).xxx;
				#ifdef _DIFFUSEWARPAFFECTHALFTONE_ON
				float4 staticSwitch1498 = ( float4( temp_output_260_0 , 0.0 ) * ShadowAtten1415 );
				#else
				float4 staticSwitch1498 = ( float4( max( temp_cast_20 , float3(0,0,0) ) , 0.0 ) * float4( BNAttenuationColor244 , 0.0 ) * ShadowAtten1415 );
				#endif
				float4 CompleteDiffuseLight965 = ( max( max( break3_g210.x , break3_g210.y ) , break3_g210.z ) + staticSwitch1498 );
				float3 break3_g209 = CompleteDiffuseLight965.xyz;
				float smoothstepResult525 = smoothstep( _HalftoneEdgeOffset , ( _HalftoneEdgeOffset + _HalftoneSmoothness ) , max( max( break3_g209.x , break3_g209.y ) , break3_g209.z ));
				float2 temp_cast_26 = (_OverlayUVTilling).xx;
				float mulTime1287 = _TimeParameters.x * _UVScrollSpeed;
				float temp_output_1293_0 = radians( _UVSrcrollAngle );
				float2 appendResult1294 = (float2(cos( temp_output_1293_0 ) , sin( temp_output_1293_0 )));
				float2 temp_output_1288_0 = ( mulTime1287 * appendResult1294 );
				float2 texCoord478 = IN.ase_texcoord4.xy * temp_cast_26 + temp_output_1288_0;
				float2 appendResult1849 = (float2(( _OverlayUVTilling * ( _ScreenParams.x / _ScreenParams.y ) ) , _OverlayUVTilling));
				float4 unityObjectToClipPos2_g203 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord5.xyz));
				float4 computeScreenPos3_g203 = ComputeScreenPos( unityObjectToClipPos2_g203 );
				float temp_output_29_0_g203 = ( _OverlayUVTilling / 4.0 );
				float4 unityObjectToClipPos13_g203 = TransformWorldToHClip(TransformObjectToWorld(float3(0,0,0)));
				float4 computeScreenPos17_g203 = ComputeScreenPos( unityObjectToClipPos13_g203 );
				float4 transform20_g203 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float4 break22_g203 = ( ( ( ( computeScreenPos3_g203 / (computeScreenPos3_g203).w ) * temp_output_29_0_g203 ) - ( temp_output_29_0_g203 * ( computeScreenPos17_g203 / (computeScreenPos17_g203).w ) ) ) * distance( ( float4( _WorldSpaceCameraPos , 0.0 ) - transform20_g203 ) , float4( 0,0,0,0 ) ) );
				float4 break26_g203 = _ScreenParams;
				float4 appendResult24_g203 = (float4(( break22_g203.x * ( break26_g203.x / break26_g203.y ) ) , break22_g203.y , break22_g203.z , break22_g203.w));
				#ifdef _USEADAPTIVESCREENUVS_ON
				float4 staticSwitch1661 = appendResult24_g203;
				#else
				float4 staticSwitch1661 = ( float4( appendResult1849, 0.0 , 0.0 ) * ase_grabScreenPosNorm );
				#endif
				float mulTime1278 = _TimeParameters.x * _UVAnimationSpeed;
				float temp_output_1281_0 = ( floor( ( mulTime1278 % 2.0 ) ) * 0.5 );
				#if defined( _OVERLAYMODE_NONE )
				float staticSwitch1277 = 0.0;
				#elif defined( _OVERLAYMODE_HAFTONE )
				float staticSwitch1277 = temp_output_1281_0;
				#elif defined( _OVERLAYMODE_HATCHING )
				float staticSwitch1277 = temp_output_1281_0;
				#else
				float staticSwitch1277 = 0.0;
				#endif
				float2 appendResult1803 = (float2(staticSwitch1277 , staticSwitch1277));
				#ifdef _USESCREENUVS_ON
				float4 staticSwitch488 = ( staticSwitch1661 + float4( appendResult1803, 0.0 , 0.0 ) + float4( temp_output_1288_0, 0.0 , 0.0 ) );
				#else
				float4 staticSwitch488 = float4( texCoord478, 0.0 , 0.0 );
				#endif
				float cos1047 = cos( radians( _OverlayRotation ) );
				float sin1047 = sin( radians( _OverlayRotation ) );
				float2 rotator1047 = mul( staticSwitch488.xy - float2( 0.5,0.5 ) , float2x2( cos1047 , -sin1047 , sin1047 , cos1047 )) + float2( 0.5,0.5 );
				float2 OverlayUVs1051 = rotator1047;
				float smoothstepResult1045 = smoothstep( ( ( _ShapeSmoothness * -0.5 ) + 0.5 ) , ( ( _ShapeSmoothness * 0.5 ) + 0.5 ) , ( 0.1 / ( ( _HalftoneThreshold / smoothstepResult525 ) * (0.0 + (tex2D( _HalftoneTexture, OverlayUVs1051 ).r - 0.0) * (1.0 - 0.0) / (1.0 - 0.0)) ) ));
				float4 lerpResult1774 = lerp( lerpResult1784 , temp_output_1225_0 , smoothstepResult1045);
				float4 Halftone1022 = ( lerpResult1774 + IndirectDiffuseLight1269 );
				#if defined( _OVERLAYMODE_NONE )
				float4 staticSwitch1231 = BNFinalDiffuse239;
				#elif defined( _OVERLAYMODE_HAFTONE )
				float4 staticSwitch1231 = Halftone1022;
				#elif defined( _OVERLAYMODE_HATCHING )
				float4 staticSwitch1231 = BNFinalDiffuse239;
				#else
				float4 staticSwitch1231 = BNFinalDiffuse239;
				#endif
				float3 WorldPosition1573 = WorldPosition;
				float3 WorldNormal1573 = BNCurrentNormal1538;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 WorldView1573 = ase_worldViewDir;
				float3 SpecColor1573 = float3(1,1,1);
				float Smoothness638 = ( tex2D( _SpecGlossMap, uv_OcclusionMap ).r * _Glossiness );
				float Smoothness1573 = ( Smoothness638 * ( 2.0 - _AdditionalLightsSmoothnessMultiplier ) );
				float temp_output_588_0 = round( _SpecularPosterizeSteps );
				float Steps1573 = temp_output_588_0;
				float SpecFaloff1573 = _SpecularFaloff;
				float3 localAdditionalLightsSpecularMy1573 = AdditionalLightsSpecularMy( WorldPosition1573 , WorldNormal1573 , WorldView1573 , SpecColor1573 , Smoothness1573 , Steps1573 , SpecFaloff1573 );
				float3 normalizeResult222 = normalize( _MainLightPosition.xyz );
				float3 normalizeResult238 = normalize( ( normalizeResult222 + ase_worldViewDir ) );
				float3 BNHalfDirection265 = normalizeResult238;
				float dotResult252 = dot( BNHalfDirection265 , BNCurrentNormal1538 );
				float IN1578 = ( pow( max( dotResult252 , 0.0 ) , ( exp2( ( ( Smoothness638 * 10.0 * ( 2.0 - _SmoothnessMultiplier ) ) + -2.0 ) ) * 2.0 ) ) * ( _SmoothnessMultiplier == 0.0 ? 0.0 : 1.0 ) );
				float SpecFaloff1578 = _SpecularFaloff;
				float Steps1578 = temp_output_588_0;
				float localFaloffPosterize1578 = FaloffPosterize( IN1578 , SpecFaloff1578 , Steps1578 );
				float2 temp_cast_34 = (_SpecularMaskScale).xx;
				float2 texCoord1123 = IN.ase_texcoord4.xy * temp_cast_34 + float2( 0,0 );
				float2 appendResult1842 = (float2(( _SpecularMaskScale * ( _ScreenParams.x / _ScreenParams.y ) ) , _SpecularMaskScale));
				float4 unityObjectToClipPos2_g202 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord5.xyz));
				float4 computeScreenPos3_g202 = ComputeScreenPos( unityObjectToClipPos2_g202 );
				float temp_output_29_0_g202 = ( _SpecularMaskScale / 4.0 );
				float4 unityObjectToClipPos13_g202 = TransformWorldToHClip(TransformObjectToWorld(float3(0,0,0)));
				float4 computeScreenPos17_g202 = ComputeScreenPos( unityObjectToClipPos13_g202 );
				float4 transform20_g202 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float4 break22_g202 = ( ( ( ( computeScreenPos3_g202 / (computeScreenPos3_g202).w ) * temp_output_29_0_g202 ) - ( temp_output_29_0_g202 * ( computeScreenPos17_g202 / (computeScreenPos17_g202).w ) ) ) * distance( ( float4( _WorldSpaceCameraPos , 0.0 ) - transform20_g202 ) , float4( 0,0,0,0 ) ) );
				float4 break26_g202 = _ScreenParams;
				float4 appendResult24_g202 = (float4(( break22_g202.x * ( break26_g202.x / break26_g202.y ) ) , break22_g202.y , break22_g202.z , break22_g202.w));
				#ifdef _USEADAPTIVEUVSSPECULAR_ON
				float4 staticSwitch1665 = appendResult24_g202;
				#else
				float4 staticSwitch1665 = ( float4( appendResult1842, 0.0 , 0.0 ) * ase_grabScreenPosNorm );
				#endif
				float mulTime1814 = _TimeParameters.x * _UVAnimationSpeedSpec;
				float temp_output_1817_0 = ( floor( ( mulTime1814 % 2.0 ) ) * 0.5 );
				#if defined( _OVERLAYMODE1_NONE )
				float staticSwitch1812 = temp_output_1817_0;
				#elif defined( _OVERLAYMODE1_HAFTONE )
				float staticSwitch1812 = temp_output_1817_0;
				#elif defined( _OVERLAYMODE1_HATCHING )
				float staticSwitch1812 = temp_output_1817_0;
				#else
				float staticSwitch1812 = temp_output_1817_0;
				#endif
				float2 appendResult1818 = (float2(staticSwitch1812 , staticSwitch1812));
				#ifdef _USESCREENUVSSPECULAR_ON
				float4 staticSwitch1132 = ( staticSwitch1665 + float4( appendResult1818, 0.0 , 0.0 ) );
				#else
				float4 staticSwitch1132 = float4( texCoord1123, 0.0 , 0.0 );
				#endif
				float mulTime1811 = _TimeParameters.x * _UVScrollSpeedSpec;
				float temp_output_1807_0 = radians( _UVSrcrollAngleSpec );
				float2 appendResult1808 = (float2(cos( temp_output_1807_0 ) , sin( temp_output_1807_0 )));
				float cos1124 = cos( radians( _SpecularMaskRotation ) );
				float sin1124 = sin( radians( _SpecularMaskRotation ) );
				float2 rotator1124 = mul( ( staticSwitch1132 + float4( ( mulTime1811 * appendResult1808 ), 0.0 , 0.0 ) ).xy - float2( 0.5,0.5 ) , float2x2( cos1124 , -sin1124 , sin1124 , cos1124 )) + float2( 0.5,0.5 );
				float2 SpecularUVs1125 = rotator1124;
				float4 tex2DNode441 = tex2D( _SpecularMaskTexture, SpecularUVs1125 );
				float temp_output_1634_0 = ( 1.0 - _HaltonePatternSize );
				float smoothstepResult1557 = smoothstep( ( temp_output_1634_0 - 0.3 ) , temp_output_1634_0 , tex2DNode441.r);
				float lerpResult446 = lerp( 1.0 , (( _StepHalftoneTexture )?( smoothstepResult1557 ):( tex2DNode441.r )) , _SpecularMaskStrength);
				#ifdef _INVERSEMASK_ON
				float staticSwitch1681 = ( 1.0 - lerpResult446 );
				#else
				float staticSwitch1681 = lerpResult446;
				#endif
				float SpecularMask902 = ( _UseSpecularMask == 1.0 ? staticSwitch1681 : 1.0 );
				float4 SpecularColor1388 = _SpecColor;
				#ifdef _USESPECULAR_ON
				float4 staticSwitch627 = ( float4( ( ( localAdditionalLightsSpecularMy1573 * _AdditionalLightsIntesity * ( _AdditionalLightsSmoothnessMultiplier == 0.0 ? 0.0 : 1.0 ) ) + ( ase_lightColor.rgb * _MainLightIntesity * localFaloffPosterize1578 ) ) , 0.0 ) * SpecularMask902 * Smoothness638 * SpecularColor1388 );
				#else
				float4 staticSwitch627 = float4( 0,0,0,0 );
				#endif
				float4 BNspecularFinalColor243 = staticSwitch627;
				float4 lerpResult1216 = lerp( _HalftoneColor , lerpResult1462 , smoothstepResult1045);
				float4 HalftoneDiffuseShadowMask1236 = lerpResult1216;
				#if defined( _OVERLAYMODE_NONE )
				float4 staticSwitch1237 = BNDiffuse391;
				#elif defined( _OVERLAYMODE_HAFTONE )
				float4 staticSwitch1237 = HalftoneDiffuseShadowMask1236;
				#elif defined( _OVERLAYMODE_HATCHING )
				float4 staticSwitch1237 = BNDiffuse391;
				#else
				float4 staticSwitch1237 = BNDiffuse391;
				#endif
				float grayscale1797 = dot(staticSwitch1237.rgb, float3(0.299,0.587,0.114));
				float lerpResult695 = lerp( 1.0 , grayscale1797 , _SpecularShadowMask);
				half3 reflectVector618 = reflect( -ase_worldViewDir, BNCurrentNormal1538 );
				float3 indirectSpecular618 = GlossyEnvironmentReflection( reflectVector618, 1.0 - Smoothness638, 0.75 );
				#ifdef _USEENVIRONMENTREFLETION_ON
				float3 staticSwitch621 = ( indirectSpecular618 * _Strength * Smoothness638 );
				#else
				float3 staticSwitch621 = float3( 0,0,0 );
				#endif
				float3 IndirectSpecular1364 = staticSwitch621;
				float4 BNBlinnPhongLightning274 = ( staticSwitch1231 + ( BNspecularFinalColor243 * lerpResult695 ) + float4( IndirectSpecular1364 , 0.0 ) );
				float grayscale1648 = Luminance(BNDiffuseNoAdditionalLights1554.rgb);
				float4 lerpResult1650 = lerp( _RimShadowColor , _RimColor , grayscale1648);
				#if defined( _RIMSPLITCOLOR_NOSPLIT )
				float4 staticSwitch1646 = _RimColor;
				#elif defined( _RIMSPLITCOLOR_MULTIPLYWITHDIFFUSE )
				float4 staticSwitch1646 = ( _RimColor * BNDiffuseNoAdditionalLights1554 );
				#elif defined( _RIMSPLITCOLOR_USESECONDCOLOR )
				float4 staticSwitch1646 = lerpResult1650;
				#else
				float4 staticSwitch1646 = _RimColor;
				#endif
				float4 RimColor1642 = staticSwitch1646;
				float fresnelNdotV454 = dot( normalize( BNCurrentNormal1538 ), ase_worldViewDir );
				float fresnelNode454 = ( 0.0 + _RimThickness * pow( max( 1.0 - fresnelNdotV454 , 0.0001 ), _RimPower ) );
				float smoothstepResult462 = smoothstep( ( ( 1.0 - _RimSmoothness ) - 0.5 ) , 0.5 , fresnelNode454);
				float FresnelValue738 = smoothstepResult462;
				float dotResult704 = dot( ase_worldViewDir , _MainLightPosition.xyz );
				float smoothstepResult726 = smoothstep( _BacklightHardness , 0.5 , saturate( ( 1.0 - ( dotResult704 - ( ( _BacklightAmount * 2.0 ) + -2.0 ) ) ) ));
				float dotResult749 = dot( BNCurrentNormal1538 , _MainLightPosition.xyz );
				float temp_output_766_0 = ( 1.0 - ( _SideShineAmount - -0.3 ) );
				float dotResult745 = dot( ( ase_worldViewDir * -1.0 ) , _MainLightPosition.xyz );
				float clampResult753 = clamp( ( ( ( dotResult749 - temp_output_766_0 ) * 4.0 ) + ( dotResult745 - temp_output_766_0 ) ) , 0.0 , 1.1 );
				float smoothstepResult759 = smoothstep( _SideShineHardness , 0.5 , ( clampResult753 * FresnelValue738 ));
				#ifdef _USEBACKLIGHT_ON
				float staticSwitch732 = ( ( _BacklightIntensity * ( FresnelValue738 * smoothstepResult726 ) ) + ( _SideShineIntensity * smoothstepResult759 ) );
				#else
				float staticSwitch732 = FresnelValue738;
				#endif
				#ifdef _USERIMLIGHT_ON
				float staticSwitch464 = staticSwitch732;
				#else
				float staticSwitch464 = 0.0;
				#endif
				float RimLight460 = staticSwitch464;
				float4 lerpResult1635 = lerp( BNBlinnPhongLightning274 , RimColor1642 , RimLight460);
				float4 Emission680 = ( _UseEmission == 1.0 ? ( tex2D( _EmissionMap, uv_OcclusionMap ) * _EmissionColor ) : float4( 0,0,0,0 ) );
				float4 temp_output_282_0 = ( lerpResult1635 + Emission680 );
				float3 IndirectHatching1466 = lerpResult692;
				float3 lerpResult1468 = lerp( float3( 0,0,0 ) , IndirectHatching1466 , _IndirectLightAffectOnHatch);
				float4 temp_output_1270_0 = ( _HatchingColor + float4( lerpResult1468 , 0.0 ) );
				float4 lerpResult1264 = lerp( BNBlinnPhongLightning274 , temp_output_1270_0 , _HatchingColor.a);
				float2 _uv476 = OverlayUVs1051;
				float3 break3_g204 = ( RimLight460 + BNDiffuse391 + Emission680 + BNspecularFinalColor243 ).rgb;
				float temp_output_1064_0 = (( _Darken * -2.0 ) + (max( max( break3_g204.x , break3_g204.y ) , break3_g204.z ) - 0.0) * (( ( _Lighten * 2.0 ) + 1.0 ) - ( _Darken * -2.0 )) / (1.0 - 0.0));
				float color476 = temp_output_1064_0;
				sampler2D _Hatch0476 = _Hatch1;
				sampler2D _Hatch1476 = _Hatch2;
				float3 localHatching476 = Hatching476( _uv476 , color476 , _Hatch0476 , _Hatch1476 );
				float2 _uv491 = OverlayUVs1051;
				float _intensity491 = temp_output_1064_0;
				sampler2D _Hatch0491 = _Hatch1;
				sampler2D _Hatch1491 = _Hatch2;
				float _dist491 = distance( _WorldSpaceCameraPos , WorldPosition );
				float _MaxScaleDependingOnCamera491 = _MaxScaleDependingOnCamera;
				float3 localHatchingConstantScale491 = HatchingConstantScale491( _uv491 , _intensity491 , _Hatch0491 , _Hatch1491 , _dist491 , _MaxScaleDependingOnCamera491 );
				#ifdef _USEHATCHINGCONSTANTSCALE_ON
				float3 staticSwitch490 = localHatchingConstantScale491;
				#else
				float3 staticSwitch490 = localHatching476;
				#endif
				float3 Hatching1025 = saturate( staticSwitch490 );
				float4 lerpResult1260 = lerp( lerpResult1264 , BNBlinnPhongLightning274 , Hatching1025.x);
				float2 appendResult1857 = (float2(( _PaperTilling * ( _ScreenParams.x / _ScreenParams.y ) ) , _PaperTilling));
				float4 tex2DNode1795 = tex2D( _PaperTexture, ( ase_grabScreenPosNorm * float4( appendResult1857, 0.0 , 0.0 ) ).xy );
				float4 lerpResult1254 = lerp( temp_output_1270_0 , tex2DNode1795 , Hatching1025.x);
				float4 lerpResult1257 = lerp( lerpResult1254 , tex2DNode1795 , ( 1.0 - _HatchingColor.a ));
				#ifdef _USEPURESKETCH_ON
				float4 staticSwitch1258 = lerpResult1257;
				#else
				float4 staticSwitch1258 = lerpResult1260;
				#endif
				float4 lerpResult1637 = lerp( staticSwitch1258 , RimColor1642 , RimLight460);
				#if defined( _OVERLAYMODE_NONE )
				float4 staticSwitch1024 = temp_output_282_0;
				#elif defined( _OVERLAYMODE_HAFTONE )
				float4 staticSwitch1024 = temp_output_282_0;
				#elif defined( _OVERLAYMODE_HATCHING )
				float4 staticSwitch1024 = ( lerpResult1637 + Emission680 );
				#else
				float4 staticSwitch1024 = temp_output_282_0;
				#endif
				
				float temp_output_673_0 = ( MainTexture364.a * 1.0 );
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = staticSwitch1024.rgb;
				float Alpha = temp_output_673_0;
				float AlphaClipThreshold = _Cutoff;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(IN.positionCS, Color);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140011


			

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _RimShadowColor;
			float4 _HalftoneColor;
			float4 _RimColor;
			float4 _Color;
			float4 _EmissionColor;
			float4 _OcclusionMap_ST;
			float4 _SpecColor;
			float4 _HatchingColor;
			float4 _OutlineColor;
			float _SmoothnessMultiplier;
			float _UseSpecularMask;
			float _MainLightIntesity;
			float _StepHalftoneTexture;
			float _SpecularMaskScale;
			float _UVAnimationSpeedSpec;
			float _AdditionalLightsIntesity;
			float _UVScrollSpeedSpec;
			float _UVSrcrollAngleSpec;
			float _SpecularMaskRotation;
			float _HaltonePatternSize;
			float _SpecularMaskStrength;
			float _SpecularFaloff;
			float _RampDiffuseTextureLoaded;
			float _RimSmoothness;
			float _Strength;
			float _MaxScaleDependingOnCamera;
			float _Lighten;
			float _Darken;
			float _IndirectLightAffectOnHatch;
			float _UseEmission;
			float _SideShineAmount;
			float _SpecularShadowMask;
			float _SideShineHardness;
			float _BacklightAmount;
			float _BacklightHardness;
			float _BacklightIntensity;
			float _RimPower;
			float _RimThickness;
			float _SpecularPosterizeSteps;
			float _SideShineIntensity;
			float _AdditionalLightsSmoothnessMultiplier;
			float _UVAnimationSpeed;
			float _OverlayRotation;
			float _WarpStrength;
			float _WarpTextureRotation;
			float _UVAnimationSpeedWarp;
			float _UVSrcrollAngleWarp;
			float _UVScrollSpeedWarp;
			float _WarpTextureScale;
			float _UseDiffuseWarp;
			float _StepOffset;
			float _OcclusionStrength;
			float _OutlineTextureStrength;
			float _Thicnkess;
			float _OutlineNoiseIntesity;
			float _OutlineNoiseScale;
			float _OutlineDynamicSpeed;
			float _AdaptiveThicnkess;
			float _NormalMapStrength;
			float _Glossiness;
			float _UseShadows;
			float _LightRampOffset;
			float _PaperTilling;
			float _UVSrcrollAngle;
			float _UVScrollSpeed;
			float _OverlayUVTilling;
			float _HalftoneSmoothness;
			float _HalftoneEdgeOffset;
			float _HalftoneThreshold;
			float _ShapeSmoothness;
			float _HalftoneToonAffect;
			float _IndirectLightStrength;
			float _AdditionalLightsFaloff;
			float _AdditionalLightsAmount;
			float _DiffusePosterizeSteps;
			float _DiffusePosterizePower;
			float _DiffusePosterizeOffset;
			float _DiffuseWarpBrightnessOffset;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _OcclusionMap;


			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir( v.normalOS );

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#else
					positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_OcclusionMap = IN.ase_texcoord2.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				float4 tex2DNode362 = tex2D( _MainTex, uv_OcclusionMap );
				float lerpResult1655 = lerp( 1.0 , tex2D( _OcclusionMap, uv_OcclusionMap ).r , _OcclusionStrength);
				float4 appendResult1656 = (float4(lerpResult1655 , lerpResult1655 , lerpResult1655 , 1.0));
				float4 MainTexture364 = ( _Color * tex2DNode362 * appendResult1656 );
				float temp_output_673_0 = ( MainTexture364.a * 1.0 );
				

				float Alpha = temp_output_673_0;
				float AlphaClipThreshold = _Cutoff;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140011


			

			#pragma vertex vert
			#pragma fragment frag

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _RimShadowColor;
			float4 _HalftoneColor;
			float4 _RimColor;
			float4 _Color;
			float4 _EmissionColor;
			float4 _OcclusionMap_ST;
			float4 _SpecColor;
			float4 _HatchingColor;
			float4 _OutlineColor;
			float _SmoothnessMultiplier;
			float _UseSpecularMask;
			float _MainLightIntesity;
			float _StepHalftoneTexture;
			float _SpecularMaskScale;
			float _UVAnimationSpeedSpec;
			float _AdditionalLightsIntesity;
			float _UVScrollSpeedSpec;
			float _UVSrcrollAngleSpec;
			float _SpecularMaskRotation;
			float _HaltonePatternSize;
			float _SpecularMaskStrength;
			float _SpecularFaloff;
			float _RampDiffuseTextureLoaded;
			float _RimSmoothness;
			float _Strength;
			float _MaxScaleDependingOnCamera;
			float _Lighten;
			float _Darken;
			float _IndirectLightAffectOnHatch;
			float _UseEmission;
			float _SideShineAmount;
			float _SpecularShadowMask;
			float _SideShineHardness;
			float _BacklightAmount;
			float _BacklightHardness;
			float _BacklightIntensity;
			float _RimPower;
			float _RimThickness;
			float _SpecularPosterizeSteps;
			float _SideShineIntensity;
			float _AdditionalLightsSmoothnessMultiplier;
			float _UVAnimationSpeed;
			float _OverlayRotation;
			float _WarpStrength;
			float _WarpTextureRotation;
			float _UVAnimationSpeedWarp;
			float _UVSrcrollAngleWarp;
			float _UVScrollSpeedWarp;
			float _WarpTextureScale;
			float _UseDiffuseWarp;
			float _StepOffset;
			float _OcclusionStrength;
			float _OutlineTextureStrength;
			float _Thicnkess;
			float _OutlineNoiseIntesity;
			float _OutlineNoiseScale;
			float _OutlineDynamicSpeed;
			float _AdaptiveThicnkess;
			float _NormalMapStrength;
			float _Glossiness;
			float _UseShadows;
			float _LightRampOffset;
			float _PaperTilling;
			float _UVSrcrollAngle;
			float _UVScrollSpeed;
			float _OverlayUVTilling;
			float _HalftoneSmoothness;
			float _HalftoneEdgeOffset;
			float _HalftoneThreshold;
			float _ShapeSmoothness;
			float _HalftoneToonAffect;
			float _IndirectLightStrength;
			float _AdditionalLightsFaloff;
			float _AdditionalLightsAmount;
			float _DiffusePosterizeSteps;
			float _DiffusePosterizePower;
			float _DiffusePosterizeOffset;
			float _DiffuseWarpBrightnessOffset;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _OcclusionMap;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_OcclusionMap = IN.ase_texcoord3.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				float4 tex2DNode362 = tex2D( _MainTex, uv_OcclusionMap );
				float lerpResult1655 = lerp( 1.0 , tex2D( _OcclusionMap, uv_OcclusionMap ).r , _OcclusionStrength);
				float4 appendResult1656 = (float4(lerpResult1655 , lerpResult1655 , lerpResult1655 , 1.0));
				float4 MainTexture364 = ( _Color * tex2DNode362 * appendResult1656 );
				float temp_output_673_0 = ( MainTexture364.a * 1.0 );
				

				float Alpha = temp_output_673_0;
				float AlphaClipThreshold = _Cutoff;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			

			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140011


			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _RimShadowColor;
			float4 _HalftoneColor;
			float4 _RimColor;
			float4 _Color;
			float4 _EmissionColor;
			float4 _OcclusionMap_ST;
			float4 _SpecColor;
			float4 _HatchingColor;
			float4 _OutlineColor;
			float _SmoothnessMultiplier;
			float _UseSpecularMask;
			float _MainLightIntesity;
			float _StepHalftoneTexture;
			float _SpecularMaskScale;
			float _UVAnimationSpeedSpec;
			float _AdditionalLightsIntesity;
			float _UVScrollSpeedSpec;
			float _UVSrcrollAngleSpec;
			float _SpecularMaskRotation;
			float _HaltonePatternSize;
			float _SpecularMaskStrength;
			float _SpecularFaloff;
			float _RampDiffuseTextureLoaded;
			float _RimSmoothness;
			float _Strength;
			float _MaxScaleDependingOnCamera;
			float _Lighten;
			float _Darken;
			float _IndirectLightAffectOnHatch;
			float _UseEmission;
			float _SideShineAmount;
			float _SpecularShadowMask;
			float _SideShineHardness;
			float _BacklightAmount;
			float _BacklightHardness;
			float _BacklightIntensity;
			float _RimPower;
			float _RimThickness;
			float _SpecularPosterizeSteps;
			float _SideShineIntensity;
			float _AdditionalLightsSmoothnessMultiplier;
			float _UVAnimationSpeed;
			float _OverlayRotation;
			float _WarpStrength;
			float _WarpTextureRotation;
			float _UVAnimationSpeedWarp;
			float _UVSrcrollAngleWarp;
			float _UVScrollSpeedWarp;
			float _WarpTextureScale;
			float _UseDiffuseWarp;
			float _StepOffset;
			float _OcclusionStrength;
			float _OutlineTextureStrength;
			float _Thicnkess;
			float _OutlineNoiseIntesity;
			float _OutlineNoiseScale;
			float _OutlineDynamicSpeed;
			float _AdaptiveThicnkess;
			float _NormalMapStrength;
			float _Glossiness;
			float _UseShadows;
			float _LightRampOffset;
			float _PaperTilling;
			float _UVSrcrollAngle;
			float _UVScrollSpeed;
			float _OverlayUVTilling;
			float _HalftoneSmoothness;
			float _HalftoneEdgeOffset;
			float _HalftoneThreshold;
			float _ShapeSmoothness;
			float _HalftoneToonAffect;
			float _IndirectLightStrength;
			float _AdditionalLightsFaloff;
			float _AdditionalLightsAmount;
			float _DiffusePosterizeSteps;
			float _DiffusePosterizePower;
			float _DiffusePosterizeOffset;
			float _DiffuseWarpBrightnessOffset;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _OcclusionMap;


			
			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_OcclusionMap = IN.ase_texcoord.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				float4 tex2DNode362 = tex2D( _MainTex, uv_OcclusionMap );
				float lerpResult1655 = lerp( 1.0 , tex2D( _OcclusionMap, uv_OcclusionMap ).r , _OcclusionStrength);
				float4 appendResult1656 = (float4(lerpResult1655 , lerpResult1655 , lerpResult1655 , 1.0));
				float4 MainTexture364 = ( _Color * tex2DNode362 * appendResult1656 );
				float temp_output_673_0 = ( MainTexture364.a * 1.0 );
				

				surfaceDescription.Alpha = temp_output_673_0;
				surfaceDescription.AlphaClipThreshold = _Cutoff;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			

			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140011


			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _RimShadowColor;
			float4 _HalftoneColor;
			float4 _RimColor;
			float4 _Color;
			float4 _EmissionColor;
			float4 _OcclusionMap_ST;
			float4 _SpecColor;
			float4 _HatchingColor;
			float4 _OutlineColor;
			float _SmoothnessMultiplier;
			float _UseSpecularMask;
			float _MainLightIntesity;
			float _StepHalftoneTexture;
			float _SpecularMaskScale;
			float _UVAnimationSpeedSpec;
			float _AdditionalLightsIntesity;
			float _UVScrollSpeedSpec;
			float _UVSrcrollAngleSpec;
			float _SpecularMaskRotation;
			float _HaltonePatternSize;
			float _SpecularMaskStrength;
			float _SpecularFaloff;
			float _RampDiffuseTextureLoaded;
			float _RimSmoothness;
			float _Strength;
			float _MaxScaleDependingOnCamera;
			float _Lighten;
			float _Darken;
			float _IndirectLightAffectOnHatch;
			float _UseEmission;
			float _SideShineAmount;
			float _SpecularShadowMask;
			float _SideShineHardness;
			float _BacklightAmount;
			float _BacklightHardness;
			float _BacklightIntensity;
			float _RimPower;
			float _RimThickness;
			float _SpecularPosterizeSteps;
			float _SideShineIntensity;
			float _AdditionalLightsSmoothnessMultiplier;
			float _UVAnimationSpeed;
			float _OverlayRotation;
			float _WarpStrength;
			float _WarpTextureRotation;
			float _UVAnimationSpeedWarp;
			float _UVSrcrollAngleWarp;
			float _UVScrollSpeedWarp;
			float _WarpTextureScale;
			float _UseDiffuseWarp;
			float _StepOffset;
			float _OcclusionStrength;
			float _OutlineTextureStrength;
			float _Thicnkess;
			float _OutlineNoiseIntesity;
			float _OutlineNoiseScale;
			float _OutlineDynamicSpeed;
			float _AdaptiveThicnkess;
			float _NormalMapStrength;
			float _Glossiness;
			float _UseShadows;
			float _LightRampOffset;
			float _PaperTilling;
			float _UVSrcrollAngle;
			float _UVScrollSpeed;
			float _OverlayUVTilling;
			float _HalftoneSmoothness;
			float _HalftoneEdgeOffset;
			float _HalftoneThreshold;
			float _ShapeSmoothness;
			float _HalftoneToonAffect;
			float _IndirectLightStrength;
			float _AdditionalLightsFaloff;
			float _AdditionalLightsAmount;
			float _DiffusePosterizeSteps;
			float _DiffusePosterizePower;
			float _DiffusePosterizeOffset;
			float _DiffuseWarpBrightnessOffset;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _OcclusionMap;


			
			float4 _SelectionID;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_OcclusionMap = IN.ase_texcoord.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				float4 tex2DNode362 = tex2D( _MainTex, uv_OcclusionMap );
				float lerpResult1655 = lerp( 1.0 , tex2D( _OcclusionMap, uv_OcclusionMap ).r , _OcclusionStrength);
				float4 appendResult1656 = (float4(lerpResult1655 , lerpResult1655 , lerpResult1655 , 1.0));
				float4 MainTexture364 = ( _Color * tex2DNode362 * appendResult1656 );
				float temp_output_673_0 = ( MainTexture364.a * 1.0 );
				

				surfaceDescription.Alpha = temp_output_673_0;
				surfaceDescription.AlphaClipThreshold = _Cutoff;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			

        	#pragma multi_compile_instancing
        	#pragma multi_compile _ LOD_FADE_CROSSFADE
        	#define _ALPHATEST_ON 1
        	#define ASE_SRP_VERSION 140011


			

        	#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

            #if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _RimShadowColor;
			float4 _HalftoneColor;
			float4 _RimColor;
			float4 _Color;
			float4 _EmissionColor;
			float4 _OcclusionMap_ST;
			float4 _SpecColor;
			float4 _HatchingColor;
			float4 _OutlineColor;
			float _SmoothnessMultiplier;
			float _UseSpecularMask;
			float _MainLightIntesity;
			float _StepHalftoneTexture;
			float _SpecularMaskScale;
			float _UVAnimationSpeedSpec;
			float _AdditionalLightsIntesity;
			float _UVScrollSpeedSpec;
			float _UVSrcrollAngleSpec;
			float _SpecularMaskRotation;
			float _HaltonePatternSize;
			float _SpecularMaskStrength;
			float _SpecularFaloff;
			float _RampDiffuseTextureLoaded;
			float _RimSmoothness;
			float _Strength;
			float _MaxScaleDependingOnCamera;
			float _Lighten;
			float _Darken;
			float _IndirectLightAffectOnHatch;
			float _UseEmission;
			float _SideShineAmount;
			float _SpecularShadowMask;
			float _SideShineHardness;
			float _BacklightAmount;
			float _BacklightHardness;
			float _BacklightIntensity;
			float _RimPower;
			float _RimThickness;
			float _SpecularPosterizeSteps;
			float _SideShineIntensity;
			float _AdditionalLightsSmoothnessMultiplier;
			float _UVAnimationSpeed;
			float _OverlayRotation;
			float _WarpStrength;
			float _WarpTextureRotation;
			float _UVAnimationSpeedWarp;
			float _UVSrcrollAngleWarp;
			float _UVScrollSpeedWarp;
			float _WarpTextureScale;
			float _UseDiffuseWarp;
			float _StepOffset;
			float _OcclusionStrength;
			float _OutlineTextureStrength;
			float _Thicnkess;
			float _OutlineNoiseIntesity;
			float _OutlineNoiseScale;
			float _OutlineDynamicSpeed;
			float _AdaptiveThicnkess;
			float _NormalMapStrength;
			float _Glossiness;
			float _UseShadows;
			float _LightRampOffset;
			float _PaperTilling;
			float _UVSrcrollAngle;
			float _UVScrollSpeed;
			float _OverlayUVTilling;
			float _HalftoneSmoothness;
			float _HalftoneEdgeOffset;
			float _HalftoneThreshold;
			float _ShapeSmoothness;
			float _HalftoneToonAffect;
			float _IndirectLightStrength;
			float _AdditionalLightsFaloff;
			float _AdditionalLightsAmount;
			float _DiffusePosterizeSteps;
			float _DiffusePosterizePower;
			float _DiffusePosterizeOffset;
			float _DiffuseWarpBrightnessOffset;
			float _Cutoff;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _OcclusionMap;


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				o.normalWS = TransformObjectToWorldNormal( v.normalOS );
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag( VertexOutput IN
				, out half4 outNormalWS : SV_Target0
			#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
			#endif
				 )
			{
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 uv_OcclusionMap = IN.ase_texcoord2.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				float4 tex2DNode362 = tex2D( _MainTex, uv_OcclusionMap );
				float lerpResult1655 = lerp( 1.0 , tex2D( _OcclusionMap, uv_OcclusionMap ).r , _OcclusionStrength);
				float4 appendResult1656 = (float4(lerpResult1655 , lerpResult1655 , lerpResult1655 , 1.0));
				float4 MainTexture364 = ( _Color * tex2DNode362 * appendResult1656 );
				float temp_output_673_0 = ( MainTexture364.a * 1.0 );
				

				float Alpha = temp_output_673_0;
				float AlphaClipThreshold = _Cutoff;

				#if _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float3 normalWS = normalize(IN.normalWS);
					float2 octNormalWS = PackNormalOctQuadEncode(normalWS);           // values between [-1, +1], must use fp32 on some platforms
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);   // values between [ 0,  1]
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);      // values between [ 0,  1]
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					float3 normalWS = IN.normalWS;
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}

			ENDHLSL
		}

	
	}
	
	CustomEditor "ToonProEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
