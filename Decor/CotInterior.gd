extends Area2D

onready var tomNook = get_tree().get_root().get_node("World/YSort/TomNook")

signal nextCh_prompt

var nextChPrompt_root = preload("res://UI/NextChapterPromptControl.tscn")
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if "TomNook" in body.name:
#			if Global_Mail.ch1_mailfinished == true:
			tomNook.get_node("NookPressEnter").show()
			if Input.is_action_just_pressed("ui_accept"):
				tomNook.active_movement = false
				emit_signal("nextCh_prompt")


func _on_NextChPrompt_body_exited(_body: Node) -> void:
	tomNook.get_node("NookPressEnter").hide()
	pass # Replace with function body.
