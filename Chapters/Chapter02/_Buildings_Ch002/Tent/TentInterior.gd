extends Node2D

onready var dialogue_path = "Ch01_Stage01_Dialog01_Tortimer.json"
onready var mail_path = "Ch01_Stage01_Mail01.json"
onready var tomNook = get_node("YSort/TomNook")
onready var mailReadyArea = get_node("MailReadyArea")
onready var _sceneTransition = preload("res://Events/SceneTransition.tscn")

var nextChPrompt_root = preload("res://UI/NextChapterPromptControl.tscn")
var dialogBox_root = preload("res://UI/Control.tscn")
var mail_root = preload("res://UI/MailControl.tscn")


func _ready() -> void:
	if Global_Mail.ch1_mailready == true:
		mailReadyArea.turn_on()
		
	Global.current_mail = mail_path
		
	tomNook.connect("mail_ready", self, "_on_TomNook_mail_ready")
	tomNook.connect("mail_finished", self, "_on_TomNook_mail_finished")
#	tomNook.connect("nextCh_prompt", self, "_on_TomNook_nextCh_prompt")
	
	tomNook.connect("fade_out", self, "_on_TomNook_fade_out")
	
	tomNook.position = Vector2(161, 163)

	pass 


func _on_TomNook_mail_ready():
	Global_Mail.ch1_mailready = true
	
func _on_TomNook_mail_finished():
	Global_Mail.ch1_mailfinished = true


func _on_TomNook_fade_out():
	print("success")
	var sceneTransition = _sceneTransition.instance()
	add_child(sceneTransition)
	sceneTransition.get_node("AnimationPlayer").connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")
	sceneTransition.get_node("AnimationPlayer").play("FadeOut")
	
func _on_AnimationPlayer_animation_finished(_anim_name: String):
	Global.goto_scene("res://Chapters/Chapter03/Chapter003.tscn")
	Global.stop_song("MusicGameCube1AM")
	Global.player_isoutside = true
	
