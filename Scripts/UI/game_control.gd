extends Control

@onready var healthbar: ProgressBar = $Healthbar
@onready var player_health: Node2D = $"../../Player/Components/Health Component"
@onready var player_stats: Node2D = $"../../Player/Player Stats"
@onready var upgrade_panel: Panel = $"Upgrade Panel"

func _ready() -> void:
	upgrade_panel.visible = false

func _process(delta: float) -> void:
	if healthbar.value != player_health.current_hp:
		healthbar.value = player_health.current_hp

	if healthbar.max_value != player_stats.max_hp:
		healthbar.max_value = player_stats.max_hp

	#print(str(healthbar.value) + " / " + str(healthbar.max_value))
