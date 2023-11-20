extends ParallaxLayer

var speed = Vector2(50, 0)  # Adjust the speed as needed

func _process(delta):
	motion_offset += speed * delta
