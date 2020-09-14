extends Area2D

onready var tomNook = get_tree().get_root().get_node("World/YSort/TomNook")
#onready var retrieve_mail = get_node("MailReadyArea")
#onready var mail_path = "Ch01_Stage01_Mail01.json"

#var mail_root = preload("res://UI/MailControl.tscn")

signal mail_started


func _ready() -> void:
	turn_off()
	
func _process(_delta: float) -> void:
#	var bodies = get_overlapping_bodies()
#	for body in bodies:
#		if "TomNook" in body.name:
#			tomNook.get_node("NookPressE").show()
#			if Input.is_action_just_pressed("ui_mail"):
#				tomNook.active_movement = false
#				emit_signal("mail_started")
#			if Global_Mail.ch1_mailfinished == true:
#				tomNook.get_node("NookPressE").hide()
#				turn_off()
	pass

func turn_off():
	set_process(false)
	
func turn_on():
#	connect("body_exited", self, "_on_MailReadyArea_body_exited")
	set_process(true)


func _on_MailReadyArea_body_exited(_body: Node) -> void:
	tomNook.get_node("NookPressE").hide()
	pass # Replace with function body.
