extends CharacterBody2D

# Player settings
var speed = 200
var jump_force = 400
var gravity = 30

# Called every frame
func _process(delta):
	if !is_on_floor():
		velocity.y += gravity
		
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$Sprite2D.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$Sprite2D.flip_h = false
	else:
		velocity.x = 0
		
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y -= jump_force
		
	move_and_slide()
