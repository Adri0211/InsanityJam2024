extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var explosion_effect: AudioStreamPlayer2D = $ExplosionEffect

func _on_mouse_entered() -> void:
	animated_sprite_2d.play("explode")
	explosion_effect.play()
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().root.get_node("Game").get_node("GameManager")._player_died()
