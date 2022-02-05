extends KinematicBody2D

var speed = 1000
var velocity = Vector2.ZERO

func _ready():
	velocity.y = [0.5, 0.5][randi() % 2]


func _physics_process(delta):
	var collision_object = move_and_collide(delta * speed * velocity)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
