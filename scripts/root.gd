class_name Root extends Node2D

# https://www.imaginaryrobots.net/posts/2022-02-03-understanding-light2d-masks-godot/
# table "wood" types perks
# decoration perks



var tower = preload("res://scenes/Tower.tscn").instantiate()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()
	if event.is_action_pressed("mousepress"):
		var mpos = get_local_mouse_position()
		var newtower = tower.duplicate()
		newtower.position.x = mpos.x
		newtower.position.y = mpos.y
		$Table1.add_child(newtower)
		
		
