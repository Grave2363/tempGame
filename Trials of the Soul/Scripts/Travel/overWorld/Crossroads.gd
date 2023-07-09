extends Node


func _on_dungon_entrance_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(1)
	Encounters.set_playerPos(662,-163)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Sloth/Cave.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Sloth/Cave.tscn")


func _on_to_desert_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(3)
	Encounters.set_playerPos(93,-49)
	Encounters.set_cur_scene("res://Scenes/enviroments/Overworld/desert.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Overworld/desert.tscn")


func _on_to_town_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(321,7)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Town/TownEntrance.tscn")


func _on_to_lust_dungeon_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(14,-134)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Lust/lust_floor_1.tscn")
