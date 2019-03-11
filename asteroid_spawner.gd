extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var asteroid_scene = preload("res://asteroid.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func create_asteroid():
	var asteroid = asteroid_scene.instance()
	asteroid.connect("destroyed", self, "_on_asteroid_destroyed")
	add_child(asteroid)
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass

func _on_asteroid_destroyed():
	create_asteroid()
	pass
