extends Area2D

@onready var timer_after_hit = $TimerAfterHit
@onready var timer_before_spawn = $TimerBeforeSpawn

func _ready():
	timer_after_hit.connect("timeout", self._on_timer_after_hit_timeout)
	timer_before_spawn.connect("timeout", self._on_timer_before_spawn_timeout)
	
func _on_body_entered(body):
	if body.name == 'Player':
		timer_after_hit.start(1.0)
		body.is_dead = true
		timer_before_spawn.start(1.5)

func _on_timer_after_hit_timeout():
	# TODO: play is hit
	Engine.time_scale = 0.8
	
func _on_timer_before_spawn_timeout():
	# TODO: play is dead
	# FIXME: get body to drop collision
	#body.get_node("CollisionShape2D").queue_free()
	Engine.time_scale = 1
	get_tree().reload_current_scene()
