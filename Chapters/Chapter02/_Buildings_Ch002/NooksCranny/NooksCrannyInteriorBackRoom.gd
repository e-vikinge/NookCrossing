extends Node2D

onready var tomNook = get_node("YSort/TomNook")

func _ready() -> void:
	tomNook.position = Vector2(128, 162)
	pass 
