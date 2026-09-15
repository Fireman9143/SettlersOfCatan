extends Node2D

var tiles: PackedScene = preload("res://Scenes/tile.tscn")
var direction
var speed = 1000

func _ready() -> void:
	var tile = tiles.instantiate()
	$Tiles.add_child(tile)
		

func _process(delta: float) -> void:
	pass
	
