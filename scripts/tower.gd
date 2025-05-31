extends Node2D

@export var eating_cooldown = 3 # cooldown in seconds
var is_timedout = false
var timer;

func _ready() -> void:
	#print('tower spanwed')
	pass
	
func _process(delta: float) -> void:
	pass

func _on_range_area_entered(area: Area2D) -> void:
	if is_timedout == true:
		#print("too full... let one pass :P")
		pass
	else:
		area.get_parent().emit_signal("sushi_eaten")
		timer = get_tree().create_timer(eating_cooldown) # could be Global for upgrades but...
		is_timedout = true
		timer.timeout.connect(func(): is_timedout = false)
