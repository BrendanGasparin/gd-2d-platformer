extends Area2D

@export_file("*.tscn") var next_scene : String

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
	call_deferred("_next_scene")

func _next_scene():
	get_tree().change_scene_to_file(next_scene)
