extends HSlider

@export
var bus_name: String

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	
func _on_value_changed(value: float) -> void:
	var dict : Dictionary = {bus_name: value}
	Global.sound_sliders.merge(dict, true)
	print(str(Global.sound_sliders.get(bus_name)))
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
