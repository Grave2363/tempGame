extends Node


var gold = 10
var lesserSoul = 1

func _on_lesser_imp_died(BaseFighterMonster):
	PlayerChange.add_gold(gold)
	PlayerChange.add_Lesser_Soul(lesserSoul)
