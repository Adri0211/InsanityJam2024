extends Node2D

func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu_screen.tscn")
