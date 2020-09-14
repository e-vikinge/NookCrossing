extends Area2D

export (String, FILE, "*.tscn") var target_stage

func _ready() -> void:
	pass 

func _on_EnterBuilding_body_entered(body: Node):
	if "TomNook" in body.name:
		Global.playeroutside_pos = get_tree().get_root().get_node("World/YSort/TomNook").get_position()
		Global.playeroutside_pos += Vector2(0, 5)
		Global.player_isoutside = false
		Global.player_roomTransfer = false
		Global.goto_scene(target_stage)

