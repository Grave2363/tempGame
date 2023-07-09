extends Node

class_name  mainMenu
# Called when the node enters the scene tree for the first time.
const nextScene = "res://Scenes/enviroments/Town/TownCenter.tscn"
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_pressed():
	get_parent().get_parent().NextScene(nextScene)

#no save or load yet 
#todo
func _on_load_pressed():
	pass # Replace with function body.


func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	pass # Replace with function body.
