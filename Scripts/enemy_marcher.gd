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

	# Check collisions
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var body = collision.get_collider()

		if body.is_in_group("Player"):
			body.take_damage(1)

	# When we meet a horizontal barrier, turn around
	if is_on_wall() and is_on_floor():
		move_direction *= -1

	if move_direction < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
	
	body.take_damage(1)
