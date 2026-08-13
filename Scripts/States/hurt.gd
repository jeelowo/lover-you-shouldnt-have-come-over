extends State
class_name Hurt

@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"
@onready var knockback_component: Node2D = $"../../Components/Knockback Component"
@onready var zombie: CharacterBody2D = $"../.."
@onready var zombie_stats: Node2D = $"../../Zombie Stats"
@onready var hurtbox: CollisionShape2D = $"../../Hurtbox"
@onready var timer: Timer = $"../../Timer"

var player : CharacterBody2D
var initial_pos : Vector2
var knockbacked : bool

func Enter():
	print("Zombie State: " + self.name)

	player = get_tree().get_first_node_in_group("Player")
	animated_sprite.animation_finished.connect(_on_animated_sprite_animation_finished)

	knockbacked = false
	hurtbox.disabled = true
	initial_pos = zombie.global_position
	animated_sprite.play("Hurt 1")

func Physics_Update(_delta: float):
	if not knockbacked:
		zombie.velocity = (knockback_component.add_knockback(player.global_position,
	zombie.global_position))
	zombie.move_and_slide()

	var traveled_distance = zombie.global_position - initial_pos
	if (abs(traveled_distance.x) >= (18*(1 - zombie_stats.knockback_res))
	or  abs(traveled_distance.y) >= (18*(1 - zombie_stats.knockback_res))):
		zombie.velocity = Vector2(0,0)
		knockbacked = true

func Exit():
	animated_sprite.animation_finished.disconnect(_on_animated_sprite_animation_finished)

func _on_health_component_die() -> void:
	Transitioned.emit(self, "Die")

func _on_animated_sprite_animation_finished() -> void:
	Transitioned.emit(self, "Walk")
