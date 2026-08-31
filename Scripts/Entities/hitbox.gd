extends Area2D

@onready var zombie_stats: Node2D = $"../../Zombie Stats"
@onready var damage_timer: Timer = $"../../DamageTimer"
var player_hurtbox : Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		player_hurtbox = area
		damage_timer.start()

func _on_area_exited(area: Area2D) -> void:
	if area == player_hurtbox:
		player_hurtbox = null
		damage_timer.stop()

func _on_damage_timer_timeout() -> void:
	if player_hurtbox:
		var health = player_hurtbox.get_parent().get_node("Components/Health Component")
		health.take_damage(zombie_stats.contact_damage)
