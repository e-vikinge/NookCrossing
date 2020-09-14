extends Area2D

onready var _tomnook = get_tree().get_root().get_node("World/YSort/TomNook")

signal mail_started


func _process(_delta: float) -> void:
	if Global_Mail.ch1_mailfinished == false:
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if "TomNook" in body.name:
				_tomnook.active_movement = false
				emit_signal("mail_started")
	if Global_Mail.ch1_mailfinished == true:
		turn_off()


	
func turn_off():
	set_process(false)
	print("off now")
	
func turn_on():
	set_process(true)
	print("on now")

func remove_dialogbox():
	queue_free()

