extends Node2D

onready var bricks = preload("res://UI_Components/CustomNodes/BrickPurple.tscn")
onready var ball_preload = preload("res://UI_Components/CustomNodes/Ball.tscn")
var ball
var game_over = false

func set_bricks():
	var numbricks = 0
	for i in range(5):
		for j in range(6):
			var brick = bricks.instance()
			brick.set_type(3)
			brick.position = Vector2(1200 + 60 * i, 160 + 120 * j)
			numbricks += 1
			add_child(brick)

func _ready():
	$Background.change_texture(GlobalVariable.selected_background_path)
	$Player.change_sprite(GlobalVariable.selected_player_ui)
	$Player.visible = true
	$AnimationPlayer.play("load_animation")
	$Lives.text = str(GlobalVariable.player_lives)
	$Score.text = str(GlobalVariable.player_score)
	$BackMenu.visible = false
	$PlayAgain.visible = false
	$Fin_Score.visible = false
	$Fin_Score_static.visible = false
	#set_bricks()
	next_sprites()

func _process(delta):
	if (GlobalVariable.player_lives <= 0):
		#$Player.visible = false
		#ball.visible = false
		$Fin_Score_static.visible = true
		$Fin_Score.visible = true
		$Fin_Score.text = str(GlobalVariable.player_score)
		$BackMenu.visible = true
		$PlayAgain.visible = true
		game_over = true
	else:
		$Score.text = str(GlobalVariable.player_score)
		$Lives.text = str(GlobalVariable.player_lives)
	
	#if GlobalVariable.collides <= 0:
	#	next_sprites()

func next_sprites():
	for i in range(8):
		if i < 2:
			for j in range(10):
				var brick = bricks.instance()
				brick.set_type(1)
				brick.position = Vector2(800 + 90 * i, 160 + 70 * j)
				add_child(brick)
		elif i < 4:
			for j in range(10):
				var brick = bricks.instance()
				brick.set_type(2)
				brick.position = Vector2(800 + 90 * i, 160 + 70 * j)
				add_child(brick)
		elif i < 6:
			for j in range(5):
				var brick = bricks.instance()
				brick.set_type(3)
				brick.position = Vector2(800 + 90 * i, 230 + 120 * j)
				add_child(brick)
		elif i < 8:
			for j in range(10):
				var brick = bricks.instance()
				brick.set_type(4)
				brick.position = Vector2(800 + 90 * i, 160 + 70 * j)
				add_child(brick)
	

func _physics_process(delta):
	if ball and game_over == false:
		if not ball.in_game:
			remove_child(ball)
			ball = ball_preload.instance()
			ball.position.x = 400
			ball.position.y = 490
			ball.change_sprite(GlobalVariable.selected_planet_path)
			add_child(ball)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "load_animation":
		$Player.ready = true
		ball = ball_preload.instance()
		ball.position.x = $Player.position.x + 45
		ball.position.y = $Player.position.y - 5
		ball.change_sprite(GlobalVariable.selected_planet_path)
		add_child(ball)


func _on_BackMenu_pressed():
	GlobalVariable.reset_variables()
	GlobalVariable.reset_scins()
	get_tree().change_scene("res://UI_Components/Scenes/Scene_MainMenu.tscn")


func _on_PlayAgain_pressed():
	GlobalVariable.reset_variables()
	get_tree().reload_current_scene()
