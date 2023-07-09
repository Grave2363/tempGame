extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lv_b_1_entrance_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(1)
	Encounters.set_playerPos(66,-72)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Sloth/Cave.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Sloth/Cave.tscn")

func _on_to_lvl_b_2_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(172,-426)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Sloth/cave_boss_sloth.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Sloth/cave_boss_sloth.tscn")


func _on_player_new_encounter():
	randomize()
	var rng = randf_range(10,300) 
	if rng < 150:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/Slime_Encounter.tscn")
	else:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/Slug_Encounter.tscn")
