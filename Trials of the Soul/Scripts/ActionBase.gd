extends Node

class_name ActionBase

var initialized = false

# Since Actions can be instanced by code (ie skills) these
# actions doesn't have an owner, that's why we get the owner
# from it's parent (BattlerActions.gd)
@onready var actor: BaseFighter = get_parent().get_owner()

#@export var icon : Texture = load("res://assets/sprites/icons/slash.png")
@export var description: String = "Base combat action"


func initialize(combatant: BaseFighter) -> void:
	actor = combatant
	initialized = true
