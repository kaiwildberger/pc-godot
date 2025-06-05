extends Node2D

var customer = preload("res://scenes/Customer.tscn").instantiate() 

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		spawn_customer()

func _process(delta: float) -> void:
	#$Path2D/Sushi.progress_ratio = 0.5
	pass
	
func spawn_customer():
	$Path.add_child(customer.duplicate())
