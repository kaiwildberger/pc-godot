class_name Root extends Node2D

var tower = preload("res://Tower.tscn").instantiate()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()
	if event.is_action_pressed("mousepress"):
		var mpos = get_local_mouse_position()
		#if mpos - 
		var newtower = tower.duplicate()
		newtower.position.x = mpos.x
		newtower.position.y = mpos.y
		$Table1.add_child(newtower)
		
		
