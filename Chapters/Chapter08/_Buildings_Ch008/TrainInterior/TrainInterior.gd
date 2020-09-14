extends Node2D

onready var dialogue_path = "Ch01_Stage01_Dialog01_Rover.json"
onready var mail_path = "Ch01_Stage01_Mail01.json"
onready var tomNook = get_node("YSort/TomNook")


var dialogBox_root = preload("res://UI/Control.tscn")
var mail_root = preload("res://UI/MailControl.tscn")

func _ready() -> void:
	
	
	Global.current_mail = mail_path
	Global.current_dialog = dialogue_path
	if Global.masterMusicPlayingCH == 1:
		pass
	if Global.masterMusicPlayingCH != 1:
		Global.current_song("MusicGameCube3AM")
		
	if Global.sceneTransitionCH == 1:
		pass
	if Global.sceneTransitionCH <= 1:
		Global.sceneTransitionAnimation("FadeInLong")
		tomNook.position = Vector2(109, 93)
		Global.sceneTransitionCH += 1
	
	else:
		tomNook.position = Vector2(272, 160)
		
	print(Global.sceneTransitionCH)
	tomNook.connect("mail_ready", self, "_on_TomNooK_mail_ready")
	
	tomNook.get_node("AnimationPlayer").play("IdleRight")
	
	
		
	


func _on_Timer_timeout() -> void:
	if Global.chapterIntroTextCH <= 1:
		Global.chapterIntroText("CanvasLayer/ChapterOne")
		print("today is")
	else:
		pass
		
func _on_Timer2_timeout() -> void:
	if Global.chapterIntroTextCH <= 1:
		Global.get_node("ChapterTextDisplay").queue_free()
		Global.chapterIntroTextCH += 1
	else:
		pass


