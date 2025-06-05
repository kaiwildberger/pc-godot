extends Node2D

#@export var eating_cooldown = 3 # cooldown in seconds
var is_firing = false
var timer
var cdlabel
var firerate = 0.2

@export var radius = 130
var boolet = preload("res://scenes/Boolet.tscn").instantiate()

func _ready() -> void:
	#print('tower spanwed')
	#$Range/CollisionShape2D.shape.radius = radius
	cdlabel = $"Cooldown label"
	pass
	
func _draw():
	# this looks like shit please fix
	draw_circle($Sprite2D.position, radius, Color.WHITE, false)
	
func _process(_delta: float) -> void:
	if timer:
		if timer.time_left == 0:
			cdlabel.text = ""
		else:
			cdlabel.text = "%s" % [floor(timer.time_left*10)/10]
	pass

var eat_q = []
func fire_at(area):
	if area.name == "ct area":
		pass

func _on_range_area_entered(area: Area2D) -> void:
	fire_at(area)

func _on_range_area_exited(_area: Area2D) -> void:
	eat_q.pop_front() # remove from q
	# this will be one less than needed...
