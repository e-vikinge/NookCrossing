extends Node2D

#var dialogue_master = preload("res://UI/Dialogue.tscn")
onready var dialogue_path = "Ch00_Stage02_Dialog01_Isabelle.json"
onready var _dialogue = get_tree().get_root().get_node("World/YSort/TomNook")
onready var _sceneTransition = preload("res://Events/SceneTransition.tscn")

var dialogBox_root = preload("res://UI/Control.tscn")

func _ready() -> void:
	Global.player_isoutside = false
	Global.current_dialog = dialogue_path
	_dialogue.connect("fade_out", self, "_on_TomNook_fade_out")

	pass 

func _on_TomNook_fade_out():
	print("success")
	var sceneTransition = _sceneTransition.instance()
	add_child(sceneTransition)
	sceneTransition.get_node("AnimationPlayer").connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")
	sceneTransition.get_node("AnimationPlayer").play("FadeOut")
	
func _on_AnimationPlayer_animation_finished(anim_name: String):
	Global.goto_scene("res://_Buildings/TrainInterior/TrainInterior.tscn")
#	Global.player_isoutside = true
