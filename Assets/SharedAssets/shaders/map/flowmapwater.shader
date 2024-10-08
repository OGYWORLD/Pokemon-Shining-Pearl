Shader "Delphis/Map/FlowmapWater" {
	Properties {
		_FlowMap ("Flow Map", 2D) = "gray" {}
		_FlowStrength ("Flow Strength", Float) = 0.05
		_TimeOffsetMap ("Time Offset", 2D) = "black" {}
		_UJump ("U Jump Per Phase", Range(-0.25, 0.25)) = 0.125
		_VJump ("V Jump Per Phase", Range(-0.25, 0.25)) = -0.125
		_TimeScale ("TimeScale", Float) = 1
		_CausticsTex ("Caustics Texture", 2D) = "black" {}
		_CausticsExponential ("Caustics Exponential", Float) = 1
		_CausticsIntensity ("Caustics Scale", Float) = 1
		_WaterColor ("Water Color", Vector) = (0.5,1,1,0.25)
		_Reflectivity ("Reflectivity", Range(0, 1)) = 0.03
		_FresnelPower ("Fresnel Power", Range(0.1, 8)) = 1.5
		_DensityExponential ("Density Exponential", Float) = 0.5
		_TransDistance ("Transmission Distance", Float) = 1
		_MaxDensity ("Max Density", Range(0, 1)) = 1
		_SpecularColor ("Specular Color", Vector) = (1,1,1,1)
		_SpecularCosinePower ("Specular Cosine Power", Range(1, 256)) = 16
		_SpecularIntensity ("Specular Intensity", Range(0, 64)) = 1
		_AdditionRatio ("Addition Ratio", Range(0, 1)) = 1
		_LightPitchScale ("Light Pitch Scale", Range(0, 1)) = 1
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			o.Albedo = 1;
		}
		ENDCG
	}
}