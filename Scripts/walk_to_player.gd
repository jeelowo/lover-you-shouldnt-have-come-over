extends State
class_name WalkToPlayer

@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"

var player : CharacterBody2D
var zombie : CharacterBody2D
var direction : Vector2

func Enter():
	print("Zombie State: " + str(self))

	player = get_tree().get_first_node_in_group("Player")
	zombie = get_parent().get_parent()
	print(zombie)

func Physics_Update(delta: float):
	direction = player.global_position - zombie.global_position
	print(direction)
	zombie.velocity = direction * 5 * delta
	animated_sprite.play("Walk 1")
