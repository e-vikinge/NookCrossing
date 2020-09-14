extends Node2D

onready var dialogue_path = "Ch012_Stage01_Dialog01_Tortimer.json"
onready var mail_path = "Ch01_Stage01_Mail01.json"
onready var tomNook = get_node("YSort/TomNook")


var dialogBox_root = preload("res://UI/Control.tscn")
var mail_root = preload("res://UI/MailControl.tscn")

func _ready() -> void:
	
	Global.current_mail = mail_path
	Global.current_dialog = dialogue_path
#	if Global.masterMusicPlayingCH == 12:
#		pass
#	if Global.masterMusicPlayingCH != 12:
#		Global.current_song("MusicGameCube2PM")
##
#	if Global.sceneTransitionCH == 4:
#		pass
	if Global.sceneTransitionCH == 14:
		get_node("Intro/SceneTransition/AnimationPlayer").play("FadeInLong")
		Global.chapterIntroText("CanvasLayer/Thanks")
		Global.sceneTransitionCH = 15
		
	else:
		get_node("Intro").queue_free()

	

	

func _on_Timer_timeout() -> void:
#	if Global.chapterIntroTextCH == 12:
#		Global.chapterIntroText("CanvasLayer/ChapterTwelve")
#	else:
		pass

func _on_Timer2_timeout() -> void:
	if Global.chapterIntroTextCH == 14:
		Global.get_node("ChapterTextDisplay").queue_free()
		Global.chapterIntroTextCH = 15
	else:
		pass

func _on_DialogueUI_dialogue_finished():
	print ("ok")
	
func _on_TomNooK_mail_ready():
	Global_Mail.ch1_mailready = true
