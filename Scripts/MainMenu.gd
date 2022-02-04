extends Node2D

var planets = []

func _ready():
	initialize()

func _input(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		for planet in planets:
			if planet.get_rect().has_point(event.position):
				# hide all animation
				for planet_2 in planets:
					planet_2.is_selected = false
					planet_2.hide_animation()
				# set needed animation
				planet.is_selected = true
				planet.show_animation()
				$BackgroundImage.texture = load(planet.related_path)

func initialize():
	planets.append(get_node("Planet_Brown"))
	planets.append(get_node("Planet_Earth"))
	planets.append(get_node("Planet_Pink"))
	planets.append(get_node("Planet_Purple"))
	planets.append(get_node("Planet_Yellow"))
