extends Node2D


func _ready():
	$Background.change_texture(GlobalVariable.selected_background_path)
	$AnimationPlayer.play("start_animation")
	var sd = load("res://UI_Components/CustomNodes/GameSprite.tscn")
	var sdd = sd.instance()
	sdd.create_sprite(1)
	add_child(sdd)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	pass
	#generate_sprites()

#func generate_sprites():
	
