extends Area2D

const HEALTH_INCREASE_PER_SECOND = 1.0
var showering : bool = false

func _ready() -> void:
	$CanvasLayer/modeUI.hide
	
func _process(delta: float) -> void:
	Global.get_bars().heal(delta * HEALTH_INCREASE_PER_SEC)


func interact():
	Global.get_bars().
	
