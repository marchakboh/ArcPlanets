extends Node2D

var planets = []

func _ready():
	initialize()
	$AnimationPlayer.play("planets_animation")

func _input(event):
	if event is InputEventMouseButton:
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
					$Background.change_texture(planet.background_path)
					GlobalVariable.selected_background_path = planet.background_path
					GlobalVariable.selected_planet_path = planet.planet_path
					GlobalVariable.selected_player_ui = planet.planet_player

func initialize():
	planets.append(get_node("Planet_Brown"))
	planets.append(get_node("Planet_Earth"))
	planets.append(get_node("Planet_Pink"))
	planets.append(get_node("Planet_Purple"))
	planets.append(get_node("Planet_Yellow"))


func _on_Button_Play_pressed():
	$AnimationPlayer.play("down_animation")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "down_animation":
		get_tree().change_scene("res://UI_Components/Scenes/Scene_Game.tscn")
