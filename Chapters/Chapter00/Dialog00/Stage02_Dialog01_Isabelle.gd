extends RichTextLabel


onready var isabelle_namebox_label = get_tree().get_root().get_node("IsabelleNameBox")
onready var orville_namebox_label = get_tree().get_root().get_node("DiaologeBox/OrvilleNameBox")

signal show_textbox
signal hide_textbox
signal dialogue_finished
var dialog_finished = false
var isabelle_talking = true
var isabelle_dialog1 = [
	"Ok Tom, joke's over!",
	"I bet Orville won't even let you leave!",
	"placeholder1"
	]
	
var orville_dialog1 = [
	"Placeholder2",
	"Well, actually, if Tom wants to leave he can leave. I'm sorry Isabelle.",
	"However, it looks like we have some storms rolling in, so it's going to be a while for the next plane to come in.",
	"placeholder2a"
]

var isabelle_dialog2 = [
	"Hmmm. What are the odds? It will give Tom some more time to think things over now.",
	"placeholder3",
#	"placeholder3b",
#	"Hmmm. What are the odds? It will give Tom some more time to think things over now."
]

var orrville_dialog2 = [
	"Testing"
	
]
var page = 0

func _ready() -> void:
#	set_bbcode(dialog[page])
#	set_visible_characters(0)
	set_process_input(false)
	
func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < isabelle_dialog1.size()-1 && isabelle_talking == true:
				page += 1
				set_bbcode(isabelle_dialog1[page])
				set_visible_characters(0)
				
				if page == isabelle_dialog1.size()-1:
#					page += 1
					isabelle_talking = false
					reset_bbcode_toOrville()
					
			if page < orville_dialog1.size()-1 && isabelle_talking == false:
				emit_signal("hide_textbox")
				page += 1
				set_bbcode(orville_dialog1[page])
				set_visible_characters(0)
				if page == orville_dialog1.size()-1:
					emit_signal("show_textbox")
					isabelle_dialog1 = isabelle_dialog2
					isabelle_talking = true
					reset_bbcode_toIsabelle()
#					dialog_finished = true
				
			if dialog_finished == true && isabelle_talking == false:
				emit_signal("dialogue_finished")
				get_parent().queue_free()
				
		elif get_visible_characters() < get_total_character_count():
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout() -> void:
	set_visible_characters(get_visible_characters()+1)

func dialogue_finished():
	pass
	
func turn_on():
	set_bbcode(isabelle_dialog1[page])
	set_visible_characters(0)
	set_process_input(true)
	
func reset_bbcode_toOrville():
	page = 0
	set_bbcode(orville_dialog1[page])
	
func reset_bbcode_toIsabelle():
	page = 0
	set_bbcode(isabelle_dialog1[page])
	
