extends CharacterBody2D

func _ready() -> void:
	add_to_group("Enemy")
	add_to_group("Zombie")

func _process(_delta: float) -> void:
	move_and_slide()
