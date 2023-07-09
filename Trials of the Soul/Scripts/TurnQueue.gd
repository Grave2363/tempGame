extends Node2D

class_name turnQueue

var active_Char


func initialize():
	active_Char = get_child(0)
	

func play_turn():
	await(active_Char.play_turn())
	var new_index : int  = (active_Char.get_index() + 1) % get_child_count()
	active_Char = get_child(new_index)
