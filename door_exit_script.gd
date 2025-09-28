extends Area2D

@onready var timer = $Timer

@onready var me

func _on_body_entered(body: Node2D) -> void:
	if body.name == "KnightCharacter":  # make sure it's really your knight
		
		
		$CollisionShape2D.disabled = true
	

		# Access the child node "VictoryText" of the knight
		var victory_text = body.get_node("VictoryText")
		
		victory_text.show()
		
		body.global_position = Vector2(552, -1481)

		$AudioStreamPlayer.play()
		timer.start()
		
		await get_tree().create_timer(7).timeout
		
		print("found the exit after timer finished")
		
		get_tree().reload_current_scene()

		# remove reload if you want text to actually show before scene reset
		# get_tree().reload_current_scene()
