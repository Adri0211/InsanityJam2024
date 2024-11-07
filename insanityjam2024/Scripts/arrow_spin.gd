extends Sprite2D

const ROTATION_SPEED = 0.001

enum { ROTATING, CALCULATING}

@onready var target: Sprite2D = $Target

var state = CALCULATING
var direction = 1
var speed = 0
var time = 0
var difficulty = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check State and set values
	if state == ROTATING:
		rotate(ROTATION_SPEED*direction*speed*difficulty)
		time -= delta
		if time < 0:
			state = CALCULATING
	elif state == CALCULATING:
		direction = roundi(randf())*2-1
		speed = randf()
		time = randf()*2+1 * speed
		state = ROTATING
		difficulty += 0.5
	
	# Move target
	target.position.x = get_global_mouse_position().distance_to(position)
