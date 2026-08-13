extends State
class_name Hurt

@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"
@onready var knockback_component: Node2D = $"../../Components/Knockback Component"
@onready var zombie: CharacterBody2D = $"../.."
@onready var zombie_stats: Node2D = $"../../Zombie Stats"
@onready var timer: Timer = $"../../Timer"
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"

var player : CharacterBody2D
var initial_pos : Vector2
var knockbacked : bool

func Enter():
	print("Zombie State: " + self.name)

	player = get_tree().get_first_node_in_group("Player")
	animated_sprite.animation_finished.connect(_on_animated_sprite_animation_finished)
	
	knockbacked = false
	collision_shape_2d.disabled = true
	initial_pos = zombie.global_position
	animated_sprite.play("Hurt 1")

func Physics_Update(_delta: float):
	if not knockbacked:
		zombie.velocity = (knockback_component.add_knockback(player.global_position,
	zombie.global_position))
	zombie.move_and_slide()

	if initial_pos.distance_to(zombie.global_position) >= (18*(1 - zombie_stats.knockback_res)):
		zombie.velocity = Vector2(0,0)
		knockbacked = true

func Exit():
	animated_sprite.animation_finished.disconnect(_on_animated_sprite_animation_finished)

func _on_health_component_die() -> void:
	Transitioned.emit(self, "Die")

func _on_animated_sprite_animation_finished() -> void:
	Transitioned.emit(self, "Walk")
