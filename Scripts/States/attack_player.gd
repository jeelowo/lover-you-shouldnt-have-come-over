extends State
class_name AttackPlayer

var player : CharacterBody2D

func Enter():
	print("State: " + self.name)
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(_delta: float):
	pass

func _on_health_component_die() -> void:
	Transitioned.emit(self, "Die")
