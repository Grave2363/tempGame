extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_desert_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(3)
	Encounters.set_playerPos(980,373)
	Encounters.set_cur_scene("res://Scenes/enviroments/Overworld/desert.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Overworld/desert.tscn")


func _on_to_ruin_2_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(6)
	Encounters.set_playerPos(652,-151)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_2.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Envy/envy_ruin_2.tscn")


func _on_wall_writing_body_entered(body):
	$Player.set_player_move(false)
	$Player/Camera2D/TextBox.show()
	$Player/Camera2D/TextBox/Panel/Speaker.text = " "
	$Player/Camera2D/TextBox/Panel/Label.text = "Once long ago this land prospered"
	await get_tree().create_timer(1).timeout
	$Player/Camera2D/TextBox/Panel/Label.text = "The neighboring nations had paradise, but it was never enough"
	await get_tree().create_timer(2).timeout
	$Player/Camera2D/TextBox/Panel/Label.text = "Greed and Envy eventually took root, and consumed their hearts"
	await get_tree().create_timer(3).timeout
	$Player.set_player_move(true)
