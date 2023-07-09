extends Node

@onready var isDead : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	isDead =  PlayerChange.getBoss_Sloth()
	if isDead == true:
		$AncientZyme.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
