extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func NextScene (scene):
	$FadeToBlack.show()
	$FadeToBlack.toBlack()
	await get_tree().create_timer(1).timeout
	$CurScene.get_child(0).queue_free()
	$CurScene.add_child(load(scene).instantiate())


func _on_fade_to_black_hide_me():
	$FadeToBlack.hide()
