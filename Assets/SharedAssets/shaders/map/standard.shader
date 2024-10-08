Shader "Delphis/Map/Standard" {
	Properties {
		[KeywordEnum(Single,SingleSpec,Multi,BlendUV0,BlendUV1,Emission,Mask)] _Cascade ("Cascade Mode", Float) = 0
		[KeywordEnum(Specular,EnvironmentMap,ReflectionMap,MirrorMap)] _EnvironmentMapEnable ("Reflection Mode", Float) = 0
		[HideInInspector] _AlphaClip ("__clip", Float) = 0
		[HideInInspector] _DepthDensity ("__dalpha", Float) = 0
		[HideInInspector] _ProjRGBOnly ("__projRGB", Float) = 0
		[HideInInspector] _FlipZWrite ("__fzw", Float) = 0
		_DensityExponential ("Density Exponential", Range(0.1, 4)) = 0.5
		_DepthRange ("Depth Range", Range(0.1, 10)) = 1
		_Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
		_MainTex ("Base Map (RGB)", 2D) = "white" {}
		_Color ("Color", Vector) = (1,1,1,1)
		_ColorIntensity ("Color Intensity", Range(0, 16)) = 1
		[NoScaleOffset] _BumpTex ("Bump (XY)", 2D) = "bump" {}
		_BumpScale ("Bump Scale", Range(0, 8)) = 1
		[NoScaleOffset] _ComplexTex ("Complex (Gloss, AO)", 2D) = "white" {}
		_SpecularColor ("Specular Color", Vector) = (1,1,1,1)
		_SpecularIntensity ("Specular Intensity", Range(0, 64)) = 1
		_SpecularCosinePower ("Specular Cosine Power", Range(1, 256)) = 16
		_FresnelPower ("Fresnel Power", Range(0, 8)) = 4
		_Reflectivity ("Reflectivity", Vector) = (0.2,0.2,0.2,1)
		_LayerTex ("Secondary Map (RGB)", 2D) = "white" {}
		_LayerColor ("Secondary Color", Vector) = (1,1,1,1)
		_LayerColorIntensity ("Secondary Color Intensity", Range(0, 16)) = 1
		_ZOffset ("Z Offset", Range(-0.1, 0.1)) = 0
		[NoScaleOffset] _LayerBumpTex ("Secondary Bump (XYZ,Specular)", 2D) = "bump" {}
		_LayerBumpScale ("Secondary Bump Scale", Range(0, 8)) = 1
		[NoScaleOffset] _LayerComplexTex ("Complex (Gloss, AO)", 2D) = "white" {}
		_LayerSpecularColor ("Secondary Specular Color", Vector) = (1,1,1,1)
		_LayerSpecularIntensity ("Secondary Specular Intensity", Range(0, 16)) = 1
		_LayerSpecularCosinePower ("Secondary Specular Cosine Power", Range(1, 256)) = 16
		_LayerFresnelPower ("Secondary Fresnel Power", Range(0, 8)) = 4
		_LayerReflectivity ("Secondary Reflectivity", Vector) = (0.2,0.2,0.2,1)
		_BlendTex ("Blend Map (Weight, Shadow)", 2D) = "white" {}
		_BlendShadowScale ("Blend Shadow Scale", Range(0, 1)) = 0.5
		_EmissionTex ("Emission Map (RGB)", 2D) = "white" {}
		_EmissionColor ("Color", Vector) = (0,0,0,0)
		_EmissionColorIntensity ("Color Intensity", Range(0, 16)) = 0
		_EmissionOnTime ("Emission On Time", Float) = 0.6
		_EmissionOffTime ("Emission Off Time", Float) = 0.2
		_ReflectionBias ("Reflection Bias", Range(0, 5)) = 0
		_ReflectionOffsetScale ("Reflection Offset Scale", Range(0, 100)) = 1
		_AmbientOcclusionScale ("AO Scale", Range(0, 1)) = 1
		_SwingUV ("Swing UV", Float) = 0
		_SwingScale ("Swing Scale", Vector) = (0.05,0,0,0)
		_SwingPower ("Swing Power", Range(1, 20)) = 2
		_SwingSpeed ("Swing Speed", Range(0, 20)) = 1
		_SwingDistribution ("Swing Distribution", Range(0, 20)) = 1
		_UVSwap ("UV Swap", Float) = 0
		_InverseFresnelAlpha ("Inverse Fresnel Alpha", Float) = 0
		_TexVelocity ("Texture UV Velocity", Vector) = (0,0,0,0)
		_TexVelocity2 ("Texture UV Velocity", Vector) = (0,0,0,0)
		_MainTex_ProjS ("MainTex Projection Enable", Float) = 0
		_LayerTex_ProjS ("LayerTex Projection Enable", Float) = 0
		_BlendTex_ProjS ("BlendTex Projection Enable", Float) = 0
		_FixedLightingDirection ("Fixed Lighting Direction", Float) = 0
		_SnowAccumulation ("Show Accumulation", Range(0, 1)) = 1
		_SnowModulateBumpScale ("Snow ModulateBumpScale", Range(0, 1)) = 1
		_WindDirection ("Wind Direction", Vector) = (1,0,0,0)
		_BlendUVIndex ("BlendUVIndex", Float) = 0
		_ReceiveCloudShadow ("ReceiveCloudShadow", Float) = 1
		[Toggle(_SWING_ON)] _SwingEnable ("__swing", Float) = 0
		[HideInInspector] _MirrorMap ("_MirrorMap", 2D) = "black" {}
		[HideInInspector] _Mode ("__mode", Float) = 0
		[HideInInspector] _SrcBlend ("__src", Float) = 1
		[HideInInspector] _DstBlend ("__dst", Float) = 0
		[HideInInspector] _ZWrite ("__zw", Float) = 1
		[HideInInspector] _Cull ("__cull", Float) = 2
		[HideInInspector] _StencilComp ("_scmp", Float) = 8
		[HideInInspector] _StencilOp ("_sop", Float) = 0
		[HideInInspector] _StencilRef ("_sref", Float) = 0
		[HideInInspector] _ColorMask ("__mask", Float) = 15
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;
		fixed4 _Color;
		struct Input
		{
			float2 uv_MainTex;
		};
		
		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	//CustomEditor "DelphisMapStandardShaderGUI"
}