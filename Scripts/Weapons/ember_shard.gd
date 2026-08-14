extends Node

@onready var cooldown_timer: Timer = $Timer

const EMBER_SCENE = preload("res://Scenes/ember_bullet.tscn")
var is_active: bool
var player : CharacterBody2D 
var zombie : CharacterBody2D

func _ready() -> void:
	is_active = true
	player = get_tree().get_first_node_in_group("Player")
	zombie = $"../../Enemy Manager/Zombie"

func _process(delta: float) -> void:
	if cooldown_timer.is_stopped():
		shoot_ember(player.global_position, zombie.global_position)
		cooldown_timer.start(1)

func shoot_ember(start_pos: Vector2, target_pos: Vector2):
	var ember_instance = EMBER_SCENE.instantiate()
	get_node("Projectiles").add_child(ember_instance)
