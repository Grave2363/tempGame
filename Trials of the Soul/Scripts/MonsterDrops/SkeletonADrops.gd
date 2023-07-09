extends Node


var gold = 15
var lesserSoul = 1

func _on_skeleton_naga_died(BaseFighterMonster):
	PlayerChange.add_gold(gold)
	PlayerChange.add_Lesser_Soul(lesserSoul)
