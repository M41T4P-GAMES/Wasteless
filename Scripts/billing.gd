extends PanelContainer

const WATER_COST = 3
const ELECTRICITY_COST = 10

var water_total = 0.0
var electricity_total = 0.0
var total = 0.0

func _ready() -> void:
	hide()

func calculate(water_used, elec_used) -> void:
	%DayLabel.text = "DAY %d ENDED" % Global.get_day_count().current_day
	water_total = snapped(water_used * WATER_COST, 0.01)
	electricity_total = snapped(elec_used * ELECTRICITY_COST, 0.01)
	total = water_total + electricity_total
	var remaining = Global.get_stats().money - total
	if remaining < 0:
		%RemainingAmount.set("theme_override_colors/font_color", Color(1, 0, 0, 1))
		Global.get_stats().out_of_money = true
	else:
		%RemainingAmount.set("theme_override_colors/font_color", Color(1, 1, 1, 1))

	%ElectricityAmount.text = "€%0.2f" % electricity_total
	%WaterAmount.text = "€%0.2f" % water_total
	%TotalAmount.text = "€%0.2f" % total
	%RemainingAmount.text = ("-" if remaining < 0 else "") + "€%0.2f" % \
							(remaining if remaining > 0 else -remaining)
	%ContinueButton.grab_focus()
	show()
	
func _on_continue_button_pressed() -> void:
	if Global.get_stats().money == 0 and Global.get_stats().out_of_money:
		hide()
		Global.get_game_over_screen().show()
		Global.get_game_over_screen().game_over(Global.get_day_count().current_day, \
												Global.get_stats().money_spent, \
												Global.get_stats().money_earned)
	else:
		Global.get_day_count().increase_day_count()
		var player = Global.get_player()
		if player:
			player.global_position = Global.get_start_pos().global_position
			player.can_move = true
		var stats = Global.get_stats()
		if stats:
			stats.spend_money(total)
			stats.used_electricity = 0
			stats.used_water = 0
		water_total = 0
		electricity_total = 0
		total = 0
		hide()
		get_tree().paused = false
