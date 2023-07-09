extends Node


func _on_to_dungeon_greed_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(1)
	Encounters.set_playerPos(575,-356)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_dungeon_floor_1.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_dungeon_floor_1.tscn")


func _on_to_cross_roads_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(37,180)
	Encounters.set_cur_scene("res://Scenes/enviroments/Overworld/Crossroads.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Overworld/Crossroads.tscn")


func _on_to_dungeon_envy_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(114,-31)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_1.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_1.tscn")


func _on_player_new_encounter():
	get_parent().get_parent().NextScene("res://Scenes/Encounters/Skeleton_Encounter.tscn")
