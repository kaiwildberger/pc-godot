extends Node2D

var Sushis = [preload("res://scenes/Sushi1.tscn").instantiate(),
	preload("res://scenes/Sushi2.tscn").instantiate(),
	preload("res://scenes/Sushi3.tscn").instantiate(),
	preload("res://scenes/Sushi4.tscn").instantiate(),
	]

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		spawn_sushi()

func _process(delta: float) -> void:
	#$Path2D/Sushi.progress_ratio = 0.5
	pass
	
func spawn_sushi():
	$Path.add_child(Sushis.pick_random().duplicate())
