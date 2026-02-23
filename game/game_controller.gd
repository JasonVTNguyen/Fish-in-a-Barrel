extends Node

@onready var screen_size = get_viewport().get_visible_rect().size

var inventory : Inventory
var currentFish : Fish
var total_value : float = 0.0
var total_bait : int = 3

var current_bait : int = 3
var primary_gun : Gun = Gun.new("Pistol", 5, 5000, 20, 10)
var secondary_gun : Gun  = Gun.new("Shotgun", 55, 5000, 20, 10)

var story_round_objectives : Dictionary[int,float] = {
	0 : 10.0,
	1 : 20.0,
	2 : 30.0,
	3 : 40.0,
	4 : 50.0,
	5 : 60.0,
	6 : 70.0,
	7 : 80.0,
	8 : 90.0,
	9 : 200.0,
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
	total_bait = 3
	current_bait = 3
