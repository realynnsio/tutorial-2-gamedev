extends ColorRect

# Reference to the _AnimationPlayer_ node
@onready var _anim_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a = 0.0  # Set transparency to fully invisible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func transition_to(next_scene_path) -> void:
	# Plays the Fade animation and wait until it finishes
	_anim_player.play("Fade")
	await _anim_player.animation_finished
	# Changes the scene
	get_tree().change_scene_to_file(next_scene_path)

func appear() -> void:
	_anim_player.play_backwards("Fade")
