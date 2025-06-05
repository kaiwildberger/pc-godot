extends Area2D

@export var type = "salmon" # type map to damage
@export var dmg = 1
@export var speed = 400

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("customer group"):
		# every root node should be an area2d
		# but literally in this case its a path follower.... :(
		body.get_parent().damage(self.dmg)
		queue_free()
	pass # Replace with function body.
