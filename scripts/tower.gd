extends Node2D

#@export var eating_cooldown = 3 # cooldown in seconds
var is_receiving = true
var timer
var cdlabel
var firerate = 0.2

@export var radius = 130

func _ready() -> void:
	#print('tower spanwed')
	$Range/CollisionShape2D.shape.radius = radius
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
func eat(area):
	if area.position.distance_to(self.position) > radius:
		pass
	if is_receiving == false:
		eat_q.push_back(area)
		pass
	else:
		var eating_cooldown;
		if area.name == "sushi":
			eating_cooldown = area.get_parent().eat_time
		else:
			print("area %s fucked up" % area.name)
			eating_cooldown = 0
		print(eating_cooldown)
		area.get_parent().emit_signal("sushi_eaten")
		timer = Timer.new()
		add_child(timer)
		timer.wait_time = eating_cooldown # could be Global for upgrades but...
		timer.one_shot = true
		timer.start()
		
		is_receiving = false
		timer.timeout.connect(func(): 
			is_receiving = true
			cdlabel.text = ""
			if len(eat_q) > 1:
				# i need to check again if it's still in tha range
				eat(eat_q[len(eat_q)-2]) # second to last. problem solved
				eat_q = []
		)

func _on_range_area_entered(area: Area2D) -> void:
	eat(area)

func _on_range_area_exited(_area: Area2D) -> void:
	eat_q.pop_front() # remove from q
	# this will be one less than needed...
