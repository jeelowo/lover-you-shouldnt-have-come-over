extends Node2D

func add_knockback(source_pos: Vector2, target_body : Vector2):
	var direction := (target_body - source_pos).normalized()
	return direction * 1000
