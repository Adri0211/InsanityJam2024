extends Area2D


func _on_mouse_entered() -> void:
	get_tree().root.get_node("Game").get_node("GameManager")._player_died()
	print("dead")
 	
