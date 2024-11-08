extends Node

@onready var arrow: Sprite2D = %Arrow
@onready var timer: Timer = $Timer
@onready var game_manager: Node = %GameManager
@onready var coord_holders = arrow.get_node("ObstacleSpawner").get_node("Coord_holders")
@onready var obstacles: Node2D = $"../Obstacles"

var rng = RandomNumberGenerator.new()

var time_between_spawns = 5

func _ready() -> void:
	timer.set_wait_time(time_between_spawns)
	timer.one_shot = true

func _on_target_box_game_started() -> void:
	timer.start()


func _process(delta: float) -> void:
	
	if arrow.visibility < 1: 
		_player_died()
		
	if timer.get_time_left() < 1.0 and !timer.is_stopped():
		print("timer stopped")
		var which = rng.randi_range(1, 10)
		var holder = coord_holders.get_node("Spawner"+str(which))
		_spawn_obstacle(holder.global_position)
		timer.start()

func _spawn_obstacle(position: Vector2) -> void:
	var scene = load("res://Scenes/obstacle.tscn")
	var obs = scene.instantiate()	
	obs.translate(position)
	
	obstacles.add_child(obs)
	
func _player_died():
	get_tree().reload_current_scene()
