extends Node

const MAX_HEALTH = 100
const MAX_HAPPINESS = 100

var used_electricity : float = 0
var used_water : float = 0
var fridge_stock: int = 0

var health: float = 100
var money: float = 50
var happiness: float = 50

func _physics_process(_delta: float):
	$HealthBar.value = health
	$HappinessBar.value = happiness
	$Money.text = "€%0.2f" % money

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
	elif health > MAX_HEALTH:
		health = MAX_HEALTH
		
func set_money(newMoney: float):
	money = newMoney
	if money < 0:
		money = 0
		return false
	return true
		
func set_happiness(newHappiness: float):
	happiness = newHappiness
	if happiness <= 0:
		print("Game over")
		return
	elif happiness > MAX_HAPPINESS:
		happiness = MAX_HAPPINESS

func spend_money(spending: float):
	return set_money(money-spending)
		
func make_money(earn: float):
	set_money(money + earn)
	
func sadder(tears: float):
	set_happiness(happiness - tears)
	
func happier(joy: float):
	set_happiness(happiness + joy)
	
func hurt(damage: float):
	set_health(health - damage)

func heal(points: float):
	set_health(health + points)


func set_used_electricity(electricity : float) -> void:
	used_electricity = electricity


func add_used_electricity(electricity : float) -> void:
	used_electricity += electricity 


func set_used_water(water : float) -> void:
	used_water = water


func add_used_water(water : float) -> void:
	used_water += water 


func add_fridge_stock(stock: int):
	fridge_stock += stock

func use_fridge_stock(stock: int):
	if fridge_stock >= stock:
		fridge_stock -= stock
		return true
	else:
		return false
