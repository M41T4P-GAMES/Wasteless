extends Node

func get_bars() -> Node:
	return get_tree().current_scene.find_child("Bars")


func get_player() -> Player:
	return get_tree().current_scene.find_child("Player")
