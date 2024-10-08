Shader "Delphis/Map/PhotoFrame" {
	Properties {
		[NoScaleOffset] _MainTex ("Main Tex", 2D) = "white" {}
		_PatternH ("Horizontal Pattern", Float) = 1
		_PatternV ("Vertical Pattern", Float) = 1
		_StartFrameIndex ("Start Frame Index", Float) = 0
		_SwitchingTime ("Switching Time", Float) = 15
		[MaterialToggle] _AutoSwitch ("AutoSwitch", Float) = 1
		_BlinkCycle ("Blink Cycle", Float) = 1.5
		_BlinkWidth ("Blink Width", Range(0.1, 1)) = 0.1
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
}