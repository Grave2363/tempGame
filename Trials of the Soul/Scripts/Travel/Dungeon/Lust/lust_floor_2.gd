extends Node2D


func _ready():
	var temp = true
	if PlayerChange.get_LustDoor2() == true:
		$DoorHider.hide()
		$PostOpenDoor.show()
		$Townfolk1FBase.hide()
		$DoorHider/StaticBody2D.position.y = -1015
	#have a check for is player lost a fight, have them wake near the bed and add
	#to the curruption counter, after 3 player can fight the boss once more, if they lose 
	#they get a bad end, if they win they turn into the fallen player and are given a choice 
	#seek redemtion or submit to their base desires and take the place of Lust as a succubus in a bad end


func _on_to_lust_floor_1_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(-207,-293)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Lust/lust_floor_1.tscn")


func _on_area_2d_body_entered(body):
	if PlayerChange.get_LustDoor2() == false:
		pass


func _on_to_lust_3_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(7)
	Encounters.set_playerPos(0,0)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Lust/lust_floor_3.tscn")

