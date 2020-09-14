extends PathFollow2D
onready var tortimer = get_tree().get_root().get_node("World/YSort/Tortimer")

#func _ready() -> void:
#	set_process(false)
#	set_physics_process(false)

func _process(_delta: float) -> void:
	if get_offset() >= 220.0:
		tortimer.turn_off()
		set_process(false)
		pass 
#
#func turn_on():
#	set_process(true)
#	set_physics_process(true)
#
#

