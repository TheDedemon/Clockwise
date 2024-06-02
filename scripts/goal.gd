class_name Goal

extends Node2D

@export var label : Label = null
@export var normal_alarm_sprite : Sprite2D = null
@export var completed_alarm_sprite : Sprite2D = null
@export var completed_color : Color = Color.GREEN

var is_completed : bool = false
var hours : float = 0
var minutes : float = 0
var hours_angle : float = 0
var minutes_angle : float = 0

func _ready() -> void:
	generate()
	normal_alarm_sprite.visible = true
	completed_alarm_sprite.visible = false

func generate() -> void:
	hours = randi_range(0, 23)
	minutes = randi_range(0, 59)
	hours_angle = (fmod(hours, 12) / 12) * 360
	minutes_angle = (minutes / 60) * 360
	label.text = "%d:%d" % [hours, minutes]

func set_completed() -> void:
	modulate = completed_color
	normal_alarm_sprite.visible = false
	completed_alarm_sprite.visible = true
