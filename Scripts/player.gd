extends CharacterBody2D

@export var move_speed : float = 100
@export var acceleration : float = 5
@export var braking : float = 10
@export var gravity : float = 500
@export var jump_force : float = 220

@export var health: int = 3

@onready var sprite : Sprite2D = $Sprite
@onready var anim : AnimationPlayer = $AnimationPlayer

var move_input : float

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Negative axis move left, positive axis move right
	move_input = Input.get_axis("move_left", "move_right")
	# If moving then accelerate, if not then brake
	if move_input != 0:
		velocity.x = lerp(velocity.x, move_input * move_speed, acceleration * delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, braking * delta)

	# Jump
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	# Moves and runs collision detection
	move_and_slide()

func _process(_delta : float) -> void:
	sprite.flip_h = velocity.x < 0
	_manage_animation()
	
func _manage_animation():
	if not is_on_floor():
		anim.play("jump")
	elif move_input !=0:
		anim.play("move")
	else:
		anim.play("idle")

func take_damage(amount : int):
	health -= amount
	if health <= 0:
		call_deferred("game_over")

func game_over():
	get_tree().change_scene_to_file("res://Scenes/Levels/W1L1.tscn")

func increase_coins(amount : int):
	Stats.score += amount
	print(Stats.score)
