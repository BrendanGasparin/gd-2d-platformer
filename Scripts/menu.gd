extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if name == "Game Over":
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_play_button_pressed() -> void:
	Stats.score = 0
	get_tree().change_scene_to_file("res://Scenes/Levels/W1L1.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
