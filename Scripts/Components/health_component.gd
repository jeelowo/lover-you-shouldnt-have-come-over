extends Node2D

@onready var timer: Timer = $"../../Timer"
@onready var player_stats: Node2D = $"../../Player Stats"

var current_hp : float
var invincible : bool

signal damaged(amount: float)
signal healed(amount: float)
signal die

func _ready() -> void:
	print(player_stats.max_hp)
	current_hp = player_stats.max_hp
	invincible = false

# for debugging
#func _process(delta: float) -> void:
#	if timer.is_stopped():
#		increase_max_hp(10.0)
#		take_damage(20.0)
#		timer.start(1.0)

# Custom Functions
func increase_max_hp(amount: float):
	player_stats.max_hp += amount
	current_hp += amount
	print("max hp is now: " + str(player_stats.max_hp))

func take_damage(amount: float):
	if invincible:
		return

	var dmg = max(current_hp - (amount - player_stats.armor), 0)
	if player_stats.armor > amount:
		current_hp -= 1
	else:
		current_hp = dmg
	damaged.emit(dmg)
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

func _on_damaged(_amount: float) -> void:
	invincible = true
	timer.start(1.2)
	await timer.timeout
	invincible = false
