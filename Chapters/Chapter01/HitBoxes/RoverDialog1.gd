extends Area2D

onready var _rover = get_tree().get_root().get_node("World/YSort/Rover")
onready var _tomnook = get_tree().get_root().get_node("World/YSort/TomNook")


signal dialog_started

func _ready() -> void:
#	turn_off()
	pass


func _process(_delta: float) -> void:
	if Global_Dialogues.ch1_dialoguefinished == false:
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if "TomNook" in body.name:
				_tomnook.active_movement = false
				_rover.turn_on()
	if Global_Dialogues.ch1_dialoguefinished == true:
		turn_off()
	
func turn_off():
	set_process(false)
	print("off now")
	
func turn_on():
	set_process(true)
	print("on now")

func remove_dialogbox():
	queue_free()

func _on_Rover_walking_finished() -> void:
	_rover.turn_off()
	emit_signal("dialog_started")
#	Global_Dialogues.ch1_dialoguefinished = true
	print("signal emitted")
	pass 


func _on_Timer3_timeout() -> void:
	turn_on()
	pass # Replace with function body.
