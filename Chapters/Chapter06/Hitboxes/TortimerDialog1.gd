extends Area2D

onready var _tortimer = get_tree().get_root().get_node("World/YSort/Tortimer")
onready var _tomnook = get_tree().get_root().get_node("World/YSort/TomNook")
onready var _raymond = get_tree().get_root().get_node("World/YSort/Raymond")

signal dialog_started

func _process(_delta: float) -> void:
	if Global_Dialogues.ch6_dialoguefinished == false:
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if "TomNook" in body.name:
				_tomnook.active_movement = false
				_raymond.turn_on()
	if Global_Dialogues.ch6_dialoguefinished == true:
		turn_off()
	
func turn_off():
	set_process(false)
	print("off now")
	
func turn_on():
	set_process(true)
	print("on now")

func remove_dialogbox():
	queue_free()

func _on_Tortimer_walking_finished() -> void:
	_tortimer.turn_off()
	emit_signal("dialog_started")
	Global_Dialogues.ch6_dialoguefinished = true
	print("signal emitted")
	pass 

func _on_Raymond_walking_finished() -> void:
	_raymond.turn_off()
	emit_signal("dialog_started")
	Global_Dialogues.ch6_dialoguefinished = true
	print("signal emitted")
	pass 

