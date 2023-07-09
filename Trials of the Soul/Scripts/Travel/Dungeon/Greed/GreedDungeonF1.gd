extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_desert_from_greed_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(3)
	Encounters.set_playerPos(-251,313)
	Encounters.set_cur_scene("res://Scenes/enviroments/Overworld/desert.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Overworld/desert.tscn")


func _on_to_greedlvl_2_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(4)
	Encounters.set_playerPos(464,-288)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_f_2.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_f_2.tscn")


func _on_player_new_encounter():
	get_parent().get_parent().NextScene("res://Scenes/Encounters/Slime_Encounter.tscn")
