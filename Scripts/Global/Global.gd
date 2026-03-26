extends Node

func get_stats() -> Node:
	return get_player().find_child("Stats")


func get_player() -> Player:
	return get_tree().current_scene.find_child("Player")


func get_billing_screen() -> Node:
	return get_tree().current_scene.find_child("Billing")


func get_day_count() -> Node:
	return get_tree().current_scene.find_child("DayCount")


func get_start_pos() -> Marker2D:
	return get_tree().current_scene.find_child("StartPos")
