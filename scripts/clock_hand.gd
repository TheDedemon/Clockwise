class_name ClockHand

extends Marker2D

@export var speed : float = 120
@export var input_name : StringName = ""

var is_input_pressed : bool = false

func _process(delta: float) -> void:
	if is_input_pressed:
		rotation_degrees += speed * delta
		if rotation_degrees < 0:
			rotation_degrees += 360
		elif  rotation_degrees > 360:
			rotation_degrees -= 360

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(input_name):
		is_input_pressed = true
	elif event.is_action_released(input_name):
		is_input_pressed = false
