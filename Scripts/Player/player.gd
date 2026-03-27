class_name Player
extends CharacterBody2D

enum Sides{
	LEFT,
	RIGHT,
	FRONT,
	BACK
}

const SPEED = 200

var can_move = true
var side = Sides.FRONT

func _physics_process(_delta: float) -> void:
	if can_move:
		velocity = Input.get_vector("Left", "Right", "Up", "Down") * SPEED
	else:
		velocity = Vector2.ZERO
	
	# Animations
	if velocity != Vector2.ZERO:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x < 0:
				$Sprite2D.play("walking_left")
				side = Sides.LEFT
			else:
				$Sprite2D.play("walking_right")
				side = Sides.RIGHT
		else:
			if velocity.y < 0:
				$Sprite2D.play("walking_back")
				side = Sides.BACK
			else:
				$Sprite2D.play("walking_front")
				side = Sides.FRONT
	else:
		if side == Sides.LEFT:
			$Sprite2D.play("idle_left")
		elif side == Sides.RIGHT:
			$Sprite2D.play("idle_right")
		elif side == Sides.BACK:
			$Sprite2D.play("idle_back")
		elif side == Sides.FRONT:
			$Sprite2D.play("idle_front")
	
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		for area in $InteractionArea.get_overlapping_areas():
			if area.has_method("interact"):
				area.interact()
