extends Node2D

onready var tomNook = get_node("YSort/TomNook")
onready var _sceneTransition = preload("res://Events/SceneTransition.tscn")
var nextChPrompt_root = preload("res://UI/NextChapterPromptControl.tscn")
var dialogBox_root = preload("res://UI/Control.tscn")

func _ready() -> void:
	tomNook.position = Vector2(128, 162)
	
	tomNook.connect("mail_ready", self, "_on_TomNook_mail_ready")
	tomNook.connect("mail_finished", self, "_on_TomNook_mail_finished")
#	tomNook.connect("nextCh_prompt", self, "_on_TomNook_nextCh_prompt")
	
	tomNook.connect("fade_out", self, "_on_TomNook_fade_out")
	
	pass 

func _on_TomNook_fade_out():
	print("success")
	var sceneTransition = _sceneTransition.instance()
	add_child(sceneTransition)
	sceneTransition.get_node("AnimationPlayer").connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")
	sceneTransition.get_node("AnimationPlayer").play("FadeOut")
	
func _on_AnimationPlayer_animation_finished(_anim_name: String):
	Global.goto_scene("res://Chapters/Chapter09/Chapter009.tscn")
	Global.stop_song("MusicGameCube6PM")
	Global.player_isoutside = true
	
