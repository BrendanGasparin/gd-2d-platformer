extends CanvasLayer

@onready var health_container = $HealthContainer
@onready var score_text : Label = $CoinsText
@onready var player = get_parent()

var hearts : Array = []

func _ready():
	hearts = health_container.get_children()
	
	player.OnUpdateHealth.connect(_update_hearts)
	player.OnUpdateCoins.connect(_update_coins)
	
	_update_hearts(player.health)
	_update_coins(Stats.score)

func _update_hearts(health : int):
	for i in len(hearts):
		hearts[i].visible = i < health

func _update_coins(score : int):
	score_text.text = "Coins: " + str(score)
