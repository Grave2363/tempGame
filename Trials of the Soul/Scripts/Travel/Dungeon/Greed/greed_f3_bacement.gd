extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_greed_f_3_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(1)
	Encounters.set_playerPos(874,-188)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_f_3.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_f_3.tscn")



func _on_player_new_encounter():
	randomize()
	var rng = randf_range(10,300) 
	if rng < 150:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/Imp_Encounter_Castle.tscn")
	else:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/3_Imp_Encounter.tscn")
