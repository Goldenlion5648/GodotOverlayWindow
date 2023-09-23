extends Window


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.get_viewport().set_embedding_subwindows(false)
	get_viewport().transparent = true
	get_viewport().transparent_bg = true
	get_viewport().always_on_top = true

