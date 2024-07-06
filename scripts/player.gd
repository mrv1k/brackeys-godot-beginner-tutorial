extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead = false
var is_done = false

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer

func _ready():
	animated_sprite_2d.connect("animation_finished", self._on_animation_finished)

func _on_animation_finished():
	if animated_sprite_2d.animation == "death":
		is_done = true
		print("Death animation finished")

func _physics_process(delta):
	if is_done:
		return

	if is_dead:
		animated_sprite_2d.play("death")
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or !coyote_timer.is_stopped()):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	
	var is_idle = direction == 0
	var is_run_right = direction == 1
	var is_run_left = direction == -1
	
	if is_idle:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.x = direction * SPEED
	
	if !is_on_floor():
		animated_sprite_2d.play('jump')
	elif is_idle:
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("run")
		if is_run_right:
			animated_sprite_2d.flip_h = false
		elif is_run_left:
			animated_sprite_2d.flip_h = true

	var was_on_floor = is_on_floor()

	move_and_slide()
	
	if was_on_floor and !is_on_floor() and not Input.is_action_pressed("jump"):
		coyote_timer.start()

