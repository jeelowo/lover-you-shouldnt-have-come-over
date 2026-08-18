extends Area2D

@onready var player_stats: Node2D = $"../Player Stats"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _process(_delta: float) -> void:
	if collision_shape_2d.shape.radius != player_stats.pickup_radius:
		collision_shape_2d.shape.radius == player_stats.pickup_radius
