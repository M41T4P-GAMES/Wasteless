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
		Global.get_bars().sadder(delta * WORKING_HAPPINESS_DECREASE_PER_SEC)
	elif mode == Mode.RESTING:
		Global.get_bars().happier(delta * RESTING_HAPPINESS_INCREASE_PER_SEC)
	print("Money: " + str(Global.get_bars().money))
	print("Health: " + str(Global.get_bars().health))
	print("Happiness: " + str(Global.get_bars().happiness))


func interact() -> void:
	var player : Player = Global.get_player()
	player.can_move = !player.can_move
	if player.can_move == false:
		$CanvasLayer/ModeUI.show()
	else:
		$CanvasLayer/ModeUI.hide()
		mode = Mode.NONE
		$MoneyGainTimer.stop()


func _on_work_button_pressed() -> void:
	$CanvasLayer/ModeUI.hide()
	mode = Mode.WORKING
	$MoneyGainTimer.start()


func _on_resting_button_pressed() -> void:
	$CanvasLayer/ModeUI.hide()
	mode = Mode.RESTING


func _on_money_gain_timer_timeout() -> void:
	Global.get_bars().make_money(WORKING_MONEY_GAIN_PER_SEC)
