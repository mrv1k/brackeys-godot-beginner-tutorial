extends Node2D

const SPEED = 50

var direction = 1

@onready var ray_cast_0 = $RayCast0
@onready var ray_cast_90 = $RayCast90
@onready var ray_cast_180 = $RayCast180
@onready var ray_cast_270 = $RayCast270

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var should_move = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not should_move:
		return

	if ray_cast_90.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
		
	if ray_cast_270.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false

	position.x += SPEED * delta * direction
		
