extends Node

@export var angle_margin : float = 10
@export var hours_hand : ClockHand = null
@export var minutes_hand : ClockHand = null
@export var goals : Array[Goal]
@export var errors : Array[Failure]

@export var error_sound : AudioStreamPlayer2D = null
@export var success_sound : AudioStreamPlayer2D = null

var number_of_error : int = 0

func _ready() -> void:
	Globals.timer = 0

func _process(delta: float) -> void:
	Globals.timer += delta

func _input(event: InputEvent) -> void:
	if event.is_action_released("Confirm"):
		var player_is_correct : bool = false
		var any_goals_left : bool = false
		for goal in goals:
			if !goal.is_completed:
				if is_clock_correct(goal):
					goal.set_completed()
					player_is_correct = true
					success_sound.play()
				else:
					any_goals_left = true
		
		if !player_is_correct:
			errors[number_of_error].change_color()
			error_sound.play()
			number_of_error += 1
			if number_of_error == 3:
				await get_tree().create_timer(0.25).timeout
				get_tree().change_scene_to_file("res://nodes/screens/game_over_screen.tscn")
		if !any_goals_left:
			await get_tree().create_timer(0.25).timeout
			get_tree().change_scene_to_file("res://nodes/screens/victory_screen.tscn")
			
func is_clock_correct(goal: Goal) -> bool:
	#print("hours: clock %d = alarm %d" % [hours_hand.rotation_degrees, goal.hours_angle])
	if !is_correct_angle(hours_hand.rotation_degrees, goal.hours_angle, angle_margin):
		return false
	#print("minutes: clock %d = alarm %d" % [minutes_hand.rotation_degrees, goal.minutes_angle])	
	if !is_correct_angle(minutes_hand.rotation_degrees, goal.minutes_angle, angle_margin):
		return false
	return true
	
func is_correct_angle(first_angle: float, second_angle: float, margin: float) -> bool:
	if first_angle < second_angle - margin:
		return false
	if first_angle > second_angle + margin:
		return false
	return true
