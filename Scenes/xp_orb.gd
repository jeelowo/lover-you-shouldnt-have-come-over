extends Area2D

@onready var xp_manager: Node2D = $".."

var xp_value : int
var orb_type : int

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		xp_manager.current_player_xp += xp_value

func 
