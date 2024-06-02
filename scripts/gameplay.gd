extends Node

@export var angle_margin : float = 10
@export var hours_hand : ClockHand = null
@export var minutes_hand : ClockHand = null
@export var goals : Array[Goal]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Confirm"):
		var player_is_correct : bool = false
		var any_goals_left : bool = false
		for goal in goals:
			if !goal.is_completed:
				if is_clock_correct(goal):
					goal.set_completed()
					player_is_correct = true
				else:
					any_goals_left = true
		
		if !player_is_correct:
			pass # ToDo make error
			
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
