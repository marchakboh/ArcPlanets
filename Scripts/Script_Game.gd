extends Node2D


func _ready():
	$Background.change_texture(GlobalVariable.selected_background_path)
	$Player.change_sprite(GlobalVariable.selected_player_ui)
	$Ball.change_sprite(GlobalVariable.selected_planet_path)
	#$AnimationPlayer.play("border_animation")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		get_tree().change_scene("res://UI_Components/Scenes/Scene_MainMenu.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	generate_sprites()

func generate_sprites():
	for i in range(1, 10):
		var sprite_scene = load("res://UI_Components/CustomNodes/GameSprite_1.tscn")
		var sprite_instance = sprite_scene.instance()
		sprite_instance.position = Vector2(320 + i * 100, 200)
		#add_child(sprite_instance)
