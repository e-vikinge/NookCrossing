extends Node2D

onready var dialogue_path = "Ch01_Stage01_Dialog01_Tortimer.json"
onready var mail_path = "Ch01_Stage01_Mail01.json"
onready var tomNook = get_node("YSort/TomNook")


var dialogBox_root = preload("res://UI/Control.tscn")
var mail_root = preload("res://UI/MailControl.tscn")

func _ready() -> void:
	
#	tomNook.position = Vector2(1058, 167)
	tomNook.get_node("AnimationPlayer").play("IdleDown")
	Global.current_mail = mail_path
	Global.current_dialog = dialogue_path
#	if Global.masterMusicPlayingCH == 1:
#		pass
#	if Global.masterMusicPlayingCH != 1:
#		Global.current_song("MusicGameCube3AM")
#
#	if Global.sceneTransitionCH == 1:
#		pass
#	if Global.sceneTransitionCH != 1:
#		Global.sceneTransitionAnimation("FadeInLong")

	tomNook.connect("mail_ready", self, "_on_TomNooK_mail_ready")

	tomNook.get_node("AnimationPlayer").play("IdleDown")

	pass
	


#func _on_Timer_timeout() -> void:
#	if Global.chapterIntroTextCH <= 1:
#		Global.chapterIntroText("CanvasLayer/ChapterOne")
#	else:
#		pass
#
#func _on_Timer2_timeout() -> void:
#	if Global.chapterIntroTextCH <= 1:
#		Global.get_node("ChapterTextDisplay").queue_free()
#		Global.chapterIntroTextCH += 1
#	else:
#		pass

func _on_DialogueUI_dialogue_finished():
	print ("ok")
	
func _on_TomNooK_mail_ready():
	Global_Mail.ch1_mailready = true
	
