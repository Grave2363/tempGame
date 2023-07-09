extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.set_playerPos(34,-88)
	Encounters.encounterset_set(0)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Overworld/Crossroads.tscn")

func _on_to_lower_level_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(2)
	Encounters.set_playerPos(527,-169)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Sloth/CaveB1.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Sloth/CaveB1.tscn")


func _on_hidden_encounter_body_entered(body):
	Encounters.set_playerPos(-620,-515)
	get_parent().get_parent().NextScene("res://Scenes/Encounters/Boss Encounters/Reaper_Encounter.tscn")


func _on_player_new_encounter():
	get_parent().get_parent().NextScene("res://Scenes/Encounters/Slime_Encounter.tscn")
