extends Control

signal Textbox_closed
signal Player_Turn_Over
var tempPlayerName = "Nameless"
@onready var tempItem = "Hermit's Ointment"
@onready var itemHealing = 20
var guarding = false
var item_Uses = 3
var monHealCD = 0
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
	showText("Monsters Appeared")
	await self.Textbox_closed
	$Player_actions.show()

func _input(event):
	if ((Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and $Textbox.visible ):
		$Textbox.hide()
		emit_signal("Textbox_closed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $VBoxContainer.visible == false:
		PlayerChange.setBoss_Greed(true)
		get_parent().get_parent().NextScene(Encounters.get_cur_scene())


func showText(text):
	$Textbox.show()
	$Textbox/TextBoxText.text = text



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
	if PlayerChange.getinBossFight() == false:
		showText(tempPlayerName +" Can not flee ")
		#get_tree().change_scene_to_file(Encounters.get_cur_scene())
	else:
		showText("Can not flee from this fight")


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


func MonsterTurn():
	if $VBoxContainer.visible == true:
		$Textbox.hide()
		var skillAtk =$VBoxContainer/MonsterA/Job/CharacterSkill.get_child(0)
		var skillHeal =$VBoxContainer/MonsterA/Job/CharacterSkill.get_child(1)
		var skillMag = $VBoxContainer/MonsterA/Job/CharacterSkill.get_child(2)
		var monAtk = $VBoxContainer/MonsterA/Job/Stats.get_atk()
		var monMag = $VBoxContainer/MonsterA/Job/Stats.get_mAtk()
		var monMP = $VBoxContainer/MonsterA/Job/Stats.get_mp()
		var monHP = $VBoxContainer/MonsterA/Job/Stats.get_hp()
		if monHP <  $VBoxContainer/MonsterA/Bars/HP.max_value/2 and monMP >= skillHeal.mpCost and monHealCD == 0:
			$VBoxContainer/MonsterA.healing(skillHeal.healing)
			showText($VBoxContainer/MonsterA.monName + " cast " + skillHeal.name)
			await get_tree().create_timer(1).timeout
			$VBoxContainer/MonsterA.skillUsed(skillHeal.mpCost)
			monHealCD = 2
			if skillHeal.power > 0:
				if guarding == true:
					$VBoxContainer3/CombatPlayer.DmgTakenPhys((monAtk * skillHeal.power) / 2)
				else:
					$VBoxContainer3/CombatPlayer.DmgTakenPhys(monAtk * skillHeal.power)
		else:
			randomize()
			var rng = randf_range(10,300) 
			if rng < 180:
				showText($VBoxContainer/MonsterA.name + " cast " + skillAtk.name)
				await get_tree().create_timer(2).timeout
				if guarding == true:
					$VBoxContainer3/CombatPlayer.DmgTakenPhys((monAtk * skillAtk.power) / 2)
				else:
					$VBoxContainer3/CombatPlayer.DmgTakenPhys(monAtk * skillAtk.power)
				$VBoxContainer/MonsterA.skillUsed(skillAtk.mpCost)
				if monHealCD > 0:
					monHealCD -= 1
			else:
				showText($VBoxContainer/MonsterA.name + " cast " + skillMag.name)
				await get_tree().create_timer(1).timeout
				if guarding == true:
					if PlayerChange.getGreedMechanic() == true:
						$VBoxContainer3/CombatPlayer.DmgTakenPhys(((monMag * skillMag.power) / 2) + 10)
					else:
						$VBoxContainer3/CombatPlayer.DmgTakenPhys((monMag * skillMag.power) / 2)
				else:
					if PlayerChange.getGreedMechanic() == true:
						$VBoxContainer3/CombatPlayer.DmgTakenPhys((monMag * skillMag.power) + 10)
					else:
						$VBoxContainer3/CombatPlayer.DmgTakenPhys(monMag * skillMag.power)
				$VBoxContainer/MonsterA.skillUsed(skillMag.mpCost)
				if monHealCD > 0:
					monHealCD -= 1
	await get_tree().create_timer(1).timeout
	$Player_actions.show()


func _on_area_2d_mouse_entered():
	if $VBoxContainer.visible:
		target = $VBoxContainer/MonsterA

func _on_attacks_pressed():
	if $Player_actions/HBoxContainer/HBoxContainer3.visible:
		$Player_actions/HBoxContainer/HBoxContainer3.hide()
	else :
		$Player_actions/HBoxContainer/HBoxContainer3.show()


func _on_monster_a_died(BaseFighterMonster):
	$VBoxContainer.hide()


#game over
func _on_combat_player_died(BaseFighter):
	get_parent().get_parent().NextScene("res://Scenes/reusables/game_over.tscn")
