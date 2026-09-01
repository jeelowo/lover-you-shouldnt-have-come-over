extends Node2D

@onready var player: CharacterBody2D
@onready var orb_scene = preload("res://Scenes/xp_orb.tscn")

var current_player_xp : float
var small_chance : float
var medium_chance := 0.1
var large_chance := 0.01

func _ready() -> void:
	current_player_xp = 0
	small_chance = 1 - (medium_chance + large_chance)

func spawn_orb(pos : Vector2):
	var orb_instance = orb_scene.instantiate()
	orb_instance.global_position = pos
	orb_instance.orb_type = roll_orb()
	orb_instance.xp_value = xp_amount(orb_instance.orb_type)
	add_child(orb_instance)

func modify_chance(orb_type: int):
	match orb_type:
		0: # small
			medium_chance += 0.025
			large_chance += 0.001
			small_chance = 1 - (medium_chance + large_chance)

			#print("New Odds: \n Small: " + str(small_chance)
			#+ "\nMedium:" +  str(medium_chance)
			#+ "\nLarge:" +  str(large_chance))

		1: # medium
			medium_chance -= 0.1
			large_chance += 0.001
			medium_chance = max(medium_chance, 0)
			small_chance = 1 - (medium_chance + large_chance)

			#print("New Odds: \n Small: " + str(small_chance)
			#+ "\nMedium:" +  str(medium_chance)
			#+ "\nLarge:" +  str(large_chance))

		2: # large
			medium_chance += 0.025
			large_chance -= 0.08
			large_chance = max(large_chance, 0)
			small_chance = 1 - (medium_chance + large_chance)


			#print("New Odds: \n Small: " + str(small_chance)
			#+ "\nMedium:" +  str(medium_chance)
			#+ "\nLarge:" +  str(large_chance))
		_:
			print("WHAT????")

func roll_orb() -> int:
	var roll = randf()
	if roll <= large_chance:
		modify_chance(2)
		return 2
	if roll <= large_chance + medium_chance:
		modify_chance(1)
		return 1
	modify_chance(0)
	return 0

func xp_amount(orb_type : int) -> float:
	match orb_type:
		0:
			return randi_range(90,110)
		1:
			return randi_range(450,540)
		2:
			return randi_range(3300, 3850)
	return 0
