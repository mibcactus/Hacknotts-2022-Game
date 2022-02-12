extends KinematicBody2D

var velocity = Vector2.ZERO
export var ACCELERATION = 50
export var MAXSPEED = 75
export var FRICTION = 500
export var JUMPHEIGHT = -300
export var MAXJUMP = -40
export var GRAVITY = 10

func _physics_process(delta):
	var inVel = Vector2.ZERO
	
	inVel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if Input.is_action_just_pressed("ui_accept"):
		inVel.y = JUMPHEIGHT
	
	inVel.y += GRAVITY
	if inVel != Vector2.ZERO:
		velocity += inVel * ACCELERATION * delta
		print("current velocity: ", velocity)
		velocity = velocity.clamped(MAXSPEED)
		velocity = move_and_slide(velocity, Vector2(0, -1), 1)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * FRICTION)
