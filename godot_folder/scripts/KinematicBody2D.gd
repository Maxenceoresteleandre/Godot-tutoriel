extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 10000
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity := Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	elif Input.is_action_pressed("right"):
		velocity.x += 1
	elif Input.is_action_pressed("jump"):
		velocity.y -= 1
		#yield(get_tree().create_timer(TIME), “timeout”)
		#velocity.y += 1
		pass
	if velocity.x == 0:
		$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "walk"
	$AnimatedSprite.flip_h = (velocity.x < 0)
	move_and_slide(velocity.normalized() * speed * delta)

func collect_coin():
	$AudioStreamPlayer2D.play(0)
	score += 1
