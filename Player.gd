extends Area2D

export var speed = 400.0
var screen_size=Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _process(delta):
	screen_size = get_viewport_rect().size
	
	
#movement left and right
	var direction = Vector2.ZERO
	if Input.is_action_pressed("right"):
		direction.x += 1	
	if Input.is_action_pressed("left"):
		direction.x -= 1
		
#movement up and down
	if Input.is_action_pressed("Down"):
		direction.y += 1	
	if Input.is_action_pressed("Up"):
		direction.y -= 1

	if direction.length() > 0:
		direction = direction.normalized()
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += direction * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if direction.x != 0:
		$AnimatedSprite.animation = "Right"
		$AnimatedSprite.flip_h = direction.x < 0
		$AnimatedSprite.flip_v = false
	elif direction.y !=0:
		$AnimatedSprite.animation = "up1"
		$AnimatedSprite.flip_v = direction.y > 0
