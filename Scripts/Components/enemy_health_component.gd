extends Node2D

@onready var zombie_stats: Node2D = $"../../Zombie Stats"

var current_hp : float

signal damaged(amount: float)
signal healed(amount: float)
signal die

func _ready() -> void:
	current_hp = zombie_stats.max_hp

#@onready var timer: Timer = $"../../Timer"
# for testing
#func _process(_delta: float) -> void:
#	if timer.is_stopped():
#		take_damage(1)
#		timer.start(0.05)

# Custom Functions
func increase_max_hp(amount: float):
	zombie_stats.max_hp += amount
	current_hp += amount
	print("max hp is now: " + str(zombie_stats.max_hp))

func take_damage(amount: float):
	current_hp = max(current_hp - amount, 0)
	damaged.emit(amount)
	print("current_hp: " + str(current_hp))

	if current_hp <= 0:
		print("you died lol")
		die.emit()

func heal(amount: float):
	current_hp = min(current_hp + amount, zombie_stats.max_hp)
	healed.emit(amount)
	print("current_hp: " + str(current_hp))

	if current_hp > zombie_stats.max_hp:
		current_hp = zombie_stats.max_hp
