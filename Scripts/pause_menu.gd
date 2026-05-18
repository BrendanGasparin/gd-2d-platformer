extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		
		if visible:
			resume_game()
		else:
			pause_game()


func _on_resume_button_pressed() -> void:
	resume_game()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
func pause_game() -> void:
		visible = true
		get_tree().paused = true
		
func resume_game() -> void:
		get_tree().paused = false
		visible = false
