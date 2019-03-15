extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass



func _on_lazer_body_exited(body):
	queue_free()
	pass # replace with function body


func _on_lazer_body_entered(body):
	queue_free()
	pass # replace with function body
