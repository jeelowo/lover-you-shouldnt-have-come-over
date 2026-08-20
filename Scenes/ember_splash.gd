extends AnimatedSprite2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var fire_sounds = [
	preload("res://Assets/Audio/Fire/yodguard-fire-magic-1-378636.mp3"),
	preload("res://Assets/Audio/Fire/yodguard-fire-magic-2-378638.mp3"),
	preload("res://Assets/Audio/Fire/yodguard-fire-magic-3-378640.mp3"),
	preload("res://Assets/Audio/Fire/yodguard-fire-magic-4-378637.mp3"),
	preload("res://Assets/Audio/Fire/yodguard-fire-magic-5-378639.mp3"),
	preload("res://Assets/Audio/Fire/yodguard-fire-magic-6-378641.mp3")
]

func _ready() -> void:
	audio_stream_player_2d.stream = fire_sounds.pick_random()
	audio_stream_player_2d.play()

func _on_animation_finished() -> void:
	visible = false

func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
