extends Area2D

@onready var ember_stats: Node2D = $"../../Ember Stats"
@onready var player: CharacterBody2D
@onready var weapon_manager: Node2D = $"../../../"

var direction: Vector2
var current_target: Node2D


func _ready() -> void:
	add_to_group("Projectile")

	player = get_tree().get_first_node_in_group("Player")
	global_position = player.global_position

	# Random direction if there are no enemies to target
	direction = Vector2.from_angle(randf() * TAU)


func _process(delta: float) -> void:
	weapon_manager.body_in_range = weapon_manager.body_in_range.filter(
		is_instance_valid
	)

	if not weapon_manager.body_in_range.is_empty() and \
		current_target != weapon_manager.body_in_range[0]:

		current_target = weapon_manager.body_in_range[0]

		var target_health_component = current_target.get_node(
			"Components/Health Component"
		)

		if target_health_component.current_hp <= 0:
			weapon_manager.body_in_range.erase(current_target)
			current_target = null
			return

	if is_instance_valid(current_target):
		direction = (
			current_target.global_position - global_position
		).normalized()

	# Always rotate and move toward the current direction
	global_rotation = direction.angle()
	global_position += ember_stats.proj_speed * delta * direction


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Zombie"):
		var health = area.get_node("../../Components/Health Component")

		health.take_damage(
			weapon_manager.roll_crit(
				ember_stats.damage,
				ember_stats.crit_dmg,
				ember_stats.crit_chance ) )
