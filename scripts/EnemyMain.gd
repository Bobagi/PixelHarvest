extends CharacterBody2D


@export var SPEED = 100.0
@export var jump_force = -800
@export var gravity = 30

@export var headTexture: Texture2D
@export var hornsTexture: Texture2D
@export var eyesTexture: Texture2D
@export var mouthTexture: Texture2D
@export var hairTexture: Texture2D

@export var hairColor: Color = Color.WHITE
@export var hornsColor: Color = Color.WHITE
@export var headColor: Color = Color.WHITE
@export var eyesColor: Color = Color.WHITE
@export var bodyColor: Color = Color.WHITE

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#var headSprite = $head.texture
#@export var leftHandSprite = $leftHand.Texture

func _ready():
	if headTexture:
		($Flipper/head as Sprite2D).texture = headTexture
		($Flipper/head as CanvasItem).self_modulate = headColor
	if hornsTexture:
		($Flipper/head/horns as Sprite2D).texture = hornsTexture
		($Flipper/head/horns as CanvasItem).self_modulate = hornsColor
	if eyesTexture:
		($Flipper/head/eyes as Sprite2D).texture = eyesTexture
		($Flipper/head/eyes as CanvasItem).self_modulate = eyesColor
	if mouthTexture:
		($Flipper/head/mouth as Sprite2D).texture = mouthTexture
	if hairTexture:
		($Flipper/head/hair as Sprite2D).texture = hairTexture
		($Flipper/head/hair as CanvasItem).self_modulate = hairColor

	($Flipper/body/torso as CanvasItem).self_modulate = bodyColor
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
