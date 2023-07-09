extends CharacterBody2D


class_name player
var direction : Vector2 = Vector2()
var speed = 300
signal NewEncounter
@onready var tempPos
@onready var encounters_live 
@onready var encounterCD
@onready var inDungeon = false
var canMove = true


func  _ready():
	inDungeon = Encounters.get_inDungeon()
	randomize()
	tempPos = position
	position.x = Encounters.get_playerPosx()
	position.y = Encounters.get_playerPosy()

func read_input():
	if canMove == true:
		velocity = Vector2()
		encounters_live = Encounters.get_activeEncounters()
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = input_dir * speed
		if tempPos != position:
			tempPos = position
			if encounters_live == true and Encounters.encouterCDTimer() == true:
				var rng = randf_range(10,300) 
				if rng >= 250:
					Encounters.set_playerPos(position.x, position.y)
					emit_signal("NewEncounter")
	if $Camera2D/ConfirmDialog.visible == true:
		$Camera2D/ConfirmDialog.hide()
	
	if $Camera2D/TextBox.visible == true:
		$Camera2D/TextBox.hide()

func set_player_move(canI):
	canMove = canI

func get_player_move():
	return canMove

func _physics_process(delta):
	if canMove == true:
		read_input()
		move_and_collide(velocity * delta)


func _on_confirm_dialog_yes_pressed():
	$Camera2D/ConfirmDialog.hide()
	$Camera2D/TextBox.hide()


func _on_confirm_dialog_no_pressed():
	$Camera2D/ConfirmDialog.hide()
	$Camera2D/TextBox.hide()
