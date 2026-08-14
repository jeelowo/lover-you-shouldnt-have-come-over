extends Node2D

# destroy projectile at max range
func _on_max_range_area_exited(area: Area2D) -> void:
	if area.is_in_group("Projectile"):
		area.queue_free()
		print(area.name + " destroyed")
