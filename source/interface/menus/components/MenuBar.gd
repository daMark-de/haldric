extends Control
class_name MenuBar

signal button_pressed(id)

var buttons := {}

var current_id := 0

onready var hover := $ButtonHover as ButtonHover
onready var tween := $Tween as Tween

func reveal():
	tween.interpolate_property(self, "modulate", Color("00FFFFFF"), Color("FFFFFFFF"), 0.6, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()

func highlight_button(button_id):
	hover.highlight_button(buttons[button_id], 0.6)

func register_button(button) -> void:
	buttons[button.get_index()] = button
	button.connect("pressed", self, "_on_button_pressed", [button.get_index()])

func _on_button_pressed(id) -> void:
	highlight_button(id)
	emit_signal("button_pressed", id)