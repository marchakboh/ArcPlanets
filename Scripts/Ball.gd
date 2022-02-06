extends Node2D

export(bool) var in_game = true

var direction = Vector2.ZERO
onready var timer = get_node("Ball/Sprite/Timer")
var timeDict = OS.get_time();
var seconds
var start_mov = false

func _ready():
	direction = Vector2(500, 0)
	seconds = timeDict.second;

func _physics_process(delta):
	timeDict = OS.get_time();
	var now_seconds = timeDict.second;
	if not start_mov and ((now_seconds - seconds) > 2 or (now_seconds - seconds) < 0):
		start_mov = true;
	if start_mov:
		var collision = $Ball.move_and_collide(direction * delta)
		if collision:
			var reflect = collision.remainder.bounce(collision.normal)
			direction = direction.bounce(collision.normal)
			$Ball.move_and_collide(reflect)
			if collision.collider.name == "Brick":
				collision.collider.hit()


func _on_VisibilityNotifier2D_screen_exited():
	GlobalVariable.player_lives -= 1
	in_game = false

func set_position(pos):
	$Ball.position = pos

func reset():
	pass

func _on_Timer_timeout():
	pass
