extends CharacterBody2D
class_name Fish

@onready var fishing_scene : Node2D = get_parent()
@onready var bobber_scene : Sprite2D = $"../Bobber"

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

var target_destination : Vector2 = Vector2.ZERO

enum State { WANDER, ATTRACT, STOP }
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
	set_new_target_destination()

func _physics_process(delta: float) -> void:
	match state:
		State.WANDER:
			if self.position == target_destination:
				set_new_target_destination()
		State.ATTRACT:
			if self.position == target_destination:
				fishing_scene.makeFish(self)
		State.STOP:
			velocity = Vector2.ZERO
			move_and_slide()
	self.position = self.position.move_toward(target_destination, 25 * delta)
	
func movement_choice() -> void:
	var choice = randi_range(1,2)
	match choice:
		1:
			state = State.WANDER
		2:
			state = State.STOP

func _to_string() -> String:
	return fish_name +": value: " + str(value) + " Health: " + str(health)

func set_new_target_destination() -> void:
	if state == State.WANDER:
		target_destination = Vector2(randi_range(200, 960), self.position.y + randi_range(-50,50))
	elif state == State.ATTRACT:
		target_destination = bobber_scene.position

func set_attract_mode() -> void:
	if not state == State.ATTRACT:
		state = State.ATTRACT
		set_new_target_destination()
	
func set_wander_mode() -> void:
	if not state == State.WANDER:
		state = State.WANDER
		set_new_target_destination()
