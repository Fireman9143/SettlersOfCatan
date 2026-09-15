extends Node2D

var brick_tile = preload("res://Tiles/AIBrickYard.png")
var coal_tile = preload("res://Tiles/AICoalTileMashup.png")
var desert_tile = preload("res://Tiles/AIDesertMashup.png")
var forest_tile = preload("res://Tiles/AIForest.png")
var sheep_tile = preload("res://Tiles/AISheepTileMashup.png")
var wheat_tile = preload("res://Tiles/AIWheatTile.png")

func _ready():
	set_marker()
	
func set_marker():
	var markers = $Markers.get_children()
	var tiles = $Tiles.get_children()
	for i in range(len(markers)):
		tiles[i].texture = pick_tile()
		tiles[i].position = markers[i].position
		
func pick_tile():
	var sprite
	var available = []
	for key in Global.normal_tileset.keys():
		if Global.normal_tileset[key] > 0:
			available.append(key)
		else:
			Global.normal_tileset.erase(key)
	var active_sprite = available.pick_random()
	print(active_sprite)
	match active_sprite:
		"brick": 
			sprite = brick_tile
		"coal": 
			sprite = coal_tile
		"desert": 
			sprite = desert_tile
		"forest":
			sprite = forest_tile
		"sheep":
			sprite= sheep_tile
		"wheat":
			sprite = wheat_tile
	Global.normal_tileset[active_sprite] = Global.normal_tileset[active_sprite] - 1
	return sprite
