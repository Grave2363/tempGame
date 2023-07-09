extends Control

signal Textbox_closed
signal Player_Turn_Over
var tempPlayerName = "Nameless"
@onready var tempItem = "Hermit's Ointment"
@onready var itemHealing = 20
var maxHpMonA
var maxHPMonB
var maxHPMonC
var guarding = false
var item_Uses = 3
var target : BaseFighterMonster
# Called when the node enters the scene tree for the first time.
func _ready():
	$Player_actions/HBoxContainer/HBoxContainer3/VBoxContainer/BasicAttack.text = $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(0).name
	$Player_actions/HBoxContainer/HBoxContainer3/VBoxContainer/BashAtk.text = $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(1).name
	$Player_actions/HBoxContainer/HBoxContainer3/VBoxContainer2/WeakMagFire.text = $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(2).name
	$Player_actions/HBoxContainer/HBoxContainer3/VBoxContainer2/WeakMagLight.text = $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(3).name
	tempItem = $VBoxContainer3/CombatPlayer/Job/Item.get_child(0).name
	itemHealing = $VBoxContainer3/CombatPlayer/Job/Item.get_child(0).healing
	$Textbox.hide()
	$Player_actions.hide()
	target = $VBoxContainer/MonsterA
	maxHpMonA = $VBoxContainer/MonsterA/Job/Stats.get_hp()
	maxHPMonB = $VBoxContainer2/MonsterB/Job/Stats.get_hp()
	maxHPMonC = $VBoxContainer4/MonsterC/Job/Stats.get_hp()
	showText("Confront Envy's dark allure")
	await get_tree().create_timer(1).timeout
	showText("Rise my Minions, claim My Hearts Desire and BRING IT TO ME!")
	$VBoxContainer4.show()
	await self.Textbox_closed
	$Player_actions.show()

