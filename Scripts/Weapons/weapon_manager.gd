extends Node2D

@onready var max_range: Area2D = $"Max Range"
@onready var player: CharacterBody2D = $"../Player"

var body_in_range : Array[Node2D] = []

func _process(_delta: float) -> void:
	max_range.global_position = player.global_position

func _on_max_range_area_exited(area: Area2D) -> void:
	if area.is_in_group("Projectile"):
		area.queue_free()
		#print(area.name + " destroyed")

func _on_max_range_body_entered(body: Node2D) -> void:
	#print("BODY ENTERED: ", body.name)

	if body.is_in_group("Enemy"):
		body_in_range.append(body)
		#print("ENEMY: ", body.name)

func roll_crit(damage: float, crit_dmg: float, crit_chance: float) -> float:
	if crit_chance == 0:
		return damage

	if crit_chance < 1:
		var roll = randf()
		if roll < crit_chance:
			return crit_dmg * damage
	else: # overcrit
		return damage * (crit_dmg + (crit_chance-1))

	return damage
