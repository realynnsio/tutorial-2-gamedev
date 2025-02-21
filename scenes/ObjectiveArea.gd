extends Area2D

@onready var _transition_rect := $"../SceneTransitionRect"

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		_transition_rect.transition_to("res://scenes/SecondLevel.tscn")