func _input(event):
	if ((Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and $Textbox.visible ):
		$Textbox.hide()
		emit_signal("Textbox_closed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $VBoxContainer.visible == false and $VBoxContainer2.visible == false and $VBoxContainer4.visible == false:
		get_parent().get_parent().NextScene(Encounters.get_cur_scene())

func combatLogic():
	pass

func showText(text):
	$Textbox.show()
	$Textbox/TextBoxText.text = text

func _on_v_box_container_2_mouse_entered():
	if $VBoxContainer2.visible:
		target = $VBoxContainer2/MonsterB


func _on_v_box_container_mouse_entered():
	if $VBoxContainer.visible:
		target = $VBoxContainer/MonsterA


# I think this is still broken atm
#todo fix
func _on_defend_pressed():
	showText(tempPlayerName +" guards")
	guarding = true
	emit_signal("Player_Turn_Over")
	$Player_actions.hide()
	await get_tree().create_timer(0.5).timeout
	MonsterTurn()


func _on_run_pressed():
	showText(tempPlayerName +" Can not Flee ")
	#get_tree().change_scene_to_file(Encounters.get_cur_scene())


func _on_item_pressed():
	if item_Uses > 0:
		item_Uses = item_Uses - 1
		showText(tempPlayerName +" used " + tempItem)
		$VBoxContainer3/CombatPlayer.healing(itemHealing)
		emit_signal("Player_Turn_Over")
		$Player_actions.hide()
		await get_tree().create_timer(0.5).timeout
		MonsterTurn()
	else:
		showText(tempItem + " is out of uses")



func _on_basic_attack_pressed():
	showText(tempPlayerName + " has attacked ")
	$VBoxContainer3/CombatPlayer.skillUsed($VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(0).mpCost)
	target.DmgTakenPhys($VBoxContainer3/CombatPlayer/Job/Stats.get_atk() * $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(0).power)
	emit_signal("Player_Turn_Over")
	$Player_actions.hide()
	await get_tree().create_timer(0.5).timeout
	MonsterTurn()


func _on_bash_atk_pressed():
	if $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(2).mpCost < $VBoxContainer3/CombatPlayer/Job/Stats.get_mp():
		showText(tempPlayerName + " has attacked ")
		$VBoxContainer3/CombatPlayer.skillUsed($VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(1).mpCost)
		target.DmgTakenPhys($VBoxContainer3/CombatPlayer/Job/Stats.get_atk() * $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(1).power)
		emit_signal("Player_Turn_Over")
		$Player_actions.hide()
		await get_tree().create_timer(0.5).timeout
		MonsterTurn()
	else:
		showText("Not enough MP for Skill")

func _on_weak_mag_fire_pressed():
	showText(tempPlayerName + " has attacked ")
	if $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(2).mpCost < $VBoxContainer3/CombatPlayer/Job/Stats.get_mp():
		$VBoxContainer3/CombatPlayer.skillUsed($VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(2).mpCost)
		target.DmgTakenMag($VBoxContainer3/CombatPlayer/Job/Stats.get_mAtk() * $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(2).power)
		emit_signal("Player_Turn_Over")
		$Player_actions.hide()
		await get_tree().create_timer(0.5).timeout
		MonsterTurn()
		
	else:
		showText("Not enough MP for Skill")


func _on_weak_mag_light_pressed():
	if $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(2).mpCost < $VBoxContainer3/CombatPlayer/Job/Stats.get_mp():
		showText(tempPlayerName + " has attacked ")
		$VBoxContainer3/CombatPlayer.skillUsed($VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(3).mpCost)
		#for simulating weaknesses while its not inplemented yet
		target.DmgTakenMag(($VBoxContainer3/CombatPlayer/Job/Stats.get_mAtk() * $VBoxContainer3/CombatPlayer/Job/CharacterSkill.get_child(3).power) * 6)
		emit_signal("Player_Turn_Over")
		$Player_actions.hide()
		await get_tree().create_timer(0.5).timeout
		MonsterTurn()
	else:
		showText("Not enough MP for Skill")

func monCombat_canHeal(monPath, monAtk, monMP, monHP, skillA, skillB, maxHP):
	if skillB.targetable == true and $VBoxContainer/MonsterA/Job/Stats.get_hp() < maxHpMonA/2 and $VBoxContainer.visible == true:
		if $VBoxContainer4.visible == false:
			$VBoxContainer/MonsterA.healing(skillB.healing/4)
			showText(monPath.monName + " cast " + skillB.name)
			monPath.skillUsed(skillB.mpCost)
		else:
			$VBoxContainer/MonsterA.healing(skillB.healing)
			showText(monPath.monName + " cast " + skillB.name)
			monPath.skillUsed(skillB.mpCost)
	elif monHP <  maxHP/2 and monMP >= skillB.mpCost :
		monPath.healing(skillB.healing)
		showText(monPath.monName + " cast " + skillB.name)
		monPath.skillUsed(skillB.mpCost)
		if skillB.power > 0:
			if guarding == true:
				$VBoxContainer3/CombatPlayer.DmgTakenPhys((monAtk * skillB.power) / 2)
			else:
				$VBoxContainer3/CombatPlayer.DmgTakenPhys(monAtk * skillB.power)
	else:
		showText(monPath.monName + " cast " + skillA.name)
		if guarding == true:
			$VBoxContainer3/CombatPlayer.DmgTakenPhys((monAtk * skillA.power) / 2)
		else:
			$VBoxContainer3/CombatPlayer.DmgTakenPhys(monAtk * skillA.power)
		monPath.skillUsed(skillA.mpCost)

func monCombat_noHeal(monPath, monAtk, monMP, monHP, skillA, skillB):
	randomize()
	var rng = randf_range(10,300) 
	if rng > 150 and monMP >= skillB.mpCost :
		showText(monPath.monName + " cast " + skillB.name)
		monPath.skillUsed(skillB.mpCost)
		if guarding == true:
			$VBoxContainer3/CombatPlayer.DmgTakenPhys((monAtk * skillB.power) / 2)
		else:
			$VBoxContainer3/CombatPlayer.DmgTakenPhys(monAtk * skillB.power)
	else:
		showText(monPath.monName + " cast " + skillA.name)
		if guarding == true:
			$VBoxContainer3/CombatPlayer.DmgTakenPhys((monAtk * skillA.power) / 2)
		else:
			$VBoxContainer3/CombatPlayer.DmgTakenPhys(monAtk * skillA.power)
		monPath.skillUsed(skillA.mpCost)

func MonsterTurn():
	if $VBoxContainer.visible == true:
		$Textbox.hide()
		var skillAtk =$VBoxContainer/MonsterA/Job/CharacterSkill.get_child(0)
		var skillHeal =$VBoxContainer/MonsterA/Job/CharacterSkill.get_child(1)
		var monAtk = $VBoxContainer/MonsterA/Job/Stats.get_atk()
		var monMP = $VBoxContainer/MonsterA/Job/Stats.get_mp()
		var monHP = $VBoxContainer/MonsterA/Job/Stats.get_hp()
		if skillHeal.healing > 0:
			monCombat_canHeal($VBoxContainer/MonsterA, monAtk, monMP, monHP,skillAtk, skillHeal, maxHpMonA )
		else:
			monCombat_noHeal($VBoxContainer/MonsterA, monAtk, monMP, monHP,skillAtk, skillHeal )
	await get_tree().create_timer(1).timeout
	MonsterBTurn()

func MonsterBTurn():
	if $VBoxContainer4.visible == false and $VBoxContainer2.visible == true:
		showText("Rise my Minions and fight for me!")
		$VBoxContainer4/MonsterC.healing(30)
		$VBoxContainer4.show()
	elif $VBoxContainer2.visible == true:
		$Textbox.hide()
		var skillAtk =$VBoxContainer2/MonsterB/Job/CharacterSkill.get_child(0)
		var skillHeal =$VBoxContainer2/MonsterB/Job/CharacterSkill.get_child(1)
		var monAtk = $VBoxContainer2/MonsterB/Job/Stats.get_atk()
		var monMP = $VBoxContainer2/MonsterB/Job/Stats.get_mp()
		var monHP = $VBoxContainer2/MonsterB/Job/Stats.get_hp()
		if skillHeal.healing > 0:
			if $VBoxContainer4.visible == false:
				monCombat_canHeal($VBoxContainer2/MonsterB, monAtk/2, monMP, monHP,skillAtk, skillHeal, maxHPMonB )
			else:
				monCombat_canHeal($VBoxContainer2/MonsterB, monAtk, monMP, monHP,skillAtk, skillHeal, maxHPMonB )
		else:
			monCombat_noHeal($VBoxContainer2/MonsterB, monAtk, monMP, monHP,skillAtk, skillHeal )
	await get_tree().create_timer(1).timeout
	MonsterCTurn()

func MonsterCTurn():
	if $VBoxContainer2.visible == true:
		$Textbox.hide()
		var skillAtk =$VBoxContainer4/MonsterC/Job/CharacterSkill.get_child(0)
		var skillHeal =$VBoxContainer4/MonsterC/Job/CharacterSkill.get_child(1)
		var monAtk = $VBoxContainer4/MonsterC/Job/Stats.get_atk()
		var monMP = $VBoxContainer4/MonsterC/Job/Stats.get_mp()
		var monHP = $VBoxContainer4/MonsterC/Job/Stats.get_hp()
		if skillHeal.healing > 0:
			monCombat_canHeal($VBoxContainer4/MonsterC, monAtk, monMP, monHP,skillAtk, skillHeal, maxHPMonC )
		else:
			monCombat_noHeal($VBoxContainer4/MonsterC, monAtk, monMP, monHP,skillAtk, skillHeal )
	await get_tree().create_timer(1).timeout
	guarding = false
	$Player_actions.show()

func _on_attacks_pressed():
	if $Player_actions/HBoxContainer/HBoxContainer3.visible:
		$Player_actions/HBoxContainer/HBoxContainer3.hide()
	else :
		$Player_actions/HBoxContainer/HBoxContainer3.show()


func _on_monster_a_died(BaseFighterMonster):
	if $VBoxContainer2.visible == false:
		$VBoxContainer.hide()
		$VBoxContainer4.hide()
	else:
		$VBoxContainer/MonsterA.healing(10)
		showText("Somthing is preventing you from salying the spirit")

func _on_monster_b_died(BaseFighterMonster):
	$VBoxContainer2.hide()
	target=$VBoxContainer/MonsterA

#game over
func _on_combat_player_died(BaseFighter):
	get_parent().get_parent().NextScene("res://Scenes/reusables/game_over.tscn")


func _on_monster_c_died(BaseFighterMonster):
	$VBoxContainer4.hide()
	target=$VBoxContainer/MonsterA


func _on_mon_a_mouse_entered():
	if $VBoxContainer.visible:
		target = $VBoxContainer/MonsterA


func _on_mon_b_mouse_entered():
	if $VBoxContainer2.visible:
		target = $VBoxContainer2/MonsterB

func _on_mon_c_2_mouse_entered():
	if $VBoxContainer4.visible:
		target = $VBoxContainer4/MonsterC
