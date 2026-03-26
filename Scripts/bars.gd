extends Node
var health: float = 100
var money: float = 50
var happiness: float = 50

func getHealth():
	return health
	
func getMoney():
	return money
	
func getHappiness():
	return happiness
	

func setHealth(newHealth: float):
	health=newHealth
	if health<=0:
		print("Game over")
		return
	elif health>100:
		health =100
		
func setMoney(newMoney: float):
	money = newMoney
	if money<0:
		money=0
		
func setHappiness(newHappiness: float):
	happiness=newHappiness
	if happiness<=0:
		print("Game over")
		return
	elif happiness>100:
		happiness =100

func spendMoney(spending: float):
	setMoney(money-spending)
		
func makeMoney(earn: float):
	setMoney(money+earn)
	
func sadder(tears: float):
	
	setHappiness(happiness-tears)
	
func happier(joy: float):
	setHappiness(happiness+joy)
	
func hurt(damage: float):
	setMoney(health-damage)
		
func heal(points: float):
	setMoney(health+points)
	
	
	
		
	
