extends Node


#make castle and crusader berraks
func _on_to_castile_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.

func _on_to_church_body_entered(body):
	pass # Replace with function body.



func _on_blacksmith_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(205,-68)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Town/BlackSmith.tscn")


func _on_house_0_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$Player/Camera2D/TextBox.show()
	$Player/Camera2D/TextBox/Panel/Label.text = "I don't need to buy produce right now"


func _on_house_1_body_entered(body):
	$Player/Camera2D/TextBox.show()
	$Player/Camera2D/TextBox/Panel/Label.text = "This is Town guard's notice board, I don't have anything to post"



func _on_to_gate_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(-138,-171)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Town/TownEntrance.tscn")
