extends Area2D

var target : CharacterBody2D
var direction : Vector2

func _ready() -> void:
	add_to_group("Projectile")

	target = get_tree().get_first_node_in_group("Player")

	direction = (target.global_position - Vector2(0,0)).normalized()

func _process(delta: float) -> void:
	direction
