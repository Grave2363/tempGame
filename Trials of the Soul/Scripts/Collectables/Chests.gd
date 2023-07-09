extends Node

signal openedChest
func opened():
	emit_signal("openedChest")
	$Closed.hide()
	$Open.show()

func cave_b1_items():
	PlayerChange.add_gold(20)
	opened()


func _on_hidden_chest_cave_b_1_body_entered(body):
	if $Closed.visible == true:
		cave_b1_items()


func _on_area_2d_body_entered(body):
	opened()
