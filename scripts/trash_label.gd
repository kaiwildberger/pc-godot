extends RichTextLabel
func _process(delta: float) -> void:
	self.text = "trashed %s\neaten %s" % [Global.trash, Global.eaten]
