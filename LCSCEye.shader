// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "LCSCshader/Eye"
{
	Properties
	{
		[Header(Diffuse)]_MainTex("Eye Diffuse (_eye_col)", 2D) = "white" {}
		[HDR]_EyeTint("Eye Tint", Color) = (1,1,1,1)
		_SecondTex("Sclera Diffuse (_sclera)", 2D) = "white" {}
		[HDR]_ScleraTint("Sclera Tint", Color) = (1,1,1,1)
		[ToggleUI]_EyeShadow1("EyeShadow", Float) = 0
		[ToggleUI]_ScleraShadow("ScleraShadow", Float) = 0
		[ToggleUI]_HighLightShadow("HighLightShadow", Float) = 0
		[HDR]_Shadow("Shadow", Color) = (0.7,0.7,0.7,0)
		_ShadowStep("ShadowStep", Range( 0 , 1)) = 0.3
		_ShadowFeather("ShadowFeather", Range( 0 , 1)) = 0.3
		[ToggleUI]_ReceiveShadowLerp("ReceiveShadowLerp", Float) = 0
		[ToggleUI]_ShadowinLightColor("Shadow in LightColor", Float) = 0
		[ToggleUI]_NoShadowinDirectionalLightColor("NoShadow in DirectionalLightColor", Float) = 0
		[Header(HighLight)][ToggleUI]_HighLightToggle("HighLight Toggle", Float) = 0
		[NoScaleOffset]_hi02("HighLight (_eye_high)", 2D) = "black" {}
		[HDR]_HighLightTint("HighLight Tint", Color) = (1,1,1,1)
		_hiOffset("hi Offset", Vector) = (0,0,0,0)
		_hiRotation("hi Rotation", Float) = 0
		[Toggle]_hiAutoWaggle("hi AutoWaggle", Float) = 0
		_hiWaggleRange("hi WaggleRange", Float) = 1
		_hiFrequency("hiFrequency", Float) = 25
		_hiNoiseFrequency("hiNoiseFrequency", Float) = 30
		_hiNoiseFactor("hiNoiseFactor", Float) = 0.3
		[Header(Emissive and Other)]_EmiTex("Emissive (_emi) [optional]", 2D) = "white" {}
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
		_EyeLightFactor("EyeLightFactor", Range( 0 , 1)) = 0.5
		_ScleraLightFactor("ScleraLightFactor", Range( 0 , 1)) = 1
		_HighlightLightFactor("HighlightLightFactor", Range( 0 , 1)) = 0
		_GlobalLightFactor("GlobalLightFactor", Range( 0 , 1)) = 0
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
			
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }

			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend Off
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_SHADOWS 1

			//This is a late directive
			
			uniform float _StencilZFailFront;
			uniform float _StencilFailFront;
			uniform float _StencilPassFront;
			uniform float _StencilComparison;
			uniform float _StencilWriteMask;
			uniform float _StencilReadMask;
			uniform float _StencilReference;
			uniform float _CullMode;
			uniform float4 _UnsaturationColor;
			uniform float4 _CharaColor;
			uniform float _ScleraShadow;
			uniform sampler2D _SecondTex;
			uniform float4 _SecondTex_ST;
			uniform float4 _ScleraTint;
			uniform float4 _Shadow;
			uniform float _ShadowStep;
			uniform float _ReceiveShadowLerp;
			uniform float _ShadowFeather;
			uniform float _NoShadowinDirectionalLightColor;
			uniform float _MinDirectLight;
			uniform float _ShadowinLightColor;
			uniform float _MaxDirectLight;
			uniform float _UnifyIndirectDiffuseLight;
			uniform float _MinIndirectLight;
			uniform float _MaxIndirectLight;
			uniform float _LightColorGrayScale;
			uniform float _ScleraLightFactor;
			uniform float _EyeShadow1;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _EyeTint;
			uniform float _EyeLightFactor;
			uniform float _HighLightShadow;
			uniform float _HighLightToggle;
			uniform sampler2D _hi02;
			uniform float2 _hiOffset;
			uniform float _hiAutoWaggle;
			uniform float _hiFrequency;
			uniform float _hiNoiseFrequency;
			uniform float _hiNoiseFactor;
			uniform float _hiWaggleRange;
			uniform float _hiRotation;
			uniform float4 _HighLightTint;
			uniform float _HighlightLightFactor;
			uniform float _GlobalLightFactor;
			uniform sampler2D _EmiTex;
			uniform float4 _EmiTex_ST;
			uniform float4 _EmissiveColor;
			uniform float _EmmisiveStrength;
			uniform float _Saturation;
			float IsThereALight(  )
			{
				return any(_WorldSpaceLightPos0.xyz);
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
			
			float3 MaxShadeSH9(  )
			{
				return max(ShadeSH9(half4(0, 0, 0, 1)).rgb, ShadeSH9(half4(0, -1, 0, 1)).rgb);
			}
			


			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
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
			};
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				o.ase_texcoord2.xyz = ase_worldPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float2 temp_cast_0 = (0.5).xx;
				float2 appendResult1170 = (float2(_hiOffset.x , _hiOffset.y));
				float2 temp_output_1171_0 = ( ( v.ase_texcoord2.xy - temp_cast_0 ) + appendResult1170 );
				float hi02ctrl1668 = _hiAutoWaggle;
				float hi02Auto1667 = ( ( sin( ( asin( _SinTime.w ) * _hiFrequency ) ) + ( sin( ( asin( _CosTime.w ) * _hiNoiseFrequency ) ) * _hiNoiseFactor ) ) * _hiWaggleRange );
				float temp_output_1195_0 = ( ( ( hi02ctrl1668 == 1.0 ? ( hi02Auto1667 + _hiRotation ) : _hiRotation ) * UNITY_PI ) / 45.0 );
				float hi02Sin1209 = sin( temp_output_1195_0 );
				float2 temp_output_1172_0 = ( temp_output_1171_0 * hi02Sin1209 );
				float2 temp_cast_1 = (0.5).xx;
				float hi02Cos1210 = cos( temp_output_1195_0 );
				float2 temp_cast_2 = (0.5).xx;
				float2 temp_cast_3 = (0.5).xx;
				float2 appendResult1183 = (float2(( (temp_output_1172_0).y + ( (temp_output_1171_0).x * hi02Cos1210 ) ) , ( ( hi02Cos1210 * (temp_output_1171_0).y ) - (temp_output_1172_0).x )));
				float2 vertexToFrag1950 = ( float2( 0,0 ) + appendResult1183 + 0.5 );
				o.ase_texcoord1.zw = vertexToFrag1950;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				
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

				float2 uv_SecondTex = i.ase_texcoord1.xy * _SecondTex_ST.xy + _SecondTex_ST.zw;
				float4 temp_output_1990_0 = ( tex2D( _SecondTex, uv_SecondTex ) * _ScleraTint );
				float4 Shadow1322 = _Shadow;
				float localIsThereALight797 = IsThereALight();
				float3 ase_worldPos = i.ase_texcoord2.xyz;
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(ase_worldPos);
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float dotResult779 = dot( worldSpaceLightDir , ase_worldNormal );
				float HalfLambertTerm781 = ( localIsThereALight797 == 1.0 ? (dotResult779*0.5 + 0.5) : 1.0 );
				float localIsThereALight1962 = IsThereALight();
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float HalfShadowAttenuation1955 = ( localIsThereALight1962 == 1.0 ? (saturate( ase_atten )*0.5 + 0.5) : 1.0 );
				float shad_lerp1312 = saturate( ( ( _ShadowStep - (( _ReceiveShadowLerp )?( ( HalfLambertTerm781 * HalfShadowAttenuation1955 ) ):( HalfLambertTerm781 )) ) / _ShadowFeather ) );
				float4 lerpResult1325 = lerp( temp_output_1990_0 , ( temp_output_1990_0 * Shadow1322 ) , shad_lerp1312);
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float3 temp_cast_0 = (_MinDirectLight).xxx;
				float3 temp_output_1971_0 = max( ase_lightColor.rgb , temp_cast_0 );
				float3 worldPos1939 = ase_worldPos;
				float localPureLightAttenuation1939 = PureLightAttenuation( worldPos1939 );
				float3 temp_output_1942_0 = ( temp_output_1971_0 * (( _ShadowinLightColor )?( ase_atten ):( localPureLightAttenuation1939 )) );
				float3 temp_cast_1 = (_MinDirectLight).xxx;
				float3 temp_cast_2 = (_MinDirectLight).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch1941 = temp_output_1942_0;
				#else
				float3 staticSwitch1941 = temp_output_1971_0;
				#endif
				float3 temp_cast_3 = (_MaxDirectLight).xxx;
				float4 Normal1973 = float4( 0,0,0,0 );
				float3 localShadeSH9out1973 = ShadeSH9out( Normal1973 );
				float3 localMaxShadeSH9876 = MaxShadeSH9();
				float3 temp_cast_4 = (_MinIndirectLight).xxx;
				float3 temp_cast_5 = (_MaxIndirectLight).xxx;
				float3 temp_output_1706_0 = max( min( (( _NoShadowinDirectionalLightColor )?( staticSwitch1941 ):( temp_output_1942_0 )) , temp_cast_3 ) , min( max( (( _UnifyIndirectDiffuseLight )?( localMaxShadeSH9876 ):( localShadeSH9out1973 )) , temp_cast_4 ) , temp_cast_5 ) );
				float3 temp_cast_6 = (_MinDirectLight).xxx;
				float3 temp_cast_7 = (_MaxDirectLight).xxx;
				float3 temp_cast_8 = (_MinIndirectLight).xxx;
				float3 temp_cast_9 = (_MaxIndirectLight).xxx;
				float grayscale1945 = dot(temp_output_1706_0, float3(0.299,0.587,0.114));
				float3 temp_cast_10 = (grayscale1945).xxx;
				float3 lerpResult1944 = lerp( temp_output_1706_0 , temp_cast_10 , _LightColorGrayScale);
				float3 LightColor208 = lerpResult1944;
				float ScleraLightFactor2011 = _ScleraLightFactor;
				float4 lerpResult1712 = lerp( (( _ScleraShadow )?( lerpResult1325 ):( temp_output_1990_0 )) , ( (( _ScleraShadow )?( lerpResult1325 ):( temp_output_1990_0 )) * float4( LightColor208 , 0.0 ) ) , ScleraLightFactor2011);
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode932 = tex2D( _MainTex, uv_MainTex );
				float4 temp_output_1992_0 = ( tex2DNode932 * _EyeTint );
				float4 lerpResult2001 = lerp( temp_output_1992_0 , ( temp_output_1992_0 * Shadow1322 ) , shad_lerp1312);
				float EyeLightFactor1708 = _EyeLightFactor;
				float4 lerpResult2008 = lerp( (( _EyeShadow1 )?( lerpResult2001 ):( temp_output_1992_0 )) , ( (( _EyeShadow1 )?( lerpResult2001 ):( temp_output_1992_0 )) * float4( LightColor208 , 0.0 ) ) , EyeLightFactor1708);
				float EyeAlpha2012 = tex2DNode932.a;
				float4 lerpResult1982 = lerp( lerpResult1712 , lerpResult2008 , EyeAlpha2012);
				float2 vertexToFrag1950 = i.ase_texcoord1.zw;
				float2 hi02UV1216 = vertexToFrag1950;
				float4 lerpResult1378 = lerp( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) , ( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) * Shadow1322 ) , shad_lerp1312);
				float HighlightLightFactor1709 = _HighlightLightFactor;
				float4 lerpResult1713 = lerp( (( _HighLightShadow )?( lerpResult1378 ):( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) )) , ( (( _HighLightShadow )?( lerpResult1378 ):( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) )) * float4( LightColor208 , 0.0 ) ) , HighlightLightFactor1709);
				float Highlight_Alpha1988 = ((( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) ))).a;
				float4 lerpResult1984 = lerp( lerpResult1982 , lerpResult1713 , Highlight_Alpha1988);
				float4 blend_diff916 = lerpResult1984;
				float GlobalLightFactor1719 = _GlobalLightFactor;
				float4 lerpResult1723 = lerp( ( _CharaColor * blend_diff916 ) , ( _CharaColor * blend_diff916 * float4( LightColor208 , 0.0 ) ) , GlobalLightFactor1719);
				float2 uv_EmiTex = i.ase_texcoord1.xy * _EmiTex_ST.xy + _EmiTex_ST.zw;
				float4 Emissive600 = tex2D( _EmiTex, uv_EmiTex );
				float4 Refined_diff612 = ( lerpResult1723 + ( Emissive600 * _EmissiveColor * _EmmisiveStrength ) );
				float dotResult614 = dot( _UnsaturationColor , Refined_diff612 );
				float4 temp_cast_15 = (dotResult614).xxxx;
				float4 lerpResult616 = lerp( temp_cast_15 , Refined_diff612 , _Saturation);
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_SHADOWS 1

			//This is a late directive
			
			uniform float _StencilZFailFront;
			uniform float _StencilFailFront;
			uniform float _StencilPassFront;
			uniform float _StencilComparison;
			uniform float _StencilWriteMask;
			uniform float _StencilReadMask;
			uniform float _StencilReference;
			uniform float _CullMode;
			uniform float4 _UnsaturationColor;
			uniform float4 _CharaColor;
			uniform float _ScleraShadow;
			uniform sampler2D _SecondTex;
			uniform float4 _SecondTex_ST;
			uniform float4 _ScleraTint;
			uniform float4 _Shadow;
			uniform float _ShadowStep;
			uniform float _ReceiveShadowLerp;
			uniform float _ShadowFeather;
			uniform float _NoShadowinDirectionalLightColor;
			uniform float _MinDirectLight;
			uniform float _ShadowinLightColor;
			uniform float _MaxDirectLight;
			uniform float _UnifyIndirectDiffuseLight;
			uniform float _MinIndirectLight;
			uniform float _MaxIndirectLight;
			uniform float _LightColorGrayScale;
			uniform float _ScleraLightFactor;
			uniform float _EyeShadow1;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _EyeTint;
			uniform float _EyeLightFactor;
			uniform float _HighLightShadow;
			uniform float _HighLightToggle;
			uniform sampler2D _hi02;
			uniform float2 _hiOffset;
			uniform float _hiAutoWaggle;
			uniform float _hiFrequency;
			uniform float _hiNoiseFrequency;
			uniform float _hiNoiseFactor;
			uniform float _hiWaggleRange;
			uniform float _hiRotation;
			uniform float4 _HighLightTint;
			uniform float _HighlightLightFactor;
			uniform float _GlobalLightFactor;
			uniform sampler2D _EmiTex;
			uniform float4 _EmiTex_ST;
			uniform float4 _EmissiveColor;
			uniform float _EmmisiveStrength;
			uniform float _Saturation;
			float IsThereALight(  )
			{
				return any(_WorldSpaceLightPos0.xyz);
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
			
			float3 MaxShadeSH9(  )
			{
				return max(ShadeSH9(half4(0, 0, 0, 1)).rgb, ShadeSH9(half4(0, -1, 0, 1)).rgb);
			}
			


			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
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
			};
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				o.ase_texcoord2.xyz = ase_worldPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float2 temp_cast_0 = (0.5).xx;
				float2 appendResult1170 = (float2(_hiOffset.x , _hiOffset.y));
				float2 temp_output_1171_0 = ( ( v.ase_texcoord2.xy - temp_cast_0 ) + appendResult1170 );
				float hi02ctrl1668 = _hiAutoWaggle;
				float hi02Auto1667 = ( ( sin( ( asin( _SinTime.w ) * _hiFrequency ) ) + ( sin( ( asin( _CosTime.w ) * _hiNoiseFrequency ) ) * _hiNoiseFactor ) ) * _hiWaggleRange );
				float temp_output_1195_0 = ( ( ( hi02ctrl1668 == 1.0 ? ( hi02Auto1667 + _hiRotation ) : _hiRotation ) * UNITY_PI ) / 45.0 );
				float hi02Sin1209 = sin( temp_output_1195_0 );
				float2 temp_output_1172_0 = ( temp_output_1171_0 * hi02Sin1209 );
				float2 temp_cast_1 = (0.5).xx;
				float hi02Cos1210 = cos( temp_output_1195_0 );
				float2 temp_cast_2 = (0.5).xx;
				float2 temp_cast_3 = (0.5).xx;
				float2 appendResult1183 = (float2(( (temp_output_1172_0).y + ( (temp_output_1171_0).x * hi02Cos1210 ) ) , ( ( hi02Cos1210 * (temp_output_1171_0).y ) - (temp_output_1172_0).x )));
				float2 vertexToFrag1950 = ( float2( 0,0 ) + appendResult1183 + 0.5 );
				o.ase_texcoord1.zw = vertexToFrag1950;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				
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

				float2 uv_SecondTex = i.ase_texcoord1.xy * _SecondTex_ST.xy + _SecondTex_ST.zw;
				float4 temp_output_1990_0 = ( tex2D( _SecondTex, uv_SecondTex ) * _ScleraTint );
				float4 Shadow1322 = _Shadow;
				float localIsThereALight797 = IsThereALight();
				float3 ase_worldPos = i.ase_texcoord2.xyz;
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(ase_worldPos);
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float dotResult779 = dot( worldSpaceLightDir , ase_worldNormal );
				float HalfLambertTerm781 = ( localIsThereALight797 == 1.0 ? (dotResult779*0.5 + 0.5) : 1.0 );
				float localIsThereALight1962 = IsThereALight();
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float HalfShadowAttenuation1955 = ( localIsThereALight1962 == 1.0 ? (saturate( ase_atten )*0.5 + 0.5) : 1.0 );
				float shad_lerp1312 = saturate( ( ( _ShadowStep - (( _ReceiveShadowLerp )?( ( HalfLambertTerm781 * HalfShadowAttenuation1955 ) ):( HalfLambertTerm781 )) ) / _ShadowFeather ) );
				float4 lerpResult1325 = lerp( temp_output_1990_0 , ( temp_output_1990_0 * Shadow1322 ) , shad_lerp1312);
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float3 temp_cast_0 = (_MinDirectLight).xxx;
				float3 temp_output_1971_0 = max( ase_lightColor.rgb , temp_cast_0 );
				float3 worldPos1939 = ase_worldPos;
				float localPureLightAttenuation1939 = PureLightAttenuation( worldPos1939 );
				float3 temp_output_1942_0 = ( temp_output_1971_0 * (( _ShadowinLightColor )?( ase_atten ):( localPureLightAttenuation1939 )) );
				float3 temp_cast_1 = (_MinDirectLight).xxx;
				float3 temp_cast_2 = (_MinDirectLight).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch1941 = temp_output_1942_0;
				#else
				float3 staticSwitch1941 = temp_output_1971_0;
				#endif
				float3 temp_cast_3 = (_MaxDirectLight).xxx;
				float4 Normal1973 = float4( 0,0,0,0 );
				float3 localShadeSH9out1973 = ShadeSH9out( Normal1973 );
				float3 localMaxShadeSH9876 = MaxShadeSH9();
				float3 temp_cast_4 = (_MinIndirectLight).xxx;
				float3 temp_cast_5 = (_MaxIndirectLight).xxx;
				float3 temp_output_1706_0 = max( min( (( _NoShadowinDirectionalLightColor )?( staticSwitch1941 ):( temp_output_1942_0 )) , temp_cast_3 ) , min( max( (( _UnifyIndirectDiffuseLight )?( localMaxShadeSH9876 ):( localShadeSH9out1973 )) , temp_cast_4 ) , temp_cast_5 ) );
				float3 temp_cast_6 = (_MinDirectLight).xxx;
				float3 temp_cast_7 = (_MaxDirectLight).xxx;
				float3 temp_cast_8 = (_MinIndirectLight).xxx;
				float3 temp_cast_9 = (_MaxIndirectLight).xxx;
				float grayscale1945 = dot(temp_output_1706_0, float3(0.299,0.587,0.114));
				float3 temp_cast_10 = (grayscale1945).xxx;
				float3 lerpResult1944 = lerp( temp_output_1706_0 , temp_cast_10 , _LightColorGrayScale);
				float3 LightColor208 = lerpResult1944;
				float ScleraLightFactor2011 = _ScleraLightFactor;
				float4 lerpResult1712 = lerp( (( _ScleraShadow )?( lerpResult1325 ):( temp_output_1990_0 )) , ( (( _ScleraShadow )?( lerpResult1325 ):( temp_output_1990_0 )) * float4( LightColor208 , 0.0 ) ) , ScleraLightFactor2011);
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode932 = tex2D( _MainTex, uv_MainTex );
				float4 temp_output_1992_0 = ( tex2DNode932 * _EyeTint );
				float4 lerpResult2001 = lerp( temp_output_1992_0 , ( temp_output_1992_0 * Shadow1322 ) , shad_lerp1312);
				float EyeLightFactor1708 = _EyeLightFactor;
				float4 lerpResult2008 = lerp( (( _EyeShadow1 )?( lerpResult2001 ):( temp_output_1992_0 )) , ( (( _EyeShadow1 )?( lerpResult2001 ):( temp_output_1992_0 )) * float4( LightColor208 , 0.0 ) ) , EyeLightFactor1708);
				float EyeAlpha2012 = tex2DNode932.a;
				float4 lerpResult1982 = lerp( lerpResult1712 , lerpResult2008 , EyeAlpha2012);
				float2 vertexToFrag1950 = i.ase_texcoord1.zw;
				float2 hi02UV1216 = vertexToFrag1950;
				float4 lerpResult1378 = lerp( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) , ( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) * Shadow1322 ) , shad_lerp1312);
				float HighlightLightFactor1709 = _HighlightLightFactor;
				float4 lerpResult1713 = lerp( (( _HighLightShadow )?( lerpResult1378 ):( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) )) , ( (( _HighLightShadow )?( lerpResult1378 ):( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) )) * float4( LightColor208 , 0.0 ) ) , HighlightLightFactor1709);
				float Highlight_Alpha1988 = ((( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) ))).a;
				float4 lerpResult1984 = lerp( lerpResult1982 , lerpResult1713 , Highlight_Alpha1988);
				float4 blend_diff916 = lerpResult1984;
				float GlobalLightFactor1719 = _GlobalLightFactor;
				float4 lerpResult1723 = lerp( ( _CharaColor * blend_diff916 ) , ( _CharaColor * blend_diff916 * float4( LightColor208 , 0.0 ) ) , GlobalLightFactor1719);
				float2 uv_EmiTex = i.ase_texcoord1.xy * _EmiTex_ST.xy + _EmiTex_ST.zw;
				float4 Emissive600 = tex2D( _EmiTex, uv_EmiTex );
				float4 Refined_diff612 = ( lerpResult1723 + ( Emissive600 * _EmissiveColor * _EmmisiveStrength ) );
				float dotResult614 = dot( _UnsaturationColor , Refined_diff612 );
				float4 temp_cast_15 = (dotResult614).xxxx;
				float4 lerpResult616 = lerp( temp_cast_15 , Refined_diff612 , _Saturation);
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_SHADOWS 1

			//This is a late directive
			
			uniform float _StencilZFailFront;
			uniform float _StencilFailFront;
			uniform float _StencilPassFront;
			uniform float _StencilComparison;
			uniform float _StencilWriteMask;
			uniform float _StencilReadMask;
			uniform float _StencilReference;
			uniform float _CullMode;
			uniform float4 _UnsaturationColor;
			uniform float4 _CharaColor;
			uniform float _ScleraShadow;
			uniform sampler2D _SecondTex;
			uniform float4 _SecondTex_ST;
			uniform float4 _ScleraTint;
			uniform float4 _Shadow;
			uniform float _ShadowStep;
			uniform float _ReceiveShadowLerp;
			uniform float _ShadowFeather;
			uniform float _NoShadowinDirectionalLightColor;
			uniform float _MinDirectLight;
			uniform float _ShadowinLightColor;
			uniform float _MaxDirectLight;
			uniform float _UnifyIndirectDiffuseLight;
			uniform float _MinIndirectLight;
			uniform float _MaxIndirectLight;
			uniform float _LightColorGrayScale;
			uniform float _ScleraLightFactor;
			uniform float _EyeShadow1;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _EyeTint;
			uniform float _EyeLightFactor;
			uniform float _HighLightShadow;
			uniform float _HighLightToggle;
			uniform sampler2D _hi02;
			uniform float2 _hiOffset;
			uniform float _hiAutoWaggle;
			uniform float _hiFrequency;
			uniform float _hiNoiseFrequency;
			uniform float _hiNoiseFactor;
			uniform float _hiWaggleRange;
			uniform float _hiRotation;
			uniform float4 _HighLightTint;
			uniform float _HighlightLightFactor;
			uniform float _GlobalLightFactor;
			uniform sampler2D _EmiTex;
			uniform float4 _EmiTex_ST;
			uniform float4 _EmissiveColor;
			uniform float _EmmisiveStrength;
			uniform float _Saturation;
			float IsThereALight(  )
			{
				return any(_WorldSpaceLightPos0.xyz);
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
			
			float3 MaxShadeSH9(  )
			{
				return max(ShadeSH9(half4(0, 0, 0, 1)).rgb, ShadeSH9(half4(0, -1, 0, 1)).rgb);
			}
			


			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
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
			};

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				o.ase_texcoord2.xyz = ase_worldPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float2 temp_cast_0 = (0.5).xx;
				float2 appendResult1170 = (float2(_hiOffset.x , _hiOffset.y));
				float2 temp_output_1171_0 = ( ( v.ase_texcoord2.xy - temp_cast_0 ) + appendResult1170 );
				float hi02ctrl1668 = _hiAutoWaggle;
				float hi02Auto1667 = ( ( sin( ( asin( _SinTime.w ) * _hiFrequency ) ) + ( sin( ( asin( _CosTime.w ) * _hiNoiseFrequency ) ) * _hiNoiseFactor ) ) * _hiWaggleRange );
				float temp_output_1195_0 = ( ( ( hi02ctrl1668 == 1.0 ? ( hi02Auto1667 + _hiRotation ) : _hiRotation ) * UNITY_PI ) / 45.0 );
				float hi02Sin1209 = sin( temp_output_1195_0 );
				float2 temp_output_1172_0 = ( temp_output_1171_0 * hi02Sin1209 );
				float2 temp_cast_1 = (0.5).xx;
				float hi02Cos1210 = cos( temp_output_1195_0 );
				float2 temp_cast_2 = (0.5).xx;
				float2 temp_cast_3 = (0.5).xx;
				float2 appendResult1183 = (float2(( (temp_output_1172_0).y + ( (temp_output_1171_0).x * hi02Cos1210 ) ) , ( ( hi02Cos1210 * (temp_output_1171_0).y ) - (temp_output_1172_0).x )));
				float2 vertexToFrag1950 = ( float2( 0,0 ) + appendResult1183 + 0.5 );
				o.ase_texcoord1.zw = vertexToFrag1950;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				
				v.vertex.xyz +=  float3(0,0,0) ;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
				return o;
			}
			
			float4 frag (v2f i ) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				float2 uv_SecondTex = i.ase_texcoord1.xy * _SecondTex_ST.xy + _SecondTex_ST.zw;
				float4 temp_output_1990_0 = ( tex2D( _SecondTex, uv_SecondTex ) * _ScleraTint );
				float4 Shadow1322 = _Shadow;
				float localIsThereALight797 = IsThereALight();
				float3 ase_worldPos = i.ase_texcoord2.xyz;
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(ase_worldPos);
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float dotResult779 = dot( worldSpaceLightDir , ase_worldNormal );
				float HalfLambertTerm781 = ( localIsThereALight797 == 1.0 ? (dotResult779*0.5 + 0.5) : 1.0 );
				float localIsThereALight1962 = IsThereALight();
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float HalfShadowAttenuation1955 = ( localIsThereALight1962 == 1.0 ? (saturate( ase_atten )*0.5 + 0.5) : 1.0 );
				float shad_lerp1312 = saturate( ( ( _ShadowStep - (( _ReceiveShadowLerp )?( ( HalfLambertTerm781 * HalfShadowAttenuation1955 ) ):( HalfLambertTerm781 )) ) / _ShadowFeather ) );
				float4 lerpResult1325 = lerp( temp_output_1990_0 , ( temp_output_1990_0 * Shadow1322 ) , shad_lerp1312);
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float3 temp_cast_0 = (_MinDirectLight).xxx;
				float3 temp_output_1971_0 = max( ase_lightColor.rgb , temp_cast_0 );
				float3 worldPos1939 = ase_worldPos;
				float localPureLightAttenuation1939 = PureLightAttenuation( worldPos1939 );
				float3 temp_output_1942_0 = ( temp_output_1971_0 * (( _ShadowinLightColor )?( ase_atten ):( localPureLightAttenuation1939 )) );
				float3 temp_cast_1 = (_MinDirectLight).xxx;
				float3 temp_cast_2 = (_MinDirectLight).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch1941 = temp_output_1942_0;
				#else
				float3 staticSwitch1941 = temp_output_1971_0;
				#endif
				float3 temp_cast_3 = (_MaxDirectLight).xxx;
				float4 Normal1973 = float4( 0,0,0,0 );
				float3 localShadeSH9out1973 = ShadeSH9out( Normal1973 );
				float3 localMaxShadeSH9876 = MaxShadeSH9();
				float3 temp_cast_4 = (_MinIndirectLight).xxx;
				float3 temp_cast_5 = (_MaxIndirectLight).xxx;
				float3 temp_output_1706_0 = max( min( (( _NoShadowinDirectionalLightColor )?( staticSwitch1941 ):( temp_output_1942_0 )) , temp_cast_3 ) , min( max( (( _UnifyIndirectDiffuseLight )?( localMaxShadeSH9876 ):( localShadeSH9out1973 )) , temp_cast_4 ) , temp_cast_5 ) );
				float3 temp_cast_6 = (_MinDirectLight).xxx;
				float3 temp_cast_7 = (_MaxDirectLight).xxx;
				float3 temp_cast_8 = (_MinIndirectLight).xxx;
				float3 temp_cast_9 = (_MaxIndirectLight).xxx;
				float grayscale1945 = dot(temp_output_1706_0, float3(0.299,0.587,0.114));
				float3 temp_cast_10 = (grayscale1945).xxx;
				float3 lerpResult1944 = lerp( temp_output_1706_0 , temp_cast_10 , _LightColorGrayScale);
				float3 LightColor208 = lerpResult1944;
				float ScleraLightFactor2011 = _ScleraLightFactor;
				float4 lerpResult1712 = lerp( (( _ScleraShadow )?( lerpResult1325 ):( temp_output_1990_0 )) , ( (( _ScleraShadow )?( lerpResult1325 ):( temp_output_1990_0 )) * float4( LightColor208 , 0.0 ) ) , ScleraLightFactor2011);
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode932 = tex2D( _MainTex, uv_MainTex );
				float4 temp_output_1992_0 = ( tex2DNode932 * _EyeTint );
				float4 lerpResult2001 = lerp( temp_output_1992_0 , ( temp_output_1992_0 * Shadow1322 ) , shad_lerp1312);
				float EyeLightFactor1708 = _EyeLightFactor;
				float4 lerpResult2008 = lerp( (( _EyeShadow1 )?( lerpResult2001 ):( temp_output_1992_0 )) , ( (( _EyeShadow1 )?( lerpResult2001 ):( temp_output_1992_0 )) * float4( LightColor208 , 0.0 ) ) , EyeLightFactor1708);
				float EyeAlpha2012 = tex2DNode932.a;
				float4 lerpResult1982 = lerp( lerpResult1712 , lerpResult2008 , EyeAlpha2012);
				float2 vertexToFrag1950 = i.ase_texcoord1.zw;
				float2 hi02UV1216 = vertexToFrag1950;
				float4 lerpResult1378 = lerp( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) , ( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) * Shadow1322 ) , shad_lerp1312);
				float HighlightLightFactor1709 = _HighlightLightFactor;
				float4 lerpResult1713 = lerp( (( _HighLightShadow )?( lerpResult1378 ):( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) )) , ( (( _HighLightShadow )?( lerpResult1378 ):( (( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) )) )) * float4( LightColor208 , 0.0 ) ) , HighlightLightFactor1709);
				float Highlight_Alpha1988 = ((( _HighLightToggle )?( ( tex2D( _hi02, hi02UV1216 ) * _HighLightTint ) ):( float4( 0,0,0,0 ) ))).a;
				float4 lerpResult1984 = lerp( lerpResult1982 , lerpResult1713 , Highlight_Alpha1988);
				float4 blend_diff916 = lerpResult1984;
				float GlobalLightFactor1719 = _GlobalLightFactor;
				float4 lerpResult1723 = lerp( ( _CharaColor * blend_diff916 ) , ( _CharaColor * blend_diff916 * float4( LightColor208 , 0.0 ) ) , GlobalLightFactor1719);
				float2 uv_EmiTex = i.ase_texcoord1.xy * _EmiTex_ST.xy + _EmiTex_ST.zw;
				float4 Emissive600 = tex2D( _EmiTex, uv_EmiTex );
				float4 Refined_diff612 = ( lerpResult1723 + ( Emissive600 * _EmissiveColor * _EmmisiveStrength ) );
				float dotResult614 = dot( _UnsaturationColor , Refined_diff612 );
				float4 temp_cast_15 = (dotResult614).xxxx;
				float4 lerpResult616 = lerp( temp_cast_15 , Refined_diff612 , _Saturation);
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
Node;AmplifyShaderEditor.CommentaryNode;1999;-2867.176,1860.301;Inherit;False;1997.955;472.976;;17;1370;1389;1713;1714;1382;1344;1987;1988;1379;1376;1377;1378;1997;1998;1253;1254;1252;HighLight Blend;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1996;-974.7452,-304.8938;Inherit;False;1218.305;593.6263;;18;1651;1652;1653;1654;1655;1656;1657;1658;1659;1668;1662;1663;1664;1666;1661;1665;1660;1667;Waggle Control;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1993;-3129.521,618.7509;Inherit;False;2470.679;1084.502;;44;1325;1323;1324;1318;1359;1390;1711;1712;1314;1315;1317;1316;1309;1310;1312;1322;1321;1957;1959;1345;1958;1986;1984;916;1982;1980;1979;1991;1990;933;932;1992;1424;2001;2002;2003;2004;2005;2006;2007;2008;2009;2012;2013;Main Blend;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1956;-5387.377,627.3367;Inherit;False;2116.237;1227.786;;47;1706;773;825;1940;1936;1937;1938;1939;1942;826;875;303;876;301;1941;1944;1945;1946;208;780;779;776;778;1929;800;797;781;1951;1952;1953;1954;1955;1710;1709;1708;1707;1720;1719;1961;1962;1971;1972;1973;1974;1975;2010;2011;Light;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1673;-2810.716,-433.988;Inherit;False;1586.006;901.0853;;36;1170;1171;1172;1173;1174;1175;1176;1177;1178;1179;1180;1181;1182;1183;1184;1185;1186;1187;1192;1215;1207;1214;1216;1196;1197;1209;1210;1194;1195;1193;1669;1670;1672;1208;1671;1950;hi02UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;911;-3877.887,-508.994;Inherit;False;563.0215;1092.147;;8;345;906;909;910;68;600;1977;1978;Texture Input;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;870;-339.2699,501.8363;Inherit;False;356.8159;717.053;;7;869;865;864;868;866;867;863;Stencil;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;643;-601.8802,1347.168;Inherit;False;946.0739;1196.966;;19;609;610;605;604;611;606;612;602;613;616;614;617;615;618;1697;1721;1722;1723;1724;Emissive and other Process;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;600;-3538.865,353.5129;Inherit;False;Emissive;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;910;-3556.635,142.5201;Inherit;False;_hi02;-1;True;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;613;-512.1442,2338.781;Inherit;False;612;Refined_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;614;-263.2475,2199.979;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;616;-139.797,2250.183;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;617;-563.7191,2426.13;Inherit;False;Property;_Saturation;Saturation;27;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;618;132.6317,2238.969;Inherit;False;output_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;869;-252.8253,1102.89;Inherit;False;Property;_StencilZFailFront;Stencil ZFailFront;45;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;868;-251.8039,1014.002;Inherit;False;Property;_StencilFailFront;Stencil FailFront;44;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;864;-252.0719,921.8448;Inherit;False;Property;_StencilPassFront;Stencil PassFront;43;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;865;-254.1154,827.78;Inherit;False;Property;_StencilComparison;Stencil Comparison;42;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;866;-282.4536,729.9727;Inherit;False;Property;_StencilWriteMask;Stencil WriteMask;41;0;Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;867;-287.5633,641.0858;Inherit;False;Property;_StencilReadMask;Stencil ReadMask;40;0;Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.CosOpNode;1196;-1960.913,-200.4143;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;1197;-1960.913,-283.6145;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1209;-1842.977,-288.6985;Inherit;False;hi02Sin;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1210;-1845.077,-204.2984;Inherit;False;hi02Cos;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1194;-2229.617,-249.2604;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1195;-2089.819,-247.9604;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;45;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;1193;-2417.968,-187.6354;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1669;-2387.241,-341.3569;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1670;-2523.643,-302.896;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1672;-2568.838,-383.988;Inherit;False;1668;hi02ctrl;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;863;-289.2696,551.8365;Inherit;False;Property;_StencilReference;Stencil Reference;39;1;[Header];Create;True;1;Stencil Buffer;0;0;True;0;False;0;0;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;68;-3827.885,353.1527;Inherit;True;Property;_EmiTex;Emissive (_emi) [optional];23;1;[Header];Create;False;1;Emissive and Other;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;609;-493.3135,1750.618;Inherit;False;600;Emissive;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;610;-212.5704,1771.048;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1697;-535.5019,2026.743;Inherit;False;Property;_EmmisiveStrength;EmmisiveStrength;25;0;Create;True;0;0;0;False;0;False;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1698;538.3658,1661.995;Float;False;False;-1;2;ASEMaterialInspector;100;12;New Amplify Shader;fe4af87006695164d84819765fe282b7;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=ForwardBase;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1701;538.3658,1970.995;Float;False;False;-1;2;ASEMaterialInspector;100;12;New Amplify Shader;fe4af87006695164d84819765fe282b7;True;Deferred;0;3;Deferred;4;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Deferred;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1702;538.3658,1799.995;Float;False;False;-1;2;ASEMaterialInspector;100;1;New Amplify Shader;fe4af87006695164d84819765fe282b7;True;ShadowCaster;0;4;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.ColorNode;611;-517.2138,1839.521;Inherit;False;Property;_EmissiveColor;EmissiveColor;24;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;615;-523.7452,2153.081;Inherit;False;Property;_UnsaturationColor;UnsaturationColor;28;1;[HDR];Create;True;0;0;0;False;0;False;0.2117647,0.7137255,0.07058824,0;0.2117647,0.7137255,0.07058824,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1717;119.2916,657.576;Inherit;False;225;166;;1;1718;Cull;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1718;169.2916,707.576;Inherit;False;Property;_CullMode;Cull Mode;46;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1700;454.0132,2352.484;Float;False;False;-1;2;ASEMaterialInspector;100;13;New Amplify Shader;fe4af87006695164d84819765fe282b7;True;ForwardAdd;0;2;ForwardAdd;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;True;True;4;1;False;;1;False;;1;0;False;;1;False;;True;5;False;;5;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_CullMode;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;0;True;_StencilReference;255;True;_StencilReadMask;255;True;_StencilWriteMask;0;True;_StencilComparison;0;True;_StencilPassFront;0;True;_StencilFailFront;0;True;_StencilZFailFront;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;False;False;True;1;LightMode=ForwardAdd;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.SimpleAddOpNode;606;21.08198,1677.067;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;612;159.1932,1675.52;Inherit;False;Refined_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;602;-564.319,1389.368;Inherit;False;Property;_CharaColor;CharaColor;26;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;605;-539.4921,1578.86;Inherit;False;916;blend_diff;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1721;-545.2052,1663.846;Inherit;False;208;LightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;604;-315.0464,1559.61;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1722;-314.2054,1451.846;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1724;-334.2054,1683.846;Inherit;False;1719;GlobalLightFactor;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1723;-143.0053,1496.446;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1699;454.0132,2240.484;Float;False;True;-1;2;ASEMaterialInspector;100;13;LCSCshader/Eye;fe4af87006695164d84819765fe282b7;True;ForwardBase;0;1;ForwardBase;3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;False;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_CullMode;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;0;True;_StencilReference;255;True;_StencilReadMask;255;True;_StencilWriteMask;0;True;_StencilComparison;0;True;_StencilPassFront;0;True;_StencilFailFront;0;True;_StencilZFailFront;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=ForwardBase;True;2;False;0;;0;0;Standard;0;0;5;False;True;True;False;True;False;;False;0
Node;AmplifyShaderEditor.DynamicAppendNode;1170;-2615.26,184.8187;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1171;-2462.761,82.51868;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1172;-2290.864,110.78;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;1173;-2318.465,12.87837;Inherit;False;False;True;False;False;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1174;-2332.098,266.4965;Inherit;False;True;False;False;False;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1175;-2121.379,-47.84423;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1176;-2301.691,-77.29122;Inherit;False;1210;hi02Cos;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1177;-2154.458,91.4429;Inherit;False;True;False;False;False;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1178;-2147.498,184.5989;Inherit;False;False;True;False;False;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1179;-2116.298,291.1965;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1180;-1955.558,8.143583;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1181;-1948.498,245.6966;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1182;-2311.497,351.0973;Inherit;False;1210;hi02Cos;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1183;-1789.72,121.0598;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1184;-2764.107,79.97365;Inherit;False;Constant;_05_9;0.5_;16;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1185;-2602.839,13.23457;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1186;-1795.131,228.0967;Inherit;False;Constant;_05_10;0.5_;16;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1187;-1626.547,76.02078;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;1192;-1791.834,-30.35723;Inherit;False;Constant;_Offset4;Offset;31;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;1215;-2455.291,179.7096;Inherit;False;1209;hi02Sin;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;1207;-2801.078,-40.37522;Inherit;False;2;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexToFragmentNode;1950;-1490.375,126.3706;Inherit;False;False;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1216;-1411.711,15.27148;Inherit;False;hi02UV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;1706;-3966.708,1365.349;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1942;-4674.568,1347.116;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;826;-4379.409,1316.5;Inherit;False;Property;_MaxDirectLight;MaxDirectLight;30;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1944;-3644.654,1367.456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCGrayscale;1945;-3845.748,1431.222;Inherit;False;1;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1946;-3904.494,1510.273;Inherit;False;Property;_LightColorGrayScale;LightColor GrayScale;34;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;208;-3495.141,1365.047;Inherit;False;LightColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;825;-5169.267,1277.485;Inherit;False;Property;_MinDirectLight;MinDirectLight;29;1;[Header];Create;True;1;Light;0;0;False;0;False;0;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;773;-5027.083,1155.293;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.WorldPosInputsNode;1936;-5283.784,1409.343;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LightAttenuation;1937;-5108.101,1476.58;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1939;-5112.071,1391.87;Inherit;False;#ifdef POINT$        unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz@ \$        return tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r@$#endif$$#ifdef SPOT$#if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)$#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1))$#else$#define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord4 lightCoord = input._LightCoord$#endif$        DECLARE_LIGHT_COORD(input, worldPos)@ \$        return (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz)@$#endif$$#ifdef DIRECTIONAL$        return 1@$#endif$$#ifdef POINT_COOKIE$#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)$#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz$#   else$#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord3 lightCoord = input._LightCoord$#   endif$        DECLARE_LIGHT_COORD(input, worldPos)@ \$        return tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).r * texCUBE(_LightTexture0, lightCoord).w@$#endif$$#ifdef DIRECTIONAL_COOKIE$#   if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)$#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xy$#   else$#       define DECLARE_LIGHT_COORD(input, worldPos) unityShadowCoord2 lightCoord = input._LightCoord$#   endif$        DECLARE_LIGHT_COORD(input, worldPos)@ \$        return tex2D(_LightTexture0, lightCoord).w@$#endif;1;Create;1;True;worldPos;FLOAT3;0,0,0;In;;Inherit;False;Pure Light Attenuation;False;False;0;;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1720;-3751.967,744.3607;Inherit;False;Property;_GlobalLightFactor;GlobalLightFactor;38;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1719;-3478.703,744.2968;Inherit;False;GlobalLightFactor;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;1951;-5337.444,996.2292;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1952;-5153.501,998.1462;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1953;-5016.804,1029.2;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1954;-5173.391,1077.431;Float;False;Constant;_RemapValue3;Remap Value;0;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1962;-4969.545,954.1534;Inherit;False;return any(_WorldSpaceLightPos0.xyz)@;1;Create;0;Is There A Light;False;False;0;;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1961;-4820.727,975.8102;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1955;-4652.956,977.9238;Inherit;False;HalfShadowAttenuation;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;1929;-5322.598,675.2253;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;780;-5311.33,820.4559;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;779;-5088.403,727.2106;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;778;-5100.163,835.2687;Float;False;Constant;_RemapValue1;Remap Value;0;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;776;-4929.407,749.3162;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;797;-4897.558,666.2983;Inherit;False;return any(_WorldSpaceLightPos0.xyz)@;1;Create;0;Is There A Light;False;False;0;;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;800;-4720.234,723.8494;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;781;-4572.785,722.2114;Inherit;False;HalfLambertTerm;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;301;-4591.66,1755.664;Inherit;False;Property;_MaxIndirectLight;MaxIndirectLight;33;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;303;-4625.785,1666.506;Inherit;False;Property;_MinIndirectLight;MinIndirectLight;32;0;Create;True;0;0;0;False;0;False;0.1;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;876;-4793.788,1615.085;Inherit;False;return max(ShadeSH9(half4(0, 0, 0, 1)).rgb, ShadeSH9(half4(0, -1, 0, 1)).rgb)@;3;Create;0;MaxShadeSH9;False;False;0;;False;0;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;1973;-4822.873,1526.059;Inherit;False;return ShadeSH9(Normal)@;3;Create;1;True;Normal;FLOAT4;0,0,0,0;In;;Half;False;ShadeSH9out;False;False;0;;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;1971;-4841.854,1209.794;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;1974;-4321.801,1565.959;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode;1972;-4077.224,1216.305;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode;1975;-4199.603,1607.56;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;875;-4628.268,1559.084;Inherit;False;Property;_UnifyIndirectDiffuseLight;Unify IndirectDiffuseLight;31;0;Create;True;0;0;0;False;0;False;1;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1938;-4914.623,1424.622;Inherit;False;Property;_ShadowinLightColor;Shadow in LightColor;11;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1941;-4673.04,1158.339;Inherit;False;Property;_Keyword2;Keyword 0;6;0;Create;True;0;0;0;False;0;False;0;0;0;False;UNITY_PASS_FORWARDADD;Toggle;2;Key0;Key1;Fetch;False;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1940;-4393.598,1173.338;Inherit;False;Property;_NoShadowinDirectionalLightColor;NoShadow in DirectionalLightColor;12;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;345;-3551.569,-285.4109;Inherit;False;_eye;-1;True;1;0;SAMPLER2D;0,0,0,0;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.Vector2Node;1214;-2793.775,163.5717;Inherit;False;Property;_hiOffset;hi Offset;16;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;1208;-2690.833,-209.4355;Inherit;False;Property;_hiRotation;hi Rotation;17;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1671;-2701.529,-295.6419;Inherit;False;1667;hi02Auto;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;909;-3818.982,143.7574;Inherit;True;Property;_hi02;HighLight (_eye_high);14;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;None;cbc89d6e9af9d474094d8c98c93b4519;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;906;-3812.033,-283.977;Inherit;True;Property;_MainTex;Eye Diffuse (_eye_col);0;1;[Header];Create;False;1;Diffuse;0;0;False;0;False;None;784ceb657845ba045b7c7cede00feb22;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;1977;-3815.036,-82.3596;Inherit;True;Property;_SecondTex;Sclera Diffuse (_sclera);2;0;Create;False;1;Diffuse;0;0;False;0;False;None;784ceb657845ba045b7c7cede00feb22;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;1978;-3554.716,-81.28016;Inherit;False;ScleraDiffuse;-1;True;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;1314;-2392.406,668.7509;Inherit;False;Property;_ShadowStep;ShadowStep;8;0;Create;True;0;0;0;False;0;False;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1315;-2223.741,877.0819;Inherit;False;Property;_ShadowFeather;ShadowFeather;9;0;Create;True;0;0;0;False;0;False;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1317;-2664.795,750.1696;Inherit;False;781;HalfLambertTerm;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1316;-2064.407,677.5833;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1309;-1772.489,679.8014;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1310;-1907.189,680.1005;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1312;-1616.143,672.6372;Inherit;False;shad_lerp;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1322;-1648.821,778.9784;Inherit;False;Shadow;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1321;-1869.896,778.8905;Inherit;False;Property;_Shadow;Shadow;7;1;[HDR];Create;True;0;0;0;False;0;False;0.7,0.7,0.7,0;0.5188679,0.5188679,0.5188679,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1957;-2431.477,822.6748;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1959;-2687.049,838.7959;Inherit;False;1955;HalfShadowAttenuation;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1958;-2297.978,758.8748;Inherit;False;Property;_ReceiveShadowLerp;ReceiveShadowLerp;10;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;916;-900.8423,980.3038;Inherit;False;blend_diff;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1980;-3079.521,918.131;Inherit;False;1978;ScleraDiffuse;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SamplerNode;1979;-2867.621,918.1298;Inherit;True;Property;_TextureSample1;Texture Sample 0;28;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1991;-2820.101,1116.269;Inherit;False;Property;_ScleraTint;Sclera Tint;3;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;933;-3076.358,1292.165;Inherit;False;345;_eye;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SamplerNode;932;-2892.156,1296.148;Inherit;True;Property;_TextureSample0;Texture Sample 0;28;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1424;-2826.081,1494.252;Inherit;False;Property;_EyeTint;Eye Tint;1;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1651;-576.8176,-195.0779;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CosTime;1652;-924.7452,-87.4159;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ASinOpNode;1653;-777.7452,-15.416;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;1654;-521.7446,-18.416;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;1655;-846.9689,-254.8938;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ASinOpNode;1656;-709.3176,-186.6779;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1657;-295.0445,-180.7159;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1658;-655.2449,-18.31603;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1659;-401.3445,-37.01601;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1668;-626.2698,175.7325;Inherit;False;hi02ctrl;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1662;-764.5175,-101.778;Inherit;False;Property;_hiFrequency;hiFrequency;20;0;Create;True;0;0;0;False;0;False;25;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1663;-887.7242,68.64686;Inherit;False;Property;_hiNoiseFrequency;hiNoiseFrequency;21;0;Create;True;0;0;0;False;0;False;30;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1664;-585.9448,74.78407;Inherit;False;Property;_hiNoiseFactor;hiNoiseFactor;22;0;Create;True;0;0;0;False;0;False;0.3;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1666;-844.4682,175.6954;Inherit;False;Property;_hiAutoWaggle;hi AutoWaggle;18;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;1661;-433.8172,-193.7779;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1665;-378.4053,73.51691;Inherit;False;Property;_hiWaggleRange;hi WaggleRange;19;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1660;-158.005,-175.9819;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1667;1.559369,-173.4019;Inherit;False;hi02Auto;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1370;-1408.84,2036.988;Inherit;False;208;LightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1389;-1219.042,2019.519;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1713;-1047.221,1944.332;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1714;-1281.202,2129.208;Inherit;False;1709;HighlightLightFactor;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1382;-1444.892,1939.288;Inherit;False;Property;_HighLightShadow;HighLightShadow;6;0;Create;True;0;0;0;False;0;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1344;-2122.813,1936.432;Inherit;False;Property;_HighLightToggle;HighLight Toggle;13;0;Create;True;0;0;0;False;1;Header(HighLight);False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;1987;-1889.001,1913.081;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1988;-1679.889,1914.569;Inherit;False;Highlight Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1379;-1765.147,2141.892;Inherit;False;1312;shad_lerp;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1376;-2080.574,2080.466;Inherit;False;1322;Shadow;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1377;-1891.964,2030.165;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1378;-1590.845,2011.87;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1998;-2589.709,2124.277;Inherit;False;Property;_HighLightTint;HighLight Tint;15;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1253;-2817.094,1910.854;Inherit;False;910;_hi02;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;1254;-2817.176,1988.284;Inherit;False;1216;hi02UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1252;-2640.544,1910.301;Inherit;True;Property;_HighLight3;HighLight02;6;0;Create;True;0;0;0;False;0;False;-1;0e45854869fbfb241a580844ed684344;201ad45eeb9b1814983e4236fee69232;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1997;-2304.781,1954.68;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1984;-1062.533,978.3577;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1990;-2541.035,960.6637;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1325;-2101.085,1038.357;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1323;-2568.808,1142.653;Inherit;False;1322;Shadow;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1324;-2406.197,1081.354;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1318;-2274.249,1148.081;Inherit;False;1312;shad_lerp;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1359;-1926.653,1069.47;Inherit;False;208;LightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1390;-1736.623,1047.922;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1712;-1568.203,971.9827;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;2001;-2093.177,1472.05;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2003;-2398.29,1515.047;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2004;-2266.342,1581.774;Inherit;False;1312;shad_lerp;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2005;-1918.745,1503.163;Inherit;False;208;LightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2006;-1728.715,1481.615;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;2009;-1938.316,1393.411;Inherit;False;Property;_EyeShadow1;EyeShadow;4;0;Create;True;0;0;0;False;0;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1345;-1946.224,959.7178;Inherit;False;Property;_ScleraShadow;ScleraShadow;5;0;Create;True;0;0;0;False;0;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1992;-2565.049,1394.041;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1710;-3770.986,999.1858;Inherit;False;Property;_HighlightLightFactor;HighlightLightFactor;37;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1709;-3498.72,998.1216;Inherit;False;HighlightLightFactor;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1707;-3749.176,833.4706;Inherit;False;Property;_EyeLightFactor;EyeLightFactor;35;0;Create;True;0;0;0;False;0;False;0.5;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2010;-3760.609,917.3942;Inherit;False;Property;_ScleraLightFactor;ScleraLightFactor;36;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1708;-3476.912,832.4066;Inherit;False;EyeLightFactor;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2011;-3478.641,914.3907;Inherit;False;ScleraLightFactor;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2002;-2583.901,1574.346;Inherit;False;1322;Shadow;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1986;-1019.271,1161.744;Inherit;False;1988;Highlight Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2012;-2555.353,1299.578;Inherit;False;EyeAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2013;-1608.868,1264.537;Inherit;False;2012;EyeAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1982;-1318.123,982.9439;Inherit;False;3;0;COLOR;1,1,1,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;2008;-1552.275,1401.665;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2007;-1771.722,1152.719;Inherit;False;2011;ScleraLightFactor;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1711;-1768.551,1590.056;Inherit;False;1708;EyeLightFactor;1;0;OBJECT;;False;1;FLOAT;0
WireConnection;600;0;68;0
WireConnection;910;0;909;0
WireConnection;614;0;615;0
WireConnection;614;1;613;0
WireConnection;616;0;614;0
WireConnection;616;1;613;0
WireConnection;616;2;617;0
WireConnection;618;0;616;0
WireConnection;1196;0;1195;0
WireConnection;1197;0;1195;0
WireConnection;1209;0;1197;0
WireConnection;1210;0;1196;0
WireConnection;1194;0;1669;0
WireConnection;1194;1;1193;0
WireConnection;1195;0;1194;0
WireConnection;1669;0;1672;0
WireConnection;1669;2;1670;0
WireConnection;1669;3;1208;0
WireConnection;1670;0;1671;0
WireConnection;1670;1;1208;0
WireConnection;610;0;609;0
WireConnection;610;1;611;0
WireConnection;610;2;1697;0
WireConnection;606;0;1723;0
WireConnection;606;1;610;0
WireConnection;612;0;606;0
WireConnection;604;0;602;0
WireConnection;604;1;605;0
WireConnection;604;2;1721;0
WireConnection;1722;0;602;0
WireConnection;1722;1;605;0
WireConnection;1723;0;1722;0
WireConnection;1723;1;604;0
WireConnection;1723;2;1724;0
WireConnection;1699;0;618;0
WireConnection;1170;0;1214;1
WireConnection;1170;1;1214;2
WireConnection;1171;0;1185;0
WireConnection;1171;1;1170;0
WireConnection;1172;0;1171;0
WireConnection;1172;1;1215;0
WireConnection;1173;0;1171;0
WireConnection;1174;0;1171;0
WireConnection;1175;0;1176;0
WireConnection;1175;1;1173;0
WireConnection;1177;0;1172;0
WireConnection;1178;0;1172;0
WireConnection;1179;0;1174;0
WireConnection;1179;1;1182;0
WireConnection;1180;0;1175;0
WireConnection;1180;1;1177;0
WireConnection;1181;0;1178;0
WireConnection;1181;1;1179;0
WireConnection;1183;0;1181;0
WireConnection;1183;1;1180;0
WireConnection;1185;0;1207;0
WireConnection;1185;1;1184;0
WireConnection;1187;0;1192;0
WireConnection;1187;1;1183;0
WireConnection;1187;2;1186;0
WireConnection;1950;0;1187;0
WireConnection;1216;0;1950;0
WireConnection;1706;0;1972;0
WireConnection;1706;1;1975;0
WireConnection;1942;0;1971;0
WireConnection;1942;1;1938;0
WireConnection;1944;0;1706;0
WireConnection;1944;1;1945;0
WireConnection;1944;2;1946;0
WireConnection;1945;0;1706;0
WireConnection;208;0;1944;0
WireConnection;1939;0;1936;0
WireConnection;1719;0;1720;0
WireConnection;1952;0;1951;0
WireConnection;1953;0;1952;0
WireConnection;1953;1;1954;0
WireConnection;1953;2;1954;0
WireConnection;1961;0;1962;0
WireConnection;1961;2;1953;0
WireConnection;1955;0;1961;0
WireConnection;779;0;1929;0
WireConnection;779;1;780;0
WireConnection;776;0;779;0
WireConnection;776;1;778;0
WireConnection;776;2;778;0
WireConnection;800;0;797;0
WireConnection;800;2;776;0
WireConnection;781;0;800;0
WireConnection;1971;0;773;1
WireConnection;1971;1;825;0
WireConnection;1974;0;875;0
WireConnection;1974;1;303;0
WireConnection;1972;0;1940;0
WireConnection;1972;1;826;0
WireConnection;1975;0;1974;0
WireConnection;1975;1;301;0
WireConnection;875;0;1973;0
WireConnection;875;1;876;0
WireConnection;1938;0;1939;0
WireConnection;1938;1;1937;0
WireConnection;1941;1;1971;0
WireConnection;1941;0;1942;0
WireConnection;1940;0;1942;0
WireConnection;1940;1;1941;0
WireConnection;345;0;906;0
WireConnection;1978;0;1977;0
WireConnection;1316;0;1314;0
WireConnection;1316;1;1958;0
WireConnection;1309;0;1310;0
WireConnection;1310;0;1316;0
WireConnection;1310;1;1315;0
WireConnection;1312;0;1309;0
WireConnection;1322;0;1321;0
WireConnection;1957;0;1317;0
WireConnection;1957;1;1959;0
WireConnection;1958;0;1317;0
WireConnection;1958;1;1957;0
WireConnection;916;0;1984;0
WireConnection;1979;0;1980;0
WireConnection;932;0;933;0
WireConnection;1651;0;1656;0
WireConnection;1651;1;1662;0
WireConnection;1653;0;1652;4
WireConnection;1654;0;1658;0
WireConnection;1656;0;1655;4
WireConnection;1657;0;1661;0
WireConnection;1657;1;1659;0
WireConnection;1658;0;1653;0
WireConnection;1658;1;1663;0
WireConnection;1659;0;1654;0
WireConnection;1659;1;1664;0
WireConnection;1668;0;1666;0
WireConnection;1661;0;1651;0
WireConnection;1660;0;1657;0
WireConnection;1660;1;1665;0
WireConnection;1667;0;1660;0
WireConnection;1389;0;1382;0
WireConnection;1389;1;1370;0
WireConnection;1713;0;1382;0
WireConnection;1713;1;1389;0
WireConnection;1713;2;1714;0
WireConnection;1382;0;1344;0
WireConnection;1382;1;1378;0
WireConnection;1344;1;1997;0
WireConnection;1987;0;1344;0
WireConnection;1988;0;1987;0
WireConnection;1377;0;1344;0
WireConnection;1377;1;1376;0
WireConnection;1378;0;1344;0
WireConnection;1378;1;1377;0
WireConnection;1378;2;1379;0
WireConnection;1252;0;1253;0
WireConnection;1252;1;1254;0
WireConnection;1997;0;1252;0
WireConnection;1997;1;1998;0
WireConnection;1984;0;1982;0
WireConnection;1984;1;1713;0
WireConnection;1984;2;1986;0
WireConnection;1990;0;1979;0
WireConnection;1990;1;1991;0
WireConnection;1325;0;1990;0
WireConnection;1325;1;1324;0
WireConnection;1325;2;1318;0
WireConnection;1324;0;1990;0
WireConnection;1324;1;1323;0
WireConnection;1390;0;1345;0
WireConnection;1390;1;1359;0
WireConnection;1712;0;1345;0
WireConnection;1712;1;1390;0
WireConnection;1712;2;2007;0
WireConnection;2001;0;1992;0
WireConnection;2001;1;2003;0
WireConnection;2001;2;2004;0
WireConnection;2003;0;1992;0
WireConnection;2003;1;2002;0
WireConnection;2006;0;2009;0
WireConnection;2006;1;2005;0
WireConnection;2009;0;1992;0
WireConnection;2009;1;2001;0
WireConnection;1345;0;1990;0
WireConnection;1345;1;1325;0
WireConnection;1992;0;932;0
WireConnection;1992;1;1424;0
WireConnection;1709;0;1710;0
WireConnection;1708;0;1707;0
WireConnection;2011;0;2010;0
WireConnection;2012;0;932;4
WireConnection;1982;0;1712;0
WireConnection;1982;1;2008;0
WireConnection;1982;2;2013;0
WireConnection;2008;0;2009;0
WireConnection;2008;1;2006;0
WireConnection;2008;2;1711;0
ASEEND*/
//CHKSM=C5EE89450BEE03407CFDC0A32FCA8A891B8D4E99