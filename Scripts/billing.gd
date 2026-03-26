extends PanelContainer

const WATER_COST = 10
const ELECTRICITY_COST = 20

var water_total = 0.0
var electricity_total = 0.0
var total = 0.0

func _ready() -> void:
	hide()


func calculate(water_used, elec_used) -> void:
	water_total = snapped(water_used * WATER_COST, 0.01)
	electricity_total = snapped(elec_used * ELECTRICITY_COST, 0.01)
	total = water_total + electricity_total
	
	%ElectricityAmount.text = "€" + str(electricity_total)
	%WaterAmount.text = "€" + str(water_total)
	%TotalAmount.text = "€" + str(total)
	show()


func _on_continue_button_pressed() -> void:
	Global.get_day_count().increase_day_count()
	Global.get_player().global_position = Global.get_start_pos().global_position
	Global.get_stats().spend_money(total)
	water_total = 0
	electricity_total = 0
	total = 0
	hide()
	get_tree().paused = false
