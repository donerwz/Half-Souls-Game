extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("soul pick up")
	
	hide()
	set_deferred("collision_layer", 0)
	set_deferred("collision_mask", 0)
	
	$SoulSound.play()
	
	# Wait for the sound to finish playing using await
	await $SoulSound.finished
	
	queue_free()
