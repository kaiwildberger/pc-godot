extends Node2D

func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "sushi":
		area.get_parent().emit_signal("cts_trashed")
