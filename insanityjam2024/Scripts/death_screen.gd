extends Node2D

@onready var score_label: Label = $ScoreLabel


func _ready() -> void:
	score_label.text = "Score: " + str(Global.score)

func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_screen.tscn")
