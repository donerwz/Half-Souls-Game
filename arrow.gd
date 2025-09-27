extends TextureRect

@export var player: AnimatedSprite2D
@export var target: Node2D

func _process(delta):
	if not player or not target:
		return

	# Direction from player to target
	var direction = (target.global_position - player.global_position).normalized()

	# Rotate arrow to point at target
	rotation = atan2(direction.y, direction.x)

	# --- Check if target is on screen ---
	var camera := get_viewport().get_camera_2d()
	if camera:
		var screen_pos = camera.unproject_position(target.global_position)

		# Hide arrow if target is inside the screen
		visible = not get_viewport_rect().has_point(screen_pos)
