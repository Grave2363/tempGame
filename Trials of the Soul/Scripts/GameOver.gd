extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#add the ability to reload last save
func _on_continue_pressed():
	get_tree().change_scene_to_file("res://Scenes/enviroments/Crossroads.tscn")


func _on_quit_pressed():
	pass # Replace with function body.
