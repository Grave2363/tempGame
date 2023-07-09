extends Node

func _on_to_cross_roads_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(-209,-66)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Overworld/Crossroads.tscn")

func _on_to_town_center_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.set_playerPos(-12,104)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Town/TownCenter.tscn")
