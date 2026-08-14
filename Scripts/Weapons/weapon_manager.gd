extends Node2D

var body_in_range : Array[Node2D] = []

func _on_max_range_area_exited(area: Area2D) -> void:
	if area.is_in_group("Projectile"):
		area.queue_free()
		#print(area.name + " destroyed")

func _on_max_range_body_entered(body: Node2D) -> void:
	#print("BODY ENTERED: ", body.name)

	if body.is_in_group("Enemy"):
		body_in_range.append(body)
		#print("ENEMY: ", body.name)
