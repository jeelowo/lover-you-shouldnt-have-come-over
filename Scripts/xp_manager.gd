extends Node2D

@onready var player: CharacterBody2D

var current_player_xp : float
var small_chance : float
var medium_chance := 0.1
var large_chance := 0.01

func _ready() -> void:
	current_player_xp = 0
	small_chance = 1 - (medium_chance + large_chance)

func modify_chance(orb_type: int):
	match orb_type:
		0: # small 
			medium_chance += 0.025
			large_chance += 0.001

			small_chance = 1 - (medium_chance + large_chance)

		1: # medium
			medium_chance -= 0.1
			large_chance += 0.001

			if medium_chance < 0.1:
				medium_chance = 0.1

				small_chance = 1 - (medium_chance + large_chance)

		2: # large
			medium_chance += 0.025
			large_chance -= 0.08

			if large_chance < 0.01:
				large_chance = 0.01

			small_chance = 1 - (medium_chance + large_chance)
		_:
			print("WHAT????")
