extends Node2D


onready var tomNook = get_node("YSort/TomNook")

func _ready() -> void:
	tomNook.position = Vector2(160, 165)
	pass 
