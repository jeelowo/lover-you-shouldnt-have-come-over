extends State
class_name Hurt

@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"
@onready var knockback_component: Node2D = $"../../Components/Knockback Component"
@onready var zombie: CharacterBody2D = $"../.."
#@onready var zombie_stats: Node2D = $"../../Zombie Stats"
@onready var timer: Timer = $Timer

var player : CharacterBody2D
var knockback_velocity := Vector2(0,0)

func Enter():
	print("Zombie State: " + self.name)

	player = get_tree().get_first_node_in_group("Player")
	animated_sprite.animation_finished.connect(_on_animated_sprite_animation_finished)

	animated_sprite.play("Hurt " + str(zombie.skin))
	timer.start(0.03)
	knockback_velocity = (
	knockback_component.add_knockback(player.global_position, zombie.global_position))

func Physics_Update(_delta: float):
	if not timer.is_stopped():
		zombie.velocity = knockback_velocity
	else:
		zombie.velocity = Vector2.ZERO
	zombie.move_and_slide()

func Exit():
	animated_sprite.animation_finished.disconnect(_on_animated_sprite_animation_finished)

func _on_health_component_die() -> void:
	Transitioned.emit(self, "Die")

func _on_animated_sprite_animation_finished() -> void:
	Transitioned.emit(self, "Walk")
