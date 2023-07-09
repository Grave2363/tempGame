extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerChange.get_EnvyDoor() == true:
		$HiddenDoor.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_ruin_3_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(6)
	Encounters.set_playerPos(652,-151)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_3.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_3.tscn")


func _on_to_run_boss_body_entered(body):
	if $HiddenDoor.visible != true:
		Encounters.set_activeEncounters(true)
		Encounters.set_inDungeon(true)
		Encounters.encounterset_set(6)
		Encounters.set_playerPos(206,-8)
		Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_boss.tscn")
		get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_boss.tscn")


func _on_to_ruin_1_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(206,-301)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_1.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_1.tscn")


func _on_wall_writing_body_entered(body):
	$Player.set_player_move(false)
	$Player/Camera2D/TextBox.show()
	$Player/Camera2D/TextBox/Panel/Speaker.text = " "
	$Player/Camera2D/TextBox/Panel/Label.text = "We sealed the Envoius king away within his own tomb"
	await get_tree().create_timer(1).timeout
	$Player/Camera2D/TextBox/Panel/Label.text = "This castle was once great, but when he lost his heart"
	await get_tree().create_timer(2).timeout
	$Player/Camera2D/TextBox/Panel/Label.text = "So too did he lose the will of the People"
	await get_tree().create_timer(3).timeout
	$Player.set_player_move(true)


func _on_player_new_encounter():
	randomize()
	var rng = randf_range(10,300) 
	if rng < 100:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/3BaseMummy.tscn")
	elif rng > 100 and rng < 200:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/MummyPriest.tscn")
	else :
		get_parent().get_parent().NextScene("res://Scenes/Encounters/MummyGuard.tscn")
