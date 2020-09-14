extends RichTextLabel

onready var Timer = get_tree().get_root().get_node("DialogueUI/Timer")


func _ready():
	Timer.set_wait_time(.1) # time between letters


func _dialogue( string ):
	for letter in string:
		Timer.start()
		self.add_text( letter )
		yield(Timer, "timeout")
