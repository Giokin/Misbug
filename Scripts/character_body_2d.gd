extends CharacterBody2D


@export var SPEED = 200.0
@export var JUMP_VELOCITY = -400.0
@export var gravityMultiplier = 1

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D

func _physics_process(delta):
	
	if(velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += (get_gravity()/gravityMultiplier) * delta
		sprite_2d.animation = "jumping"
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_ceiling():
		velocity.y = JUMP_VELOCITY * -1
		sprite_2d.flip_v = true
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite_2d.flip_v = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	move_and_slide()
	
	if velocity.x == 0:
		return
	elif velocity.x < 0:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false
