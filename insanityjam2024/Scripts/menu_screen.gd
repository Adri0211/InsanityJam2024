extends Node2D

@onready var master_slider: HSlider = $VBoxContainer/master_slider
@onready var music_slider: HSlider = $VBoxContainer/Music_Slider
@onready var sfx_slider: HSlider = $VBoxContainer/SFX_slider

func _ready() -> void:
	master_slider.value = Global.sound_sliders.get("Master")
	music_slider.value = Global.sound_sliders.get("Music")
	sfx_slider.value = Global.sound_sliders.get("SFX")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
