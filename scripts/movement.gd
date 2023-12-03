extends CharacterBody2D

# Player settings
@export var speed = 100
@export var jump_force = 500
@export var gravity = 30
@onready var animation := $Flipper/Anim as AnimationPlayer
# Called every frame
func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		
	movement()
	
	if Input.is_action_just_pressed("Attack"):
		attack()
	
func movement():
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$Flipper.scale.x = 1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$Flipper.scale.x = -1
	else:
		velocity.x = 0
		
	if velocity.x != 0:
		animation.play("walking")
	else:
		if $Flipper/Anim.is_playing() and $Flipper/Anim.current_animation != "idle":
			animation.play("RESET")
#			animation.play("idle")
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= jump_force
		
	move_and_slide()

func attack():
	$Flipper/AnimAttack.play("attack1")
