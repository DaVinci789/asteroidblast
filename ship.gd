extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (int) var MAXSPEED = 450
var velocity = Vector2(0,0)
var screensize = get_viewport_rect().size
var rot = 0
export (int) var rot_speed = 190
# how much the ship continues to slide after releasing the directional key
var speed = 225
var acc = 0.07
var dec = 0.01
var screenbuffer = 20
var contacted = false
signal hit

var slazer = preload("res://lazer.tscn")
export var lazer_speed = 100

func _ready():
	screensize = get_viewport_rect().size
	$lazer.connect("hurt",self,"_draw")
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func shoot():
	var lazer = slazer.instance()
	var pos = position + Vector2(5,5)
	
	get_parent().add_child(lazer, true)
	lazer.position = pos
	lazer.linear_velocity = Vector2(lazer_speed, 0).rotated(get_rotation())
	add_collision_exception_with(lazer)
	pass

func _process(delta):
	screensize = get_viewport_rect().size
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= rot_speed * delta
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += rot_speed * delta
	
	var movedir = Vector2(1,0).rotated(rotation)
	
	if Input.is_action_just_pressed("ui_up"):
		velocity = velocity.linear_interpolate(movedir, acc)
	else:
		velocity = velocity.linear_interpolate(Vector2(0,0), dec)
		
	position += velocity * speed * delta
	position.x = wrapf(position.x, -screenbuffer, screensize.x + screenbuffer)
	position.y = clamp(position.y, 0, screensize.y)
	
	if Input.is_action_pressed("ui_select"):
		print("firing")
		shoot()
		
		
		
# if we add this back, add the Timer node back as a root of the hitbox (Raycast) node
#		if $lazer.is_colliding():
#			emit_signal("hit")
#			var thing  =  $lazer.get_collider()
#			contacted = true
#			update()
#			print(thing)
#
#		else:
#			update()
#
#func _draw():
#	if $lazer.is_colliding():
#		draw_line($lazer.position, $lazer.get_cast_to(), Color(1.0, 0, 0))
#		get_node("lazer/Timer").start()
#		if contacted == false:
#			draw_line($lazer.position, $lazer.get_cast_to(), Color(0.0, 0, 0))
#	else:
#		draw_line($lazer.position, $lazer.get_cast_to(), Color(0.0, 0, 0))
#	pass
#
#
#func _on_Timer_timeout():
#	contacted = false
#	update()
