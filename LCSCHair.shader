// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "LCSCshader/Hair"
{
	Properties
	{
		[Header(Diffuse)]_MainTex("Diffuse Map (_col)", 2D) = "white" {}
		[Header(Shadow)]_sdwMask("Shadow Mask (_bs_b/_sd) [optional]", 2D) = "white" {}
		[ToggleUI]_OnlyPaintedShadow("Only Painted Shadow", Float) = 0
		[ToggleUI]_ReceiveShadowLerp("ReceiveShadowLerp", Float) = 1
		[ToggleUI]_ShadowinLightColor("Shadow in LightColor", Float) = 1
		[ToggleUI]_NoShadowinDirectionalLightColor("NoShadow in DirectionalLightColor", Float) = 1
		_ShadowStep("ShadowStep", Range( -1 , 1)) = -0.3
		_ShadowFeather("ShadowFeather", Range( 0 , 1)) = 0.3
		_GradeTex("Grade Tex (_shade)", 2D) = "white" {}
		_GradeScale("Grade Scale", Float) = 10
		_GradeFactor("Grade Factor", Range( 0 , 1)) = 0.5
		[HDR]_ToonBrightColor("ToonBrightColor", Color) = (1,1,1,0)
		[HDR]_ToonDarkColor("ToonDarkColor", Color) = (1,1,1,0)
		[Header(Rim)]_rimTex("RimTex (_Rmask)", 2D) = "black" {}
		_RimTexOffset("RimTexOffset", Range( -1 , 1)) = 0
		[HDR]_RimColor("RimColor", Color) = (1,1,1,1)
		_RimPower("RimPower", Range( 0 , 10)) = 1
		_RimStep("RimStep", Range( 0 , 2)) = 0.5
		_RimFeather("RimFeather", Range( 0 , 1)) = 0.3
		_RimSpecRate("RimSpecRate", Range( 0 , 1)) = 0.5
		_RimShadowRate("RimShadowRate", Range( 0 , 5)) = 1
		_RimAttenuation("RimAttenuation", Range( 0 , 1)) = 0
		_RimHorizonOffset("RimHorizonOffset", Range( -1 , 1)) = 0
		_RimVerticalOffset("RimVerticalOffset", Range( -1 , 1)) = 0
		[HDR]_RimColor2("RimColor2", Color) = (0,0,0,0)
		_RimPower2("RimPower2", Range( 0 , 10)) = 1
		_RimStep2("RimStep2", Range( 0 , 2)) = 0.5
		_RimFeather2("RimFeather2", Range( 0 , 1)) = 0.3
		_RimSpecRate2("RimSpecRate2", Range( 0 , 1)) = 0.5
		_RimShadowRate2("RimShadowRate2", Range( 0 , 2)) = 0
		_RimAttenuation2("RimAttenuation2", Range( 0 , 1)) = 0
		_RimHorizonOffset2("RimHorizonOffset2", Range( -1 , 1)) = 0
		_RimVerticalOffset2("RimVerticalOffset2", Range( -1 , 1)) = 0
		[HDR]_GlobalRimColor("GlobalRimColor", Color) = (1,1,1,1)
		_CustomRimLightColor("CustomRimLightColor", Range( 0 , 1)) = 1
		_MinRimLightColor("MinRimLightColor", Range( 0 , 1)) = 0.2
		[Header(Hair Shine)]_Hcubemap("HairShine CubeMap", CUBE) = "black" {}
		_CubemapRotation("Cubemap Rotation", Range( 0 , 360)) = 0
		[ToggleUI]_CubemapViewRoatationExperimental("Cubemap View Roatation (Experimental)", Float) = 0
		[HDR]_HairShineColor("Hair Shine Color", Color) = (1,1,1,0)
		_HairShinePower("Hair Shine Power", Range( 0 , 10)) = 1
		_ShineNoiseMap("Shine NoiseMap", 2D) = "white" {}
		_NoiseFactor("Noise Factor", Float) = -0.01
		_ManualCubemapControl("Manual Cubemap Control", Vector) = (0,0,0,0)
		[ToggleUI]_DynamicShineExperimental("DynamicShine (Experimental)", Float) = 0
		_ShineMoveRange("ShineMoveRange", Float) = 0.05
		[Header(Specular)]_spcMask("SpecularMask [optional]", 2D) = "black" {}
		_SpecularOffset("SpecularOffset", Range( -1 , 1)) = 0
		[HDR]_SpecularColor("SpecularColor", Color) = (1,1,1,1)
		_SpecularPower("SpecularPower", Range( 0 , 5)) = 1
		_SpecularBias("Specular Bias", Range( 0 , 10)) = 0.2
		[Header(Metal)]_metalMask("MetalMask [optional]", 2D) = "black" {}
		_MetalOffset("MetalOffset", Range( -1 , 1)) = 0
		_EnvTex("EnvironmentMap", 2D) = "white" {}
		[ToggleUI]_EnvMatCap("EnvMatCap", Float) = 0
		[ToggleUI]_UseReflectionProbeAsEnvMap("UseReflectionProbeAsEnvMap", Float) = 0
		_RefProbeSmoothness("RefProbeSmoothness", Range( 0 , 1)) = 0.7
		_EnvRate("EnvRate", Range( 0 , 10)) = 1
		_EnvBias("EnvBias", Range( 0 , 10)) = 1
		[Header(Emissive and Other)]_EmiTex("Emissive [optional]", 2D) = "white" {}
		[HDR]_EmissiveColor("EmissiveColor", Color) = (1,1,1,1)
		_EmmisiveStrength("EmmisiveStrength", Range( 0 , 10)) = 0
		[HDR]_CharaColor("CharaColor", Color) = (1,1,1,1)
		_Saturation("Saturation", Range( 0 , 1)) = 1
		[HDR]_UnsaturationColor("UnsaturationColor", Color) = (0.2117647,0.7137255,0.07058824,0)
		[Header(Light)]_MinDirectLight("MinDirectLight", Range( 0 , 1)) = 0
		_MaxDirectLight("MaxDirectLight", Range( 0 , 2)) = 1
		[ToggleUI]_UnifyIndirectDiffuseLight("Unify IndirectDiffuseLight", Float) = 1
		_MinIndirectLight("MinIndirectLight", Range( 0 , 1)) = 0.1
		_MaxIndirectLight("MaxIndirectLight", Range( 0 , 2)) = 1
		_LightColorGrayScale("LightColor GrayScale", Range( 0 , 1)) = 0
		_DiffuseLightFactor("DiffuseLightFactor", Range( 0 , 1)) = 0
		_GlobalLightFactor("GlobalLightFactor", Range( 0 , 1)) = 1
		[Header(Outline)][ToggleUI]_Outline("Outline", Float) = 0
		_OutlineTex("OutlineTex (Lmask) [optional]", 2D) = "white" {}
		_OutlineClip("OutlineClip", Range( 0 , 1)) = 0.5
		[ToggleUI]_UseOutlineMask("Use OutlineMask", Float) = 0
		[HDR]_OutlineColor("OutlineColor", Color) = (0,0,0,0)
		[ToggleUI]_MixDiffuseinOutlineColor("Mix Diffuse in OutlineColor", Float) = 0
		_OutlineLightColor("OutlineLightColor", Range( 0 , 1)) = 1
		_OutlineWidth("OutlineWidth", Float) = 0.002
		[ToggleUI]_UseOutlineWidthMask("Use OutlineWidthMask", Float) = 0
		[ToggleUI]_OutlineDistanceAdjust("Outline Distance Adjust", Float) = 0
		_MinDistance("MinDistance", Float) = 1
		_MaxDistance("MaxDistance", Float) = 2
		_MinDistanceRemap("MinDistanceRemap", Float) = 1
		_MaxDistanceRemap("MaxDistanceRemap", Float) = 10
		[ToggleUI]_OutlineZPushAdjust("Outline ZPush Adjust", Float) = 0
		_OutlineZPush("Outline ZPush", Float) = -0.001
		[Header(HeadBoneTransform)][Toggle]_ObjectSpace("ObjectSpace", Float) = 1
		[Toggle]_IsRightHandCoordinateSystem("IsRightHandCoordinateSystem", Float) = 1
		_FaceCenterPos("FaceCenterPos", Vector) = (0,0,0,0)
		_FaceForward("FaceForward", Vector) = (0,0,1,0)
		_FaceUp("FaceUp", Vector) = (0,1,0,0)
		[Header(Stencil Buffer)]_StencilReference("Stencil Reference", Range( 0 , 255)) = 0
		_StencilReadMask("Stencil ReadMask", Range( 0 , 255)) = 255
		_StencilWriteMask("Stencil WriteMask", Range( 0 , 255)) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilPassFront("Stencil PassFront", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilFailFront("Stencil FailFront", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_StencilZFailFront("Stencil ZFailFront", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Float) = 2
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		Tags { "RenderType"="Opaque" "Queue"="Geometry" }
	LOD 100

		Cull Off
		CGINCLUDE
		#pragma target 3.0 
		ENDCG

        
		Pass
		{
			Name "ExtraPrePass"
			Tags { "LightMode"="ForwardBase" }

			Blend One Zero
			Cull Front
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend Off
			AlphaToMask Off
			Stencil
			{
				Ref [_StencilReference]
				ReadMask [_StencilReadMask]
				WriteMask [_StencilWriteMask]
				Comp [_StencilComparison]
				Pass [_StencilPassFront]
				Fail [_StencilFailFront]
				ZFail [_StencilZFailFront]
			}

			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase
			#ifndef UNITY_PASS_FORWARDBASE
				#define UNITY_PASS_FORWARDBASE
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS) && UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(2,3)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(2)
					#else
						SHADOW_COORDS(2)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(4)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform float _StencilZFailFront;
			uniform float _StencilComparison;
			uniform float _StencilPassFront;
			uniform float _StencilFailFront;
			uniform float _StencilWriteMask;
			uniform float _StencilReadMask;
			uniform float _StencilReference;
			uniform float _CullMode;
			uniform float _UseOutlineWidthMask;
			uniform sampler2D _OutlineTex;
			uniform float4 _OutlineTex_ST;
			uniform float _OutlineWidth;
			uniform float _OutlineDistanceAdjust;
			uniform float _MinDistance;
			uniform float _MaxDistance;
			uniform float _MinDistanceRemap;
			uniform float _MaxDistanceRemap;
			uniform float _OutlineZPushAdjust;
			uniform float _OutlineZPush;
			uniform float _MixDiffuseinOutlineColor;
			uniform float4 _OutlineColor;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float _NoShadowinDirectionalLightColor;
			uniform float _MinDirectLight;
			uniform float _ShadowinLightColor;
			uniform float _MaxDirectLight;
			uniform float _UnifyIndirectDiffuseLight;
			uniform float _MinIndirectLight;
			uniform float _MaxIndirectLight;
			uniform float _LightColorGrayScale;
			uniform float _OutlineLightColor;
			uniform float _Outline;
			uniform float _UseOutlineMask;
			uniform float _OutlineClip;


			float PureLightAttenuation( float3 worldPos )
			{
				#ifdef POINT
				        unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz; \
				        return tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r;
				#endif
				#ifdef SPOT
				#if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1))
				#else
				#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = input._LightCoord
				#endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz);
				#endif
				#ifdef DIRECTIONAL
				        return 1;
				#endif
				#ifdef POINT_COOKIE
				#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz
				#   else
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = input._LightCoord
				#   endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).r * texCUBE(_LightTexture0, lightCoord).w;
				#endif
				#ifdef DIRECTIONAL_COOKIE
				#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xy
				#   else
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = input._LightCoord
				#   endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return tex2D(_LightTexture0, lightCoord).w;
				#endif
			}
			
			float3 ShadeSH9out( half4 Normal )
			{
				return ShadeSH9(Normal);
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_OutlineTex = v.ase_texcoord.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
				float OutlineCorrect1140 = tex2Dlod( _OutlineTex, float4( uv_OutlineTex, 0, 0.0) ).r;
				float OutlineWidth740 = ( (( _UseOutlineWidthMask )?( OutlineCorrect1140 ):( 1.0 )) * ( _OutlineWidth * 0.01 ) );
				float4 unityObjectToClipPos1105 = UnityObjectToClipPos( v.vertex.xyz );
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float4 transform748 = mul(unity_WorldToObject,float4( ase_worldViewDir , 0.0 ));
				
				o.ase_texcoord8.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( float4( ( OutlineWidth740 * v.normal * (( _OutlineDistanceAdjust )?( (_MinDistanceRemap + (saturate( (0.0 + (unityObjectToClipPos1105.w - _MinDistance) * (1.0 - 0.0) / (_MaxDistance - _MinDistance)) ) - 0.0) * (_MaxDistanceRemap - _MinDistanceRemap) / (1.0 - 0.0)) ):( 1.0 )) ) , 0.0 ) + (( _OutlineZPushAdjust )?( ( transform748 * _OutlineZPush ) ):( float4( 0,0,0,0 ) )) ).xyz;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
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
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
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
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN 
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					half atten = 1;
				#endif

				float2 uv_MainTex = IN.ase_texcoord8.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode64 = tex2D( _MainTex, uv_MainTex );
				float4 diff345 = tex2DNode64;
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float3 temp_cast_0 = (_MinDirectLight).xxx;
				float3 temp_output_1128_0 = max( ase_lightColor.rgb , temp_cast_0 );
				float3 worldPos1029 = worldPos;
				float localPureLightAttenuation1029 = PureLightAttenuation( worldPos1029 );
				float3 temp_output_1073_0 = ( temp_output_1128_0 * (( _ShadowinLightColor )?( float4(atten,0,0,0) ):( localPureLightAttenuation1029 )) );
				float3 temp_cast_1 = (_MinDirectLight).xxx;
				float3 temp_cast_2 = (_MinDirectLight).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch1075 = temp_output_1073_0;
				#else
				float3 staticSwitch1075 = temp_output_1128_0;
				#endif
				float3 temp_cast_3 = (_MaxDirectLight).xxx;
				float4 Normal1127 = float4( 0,0,0,0 );
				float3 localShadeSH9out1127 = ShadeSH9out( Normal1127 );
				float3 localMaxShadeSH9876 = ( max(ShadeSH9(half4(0, 0, 0, 1)).rgb, ShadeSH9(half4(0, -1, 0, 1)).rgb) );
				float3 temp_cast_4 = (_MinIndirectLight).xxx;
				float3 temp_cast_5 = (_MaxIndirectLight).xxx;
				float3 temp_output_1005_0 = max( min( (( _NoShadowinDirectionalLightColor )?( staticSwitch1075 ):( temp_output_1073_0 )) , temp_cast_3 ) , min( max( (( _UnifyIndirectDiffuseLight )?( localMaxShadeSH9876 ):( localShadeSH9out1127 )) , temp_cast_4 ) , temp_cast_5 ) );
				float3 temp_cast_6 = (_MinDirectLight).xxx;
				float3 temp_cast_7 = (_MaxDirectLight).xxx;
				float3 temp_cast_8 = (_MinIndirectLight).xxx;
				float3 temp_cast_9 = (_MaxIndirectLight).xxx;
				float grayscale1095 = dot(temp_output_1005_0, float3(0.299,0.587,0.114));
				float3 temp_cast_10 = (grayscale1095).xxx;
				float3 lerpResult1096 = lerp( temp_output_1005_0 , temp_cast_10 , _LightColorGrayScale);
				float3 LightColor208 = lerpResult1096;
				float4 lerpResult1137 = lerp( (( _MixDiffuseinOutlineColor )?( ( _OutlineColor * diff345 ) ):( _OutlineColor )) , ( (( _MixDiffuseinOutlineColor )?( ( _OutlineColor * diff345 ) ):( _OutlineColor )) * float4( LightColor208 , 0.0 ) ) , _OutlineLightColor);
				float2 uv_OutlineTex = IN.ase_texcoord8.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
				float OutlineCorrect1140 = tex2D( _OutlineTex, uv_OutlineTex ).r;
				clip( (( _Outline )?( (( _UseOutlineMask )?( OutlineCorrect1140 ):( 1.0 )) ):( 0.0 )) - _OutlineClip);
				
				float3 Color = lerpResult1137.rgb;
				float Alpha = 1;

				float4 c = float4( Color, Alpha );

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				return c;
			}
			ENDCG
		}
		
		
		Pass
		{
			
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }

			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend Off
			BlendOp Add, Add
			AlphaToMask Off
			Cull [_CullMode]
			ColorMask RGBA
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			Stencil
			{
				Ref [_StencilReference]
				ReadMask [_StencilReadMask]
				WriteMask [_StencilWriteMask]
				Comp [_StencilComparison]
				Pass [_StencilPassFront]
				Fail [_StencilFailFront]
				ZFail [_StencilZFailFront]
			}
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase
			#ifndef UNITY_PASS_FORWARDBASE
			#define UNITY_PASS_FORWARDBASE
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_SHADOWS 1
			#define ASE_NEEDS_VERT_NORMAL

			//This is a late directive
			
			uniform float _StencilZFailFront;
			uniform float _StencilComparison;
			uniform float _StencilPassFront;
			uniform float _StencilFailFront;
			uniform float _StencilWriteMask;
			uniform float _StencilReadMask;
			uniform float _StencilReference;
			uniform float _CullMode;
			uniform float4 _UnsaturationColor;
			uniform float4 _CharaColor;
			uniform samplerCUBE _Hcubemap;
			uniform float3 _ManualCubemapControl;
			uniform float _DynamicShineExperimental;
			uniform float _ObjectSpace;
			uniform float _IsRightHandCoordinateSystem;
			uniform float3 _FaceForward;
			uniform float3 _FaceCenterPos;
			uniform float3 _FaceUp;
			uniform float _ShineMoveRange;
			uniform sampler2D _ShineNoiseMap;
			uniform float _NoiseFactor;
			uniform float _CubemapViewRoatationExperimental;
			uniform float _CubemapRotation;
			uniform float4 _HairShineColor;
			uniform float _HairShinePower;
			uniform float _NoShadowinDirectionalLightColor;
			uniform float _MinDirectLight;
			uniform float _ShadowinLightColor;
			uniform float _MaxDirectLight;
			uniform float _UnifyIndirectDiffuseLight;
			uniform float _MinIndirectLight;
			uniform float _MaxIndirectLight;
			uniform float _LightColorGrayScale;
			uniform float4 _GlobalRimColor;
			uniform float _CustomRimLightColor;
			uniform float _MinRimLightColor;
			uniform float4 _SpecularColor;
			uniform float4 _RimColor2;
			uniform float _RimSpecRate2;
			uniform float _RimStep2;
			uniform float _RimVerticalOffset2;
			uniform float _RimHorizonOffset2;
			uniform float _RimFeather2;
			uniform sampler2D _rimTex;
			uniform float4 _rimTex_ST;
			uniform float _RimTexOffset;
			uniform float _RimPower2;
			uniform float _RimAttenuation2;
			uniform float _RimShadowRate2;
			uniform float _SpecularPower;
			uniform sampler2D _spcMask;
			uniform float4 _spcMask_ST;
			uniform float _SpecularOffset;
			uniform float _SpecularBias;
			uniform float _GlobalLightFactor;
			uniform float4 _ToonDarkColor;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform sampler2D _GradeTex;
			uniform float _OnlyPaintedShadow;
			uniform float _ReceiveShadowLerp;
			uniform sampler2D _sdwMask;
			uniform float4 _sdwMask_ST;
			uniform float _ShadowStep;
			uniform float _ShadowFeather;
			uniform float _GradeScale;
			uniform float _GradeFactor;
			uniform float _DiffuseLightFactor;
			uniform float4 _ToonBrightColor;
			uniform float _UseReflectionProbeAsEnvMap;
			uniform sampler2D _EnvTex;
			uniform float _EnvMatCap;
			uniform float _RefProbeSmoothness;
			uniform float _EnvBias;
			uniform float _EnvRate;
			uniform sampler2D _metalMask;
			uniform float4 _metalMask_ST;
			uniform float _MetalOffset;
			uniform float _RimAttenuation;
			uniform float _RimShadowRate;
			uniform float4 _RimColor;
			uniform float _RimSpecRate;
			uniform float _RimStep;
			uniform float _RimVerticalOffset;
			uniform float _RimHorizonOffset;
			uniform float _RimFeather;
			uniform float _RimPower;
			uniform sampler2D _EmiTex;
			uniform float4 _EmiTex_ST;
			uniform float4 _EmissiveColor;
			uniform float _EmmisiveStrength;
			uniform float _Saturation;
			inline float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max( 0.001f , dot( inVec , inVec ) );
				return inVec* rsqrt( dp3);
			}
			
			float3 RotateAroundYInDegrees1351( float3 vertex, float degrees )
			{
				float alpha = degrees * UNITY_PI / 180.0;
				float sina, cosa;
				sincos(alpha, sina, cosa);
				float2x2 m = float2x2(cosa, -sina, sina, cosa);
				return float3(mul(m, vertex.xz), vertex.y).xzy;
			}
			
			float PureLightAttenuation( float3 worldPos )
			{
				#ifdef POINT
				        unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz; \
				        return tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r;
				#endif
				#ifdef SPOT
				#if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1))
				#else
				#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = input._LightCoord
				#endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz);
				#endif
				#ifdef DIRECTIONAL
				        return 1;
				#endif
				#ifdef POINT_COOKIE
				#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz
				#   else
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = input._LightCoord
				#   endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).r * texCUBE(_LightTexture0, lightCoord).w;
				#endif
				#ifdef DIRECTIONAL_COOKIE
				#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xy
				#   else
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = input._LightCoord
				#   endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return tex2D(_LightTexture0, lightCoord).w;
				#endif
			}
			
			float3 ShadeSH9out( half4 Normal )
			{
				return ShadeSH9(Normal);
			}
			
			float3 v_bias(  )
			{
				return float3(unity_MatrixV[0][1],unity_MatrixV[1][1],unity_MatrixV[2][1]);
			}
			
			float3 h_bias(  )
			{
				return float3(unity_MatrixV[0][0],unity_MatrixV[0][1],unity_MatrixV[0][2]);
			}
			
			float2 getMatcapUVs1147( float3 normal, float3 viewDir )
			{
				half3 worldUp = float3(0, 1, 0);
				half3 worldViewUp = normalize(worldUp - viewDir * dot(viewDir, worldUp));
				half3 worldViewRight = normalize(cross(viewDir, worldViewUp));
				return half2(dot(worldViewRight, normal), dot(worldViewUp, normal)) * 0.5 + 0.5;
			}
			
			float4 RefProbe( float3 dir, float smoothness )
			{
				float4 cube = 1;
				float roughness = 1 - smoothness;
				roughness *= 1.7 - 0.7 * roughness;
				float4 val = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, dir, roughness * UNITY_SPECCUBE_LOD_STEPS);
				cube.xyz = (DecodeHDR(val, unity_SpecCube0_HDR));
				return cube;
			}
			


			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 pos : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_SHADOW_COORDS(4)
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
			};
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				o.ase_texcoord3.xyz = ase_worldPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				o.ase_texcoord1 = v.vertex;
				o.ase_texcoord2.xy = v.ase_texcoord1.xy;
				o.ase_texcoord6.xyz = v.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				
				v.vertex.xyz +=  float3(0,0,0) ;
				o.pos = UnityObjectToClipPos(v.vertex);
				#if ASE_SHADOWS
					#if UNITY_VERSION >= 560
						UNITY_TRANSFER_SHADOW( o, v.texcoord );
					#else
						TRANSFER_SHADOW( o );
					#endif
				#endif
				return o;
			}
			
			float4 frag (v2f i ) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				float3 appendResult1332 = (float3(i.ase_texcoord1.xyz.y , i.ase_texcoord1.xyz.x , i.ase_texcoord1.xyz.z));
				float3 appendResult1244 = (float3(-_FaceForward.y , _FaceForward.z , -_FaceForward.x));
				float3 temp_output_1243_0 = ( _IsRightHandCoordinateSystem == 1.0 ? appendResult1244 : _FaceForward );
				float3 objToWorldDir1230 = ASESafeNormalize( mul( unity_ObjectToWorld, float4( temp_output_1243_0, 0 ) ).xyz );
				float3 normalizeResult1235 = normalize( ( _ObjectSpace == 0.0 ? temp_output_1243_0 : objToWorldDir1230 ) );
				float3 Forward1241 = normalizeResult1235;
				float isObjectSpace1232 = _ObjectSpace;
				float3 appendResult1253 = (float3(-_FaceCenterPos.y , _FaceCenterPos.z , -_FaceCenterPos.x));
				float3 temp_output_1255_0 = ( _IsRightHandCoordinateSystem == 1.0 ? appendResult1253 : _FaceCenterPos );
				float3 objToWorld1227 = mul( unity_ObjectToWorld, float4( temp_output_1255_0, 1 ) ).xyz;
				float3 temp_output_1226_0 = ( isObjectSpace1232 == 0.0 ? temp_output_1255_0 : objToWorld1227 );
				float3 normalizeResult1228 = normalize( ( _WorldSpaceCameraPos - temp_output_1226_0 ) );
				float3 Center2Cam1256 = normalizeResult1228;
				float dotResult1273 = dot( (Forward1241).yz , (Center2Cam1256).yz );
				float Zsign1271 = sign( dotResult1273 );
				float3 break1435 = abs( Center2Cam1256 );
				float3 appendResult1248 = (float3(-_FaceUp.y , _FaceUp.z , -_FaceUp.x));
				float3 temp_output_1247_0 = ( _IsRightHandCoordinateSystem == 1.0 ? appendResult1248 : _FaceUp );
				float3 objToWorldDir1238 = ASESafeNormalize( mul( unity_ObjectToWorld, float4( temp_output_1247_0, 0 ) ).xyz );
				float3 normalizeResult1236 = normalize( ( isObjectSpace1232 == 0.0 ? temp_output_1247_0 : objToWorldDir1238 ) );
				float3 Up1242 = normalizeResult1236;
				float3 normalizeResult1220 = normalize( cross( Forward1241 , Up1242 ) );
				float3 Left1219 = normalizeResult1220;
				float dotResult1264 = dot( Center2Cam1256 , Left1219 );
				float3 normalizeResult1295 = normalize( ( dotResult1264 * Left1219 ) );
				float3 normalizeResult1294 = normalize( ( Center2Cam1256 - normalizeResult1295 ) );
				float3 ProjectedZ1293 = normalizeResult1294;
				float dotResult1300 = dot( Up1242 , ProjectedZ1293 );
				float Zvalue1304 = ( 1.0 - abs( dotResult1300 ) );
				float temp_output_1320_0 = (0.0 + (saturate( ( saturate( break1435.z ) * Zvalue1304 ) ) - 0.0) * (_ShineMoveRange - 0.0) / (1.0 - 0.0));
				float dotResult1269 = dot( (Left1219).xz , (Center2Cam1256).xz );
				float Xsign1285 = sign( dotResult1269 );
				float temp_output_1314_0 = (0.0 + (saturate( break1435.x ) - 0.0) * (_ShineMoveRange - 0.0) / (1.0 - 0.0));
				float3 appendResult1323 = (float3(( Zsign1271 >= 0.0 ? temp_output_1320_0 : -temp_output_1320_0 ) , 0.0 , ( Xsign1285 >= 0.0 ? temp_output_1314_0 : -temp_output_1314_0 )));
				float3 DynamicShine1347 = appendResult1323;
				float3 break1307 = ( -appendResult1332 + _ManualCubemapControl + (( _DynamicShineExperimental )?( DynamicShine1347 ):( float3( 0,0,0 ) )) );
				float2 texCoord1311 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float grayscale1312 = dot(tex2D( _ShineNoiseMap, texCoord1311 ).rgb, float3(0.299,0.587,0.114));
				float3 appendResult1308 = (float3(break1307.x , ( break1307.y + ( grayscale1312 * _NoiseFactor ) ) , break1307.z));
				float3 vertex1351 = appendResult1308;
				float3 break1456 = Center2Cam1256;
				float Rotation1384 = (360.0 + (( atan2( break1456.z , break1456.x ) / 6.28318548202515 ) - 0.0) * (0.0 - 360.0) / (1.0 - 0.0));
				float degrees1351 = (( _CubemapViewRoatationExperimental )?( ( _CubemapRotation + Rotation1384 ) ):( _CubemapRotation ));
				float3 localRotateAroundYInDegrees1351 = RotateAroundYInDegrees1351( vertex1351 , degrees1351 );
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float3 temp_cast_1 = (_MinDirectLight).xxx;
				float3 temp_output_1128_0 = max( ase_lightColor.rgb , temp_cast_1 );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 worldPos1029 = ase_worldPos;
				float localPureLightAttenuation1029 = PureLightAttenuation( worldPos1029 );
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float3 temp_output_1073_0 = ( temp_output_1128_0 * (( _ShadowinLightColor )?( ase_atten ):( localPureLightAttenuation1029 )) );
				float3 temp_cast_2 = (_MinDirectLight).xxx;
				float3 temp_cast_3 = (_MinDirectLight).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch1075 = temp_output_1073_0;
				#else
				float3 staticSwitch1075 = temp_output_1128_0;
				#endif
				float3 temp_cast_4 = (_MaxDirectLight).xxx;
				float4 Normal1127 = float4( 0,0,0,0 );
				float3 localShadeSH9out1127 = ShadeSH9out( Normal1127 );
				float3 localMaxShadeSH9876 = ( max(ShadeSH9(half4(0, 0, 0, 1)).rgb, ShadeSH9(half4(0, -1, 0, 1)).rgb) );
				float3 temp_cast_5 = (_MinIndirectLight).xxx;
				float3 temp_cast_6 = (_MaxIndirectLight).xxx;
				float3 temp_output_1005_0 = max( min( (( _NoShadowinDirectionalLightColor )?( staticSwitch1075 ):( temp_output_1073_0 )) , temp_cast_4 ) , min( max( (( _UnifyIndirectDiffuseLight )?( localMaxShadeSH9876 ):( localShadeSH9out1127 )) , temp_cast_5 ) , temp_cast_6 ) );
				float3 temp_cast_7 = (_MinDirectLight).xxx;
				float3 temp_cast_8 = (_MaxDirectLight).xxx;
				float3 temp_cast_9 = (_MinIndirectLight).xxx;
				float3 temp_cast_10 = (_MaxIndirectLight).xxx;
				float grayscale1095 = dot(temp_output_1005_0, float3(0.299,0.587,0.114));
				float3 temp_cast_11 = (grayscale1095).xxx;
				float3 lerpResult1096 = lerp( temp_output_1005_0 , temp_cast_11 , _LightColorGrayScale);
				float3 LightColor208 = lerpResult1096;
				float4 lerpResult1089 = lerp( float4( LightColor208 , 0.0 ) , _GlobalRimColor , _CustomRimLightColor);
				float4 temp_cast_13 = (_MinRimLightColor).xxxx;
				float4 clampResult1088 = clamp( lerpResult1089 , temp_cast_13 , float4( 1,1,1,0 ) );
				float4 SpecularColor539 = _SpecularColor;
				float4 RimColor2541 = _RimColor2;
				float4 lerpResult543 = lerp( SpecularColor539 , RimColor2541 , _RimSpecRate2);
				float3 localv_bias502 = v_bias();
				float3 localh_bias510 = h_bias();
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = i.ase_texcoord5.xyz;
				float dotResult505 = dot( ( ( -1.0 * localv_bias502 * _RimVerticalOffset2 ) + ( ( 1.0 - abs( _RimVerticalOffset2 ) ) * ( ( -1.0 * localh_bias510 * _RimHorizonOffset2 ) + ( ( 1.0 - abs( _RimHorizonOffset2 ) ) * ase_worldViewDir ) ) ) ) , ase_worldNormal );
				float rimoffset_Facing2513 = dotResult505;
				float2 uv_rimTex = i.ase_texcoord6.xyz.xy * _rimTex_ST.xy + _rimTex_ST.zw;
				float4 RimMask355 = ( tex2D( _rimTex, uv_rimTex ) + _RimTexOffset );
				float saferPower1466 = abs( _RimPower2 );
				float4 RimStrength2462 = ( _RimColor2.a * pow( saturate( ( ( _RimStep2 - rimoffset_Facing2513 ) / _RimFeather2 ) ) , 3.0 ) * RimMask355 * pow( saferPower1466 , 2.0 ) );
				float localIsThereALight797 = ( any(_WorldSpaceLightPos0.xyz) );
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(ase_worldPos);
				float3 localDefaultLightDir798 = ( normalize(UNITY_MATRIX_V[2].xyz + UNITY_MATRIX_V[1].xyz) );
				float3 LightDir801 = ( localIsThereALight797 == 1.0 ? worldSpaceLightDir : localDefaultLightDir798 );
				float dotResult779 = dot( LightDir801 , ase_worldNormal );
				float LambertTerm552 = dotResult779;
				float RimAtten1076 = localPureLightAttenuation1029;
				float lerpResult1085 = lerp( LambertTerm552 , ( LambertTerm552 * RimAtten1076 ) , _RimAttenuation2);
				float dotResult129 = dot( ase_worldViewDir , ase_worldNormal );
				float Facing136 = dotResult129;
				float fixed_specpower623 = exp2( ( ( _SpecularPower * -10.0 ) + 11.0 ) );
				float2 uv_spcMask = i.ase_texcoord6.xyz.xy * _spcMask_ST.xy + _spcMask_ST.zw;
				float4 SpecularMask436 = ( tex2D( _spcMask, uv_spcMask ) + _SpecularOffset );
				float4 SpecularPower438 = ( min( pow( max( Facing136 , 0.0 ) , ( ( fixed_specpower623 * 10.0 ) + 1.0 ) ) , 1.0 ) * SpecularMask436 * (0.0 + (_SpecularBias - 0.0) * (100.0 - 0.0) / (10.0 - 0.0)) );
				float GlobalLightFactor1011 = _GlobalLightFactor;
				float4 lerpResult1016 = lerp( ( _SpecularColor * SpecularPower438 ) , ( _SpecularColor * SpecularPower438 * float4( LightColor208 , 0.0 ) ) , GlobalLightFactor1011);
				float2 uv_MainTex = i.ase_texcoord6.xyz.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode64 = tex2D( _MainTex, uv_MainTex );
				float4 diff345 = tex2DNode64;
				float2 uv_sdwMask = i.ase_texcoord6.xyz.xy * _sdwMask_ST.xy + _sdwMask_ST.zw;
				float grayscale1168 = (tex2D( _sdwMask, uv_sdwMask ).rgb.r + tex2D( _sdwMask, uv_sdwMask ).rgb.g + tex2D( _sdwMask, uv_sdwMask ).rgb.b) / 3;
				float ShadowMask408 = grayscale1168;
				float HalfLambertTerm781 = (dotResult779*0.5 + 0.5);
				float localIsThereALight1124 = ( any(_WorldSpaceLightPos0.xyz) );
				float HalfShadowAttenuation1070 = ( localIsThereALight1124 == 1.0 ? (saturate( ase_atten )*0.5 + 0.5) : 1.0 );
				float shad_lerp339 = saturate( ( ( (( _OnlyPaintedShadow )?( ShadowMask408 ):( (( _ReceiveShadowLerp )?( ( ShadowMask408 * HalfLambertTerm781 * HalfShadowAttenuation1070 ) ):( ( ShadowMask408 * HalfLambertTerm781 ) )) )) + _ShadowStep ) / _ShadowFeather ) );
				float2 temp_cast_16 = (shad_lerp339).xx;
				float4 Grade330 = tex2D( _GradeTex, temp_cast_16 );
				float4 lerpResult1181 = lerp( diff345 , ( diff345 * saturate( ( Grade330 * _GradeScale ) ) ) , _GradeFactor);
				float DiffuseLightFactor1119 = _DiffuseLightFactor;
				float4 lerpResult1009 = lerp( lerpResult1181 , ( lerpResult1181 * float4( LightColor208 , 0.0 ) ) , DiffuseLightFactor1119);
				float4 lit_diff349 = lerpResult1009;
				float4 toon_diff370 = ( 0.5 >= _ToonDarkColor.a ? ( _ToonDarkColor * lit_diff349 ) : ( _ToonDarkColor + lit_diff349 ) );
				float4 lerpResult405 = lerp( toon_diff370 , ( 0.5 >= _ToonBrightColor.a ? ( _ToonBrightColor * lit_diff349 ) : ( _ToonBrightColor + lit_diff349 ) ) , shad_lerp339);
				float4 shaded_diff399 = lerpResult405;
				float4 specshaded_diff445 = ( lerpResult1016 + shaded_diff399 );
				float3 normal2view521 = mul( UNITY_MATRIX_V, float4( ase_worldNormal , 0.0 ) ).xyz;
				float3 normal1147 = ase_worldNormal;
				float3 viewDir1147 = ase_worldViewDir;
				float2 localgetMatcapUVs1147 = getMatcapUVs1147( normal1147 , viewDir1147 );
				float2 matcapUV1145 = localgetMatcapUVs1147;
				float3 ase_worldReflection = reflect(-ase_worldViewDir, ase_worldNormal);
				float3 dir1157 = ase_worldReflection;
				float smoothness1157 = _RefProbeSmoothness;
				float4 localRefProbe1157 = RefProbe( dir1157 , smoothness1157 );
				float2 uv_metalMask = i.ase_texcoord6.xyz.xy * _metalMask_ST.xy + _metalMask_ST.zw;
				float4 MetalMask350 = ( tex2D( _metalMask, uv_metalMask ) + _MetalOffset );
				float4 lerpResult532 = lerp( specshaded_diff445 , ( specshaded_diff445 * (( _UseReflectionProbeAsEnvMap )?( localRefProbe1157 ):( tex2D( _EnvTex, (( _EnvMatCap )?( float3( matcapUV1145 ,  0.0 ) ):( ( ( float3( float2( 1,1 ) ,  0.0 ) + normal2view521 ) * 0.5 ) )).xy ) )) * _EnvBias ) , saturate( ( _EnvRate * MetalMask350 ) ));
				float4 EnvSpecShaded_diff542 = lerpResult532;
				float lerpResult1083 = lerp( LambertTerm552 , ( LambertTerm552 * RimAtten1076 ) , _RimAttenuation);
				float4 RimColor540 = _RimColor;
				float4 lerpResult564 = lerp( SpecularColor539 , RimColor540 , _RimSpecRate);
				float3 localv_bias475 = v_bias();
				float3 localh_bias473 = h_bias();
				float dotResult463 = dot( ( ( -1.0 * localv_bias475 * _RimVerticalOffset ) + ( ( 1.0 - abs( _RimVerticalOffset ) ) * ( ( -1.0 * localh_bias473 * _RimHorizonOffset ) + ( ( 1.0 - abs( _RimHorizonOffset ) ) * ase_worldViewDir ) ) ) ) , ase_worldNormal );
				float rimoffset_Facing493 = dotResult463;
				float saferPower1465 = abs( _RimPower );
				float4 RimStrength427 = ( _RimColor.a * pow( saturate( ( ( _RimStep - rimoffset_Facing493 ) / _RimFeather ) ) , 3.0 ) * RimMask355 * pow( saferPower1465 , 2.0 ) );
				float4 temp_output_563_0 = ( ( saturate( lerpResult1083 ) + _RimShadowRate ) * ( lerpResult564 * RimStrength427 ) * clampResult1088 );
				float4 RimEnvSpecShaded_diff562 = ( EnvSpecShaded_diff542 + temp_output_563_0 );
				float4 Rim2EnvSpecShaded_diff577 = ( ( clampResult1088 * ( lerpResult543 * RimStrength2462 ) * ( saturate( lerpResult1085 ) + _RimShadowRate2 ) ) + RimEnvSpecShaded_diff562 );
				float4 BeforeEmi_diff1354 = ( ( texCUBE( _Hcubemap, localRotateAroundYInDegrees1351 ) * _HairShineColor * ( _HairShinePower * 10.0 ) ) + Rim2EnvSpecShaded_diff577 );
				float4 lerpResult1021 = lerp( ( _CharaColor * BeforeEmi_diff1354 ) , ( _CharaColor * BeforeEmi_diff1354 * float4( LightColor208 , 0.0 ) ) , GlobalLightFactor1011);
				float2 uv_EmiTex = i.ase_texcoord6.xyz.xy * _EmiTex_ST.xy + _EmiTex_ST.zw;
				float4 Emissive600 = tex2D( _EmiTex, uv_EmiTex );
				float4 Refined_diff612 = ( lerpResult1021 + ( ( 1.0 - (0) ) * Emissive600 * _EmissiveColor * _EmmisiveStrength ) );
				float dotResult614 = dot( _UnsaturationColor , Refined_diff612 );
				float4 temp_cast_26 = (dotResult614).xxxx;
				float4 lerpResult616 = lerp( temp_cast_26 , Refined_diff612 , _Saturation);
				float4 output_diff618 = lerpResult616;
				
				
				outColor = output_diff618.rgb;
				outAlpha = 1;
				return float4(outColor,outAlpha);
			}
			ENDCG
		}
		
		
		Pass
		{
			Name "ForwardAdd"
			Tags { "LightMode"="ForwardAdd" }
			ZWrite Off
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend One One, Zero One
			BlendOp Max, Max
			AlphaToMask Off
			Cull [_CullMode]
			ColorMask RGBA
			Stencil
			{
				Ref [_StencilReference]
				ReadMask [_StencilReadMask]
				WriteMask [_StencilWriteMask]
				Comp [_StencilComparison]
				Pass [_StencilPassFront]
				Fail [_StencilFailFront]
				ZFail [_StencilZFailFront]
			}
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdadd_fullshadows
			#ifndef UNITY_PASS_FORWARDADD
			#define UNITY_PASS_FORWARDADD
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_SHADOWS 1
			#define ASE_NEEDS_VERT_NORMAL

			//This is a late directive
			
			uniform float _StencilZFailFront;
			uniform float _StencilComparison;
			uniform float _StencilPassFront;
			uniform float _StencilFailFront;
			uniform float _StencilWriteMask;
			uniform float _StencilReadMask;
			uniform float _StencilReference;
			uniform float _CullMode;
			uniform float4 _UnsaturationColor;
			uniform float4 _CharaColor;
			uniform samplerCUBE _Hcubemap;
			uniform float3 _ManualCubemapControl;
			uniform float _DynamicShineExperimental;
			uniform float _ObjectSpace;
			uniform float _IsRightHandCoordinateSystem;
			uniform float3 _FaceForward;
			uniform float3 _FaceCenterPos;
			uniform float3 _FaceUp;
			uniform float _ShineMoveRange;
			uniform sampler2D _ShineNoiseMap;
			uniform float _NoiseFactor;
			uniform float _CubemapViewRoatationExperimental;
			uniform float _CubemapRotation;
			uniform float4 _HairShineColor;
			uniform float _HairShinePower;
			uniform float _NoShadowinDirectionalLightColor;
			uniform float _MinDirectLight;
			uniform float _ShadowinLightColor;
			uniform float _MaxDirectLight;
			uniform float _UnifyIndirectDiffuseLight;
			uniform float _MinIndirectLight;
			uniform float _MaxIndirectLight;
			uniform float _LightColorGrayScale;
			uniform float4 _GlobalRimColor;
			uniform float _CustomRimLightColor;
			uniform float _MinRimLightColor;
			uniform float4 _SpecularColor;
			uniform float4 _RimColor2;
			uniform float _RimSpecRate2;
			uniform float _RimStep2;
			uniform float _RimVerticalOffset2;
			uniform float _RimHorizonOffset2;
			uniform float _RimFeather2;
			uniform sampler2D _rimTex;
			uniform float4 _rimTex_ST;
			uniform float _RimTexOffset;
			uniform float _RimPower2;
			uniform float _RimAttenuation2;
			uniform float _RimShadowRate2;
			uniform float _SpecularPower;
			uniform sampler2D _spcMask;
			uniform float4 _spcMask_ST;
			uniform float _SpecularOffset;
			uniform float _SpecularBias;
			uniform float _GlobalLightFactor;
			uniform float4 _ToonDarkColor;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform sampler2D _GradeTex;
			uniform float _OnlyPaintedShadow;
			uniform float _ReceiveShadowLerp;
			uniform sampler2D _sdwMask;
			uniform float4 _sdwMask_ST;
			uniform float _ShadowStep;
			uniform float _ShadowFeather;
			uniform float _GradeScale;
			uniform float _GradeFactor;
			uniform float _DiffuseLightFactor;
			uniform float4 _ToonBrightColor;
			uniform float _UseReflectionProbeAsEnvMap;
			uniform sampler2D _EnvTex;
			uniform float _EnvMatCap;
			uniform float _RefProbeSmoothness;
			uniform float _EnvBias;
			uniform float _EnvRate;
			uniform sampler2D _metalMask;
			uniform float4 _metalMask_ST;
			uniform float _MetalOffset;
			uniform float _RimAttenuation;
			uniform float _RimShadowRate;
			uniform float4 _RimColor;
			uniform float _RimSpecRate;
			uniform float _RimStep;
			uniform float _RimVerticalOffset;
			uniform float _RimHorizonOffset;
			uniform float _RimFeather;
			uniform float _RimPower;
			uniform sampler2D _EmiTex;
			uniform float4 _EmiTex_ST;
			uniform float4 _EmissiveColor;
			uniform float _EmmisiveStrength;
			uniform float _Saturation;
			inline float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max( 0.001f , dot( inVec , inVec ) );
				return inVec* rsqrt( dp3);
			}
			
			float3 RotateAroundYInDegrees1351( float3 vertex, float degrees )
			{
				float alpha = degrees * UNITY_PI / 180.0;
				float sina, cosa;
				sincos(alpha, sina, cosa);
				float2x2 m = float2x2(cosa, -sina, sina, cosa);
				return float3(mul(m, vertex.xz), vertex.y).xzy;
			}
			
			float PureLightAttenuation( float3 worldPos )
			{
				#ifdef POINT
				        unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz; \
				        return tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r;
				#endif
				#ifdef SPOT
				#if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1))
				#else
				#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = input._LightCoord
				#endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz);
				#endif
				#ifdef DIRECTIONAL
				        return 1;
				#endif
				#ifdef POINT_COOKIE
				#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz
				#   else
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = input._LightCoord
				#   endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).r * texCUBE(_LightTexture0, lightCoord).w;
				#endif
				#ifdef DIRECTIONAL_COOKIE
				#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xy
				#   else
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = input._LightCoord
				#   endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return tex2D(_LightTexture0, lightCoord).w;
				#endif
			}
			
			float3 ShadeSH9out( half4 Normal )
			{
				return ShadeSH9(Normal);
			}
			
			float3 v_bias(  )
			{
				return float3(unity_MatrixV[0][1],unity_MatrixV[1][1],unity_MatrixV[2][1]);
			}
			
			float3 h_bias(  )
			{
				return float3(unity_MatrixV[0][0],unity_MatrixV[0][1],unity_MatrixV[0][2]);
			}
			
			float2 getMatcapUVs1147( float3 normal, float3 viewDir )
			{
				half3 worldUp = float3(0, 1, 0);
				half3 worldViewUp = normalize(worldUp - viewDir * dot(viewDir, worldUp));
				half3 worldViewRight = normalize(cross(viewDir, worldViewUp));
				return half2(dot(worldViewRight, normal), dot(worldViewUp, normal)) * 0.5 + 0.5;
			}
			
			float4 RefProbe( float3 dir, float smoothness )
			{
				float4 cube = 1;
				float roughness = 1 - smoothness;
				roughness *= 1.7 - 0.7 * roughness;
				float4 val = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, dir, roughness * UNITY_SPECCUBE_LOD_STEPS);
				cube.xyz = (DecodeHDR(val, unity_SpecCube0_HDR));
				return cube;
			}
			


			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 pos : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_SHADOW_COORDS(4)
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
			};
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				o.ase_texcoord3.xyz = ase_worldPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				o.ase_texcoord1 = v.vertex;
				o.ase_texcoord2.xy = v.ase_texcoord1.xy;
				o.ase_texcoord6.xyz = v.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				
				v.vertex.xyz +=  float3(0,0,0) ;
				o.pos = UnityObjectToClipPos(v.vertex);
				#if ASE_SHADOWS
					#if UNITY_VERSION >= 560
						UNITY_TRANSFER_SHADOW( o, v.texcoord );
					#else
						TRANSFER_SHADOW( o );
					#endif
				#endif
				return o;
			}
			
			float4 frag (v2f i ) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				float3 appendResult1332 = (float3(i.ase_texcoord1.xyz.y , i.ase_texcoord1.xyz.x , i.ase_texcoord1.xyz.z));
				float3 appendResult1244 = (float3(-_FaceForward.y , _FaceForward.z , -_FaceForward.x));
				float3 temp_output_1243_0 = ( _IsRightHandCoordinateSystem == 1.0 ? appendResult1244 : _FaceForward );
				float3 objToWorldDir1230 = ASESafeNormalize( mul( unity_ObjectToWorld, float4( temp_output_1243_0, 0 ) ).xyz );
				float3 normalizeResult1235 = normalize( ( _ObjectSpace == 0.0 ? temp_output_1243_0 : objToWorldDir1230 ) );
				float3 Forward1241 = normalizeResult1235;
				float isObjectSpace1232 = _ObjectSpace;
				float3 appendResult1253 = (float3(-_FaceCenterPos.y , _FaceCenterPos.z , -_FaceCenterPos.x));
				float3 temp_output_1255_0 = ( _IsRightHandCoordinateSystem == 1.0 ? appendResult1253 : _FaceCenterPos );
				float3 objToWorld1227 = mul( unity_ObjectToWorld, float4( temp_output_1255_0, 1 ) ).xyz;
				float3 temp_output_1226_0 = ( isObjectSpace1232 == 0.0 ? temp_output_1255_0 : objToWorld1227 );
				float3 normalizeResult1228 = normalize( ( _WorldSpaceCameraPos - temp_output_1226_0 ) );
				float3 Center2Cam1256 = normalizeResult1228;
				float dotResult1273 = dot( (Forward1241).yz , (Center2Cam1256).yz );
				float Zsign1271 = sign( dotResult1273 );
				float3 break1435 = abs( Center2Cam1256 );
				float3 appendResult1248 = (float3(-_FaceUp.y , _FaceUp.z , -_FaceUp.x));
				float3 temp_output_1247_0 = ( _IsRightHandCoordinateSystem == 1.0 ? appendResult1248 : _FaceUp );
				float3 objToWorldDir1238 = ASESafeNormalize( mul( unity_ObjectToWorld, float4( temp_output_1247_0, 0 ) ).xyz );
				float3 normalizeResult1236 = normalize( ( isObjectSpace1232 == 0.0 ? temp_output_1247_0 : objToWorldDir1238 ) );
				float3 Up1242 = normalizeResult1236;
				float3 normalizeResult1220 = normalize( cross( Forward1241 , Up1242 ) );
				float3 Left1219 = normalizeResult1220;
				float dotResult1264 = dot( Center2Cam1256 , Left1219 );
				float3 normalizeResult1295 = normalize( ( dotResult1264 * Left1219 ) );
				float3 normalizeResult1294 = normalize( ( Center2Cam1256 - normalizeResult1295 ) );
				float3 ProjectedZ1293 = normalizeResult1294;
				float dotResult1300 = dot( Up1242 , ProjectedZ1293 );
				float Zvalue1304 = ( 1.0 - abs( dotResult1300 ) );
				float temp_output_1320_0 = (0.0 + (saturate( ( saturate( break1435.z ) * Zvalue1304 ) ) - 0.0) * (_ShineMoveRange - 0.0) / (1.0 - 0.0));
				float dotResult1269 = dot( (Left1219).xz , (Center2Cam1256).xz );
				float Xsign1285 = sign( dotResult1269 );
				float temp_output_1314_0 = (0.0 + (saturate( break1435.x ) - 0.0) * (_ShineMoveRange - 0.0) / (1.0 - 0.0));
				float3 appendResult1323 = (float3(( Zsign1271 >= 0.0 ? temp_output_1320_0 : -temp_output_1320_0 ) , 0.0 , ( Xsign1285 >= 0.0 ? temp_output_1314_0 : -temp_output_1314_0 )));
				float3 DynamicShine1347 = appendResult1323;
				float3 break1307 = ( -appendResult1332 + _ManualCubemapControl + (( _DynamicShineExperimental )?( DynamicShine1347 ):( float3( 0,0,0 ) )) );
				float2 texCoord1311 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float grayscale1312 = dot(tex2D( _ShineNoiseMap, texCoord1311 ).rgb, float3(0.299,0.587,0.114));
				float3 appendResult1308 = (float3(break1307.x , ( break1307.y + ( grayscale1312 * _NoiseFactor ) ) , break1307.z));
				float3 vertex1351 = appendResult1308;
				float3 break1456 = Center2Cam1256;
				float Rotation1384 = (360.0 + (( atan2( break1456.z , break1456.x ) / 6.28318548202515 ) - 0.0) * (0.0 - 360.0) / (1.0 - 0.0));
				float degrees1351 = (( _CubemapViewRoatationExperimental )?( ( _CubemapRotation + Rotation1384 ) ):( _CubemapRotation ));
				float3 localRotateAroundYInDegrees1351 = RotateAroundYInDegrees1351( vertex1351 , degrees1351 );
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float3 temp_cast_1 = (_MinDirectLight).xxx;
				float3 temp_output_1128_0 = max( ase_lightColor.rgb , temp_cast_1 );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 worldPos1029 = ase_worldPos;
				float localPureLightAttenuation1029 = PureLightAttenuation( worldPos1029 );
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float3 temp_output_1073_0 = ( temp_output_1128_0 * (( _ShadowinLightColor )?( ase_atten ):( localPureLightAttenuation1029 )) );
				float3 temp_cast_2 = (_MinDirectLight).xxx;
				float3 temp_cast_3 = (_MinDirectLight).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch1075 = temp_output_1073_0;
				#else
				float3 staticSwitch1075 = temp_output_1128_0;
				#endif
				float3 temp_cast_4 = (_MaxDirectLight).xxx;
				float4 Normal1127 = float4( 0,0,0,0 );
				float3 localShadeSH9out1127 = ShadeSH9out( Normal1127 );
				float3 localMaxShadeSH9876 = ( max(ShadeSH9(half4(0, 0, 0, 1)).rgb, ShadeSH9(half4(0, -1, 0, 1)).rgb) );
				float3 temp_cast_5 = (_MinIndirectLight).xxx;
				float3 temp_cast_6 = (_MaxIndirectLight).xxx;
				float3 temp_output_1005_0 = max( min( (( _NoShadowinDirectionalLightColor )?( staticSwitch1075 ):( temp_output_1073_0 )) , temp_cast_4 ) , min( max( (( _UnifyIndirectDiffuseLight )?( localMaxShadeSH9876 ):( localShadeSH9out1127 )) , temp_cast_5 ) , temp_cast_6 ) );
				float3 temp_cast_7 = (_MinDirectLight).xxx;
				float3 temp_cast_8 = (_MaxDirectLight).xxx;
				float3 temp_cast_9 = (_MinIndirectLight).xxx;
				float3 temp_cast_10 = (_MaxIndirectLight).xxx;
				float grayscale1095 = dot(temp_output_1005_0, float3(0.299,0.587,0.114));
				float3 temp_cast_11 = (grayscale1095).xxx;
				float3 lerpResult1096 = lerp( temp_output_1005_0 , temp_cast_11 , _LightColorGrayScale);
				float3 LightColor208 = lerpResult1096;
				float4 lerpResult1089 = lerp( float4( LightColor208 , 0.0 ) , _GlobalRimColor , _CustomRimLightColor);
				float4 temp_cast_13 = (_MinRimLightColor).xxxx;
				float4 clampResult1088 = clamp( lerpResult1089 , temp_cast_13 , float4( 1,1,1,0 ) );
				float4 SpecularColor539 = _SpecularColor;
				float4 RimColor2541 = _RimColor2;
				float4 lerpResult543 = lerp( SpecularColor539 , RimColor2541 , _RimSpecRate2);
				float3 localv_bias502 = v_bias();
				float3 localh_bias510 = h_bias();
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = i.ase_texcoord5.xyz;
				float dotResult505 = dot( ( ( -1.0 * localv_bias502 * _RimVerticalOffset2 ) + ( ( 1.0 - abs( _RimVerticalOffset2 ) ) * ( ( -1.0 * localh_bias510 * _RimHorizonOffset2 ) + ( ( 1.0 - abs( _RimHorizonOffset2 ) ) * ase_worldViewDir ) ) ) ) , ase_worldNormal );
				float rimoffset_Facing2513 = dotResult505;
				float2 uv_rimTex = i.ase_texcoord6.xyz.xy * _rimTex_ST.xy + _rimTex_ST.zw;
				float4 RimMask355 = ( tex2D( _rimTex, uv_rimTex ) + _RimTexOffset );
				float saferPower1466 = abs( _RimPower2 );
				float4 RimStrength2462 = ( _RimColor2.a * pow( saturate( ( ( _RimStep2 - rimoffset_Facing2513 ) / _RimFeather2 ) ) , 3.0 ) * RimMask355 * pow( saferPower1466 , 2.0 ) );
				float localIsThereALight797 = ( any(_WorldSpaceLightPos0.xyz) );
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(ase_worldPos);
				float3 localDefaultLightDir798 = ( normalize(UNITY_MATRIX_V[2].xyz + UNITY_MATRIX_V[1].xyz) );
				float3 LightDir801 = ( localIsThereALight797 == 1.0 ? worldSpaceLightDir : localDefaultLightDir798 );
				float dotResult779 = dot( LightDir801 , ase_worldNormal );
				float LambertTerm552 = dotResult779;
				float RimAtten1076 = localPureLightAttenuation1029;
				float lerpResult1085 = lerp( LambertTerm552 , ( LambertTerm552 * RimAtten1076 ) , _RimAttenuation2);
				float dotResult129 = dot( ase_worldViewDir , ase_worldNormal );
				float Facing136 = dotResult129;
				float fixed_specpower623 = exp2( ( ( _SpecularPower * -10.0 ) + 11.0 ) );
				float2 uv_spcMask = i.ase_texcoord6.xyz.xy * _spcMask_ST.xy + _spcMask_ST.zw;
				float4 SpecularMask436 = ( tex2D( _spcMask, uv_spcMask ) + _SpecularOffset );
				float4 SpecularPower438 = ( min( pow( max( Facing136 , 0.0 ) , ( ( fixed_specpower623 * 10.0 ) + 1.0 ) ) , 1.0 ) * SpecularMask436 * (0.0 + (_SpecularBias - 0.0) * (100.0 - 0.0) / (10.0 - 0.0)) );
				float GlobalLightFactor1011 = _GlobalLightFactor;
				float4 lerpResult1016 = lerp( ( _SpecularColor * SpecularPower438 ) , ( _SpecularColor * SpecularPower438 * float4( LightColor208 , 0.0 ) ) , GlobalLightFactor1011);
				float2 uv_MainTex = i.ase_texcoord6.xyz.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode64 = tex2D( _MainTex, uv_MainTex );
				float4 diff345 = tex2DNode64;
				float2 uv_sdwMask = i.ase_texcoord6.xyz.xy * _sdwMask_ST.xy + _sdwMask_ST.zw;
				float grayscale1168 = (tex2D( _sdwMask, uv_sdwMask ).rgb.r + tex2D( _sdwMask, uv_sdwMask ).rgb.g + tex2D( _sdwMask, uv_sdwMask ).rgb.b) / 3;
				float ShadowMask408 = grayscale1168;
				float HalfLambertTerm781 = (dotResult779*0.5 + 0.5);
				float localIsThereALight1124 = ( any(_WorldSpaceLightPos0.xyz) );
				float HalfShadowAttenuation1070 = ( localIsThereALight1124 == 1.0 ? (saturate( ase_atten )*0.5 + 0.5) : 1.0 );
				float shad_lerp339 = saturate( ( ( (( _OnlyPaintedShadow )?( ShadowMask408 ):( (( _ReceiveShadowLerp )?( ( ShadowMask408 * HalfLambertTerm781 * HalfShadowAttenuation1070 ) ):( ( ShadowMask408 * HalfLambertTerm781 ) )) )) + _ShadowStep ) / _ShadowFeather ) );
				float2 temp_cast_16 = (shad_lerp339).xx;
				float4 Grade330 = tex2D( _GradeTex, temp_cast_16 );
				float4 lerpResult1181 = lerp( diff345 , ( diff345 * saturate( ( Grade330 * _GradeScale ) ) ) , _GradeFactor);
				float DiffuseLightFactor1119 = _DiffuseLightFactor;
				float4 lerpResult1009 = lerp( lerpResult1181 , ( lerpResult1181 * float4( LightColor208 , 0.0 ) ) , DiffuseLightFactor1119);
				float4 lit_diff349 = lerpResult1009;
				float4 toon_diff370 = ( 0.5 >= _ToonDarkColor.a ? ( _ToonDarkColor * lit_diff349 ) : ( _ToonDarkColor + lit_diff349 ) );
				float4 lerpResult405 = lerp( toon_diff370 , ( 0.5 >= _ToonBrightColor.a ? ( _ToonBrightColor * lit_diff349 ) : ( _ToonBrightColor + lit_diff349 ) ) , shad_lerp339);
				float4 shaded_diff399 = lerpResult405;
				float4 specshaded_diff445 = ( lerpResult1016 + shaded_diff399 );
				float3 normal2view521 = mul( UNITY_MATRIX_V, float4( ase_worldNormal , 0.0 ) ).xyz;
				float3 normal1147 = ase_worldNormal;
				float3 viewDir1147 = ase_worldViewDir;
				float2 localgetMatcapUVs1147 = getMatcapUVs1147( normal1147 , viewDir1147 );
				float2 matcapUV1145 = localgetMatcapUVs1147;
				float3 ase_worldReflection = reflect(-ase_worldViewDir, ase_worldNormal);
				float3 dir1157 = ase_worldReflection;
				float smoothness1157 = _RefProbeSmoothness;
				float4 localRefProbe1157 = RefProbe( dir1157 , smoothness1157 );
				float2 uv_metalMask = i.ase_texcoord6.xyz.xy * _metalMask_ST.xy + _metalMask_ST.zw;
				float4 MetalMask350 = ( tex2D( _metalMask, uv_metalMask ) + _MetalOffset );
				float4 lerpResult532 = lerp( specshaded_diff445 , ( specshaded_diff445 * (( _UseReflectionProbeAsEnvMap )?( localRefProbe1157 ):( tex2D( _EnvTex, (( _EnvMatCap )?( float3( matcapUV1145 ,  0.0 ) ):( ( ( float3( float2( 1,1 ) ,  0.0 ) + normal2view521 ) * 0.5 ) )).xy ) )) * _EnvBias ) , saturate( ( _EnvRate * MetalMask350 ) ));
				float4 EnvSpecShaded_diff542 = lerpResult532;
				float lerpResult1083 = lerp( LambertTerm552 , ( LambertTerm552 * RimAtten1076 ) , _RimAttenuation);
				float4 RimColor540 = _RimColor;
				float4 lerpResult564 = lerp( SpecularColor539 , RimColor540 , _RimSpecRate);
				float3 localv_bias475 = v_bias();
				float3 localh_bias473 = h_bias();
				float dotResult463 = dot( ( ( -1.0 * localv_bias475 * _RimVerticalOffset ) + ( ( 1.0 - abs( _RimVerticalOffset ) ) * ( ( -1.0 * localh_bias473 * _RimHorizonOffset ) + ( ( 1.0 - abs( _RimHorizonOffset ) ) * ase_worldViewDir ) ) ) ) , ase_worldNormal );
				float rimoffset_Facing493 = dotResult463;
				float saferPower1465 = abs( _RimPower );
				float4 RimStrength427 = ( _RimColor.a * pow( saturate( ( ( _RimStep - rimoffset_Facing493 ) / _RimFeather ) ) , 3.0 ) * RimMask355 * pow( saferPower1465 , 2.0 ) );
				float4 temp_output_563_0 = ( ( saturate( lerpResult1083 ) + _RimShadowRate ) * ( lerpResult564 * RimStrength427 ) * clampResult1088 );
				float4 RimEnvSpecShaded_diff562 = ( EnvSpecShaded_diff542 + temp_output_563_0 );
				float4 Rim2EnvSpecShaded_diff577 = ( ( clampResult1088 * ( lerpResult543 * RimStrength2462 ) * ( saturate( lerpResult1085 ) + _RimShadowRate2 ) ) + RimEnvSpecShaded_diff562 );
				float4 BeforeEmi_diff1354 = ( ( texCUBE( _Hcubemap, localRotateAroundYInDegrees1351 ) * _HairShineColor * ( _HairShinePower * 10.0 ) ) + Rim2EnvSpecShaded_diff577 );
				float4 lerpResult1021 = lerp( ( _CharaColor * BeforeEmi_diff1354 ) , ( _CharaColor * BeforeEmi_diff1354 * float4( LightColor208 , 0.0 ) ) , GlobalLightFactor1011);
				float2 uv_EmiTex = i.ase_texcoord6.xyz.xy * _EmiTex_ST.xy + _EmiTex_ST.zw;
				float4 Emissive600 = tex2D( _EmiTex, uv_EmiTex );
				float4 Refined_diff612 = ( lerpResult1021 + ( ( 1.0 - (0) ) * Emissive600 * _EmissiveColor * _EmmisiveStrength ) );
				float dotResult614 = dot( _UnsaturationColor , Refined_diff612 );
				float4 temp_cast_26 = (dotResult614).xxxx;
				float4 lerpResult616 = lerp( temp_cast_26 , Refined_diff612 , _Saturation);
				float4 output_diff618 = lerpResult616;
				
				
				outColor = output_diff618.rgb;
				outAlpha = 1;
				return float4(outColor,outAlpha);
			}
			ENDCG
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			ZWrite On
			ZTest LEqual
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_shadowcaster
			#ifndef UNITY_PASS_SHADOWCASTER
			#define UNITY_PASS_SHADOWCASTER
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_SHADOWS 1
			#define ASE_NEEDS_VERT_NORMAL

			//This is a late directive
			
			uniform float _StencilZFailFront;
			uniform float _StencilComparison;
			uniform float _StencilPassFront;
			uniform float _StencilFailFront;
			uniform float _StencilWriteMask;
			uniform float _StencilReadMask;
			uniform float _StencilReference;
			uniform float _CullMode;
			uniform float4 _UnsaturationColor;
			uniform float4 _CharaColor;
			uniform samplerCUBE _Hcubemap;
			uniform float3 _ManualCubemapControl;
			uniform float _DynamicShineExperimental;
			uniform float _ObjectSpace;
			uniform float _IsRightHandCoordinateSystem;
			uniform float3 _FaceForward;
			uniform float3 _FaceCenterPos;
			uniform float3 _FaceUp;
			uniform float _ShineMoveRange;
			uniform sampler2D _ShineNoiseMap;
			uniform float _NoiseFactor;
			uniform float _CubemapViewRoatationExperimental;
			uniform float _CubemapRotation;
			uniform float4 _HairShineColor;
			uniform float _HairShinePower;
			uniform float _NoShadowinDirectionalLightColor;
			uniform float _MinDirectLight;
			uniform float _ShadowinLightColor;
			uniform float _MaxDirectLight;
			uniform float _UnifyIndirectDiffuseLight;
			uniform float _MinIndirectLight;
			uniform float _MaxIndirectLight;
			uniform float _LightColorGrayScale;
			uniform float4 _GlobalRimColor;
			uniform float _CustomRimLightColor;
			uniform float _MinRimLightColor;
			uniform float4 _SpecularColor;
			uniform float4 _RimColor2;
			uniform float _RimSpecRate2;
			uniform float _RimStep2;
			uniform float _RimVerticalOffset2;
			uniform float _RimHorizonOffset2;
			uniform float _RimFeather2;
			uniform sampler2D _rimTex;
			uniform float4 _rimTex_ST;
			uniform float _RimTexOffset;
			uniform float _RimPower2;
			uniform float _RimAttenuation2;
			uniform float _RimShadowRate2;
			uniform float _SpecularPower;
			uniform sampler2D _spcMask;
			uniform float4 _spcMask_ST;
			uniform float _SpecularOffset;
			uniform float _SpecularBias;
			uniform float _GlobalLightFactor;
			uniform float4 _ToonDarkColor;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform sampler2D _GradeTex;
			uniform float _OnlyPaintedShadow;
			uniform float _ReceiveShadowLerp;
			uniform sampler2D _sdwMask;
			uniform float4 _sdwMask_ST;
			uniform float _ShadowStep;
			uniform float _ShadowFeather;
			uniform float _GradeScale;
			uniform float _GradeFactor;
			uniform float _DiffuseLightFactor;
			uniform float4 _ToonBrightColor;
			uniform float _UseReflectionProbeAsEnvMap;
			uniform sampler2D _EnvTex;
			uniform float _EnvMatCap;
			uniform float _RefProbeSmoothness;
			uniform float _EnvBias;
			uniform float _EnvRate;
			uniform sampler2D _metalMask;
			uniform float4 _metalMask_ST;
			uniform float _MetalOffset;
			uniform float _RimAttenuation;
			uniform float _RimShadowRate;
			uniform float4 _RimColor;
			uniform float _RimSpecRate;
			uniform float _RimStep;
			uniform float _RimVerticalOffset;
			uniform float _RimHorizonOffset;
			uniform float _RimFeather;
			uniform float _RimPower;
			uniform sampler2D _EmiTex;
			uniform float4 _EmiTex_ST;
			uniform float4 _EmissiveColor;
			uniform float _EmmisiveStrength;
			uniform float _Saturation;
			inline float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max( 0.001f , dot( inVec , inVec ) );
				return inVec* rsqrt( dp3);
			}
			
			float3 RotateAroundYInDegrees1351( float3 vertex, float degrees )
			{
				float alpha = degrees * UNITY_PI / 180.0;
				float sina, cosa;
				sincos(alpha, sina, cosa);
				float2x2 m = float2x2(cosa, -sina, sina, cosa);
				return float3(mul(m, vertex.xz), vertex.y).xzy;
			}
			
			float PureLightAttenuation( float3 worldPos )
			{
				#ifdef POINT
				        unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz; \
				        return tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r;
				#endif
				#ifdef SPOT
				#if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1))
				#else
				#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = input._LightCoord
				#endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz);
				#endif
				#ifdef DIRECTIONAL
				        return 1;
				#endif
				#ifdef POINT_COOKIE
				#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz
				#   else
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = input._LightCoord
				#   endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).r * texCUBE(_LightTexture0, lightCoord).w;
				#endif
				#ifdef DIRECTIONAL_COOKIE
				#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xy
				#   else
				#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = input._LightCoord
				#   endif
				        DECLARE_LIGHT_COORD(input, worldPos); \
				        return tex2D(_LightTexture0, lightCoord).w;
				#endif
			}
			
			float3 ShadeSH9out( half4 Normal )
			{
				return ShadeSH9(Normal);
			}
			
			float3 v_bias(  )
			{
				return float3(unity_MatrixV[0][1],unity_MatrixV[1][1],unity_MatrixV[2][1]);
			}
			
			float3 h_bias(  )
			{
				return float3(unity_MatrixV[0][0],unity_MatrixV[0][1],unity_MatrixV[0][2]);
			}
			
			float2 getMatcapUVs1147( float3 normal, float3 viewDir )
			{
				half3 worldUp = float3(0, 1, 0);
				half3 worldViewUp = normalize(worldUp - viewDir * dot(viewDir, worldUp));
				half3 worldViewRight = normalize(cross(viewDir, worldViewUp));
				return half2(dot(worldViewRight, normal), dot(worldViewUp, normal)) * 0.5 + 0.5;
			}
			
			float4 RefProbe( float3 dir, float smoothness )
			{
				float4 cube = 1;
				float roughness = 1 - smoothness;
				roughness *= 1.7 - 0.7 * roughness;
				float4 val = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, dir, roughness * UNITY_SPECCUBE_LOD_STEPS);
				cube.xyz = (DecodeHDR(val, unity_SpecCube0_HDR));
				return cube;
			}
			


			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				V2F_SHADOW_CASTER;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_SHADOW_COORDS(4)
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
			};

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				o.ase_texcoord3.xyz = ase_worldPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				o.ase_texcoord1 = v.vertex;
				o.ase_texcoord2.xy = v.ase_texcoord1.xy;
				o.ase_texcoord6.xyz = v.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				
				v.vertex.xyz +=  float3(0,0,0) ;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
				return o;
			}
			
			float4 frag (v2f i ) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				float3 appendResult1332 = (float3(i.ase_texcoord1.xyz.y , i.ase_texcoord1.xyz.x , i.ase_texcoord1.xyz.z));
				float3 appendResult1244 = (float3(-_FaceForward.y , _FaceForward.z , -_FaceForward.x));
				float3 temp_output_1243_0 = ( _IsRightHandCoordinateSystem == 1.0 ? appendResult1244 : _FaceForward );
				float3 objToWorldDir1230 = ASESafeNormalize( mul( unity_ObjectToWorld, float4( temp_output_1243_0, 0 ) ).xyz );
				float3 normalizeResult1235 = normalize( ( _ObjectSpace == 0.0 ? temp_output_1243_0 : objToWorldDir1230 ) );
				float3 Forward1241 = normalizeResult1235;
				float isObjectSpace1232 = _ObjectSpace;
				float3 appendResult1253 = (float3(-_FaceCenterPos.y , _FaceCenterPos.z , -_FaceCenterPos.x));
				float3 temp_output_1255_0 = ( _IsRightHandCoordinateSystem == 1.0 ? appendResult1253 : _FaceCenterPos );
				float3 objToWorld1227 = mul( unity_ObjectToWorld, float4( temp_output_1255_0, 1 ) ).xyz;
				float3 temp_output_1226_0 = ( isObjectSpace1232 == 0.0 ? temp_output_1255_0 : objToWorld1227 );
				float3 normalizeResult1228 = normalize( ( _WorldSpaceCameraPos - temp_output_1226_0 ) );
				float3 Center2Cam1256 = normalizeResult1228;
				float dotResult1273 = dot( (Forward1241).yz , (Center2Cam1256).yz );
				float Zsign1271 = sign( dotResult1273 );
				float3 break1435 = abs( Center2Cam1256 );
				float3 appendResult1248 = (float3(-_FaceUp.y , _FaceUp.z , -_FaceUp.x));
				float3 temp_output_1247_0 = ( _IsRightHandCoordinateSystem == 1.0 ? appendResult1248 : _FaceUp );
				float3 objToWorldDir1238 = ASESafeNormalize( mul( unity_ObjectToWorld, float4( temp_output_1247_0, 0 ) ).xyz );
				float3 normalizeResult1236 = normalize( ( isObjectSpace1232 == 0.0 ? temp_output_1247_0 : objToWorldDir1238 ) );
				float3 Up1242 = normalizeResult1236;
				float3 normalizeResult1220 = normalize( cross( Forward1241 , Up1242 ) );
				float3 Left1219 = normalizeResult1220;
				float dotResult1264 = dot( Center2Cam1256 , Left1219 );
				float3 normalizeResult1295 = normalize( ( dotResult1264 * Left1219 ) );
				float3 normalizeResult1294 = normalize( ( Center2Cam1256 - normalizeResult1295 ) );
				float3 ProjectedZ1293 = normalizeResult1294;
				float dotResult1300 = dot( Up1242 , ProjectedZ1293 );
				float Zvalue1304 = ( 1.0 - abs( dotResult1300 ) );
				float temp_output_1320_0 = (0.0 + (saturate( ( saturate( break1435.z ) * Zvalue1304 ) ) - 0.0) * (_ShineMoveRange - 0.0) / (1.0 - 0.0));
				float dotResult1269 = dot( (Left1219).xz , (Center2Cam1256).xz );
				float Xsign1285 = sign( dotResult1269 );
				float temp_output_1314_0 = (0.0 + (saturate( break1435.x ) - 0.0) * (_ShineMoveRange - 0.0) / (1.0 - 0.0));
				float3 appendResult1323 = (float3(( Zsign1271 >= 0.0 ? temp_output_1320_0 : -temp_output_1320_0 ) , 0.0 , ( Xsign1285 >= 0.0 ? temp_output_1314_0 : -temp_output_1314_0 )));
				float3 DynamicShine1347 = appendResult1323;
				float3 break1307 = ( -appendResult1332 + _ManualCubemapControl + (( _DynamicShineExperimental )?( DynamicShine1347 ):( float3( 0,0,0 ) )) );
				float2 texCoord1311 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float grayscale1312 = dot(tex2D( _ShineNoiseMap, texCoord1311 ).rgb, float3(0.299,0.587,0.114));
				float3 appendResult1308 = (float3(break1307.x , ( break1307.y + ( grayscale1312 * _NoiseFactor ) ) , break1307.z));
				float3 vertex1351 = appendResult1308;
				float3 break1456 = Center2Cam1256;
				float Rotation1384 = (360.0 + (( atan2( break1456.z , break1456.x ) / 6.28318548202515 ) - 0.0) * (0.0 - 360.0) / (1.0 - 0.0));
				float degrees1351 = (( _CubemapViewRoatationExperimental )?( ( _CubemapRotation + Rotation1384 ) ):( _CubemapRotation ));
				float3 localRotateAroundYInDegrees1351 = RotateAroundYInDegrees1351( vertex1351 , degrees1351 );
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float3 temp_cast_1 = (_MinDirectLight).xxx;
				float3 temp_output_1128_0 = max( ase_lightColor.rgb , temp_cast_1 );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 worldPos1029 = ase_worldPos;
				float localPureLightAttenuation1029 = PureLightAttenuation( worldPos1029 );
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float3 temp_output_1073_0 = ( temp_output_1128_0 * (( _ShadowinLightColor )?( ase_atten ):( localPureLightAttenuation1029 )) );
				float3 temp_cast_2 = (_MinDirectLight).xxx;
				float3 temp_cast_3 = (_MinDirectLight).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch1075 = temp_output_1073_0;
				#else
				float3 staticSwitch1075 = temp_output_1128_0;
				#endif
				float3 temp_cast_4 = (_MaxDirectLight).xxx;
				float4 Normal1127 = float4( 0,0,0,0 );
				float3 localShadeSH9out1127 = ShadeSH9out( Normal1127 );
				float3 localMaxShadeSH9876 = ( max(ShadeSH9(half4(0, 0, 0, 1)).rgb, ShadeSH9(half4(0, -1, 0, 1)).rgb) );
				float3 temp_cast_5 = (_MinIndirectLight).xxx;
				float3 temp_cast_6 = (_MaxIndirectLight).xxx;
				float3 temp_output_1005_0 = max( min( (( _NoShadowinDirectionalLightColor )?( staticSwitch1075 ):( temp_output_1073_0 )) , temp_cast_4 ) , min( max( (( _UnifyIndirectDiffuseLight )?( localMaxShadeSH9876 ):( localShadeSH9out1127 )) , temp_cast_5 ) , temp_cast_6 ) );
				float3 temp_cast_7 = (_MinDirectLight).xxx;
				float3 temp_cast_8 = (_MaxDirectLight).xxx;
				float3 temp_cast_9 = (_MinIndirectLight).xxx;
				float3 temp_cast_10 = (_MaxIndirectLight).xxx;
				float grayscale1095 = dot(temp_output_1005_0, float3(0.299,0.587,0.114));
				float3 temp_cast_11 = (grayscale1095).xxx;
				float3 lerpResult1096 = lerp( temp_output_1005_0 , temp_cast_11 , _LightColorGrayScale);
				float3 LightColor208 = lerpResult1096;
				float4 lerpResult1089 = lerp( float4( LightColor208 , 0.0 ) , _GlobalRimColor , _CustomRimLightColor);
				float4 temp_cast_13 = (_MinRimLightColor).xxxx;
				float4 clampResult1088 = clamp( lerpResult1089 , temp_cast_13 , float4( 1,1,1,0 ) );
				float4 SpecularColor539 = _SpecularColor;
				float4 RimColor2541 = _RimColor2;
				float4 lerpResult543 = lerp( SpecularColor539 , RimColor2541 , _RimSpecRate2);
				float3 localv_bias502 = v_bias();
				float3 localh_bias510 = h_bias();
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = i.ase_texcoord5.xyz;
				float dotResult505 = dot( ( ( -1.0 * localv_bias502 * _RimVerticalOffset2 ) + ( ( 1.0 - abs( _RimVerticalOffset2 ) ) * ( ( -1.0 * localh_bias510 * _RimHorizonOffset2 ) + ( ( 1.0 - abs( _RimHorizonOffset2 ) ) * ase_worldViewDir ) ) ) ) , ase_worldNormal );
				float rimoffset_Facing2513 = dotResult505;
				float2 uv_rimTex = i.ase_texcoord6.xyz.xy * _rimTex_ST.xy + _rimTex_ST.zw;
				float4 RimMask355 = ( tex2D( _rimTex, uv_rimTex ) + _RimTexOffset );
				float saferPower1466 = abs( _RimPower2 );
				float4 RimStrength2462 = ( _RimColor2.a * pow( saturate( ( ( _RimStep2 - rimoffset_Facing2513 ) / _RimFeather2 ) ) , 3.0 ) * RimMask355 * pow( saferPower1466 , 2.0 ) );
				float localIsThereALight797 = ( any(_WorldSpaceLightPos0.xyz) );
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(ase_worldPos);
				float3 localDefaultLightDir798 = ( normalize(UNITY_MATRIX_V[2].xyz + UNITY_MATRIX_V[1].xyz) );
				float3 LightDir801 = ( localIsThereALight797 == 1.0 ? worldSpaceLightDir : localDefaultLightDir798 );
				float dotResult779 = dot( LightDir801 , ase_worldNormal );
				float LambertTerm552 = dotResult779;
				float RimAtten1076 = localPureLightAttenuation1029;
				float lerpResult1085 = lerp( LambertTerm552 , ( LambertTerm552 * RimAtten1076 ) , _RimAttenuation2);
				float dotResult129 = dot( ase_worldViewDir , ase_worldNormal );
				float Facing136 = dotResult129;
				float fixed_specpower623 = exp2( ( ( _SpecularPower * -10.0 ) + 11.0 ) );
				float2 uv_spcMask = i.ase_texcoord6.xyz.xy * _spcMask_ST.xy + _spcMask_ST.zw;
				float4 SpecularMask436 = ( tex2D( _spcMask, uv_spcMask ) + _SpecularOffset );
				float4 SpecularPower438 = ( min( pow( max( Facing136 , 0.0 ) , ( ( fixed_specpower623 * 10.0 ) + 1.0 ) ) , 1.0 ) * SpecularMask436 * (0.0 + (_SpecularBias - 0.0) * (100.0 - 0.0) / (10.0 - 0.0)) );
				float GlobalLightFactor1011 = _GlobalLightFactor;
				float4 lerpResult1016 = lerp( ( _SpecularColor * SpecularPower438 ) , ( _SpecularColor * SpecularPower438 * float4( LightColor208 , 0.0 ) ) , GlobalLightFactor1011);
				float2 uv_MainTex = i.ase_texcoord6.xyz.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode64 = tex2D( _MainTex, uv_MainTex );
				float4 diff345 = tex2DNode64;
				float2 uv_sdwMask = i.ase_texcoord6.xyz.xy * _sdwMask_ST.xy + _sdwMask_ST.zw;
				float grayscale1168 = (tex2D( _sdwMask, uv_sdwMask ).rgb.r + tex2D( _sdwMask, uv_sdwMask ).rgb.g + tex2D( _sdwMask, uv_sdwMask ).rgb.b) / 3;
				float ShadowMask408 = grayscale1168;
				float HalfLambertTerm781 = (dotResult779*0.5 + 0.5);
				float localIsThereALight1124 = ( any(_WorldSpaceLightPos0.xyz) );
				float HalfShadowAttenuation1070 = ( localIsThereALight1124 == 1.0 ? (saturate( ase_atten )*0.5 + 0.5) : 1.0 );
				float shad_lerp339 = saturate( ( ( (( _OnlyPaintedShadow )?( ShadowMask408 ):( (( _ReceiveShadowLerp )?( ( ShadowMask408 * HalfLambertTerm781 * HalfShadowAttenuation1070 ) ):( ( ShadowMask408 * HalfLambertTerm781 ) )) )) + _ShadowStep ) / _ShadowFeather ) );
				float2 temp_cast_16 = (shad_lerp339).xx;
				float4 Grade330 = tex2D( _GradeTex, temp_cast_16 );
				float4 lerpResult1181 = lerp( diff345 , ( diff345 * saturate( ( Grade330 * _GradeScale ) ) ) , _GradeFactor);
				float DiffuseLightFactor1119 = _DiffuseLightFactor;
				float4 lerpResult1009 = lerp( lerpResult1181 , ( lerpResult1181 * float4( LightColor208 , 0.0 ) ) , DiffuseLightFactor1119);
				float4 lit_diff349 = lerpResult1009;
				float4 toon_diff370 = ( 0.5 >= _ToonDarkColor.a ? ( _ToonDarkColor * lit_diff349 ) : ( _ToonDarkColor + lit_diff349 ) );
				float4 lerpResult405 = lerp( toon_diff370 , ( 0.5 >= _ToonBrightColor.a ? ( _ToonBrightColor * lit_diff349 ) : ( _ToonBrightColor + lit_diff349 ) ) , shad_lerp339);
				float4 shaded_diff399 = lerpResult405;
				float4 specshaded_diff445 = ( lerpResult1016 + shaded_diff399 );
				float3 normal2view521 = mul( UNITY_MATRIX_V, float4( ase_worldNormal , 0.0 ) ).xyz;
				float3 normal1147 = ase_worldNormal;
				float3 viewDir1147 = ase_worldViewDir;
				float2 localgetMatcapUVs1147 = getMatcapUVs1147( normal1147 , viewDir1147 );
				float2 matcapUV1145 = localgetMatcapUVs1147;
				float3 ase_worldReflection = reflect(-ase_worldViewDir, ase_worldNormal);
				float3 dir1157 = ase_worldReflection;
				float smoothness1157 = _RefProbeSmoothness;
				float4 localRefProbe1157 = RefProbe( dir1157 , smoothness1157 );
				float2 uv_metalMask = i.ase_texcoord6.xyz.xy * _metalMask_ST.xy + _metalMask_ST.zw;
				float4 MetalMask350 = ( tex2D( _metalMask, uv_metalMask ) + _MetalOffset );
				float4 lerpResult532 = lerp( specshaded_diff445 , ( specshaded_diff445 * (( _UseReflectionProbeAsEnvMap )?( localRefProbe1157 ):( tex2D( _EnvTex, (( _EnvMatCap )?( float3( matcapUV1145 ,  0.0 ) ):( ( ( float3( float2( 1,1 ) ,  0.0 ) + normal2view521 ) * 0.5 ) )).xy ) )) * _EnvBias ) , saturate( ( _EnvRate * MetalMask350 ) ));
				float4 EnvSpecShaded_diff542 = lerpResult532;
				float lerpResult1083 = lerp( LambertTerm552 , ( LambertTerm552 * RimAtten1076 ) , _RimAttenuation);
				float4 RimColor540 = _RimColor;
				float4 lerpResult564 = lerp( SpecularColor539 , RimColor540 , _RimSpecRate);
				float3 localv_bias475 = v_bias();
				float3 localh_bias473 = h_bias();
				float dotResult463 = dot( ( ( -1.0 * localv_bias475 * _RimVerticalOffset ) + ( ( 1.0 - abs( _RimVerticalOffset ) ) * ( ( -1.0 * localh_bias473 * _RimHorizonOffset ) + ( ( 1.0 - abs( _RimHorizonOffset ) ) * ase_worldViewDir ) ) ) ) , ase_worldNormal );
				float rimoffset_Facing493 = dotResult463;
				float saferPower1465 = abs( _RimPower );
				float4 RimStrength427 = ( _RimColor.a * pow( saturate( ( ( _RimStep - rimoffset_Facing493 ) / _RimFeather ) ) , 3.0 ) * RimMask355 * pow( saferPower1465 , 2.0 ) );
				float4 temp_output_563_0 = ( ( saturate( lerpResult1083 ) + _RimShadowRate ) * ( lerpResult564 * RimStrength427 ) * clampResult1088 );
				float4 RimEnvSpecShaded_diff562 = ( EnvSpecShaded_diff542 + temp_output_563_0 );
				float4 Rim2EnvSpecShaded_diff577 = ( ( clampResult1088 * ( lerpResult543 * RimStrength2462 ) * ( saturate( lerpResult1085 ) + _RimShadowRate2 ) ) + RimEnvSpecShaded_diff562 );
				float4 BeforeEmi_diff1354 = ( ( texCUBE( _Hcubemap, localRotateAroundYInDegrees1351 ) * _HairShineColor * ( _HairShinePower * 10.0 ) ) + Rim2EnvSpecShaded_diff577 );
				float4 lerpResult1021 = lerp( ( _CharaColor * BeforeEmi_diff1354 ) , ( _CharaColor * BeforeEmi_diff1354 * float4( LightColor208 , 0.0 ) ) , GlobalLightFactor1011);
				float2 uv_EmiTex = i.ase_texcoord6.xyz.xy * _EmiTex_ST.xy + _EmiTex_ST.zw;
				float4 Emissive600 = tex2D( _EmiTex, uv_EmiTex );
				float4 Refined_diff612 = ( lerpResult1021 + ( ( 1.0 - (0) ) * Emissive600 * _EmissiveColor * _EmmisiveStrength ) );
				float dotResult614 = dot( _UnsaturationColor , Refined_diff612 );
				float4 temp_cast_26 = (dotResult614).xxxx;
				float4 lerpResult616 = lerp( temp_cast_26 , Refined_diff612 , _Saturation);
				float4 output_diff618 = lerpResult616;
				
				
				outColor = output_diff618.rgb;
				outAlpha = 1;
				SHADOW_CASTER_FRAGMENT(i)
			}
			ENDCG
		}
		
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19200
Node;AmplifyShaderEditor.CommentaryNode;1464;-891.3486,4237.798;Inherit;False;1206.97;294.6221;;7;1456;1457;1458;1459;1455;1463;1384;Rotation Tracking;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1428;-3081.377,3998.242;Inherit;False;2060.321;711.6462;;30;1324;1320;1318;1319;1314;1316;1323;1347;1329;1322;1398;1399;1345;1317;1346;1326;1327;1328;1343;1339;1338;1344;1337;1424;1425;1426;1427;1437;1435;1436;Shine Tracking;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1390;-3639.954,2916.43;Inherit;False;2993.04;703.4053;;28;1342;1356;1353;1354;1355;1359;1357;1349;1307;1308;1309;1312;1313;1330;1336;1334;1335;1341;1310;1311;1332;1333;1352;1331;1351;1389;1361;1385;Cubemap Process;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1162;-2516.605,-294.0528;Inherit;False;1899.027;700.1136;;21;529;532;535;527;448;449;451;531;840;542;450;1152;528;1154;537;530;533;1157;1161;1156;1163;Metal Process;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1160;-3087.171,-2578.367;Inherit;False;836.8398;2147.038;;23;600;68;1140;408;1143;330;345;64;350;646;1158;436;355;1167;1168;1169;65;1191;1193;1196;1197;1199;1213;Texture Input;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1117;-607.4543,2110.428;Inherit;False;1426.515;1601.894;;37;727;735;737;738;739;740;742;729;733;914;913;730;732;1111;1113;1115;1108;743;745;746;744;1106;747;748;749;750;751;1105;1104;1110;1114;1112;1132;1137;1138;1139;1141;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1098;-5174.794,1552.989;Inherit;False;2832.956;1061.392;;54;780;779;781;800;799;550;551;552;1005;825;773;801;778;776;802;1028;1035;1073;1075;1067;1068;1069;1070;1033;1076;1029;1074;826;797;798;1066;1010;1011;875;303;301;876;1096;208;1095;1097;1118;1119;1122;1124;1127;1128;1129;1130;1131;1186;1185;1187;1188;Light;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1092;-2262.148,560.6261;Inherit;False;1535.696;2259.567;;71;410;411;413;423;424;427;409;412;540;452;453;454;458;461;455;462;457;456;541;570;562;460;426;421;563;578;564;565;566;568;569;572;556;573;1077;1078;1083;546;1084;558;1089;1088;557;561;577;576;555;1085;1081;1086;575;543;567;544;545;547;548;553;1080;1090;1091;1093;1094;1120;1142;1194;1200;1206;1210;1465;1466;Rim Process;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1014;-2167.618,-3398.751;Inherit;False;1312.803;1911.911;;40;338;337;331;339;333;334;336;387;394;381;405;393;369;365;366;368;370;399;783;392;375;364;347;348;346;1009;349;1013;1038;1039;1072;1126;1166;1170;1172;1173;1178;1180;1181;1183;Shadow Process;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;936;-585.2881,290.5046;Inherit;False;949.0878;1702.382;;21;610;603;604;606;612;602;607;608;609;611;915;613;614;615;616;617;618;1018;1020;1021;1164;Emmisive and Other Process;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;870;487.8755,371.5081;Inherit;False;356.8159;717.053;;7;869;865;864;868;866;867;863;Stencil;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;850;-4232.141,-313.5239;Inherit;False;1673.75;1710.115;;52;481;486;489;490;492;487;485;488;491;463;464;484;482;483;478;477;493;475;473;465;129;128;127;136;518;521;519;520;494;495;496;497;498;500;501;503;504;505;506;507;508;509;512;511;513;510;502;499;1144;1147;1145;1165;Matrix And Vector;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;639;-2146.74,-1298.209;Inherit;False;1231.752;918.1196;;28;444;440;439;442;539;432;433;428;437;430;435;624;429;441;443;445;315;319;322;636;623;438;434;872;873;1015;1016;1017;Specular Process;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1003;533.9971,1187.993;Inherit;False;225;166;;1;1004;Cull;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;432;-1865.69,-989.317;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;433;-1721.69,-989.317;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;428;-1759.332,-1107.791;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;430;-1583.632,-1107.891;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;624;-2096.74,-990.3093;Inherit;False;623;fixed_specpower;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;429;-1949.934,-1107.891;Inherit;False;136;Facing;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;319;-1591.851,-1243.356;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-10;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;322;-1449.967,-1244.762;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;11;False;1;FLOAT;0
Node;AmplifyShaderEditor.Exp2OpNode;636;-1314.541,-1240.271;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;434;-1424.889,-1108.316;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;481;-3773.483,344.0869;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;486;-3936.808,276.9309;Inherit;False;Constant;_1_;-1_;21;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;489;-3507.05,284.4852;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;490;-3389.811,136.4999;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;492;-3557.759,76.68634;Inherit;False;Constant;_1_1;-1_;21;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;487;-3389.752,294.985;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;485;-3620.706,508.5616;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;488;-3238.331,297.0754;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;491;-3118.547,184.1854;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;463;-2930.376,212.8133;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;484;-3772.132,484.3584;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;482;-3482.12,375.0722;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.AbsOpNode;483;-3887.127,488.7747;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;478;-3795.328,220.9915;Inherit;False;Property;_RimVerticalOffset;RimVerticalOffset;23;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;477;-4176.228,439.1925;Inherit;False;Property;_RimHorizonOffset;RimHorizonOffset;22;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;493;-2793.017,206.679;Inherit;False;rimoffset_Facing;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;494;-3788.188,1208.591;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;495;-3779.401,991.6329;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;496;-3942.723,924.4769;Inherit;False;Constant;_1_2;-1_;21;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;497;-3512.966,932.0314;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;498;-3395.728,784.0452;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;500;-3395.669,942.5309;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;501;-3626.623,1156.108;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;503;-3244.249,944.6212;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;504;-3124.464,831.731;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;505;-2936.293,860.3596;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;506;-3115.049,1011.347;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;507;-3778.05,1131.905;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;508;-3488.036,1022.619;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.AbsOpNode;509;-3893.043,1136.321;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;512;-4182.141,1086.739;Inherit;False;Property;_RimHorizonOffset2;RimHorizonOffset2;31;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;511;-3801.243,868.5377;Inherit;False;Property;_RimVerticalOffset2;RimVerticalOffset2;32;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;513;-2798.391,859.7902;Inherit;False;rimoffset_Facing2;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;502;-3534.627,810.173;Inherit;False;return float3(unity_MatrixV[0][1],unity_MatrixV[1][1],unity_MatrixV[2][1])@;3;Create;0;v_bias;False;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;499;-3552.117,724.231;Inherit;False;Constant;__2;-1_;21;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;623;-1186.366,-1248.209;Inherit;False;fixed_specpower;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;869;574.3199,972.5614;Inherit;False;Property;_StencilZFailFront;Stencil ZFailFront;100;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;865;573.0298,697.452;Inherit;False;Property;_StencilComparison;Stencil Comparison;97;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;864;575.0732,791.5167;Inherit;False;Property;_StencilPassFront;Stencil PassFront;98;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;868;575.3414,883.6737;Inherit;False;Property;_StencilFailFront;Stencil FailFront;99;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;866;544.6917,599.6441;Inherit;False;Property;_StencilWriteMask;Stencil WriteMask;96;0;Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;867;539.5822,510.7573;Inherit;False;Property;_StencilReadMask;Stencil ReadMask;95;0;Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;863;537.8758,421.5081;Inherit;False;Property;_StencilReference;Stencil Reference;94;1;[Header];Create;True;1;Stencil Buffer;0;0;True;0;False;0;0;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;315;-1912.664,-1243.571;Inherit;False;Property;_SpecularPower;SpecularPower;49;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;435;-1281.689,-1068.516;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;438;-1135.989,-1072.691;Inherit;False;SpecularPower;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;539;-1662.804,-797.59;Inherit;False;SpecularColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;443;-1859.682,-527.5886;Inherit;False;208;LightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;873;-1445.568,-922.5085;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;10;False;3;FLOAT;0;False;4;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;872;-1730.45,-883.5449;Inherit;False;Property;_SpecularBias;Specular Bias;50;0;Create;True;0;0;0;False;0;False;0.2;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;610;-180.452,751.7504;Inherit;False;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;607;-530.7629,678.1381;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;608;-357.7633,680.1382;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;609;-420.3516,756.8454;Inherit;False;600;Emissive;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;915;-509.3508,1006.975;Inherit;False;Property;_EmmisiveStrength;EmmisiveStrength;61;0;Create;True;0;0;0;False;0;False;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;613;-483.534,1789.538;Inherit;False;612;Refined_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;614;-234.6367,1650.734;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;616;-111.1865,1700.939;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;617;-535.1091,1876.887;Inherit;False;Property;_Saturation;Saturation;63;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;618;139.7997,1704.02;Inherit;False;output_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;906;519.8942,1234.809;Float;False;False;-1;2;ASEMaterialInspector;100;12;New Amplify Shader;fe4af87006695164d84819765fe282b7;True;Deferred;0;3;Deferred;4;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Deferred;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;907;519.8942,1193.809;Float;False;False;-1;2;ASEMaterialInspector;100;12;New Amplify Shader;fe4af87006695164d84819765fe282b7;True;ShadowCaster;0;4;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.RangedFloatNode;1004;583.9971,1237.993;Inherit;False;Property;_CullMode;Cull Mode;101;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;611;-444.1928,835.6896;Inherit;False;Property;_EmissiveColor;EmissiveColor;60;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;441;-1894.259,-615.4928;Inherit;False;438;SpecularPower;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1016;-1434.189,-656.3539;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1017;-1643.274,-713.0028;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;444;-1643.881,-609.2066;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1015;-1670.869,-473.9094;Inherit;False;1011;GlobalLightFactor;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;440;-1258.359,-605.7688;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;445;-1138.669,-608.9738;Inherit;False;specshaded_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;606;58.26269,649.2629;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;612;180.2853,646.3752;Inherit;False;Refined_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;602;-513.6968,331.1195;Inherit;False;Property;_CharaColor;CharaColor;62;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;603;-489.9157,584.6661;Inherit;False;208;LightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;604;-267.8757,360.3331;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1018;-268.2223,481.1762;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1020;-285.7105,603.3796;Inherit;False;1011;GlobalLightFactor;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1021;-122.5304,443.265;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;615;-495.1351,1603.838;Inherit;False;Property;_UnsaturationColor;UnsaturationColor;64;1;[HDR];Create;True;0;0;0;False;0;False;0.2117647,0.7137255,0.07058824,0;0.2117647,0.7137255,0.07058824,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CustomExpressionNode;510;-3925.953,1009.424;Inherit;False;return float3(unity_MatrixV[0][0],unity_MatrixV[0][1],unity_MatrixV[0][2])@;3;Create;0;h_bias;False;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;570;-1132.595,1870.131;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;563;-1373.526,1886.543;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;565;-1636.894,1932.565;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;568;-2052.537,1901.482;Inherit;False;540;RimColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;569;-2069.537,1823.911;Inherit;False;539;SpecularColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;573;-2212.148,1555.275;Inherit;False;552;LambertTerm;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;558;-2148.207,2131.801;Inherit;False;Property;_GlobalRimColor;GlobalRimColor;33;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;557;-1385.882,2350.073;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;555;-1502.489,2563.954;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1081;-1995.207,2612.05;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;575;-1730.331,2701.104;Inherit;False;Property;_RimShadowRate2;RimShadowRate2;29;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;544;-2103.758,2386.455;Inherit;False;541;RimColor2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;545;-2111.379,2312.675;Inherit;False;539;SpecularColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;547;-1673.684,2391.892;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;572;-1543.533,1646.822;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1093;-1685.585,1643.297;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1094;-1639.641,2570.128;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;1005;-3042.598,1889.926;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1073;-3799.813,1824.677;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;826;-3463.226,1845.357;Inherit;False;Property;_MaxDirectLight;MaxDirectLight;66;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;208;-2565.839,1886.426;Inherit;False;LightColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;567;-2146.337,2462.626;Inherit;False;Property;_RimSpecRate2;RimSpecRate2;28;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;543;-1850.288,2347.37;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;548;-1857.189,2482.686;Inherit;False;462;RimStrength2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;564;-1814.747,1875.568;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-2104.613,1979.608;Inherit;False;Property;_RimSpecRate;RimSpecRate;19;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1077;-2194.835,1642.66;Inherit;False;1076;RimAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1078;-2020.835,1624.66;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1083;-1855.796,1567.911;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1084;-2139.688,1727.816;Inherit;False;Property;_RimAttenuation;RimAttenuation;21;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1085;-1796.179,2572.154;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1086;-2094.365,2704.193;Inherit;False;Property;_RimAttenuation2;RimAttenuation2;30;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1089;-1689.771,2079.751;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;1088;-1536.558,2081.359;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0.2,0.2,0.2,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1090;-1956.171,2196.864;Inherit;False;Property;_CustomRimLightColor;CustomRimLightColor;34;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1091;-1923.683,2273.887;Inherit;False;Property;_MinRimLightColor;MinRimLightColor;35;0;Create;True;0;0;0;False;0;False;0.2;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1096;-2715.781,1892.544;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1097;-2975.621,2035.361;Inherit;False;Property;_LightColorGrayScale;LightColor GrayScale;70;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;737;-517.9045,2869.757;Inherit;False;Property;_OutlineWidth;OutlineWidth;80;0;Create;True;0;0;0;False;0;False;0.002;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;739;-47.14717,2744.804;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleNode;742;-302.6379,2826.602;Inherit;False;0.01;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;743;667.0604,2956.962;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;746;331.4294,2789.738;Inherit;False;740;OutlineWidth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;744;336.1338,2871.197;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldToObjectTransfNode;748;-391.0308,3420.356;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;749;-394.9265,3596.323;Inherit;False;Property;_OutlineZPush;Outline ZPush;88;0;Create;True;0;0;0;False;0;False;-0.001;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;750;-181.6891,3419.497;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1111;-376.2779,3198.019;Inherit;False;Property;_MaxDistance;MaxDistance;84;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1113;132.8863,3045.25;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1115;-176.0658,3299.597;Inherit;False;Property;_MaxDistanceRemap;MaxDistanceRemap;86;0;Create;True;0;0;0;False;0;False;10;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1108;-173.9645,3218.635;Inherit;False;Property;_MinDistanceRemap;MinDistanceRemap;85;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1110;-375.2779,3117.019;Inherit;False;Property;_MinDistance;MinDistance;83;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1114;-4.025251,3046.467;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1112;-178.5498,3044.917;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.UnityObjToClipPosHlpNode;1105;-381.9543,2950.507;Inherit;False;1;0;FLOAT3;0,0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PosVertexDataNode;1104;-557.4543,2951.808;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;745;530.157,2850.254;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1010;-2866.755,2504.55;Inherit;False;Property;_GlobalLightFactor;GlobalLightFactor;72;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;825;-4250.08,1771.647;Inherit;False;Property;_MinDirectLight;MinDirectLight;65;1;[Header];Create;True;1;Light;0;0;False;0;False;0;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;773;-4139.136,1642.819;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.WorldPosInputsNode;1028;-4428.249,1899.302;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1076;-4027.74,1878.082;Inherit;False;RimAtten;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;301;-3582.442,2399.641;Inherit;False;Property;_MaxIndirectLight;MaxIndirectLight;69;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;303;-3595.709,2312.447;Inherit;False;Property;_MinIndirectLight;MinIndirectLight;68;0;Create;True;0;0;0;False;0;False;0.1;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1118;-2867.647,2413.705;Inherit;False;Property;_DiffuseLightFactor;DiffuseLightFactor;71;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1011;-2594.49,2503.485;Inherit;False;GlobalLightFactor;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1119;-2594.647,2415.705;Inherit;False;DiffuseLightFactor;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;1035;-4253.71,1982.544;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;1128;-3942.754,1685.524;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode;1129;-3139.096,1765.547;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;1131;-3320.573,2197.24;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode;1130;-3199.394,2222.388;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;1095;-2927.163,1954.024;Inherit;False;1;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;876;-3773.33,2250.009;Inherit;False;max(ShadeSH9(half4(0, 0, 0, 1)).rgb, ShadeSH9(half4(0, -1, 0, 1)).rgb);3;Create;0;MaxShadeSH9;False;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.ClipNode;913;601.0013,2226.113;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;914;304.8408,2584.198;Inherit;False;Property;_OutlineClip;OutlineClip;75;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;730;-576.7557,2161.428;Inherit;False;Property;_OutlineColor;OutlineColor;77;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;732;-562.5253,2352.656;Inherit;False;345;diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;729;-343.2987,2270.424;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;747;-574.5201,3420.971;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CustomExpressionNode;1127;-3801.52,2165.414;Inherit;False;return ShadeSH9(Normal)@;3;Create;1;True;Normal;FLOAT4;0,0,0,0;In;;Half;False;ShadeSH9out;False;False;0;;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1137;329.1469,2177.831;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1138;126.1261,2240.13;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1132;-111.1925,2280.611;Inherit;False;208;LightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1139;-8.873901,2363.13;Inherit;False;Property;_OutlineLightColor;OutlineLightColor;79;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;464;-3095.133,372.8004;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;465;-3800.271,566.0444;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CustomExpressionNode;473;-3920.037,361.8777;Inherit;False;return float3(unity_MatrixV[0][0],unity_MatrixV[0][1],unity_MatrixV[0][2])@;3;Create;0;h_bias;False;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;740;97.70992,2733.156;Inherit;False;OutlineWidth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;562;-1000.152,1869.178;Inherit;False;RimEnvSpecShaded_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1142;-1375.092,1794.614;Inherit;False;542;EnvSpecShaded_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;128;-4207.683,-250.2282;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;127;-4212.418,-95.06068;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;129;-4024.051,-163.5025;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;136;-3909.895,-159.7412;Inherit;False;Facing;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;518;-3471.453,-159.353;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;521;-3331.245,-161.237;Inherit;False;normal2view;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;519;-3705.336,-124.2012;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewMatrixNode;520;-3661.814,-207.9513;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1145;-2764.813,-178.9349;Inherit;False;matcapUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;1147;-2939.598,-178.1424;Inherit;False;half3 worldUp = float3(0, 1, 0)@$half3 worldViewUp = normalize(worldUp - viewDir * dot(viewDir, worldUp))@$half3 worldViewRight = normalize(cross(viewDir, worldViewUp))@$return half2(dot(worldViewRight, normal), dot(worldViewUp, normal)) * 0.5 + 0.5@;2;Create;2;True;normal;FLOAT3;0,0,0;In;;Inherit;False;True;viewDir;FLOAT3;0,0,0;In;;Inherit;False;getMatcapUVs;True;False;0;;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;475;-3528.711,162.6278;Inherit;False;return float3(unity_MatrixV[0][1],unity_MatrixV[1][1],unity_MatrixV[2][1])@;3;Create;0;v_bias;False;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;600;-2728.315,-1264.112;Inherit;False;Emissive;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;646;-2660.746,-2429.479;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;532;-1035.601,-51.64332;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;535;-1186.118,-16.26857;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;531;-1238.863,217.117;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;100,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;840;-1105.019,120.1406;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;542;-891.5779,-56.21114;Inherit;False;EnvSpecShaded_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;533;-1383.121,-147.6337;Inherit;False;445;specshaded_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldReflectionVector;1156;-2206.365,-244.0529;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1161;-2249.313,-87.61858;Inherit;False;Property;_RefProbeSmoothness;RefProbeSmoothness;56;0;Create;True;0;0;0;False;0;False;0.7;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1157;-1763.501,-150.4314;Inherit;False;float4 cube = 1@$float roughness = 1 - smoothness@$roughness *= 1.7 - 0.7 * roughness@$float4 val = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, dir, roughness * UNITY_SPECCUBE_LOD_STEPS)@$cube.xyz = (DecodeHDR(val, unity_SpecCube0_HDR))@$return cube@;4;Create;2;True;dir;FLOAT3;0,0,0;In;;Inherit;False;True;smoothness;FLOAT;0;In;;Inherit;False;RefProbe;False;False;0;;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;528;-1839.021,-18.59357;Inherit;True;Property;_EnvTex;EnvironmentMap;53;0;Create;False;0;0;0;False;0;False;-1;None;88ec95f20d6a4df49806dc49e81c06d2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;537;-1495.281,57.81958;Inherit;False;Property;_EnvBias;EnvBias;58;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;527;-2502.605,122.0133;Inherit;False;521;normal2view;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector2Node;448;-2489.224,-26.98368;Inherit;False;Constant;_11_;(1,1)_;16;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleAddOpNode;449;-2294.302,10.65208;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;451;-2302.102,117.2536;Inherit;False;Constant;_05_;0.5_;16;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;450;-2177.304,6.650905;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1152;-2261.037,210.3145;Inherit;False;1145;matcapUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1144;-3122.292,-101.9926;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;1165;-3127.004,-271.8772;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1038;-1936.808,-2814.083;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;-1942.877,-2914.08;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;331;-2177.903,-3001.261;Inherit;False;408;ShadowMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1172;-2154.184,-3248.209;Inherit;False;330;Grade;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1013;-1441.672,-3057.244;Inherit;False;1119;DiffuseLightFactor;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1173;-2146.067,-3160.582;Inherit;False;Property;_GradeScale;Grade Scale;9;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;405;-1442.355,-2115.247;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;393;-1630.085,-2190.146;Inherit;False;370;toon_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;369;-1785.018,-2324.191;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;368;-1801.018,-2457.191;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;370;-1410.487,-2462.053;Inherit;False;toon_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;387;-1791.934,-2125.152;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;394;-1780.651,-1985.047;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;381;-1625.842,-2097.039;Inherit;False;3;4;0;FLOAT;0.5;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;365;-2055.429,-2260.103;Inherit;False;349;lit_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;366;-1609.737,-2457.35;Inherit;False;3;4;0;FLOAT;0.5;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;392;-1643.031,-1902.237;Inherit;False;339;shad_lerp;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1166;-2041.436,-1941.723;Inherit;False;349;lit_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1178;-1423.841,-2953.084;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;337;-1283.642,-2958.518;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;338;-1166.02,-2959.377;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1181;-1415.7,-3340.268;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1183;-1907.444,-3142.414;Inherit;False;Property;_GradeFactor;Grade Factor;10;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1170;-1622.942,-3285.567;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;399;-1245.981,-2119.16;Inherit;False;shaded_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;439;-1444.733,-512.2018;Inherit;False;399;shaded_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;364;-2069.96,-2457.659;Inherit;False;Property;_ToonDarkColor;ToonDarkColor;12;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;375;-2082.421,-2139.098;Inherit;False;Property;_ToonBrightColor;ToonBrightColor;11;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CustomExpressionNode;1029;-4234.816,1879.543;Inherit;False;#ifdef POINT$        unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz@ \$        return tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r@$#endif$$#ifdef SPOT$#if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)$#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1))$#else$#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = input._LightCoord$#endif$        DECLARE_LIGHT_COORD(input, worldPos)@ \$        return (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz)@$#endif$$#ifdef DIRECTIONAL$        return 1@$#endif$$#ifdef POINT_COOKIE$#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)$#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz$#   else$#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = input._LightCoord$#   endif$        DECLARE_LIGHT_COORD(input, worldPos)@ \$        return tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).r * texCUBE(_LightTexture0, lightCoord).w@$#endif$$#ifdef DIRECTIONAL_COOKIE$#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)$#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xy$#   else$#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = input._LightCoord$#   endif$        DECLARE_LIGHT_COORD(input, worldPos)@ \$        return tex2D(_LightTexture0, lightCoord).w@$#endif;1;Create;1;True;worldPos;FLOAT3;0,0,0;In;;Inherit;False;Pure Light Attenuation;False;False;0;;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;780;-5081.728,2287.25;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;779;-4856.69,2237.289;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;778;-4896.95,2352.737;Float;False;Constant;_RemapValue1;Remap Value;0;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;776;-4729.363,2261.506;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;802;-5066.228,2194.826;Inherit;False;801;LightDir;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1067;-4900.465,2454.666;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1069;-4920.354,2533.951;Float;False;Constant;_RemapValue3;Remap Value;0;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1068;-4741.767,2474.72;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1124;-4692.718,2395.096;Inherit;False;any(_WorldSpaceLightPos0.xyz);1;Create;0;Is There A Light;False;False;0;;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;552;-4705.642,2181.198;Inherit;False;LambertTerm;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;799;-5122.381,1654.255;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;801;-4573.03,1603.702;Inherit;False;LightDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;800;-4741.064,1604.361;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;798;-4897.187,1723.319;Inherit;False;normalize(UNITY_MATRIX_V[2].xyz + UNITY_MATRIX_V[1].xyz);3;Create;0;Default LightDir;False;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;797;-4900.992,1597.703;Inherit;False;any(_WorldSpaceLightPos0.xyz);1;Create;0;Is There A Light;False;False;0;;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;1185;-5162.843,1801.321;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;1186;-5133.163,1945.279;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1187;-4896.163,1870.279;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;550;-4932.087,1980.777;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;551;-4740.884,1919.515;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;781;-4527.636,2261.207;Inherit;False;HalfLambertTerm;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1188;-4627.066,1923.502;Inherit;False;FrontLightTerm;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;1066;-5127.407,2440.749;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;783;-2163.691,-2861.443;Inherit;False;781;HalfLambertTerm;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1072;-2194.134,-2771.91;Inherit;False;1070;HalfShadowAttenuation;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1122;-4515.652,2422.19;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1070;-4369.125,2422.895;Inherit;False;HalfShadowAttenuation;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;334;-1705.248,-2735.903;Inherit;False;Property;_ShadowStep;ShadowStep;6;0;Create;True;0;0;0;False;0;False;-0.3;0.3;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;336;-1632.483,-2643.636;Inherit;False;Property;_ShadowFeather;ShadowFeather;7;0;Create;True;0;0;0;False;0;False;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1171;-1930.184,-3245.71;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1180;-1777.563,-3224.441;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;347;-1569.105,-3137.024;Inherit;False;208;LightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;349;-1064.156,-3219.101;Inherit;False;lit_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1009;-1213.762,-3223.791;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;348;-1382.64,-3178.543;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;339;-1020.504,-2949.824;Inherit;False;shad_lerp;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;1168;-2709.605,-2324.781;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;408;-2524.906,-2326.163;Inherit;False;ShadowMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;330;-2530.732,-2112.094;Inherit;False;Grade;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1169;-3022.849,-2097.896;Inherit;False;339;shad_lerp;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1140;-2717.789,-1018.955;Inherit;False;OutlineCorrect;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;530;-1692.225,179.1225;Inherit;False;Property;_EnvRate;EnvRate;57;0;Create;True;0;0;0;False;0;False;1;0.5;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;529;-1656.09,263.6606;Inherit;False;350;MetalMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1039;-1795.009,-2846.583;Inherit;False;Property;_ReceiveShadowLerp;ReceiveShadowLerp;3;0;Create;True;0;0;0;False;0;False;1;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1126;-1687.358,-2967.16;Inherit;False;Property;_OnlyPaintedShadow;Only Painted Shadow;2;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1033;-4045.091,1968.581;Inherit;False;Property;_ShadowinLightColor;Shadow in LightColor;4;0;Create;True;0;0;0;False;0;False;1;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1075;-3737.996,1649.696;Inherit;False;Property;_Keyword1;Keyword 0;6;0;Create;True;0;0;0;False;0;False;0;0;0;False;UNITY_PASS_FORWARDADD;Toggle;2;Key0;Key1;Fetch;False;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1074;-3451.59,1681.206;Inherit;False;Property;_NoShadowinDirectionalLightColor;NoShadow in DirectionalLightColor;5;0;Create;True;0;0;0;False;0;False;1;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;875;-3607.816,2196.11;Inherit;False;Property;_UnifyIndirectDiffuseLight;Unify IndirectDiffuseLight;67;0;Create;True;0;0;0;False;0;False;1;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1154;-1508.088,-58.54283;Inherit;False;Property;_UseReflectionProbeAsEnvMap;UseReflectionProbeAsEnvMap;55;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1163;-2056.363,107.2068;Inherit;False;Property;_EnvMatCap;EnvMatCap;54;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;727;-189.403,2174.07;Inherit;False;Property;_MixDiffuseinOutlineColor;Mix Diffuse in OutlineColor;78;0;Create;True;0;0;0;False;0;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;733;307.045,2469.07;Inherit;False;Property;_Outline;Outline;73;0;Create;True;0;0;0;False;1;Header(Outline);False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;735;-287.9843,2489.268;Inherit;False;Property;_UseOutlineMask;Use OutlineMask;76;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;738;-318.3895,2697.563;Inherit;False;Property;_UseOutlineWidthMask;Use OutlineWidthMask;81;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1106;311.8834,3016.001;Inherit;False;Property;_OutlineDistanceAdjust;Outline Distance Adjust;82;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;751;-31.02092,3386.653;Inherit;False;Property;_OutlineZPushAdjust;Outline ZPush Adjust;87;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;65;-2832.344,-2120.035;Inherit;True;Property;_GradeTex;Grade Tex (_shade);8;0;Create;False;1;Shadow;0;0;False;0;False;-1;None;ceb81bf925c34a24ebbcaf9bd3b69644;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;64;-3017.863,-2528.367;Inherit;True;Property;_MainTex;Diffuse Map (_col);0;1;[Header];Create;False;1;Diffuse;0;0;False;0;False;-1;None;fad893ce3e4907245ae76bf2e4f48724;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1191;-3027.318,-1041.458;Inherit;True;Property;_OutlineTex;OutlineTex (Lmask) [optional];74;0;Create;False;1;Outline;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;576;-1350.782,2510.671;Inherit;False;562;RimEnvSpecShaded_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1141;-572.3789,2600.459;Inherit;False;1140;OutlineCorrect;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;437;-1572.076,-1005.741;Inherit;False;436;SpecularMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;350;-2453.393,-1472.276;Inherit;False;MetalMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1198;-2564.865,-1471.082;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1199;-2789.234,-1370.737;Inherit;False;Property;_MetalOffset;MetalOffset;52;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;442;-1898.68,-797.988;Inherit;False;Property;_SpecularColor;SpecularColor;48;1;[HDR];Create;True;1;Specular;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1143;-3064.179,-1686.498;Inherit;True;Property;_spcMask;SpecularMask [optional];46;1;[Header];Create;False;1;Specular;0;0;False;0;False;-1;None;7ab07b24411a8464c93e7c9db344a4b0;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1158;-3067.407,-1476.166;Inherit;True;Property;_metalMask;MetalMask [optional];51;1;[Header];Create;False;1;Metal;0;0;False;0;False;-1;None;7ab07b24411a8464c93e7c9db344a4b0;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;436;-2445.625,-1678.229;Inherit;False;SpecularMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;345;-2707.362,-2520.96;Inherit;False;diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;346;-2126.125,-3353.989;Inherit;False;345;diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;355;-2461.789,-1901.093;Inherit;False;RimMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;410;-1895.735,784.4722;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;411;-1734.536,827.3701;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;413;-1606.701,827.9;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;409;-2193.434,731.1702;Inherit;False;Property;_RimStep;RimStep;17;0;Create;True;0;0;0;False;0;False;0.5;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;412;-2019.235,906.668;Inherit;False;Property;_RimFeather;RimFeather;18;0;Create;True;0;0;0;False;0;False;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;540;-1271.852,638.5731;Inherit;False;RimColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;421;-2123.927,818.8759;Inherit;False;493;rimoffset_Facing;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;424;-1272.331,778.124;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.5;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;427;-1119.956,774.2961;Inherit;False;RimStrength;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;561;-1130.114,2352.861;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;578;-1225.221,1989.469;Inherit;False;realRim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;553;-2173.804,2544.608;Inherit;False;552;LambertTerm;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1080;-2164.907,2618.251;Inherit;False;1076;RimAtten;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1120;-1915.479,2072.308;Inherit;False;208;LightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;566;-1821.799,1997.617;Inherit;False;427;RimStrength;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;426;-1524.877,635.1342;Inherit;False;Property;_RimColor;RimColor;15;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;452;-1838.538,1298.579;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;453;-1677.339,1341.477;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;454;-1549.503,1342.007;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;458;-1395.334,1338.83;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;455;-1962.038,1420.775;Inherit;False;Property;_RimFeather2;RimFeather2;27;0;Create;True;0;0;0;False;0;False;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;457;-2136.237,1245.277;Inherit;False;Property;_RimStep2;RimStep2;26;0;Create;True;0;0;0;False;0;False;0.5;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;456;-2053.307,1338.494;Inherit;False;513;rimoffset_Facing2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;461;-1215.135,1293.232;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.5;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;462;-1074.459,1286.402;Inherit;False;RimStrength2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;541;-1210.881,1148.893;Inherit;False;RimColor2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;460;-1462.481,1146.64;Inherit;False;Property;_RimColor2;RimColor2;24;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;556;-1816.102,1741.901;Inherit;False;Property;_RimShadowRate;RimShadowRate;20;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1206;-1704.633,989.8348;Inherit;False;Property;_RimPower;RimPower;16;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1210;-1632.621,1542.344;Inherit;False;Property;_RimPower2;RimPower2;25;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;423;-1454.055,817.1031;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1194;-1509.475,912.7343;Inherit;False;355;RimMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1197;-2568.243,-1681.923;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1196;-2776.827,-1572.558;Inherit;False;Property;_SpecularOffset;SpecularOffset;47;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1212;-2570.211,-1891.228;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1213;-2778.795,-1781.863;Inherit;False;Property;_RimTexOffset;RimTexOffset;14;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1193;-3056.031,-1906.903;Inherit;True;Property;_rimTex;RimTex (_Rmask);13;1;[Header];Create;False;1;Rim;0;0;False;0;False;-1;None;7ab07b24411a8464c93e7c9db344a4b0;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;68;-3030.327,-1260.464;Inherit;True;Property;_EmiTex;Emissive [optional];59;1;[Header];Create;False;1;Emissive and Other;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1167;-3011.371,-2333.199;Inherit;True;Property;_sdwMask;Shadow Mask (_bs_b/_sd) [optional];1;1;[Header];Create;False;1;Shadow;0;0;False;0;False;-1;None;fad893ce3e4907245ae76bf2e4f48724;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;903;886.2556,2252.555;Float;False;False;-1;2;ASEMaterialInspector;100;13;New Amplify Shader;fe4af87006695164d84819765fe282b7;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;True;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;1;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;0;True;_StencilReference;255;True;_StencilReadMask;255;True;_StencilWriteMask;0;True;_StencilComparison;0;True;_StencilPassFront;0;True;_StencilFailFront;0;True;_StencilZFailFront;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=ForwardBase;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;1216;-5136.687,3816.852;Inherit;False;1955.524;962.3234;;42;1304;1302;1301;1300;1299;1298;1297;1296;1295;1294;1293;1292;1291;1290;1289;1288;1287;1286;1285;1284;1283;1282;1281;1279;1278;1274;1273;1272;1271;1270;1269;1268;1267;1264;1263;1261;1260;1259;1377;1378;1407;1408;Tracking PreCaculate;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1217;-6823.429,2735.992;Inherit;False;3057.138;859.4518;;40;1257;1256;1255;1254;1253;1252;1251;1250;1249;1248;1247;1246;1245;1244;1243;1242;1241;1240;1239;1238;1237;1236;1235;1234;1233;1232;1231;1230;1229;1228;1227;1226;1225;1224;1223;1222;1221;1220;1219;1218;Tracking Basis;1,1,1,1;0;0
Node;AmplifyShaderEditor.CrossProductOpNode;1218;-4508.897,2888.115;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1219;-4216.898,2887.115;Inherit;False;Left;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1220;-4356.991,2890.319;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1221;-4689.281,2934.144;Inherit;False;1242;Up;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1222;-4690.297,2858.902;Inherit;False;1241;Forward;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1223;-4303.573,3137.896;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;1224;-4555.622,3052.524;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Compare;1226;-4472.136,3231.723;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TransformPositionNode;1227;-4676.291,3361.316;Inherit;False;Object;World;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalizeNode;1228;-4162.601,3140.087;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1229;-4679.802,3232.365;Inherit;False;1232;isObjectSpace;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;1230;-6050.825,3003.773;Inherit;False;Object;World;True;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1231;-6049.616,2844.091;Inherit;False;Property;_ObjectSpace;ObjectSpace;89;2;[Header];[Toggle];Create;True;1;HeadBoneTransform;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1232;-5863.517,2785.992;Inherit;False;isObjectSpace;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1233;-5822.217,2878.19;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1234;-5902.092,3176.187;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1235;-5668.774,2880.293;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1236;-5741.569,3154.584;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1237;-6108.293,3153.882;Inherit;False;1232;isObjectSpace;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;1238;-6097.136,3310.486;Inherit;False;Object;World;True;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;1239;-6773.429,2966.094;Inherit;False;Property;_FaceForward;FaceForward;92;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;1240;-6762.489,3279.921;Inherit;False;Property;_FaceUp;FaceUp;93;0;Create;True;0;0;0;False;0;False;0,1,0;0,1,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1241;-5526.696,2883.885;Inherit;False;Forward;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1242;-5595.393,3152.125;Inherit;False;Up;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1243;-6252.097,2895.575;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;1244;-6419.927,3037.174;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;1245;-6571.959,3023.435;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1246;-6572.765,3106.528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1247;-6259.676,3206.278;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;1248;-6423.606,3346.578;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;1249;-6570.437,3335.438;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1250;-6575.054,3420.339;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;1251;-5345.13,3340.415;Inherit;False;Property;_FaceCenterPos;FaceCenterPos;91;0;Create;True;1;Tracking Basis(In ObjectSpace);0;0;False;0;False;0,0,0;0,0.125,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;1252;-5143.402,3398.835;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1253;-4996.57,3409.975;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;1254;-5144.521,3482.444;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1255;-4839.643,3271.655;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1257;-6544.205,2893.017;Inherit;False;Property;_IsRightHandCoordinateSystem;IsRightHandCoordinateSystem;90;1;[Toggle];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1259;-4351.928,3996.037;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1260;-4472.561,3961.444;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1263;-4339.9,4214.872;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1264;-4460.533,4180.279;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1267;-5079.407,4353.46;Inherit;False;1219;Left;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SignOpNode;1268;-4583.163,4382.445;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1269;-4691.277,4380.448;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SignOpNode;1272;-4575.443,4552.795;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1273;-4684.556,4550.798;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1274;-4658.108,4241.607;Inherit;False;1219;Left;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;1278;-4908.275,4432.447;Inherit;False;True;False;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;1279;-4908.208,4351.96;Inherit;False;True;False;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;1282;-4899.571,4599.811;Inherit;False;False;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;1283;-4901.504,4521.322;Inherit;False;False;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1288;-4031.804,3895.616;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1290;-3864.713,3896.802;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1291;-4197.952,3994.305;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1292;-4029.091,4117.115;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1294;-3876.45,4115.614;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1295;-4182.244,4214.238;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1300;-4015.216,4608.163;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1164;-551.8724,503.0734;Inherit;False;1354;BeforeEmi_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;577;-1009.955,2347.9;Inherit;False;Rim2EnvSpecShaded_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1271;-4458.814,4549.954;Inherit;False;Zsign;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1293;-3695.85,4116.775;Inherit;False;ProjectedZ;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1225;-4281.898,3264.713;Inherit;False;FCenterPos;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1285;-4465.651,4378.387;Inherit;False;Xsign;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1281;-4032.052,4357.49;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1286;-4241.638,4335.079;Inherit;False;1242;Up;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1261;-4670.136,4022.771;Inherit;False;1241;Forward;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1296;-5082.005,4432.238;Inherit;False;1256;Center2Cam;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1377;-4676.246,4113.886;Inherit;False;1256;Center2Cam;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1342;-1598.7,3097.95;Inherit;True;Property;_Hcubemap;HairShine CubeMap;36;1;[Header];Create;False;1;Hair Shine;0;0;False;0;False;-1;None;fad893ce3e4907245ae76bf2e4f48724;True;0;False;black;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;1353;-1026.459,3241.146;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1354;-888.9138,3227.973;Inherit;False;BeforeEmi_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1355;-1270.482,3156.994;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1359;-1452.857,3468.33;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1357;-1737.436,3471.639;Inherit;False;Property;_HairShinePower;Hair Shine Power;40;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1349;-1276.607,3361.228;Inherit;False;577;Rim2EnvSpecShaded_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1307;-2835.64,3103.008;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;1308;-2437.641,3099.596;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1309;-2570.302,3255.69;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;1312;-2951.854,3389.499;Inherit;False;1;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1313;-2726.961,3402.872;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1330;-3242.522,3392.835;Inherit;True;Property;_ShineNoiseMap;Shine NoiseMap;41;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1336;-2915.961,3476.872;Inherit;False;Property;_NoiseFactor;Noise Factor;42;0;Create;True;0;0;0;False;0;False;-0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1334;-3031.212,3001.612;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1341;-3273.871,3257.606;Inherit;False;Property;_DynamicShineExperimental;DynamicShine (Experimental);44;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1311;-3499.618,3410.235;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1332;-3371.538,2983.311;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;1333;-3206.037,2980.977;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1352;-2430.809,3254.925;Inherit;False;Property;_CubemapRotation;Cubemap Rotation;37;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1389;-2164.512,3338.493;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1356;-1572.566,3290.706;Inherit;False;Property;_HairShineColor;Hair Shine Color;39;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1310;-3518.065,3280.99;Inherit;False;1347;DynamicShine;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1289;-3692.535,3895.161;Inherit;False;ProjectedX;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1287;-4238.751,4419.019;Inherit;False;1289;ProjectedX;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1298;-4236.682,4579.555;Inherit;False;1242;Up;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1299;-4234.899,4666.176;Inherit;False;1293;ProjectedZ;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.AbsOpNode;1408;-3883.757,4611.005;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1301;-3747.837,4620.436;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1304;-3562.025,4622.584;Inherit;False;Zvalue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;1407;-3911.057,4361.504;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1297;-3780.066,4360.341;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1302;-3617.323,4361.566;Inherit;False;Xvalue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1270;-5086.687,4521.81;Inherit;False;1241;Forward;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1284;-5085.288,4603.589;Inherit;False;1256;Center2Cam;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1324;-2179.226,4324.403;Inherit;False;Property;_ShineMoveRange;ShineMoveRange;45;0;Create;True;0;0;0;False;0;False;0.05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1320;-1925.117,4500.888;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1318;-1728.777,4570.921;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1319;-1574.086,4452.382;Inherit;False;3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1314;-1938.533,4101.019;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1316;-1726.664,4181.051;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1323;-1425.842,4265.33;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1347;-1263.056,4266.06;Inherit;False;DynamicShine;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1329;-1756.059,4048.242;Inherit;False;1285;Xsign;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1322;-1770.752,4409.601;Inherit;False;1271;Zsign;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1398;-2108.87,4105.908;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1399;-2115.943,4506.334;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1345;-2476.7,4564.068;Inherit;False;1304;Zvalue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1317;-1564.575,4057.951;Inherit;False;3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SqrtOpNode;1339;-2541.514,4435.314;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1338;-2692.831,4436.163;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1337;-2840.367,4436.435;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1425;-2429.385,4436.976;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1426;-2265.48,4086.067;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1427;-2267.911,4463.642;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1346;-2565.004,4069.092;Inherit;False;1302;Xvalue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1326;-2732.062,4163.372;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1327;-2878.566,4164.375;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SqrtOpNode;1328;-2577.018,4162.467;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1343;-3067.777,4166.147;Inherit;False;1304;Zvalue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1424;-2463.757,4162.896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1256;-4017.545,3134.337;Inherit;False;Center2Cam;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1378;-4675.03,3892.915;Inherit;False;1256;Center2Cam;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;1331;-3588.954,2964.43;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;1361;-2031.523,3258.172;Inherit;False;Property;_CubemapViewRoatationExperimental;Cubemap View Roatation (Experimental);38;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;1335;-3312.436,3111.305;Inherit;False;Property;_ManualCubemapControl;Manual Cubemap Control;43;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1385;-2403.143,3361.775;Inherit;False;1384;Rotation;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1351;-1811.733,3118.695;Inherit;False;float alpha = degrees * UNITY_PI / 180.0@$float sina, cosa@$sincos(alpha, sina, cosa)@$float2x2 m = float2x2(cosa, -sina, sina, cosa)@$return float3(mul(m, vertex.xz), vertex.y).xzy@;3;Create;2;True;vertex;FLOAT3;0,0,0;In;;Inherit;False;True;degrees;FLOAT;0;In;;Inherit;False;RotateAroundYInDegrees;True;False;0;;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1344;-3025.079,4436.298;Inherit;False;1302;Xvalue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;1437;-2670.965,4285.316;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1436;-2871.964,4286.316;Inherit;False;1256;Center2Cam;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1435;-2529.197,4279.087;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;905;506.9733,1807.577;Float;False;False;-1;2;ASEMaterialInspector;100;13;New Amplify Shader;fe4af87006695164d84819765fe282b7;True;ForwardAdd;0;2;ForwardAdd;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;True;True;4;1;False;;1;False;;1;0;False;;1;False;;True;5;False;;5;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_CullMode;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;0;True;_StencilReference;255;True;_StencilReadMask;255;True;_StencilWriteMask;0;True;_StencilComparison;0;True;_StencilPassFront;0;True;_StencilFailFront;0;True;_StencilZFailFront;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;False;False;True;1;LightMode=ForwardAdd;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1456;-631.3419,4288.49;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ATan2OpNode;1457;-479.0147,4289.95;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1458;-841.3486,4287.798;Inherit;False;1256;Center2Cam;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TauNode;1459;-424.6949,4405.07;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1455;-305.0151,4319.95;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1463;-156.8242,4323.42;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;360;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1384;73.62134,4322.047;Inherit;False;Rotation;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;904;506.9733,1695.577;Float;False;True;-1;2;ASEMaterialInspector;100;13;LCSCshader/Hair;fe4af87006695164d84819765fe282b7;True;ForwardBase;0;1;ForwardBase;3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;True;True;0;1;False;;0;False;;0;0;False;;0;False;;True;1;False;;1;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_CullMode;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;0;True;_StencilReference;255;True;_StencilReadMask;255;True;_StencilWriteMask;0;True;_StencilComparison;0;True;_StencilPassFront;0;True;_StencilFailFront;0;True;_StencilZFailFront;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=ForwardBase;True;2;False;0;;0;0;Standard;0;0;5;True;True;True;False;True;False;;False;0
Node;AmplifyShaderEditor.PowerNode;1465;-1414.405,994.1989;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1200;-1443.395,1437.58;Inherit;False;355;RimMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;1466;-1346.985,1538.062;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
WireConnection;432;0;624;0
WireConnection;433;0;432;0
WireConnection;428;0;429;0
WireConnection;430;0;428;0
WireConnection;430;1;433;0
WireConnection;319;0;315;0
WireConnection;322;0;319;0
WireConnection;636;0;322;0
WireConnection;434;0;430;0
WireConnection;481;0;486;0
WireConnection;481;1;473;0
WireConnection;481;2;477;0
WireConnection;489;0;478;0
WireConnection;490;0;492;0
WireConnection;490;1;475;0
WireConnection;490;2;478;0
WireConnection;487;0;489;0
WireConnection;485;0;484;0
WireConnection;485;1;465;0
WireConnection;488;0;487;0
WireConnection;488;1;482;0
WireConnection;491;0;490;0
WireConnection;491;1;488;0
WireConnection;463;0;491;0
WireConnection;463;1;464;0
WireConnection;484;0;483;0
WireConnection;482;0;481;0
WireConnection;482;1;485;0
WireConnection;483;0;477;0
WireConnection;493;0;463;0
WireConnection;495;0;496;0
WireConnection;495;1;510;0
WireConnection;495;2;512;0
WireConnection;497;0;511;0
WireConnection;498;0;499;0
WireConnection;498;1;502;0
WireConnection;498;2;511;0
WireConnection;500;0;497;0
WireConnection;501;0;507;0
WireConnection;501;1;494;0
WireConnection;503;0;500;0
WireConnection;503;1;508;0
WireConnection;504;0;498;0
WireConnection;504;1;503;0
WireConnection;505;0;504;0
WireConnection;505;1;506;0
WireConnection;507;0;509;0
WireConnection;508;0;495;0
WireConnection;508;1;501;0
WireConnection;509;0;512;0
WireConnection;513;0;505;0
WireConnection;623;0;636;0
WireConnection;435;0;434;0
WireConnection;435;1;437;0
WireConnection;435;2;873;0
WireConnection;438;0;435;0
WireConnection;539;0;442;0
WireConnection;873;0;872;0
WireConnection;610;0;608;0
WireConnection;610;1;609;0
WireConnection;610;2;611;0
WireConnection;610;3;915;0
WireConnection;608;0;607;0
WireConnection;614;0;615;0
WireConnection;614;1;613;0
WireConnection;616;0;614;0
WireConnection;616;1;613;0
WireConnection;616;2;617;0
WireConnection;618;0;616;0
WireConnection;1016;0;1017;0
WireConnection;1016;1;444;0
WireConnection;1016;2;1015;0
WireConnection;1017;0;442;0
WireConnection;1017;1;441;0
WireConnection;444;0;442;0
WireConnection;444;1;441;0
WireConnection;444;2;443;0
WireConnection;440;0;1016;0
WireConnection;440;1;439;0
WireConnection;445;0;440;0
WireConnection;606;0;1021;0
WireConnection;606;1;610;0
WireConnection;612;0;606;0
WireConnection;604;0;602;0
WireConnection;604;1;1164;0
WireConnection;1018;0;602;0
WireConnection;1018;1;1164;0
WireConnection;1018;2;603;0
WireConnection;1021;0;604;0
WireConnection;1021;1;1018;0
WireConnection;1021;2;1020;0
WireConnection;570;0;1142;0
WireConnection;570;1;563;0
WireConnection;563;0;572;0
WireConnection;563;1;565;0
WireConnection;563;2;1088;0
WireConnection;565;0;564;0
WireConnection;565;1;566;0
WireConnection;557;0;1088;0
WireConnection;557;1;547;0
WireConnection;557;2;555;0
WireConnection;555;0;1094;0
WireConnection;555;1;575;0
WireConnection;1081;0;553;0
WireConnection;1081;1;1080;0
WireConnection;547;0;543;0
WireConnection;547;1;548;0
WireConnection;572;0;1093;0
WireConnection;572;1;556;0
WireConnection;1093;0;1083;0
WireConnection;1094;0;1085;0
WireConnection;1005;0;1129;0
WireConnection;1005;1;1130;0
WireConnection;1073;0;1128;0
WireConnection;1073;1;1033;0
WireConnection;208;0;1096;0
WireConnection;543;0;545;0
WireConnection;543;1;544;0
WireConnection;543;2;567;0
WireConnection;564;0;569;0
WireConnection;564;1;568;0
WireConnection;564;2;546;0
WireConnection;1078;0;573;0
WireConnection;1078;1;1077;0
WireConnection;1083;0;573;0
WireConnection;1083;1;1078;0
WireConnection;1083;2;1084;0
WireConnection;1085;0;553;0
WireConnection;1085;1;1081;0
WireConnection;1085;2;1086;0
WireConnection;1089;0;1120;0
WireConnection;1089;1;558;0
WireConnection;1089;2;1090;0
WireConnection;1088;0;1089;0
WireConnection;1088;1;1091;0
WireConnection;1096;0;1005;0
WireConnection;1096;1;1095;0
WireConnection;1096;2;1097;0
WireConnection;739;0;738;0
WireConnection;739;1;742;0
WireConnection;742;0;737;0
WireConnection;743;0;745;0
WireConnection;743;1;751;0
WireConnection;748;0;747;0
WireConnection;750;0;748;0
WireConnection;750;1;749;0
WireConnection;1113;0;1114;0
WireConnection;1113;3;1108;0
WireConnection;1113;4;1115;0
WireConnection;1114;0;1112;0
WireConnection;1112;0;1105;4
WireConnection;1112;1;1110;0
WireConnection;1112;2;1111;0
WireConnection;1105;0;1104;0
WireConnection;745;0;746;0
WireConnection;745;1;744;0
WireConnection;745;2;1106;0
WireConnection;1076;0;1029;0
WireConnection;1011;0;1010;0
WireConnection;1119;0;1118;0
WireConnection;1128;0;773;1
WireConnection;1128;1;825;0
WireConnection;1129;0;1074;0
WireConnection;1129;1;826;0
WireConnection;1131;0;875;0
WireConnection;1131;1;303;0
WireConnection;1130;0;1131;0
WireConnection;1130;1;301;0
WireConnection;1095;0;1005;0
WireConnection;913;0;1137;0
WireConnection;913;1;733;0
WireConnection;913;2;914;0
WireConnection;729;0;730;0
WireConnection;729;1;732;0
WireConnection;1137;0;727;0
WireConnection;1137;1;1138;0
WireConnection;1137;2;1139;0
WireConnection;1138;0;727;0
WireConnection;1138;1;1132;0
WireConnection;740;0;739;0
WireConnection;562;0;570;0
WireConnection;129;0;128;0
WireConnection;129;1;127;0
WireConnection;136;0;129;0
WireConnection;518;0;520;0
WireConnection;518;1;519;0
WireConnection;521;0;518;0
WireConnection;1145;0;1147;0
WireConnection;1147;0;1165;0
WireConnection;1147;1;1144;0
WireConnection;600;0;68;0
WireConnection;646;0;64;4
WireConnection;532;0;533;0
WireConnection;532;1;535;0
WireConnection;532;2;840;0
WireConnection;535;0;533;0
WireConnection;535;1;1154;0
WireConnection;535;2;537;0
WireConnection;531;0;530;0
WireConnection;531;1;529;0
WireConnection;840;0;531;0
WireConnection;542;0;532;0
WireConnection;1157;0;1156;0
WireConnection;1157;1;1161;0
WireConnection;528;1;1163;0
WireConnection;449;0;448;0
WireConnection;449;1;527;0
WireConnection;450;0;449;0
WireConnection;450;1;451;0
WireConnection;1038;0;331;0
WireConnection;1038;1;783;0
WireConnection;1038;2;1072;0
WireConnection;333;0;331;0
WireConnection;333;1;783;0
WireConnection;405;0;393;0
WireConnection;405;1;381;0
WireConnection;405;2;392;0
WireConnection;369;0;364;0
WireConnection;369;1;365;0
WireConnection;368;0;364;0
WireConnection;368;1;365;0
WireConnection;370;0;366;0
WireConnection;387;0;375;0
WireConnection;387;1;1166;0
WireConnection;394;0;375;0
WireConnection;394;1;1166;0
WireConnection;381;1;375;4
WireConnection;381;2;387;0
WireConnection;381;3;394;0
WireConnection;366;1;364;4
WireConnection;366;2;368;0
WireConnection;366;3;369;0
WireConnection;1178;0;1126;0
WireConnection;1178;1;334;0
WireConnection;337;0;1178;0
WireConnection;337;1;336;0
WireConnection;338;0;337;0
WireConnection;1181;0;346;0
WireConnection;1181;1;1170;0
WireConnection;1181;2;1183;0
WireConnection;1170;0;346;0
WireConnection;1170;1;1180;0
WireConnection;399;0;405;0
WireConnection;1029;0;1028;0
WireConnection;779;0;802;0
WireConnection;779;1;780;0
WireConnection;776;0;779;0
WireConnection;776;1;778;0
WireConnection;776;2;778;0
WireConnection;1067;0;1066;0
WireConnection;1068;0;1067;0
WireConnection;1068;1;1069;0
WireConnection;1068;2;1069;0
WireConnection;552;0;779;0
WireConnection;801;0;800;0
WireConnection;800;0;797;0
WireConnection;800;2;799;0
WireConnection;800;3;798;0
WireConnection;1187;0;1185;0
WireConnection;1187;1;1186;0
WireConnection;551;0;1187;0
WireConnection;551;1;550;0
WireConnection;781;0;776;0
WireConnection;1188;0;551;0
WireConnection;1122;0;1124;0
WireConnection;1122;2;1068;0
WireConnection;1070;0;1122;0
WireConnection;1171;0;1172;0
WireConnection;1171;1;1173;0
WireConnection;1180;0;1171;0
WireConnection;349;0;1009;0
WireConnection;1009;0;1181;0
WireConnection;1009;1;348;0
WireConnection;1009;2;1013;0
WireConnection;348;0;1181;0
WireConnection;348;1;347;0
WireConnection;339;0;338;0
WireConnection;1168;0;1167;0
WireConnection;408;0;1168;0
WireConnection;330;0;65;0
WireConnection;1140;0;1191;1
WireConnection;1039;0;333;0
WireConnection;1039;1;1038;0
WireConnection;1126;0;1039;0
WireConnection;1126;1;331;0
WireConnection;1033;0;1029;0
WireConnection;1033;1;1035;0
WireConnection;1075;1;1128;0
WireConnection;1075;0;1073;0
WireConnection;1074;0;1073;0
WireConnection;1074;1;1075;0
WireConnection;875;0;1127;0
WireConnection;875;1;876;0
WireConnection;1154;0;528;0
WireConnection;1154;1;1157;0
WireConnection;1163;0;450;0
WireConnection;1163;1;1152;0
WireConnection;727;0;730;0
WireConnection;727;1;729;0
WireConnection;733;1;735;0
WireConnection;735;1;1141;0
WireConnection;738;1;1141;0
WireConnection;1106;1;1113;0
WireConnection;751;1;750;0
WireConnection;65;1;1169;0
WireConnection;350;0;1198;0
WireConnection;1198;0;1158;0
WireConnection;1198;1;1199;0
WireConnection;436;0;1197;0
WireConnection;345;0;64;0
WireConnection;355;0;1212;0
WireConnection;410;0;409;0
WireConnection;410;1;421;0
WireConnection;411;0;410;0
WireConnection;411;1;412;0
WireConnection;413;0;411;0
WireConnection;540;0;426;0
WireConnection;424;0;426;4
WireConnection;424;1;423;0
WireConnection;424;2;1194;0
WireConnection;424;3;1465;0
WireConnection;427;0;424;0
WireConnection;561;0;557;0
WireConnection;561;1;576;0
WireConnection;578;0;563;0
WireConnection;452;0;457;0
WireConnection;452;1;456;0
WireConnection;453;0;452;0
WireConnection;453;1;455;0
WireConnection;454;0;453;0
WireConnection;458;0;454;0
WireConnection;461;0;460;4
WireConnection;461;1;458;0
WireConnection;461;2;1200;0
WireConnection;461;3;1466;0
WireConnection;462;0;461;0
WireConnection;541;0;460;0
WireConnection;423;0;413;0
WireConnection;1197;0;1143;0
WireConnection;1197;1;1196;0
WireConnection;1212;0;1193;0
WireConnection;1212;1;1213;0
WireConnection;903;0;913;0
WireConnection;903;3;743;0
WireConnection;1218;0;1222;0
WireConnection;1218;1;1221;0
WireConnection;1219;0;1220;0
WireConnection;1220;0;1218;0
WireConnection;1223;0;1224;0
WireConnection;1223;1;1226;0
WireConnection;1226;0;1229;0
WireConnection;1226;2;1255;0
WireConnection;1226;3;1227;0
WireConnection;1227;0;1255;0
WireConnection;1228;0;1223;0
WireConnection;1230;0;1243;0
WireConnection;1232;0;1231;0
WireConnection;1233;0;1231;0
WireConnection;1233;2;1243;0
WireConnection;1233;3;1230;0
WireConnection;1234;0;1237;0
WireConnection;1234;2;1247;0
WireConnection;1234;3;1238;0
WireConnection;1235;0;1233;0
WireConnection;1236;0;1234;0
WireConnection;1238;0;1247;0
WireConnection;1241;0;1235;0
WireConnection;1242;0;1236;0
WireConnection;1243;0;1257;0
WireConnection;1243;2;1244;0
WireConnection;1243;3;1239;0
WireConnection;1244;0;1245;0
WireConnection;1244;1;1239;3
WireConnection;1244;2;1246;0
WireConnection;1245;0;1239;2
WireConnection;1246;0;1239;1
WireConnection;1247;0;1257;0
WireConnection;1247;2;1248;0
WireConnection;1247;3;1240;0
WireConnection;1248;0;1249;0
WireConnection;1248;1;1240;3
WireConnection;1248;2;1250;0
WireConnection;1249;0;1240;2
WireConnection;1250;0;1240;1
WireConnection;1252;0;1251;2
WireConnection;1253;0;1252;0
WireConnection;1253;1;1251;3
WireConnection;1253;2;1254;0
WireConnection;1254;0;1251;1
WireConnection;1255;0;1257;0
WireConnection;1255;2;1253;0
WireConnection;1255;3;1251;0
WireConnection;1259;0;1260;0
WireConnection;1259;1;1261;0
WireConnection;1260;0;1378;0
WireConnection;1260;1;1261;0
WireConnection;1263;0;1264;0
WireConnection;1263;1;1274;0
WireConnection;1264;0;1377;0
WireConnection;1264;1;1274;0
WireConnection;1268;0;1269;0
WireConnection;1269;0;1279;0
WireConnection;1269;1;1278;0
WireConnection;1272;0;1273;0
WireConnection;1273;0;1283;0
WireConnection;1273;1;1282;0
WireConnection;1278;0;1296;0
WireConnection;1279;0;1267;0
WireConnection;1282;0;1284;0
WireConnection;1283;0;1270;0
WireConnection;1288;0;1378;0
WireConnection;1288;1;1291;0
WireConnection;1290;0;1288;0
WireConnection;1291;0;1259;0
WireConnection;1292;0;1377;0
WireConnection;1292;1;1295;0
WireConnection;1294;0;1292;0
WireConnection;1295;0;1263;0
WireConnection;1300;0;1298;0
WireConnection;1300;1;1299;0
WireConnection;577;0;561;0
WireConnection;1271;0;1272;0
WireConnection;1293;0;1294;0
WireConnection;1225;0;1226;0
WireConnection;1285;0;1268;0
WireConnection;1281;0;1286;0
WireConnection;1281;1;1287;0
WireConnection;1342;1;1351;0
WireConnection;1353;0;1355;0
WireConnection;1353;1;1349;0
WireConnection;1354;0;1353;0
WireConnection;1355;0;1342;0
WireConnection;1355;1;1356;0
WireConnection;1355;2;1359;0
WireConnection;1359;0;1357;0
WireConnection;1307;0;1334;0
WireConnection;1308;0;1307;0
WireConnection;1308;1;1309;0
WireConnection;1308;2;1307;2
WireConnection;1309;0;1307;1
WireConnection;1309;1;1313;0
WireConnection;1312;0;1330;0
WireConnection;1313;0;1312;0
WireConnection;1313;1;1336;0
WireConnection;1330;1;1311;0
WireConnection;1334;0;1333;0
WireConnection;1334;1;1335;0
WireConnection;1334;2;1341;0
WireConnection;1341;1;1310;0
WireConnection;1332;0;1331;2
WireConnection;1332;1;1331;1
WireConnection;1332;2;1331;3
WireConnection;1333;0;1332;0
WireConnection;1389;0;1352;0
WireConnection;1389;1;1385;0
WireConnection;1289;0;1290;0
WireConnection;1408;0;1300;0
WireConnection;1301;0;1408;0
WireConnection;1304;0;1301;0
WireConnection;1407;0;1281;0
WireConnection;1297;0;1407;0
WireConnection;1302;0;1297;0
WireConnection;1320;0;1399;0
WireConnection;1320;4;1324;0
WireConnection;1318;0;1320;0
WireConnection;1319;0;1322;0
WireConnection;1319;2;1320;0
WireConnection;1319;3;1318;0
WireConnection;1314;0;1398;0
WireConnection;1314;4;1324;0
WireConnection;1316;0;1314;0
WireConnection;1323;0;1319;0
WireConnection;1323;2;1317;0
WireConnection;1347;0;1323;0
WireConnection;1398;0;1435;0
WireConnection;1399;0;1427;0
WireConnection;1317;0;1329;0
WireConnection;1317;2;1314;0
WireConnection;1317;3;1316;0
WireConnection;1339;0;1338;0
WireConnection;1338;0;1337;0
WireConnection;1337;0;1344;0
WireConnection;1425;0;1435;2
WireConnection;1426;0;1346;0
WireConnection;1426;1;1424;0
WireConnection;1427;0;1425;0
WireConnection;1427;1;1345;0
WireConnection;1326;0;1327;0
WireConnection;1327;0;1343;0
WireConnection;1328;0;1326;0
WireConnection;1424;0;1328;0
WireConnection;1256;0;1228;0
WireConnection;1361;0;1352;0
WireConnection;1361;1;1389;0
WireConnection;1351;0;1308;0
WireConnection;1351;1;1361;0
WireConnection;1437;0;1436;0
WireConnection;1435;0;1437;0
WireConnection;1456;0;1458;0
WireConnection;1457;0;1456;2
WireConnection;1457;1;1456;0
WireConnection;1455;0;1457;0
WireConnection;1455;1;1459;0
WireConnection;1463;0;1455;0
WireConnection;1384;0;1463;0
WireConnection;904;0;618;0
WireConnection;1465;0;1206;0
WireConnection;1466;0;1210;0
ASEEND*/
//CHKSM=67307520C8D92F818F5A254DD0CCC726D714B96B