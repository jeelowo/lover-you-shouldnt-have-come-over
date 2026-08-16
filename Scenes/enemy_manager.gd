extends Node2D

@onready var timer: Timer = $"../Timer"
@onready var spawn_loc: PathFollow2D = $"Spawn Loc/PathFollow2D"

const ZOMBIE_SCENE = preload("res://Scenes/zombie.tscn")
var spawn_cooldown := 0.1

func _ready() -> void:
	timer.start(spawn_cooldown)

func _process(delta: float) -> void:
	if timer.is_stopped():
		var zombie_instance = ZOMBIE_SCENE.instantiate()
		spawn_loc.progress_ratio = randf()
		zombie_instance.global_position = spawn_loc.global_position
		add_child(zombie_instance)
		timer.start(spawn_cooldown)
