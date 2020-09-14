extends Node2D


onready var tomNook = get_node("YSort/TomNook")

func _ready() -> void:
	tomNook.position = Vector2(0, 85)
	pass 
