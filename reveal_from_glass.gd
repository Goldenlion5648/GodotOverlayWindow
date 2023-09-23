extends TileMap

class_name RevealableTerrain
var top_layer = 0
var hidden_layer = 1
var original_tiles = {}

func _ready() -> void:
	for spot in self.get_used_cells(top_layer):
		original_tiles[spot] = get_cell_atlas_coords(top_layer, spot)


func reveal(looking_glass: Window):
	for tile_pos in self.get_used_cells(hidden_layer):
		var global_pos = to_global(map_to_local(tile_pos)) +\
						Vector2(get_viewport().get_window().position)
		var glassRect = Rect2(looking_glass.position, looking_glass.size)
		if glassRect.has_point(global_pos):
			set_cell(top_layer, tile_pos, -1)
		else:
			if tile_pos in original_tiles:
				set_cell(top_layer, tile_pos, 0, original_tiles[tile_pos])
