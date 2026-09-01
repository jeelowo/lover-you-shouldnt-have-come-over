extends Area2D

@onready var xp_manager: Node2D = $".."
@onready var orbs: Sprite2D = $Orbs
@onready var player: CharacterBody2D = $"../../Player"
@onready var point_light_green: PointLight2D = $PointLightGreen
@onready var point_light_red: PointLight2D = $PointLightRed
@onready var point_light_gold: PointLight2D = $PointLightGold
@onready var timer: Timer = $Timer

const XP_SOUNDS_SCENE = preload("res://Scenes/xp_sound.tscn")

@export var speed := 200.0

var xp_value : int
var orb_type : int
var is_collected := false
var is_timer_done :=  false
var initial_pos : Vector2
var direction : Vector2

func _ready() -> void:
	add_to_group("XP")
	initial_pos = global_position

	if orb_type == 1:
		point_light_green.enabled = false
		point_light_red.enabled = true
		orbs.texture = preload("res://Assets/Sprites/XP Orb/Red.png")
	elif orb_type == 2:
		point_light_green.enabled = false
		point_light_gold.enabled = true
		orbs.texture = preload("res://Assets/Sprites/XP Orb/Gold.png")

func _process(delta: float) -> void:
	if is_collected:
		if not is_timer_done:
			timer.start(0.1)
			is_timer_done = true

		if timer.time_left > 0:
			direction = Vector2(0, -1)
			global_position += speed * direction * delta
		else:
			if speed < 400:
				speed *= 1.1
			direction = global_position.direction_to(player.global_position)
			global_position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var xp_sound = XP_SOUNDS_SCENE.instantiate()
		get_parent().add_child(xp_sound)
		xp_manager.current_player_xp += xp_value
		queue_free()
