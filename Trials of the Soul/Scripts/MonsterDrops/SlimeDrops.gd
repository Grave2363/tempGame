extends Node


var gold = 15
var lesserSoul = 1

func _on_slime_died(BaseFighter):
	PlayerChange.add_gold(gold)
	PlayerChange.add_Lesser_Soul(lesserSoul)
