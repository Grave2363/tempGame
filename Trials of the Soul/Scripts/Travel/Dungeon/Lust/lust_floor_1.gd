extends Node2D


func _ready():
	if PlayerChange.get_LustDoor() == true:
		$"Stair Hider".hide()
		$BlockingPath.position.x = -100
		$Townfolk1FBase.hide()
		$Townfolk1FBase/StaticBody2D.position.y = -100

func _on_to_cross_roads_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(336,-109)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Overworld/Crossroads.tscn")


func _on_to_lust_floor_2_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.encounterset_set(0)
	Encounters.set_playerPos(67,-11)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Lust/lust_floor_2.tscn")


func _on_area_2d_body_entered(body):
	if PlayerChange.get_LustDoor() == false:
		pass
