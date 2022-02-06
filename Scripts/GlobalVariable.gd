extends Node

export var selected_background_path = "res://images/Background_Pink.png"
export var selected_planet_path = "res://images/Planet_Pink.png"
export var selected_player_ui = "res://images/Player_Pink.png"
export var player_lives = 3
export var player_score = 0

export var collides = 0

func _ready():
	pass # Replace with function body.

func reset_variables():
	player_lives = 3
	player_score = 0

func reset_scins():
	selected_background_path = "res://images/Background_Pink.png"
	selected_planet_path = "res://images/Planet_Pink.png"
	selected_player_ui = "res://images/Player_Pink.png"
