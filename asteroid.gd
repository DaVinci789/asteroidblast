extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var screenbuffer = 20
var screensize = get_viewport_rect().size

func _ready():
	screensize = get_viewport_rect().size
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	position.x = wrapf(position.x, -screenbuffer, screensize.x + screenbuffer)
	position.y = wrapf(position.y, -screenbuffer, screensize.y + screenbuffer)
	pass
