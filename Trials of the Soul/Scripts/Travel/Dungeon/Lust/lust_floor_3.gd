extends Node2D



func _on_to_lust_2_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(133,-832)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Lust/lust_floor_2.tscn")


func _on_to_lust_boss_body_entered(body):
	if PlayerChange.get_LustDoorBossKey() == true:
		Encounters.set_activeEncounters(false)
		Encounters.set_inDungeon(false)
		Encounters.encounterset_set(0)
		Encounters.set_playerPos(-207,-293)
		#get_parent().get_parent().NextScene(LustBoss)
	else:
		$Player/Camera2D/TextBox/Panel/Label.text = " the Door is locked, there must be a key somewhere"
		$Player/Camera2D/TextBox/Panel/Speaker.text = " "
		$Player/Camera2D/TextBox/Panel.show()


func _on_to_lust_4_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(-207,-293)
	#get_parent().get_parent().NextScene(Lust4)


func _on_player_new_encounter():
	randomize()
	var rng = randf_range(10,300) 
	if rng < 100:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/Succubus.tscn")
	elif rng > 100 and rng < 200:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/Succubus.tscn")
	else :
		get_parent().get_parent().NextScene("res://Scenes/Encounters/Succubus.tscn")


func _on_chest_opened_chest():
	PlayerChange.add_gold(200)


func _on_chest_2_opened_chest():
	PlayerChange.add_gold(150)
