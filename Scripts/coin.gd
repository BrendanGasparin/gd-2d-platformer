extends Area2D

var rotate_speed : float = 3.0
var bob_height : float = 5.0
var bob_speed : float = 5.0

@onready var start_pos : Vector2 = global_position
@onready var sprite : Sprite2D = $Sprite

func _physics_process(delta):
	# Get the time in seconds for our sine wave
	var time = Time.get_unix_time_from_system()
	
	# Rotate
	sprite.scale.x = sin(time * rotate_speed)
	
	# Bob up and down
