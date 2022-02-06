extends Node2D

var speed = 400
export(bool) var ready = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if ready:
		var velocity = Vector2.ZERO
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
		$Player.move_and_slide(velocity * speed)
		$Player.position = Vector2(0, $Player.position.y)

func change_sprite(path):
	$Player/Sprite.texture = load(path)

func get_position():
	return $Player/Sprite.position
