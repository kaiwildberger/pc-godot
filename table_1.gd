extends Node2D

var Sushi = preload("res://Sushi.tscn").instantiate()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		spawn_sushi()

func _process(delta: float) -> void:
	#$Path2D/Sushi.progress_ratio = 0.5
	pass
func spawn_sushi():
	$Path.add_child(Sushi.duplicate())
