extends Node


func _on_back_to_greed_2_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(4)
	Encounters.set_playerPos(149,-56)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_f_2.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_f_2.tscn")


func _on_to_greed_f_4_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(5)
	Encounters.set_playerPos(79,-396)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_f_4.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_f_4.tscn")


func _on_to_greed_treasure_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(5)
	Encounters.set_playerPos(0,0)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_f_3_bacement.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_f_3_bacement.tscn")


func _on_imp_interaction_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$Player/Camera2D/TextBox.show()
	$Player/Camera2D/TextBox/Panel/Speaker.text = "Imp"
	$Player/Camera2D/TextBox/Panel/Label.text = "Leave me alone, Master will kill me if I misscount"


func _on_imp_interaction_body_entered(body):
	pass # Replace with function body.


func _on_player_new_encounter():
	randomize()
	var rng = randf_range(10,300) 
	if rng < 150:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/Imp_Encounter_Castle.tscn")
	else:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/3_Imp_Encounter.tscn")
