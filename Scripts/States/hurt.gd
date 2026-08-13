extends State
class_name Hurt

func _on_health_component_die() -> void:
	Transitioned.emit(self, "Die")
