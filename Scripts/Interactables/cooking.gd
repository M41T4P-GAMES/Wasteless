extends Node2D

const COOKING_DURATION = 3.0
const EATING_HEALTH_INCREASE = 20.0
const DONATING_HAPPINESS_INCREASE = 25.0
const ELECTRICITY_COST = 1.0

var has_cooked : bool = false

func _ready() -> void:
	$CanvasLayer/Control.hide()

func interact() -> void:
	var player : Player = Global.get_player()
	if player:
		player.can_move = false
		if not has_cooked and Global.get_stats().fridge_stock > 0:
			Global.get_stats().use_fridge_stock(1)
			$CookTimer.start(COOKING_DURATION)
		else:
			player.can_move = true

func _on_cook_timer_timeout() -> void:
	has_cooked = true
	$CanvasLayer/Control.show()
	%EatButton.grab_focus()

func _on_eat_button_pressed() -> void:
	Global.get_stats().heal(EATING_HEALTH_INCREASE)
	finish()

func _on_donate_button_pressed() -> void:
	Global.get_stats().happier(DONATING_HAPPINESS_INCREASE)
	finish()

func finish() -> void:
	Global.get_stats().add_used_electricity(ELECTRICITY_COST)
	has_cooked = false
	$CanvasLayer/Control.hide()
	var player : Player = Global.get_player()
	if player:
		player.can_move = true
