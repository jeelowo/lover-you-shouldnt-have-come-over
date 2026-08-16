extends Node2D

@onready var timer: Timer = $"../Timer"
@onready var spawn_location: PathFollow2D = $"Spawn Path/Spawn Location"
@onready var spawn_path: Path2D = $"Spawn Path"
@onready var camera: Camera2D = $"../Player/%Camera"

const ZOMBIE_SCENE = preload("res://Scenes/zombie.tscn")
@export var spawn_cooldown := 0.1

func _ready() -> void:
	timer.start(spawn_cooldown)

func _process(_delta: float) -> void:
	if timer.is_stopped():
		var zombie_instance = ZOMBIE_SCENE.instantiate()
		spawn_location.progress_ratio = randf()
		zombie_instance.global_position = spawn_location.global_position
		add_child(zombie_instance)
		timer.start(spawn_cooldown)

	spawn_path.global_position = camera.global_position 
	print(spawn_path.global_position)
