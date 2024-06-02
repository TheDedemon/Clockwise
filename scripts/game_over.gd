extends Node

func _input(event: InputEvent) -> void:
	if event.is_action_released("Restart"):
		get_tree().change_scene_to_file("res://nodes/screens/gameplay_screen.tscn")
