extends Node2D

const WORLD_SIZE = 1000   # constant: quicker than variable but cannot change value


var a = 2
var b : float = 3.0
var c := 3
var player : KinematicBody2D = null

export var player_velocity : Vector2 = Vector2(1.0, 2.0)

enum Speeds {Stopped, Walking, Running}
export(Speeds) var current_speed := Speeds.Stopped setget set_speed

const SPEED_VALUES = [0.0, 70.0, 300.0]
var current_speed_value : int = SPEED_VALUES[current_speed]

func set_speed(new_val):
	if not (new_val in Speeds):
		return
	current_speed = new_val
	current_speed_value = SPEED_VALUES[current_speed]

# we could also do:
"""
func get_speed_value():
	return SPEED_VALUES[current_speed]
"""
# ^ This was a multi line comment ^
# (it's actually just a multi line String!)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null:
		player.position += player_velocity * current_speed_value * delta
		print("Player speed: ", current_speed_value)

func _physics_process(_delta):
	pass



