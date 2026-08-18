extends ProgressBar

@onready var player_stats: Node2D = $"../../Player/Player Stats"
@onready var player_health: Node2D = $"../../Player/Components/Health Component"

func _process(_delta: float) -> void:
	if max_value != player_stats.max_hp:
		max_value = player_stats.max_hp
	value = player_health.current_hp
