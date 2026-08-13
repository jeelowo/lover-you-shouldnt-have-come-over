extends State
class_name WalkToPlayer

@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"
@onready var zombie_stats: Node2D = $"../../Zombie Stats"

var player : CharacterBody2D
var zombie : CharacterBody2D
var direction : Vector2

func Enter():
	print("Zombie State: " + self.name)

	player = get_tree().get_first_node_in_group("Player")
	zombie = get_parent().get_parent()

func Physics_Update(delta: float):
	direction = (player.global_position - zombie.global_position).normalized()
	zombie.velocity = direction * zombie_stats.movement_speed
	zombie.move_and_slide()
	animated_sprite.play("Walk 1")

	if zombie.velocity.x < 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false

# Transitions
func _on_health_component_die() -> void:
	Transitioned.emit(self, "Die")

func _on_health_component_damaged(_amount: float) -> void:
	print("bap")
	Transitioned.emit(self, "Hurt")
