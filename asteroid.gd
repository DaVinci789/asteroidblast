extends RigidBody2D

var screenbuffer = 20
var screensize = get_viewport_rect().size

func _ready():
	screensize = get_viewport_rect().size
	pass

func _process(delta):
	position.x = wrapf(position.x, -screenbuffer, screensize.x + screenbuffer)
	position.y = wrapf(position.y, -screenbuffer, screensize.y + screenbuffer)
	pass
