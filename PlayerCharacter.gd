class_name PlayerCharacter
extends KinematicBody2D

export var max_speed:= 1000.0
export var drag := 4.0

var _velocity := Vector2.ZERO

func _physics_process(_delta: float) -> void:
	var direction := Vector2.ZERO
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	direction = direction.normalized()
	
	var desired_velocity = direction * max_speed
	var steering = desired_velocity - _velocity
	_velocity += steering / drag
	_velocity = _velocity.clamped(max_speed)
	_velocity = move_and_slide(_velocity)
