shader_type canvas_item;
uniform sampler2D screen_tex: hint_screen_texture, repeat_disable, filter_linear_mipmap;

void fragment() {
	COLOR = texture(screen_tex, SCREEN_UV);
	COLOR.rgb = vec3(COLOR.r*0.299+ COLOR.g*0.587+ COLOR.b*0.114);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
