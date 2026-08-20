extends AudioStreamPlayer2D

var xp_sounds = [
	preload("res://Assets/Audio/XP/freesound_community-pop-91931.wav"),
	preload("res://Assets/Audio/XP/freesound_community-pop-91931_2.wav"),
	preload("res://Assets/Audio/XP/freesound_community-pop-91931_3.wav"),
	preload("res://Assets/Audio/XP/freesound_community-pop-91931_4.wav"),
	preload("res://Assets/Audio/XP/freesound_community-pop-91931_5.wav")
]

func _ready() -> void:
	stream = xp_sounds.pick_random()
	play()

func _on_finished() -> void:
	queue_free()
