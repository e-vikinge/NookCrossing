extends Area2D

export (String, FILE, "*.tscn") var target_stage

func _ready() -> void:
	pass 

func _on_EnterBuilding_body_entered(body: Node):
	if "TomNook" in body.name:
		Global.playerinside_pos = get_tree().get_root().get_node("World/YSort/TomNook").get_position()
		Global.playerinside_pos -= Vector2(0, 20)
		print (Global.playerinside_pos)
		Global.player_isoutside = true
		Global.goto_scene(target_stage)
		


