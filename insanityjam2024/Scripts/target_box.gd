extends Area2D

@onready var arrow: Node2D = $".."

signal game_started

func _on_mouse_entered() -> void:
	if !arrow.start: 
		arrow.start = true 
		game_started.emit()
		
	arrow.gaining = true

func _on_mouse_exited() -> void:
	arrow.gaining = false
