Shader "Delphis/Character/Standard" {
	Properties {
		[KeywordEnum(Phone,Anisotropic,Hair)] _Lighting ("Lighting", Float) = 0
		[HideInInspector] _AlphaClip ("__clip", Float) = 0
		[HideInInspector] _FlipZWrite ("__fzw", Float) = 0
		_Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
		_MainTex ("Base Map (RGB)", 2D) = "white" {}
		_Color ("Color", Vector) = (1,1,1,1)
		_ColorIntensity ("Color Intensity", Range(0, 16)) = 1
		[NoScaleOffset] _BumpTex ("Bump (XY)", 2D) = "bump" {}
		_BumpScale ("Bump Scale", Range(0, 8)) = 1
		[NoScaleOffset] _ComplexTex ("Complex Map (R:Emission, G:Specular, B:AO)", 2D) = "white" {}
		_SpecularColor ("Specular Color", Vector) = (1,1,1,1)
		_SpecularCosinePower ("Specular Cosine Power", Range(0.1, 256)) = 16
		_SpecularIntensity ("Specular Intensity", Range(0, 16)) = 1
		_AnisLevelH ("Anisotropic Lighting Horizontal Level", Range(0, 16)) = 1
		_AnisLevelV ("Anisotropic Lighting Vertical Level", Range(0, 16)) = 1
		_FresnelPower ("Fresnel Power", Range(0.1, 8)) = 4
		_Reflectivity ("Reflectivity", Range(0, 1)) = 0.2
		_RimColor ("Rim Color", Vector) = (1,1,1,1)
		[PowerSlider(3.0)] _RimPower ("Rim Power", Range(0.1, 32)) = 8
		_RimColorShadow ("RimColorShadow", Vector) = (0,0,0,1)
		[PowerSlider(3.0)] _RimScale ("Rim Scale", Range(0, 8)) = 1
		[PowerSlider(3.0)] _RimStrength ("RimStrength", Range(0, 32)) = 8
		_EmissionColor ("Emission Color", Vector) = (0,0,0,0)
		_EmissionColorIntensity ("Emission Color Intensity", Range(0, 16)) = 0
		_EmissionOnTime ("Emission On Time", Float) = 0.2
		_EmissionOffTime ("Emission Off Time", Float) = 0.2
		[PowerSlider(3.0)] _JitterPosition ("Jitter Position", Range(0, 4)) = 0.3
		[PowerSlider(3.0)] _JitterScale ("Jitter Scale", Range(0, 4)) = 2
		[PowerSlider(3.0)] _JitterTilingU ("Jitter Tiling U", Range(0, 10)) = 5
		[PowerSlider(3.0)] _JitterTilingV ("Jitter Tiling U", Range(0, 10)) = 0.25
		_FresnelFalloff ("Fresnel Falloff", Range(0, 8)) = 2
		[NoScaleOffset] _MaskTex ("Mask (R:Skin, G:Primiary, B:Secondary)", 2D) = "black" {}
		_SkinColor ("Skin Color", Vector) = (1,0.5,0.5,1)
		_PrimaryColor ("Primary Color", Vector) = (0.5,1,0.5,1)
		_SecondaryColor ("Secondary Color", Vector) = (0.5,0.5,1,1)
		_MaskShadowExponential ("Mask Shadow Exponential", Range(0, 16)) = 4
		_MaskShadowBlendWeight ("Mask Shadow Blend Weight", Range(0, 1)) = 0.5
		_ReflectionBias ("Reflection Bias", Range(0, 5)) = 0
		[Toggle(_ENVMAP_ON)] _EnvironmentMapEnable ("__envmap", Float) = 0
		[Toggle(_USE_VERTEX_TANGENT)] _UseVertexTangent ("Use Vertex Tangent", Float) = 0
		[HideInInspector] _Mode ("__mode", Float) = 0
		[HideInInspector] _SrcBlend ("__src", Float) = 1
		[HideInInspector] _DstBlend ("__dst", Float) = 0
		[HideInInspector] _ZWrite ("__zw", Float) = 1
		[HideInInspector] _StencilRef ("Stencil Reference", Float) = 1
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
	//CustomEditor "DelphisCharacterStandardShaderGUI"
}