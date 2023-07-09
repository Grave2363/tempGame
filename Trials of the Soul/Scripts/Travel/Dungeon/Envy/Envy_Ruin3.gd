extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hidden_door_trigger_body_entered(body):
	PlayerChange.set_EnvyDoor(true)
	$Player.set_player_move(false)
	$Player/Camera2D/TextBox/Panel/Label.text("Something collapsed in the distance")
	$Player/Camera2D/TextBox/Panel/Speaker.text(" ")
	$Player/Camera2D/TextBox.show()
	await get_tree().create_timer(1).timeout
	$Player.set_player_move(true)


func _on_to_ruin_2_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(6)
	Encounters.set_playerPos(98,-508)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_2.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_2.tscn")


func _on_player_new_encounter():
	randomize()
	var rng = randf_range(10,300) 
	if rng < 100:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/3BaseMummy.tscn")
	elif rng > 100 and rng < 200:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/MummyPriest.tscn")
	else :
		get_parent().get_parent().NextScene("res://Scenes/Encounters/MummyGuard.tscn")
