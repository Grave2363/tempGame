extends Node

var activeEncounters = false
var encounterCD = 20
var playerPosx = -12 
var playerposy = 104
var player_in_Dungeon = false
var cur_scene : String 

#Encounter sets
# 1 first floor for most dungeons
# 6 Envy ruin roon 2 and 3
# 7 lust room 3 and 4

#used to determin witch set of encounters can be triggered
var encounterSet : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func encounterset_set(val : int):
	encounterSet = val

func set_cur_scene(where):
	cur_scene = where

func get_cur_scene():
	return cur_scene

func set_playerPos(posx, posy):
	playerPosx = posx
	playerposy = posy

func get_inDungeon():
	return player_in_Dungeon

func set_inDungeon(amI):
	player_in_Dungeon = amI

func get_playerPosx():
	return playerPosx
func get_playerPosy():
	return playerposy

func encouterCDTimer():
	if encounterCD > 1:
		encounterCD -= 1
		return false
	else :
		encounterCD = 20
		return true


func get_activeEncounters():
	return activeEncounters

func set_activeEncounters(where : bool):
	activeEncounters = where
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
