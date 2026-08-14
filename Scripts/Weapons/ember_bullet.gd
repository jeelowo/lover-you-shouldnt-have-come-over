extends Area2D

@onready var ember_stats: Node2D = $"../../Ember Stats"
@onready var player: CharacterBody2D
@onready var zombie: CharacterBody2D = $"../../../../Enemy Manager/Zombie"

var direction : Vector2

func _ready() -> void:
	add_to_group("Projectile")

	player = get_tree().get_first_node_in_group("Player")
	global_position = player.global_position
	direction = (zombie.global_position - global_position).normalized()
	global_rotation_degrees = direction.angle()

func _process(delta: float) -> void:
	global_position += ember_stats.proj_speed * delta * direction
