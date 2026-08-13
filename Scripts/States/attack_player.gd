extends State
class_name AttackPlayer

func _on_health_component_die() -> void:
	Transitioned.emit(self, "Die")
