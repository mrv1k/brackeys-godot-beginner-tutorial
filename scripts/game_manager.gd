extends Node

var score = 0
var haiku = 0
var coinsCount = 0

@onready var score_label = %ScoreLabel
@onready var coins = %Coins
# @onready var haiku_label = $HaikuLabel

func _ready():
	coinsCount = coins.get_child_count()

func add_point():
	score += 1
	if score == coinsCount:
		score_label.text = "You collected all coins!" 
	else:
		score_label.text = "You collected " + str(score) + " out of " + str(coinsCount) + " coins!" 
 
func add_haiku():
	haiku += 1

