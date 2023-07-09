extends Node

signal choiceMade
var choice = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_interaction_body_entered(body):
	$Player.set_player_move(false)
	$Player/Camera2D/TextBox/Panel/Label.text = "The allure of wealth, should you indulge?"
	$Player/Camera2D/ConfirmDialog.show()
	$Player/Camera2D/TextBox.show()
	


func _on_confirm_dialog_no_pressed():
	choice = false
	emit_signal("choiceMade")


func _on_confirm_dialog_yes_pressed():
	choice = true
	emit_signal("choiceMade")


func _on_choice_made():
	if choice == true:
		$Player/Camera2D/TextBox/Panel/Label.text = "Agenst your better judgment you claim a small portion of gold"
		PlayerChange.add_gold(40)
		$Player/Camera2D/TextBox/Panel/Label.text = "You feel a weak curse take hold, what will be the price of your Greed"
		PlayerChange.addCruption(10)
		PlayerChange.setGreedMechanic(true)
	else:
		$Player/Camera2D/TextBox/Panel/Label.text = "Resisting the allure of Greed you stay your hand this time"
	$Player.set_player_move(true)


func _on_to_greedlvl_1_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(1)
	Encounters.set_playerPos(525,-159)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_dungeon_floor_1.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_dungeon_floor_1.tscn")


func _on_to_greedlvl_3_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(5)
	Encounters.set_playerPos(535,-390)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Greed/greed_f_3.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Greed/greed_f_3.tscn")


func _on_player_new_encounter():
	get_parent().get_parent().NextScene("res://Scenes/Encounters/Imp_Encounter_Cave.tscn")
