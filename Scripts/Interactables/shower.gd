extends Area2D

const HEALTH_INCREASE_PER_SECOND = 1.0
const WATER_COST_PER_SECOND = 1

var showering : bool = false

func _process(delta: float) -> void:
	if showering:
		Global.get_stats().heal(delta * HEALTH_INCREASE_PER_SECOND)
		Global.get_stats().add_used_water(delta * WATER_COST_PER_SECOND)


func interact() -> void:
	var player : Player = Global.get_player()
	if player:
		if player.can_move:
			player.can_move = false
			showering = true
		else:
			player.can_move = true
			showering = false
