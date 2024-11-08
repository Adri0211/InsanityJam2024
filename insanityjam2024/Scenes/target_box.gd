extends Area2D

@onready var arrow: Sprite2D = $".."

func _on_mouse_entered() -> void:
	arrow.gaining = true


func _on_mouse_exited() -> void:
	arrow.gaining = false
