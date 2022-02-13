extends KinematicBody2D

export var velocity = Vector2.ZERO
export var MAX_SPEED = 1000
export var ACCELERATION = 500

enum{
	IDLE
	HUNGER
}
var state = IDLE	#sets default state
onready var playerDetectionZone = $PlayerDetectionZone #Imports the viewing area of the rolly
onready var sprite = $Enemy
var player = null
var direction

func seekPlayer():
	if playerDetectionZone.can_see_player():
		state = HUNGER

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		IDLE:
			velocity = Vector2.ZERO
			seekPlayer()
		HUNGER:
			player = playerDetectionZone.player
			if player:
				direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION* delta)
				velocity.y = 0
			else:
				state = IDLE
			sprite.flip_h = velocity.x < 0
	velocity = move_and_slide(velocity)
