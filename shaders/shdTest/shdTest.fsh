//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

uniform sampler2D matcap_tex;

void main()
{
	vec4 tex2 = texture2D(gm_BaseTexture,v_vNormal.rg);
    gl_FragColor = tex2;
}
