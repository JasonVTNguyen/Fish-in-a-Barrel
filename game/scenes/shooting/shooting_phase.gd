extends Node2D

@onready var modifier_handler: ModifierHandler = $ModifierHandler

@onready var health_bar: ProgressBar = $"HUD Elements/Health Bar"
@onready var reload_bar: ProgressBar = $"HUD Elements/Reload Bar"
@onready var fire_rate_bar: ProgressBar = $"HUD Elements/FireRate Bar"
@onready var switch_weapon_bar: ProgressBar = $"HUD Elements/Switch Weapon Bar"

@onready var reload_timer: Timer = $ReloadTimer
@onready var fire_rate_timer : Timer = $FireRateTimer
@onready var switch_timer: Timer = $SwitchTimer

var current_gun : Gun
var new_target : Target_Fish
var total_damage = 0

var reload_time : float = 0

@export var _fire_frames : int = 50
@export var _fire_rate : int = 1

const switchGun : int = 2000
var hold_timer : float = 0


func _ready() -> void:
	print("Shooting Test: "+ str(GameController.currentFish))
	new_target = Target_Fish.new(GameController.currentFish.health)
	health_bar.max_value = new_target.target_max_health
	health_bar.value = new_target.target_max_health
	current_gun = GameController.primary_gun
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	update_labels()
	print(current_gun)
	$"HUD Elements/Reload Bar".max_value = current_gun.reload_time
	$"HUD Elements/FireRate Bar".max_value = current_gun.fire_rate
	$"HUD Elements/Switch Weapon Bar".max_value = 1

func _process(delta: float) -> void:
	if new_target.target_cur_health <= 0:
		target_dead()
	update_labels()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Shoot"):
		if GameController.gun_state == GameController.GunState.HIT and reload_timer.is_stopped() and switch_timer.is_stopped():
			if update_damage():
				$"Target Fish".target_hit()
		if reload_timer.is_stopped() and switch_timer.is_stopped():
			if current_gun.fire_gun():
				print("gun shot")
	elif event.is_action_pressed("Reload"):
		current_gun.reload_gun()
		reload_time = current_gun.reload_time
		reload_timer.start(current_gun.reload_time)
	elif event.is_action_pressed("Switch Weapons") and GameController.secondary_gun:
		if current_gun == GameController.primary_gun:
			current_gun = GameController.secondary_gun
		else:
			current_gun = GameController.primary_gun
			$"HUD Elements/Reload Bar".max_value = current_gun.reload_time
			$"HUD Elements/FireRate Bar".max_value = current_gun.fire_rate
		print("Switch Weapons")
		switch_timer.start(1)
	update_labels()

func target_dead():
	GameController.total_value += GameController.currentFish.value
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if GameController.current_bait > 0:
		get_tree().change_scene_to_file("res://game/scenes/fishing/fishing.tscn")
	else:
		get_tree().change_scene_to_file("res://game/scenes/shopping/shop.tscn")

func damage_calculation():
	var damage : int = current_gun.damage
	return damage

func update_damage():
	if current_gun.check_can_fire_gun():
		if GameController.gun_state == GameController.GunState.HIT:
			total_damage += current_gun.damage
			new_target.damage_target(damage_calculation())
			health_bar.value -= damage_calculation()
		update_labels()
		return true
	return false

func update_labels() -> void:
	$"HUD Elements/Reload Bar".value = reload_timer.time_left
	$"HUD Elements/FireRate Bar".value = fire_rate_timer.time_left
	$"HUD Elements/Switch Weapon Bar".value = switch_timer.time_left
	$"HUD Elements/Weapon Name".text = str(current_gun.gun_name)
	$"HUD Elements/Fish Health".text = str(new_target.target_cur_health) + " / " + str(new_target.target_max_health)
	$"HUD Elements/Fish Name".text = str(GameController.currentFish.fish_name)
	$"HUD Elements/Ammo".text = "Ammo: " + str(current_gun.cur_ammo) + " / " + str(current_gun.mag_size) + " / " + str(current_gun.max_ammo)
	$"HUD Elements/DPS Label".text = "You have done " + str(total_damage)+ " damage."
	$"HUD Elements/Fish Health".text = str(new_target.target_cur_health) + " / " + str(new_target.target_max_health)
	
	if not current_gun.check_can_fire_gun():
		$"HUD Elements/Ammo".text = "RELOAD!"
	if current_gun.check_no_more_ammo():
		$"HUD Elements/Ammo".text = "All Out of Ammo!"
	else:
		$"HUD Elements/Ammo".text = "Ammo: " + str(current_gun.cur_ammo) + " / " + str(current_gun.mag_size) + " / " + str(current_gun.max_ammo)
