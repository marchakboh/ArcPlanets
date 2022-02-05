extends TextureRect

export(bool) var is_selected = false
export var background_path = ""
export var planet_path = ""

var sprites = []

func _ready():
	initialize()
	if is_selected:
		show_animation()
	else:
		hide_animation()

func show_animation():
	for sprite in sprites:
		sprite.visible = true
	$AnimationPlayer.play("circle_animation")

func hide_animation():
	for sprite in sprites:
		sprite.visible = false

func initialize():
	sprites.append(get_node("CircleRed"))
	sprites.append(get_node("CircleGreen"))
	sprites.append(get_node("CirclePurple"))
	sprites.append(get_node("CircleYellow"))
