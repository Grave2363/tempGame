extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_greed_boss_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(259,-13)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_boss_room.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_boss_room.tscn")


func _on_to_greed_f_3_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(5)
	Encounters.set_playerPos(291,-193)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_f_3.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_f_3.tscn")


func _on_imp_speak():
	$Player.set_player_move(false)
	$Player/Camera2D/TextBox.show()
	$Player/Camera2D/TextBox/Panel/Speaker.text = "Imp"
	$Player/Camera2D/TextBox/Panel/Label.text = "The old King is gone, but his one command  remains..."
	await get_tree().create_timer(1).timeout
	$Player/Camera2D/TextBox/Panel/Label.text = "Gather all the gold you can and bring it  to me"
	await get_tree().create_timer(2).timeout
	$Player/Camera2D/TextBox/Panel/Label.text = "Our oath binds us to that one command,      and our fate to that fell beast"
	await get_tree().create_timer(3).timeout
	$Player.set_player_move(true)


func _on_imp_4_speak():
	$Player.set_player_move(false)
	$Player/Camera2D/TextBox.show()
	$Player/Camera2D/TextBox/Panel/Speaker.text = "Imp"
	$Player/Camera2D/TextBox/Panel/Label.text = "No ammount of gold will free our souls"
	await get_tree().create_timer(1).timeout
	$Player/Camera2D/TextBox/Panel/Label.text = "Nore will it bring back our King, who fell        long ago"
	await get_tree().create_timer(2).timeout
	$Player.set_player_move(true)


func _on_imp_5_speak():
	$Player.set_player_move(false)
	$Player/Camera2D/TextBox.show()
	$Player/Camera2D/TextBox/Panel/Speaker.text = "Imp"
	$Player/Camera2D/TextBox/Panel/Label.text = "Why do I need to fix this"
	await get_tree().create_timer(1).timeout
	$Player/Camera2D/TextBox/Panel/Label.text = "The King never leaves the Throne room"
	await get_tree().create_timer(2).timeout
	$Player.set_player_move(true)


func _on_player_new_encounter():
	randomize()
	var rng = randf_range(10,300) 
	if rng < 150:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/Imp_Encounter_Castle.tscn")
	else:
		get_parent().get_parent().NextScene("res://Scenes/Encounters/3_Imp_Encounter.tscn")
