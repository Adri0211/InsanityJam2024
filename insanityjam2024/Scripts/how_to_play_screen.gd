extends Node2D

func _on_go_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_screen.tscn")
