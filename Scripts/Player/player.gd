extends CharacterBody2D

const SPEED = 300

func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("Left", "Right", "Up", "Down") * SPEED
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		for area in $InteractionArea.get_overlapping_areas():
			if area.has_method("interact"):
				area.interact()
