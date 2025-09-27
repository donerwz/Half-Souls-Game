extends CharacterBody2D

const SPEED = 175.0
const JUMP_VELOCITY = -300.0

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle movement.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# ----------- ANIMATION LOGIC BELOW -----------

	# Flip the sprite based on direction
	if velocity.x != 0:
		anim.flip_h = velocity.x < 0

	# Play jump animation if in air
	if not is_on_floor():
		anim.play("jump")
	elif abs(velocity.x) > 5:
		anim.play("run")
	else:
		anim.play("idle")
