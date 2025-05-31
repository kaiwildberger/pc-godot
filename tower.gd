extends Node2D

func _ready() -> void:
	#print('tower spanwed')
	pass
	
func _process(delta: float) -> void:
	pass

func _on_range_area_entered(area: Area2D) -> void:
	area.get_parent().emit_signal("sushi_eaten")
	# create timer for Chewing cooldown
