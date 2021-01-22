extends Path2D

var a = 20
var b = 19

var A = 200
var B = 200

signal phi_changed(new_phi_value)
signal a_changed(new_a_value)
signal b_changed(new_b_value)
signal A_changed(new_A_value)
signal B_changed(new_B_value)
#var a_value

var phi = PI * 0.50 # radians

var POINT_NO = 1000

var POINT_DELTA = 2 * PI / POINT_NO

var deltaList = []

#var relativeX = get_parent().get_rect().size.x/2
#var relativeY = get_parent().get_rect().size.y/2

var param_values = {"a": a, "b": b, "A": A, "B": B, "phi": phi}

func renderCurve():
	var relative_x = get_parent().get_rect().size.x/2
	var relative_y = get_parent().get_rect().size.y/2
	curve.clear_points()
	var current_x
	var current_y
	for currentDelta in deltaList:
		
		current_x = (param_values["A"] * sin(param_values["a"] * currentDelta + param_values["phi"])) + relative_x
		current_y = (param_values["B"] * sin(param_values["b"] * currentDelta)) + relative_y
		curve.add_point(Vector2(current_x, current_y))
#		print(currentDelta, currentX, currentY)
#		print(currentDelta)
#		print(currentX)
#		print(currentY)
	

func _ready():
	for i in range(0, POINT_NO):
		deltaList.append(i * POINT_DELTA)
	renderCurve()
	set_sliders(param_values)
#	_draw()

func set_sliders(_new_param_values):
	emit_signal("A_changed", param_values["A"])
	emit_signal("B_changed", param_values["B"])
	emit_signal("a_changed", param_values["a"])
	emit_signal("b_changed", param_values["b"])
	emit_signal("phi_changed", param_values["phi"] / PI)

func _draw():
	var pointList = curve.get_baked_points()
	pointList.append(curve.get_baked_points()[0])
	draw_polyline(pointList, Color(255, 0, 0), 2.0)

func _on_Slider1_value_changed(new_a_value):
	param_values["a"] = new_a_value
	renderCurve()
	update()



func _on_Slider2_value_changed(new_b_value):
	param_values["b"] = new_b_value
	renderCurve()
	update()


func _on_Slider3_value_changed(new_A_value):
	param_values["A"] = new_A_value
	renderCurve()
	update()

func _on_Slider4_value_changed(new_B_value):
	param_values["B"] = new_B_value
	renderCurve()
	update()
	
func _on_Path2D_draw():
	pass

func _on_Slider5_value_changed(new_phi_value):
	param_values["phi"] = new_phi_value * PI
	renderCurve()
	update()

func _on_RotationTimer_timeout():
	param_values["phi"] = param_values["phi"] + (0.001 * PI)
	if(param_values["phi"] > 2 * PI):
		param_values["phi"] = 0
	emit_signal("phi_changed", param_values["phi"] / PI)
	renderCurve()
	update()



#func _on_Path2D_A_changed(new_A_value):
#	pass # Replace with function body.
