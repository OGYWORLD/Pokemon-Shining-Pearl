Shader "Delphis/Map/FlowmapBumpWater" {
	Properties {
		_FlowMap ("Flow Map", 2D) = "gray" {}
		_FlowStrength ("Flow Strength", Float) = 0.05
		_TimeOffsetMap ("Time Offset", 2D) = "black" {}
		_FlowVelocityX ("Flow Velocity X", Float) = 0
		_FlowVelocityY ("Flow Velocity Y", Float) = 0
		_UJump ("U Jump Per Phase", Range(-0.25, 0.25)) = 0.125
		_VJump ("V Jump Per Phase", Range(-0.25, 0.25)) = -0.125
		_TimeScale ("TimeScale", Float) = 1
		_DerivHeightMap ("Deriv (AG) Height (B)", 2D) = "black" {}
		_HeightScale ("Height Scale", Float) = 1
		_WaterColor ("Water Color", Vector) = (0.5,1,1,0.25)
		_Reflectivity ("Reflectivity", Range(0, 1)) = 0.03
		_FresnelPower ("Fresnel Power", Range(0.1, 8)) = 1.5
		_DensityExponential ("Density Exponential", Float) = 0.5
		_TransDistance ("Transmission Distance", Float) = 1
		_MaxDensity ("Max Density", Range(0, 1)) = 1
		[NoScaleOffset] _EnvironmentMap ("Environment Map", Cube) = "white" {}
		_EnvironmentExponential ("Environment Exponential", Float) = 1
		_EnvironmentExposure ("Environment Exposure", Float) = 1
		_SpecularColor ("Specular Color", Vector) = (1,1,1,1)
		_SpecularCosinePower ("Specular Cosine Power", Range(1, 32768)) = 16
		_SpecularIntensity ("Specular Intensity", Range(0, 1024)) = 1
		_SpecularAnisotropicLevel ("Specular Anisotropic", Range(0, 16)) = 1
		_WaterLightVector ("Light Vector", Vector) = (1,1,1,0)
		_CameraPositionOffset ("Camera Position Offset", Vector) = (0,0,0,0)
		_FakeTargetPosition ("Fake Target Position", Vector) = (0,0,0,0)
		_BlendScale ("Blend Scale", Range(0, 1)) = 1
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