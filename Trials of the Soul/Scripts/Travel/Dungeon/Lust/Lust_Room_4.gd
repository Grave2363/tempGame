extends Node

#leads to a bad end where the player falls and becomes a gold obsessed succubus
#only one chest will hold the key to the boss room
var chestsopened: int = 0
var keyGiven : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_chest_opened_chest():
	if keyGiven == false:
		PlayerChange.set_LustDoor(true)
		keyGiven == true
		PlayerChange.add_gold(300)
		chestsopened += 1
	else:
		PlayerChange.add_gold(300)
		chestsopened += 1
	if chestsopened == 3:
		pass
		#for bad end


func _on_chest_2_opened_chest():
	if keyGiven == false:
		PlayerChange.set_LustDoor(true)
		keyGiven == true
		PlayerChange.add_gold(300)
		chestsopened += 1
	else:
		PlayerChange.add_gold(300)
		chestsopened += 1
	if chestsopened == 3:
		pass
		#for bad end


func _on_chest_3_opened_chest():
	if keyGiven == false:
		PlayerChange.set_LustDoor(true)
		keyGiven == true
		PlayerChange.add_gold(300)
		chestsopened += 1
	else:
		PlayerChange.add_gold(300)
		chestsopened += 1
	if chestsopened == 3:
		pass
		#for bad end


func _on_chest_4_opened_chest():
	if keyGiven == false:
		PlayerChange.set_LustDoor(true)
		keyGiven == true
		PlayerChange.add_gold(300)
		chestsopened += 1
	else:
		PlayerChange.add_gold(300)
		chestsopened += 1
	if chestsopened == 3:
		pass
		#for bad end


func _on_encounterstart_body_entered(body):
	pass # Replace with function body.
	#make encounter for player
	#on victory she will open the door but give a warrning
