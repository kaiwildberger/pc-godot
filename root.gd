class_name Root extends Node2D
@onready var dialogueSc = preload("res://dialogue.tscn")
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()
