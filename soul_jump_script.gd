extends Area2D

@export var new_speed: float = 175.0
@export var new_jump_power: float = -350.0
	


func _on_body_entered(body: Node2D) -> void:
	print("soul pick up")
	
	hide()
	set_deferred("collision_layer", 0)
	set_deferred("collision_mask", 0)

	
	$SoulSound.play()
	
	if body.name == "KnightCharacter":  # or check body is in a "Player" group
		body.speed = new_speed
		body.jump_power = new_jump_power
		print("Updated speed and jump!")
	
	# Wait for the sound to finish playing using await
	await $SoulSound.finished
	
	
	
	queue_free()
