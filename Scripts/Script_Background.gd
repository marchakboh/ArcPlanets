extends Node2D

func _ready():
	pass

func change_texture(path):
	$TextureRect.texture = load(path)

func start_background_stars():
	$TextureRect2.start_scrolling()
