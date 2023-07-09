extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_town_body_entered(body):
	Encounters.set_activeEncounters(false)
	Encounters.set_inDungeon(false)
	Encounters.set_playerPos(-217,0)
	get_parent().get_parent().NextScene("res://Scenes/enviroments/Town/TownCenter.tscn")

func _on_to_buy_body_entered(body):
	$Player/Camera2D/TextBox.show()
	$Player/Camera2D/TextBox/Panel/Label.text = "Are you in need of my services?"
	$Player/Camera2D/ConfirmDialog.show()
