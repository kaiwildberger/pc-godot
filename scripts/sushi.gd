extends PathFollow2D

@export var speed = 400
signal sushi_trashed # signals get defined on the component that has to Receive them
signal sushi_eaten

func _process(delta: float) -> void:
	self.progress += speed * delta

func eat_sushi():
	pass
	#print('eat sushi')
	#Global.eaten += 1
	#self.queue_free()

func _on_tree_exiting() -> void:
	var tween = self.create_tween()
	tween.tween_property($Sprite2D, "modulate", Color.RED, 2)
	tween.tween_property($Sprite2D, "scale", Vector2(), 2)
	#tween.tween_callback(self.eat_sushi) # this is not firing


func _on_sushi_trashed() -> void:
	#print('trash!!!')
	Global.trash += 1
	self.queue_free()

func _on_sushi_eaten() -> void:
	#print("on sushi eaten!!")
	Global.eaten += 1
	self.queue_free()
