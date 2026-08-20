extends AudioStreamPlayer2D

var xp_sounds = [
	preload("res://Assets/Audio/XP/0820(1).MP3"),
	preload("res://Assets/Audio/XP/0820(2).MP3"),
	preload("res://Assets/Audio/XP/0820(3).MP3"),
	preload("res://Assets/Audio/XP/0820(4).MP3"),
	preload("res://Assets/Audio/XP/0820.MP3"),
]

func _ready() -> void:
	stream = xp_sounds.pick_random()
	play()

func _on_finished() -> void:
	queue_free()
