extends CanvasLayer

@export_file("*.json") var d_file

var dialogue = []

func _ready():
	start()
func start():
	dialogue = load_dialogue()
	
	$NinePatchRect/RichTextLabel.text = dialogue [0]["text"]
func load_dialogue():
	var file = File.Access.New()
	if file.file_exists(d_file):
		file.open(d_file, file.READ)
		return JSON.parse_string(file.get_as_text())

