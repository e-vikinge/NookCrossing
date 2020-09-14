extends KinematicBody2D

signal fade_out
signal mail_ready
signal mail_finished

var _dialog = null
var _mail = null
var _nextChPrompt = null
var looking_direction = null
var active_movement = true
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
onready var is_outside = Global.player_isoutside
var is_walking = false

const ACCELERATION = 500
const MAX_SPEED = 50
const FRICTION = 1000
const ROLL_SPEED = 125

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree

func _ready():
	if is_outside == true:
		position = Global.playeroutside_pos
	else:
		position = Global.playerinside_pos
		remove_child($Camera2D)
		pass


func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO && active_movement == true:
		is_walking = true
		if input_vector.x > 0:
			animationPlayer.play("WalkRight")
			looking_direction = "Right"
		elif input_vector.x < 0:
			animationPlayer.play("WalkLeft")
			looking_direction = "Left"
		elif input_vector.y > 0:
			animationPlayer.play("WalkDown")
			looking_direction = "Down"
		elif input_vector.y < 0:
			animationPlayer.play("WalkUp")
			looking_direction = "Up"
#		else:
#			animationPlayer.play("WalkLeft")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:
		if looking_direction == "Right":
			animationPlayer.play("IdleRight")
		elif looking_direction == "Left":
			animationPlayer.play("IdleLeft")
		elif looking_direction == "Up":
			animationPlayer.play("IdleUp")
		elif looking_direction == "Down":
			animationPlayer.play("IdleDown")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
	
func _on_DialogTrig_dialog_started() -> void:
	var dialog = get_tree().get_root().get_node("World").dialogBox_root
	print("dialogstarted")
	_dialog = dialog.instance()
	var hitboxdialog = get_tree().get_root().get_node("World/Dialog/DialogTrig")
	hitboxdialog.turn_off()
	hitboxdialog.remove_dialogbox()
	get_tree().get_root().get_node("World/Dialog").add_child(_dialog)
	_dialog.find_node("DialogueUI").connect("dialogue_finished", self, "_on_DialogueUI_dialogue_finished")
	pass 

func _on_DialogueUI_dialogue_finished():
	emit_signal("mail_ready")
	emit_signal("fade_out")
	active_movement = true
	


func _on_MailReadyArea_mail_started() -> void:
	$NookPressE.hide()
	var mail = get_tree().get_root().get_node("World").mail_root
	_mail = mail.instance()
	get_tree().get_root().get_node("World").add_child(_mail)
	_mail.find_node("Mail").connect("mail_finished", self, "_on_Mail_mail_finished")
	pass # Replace with function body.

func _on_Mail_mail_finished():
	emit_signal("mail_finished")
	active_movement = true


func _on_NextChPrompt_nextCh_prompt() -> void:
	var nextCh_prompt = get_tree().get_root().get_node("World").nextChPrompt_root
	_nextChPrompt = nextCh_prompt.instance()
	get_tree().get_root().get_node("World").add_child(_nextChPrompt)
	_nextChPrompt.find_node("DialogueUI").connect("nextChPrompt_finished", self, "_on_DialogueUI_nextChPrompt_finished")
	_nextChPrompt.find_node("DialogueUI").connect("nextChPrompt_notFinished", self, "_on_DialogueUI_nextChPrompt_notFinished")
	pass # Replace with function body.

func _on_DialogueUI_nextChPrompt_finished():
	emit_signal("fade_out")
	
func _on_DialogueUI_nextChPrompt_notFinished():
	active_movement = true
	pass


func _on_RoverDialogTrig_dialog_started() -> void:
	pass # Replace with function body.



func _on_Raymond_walking_finished() -> void:
	pass # Replace with function body.
