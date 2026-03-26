extends Node

var health: float = 100
var money: float = 50
var happiness: float = 50

func _physics_process(_delta: float):
	$HealthBar.value = health
	$HappinessBar.value = happiness
	$Money.text = "$%0.2f" % money

func get_health():
	return health
	
func get_money():
	return money
	
func get_happiness():
	return happiness

func set_health(newHealth: float):
	health = newHealth
	if health <= 0:
		print("Game over")
		return
	elif health > 100:
		health = 100
		
func set_money(newMoney: float):
	money = newMoney
	if money < 0:
		money = 0
		
func set_happiness(newHappiness: float):
	happiness = newHappiness
	if happiness <= 0:
		print("Game over")
		return
	elif happiness > 100:
		happiness = 100

func spend_money(spending: float):
	set_money(money-spending)
		
func make_money(earn: float):
	set_money(money+earn)
	
func sadder(tears: float):
	set_happiness(happiness-tears)
	
func happier(joy: float):
	set_happiness(happiness+joy)
	
func hurt(damage: float):
	set_health(health-damage)
		
func heal(points: float):
	set_health(health+points)
	
	
	
		
	
