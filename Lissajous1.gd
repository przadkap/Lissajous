extends Path2D

var a = 20
var b = 19

var A = 200
var B = 200

#var a_value

var phi = PI * 0.50 # radians

var pointNo = 1000

var pointDelta = 2 * PI / pointNo

var deltaList = []

#var relativeX = get_parent().get_rect().size.x/2
#var relativeY = get_parent().get_rect().size.y/2

var param_values = {"a": a, "b": b, "A": A, "B": B, "phi": phi}

func renderCurve():
	var relativeX = get_parent().get_rect().size.x/2
	var relativeY = get_parent().get_rect().size.y/2
	curve.clear_points()
	var currentX
	var currentY
	for currentDelta in deltaList:
		
		currentX = (param_values["A"] * sin(param_values["a"] * currentDelta + param_values["phi"])) + relativeX
		currentY = (param_values["B"] * sin(param_values["b"] * currentDelta)) + relativeY
		curve.add_point(Vector2(currentX, currentY))
#		print(currentDelta, currentX, currentY)
#		print(currentDelta)
#		print(currentX)
#		print(currentY)
	

func _ready():
	for i in range(0, pointNo):
		deltaList.append(i * pointDelta)
	renderCurve()
#	_draw()

func _draw():
	var pointList = curve.get_baked_points()
	pointList.append(curve.get_baked_points()[0])
	draw_polyline(pointList, Color(255, 0, 0), 2.0)
	print("drawing")
#	draw_circle(pointList[0], 10, Color(0, 255, 0))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
