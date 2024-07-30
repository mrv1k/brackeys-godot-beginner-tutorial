extends Node

@onready var score_label = %ScoreLabel
@onready var good_job_label = %GoodJobLabel
@onready var coins = %Coins
@onready var signs = %Signs
@onready var a_label = %ALabel
@onready var b_label = %BLabel
@onready var c_label = %CLabel

var coins_node_count: int
var score = 0
var sign_counter = 0

func _ready():
	coins_node_count = coins.get_child_count()

func add_point():
	score += 1
	if score == coins_node_count:
		score_label.text = "You collected all coins!" 
		good_job_label.visible = true
	else:
		score_label.text = "You collected " + str(score) + " out of " + str(coins_node_count) + " coins!" 

func add_sign():
	sign_counter += 1
	if sign_counter == 1:
		a_label.text = 'Y'
	elif sign_counter == 2:
		b_label.text = 'U'
	elif sign_counter == 3:
		c_label.text = 'NO STRAIGHT?'
