extends Node2D

const SPEED = 50

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var should_move = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not should_move:
		return

	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
		
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false

	position.x += SPEED * delta * direction
		
