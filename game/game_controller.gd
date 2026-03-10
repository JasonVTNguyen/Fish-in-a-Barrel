extends Node

@onready var screen_size = get_viewport().get_visible_rect().size

var inventory : Inventory = Inventory.new()
var currentFish : Fish
var total_value : float = 0.0
var money : float = 0.0
var total_bait : int = 3
var current_round : int = 0

var current_bait : int = 3
var primary_gun : Gun = Gun.new("Pistol", 5, 5000, 20, 10)
var primary_gun_upgrades : Array[Upgrade] = []

var secondary_gun : Gun  #= Gun.new("Shotgun", 55, 5000, 20, 10)
var secondary_gun_upgrades : Array[Upgrade] = []

var story_round_objectives : Dictionary[int,float] = {
	0 : 10.0,
	1 : 50.0,
	2 : 100.0,
	3 : 200.0,
	4 : 500.0,
	5 : 1250.0,
	6 : 5000.0,
	7 : 10000.0,
	8 : 25000.0,
	9 : 50000.0,
}

enum GunState {HIT, MISS}

var gun_state : GunState = GunState.MISS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Game Loaded.")
	#print(get_viewport().get_visible_rect().size[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func reset_game():
	inventory = Inventory.new()
	currentFish = Fish.new()
	total_value = 0.0
	money = 0.0
	total_bait = 3
	current_bait = 3
	current_round = 0
