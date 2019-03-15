extends KinematicBody2D

var velocity = Vector2(0,0)
var screensize = get_viewport_rect().size
export (int) var rot_speed = 190

var speed = 225
var acc = 0.09
var dec = 0.01
var screenbuffer = 20

var slazer = preload("res://lazer.tscn")
export var lazer_speed = 100
export var lazer_spin = 2000

#Controls
export var left = "ui_left"
export var right = "ui_right"
export var up = "ui_up"


func _ready():
	screensize = get_viewport_rect().size
	pass

func shoot():
	var lazer = slazer.instance()
	var pos = position + Vector2(5,5)

	get_parent().add_child(lazer, true)
	lazer.position = pos
	lazer.linear_velocity = Vector2(lazer_speed, 0).rotated(get_rotation()) # Gets rotation of ship then shoots lazer at a specific velocity
	lazer.set_applied_torque(lazer_spin)
	add_collision_exception_with(lazer) # Makes sure lasers don't collide with each other
	pass

func _process(delta):
	screensize = get_viewport_rect().size
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= rot_speed * delta
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += rot_speed * delta
	
	var movedir = Vector2(1,0).rotated(rotation)
	
	if Input.is_action_pressed("ui_up"):
		velocity = velocity.linear_interpolate(movedir, acc)
	else:
		velocity = velocity.linear_interpolate(Vector2(0,0), dec)
		
	position += velocity * speed * delta
	position.x = wrapf(position.x, -screenbuffer, screensize.x + screenbuffer)
	position.y = clamp(position.y, screensize.y/2, screensize.y)
	
	if Input.is_action_just_pressed("ui_select"): #&& $hitdelay.is_stopped():
		print("firing")
		#$hitdelay.start()
		shoot()
