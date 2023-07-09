extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_to_cave_b_1_body_entered(body):
	Encounters.set_activeEncounters(true)
	Encounters.set_inDungeon(true)
	Encounters.encounterset_set(2)
	Encounters.set_playerPos(-852,-600)
	Encounters.set_cur_scene("res://Scenes/enviroments/Dungeon/Sloth/CaveB1.tscn")
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Dungeon/Sloth/CaveB1.tscn")

func _on_boss_trigger_sloth_body_entered(body):
	#check if boss was killed
	if PlayerChange.getBoss_Sloth() != true:
		PlayerChange.setInBossFight(true)
		Encounters.set_playerPos(171,-217)
		get_parent().get_parent().NextScene("res://Scenes/Encounters/Boss Encounters/Sloth_Encounter.tscn")
	else:
		$Player/Camera2D/TextBox.show()
		$Player/Camera2D/TextBox/Panel/Label.text = "While the body of Sloth disolved, the stench still lingers... I should wash up after this "
