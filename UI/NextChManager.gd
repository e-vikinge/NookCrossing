extends Panel

#---File---#
var file_name = "NextChapter.json"# You could pass a new file here on area body enter or whenever you feel like
var nodes # containes all the nodes of the current dialogue


#----DATA (from file)-----#
var curent_node_id = -1 # handles the current node we are traversing Note: -1 exits the dialogue
var curent_node_name # name of the speaker 
var curent_node_text # dialogue text
var curent_node_next_id # connect to the next node Note: ignored if curent_node_choices has things inside
var curent_node_choices = [] # If you want more than one possible answear, you should fill this up

var force = false # force start the dialogue
var random = false # Start from random node

#------UI--------#
onready var dialogueText = $DialogueText 
onready var dialoguePanel = self #Less rewritting if you want to move the script to another object
onready var dialogueName = $DialogueName
onready var dialogueButtons = [$Control/DialogueButton,$Control/DialogueButton2]

signal nextChPrompt_finished
signal nextChPrompt_notFinished


func _ready():
#	rand_seed(OS.get_unix_time())
	#----HERE FOR PREVIEW----#
	LoadFile(file_name)
	StartDialogue()


func LoadFile(fname):
	file_name = fname
	var file = File.new()
	if file.file_exists("res://Dialogues/"+file_name):
		file.open("res://Dialogues/" + file_name, file.READ)
		var json_result = parse_json(file.get_as_text())
		force = bool(json_result["Force"])
		random = bool(json_result["Random"])
		curent_node_id = 0
		nodes = json_result["Nodes"]

	else:
		print("Dialogue: File Open Error")
	file.close()
	if force:
		StartDialogue()
	
#-----Traversing Graph-----#
func StartDialogue():
	if nodes:
		if random:
			var temp = []
			for x in nodes:
				temp.append(x["id"])
			curent_node_id = temp[randi()%temp.size()]
		else:
			curent_node_id = 0
		HandleNode()
	else:
		print("Dialogue: Could not Find Nodes")

func EndDialogue():
	curent_node_id = -1

func NextNode(id):
	curent_node_id = id
	HandleNode()

#----Handle Current Node-----#
func HandleNode():
	if curent_node_id < 0 :
		emit_signal("nextChPrompt_notFinished")
		EndDialogue()
	else:
		if !GrabNode(curent_node_id):
			emit_signal("nextChPrompt_finished")
			EndDialogue()
	UpdateUI()
	
func GrabNode(id):
	for node in nodes:
		if int(node["id"]) == id:
			curent_node_name = node["name"]
			curent_node_text = node["text"]
			curent_node_next_id = int(node["next_id"])
			curent_node_choices = node["choices"]
			return true
	return false

#----Update UI-----#
func UpdateUI():
	if curent_node_id >= 0:
		dialoguePanel.show()
		for x in dialogueButtons:
			x.hide()
			#disconnect buttons
			if x.is_connected("pressed",self,"_on_Button_Pressed"):
				x.disconnect("pressed",self,"_on_Button_Pressed")
			
		dialogueName.text = curent_node_name
		dialogueText.text = curent_node_text
		if curent_node_choices.size() > 0:
			for x in clamp(curent_node_choices.size(),0,3):
				dialogueButtons[x].text = curent_node_choices[x]["text"]
				
				#connecto to button
				dialogueButtons[x].connect("pressed",self,"_on_Button_Pressed", [curent_node_choices[x]["next_id"]])
				
				dialogueButtons[x].show()
				
		else:
			dialogueButtons[0].text = ""
			dialogueButtons[0].show()
			#connect to the button
			dialogueButtons[0].connect("pressed",self,"_on_Button_Pressed", [curent_node_next_id])

	else:
		dialoguePanel.hide()
		

#-----On Button Pressed-----#
func _on_Button_Pressed(id):
	NextNode(id)
