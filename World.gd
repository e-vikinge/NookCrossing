extends Node2D

var doors_dict = {
	
	AirportExteriorDoorHitBox = {
		"destination": "res://Buildings/AirportInterior.tscn",
		"exit_door": "AirportInteriorDoorHitBox"
	},
	
	AirportInteriorDoorHitBox = {
		"destination": "res://Buildings/DoorHitBox.tscn",
		"exit_door": "AirportExteriorDoorHitBox"
	}
}

func _ready() -> void:
	pass # Replace with function body.

func on_player_entered_door(doorname):
	#Transition the scene by first deloading the current_scene child
	$current_scene.get_child(0).queue_free()
	#Then loading your corresponding other scene. 
	var new_scene = doors_dict[doorname]["destination"]
	Global.load_scene(new_scene)
	#And after the scene has loaded, move the player to the corresponding door spawn
	$Player.position = $current_scene.get_child(doors_dict[doorname]["exit_door"]).position
