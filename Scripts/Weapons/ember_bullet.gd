extends Area2D

@onready var ember_stats: Node2D = $"../../Ember Stats"
@onready var player: CharacterBody2D

var direction : Vector2

func _ready() -> void:
	add_to_group("Projectile")

	player = get_tree().get_first_node_in_group("Player")
	direction = (player.global_position - Vector2(0,0)).normalized()

func _process(delta: float) -> void:
	global_position.x += ember_stats.proj_speed * delta
