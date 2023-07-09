extends Node

signal SceneChanged
signal hideMe
func fromBlack():
	$AnimationPlayer.play("fade_to_norm")

func toBlack():
	$AnimationPlayer.play("fadeToblack")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeToblack":
		emit_signal("SceneChanged")
		fromBlack()
	if anim_name == "fade_to_norm":
		emit_signal("hideMe")
