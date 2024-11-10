extends Node2D

const ROTATION_SPEED = 0.001

const MAX_VISIBILITY = 100
const MIN_VISIBILITY = 0

enum { ROTATING, CALCULATING}


var state = CALCULATING
var direction = 1
var speed = 0
var time = 0
var difficulty = 0

var visibility = 100
var gaining = false
var start = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check State and set values
	if start:
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
			
		if gaining:
			if	visibility < MAX_VISIBILITY:
				visibility += 60 * delta
				
		elif !gaining:
			if visibility > MIN_VISIBILITY:
				visibility -= 60 * delta
			
		modulate.a = visibility/100
	
	# Move target
	# target.position.x = get_global_mouse_position().distance_to(position)
