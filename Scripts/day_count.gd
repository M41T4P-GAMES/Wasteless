extends Control

var current_day = 1

func _process(delta: float) -> void:
	update_timer_label()


func _on_day_timer_timeout() -> void:
	day_end()


func day_end() -> void:
	get_tree().paused = true
	var stats = Global.get_stats()
	Global.get_billing_screen().calculate(stats.used_water, stats.used_electricity)


func increase_day_count() -> void:
	current_day += 1
	%DayLabel.text = "Day " + str(current_day)


func update_timer_label() -> void:
	var time = int($DayTimer.time_left)
	@warning_ignore("integer_division")
	var mins = time / 60
	var secs = time % 60
	var mins_str = ""
	var secs_str = ""
	if mins >= 10:
		mins_str = str(mins)
	else:
		mins_str = "0" + str(mins)
	
	if secs >= 10:
		secs_str = str(secs)
	else:
		secs_str = "0" + str(secs)
		
	%TimerLabel.text = mins_str + " : " + secs_str
