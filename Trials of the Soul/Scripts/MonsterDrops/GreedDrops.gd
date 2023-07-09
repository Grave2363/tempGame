extends Node

var gold = 300
var lesserSoul = 10

func _on_reaper_died(BaseFighterMonster):
	PlayerChange.add_gold(gold)
	PlayerChange.add_Lesser_Soul(lesserSoul)
	PlayerChange.addCruptSoul(1)
