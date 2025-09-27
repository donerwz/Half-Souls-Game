extends Area2D

@onready var timer = $Timer
@onready var death_sound = $DeathSound

func _on_body_entered(body: Node2D):
	print("you died")

	# Play death animation on the player's AnimatedSprite2D
	if body.has_node("AnimatedSprite2D"):
		var animsprite = body.get_node("AnimatedSprite2D")
		animsprite.play("death")

	death_sound.play()
	timer.start()


func _on_timer_timeout():
	get_tree().reload_current_scene()
	
