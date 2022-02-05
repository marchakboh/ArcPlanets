extends Node

export(float) var scroll_speed = 0.05

func _ready():
	start_scrolling()

func start_scrolling():
	self.material.set_shader_param("scroll_speed", scroll_speed)
