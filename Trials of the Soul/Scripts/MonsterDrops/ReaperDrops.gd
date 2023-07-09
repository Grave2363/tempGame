extends Node

var gold = 150
var lesserSoul = 10

func _on_reaper_died(BaseFighterMonster):
	PlayerChange.add_gold(gold)
	PlayerChange.add_Lesser_Soul(lesserSoul)
