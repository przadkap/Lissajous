extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Path2D_B_changed(new_B_value):
	value = new_B_value


func _on_SpinBox_value_changed(new_value):
	value = new_value
