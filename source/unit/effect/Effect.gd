extends Node
class_name Effect

export var alias := ""
export(String, MULTILINE) var description := ""

export var affect_self := true
export var affect_allies := false
export var affect_enemies := false


func execute(_self: Location) -> void:
	if affect_self:
		_execute(_self)

	for neighbor in _self.get_neighbors():

		if not neighbor:
			continue

		if affect_allies and _self.unit.side_number == neighbor.unit.side_number:
			_execute(neighbor)

		if affect_enemies and _self.unit.side_number != neighbor.unit.side_number:
			_execute(neighbor)


func _execute(target: Location) -> void:
	pass
