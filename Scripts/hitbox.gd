extends Area2D

@onready var zombie_stats: Node2D = $"../../Zombie Stats"



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		var health = area.get_parent().get_node("Components/Health Component")
		health.take_damage(zombie_stats.contact_damage)
