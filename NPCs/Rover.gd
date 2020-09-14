extends KinematicBody2D

var speed = 0.5
var move_direction = int(0)
var animation = null
var animation_direction = null

onready var path_follow = get_tree().get_root().get_node("World/YSort/Path2D/PathFollow2D")
signal walking_finished

func _ready() -> void:
	set_process(false)
	set_physics_process(false)
	pass
	
func _physics_process(delta: float) -> void:
	MovementLoop(delta)

	
func _process(_delta: float) -> void:
	AnimationLoop()
	
func MovementLoop(delta):
	var prepos = path_follow.get_global_position()
	path_follow.set_offset(path_follow.get_offset() + speed + delta)
	var pos = path_follow.get_global_position()
	move_direction = (pos.angle_to_point(prepos) / 3.14) * 180
	pass
	
func AnimationLoop():
	if move_direction != 0:
		if move_direction <= 15 and move_direction >= -15:
			animation_direction = "Right"
		elif move_direction <= 60 and move_direction >= 15:
			animation_direction = "Right"
		elif move_direction <= 120 and move_direction >= 60:
			animation_direction = "Down"
		elif move_direction <= -180 and move_direction >= 120:
			animation_direction = "Left"
		elif move_direction <= -60 and move_direction >= -15:
			animation_direction = "Right"
		elif move_direction >= -120 and move_direction <= -60:
			animation_direction = "Up"
		elif move_direction >= -165 and move_direction <= 165:
			animation_direction = "Left"
		elif move_direction >= -180 and move_direction <= 165:
			animation_direction = "Left"

		animation = "Walk" + str(animation_direction)
		$AnimationPlayer.play(animation)
		
	if move_direction == 0:
		animation = "Idle" + str(animation_direction)
		$AnimationPlayer.play(animation)
		emit_signal("walking_finished")

func turn_off():
	set_process(false)
	set_physics_process(false)
	pass
	
func turn_on():
	set_process(true)
	set_physics_process(true)
