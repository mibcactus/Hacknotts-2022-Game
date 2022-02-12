extends KinematicBody2D

var velocity = Vector2.ZERO
export var ACCELERATION = 72
export var MAXSPEED = 150
export var FRICTION = 50
export var JUMPHEIGHT = -500
export var GRAVITY = 10

func _physics_process(delta):
	var inVel = Vector2.ZERO
	inVel.y += GRAVITY
	
	inVel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if Input.is_action_just_pressed("ui_accept"):
		inVel.y = JUMPHEIGHT
	
	if inVel != Vector2.ZERO:
		velocity += inVel * ACCELERATION * delta
		print("current velocity: ", velocity)
		velocity = velocity.clamped(MAXSPEED)
		velocity = move_and_slide(velocity)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * FRICTION)
