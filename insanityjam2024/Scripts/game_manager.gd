extends Node

@onready var arrow: Node2D = %Arrow
@onready var timer: Timer = $Timer
@onready var game_manager: Node = %GameManager
@onready var coord_holders = arrow.get_node("ObstacleSpawner").get_node("Coord_holders")
@onready var obstacles: Node2D = $"../Obstacles"
@onready var points_label: Label = $"../CanvasLayer/GridContainer/Points_label"

var rng = RandomNumberGenerator.new()

var time_between_spawns = 5
var points = 0

func _ready() -> void:
	timer.set_wait_time(time_between_spawns)
	timer.one_shot = true

func _on_target_box_game_started() -> void:
	timer.start()

func _process(delta: float) -> void:
	# Check if player is still alive
	if arrow.visibility < 1: 
		_player_died()
	
	if timer.get_time_left() < 1.0 and !timer.is_stopped():
		print("timer stopped")
		var which = rng.randi_range(1, 10)
		var holder = coord_holders.get_node("Spawner"+str(which))
		_spawn_obstacle(holder.global_position)
		timer.start()
	
	# Add points
	if arrow.gaining:
		points += delta * arrow.position.distance_to(get_viewport().get_mouse_position()) / 100
		points_label.text = String.num(roundf(points*10)*10)

func _spawn_obstacle(position: Vector2) -> void:
	var scene = load("res://scenes/obstacle.tscn")
	var obs = scene.instantiate()	
	obs.translate(position)
	
	obstacles.add_child(obs)
	
func _player_died():
	# get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
	Global.score = roundf(points*10)*10
