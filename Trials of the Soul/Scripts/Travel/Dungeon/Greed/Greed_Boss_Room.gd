extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerChange.getBoss_Greed() == true:
		$ShadowDragon.hide()


func _on_boss_fight_body_entered(body):
	if PlayerChange.getBoss_Sloth() != true:
		PlayerChange.setInBossFight(true)
		Encounters.set_playerPos(259,-137)
		get_tree().change_scene_to_file("res://Scenes/Encounters/Boss Encounters/Greed_Encounter.tscn")
	else:
		$Player.set_player_move(false)
		$Player/Camera2D/TextBox.show()
		$Player/Camera2D/TextBox/Panel/Label.text = "The dragon of Greed faded into dust, but his cursed gold remains"
		await get_tree().create_timer(1).timeout
		$Player/Camera2D/TextBox/Panel/Label.text = "Perhaps the Church could purify it, probably best not to tuch it"
		$Player.set_player_move(true)


func _on_to_greed_4_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(5)
	Encounters.set_playerPos(412,-970)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_f_4.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_f_4.tscn")
