extends PathFollow2D

@export var speed = 500

var word: String = "test"
var current_letter: int = 0

func initialize(word: String):
	self.word = word
	var printed_word = align_center(word)
	printed_word = set_size(printed_word, 32)
	$LabelNode/RichTextLabel.text = printed_word
	
func shoot_letter(letter: String):
	if letter.to_lower() == word[current_letter].to_lower():
		current_letter += 1
		
		if current_letter == len(word):
			queue_free()
			return
		
		var a = word.substr(0, current_letter)
		var b = word.substr(current_letter, -1)
		a = add_color(a, "#bf1806")
		a = align_center(a+b)
		a = set_size(a, 32)
		$LabelNode/RichTextLabel.text = a
		

func _process(delta):
	set_progress(get_progress() + speed*delta)
	$LabelNode.global_rotation_degrees = 0
	if get_progress_ratio() > 0.99:
		queue_free()
		
func add_color(word: String, color: String) -> String:
	return "[color=%s]%s[/color]" % [color, word]

func align_center(word: String) -> String:
	return "[center]%s[/center]" % word
	
func set_size(word: String, size: int) -> String:
	return "[font_size=%d]%s[/font_size]" % [size, word]
