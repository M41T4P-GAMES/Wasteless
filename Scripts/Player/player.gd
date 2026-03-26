class_name Player
extends CharacterBody2D

const SPEED = 300

var can_move = true

func _physics_process(_delta: float) -> void:
	if can_move:
		velocity = Input.get_vector("Left", "Right", "Up", "Down") * SPEED
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		for area in $InteractionArea.get_overlapping_areas():
			if area.has_method("interact"):
				area.interact()
