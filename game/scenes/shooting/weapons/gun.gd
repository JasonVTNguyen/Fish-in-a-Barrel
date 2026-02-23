extends Node2D

class_name Gun


var gun_name : String # Name of the Gun
var damage : int # Base Damage before Modifier
var cap_ammo : int # How much Ammo can fit in Reserves
var max_ammo : int # How much Ammo is in Reserves 
var cur_ammo : int # How much Ammo is currently in the magazine
var mag_size : int # How much Ammo can fit in Magazine
var reload_time : float # How long it takes to reload
var fire_rate : float 

var is_reloading : bool = false

func _process(delta: float) -> void:
	position = get_viewport().get_mouse_position()

func _init(c_gun_name : String = "Test Gun", c_damage : int = 0, c_cap_ammo : int = 999999999, c_max_ammo : int = 999999999, c_mag_size : int = 10, c_reload_time : float = 1.0, c_fire_rate : float = 15.0) -> void:
	gun_name = c_gun_name
	damage = c_damage
	cap_ammo = c_cap_ammo
	max_ammo = c_max_ammo
	cur_ammo = c_mag_size
	mag_size = c_mag_size
	reload_time = c_reload_time


func check_can_fire_gun() -> bool:
	if cur_ammo > 0:
		return true
	return false

func check_no_more_ammo() -> bool:
	if max_ammo <= 0 and cur_ammo <= 0:
		return true
	return false

func reload_calculation() -> int:
	var used_ammo = mag_size - cur_ammo
	if used_ammo <= max_ammo:
		return used_ammo
	else:
		return max_ammo

func fire_gun():
	if check_can_fire_gun():
		cur_ammo -= 1
	
func reload_gun() -> void:
	var give_ammo = reload_calculation()
	max_ammo -= give_ammo
	cur_ammo += give_ammo

func add_to_ammo_capacity(ammo : int) -> void:
	if max_ammo + ammo > cap_ammo:
		max_ammo = cap_ammo
	else:
		max_ammo += ammo

func _to_string() -> String:
	return "Gun Name: " + gun_name + ", Damage: " + str(damage)

func _on_damage_radius_area_entered(area: Area2D) -> void:
	GameController.gun_state = GameController.GunState.HIT
	#print("shot will hit")

func _on_damage_radius_area_exited(area: Area2D) -> void:
	GameController.gun_state = GameController.GunState.MISS
	#print("shot will miss")
