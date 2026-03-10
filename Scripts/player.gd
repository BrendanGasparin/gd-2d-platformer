extends CharacterBody2D

@export var move_speed : float = 100
@export var acceleration : float = 50
@export var braking : float = 20
@export var gravity : float = 500
@export var jump_force : float = 150

var move_input : float

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Negative axis move left, positive axis move right
	move_input = Input.get_axis("move_left", "move_right")
	velocity.x = move_input * move_speed
	
	# Jump
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	# Moves and runs collision detection
	move_and_slide()
