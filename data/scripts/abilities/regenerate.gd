extends Resource

var config = {
	name = "Regenerate",
	event = "turn refresh",
	value = 8
}

func regenerate(unit, config):
	unit.heal(config.value)
	print(unit.id, " regenerated ", config.value, " HP")