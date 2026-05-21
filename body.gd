extends CharacterBody3D

@export var move_speed = 15
@export var acceleration = 200

func _physics_process(delta: float) -> void:
	var move_dir := Vector3.ZERO
	var raw_input := Input.get_vector("right", "left", "up", "down") 
	
	move_dir.z = raw_input.x
	move_dir.x = raw_input.y
	move_dir = move_dir.normalized()
	
	velocity = velocity.move_toward(move_dir * move_speed, acceleration * delta)
	
	velocity.y -= 10 * delta
	
	move_and_slide()
