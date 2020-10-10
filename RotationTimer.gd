extends Timer

func _ready():
	pass


func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		start(0.01)
	else:
		stop()
