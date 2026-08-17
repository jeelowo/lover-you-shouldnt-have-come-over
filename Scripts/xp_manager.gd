extends Node2D

@onready var player: CharacterBody2D

var current_player_xp : float

func _ready() -> void:
	current_player_xp = 0
