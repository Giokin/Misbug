extends Control

@onready var debug_menu = $MainVBOX/DebugMenu
var currentBody = Node2D

func _on_debug_toggled(toggled_on):
	print(toggled_on)
	if toggled_on:
		debug_menu.show()
	else:
		debug_menu.hide()

func _on_mouse_body_entered(body):
	currentBody = body

func _on_Collider_toggled(toggled_on):
	if(toggled_on):
		currentBody.set_collision_mask_value(1, true)
	else:
		currentBody.set_collision_mask_value(1, false)

func _on_h_slider_value_changed(value):
	if(currentBody == Node2D):
		return
	else:
		currentBody.scale = Vector2(value,value)


func _on_Gravity_value_changed(value):
	if(currentBody == Node2D):
		return
	else:
		print(currentBody.gravityMultiplier)
		currentBody.gravityMultiplier = value
