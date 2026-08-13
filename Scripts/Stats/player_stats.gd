extends Node2D

@export var movement_speed := 100 #done
@export var max_hp := 100 #done
@export var pickup_radius := 50
@export var armor := 1 # done
@export var crit_chance := 5.0
@export var crit_damage_modifier := 2.0
@export var xp := 0
@export var level := 1
@export var xp_required : int
@export var luck := 0.0
@export var damage_modifier := 1.0
@export var area_modifier := 1.0
@export var cooldown_reduction := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
