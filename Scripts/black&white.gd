extends ColorRect

# Called when the node enters the scene tree for the first time.
@export var shadow_color: Color
func _ready() -> void:
	material.set_shader_parameter("tint", color)
	material.set_shader_parameter("shadow_tint", shadow_color)
