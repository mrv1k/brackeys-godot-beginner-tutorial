extends Area2D

@onready var game_manager = %GameManager
@onready var collision_shape_2d = $CollisionShape2D

func _on_body_entered(_body):
	collision_shape_2d.queue_free()
	game_manager.add_sign()

