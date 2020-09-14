extends Node2D

onready var dialogue_path = "Ch00_Stage01_Dialog01_Isabelle.json"
onready var sceneTransition = get_node("SceneTransition/AnimationPlayer")

var dialogBox_root = preload("res://UI/Control.tscn")

func _ready() -> void:
	Global.current_dialog = dialogue_path
	sceneTransition.play("FadeIn")
	get_node("Sfx_Library")._play("OceanWaves")
	pass 
