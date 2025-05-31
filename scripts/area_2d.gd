extends RigidBody2D

func map(value, leftMin, leftMax, rightMin, rightMax) -> float:
	var leftRange = leftMax - leftMin
	var rightRange = rightMax - rightMin
	var value_scaled = float(value - leftMin) / float (leftRange)
	return rightMin + (value_scaled * rightRange)
	
func _ready() -> void:
	print("hi")
