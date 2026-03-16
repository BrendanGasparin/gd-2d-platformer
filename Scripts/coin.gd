extends Area2D

var rotate_speed : float = 3.0
var bob_height : float = 5.0
var bob_speed : float = 5.0

@onready var start_pos : Vector2 = global_position
@onready var sprite : Sprite2D = $Sprite

func _physics_process(_delta):
	# Get the time in seconds for our sine wave
	var time = Time.get_unix_time_from_system()
	
	# Rotate
	sprite.scale.x = sin(time * rotate_speed)
	
	# Bob up and down
	# Add one to sine wave and halve it to get it between 0 and 1 (instead of -1 and 1)
	var y_pos = ((sin(time * bob_speed) + 1) / 2) * bob_height
	global_position.y = start_pos.y - y_pos

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
	body.increase_coins(1)
	queue_free()
