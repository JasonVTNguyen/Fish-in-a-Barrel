extends CharacterBody2D
class_name Fish

var screen_size = Vector2(1152,648)
var r_x = randi_range(200, 960)
var r_y = randi_range(170, 300)

var fish_name : String
var value : float
var health : float
var img : String
var lore : String

var move_distance : float = 0.0
var move_angle : float = 0.0

enum State { WANDER, ATTRACT }
var state : State = State.WANDER

@export var agent : NavigationAgent2D

func _init(c_fish_name : String = "Test Fish", c_value : float = 250.0, c_health : float = 125.0, c_img : String = "res://icon.svg", c_lore : String = "This is a test fish") -> void:
	fish_name = c_fish_name
	value = c_value
	health = c_health
	img = c_img
	lore = c_lore
	self.position = Vector2(r_x, r_y)

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if state == State.WANDER:
		choose_direction()
		velocity = Vector2.UP * 25.0
		move_and_slide()

func copy_fish() -> void:
	GameController.currentFish.fish_name = self.fish_name
	GameController.currentFish.value = self.value
	GameController.currentFish.health = self.health
	GameController.currentFish.img = self.img
	GameController.currentFish.lore = self.lore

func _to_string() -> String:
	return fish_name +": value: " + str(value) + " Health: " + str(health)

func choose_direction() -> void:
	move_distance = randf_range(1.0, 2.5)
	move_angle = randf_range(0.0,360.0)
