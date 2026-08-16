extends Node

@onready var cooldown_timer: Timer = $Timer
@onready var ember_stats: Node2D = $"Ember Stats"

const EMBER_SCENE = preload("res://Scenes/ember_bullet.tscn")
var is_active: bool
var player : CharacterBody2D
var zombie : CharacterBody2D
var base_cooldown := 3.0
var ember_fired := 0

func _ready() -> void:
	is_active = true
	player = get_tree().get_first_node_in_group("Player")
	zombie = $"../../Enemy Manager/Zombie"

func _process(_delta: float) -> void:
	if not is_active:
		return

	if cooldown_timer.is_stopped():
		shoot_ember()
		cooldown_timer.start(base_cooldown * (1.0 - ember_stats.cooldown_reduction))

func shoot_ember():
	var ember_instance = EMBER_SCENE.instantiate()
	get_node("Projectiles").add_child(ember_instance)
	ember_fired += 1
