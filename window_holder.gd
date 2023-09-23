extends Node2D

var window_asset = preload("res://test_window.tscn")
var looking_glass: Window
var board: RevealableTerrain

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.get_viewport().set_embedding_subwindows(false)
	get_viewport().always_on_top = true
	get_viewport().get_window().title = "Mysterious Dunes"
	var new_window: Window = window_asset.instantiate()
	self.add_child(new_window)
	looking_glass = new_window
	board = get_node("TileMap") as RevealableTerrain
	
	new_window.position = Vector2(300, 500)
	new_window.visible = true
	new_window.title = "X-Ray Glass"
	new_window.size = Vector2(420, 420)
	new_window.get_viewport().transparent = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if looking_glass != null:
		board.reveal(looking_glass)
