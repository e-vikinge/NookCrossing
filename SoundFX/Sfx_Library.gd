extends Node2D

func _play(sfx = null):
	if sfx:
		get_node(sfx).stream_paused = false
		get_node(sfx).play()
		
func _stop(sfx = null):
	if sfx:
		get_node(sfx).stream_paused = true

