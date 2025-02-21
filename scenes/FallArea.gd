extends Area2D

func _on_FallArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip" or body.name == "GreenShip"):
		get_tree().reload_current_scene()
