extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var buildings = []
var buildings2 = []

func _ready():
	for node in get_tree().get_nodes_in_group("building_player"):
		buildings.append(node)
	print(buildings)
	
	for node in get_tree().get_nodes_in_group("buildings_player2"):
		buildings2.append(node)
	print(buildings2)
	pass

func _input(ui):
	if ui.is_action_pressed("ui_cancel"):
		$pause_menu.show()
		get_tree().paused = true

func _process(delta):

	pass

func game_over():
	if buildings == [] || buildings2 == []:
		if buildings == []:
			print("Player 2 wins")
		if buildings2 == []:
			print(" Player 1 wins")
		get_tree().change_scene("res://gameover.tscn")
		queue_free()
		#get_tree().quit()

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


func _on_building5_destroyed(body):
	buildings2.remove(buildings2.find(body))
	game_over()
	pass # replace with function body


func _on_building6_destroyed(body):
	buildings2.remove(buildings2.find(body))
	game_over()
	pass # replace with function body


func _on_building7_destroyed(body):
	buildings2.remove(buildings2.find(body))
	game_over()
	pass # replace with function body


func _on_building8_destroyed(body):
	buildings2.remove(buildings2.find(body))
	game_over()
	pass # replace with function body
