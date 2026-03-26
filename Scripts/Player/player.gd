extends CharacterBody2D

const SPEED = 300

func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("Left", "Right", "Up", "Down") * SPEED
	move_and_slide()
