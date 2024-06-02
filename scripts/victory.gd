extends Node

@export var timer_label : Label = null

func _ready() -> void:
	if Globals.timer > 60:
		timer_label.text = "%d minutes %d seconds" % [Globals.timer / 60, fmod(Globals.timer, 60)]
	else:
		timer_label.text = "%d seconds" % Globals.timer

func _input(event: InputEvent) -> void:
	if event.is_action_released("Restart"):
		get_tree().change_scene_to_file("res://nodes/screens/gameplay_screen.tscn")
