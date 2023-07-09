extends Node
class_name BaseFighterMonster

signal died(BaseFighterMonster)
signal tookDamange(BaseFighterMonster)

@export var monName : String
@export var stats: Resource
@onready var drops := $Drops
@onready var actions = $Actions
@onready var bars = $Bars
@onready var skills = $CharacterSkill

var selected: bool = false 
var selectable: bool = false 
var display_name: String


func initialize():
	actions.initialize(skills.get_children())
	stats = stats.copy()
	$Bars/HP.max_value = stats.max_HP
	$Bars/MP.max_value = stats.max_Mp
	$Bars/HP.value = stats.max_HP
	$Bars/MP.value = stats.max_Mp
	stats.connect("health_depleted", self._on_health_depleted())

func skillUsed(cost : int):
	$Job/Stats.mp_spent(cost)
	$Bars/MP.value = $Job/Stats.get_mp()

func DmgTakenPhys(attack : int):
	$Job/Stats.DmgTakenPhys(attack)
	$Bars/HP.value =  $Job/Stats.get_hp()
	emit_signal("tookDamange")
	if $Job/Stats.get_hp() <= 0:
		emit_signal("died", self)

func DmgTakenMag(attack : int):
	$Job/Stats.DmgTakenMag(attack)
	$Bars/HP.value =  $Job/Stats.get_hp()
	emit_signal("tookDamange")
	if $Job/Stats.get_hp() <= 0:
		emit_signal("died", self)

func healing(heal : int):
	$Job/Stats.healing(heal)
	$Bars/HP.value =  $Job/Stats.get_hp()

func _on_health_depleted():
	selectable = false
	
	emit_signal("died", self)
