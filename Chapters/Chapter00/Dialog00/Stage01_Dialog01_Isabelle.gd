extends RichTextLabel

var dialog_complete = false
signal dialogue_finished
var dialog = [
	"Hey Tom, nice to see you at the beach!", 
	"Decent pile of luggage over there. Looks like someone has a little bit of lifting to do.",
	"That's interesting... I don't see anyone else around. You wouldn't be going somewhere, would you?",
	"You're WHAT?!",
	"But, who will oversee the island?",
	"Me? All by myself? I'm not so sure that's the best idea...",
	"Perhaps you aren't feeling well from the sun. Let's go back to Resident Services and have some afternoon tea."
	]
var page = 0

func _ready() -> void:
#	set_bbcode(dialog[page])
#	set_visible_characters(0)
	set_process_input(false)
	
func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
				
			else:
				emit_signal("dialogue_finished")
				get_parent().queue_free()
				
		elif get_visible_characters() < get_total_character_count():
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout() -> void:
	set_visible_characters(get_visible_characters()+1)

func dialogue_finished():
	pass
	
func turn_on():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	
