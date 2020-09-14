extends Area2D

onready var _isabelle = get_tree().get_root().get_node("World/YSort/Isabelle")
onready var _tomnook = get_tree().get_root().get_node("World/YSort/TomNook")


signal dialog_started


func _process(_delta: float) -> void:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if "TomNook" in body.name:
			_tomnook.active_movement = false
			_isabelle.turn_on()
			
			
	
func turn_off():
	set_process(false)
	print("off now")
	
func turn_on():
	set_process(true)
	print("on now")

func remove_dialogbox():
	queue_free()

func _on_Isabelle_walking_finished() -> void:
	_isabelle.turn_off()
	emit_signal("dialog_started")
	pass 
