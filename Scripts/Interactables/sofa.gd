extends Area2D

enum Mode{
	NONE,
	WORKING,
	RESTING
}

const RESTING_HAPPINESS_INCREASE_PER_SEC = 1.0
const WORKING_HAPPINESS_DECREASE_PER_SEC = 0.5
const WORKING_MONEY_GAIN_PER_SEC = 10

var mode : Mode = Mode.NONE

func _ready() -> void:
	$CanvasLayer/ModeUI.hide()


func _process(delta: float) -> void:
	if mode == Mode.WORKING:
		Global.get_stats().sadder(delta * WORKING_HAPPINESS_DECREASE_PER_SEC)
	elif mode == Mode.RESTING:
		Global.get_stats().happier(delta * RESTING_HAPPINESS_INCREASE_PER_SEC)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("esc"):
		if mode != Mode.NONE:
			close()


func close() -> void:
	$CanvasLayer/ModeUI.hide()
	mode = Mode.NONE
	$MoneyGainTimer.stop()
	Global.get_player().can_move = true


func interact() -> void:
	var player : Player = Global.get_player()
	if player:
		if player.can_move:
			player.can_move = false
			$CanvasLayer/ModeUI.show()
			%WorkButton.grab_focus()
		else:
			player.can_move = true
			close()


func _on_work_button_pressed() -> void:
	$CanvasLayer/ModeUI.hide()
	mode = Mode.WORKING
	$MoneyGainTimer.start()


func _on_resting_button_pressed() -> void:
	$CanvasLayer/ModeUI.hide()
	mode = Mode.RESTING


func _on_money_gain_timer_timeout() -> void:
	Global.get_stats().make_money(WORKING_MONEY_GAIN_PER_SEC)
