extends Node

# more or less managing the player's inventory, started as something else but i'd rather not spend time 
# changing the calls to this class after a name change 
var cur_Wep : Resource 
var cur_item : Resource
var player_name : String
#used to change what class the player is depending on choices
var player_class  : int = 0
#leads to bad end in the lust dungeon, causes a change to the player
var sucubi_interactions : int = 0
#for boss fight player can not flee
var inBossFight : bool = false
#held in inventory
var cur_pure_s : int = 0
var cur_dark_s : int = 0
var cur_gold : int = 100
var lesser_Soul_inv : int 
#hidden player stat
var curruption : int = 0
#used to improve player
var refined_Frag_consumed : int = 4
var fell_fragment_consumed : int = 0
var crupt_soul : int = 0
#boss mechanics
var GreedMechanic : bool = false
#dungeon mechanic
var EnvyDoorOpen : bool = false
var LustDoorOpen : bool = false
var LustDoor2Open : bool = false
var LustDoorBossKey : bool = false
#boss management
var boss_Sloth_defeated : bool = false
var boss_Lust_defeated : bool = false
var boss_Envy_defeated : bool = false
var boss_Greed_defeated : bool = false
var boss_Gluttony_defeated : bool = false
var boss_Wrath_defeated : bool = false
var boss_Pride_defeated : bool = false
var bossesKilled : int = 0

#one will be forced, the rest are optional, and be clensed after clearing the dungeon
# to revert changes, will change the player's apperance and the 3rd will give the player
# the ability to seek redemtion or fall to their own lust and be a slave to their own desires
func get_sucubi_interactions():
	return sucubi_interactions

func add_sucubi_interactions(num):
	sucubi_interactions += num

func set_LustDoor(what):
	LustDoorOpen = what

func get_LustDoor():
	return LustDoorOpen

func set_LustDoorBossKey(what):
	LustDoorBossKey = what

func get_LustDoorBossKey():
	return LustDoorBossKey

func set_LustDoor2(what):
	LustDoor2Open = what

func get_LustDoor2():
	return LustDoor2Open

func set_EnvyDoor(what):
	EnvyDoorOpen = what

func get_EnvyDoor():
	return EnvyDoorOpen

func setGreedMechanic(what):
	GreedMechanic = what

func getGreedMechanic():
	return GreedMechanic

func  getCruptSoul():
	return crupt_soul

func addCruptSoul(num):
	crupt_soul += num

func setCruptSoul(num):
	crupt_soul = num

func addCruption(ammount):
	curruption += ammount

func removeCurruption(ammount):
	curruption -= ammount

func getCurruption():
	return curruption

func getinBossFight():
	return inBossFight

func setInBossFight(what):
	inBossFight = what

func setBossesKilled(num):
	bossesKilled += num
func getBossesKilled():
	return bossesKilled

func getBoss_Sloth():
	return boss_Sloth_defeated
func setBoss_Sloth(isDead):
	boss_Sloth_defeated = isDead

func getBoss_Lust():
	return boss_Lust_defeated
func setBoss_Lust(isDead):
	boss_Lust_defeated = isDead

func getBoss_Envy():
	return boss_Envy_defeated
func setBoss_Envy(isDead):
	boss_Envy_defeated = isDead

func getBoss_Greed():
	return boss_Greed_defeated
func setBoss_Greed(isDead):
	boss_Greed_defeated = isDead

func getBoss_Gluttony():
	return boss_Gluttony_defeated
func setBoss_Gluttony(isDead):
	boss_Gluttony_defeated = isDead

func getBoss_Wrath():
	return boss_Wrath_defeated
func setBoss_Wrath(isDead):
	boss_Wrath_defeated = isDead

func getBoss_Pride():
	return boss_Pride_defeated
func setBoss_Pride(isDead):
	boss_Pride_defeated = isDead
#absorbing refined fragments for the player by converting lesser soul fragments
func convert_To_refined():
	if lesser_Soul_inv != null and lesser_Soul_inv > 2:
		remove_Lesser_Soul(2)
		refined_Frag_consumed += 1

func clense_crupt():
	if crupt_soul !=0 and crupt_soul > 1:
		cur_pure_s += 15
		crupt_soul -= 1

func convert_to_fell():
	if lesser_Soul_inv != null and lesser_Soul_inv > 2:
		remove_Lesser_Soul(2)
		addCruption(10)
		fell_fragment_consumed += 1

func gainFell(ammount):
	addCruption(10)
	fell_fragment_consumed += 1

#used as an out of the fallen route
func atonment():
	curruption = 0
	refined_Frag_consumed += fell_fragment_consumed 
	cur_pure_s += cur_dark_s
	fell_fragment_consumed = 0
	cur_dark_s = 0

func get_player_name():
	return player_name

func set_player_name(something : String):
	player_name = something

func add_gold(gold):
	cur_gold += gold
func remove_gold(gold):
	cur_gold -= gold
func get_gold():
	return cur_gold

func set_cur_wep (wep ):
	cur_Wep = wep

func get_wep():
	return cur_Wep

func get_refined():
	if cur_pure_s != null:
		return refined_Frag_consumed
	else:
		return 0
func get_fell():
	if cur_Wep != null:
		return fell_fragment_consumed
	else:
		return 0 

func set_souls(pure, dark):
	cur_pure_s = pure
	cur_dark_s = dark

func add_Lesser_Soul(souls):
	lesser_Soul_inv += souls

func remove_Lesser_Soul(souls):
	lesser_Soul_inv -= souls

func set_lesser_Soul(souls):
	lesser_Soul_inv = souls

func get_lesser_Soul():
	if lesser_Soul_inv != null:
		return lesser_Soul_inv
	else:
		return 0

func get_item():
	return cur_item

func set_item(newItem):
	cur_item = newItem
