extends State
class_name Hurt

@onready var knockback_component: Node2D = $"../../Components/Knockback Component"
@onready var zombie: CharacterBody2D = $"../.."
@onready var zombie_stats: Node2D = $"../../Zombie Stats"
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"
@onready var timer: Timer = $"../../Timer"

var player : CharacterBody2D
var initial_pos : Vector2

func Enter():
	print("Zombie State: " + self.name)

	player = get_tree().get_first_node_in_group("Player")
	collision_shape_2d.disabled = true
	initial_pos = zombie.global_position

func Physics_Update(_delta: float):
	zombie.velocity = (knockback_component.add_knockback(player.global_position, 
	zombie.global_position))
	zombie.move_and_slide()

	var traveled_distance = zombie.global_position - initial_pos
	if (abs(traveled_distance.x) >= (20*(1 - zombie_stats.knockback_res)) 
	or  abs(traveled_distance.y) >= (20*(1 - zombie_stats.knockback_res))):
		Transitioned.emit(self, "Walk")

func _on_health_component_die() -> void:
	Transitioned.emit(self, "Die")
