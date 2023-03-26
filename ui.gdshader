shader_type canvas_item;

uniform float opacity: hint_range(0, 1) = 1.0f;

void fragment() {
	vec4 color = vec4(COLOR.rgb, opacity);

	COLOR = color;
}
