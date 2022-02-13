extends Area2D

var player = null

func can_see_player():
	return player != null

func _on_PlayerDetectionZone_body_entered(body):
	print_debug("COLLISION ZONE ENTERED")
	player = body

func _on_PlayerDetectionZone_body_exited(body):
	print_debug("collision zone exited")
	player = null
	print(body)
