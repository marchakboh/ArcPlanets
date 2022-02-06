extends StaticBody2D

var type

func _init():
	pass
		

func hit():
	remove_child($CollisionPurple)
	remove_child($CollisionGreen)
	remove_child($CollisionRed)
	remove_child($CollisionYellow)
	$Node2D.explode()
	if type == 1:
		GlobalVariable.player_score += 100
	elif type == 2:
		GlobalVariable.player_score += 200
	elif type == 3:
		GlobalVariable.player_score += 400
	elif type == 4:
		GlobalVariable.player_score += 300
	GlobalVariable.collides -= 1
	$AnimationPlayer.play("die_animation")
	#get_parent().queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	get_parent().queue_free()

func set_type(new_type):
	type = new_type
	if type == 1:
		$Sprite.texture = load("res://images/Sprite_Type_1.png")
		remove_child($CollisionGreen)
		remove_child($CollisionRed)
		remove_child($CollisionYellow)
	elif type == 2:
		$Sprite.texture = load("res://images/Sprite_Type_2.png")
		remove_child($CollisionPurple)
		remove_child($CollisionRed)
		remove_child($CollisionYellow)
	elif type == 3:
		$Sprite.texture = load("res://images/Sprite_Type_3.png")
		remove_child($CollisionPurple)
		remove_child($CollisionGreen)
		remove_child($CollisionYellow)
	else:
		$Sprite.texture = load("res://images/Sprite_Type_4.png")
		remove_child($CollisionPurple)
		remove_child($CollisionGreen)
		remove_child($CollisionRed)
