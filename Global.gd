extends Node

var current_scene = null 
var current_dialog = null
var current_mail = null
var masterMusicPlayingCH = 0
var sceneTransitionCH = 1
var chapterIntroTextCH = 1
var chapter1_IntroTextCHdDelay = true

var playeroutside_pos = Vector2(601, 98)
var playerinside_pos = Vector2(152, 167)
var player_isoutside = false
var player_roomTransfer = false

onready var masterMusic = preload("res://SoundFX/Sfx_Library.tscn")
onready var sceneTransition = preload("res://Events/SceneTransition.tscn")
onready var chapterIntroTexts = preload("res://Events/ChapterTextDisplay.tscn")

func _ready() -> void:
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	pass

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)
	
func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

func current_song(songName):
	var _masterMusic = masterMusic.instance()
	add_child(_masterMusic)
	get_node("Sfx_Library")._play(songName)
	masterMusicPlayingCH += 1

func stop_song(songName):
	var _masterMusic = masterMusic.instance()
	add_child(_masterMusic)
	get_node("Sfx_Library")._stop(songName)

	
func sceneTransitionAnimation(transition):
	var _sceneTransition = sceneTransition.instance()
	add_child(_sceneTransition)
	get_node("SceneTransition/AnimationPlayer").play(transition)

	
func chapterIntroText(chapterNumber):
	var _chapterIntroText = chapterIntroTexts.instance()
	add_child(_chapterIntroText)
	var visibility = _chapterIntroText.get_node(chapterNumber)
	visibility.visible = true

#func remove_chapterIntroText():
#
