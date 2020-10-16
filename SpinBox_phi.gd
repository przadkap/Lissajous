extends SpinBox

func _ready():
#	text = String(get_node("../../../../../../Curve Image/Path2D").a)
	value = get_node("../../../../../../Curve Image/Path2D").phi / PI


func _on_Slider_value_changed(new_value):
	value = new_value
