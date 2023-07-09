extends Node


var gold = 30
var lesserSoul = 3


func _on_lesser_imp_died(BaseFighterMonster):
	PlayerChange.add_gold(gold)
	PlayerChange.add_Lesser_Soul(lesserSoul)
