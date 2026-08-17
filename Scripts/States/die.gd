extends State
class_name Die

@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"
@onready var timer: Timer = $"../../Timer"
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"
@onready var hurtbox_collision: CollisionShape2D = $"../../Boxes/Hurtbox/CollisionShape2D"

var zombie : CharacterBody2D

func Enter():
	print("State: " + self.name)

	animated_sprite.animation_finished.connect(_on_animated_sprite_animation_finished)
	zombie = get_parent().get_parent()
	animated_sprite.play("Dead 1")
	zombie.velocity = Vector2.ZERO

func Exit():
	animated_sprite.animation_finished.disconnect(_on_animated_sprite_animation_finished)

func _on_animated_sprite_animation_finished() -> void:
	collision_shape_2d.disabled = true
	hurtbox_collision.disabled = true
	print(collision_shape_2d.disabled)
	timer.start(1)
	await timer.timeout
	zombie.queue_free()
