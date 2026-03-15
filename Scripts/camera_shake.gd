extends Camera2D

var intensity : float = 0.0

func _ready():
	get_parent().OnUpdateHealth.connect(_damage_shake)

func _damage_shake(_health: int):
	intensity = 10

func _process(delta):
	if intensity > 0:
		# Decrease intensity of shake to zero over time
		intensity = lerpf(intensity, 0, delta * 10)
		offset = _get_random_offset()

func _get_random_offset():
	var x = randf_range(-intensity, intensity)
	var y = randf_range(-intensity, intensity)
	return Vector2(x, y)
