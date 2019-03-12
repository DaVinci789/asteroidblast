extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var buildings = []

func _ready():
	for node in get_tree().get_nodes_in_group("building_player"):
		buildings.append(node)
	print(buildings)
	pass

func _process(delta):

	pass

func game_over():
	if buildings == []:
		get_tree().quit()

func _on_building_destroyed(body):
	buildings.remove(buildings.find(body))
	game_over()

func _on_building2_destroyed(body):
	buildings.remove(buildings.find(body))
	game_over()
	pass # replace with function body


func _on_building3_destroyed(body):
	buildings.remove(buildings.find(body))
	game_over()
	pass # replace with function body


func _on_building4_destroyed(body):
	buildings.remove(buildings.find(body))
	game_over()
	pass # replace with function body
