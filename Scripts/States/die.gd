extends State
class_name Die

@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"
@onready var timer: Timer = $"../../Timer"
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"

var zombie : CharacterBody2D

func Enter():
	zombie = get_parent().get_parent()
	animated_sprite.play("Dead 1")
	zombie.velocity = Vector2.ZERO
	collision_shape_2d.disabled = true

func _on_animated_sprite_animation_finished() -> void:
	timer.start(2)
	await timer.timeout
	zombie.queue_free()
