extends Node2D

@onready var player: CharacterBody2D = $"../.."
@onready var player_stats: Node2D = $"../../Player Stats"
@onready var animated_sprite: AnimatedSprite2D = $"../../Animated Sprite"

var direction : Vector2
var idle_animations
var current_animation
var animation_finished = false

func _ready() -> void:
	idle_animations = ["Idle", "Idle_2"]
	current_animation = idle_animations.pick_random()

func _physics_process(_delta: float) -> void:
	direction = (Input.get_vector 
	("move_left", "move_right", "move_up", "move_down"))

	player.velocity = direction * player_stats.movement_speed

	if player.velocity == Vector2(0,0):
		animated_sprite.play(current_animation)
	else:
		if Input.is_action_just_pressed("move_left"):
			animated_sprite.flip_h = true
		elif Input.is_action_just_pressed("move_right"):
			animated_sprite.flip_h = false
		animated_sprite.play("Walk")
		current_animation = idle_animations.pick_random()

func _on_animated_sprite_animation_finished() -> void:
	if current_animation != idle_animations[0]:
		current_animation = idle_animations[0]
