extends Area2D

@onready var ember_stats: Node2D = $"../Ember Stats"

var target : CharacterBody2D
var direction : Vector2

func _ready() -> void:
	add_to_group("Projectile")

	target = get_tree().get_first_node_in_group("Player")

	direction = (target.global_position - Vector2(0,0)).normalized()

func _process(_delta: float) -> void:
	global_position.x += ember_stats.proj_speed
