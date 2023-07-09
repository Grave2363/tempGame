extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_ruin_2_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(6)
	Encounters.set_playerPos(627,-499)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_2.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_2.tscn")


func _on_envy_boss_fight_body_entered(body):
	if PlayerChange.getBoss_Envy() != true:
		PlayerChange.setInBossFight(true)
		Encounters.set_playerPos(345,-202)
		get_tree().change_scene_to_file("res://Scenes/Encounters/Boss Encounters/Envy_Encounter.tscn")
	else:
		$Player.set_player_move(false)
		$Player/Camera2D/TextBox.show()
		$Player/Camera2D/TextBox/Panel/Label.text = "The Tomb has fallen silent, but the stench of rotting flesh remains"
		await get_tree().create_timer(1).timeout
		$Player/Camera2D/TextBox/Panel/Label.text = "I guess what they said was true, the ruler of each Domain are lost to us"
		await get_tree().create_timer(2).timeout
		$Player.set_player_move(true)
