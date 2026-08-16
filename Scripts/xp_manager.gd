extends Node2D

@onready var player: CharacterBody2D = $"../Player"

var current_xp : float

func _ready() -> void:
	current_xp = 0
