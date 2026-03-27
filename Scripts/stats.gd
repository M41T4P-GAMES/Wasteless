extends Node

const HEALTH_DECREASE_PER_SEC = 0.5
const HAPPINESS_DECREASE_PER_SEC = 0.5
const MAX_HEALTH = 100
const MAX_HAPPINESS = 100

var used_electricity : float = 0
var used_water : float = 0
var fridge_stock: int = 0

var health: float = 100
var money: float = 50
var happiness: float = 50

var money_spent : float = 0
var money_earned : float = 0

func _ready():
	update_labels()

func update_labels():
	$HealthBar.value = health
	$Money.text = "€%0.2f" % money
	$HappinessBar.value = happiness

func _physics_process(delta: float):
	hurt(delta * HEALTH_DECREASE_PER_SEC)
	sadder(delta * HAPPINESS_DECREASE_PER_SEC)

func get_health():
	return health
	
func get_money():
	return money
	
func get_happiness():
	return happiness

func set_health(newHealth: float):
	health = newHealth
	$HealthBar.value = health
	if health <= 0:
		Global.get_game_over_screen().game_over(Global.get_day_count().current_day, money_spent, money_earned)
		return
	elif health > MAX_HEALTH:
		health = MAX_HEALTH
	
		
func set_money(newMoney: float):
	money = newMoney
	$Money.text = "€%0.2f" % money
	if money < 0:
		money = 0
		return false
	return true
		
func set_happiness(newHappiness: float):
	happiness = newHappiness
	$HappinessBar.value = happiness
	if happiness <= 0:
		Global.get_game_over_screen().game_over(Global.get_day_count().current_day, money_spent, money_earned)
		return
	elif happiness > MAX_HAPPINESS:
		happiness = MAX_HAPPINESS

func spend_money(spending: float):
	money_spent += spending
	return set_money(money-spending)


func make_money(earn: float):
	money_earned += earn
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
