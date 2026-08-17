extends Area2D

@onready var xp_manager: Node2D = $".."
@onready var orbs: Sprite2D = $Orbs

var xp_value : int
var orb_type : int

func _ready() -> void:
	if orb_type == 1:
		var orb_sprite = preload("res://Assets/Sprites/XP Orb/Red.png")
		orbs.texture = orb_sprite
	elif orb_type == 2:
		var orb_sprite = preload("res://Assets/Sprites/XP Orb/Gold.png")
		orbs.texture = orb_sprite

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		xp_manager.current_player_xp += xp_value
		queue_free()
