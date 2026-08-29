extends Area2D

@onready var ember_stats: Node2D = $"../../Ember Stats"
@onready var player: CharacterBody2D
@onready var weapon_manager: Node2D = $"../../../"
const SPLASH_SCENE = preload("res://Scenes/ember_splash.tscn")

var direction: Vector2
var current_target: Node2D

func _ready() -> void:
	add_to_group("Projectile")

	player = get_tree().get_first_node_in_group("Player")
	global_position = player.global_position

	# Remove enemies that have already been freed
	weapon_manager.body_in_range = weapon_manager.body_in_range.filter(
		is_instance_valid
	)

	if !weapon_manager.body_in_range.is_empty():
		var closest_distance := INF
		var health

		# Find closest enemy alive
		for enemy in weapon_manager.body_in_range:
			health = enemy.get_node("Components/Health Component")

			# Check if dead
			if health.current_hp <= 0:
				continue

			# Find closest enemy
			if (global_position.distance_to(enemy.global_position) < closest_distance):
				closest_distance = global_position.distance_to(enemy.global_position)
				current_target = enemy

		if current_target != null:
			direction = (current_target.global_position - global_position).normalized()
		else:
			direction = Vector2.from_angle(randf() * TAU)
	else:
		direction = Vector2.from_angle(randf() * TAU)

	global_rotation = direction.angle()


func _process(delta: float) -> void:
	# Move in the direction chosen when the projectile was created
	global_position += ember_stats.proj_speed * delta * direction


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Zombie"):
		var splash_effect = SPLASH_SCENE.instantiate()
		splash_effect.global_position = global_position
		get_parent().add_child(splash_effect)
		queue_free()

		var knockback_component = area.get_node(
			"../../Components/Knockback Component"
		)
		var health = area.get_node(
			"../../Components/Health Component"
		)

		health.take_damage(
			weapon_manager.roll_crit(
				ember_stats.damage,
				ember_stats.crit_dmg,
				ember_stats.crit_chance ))

		if health.current_hp > 0:
			var knockback_velocity = (knockback_component.add_knockback
						(player.global_position ,area.global_position))
			var hurt = area.get_parent().get_parent().get_node("State Machine/Hurt")
			hurt.knockback_velocity = knockback_velocity
			hurt.Transitioned.emit(hurt, "Hurt")
