extends Node2D

onready var dialogue_path = "Ch03_Stage01_Dialog01_Tortimer.json"
onready var mail_path = "Ch01_Stage01_Mail01.json"
onready var tomNook = get_node("YSort/TomNook")


var dialogBox_root = preload("res://UI/Control.tscn")
var mail_root = preload("res://UI/MailControl.tscn")

func _ready() -> void:
	
	Global.current_mail = mail_path
	Global.current_dialog = dialogue_path
	if Global.masterMusicPlayingCH == 3:
		pass
	if Global.masterMusicPlayingCH != 3:
		Global.current_song("MusicGameCube4AM")
#
#	if Global.sceneTransitionCH == 2:
#		pass
	if Global.sceneTransitionCH == 3:
		tomNook.position = Vector2(944, 197)
		get_node("Intro/SceneTransition/AnimationPlayer").play("FadeInLong")
		Global.chapterIntroText("CanvasLayer/ChapterThree")
		Global.sceneTransitionCH = 4
		
	else:
		get_node("Intro").queue_free()

	tomNook.connect("mail_ready", self, "_on_TomNooK_mail_ready")
	tomNook.get_node("AnimationPlayer").play("IdleDown")
	

func _on_Timer_timeout() -> void:
#	if Global.chapterIntroTextCH == 3:
#		Global.chapterIntroText("CanvasLayer/ChapterThree")
#	else:
		pass

func _on_Timer2_timeout() -> void:
	if Global.chapterIntroTextCH == 3:
		Global.get_node("ChapterTextDisplay").queue_free()
		Global.chapterIntroTextCH = 4
	else:
		pass

func _on_DialogueUI_dialogue_finished():
	print ("ok")
	
func _on_TomNooK_mail_ready():
	Global_Mail.ch1_mailready = true
	
