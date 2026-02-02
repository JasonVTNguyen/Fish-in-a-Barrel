extends Node2D



var primary_gun = Gun.new("Pistol", 5, 5000, 20, 10)
var new_target = Target_Fish.new(150)
var total_damage = 0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$"Fish Health".text = str(new_target.target_cur_health) + " / " + str(new_target.target_max_health)
	$Ammo.text = "Ammo: " + str(primary_gun.cur_ammo) + " / " + str(primary_gun.mag_size) + " / " + str(primary_gun.max_ammo)
	print(primary_gun)

func _process(delta: float) -> void:
	if new_target.target_cur_health <= 0:
		$Target.hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Shoot"):
		if primary_gun.fire_gun():
			print("gun shot")
	if event.is_action_pressed("Reload"):
		primary_gun.reload_gun()
	if not primary_gun.check_can_fire_gun():
		$Ammo.text = "RELOAD!"
	if primary_gun.check_no_more_ammo():
		$Ammo.text = "All Out of Ammo!"
	else:
		$Ammo.text = "Ammo: " + str(primary_gun.cur_ammo) + " / " + str(primary_gun.mag_size) + " / " + str(primary_gun.max_ammo)
	
func update_damage() -> void:
	if primary_gun.check_can_fire_gun():
		total_damage += primary_gun.damage
		new_target.damage_target(primary_gun.damage)
		$"DPS Label".text = "You have done " + str(total_damage)+ " damage."
		$"Fish Health".text = str(new_target.target_cur_health) + " / " + str(new_target.target_max_health)
