extends Node2D

#@onready var timer: Timer = $"../../Timer"
@onready var player_stats: Node2D = $"../../Player Stats"

var current_hp : float

signal damaged(amount: float)
signal healed(amount: float)
signal die

func _ready() -> void:
	print(player_stats.max_hp)
	current_hp = player_stats.max_hp

# Custom Functions
func increase_max_hp(amount: float):
	player_stats.max_hp += amount
	current_hp += amount
	print("max hp is now: " + str(player_stats.max_hp))

func take_damage(amount: float):
	current_hp = max(current_hp - amount, 0)
	damaged.emit(amount)
	print("current_hp: " + str(current_hp))

	if current_hp <= 0:
		print("you died lol")
		die.emit()

func heal(amount: float):
	current_hp = min(current_hp + amount, player_stats.max_hp)
	healed.emit(amount)
	print("current_hp: " + str(current_hp))

	if current_hp > player_stats.max_hp:
		current_hp = player_stats.max_hp
