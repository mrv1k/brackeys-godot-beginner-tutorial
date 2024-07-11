extends Node

var coinsNodeCount: int
var score = 0

var signsNodeCount: int
var haiku = 0
var haikuText = ""

@onready var score_label = %ScoreLabel
@onready var good_job_label = %GoodJobLabel
@onready var haiku_label = %HaikuLabel

@onready var coins = %Coins
@onready var signs = %Signs


func _ready():
	coinsNodeCount = coins.get_child_count()
	signsNodeCount = signs.get_child_count()
	# haiku_label.text = ""

func add_point():
	score += 1
	if score == coinsNodeCount:
		score_label.text = "You collected all coins!" 
		good_job_label.visible = true
	else:
		score_label.text = "You collected " + str(score) + " out of " + str(coinsNodeCount) + " coins!" 

func add_haiku():
	haiku += 1

	if haiku == 1:
		haikuText += "Morning breaks, she smiles\n"
	elif (haiku == 2):
		haikuText += "Life stirs in her soft caress,\n"
	elif (haiku >= signsNodeCount):
		haikuText += "Your mom is gay"
	
	haiku_label.text = haikuText
