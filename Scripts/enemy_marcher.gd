extends CharacterBody2D

@export var move_direction : float = 1.0 # -1.0 is left, 1.0 is right
@export var move_speed : float = 20
@export var gravity : float = 200.0

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	$AnimatedSprite2D.play("walk")

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Horizontal movement
	velocity.x = move_direction * move_speed
	
	# Move and collision detection
	move_and_slide()

	# When we meet a horizontal barrier, turn around
	if is_on_wall():
		move_direction *= -1

	if move_direction < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
	
	body.take_damage(1)
