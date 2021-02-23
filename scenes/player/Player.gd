extends KinematicBody2D

const MAX_SPEED = 100
const ACCELERATION = 1000
const FRICTION = 1000

const FALL_SPEED = 300
const GRAVITY = 1000

const JUMP_FORCE = 280

var on_floor = false

var jump_charge = 0
var velocity = Vector2.ZERO


func _physics_process(delta):
	var x_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if x_input == 0:
		$AnimationPlayer.play("idle")
		velocity.x = move_toward(velocity.x, 0.0, FRICTION * delta)
	else:
		$AnimationPlayer.play("run")
		$Sprite.flip_h = x_input < 0
		velocity.x = move_toward(velocity.x, MAX_SPEED * x_input, ACCELERATION * delta)
	
	#on_floor = $Floorcheck.get_overlapping_bodies().size() != 0
	
	if on_floor:
		if Input.is_action_just_pressed("jump"):
			velocity.y = -JUMP_FORCE

	velocity.y = move_toward(velocity.y, FALL_SPEED, GRAVITY * delta)
	
	velocity = move_and_slide(velocity)


func _on_Floorcheck_body_entered(body):
	on_floor = true
	print('true')


func _on_Floorcheck_body_exited(body):
	on_floor = false
	print('false')
