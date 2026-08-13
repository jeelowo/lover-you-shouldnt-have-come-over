extends State
class_name Die

@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"
@onready var timer: Timer = $"../../Timer"
@onready var hurtbox: CollisionShape2D = $"../../Hurtbox"

var zombie : CharacterBody2D

func Enter():
	print("State: " + self.name)

	animated_sprite.animation_finished.connect(_on_animated_sprite_animation_finished)
	zombie = get_parent().get_parent()
	animated_sprite.play("Dead 1")
	zombie.velocity = Vector2.ZERO
	hurtbox.disabled = true

func Exit():
	animated_sprite.animation_finished.disconnect(_on_animated_sprite_animation_finished)

func _on_animated_sprite_animation_finished() -> void:
	timer.start(2)
	await timer.timeout
	zombie.queue_free()
