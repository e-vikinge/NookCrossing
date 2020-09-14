extends Node2D

onready var dialogue_path = "Ch02_Stage01_Dialog01_Tortimer.json"
onready var mail_path = "Ch01_Stage01_Mail01.json"
onready var tomNook = get_node("YSort/TomNook")


var dialogBox_root = preload("res://UI/Control.tscn")
var mail_root = preload("res://UI/MailControl.tscn")

func _ready() -> void:
	
	Global.current_mail = mail_path
	Global.current_dialog = dialogue_path
	if Global.masterMusicPlayingCH == 2:
		pass
	if Global.masterMusicPlayingCH != 2:
		Global.current_song("MusicGameCube1AM")

#	if Global.sceneTransitionCH == 2:
#		pass
	if Global.sceneTransitionCH == 2:
		get_tree().get_root().get_node("World/Dialog/DialogTrig").turn_on()
		tomNook.position = Vector2(1015, 181)
		get_node("Intro/SceneTransition/AnimationPlayer").play("FadeInLong")
		Global.chapterIntroText("CanvasLayer/ChapterTwo")
		Global.sceneTransitionCH = 3
		
	else:
		get_node("Intro").queue_free()

	tomNook.connect("mail_ready", self, "_on_TomNooK_mail_ready")
	tomNook.get_node("AnimationPlayer").play("IdleDown")
	

func _on_Timer_timeout() -> void:
#	if Global.chapterIntroTextCH == 2:
#		Global.chapterIntroText("CanvasLayer/ChapterTwo")
#	else:
		pass

func _on_Timer2_timeout() -> void:
	if Global.chapterIntroTextCH == 2:
		Global.get_node("ChapterTextDisplay").queue_free()
		Global.chapterIntroTextCH = 3
	else:
		pass

func _on_DialogueUI_dialogue_finished():
	print ("ok")
	
func _on_TomNooK_mail_ready():
	Global_Mail.ch1_mailready = true
	
