extends CharacterBody2D

var skin : int

func _ready() -> void:
	add_to_group("Enemy")
	add_to_group("Zombie")
	skin = randi_range(1,4)

func _on_health_component_die() -> void:
	pass # Replace with function body.
