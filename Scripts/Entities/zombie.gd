extends CharacterBody2D

func _ready() -> void:
	add_to_group("Enemy")
	add_to_group("Zombie")

func _on_health_component_die() -> void:
	pass # Replace with function body.
