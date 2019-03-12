extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal destroyed

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_hitbox_body_entered(area):
	if "asteroid" in area.name:
		emit_signal("destroyed", self)
		queue_free()