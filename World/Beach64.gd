extends TileMap

var _timer = null
var delay = 1.0

var region_x = 0
var size = 64 * 8

func _ready():
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(delay)
	_timer.set_one_shot(false)
	_timer.start()
	
func _on_Timer_timeout():
#	delay = rand_range(0.5, 1.2)
#	_timer.set_wait_time(delay)
	region_x += 64
	region_x %= size
	tile_set.tile_set_region(1, Rect2(region_x, 0.0, 64.0, 64.0))
