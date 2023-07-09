extends Node

signal  yesPressed
signal  noPressed
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_yes_pressed():
	emit_signal("yesPressed")


func _on_no_pressed():
	emit_signal("noPressed")
