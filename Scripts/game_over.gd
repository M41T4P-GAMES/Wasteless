extends PanelContainer

func _ready() -> void:
	hide()


func game_over(days_survived, money_spent, money_earned) -> void:
	get_tree().paused = true
	%DaySurvived.text = str(days_survived)
	%MoneySpent.text = "€" + str(money_spent)
	%MoneyEarned.text = "€" + str(money_earned)
	show()


func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
