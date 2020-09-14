extends Control

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var isabelleTextBox = $IsabelleNameBox/IsabelleNameBoxLabel
onready var richTextlabel = $RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	print (x.name)
	richTextlabel.connect("hide_textbox", self, "_on_hide_textbox")
	richTextlabel.connect("show_textbox", self, "_on_show_textbox")

	pass # Replace with function body.

func _on_hide_textbox():
	isabelleTextBox.hide()
	
func _on_show_textbox():
	isabelleTextBox.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
