extends Area2D

onready var _tomNookWalkingSFX = get_tree().get_root().get_node("World/Sfx_Library")
onready var tomNook = get_tree().get_root().get_node("World/YSort/TomNook")

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if "TomNook" in body.name:
			if Input.is_action_just_pressed("ui_right") || Input.is_action_just_pressed("ui_left") || Input.is_action_just_pressed("ui_up") || Input.is_action_just_pressed("ui_down"):
				_tomNookWalkingSFX._play("DoorFootSteps")
				print("walking")
			if Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down"):
				_tomNookWalkingSFX._stop("DoorFootSteps")

func _on_DockWalkingSoundFX_body_exited(body: Node) -> void:
	_tomNookWalkingSFX._stop("DoorFootSteps")
	pass


func _on_DockWalkingSoundFX_body_entered(body: Node) -> void:
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
		_tomNookWalkingSFX._play("DoorFootSteps")
	pass 
