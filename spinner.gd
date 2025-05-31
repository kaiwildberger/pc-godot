extends Node2D

@export var spinner_value = 0

# angles still measured from 90deg left but can go more than 180
@export var start = -30
@export var end = 210

var spinning = false
var deltaRot = 0
var initialRot = 0
var initialMouseRot = 0

# this returning float is probably gonna Get me at some point
func map(value, leftMin, leftMax, rightMin, rightMax) -> float:
	var leftRange = leftMax - leftMin
	var rightRange = rightMax - rightMin
	var value_scaled = float(value - leftMin) / float (leftRange)
	return rightMin + (value_scaled * rightRange)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and not event.is_action_pressed("mousepress"):
		spinning = false
	if event is InputEventMouseButton and event.is_action_pressed("mousepress"):
		spinning = true

# todo: probably angle from value? is ez cos map backwards pretty much methinks

func _process(delta):
	if spinning:
		rotation = get_global_mouse_position().angle_to_point($"..".position)
		#rotation = get_viewport().get_mouse_position().angle_to_point(position)
		var super_parsed = rotation_degrees
		if rotation_degrees < -90:
			super_parsed = 180 + (180-abs(rotation_degrees))
		spinner_value = map(super_parsed, start, end, 0, 1)
		#if abs(0-value) < 0.01 or abs(1-value) < 0.01:
			#spinning = false
		if spinner_value > 1:
			rotation_degrees = end
			#spinning = false
		if spinner_value < 0:
			rotation_degrees = start
			#spinning = false
		spinner_value = max(0, spinner_value)
		spinner_value = min(1, spinner_value)
		
		#fm radio
		var text = map(spinner_value, 0, 1, 88.1, 107.5)
		if (text / 2.0)-(floor(text/2.0)) < 1:
			text -= 0.1 # odd numbers
		text = floor(text*10)/10
		
		$"../value label".text = "%s FM" % text
		#$"../raw label".text = "parsed %s" % (floor(super_parsed*1000)/1000)
