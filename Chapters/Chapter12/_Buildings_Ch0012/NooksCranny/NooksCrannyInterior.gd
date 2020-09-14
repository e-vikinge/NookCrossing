extends Node2D

onready var tomNook = get_node("YSort/TomNook")

func _ready() -> void:
	if Global.player_isoutside == false && Global.player_roomTransfer == false:
		tomNook.position = Vector2(161, 155)
		
	elif Global.player_isoutside == false && Global.player_roomTransfer == true:
		tomNook.position = Vector2(130, 68)
		tomNook.get_node("AnimationPlayer").play("IdleDown")
	pass 
