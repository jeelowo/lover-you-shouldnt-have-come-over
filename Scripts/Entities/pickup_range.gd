extends Area2D

@onready var player: CharacterBody2D = $"../../Player"
@onready var player_stats: Node2D = $"../../Player/Player Stats"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _process(_delta: float) -> void:
	global_position = player.global_position
	if collision_shape_2d.shape.radius != player_stats.pickup_radius:
		collision_shape_2d.shape.radius = player_stats.pickup_radius

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("XP"):
		area.is_collected = true
