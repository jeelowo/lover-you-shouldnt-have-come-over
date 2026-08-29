extends State
class_name Die

@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"
@onready var timer: Timer = $"../../Timer"
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"
@onready var hurtbox_collision: CollisionShape2D = $"../../Boxes/Hurtbox/CollisionShape2D"
@onready var xp_manager: Node2D = $"../../../../../XP Manager"

var zombie : CharacterBody2D

func Enter():
	animated_sprite.animation_finished.connect(_on_animated_sprite_animation_finished)
	zombie = get_parent().get_parent()
	animated_sprite.play("Dead " + str(zombie.skin))
	zombie.velocity = Vector2.ZERO

func Update(_delta: float):
	if animated_sprite.frame >= 0:
		collision_shape_2d.disabled = true
		hurtbox_collision.disabled = true

func Exit():
	animated_sprite.animation_finished.disconnect(_on_animated_sprite_animation_finished)

func _on_animated_sprite_animation_finished() -> void:
	if animated_sprite.flip_h == true:
		xp_manager.spawn_orb(zombie.global_position + Vector2(-21,30))
	else:
		xp_manager.spawn_orb(zombie.global_position + Vector2(30,30))
	#print(collision_shape_2d.disabled)
	timer.start(1)
	await timer.timeout
	zombie.queue_free()
