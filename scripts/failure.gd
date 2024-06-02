class_name Failure

extends Node2D

@export var normal_color : Color = Color.BLACK
@export var error_color : Color = Color.RED

var is_red : bool = false

func _ready() -> void:
	modulate = normal_color

func change_color() -> void:
	is_red = true
	modulate = error_color
