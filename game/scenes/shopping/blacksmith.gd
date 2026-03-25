extends Control

@onready var money: Label = $Money
@onready var description_text: Label = $"Description Text"
@onready var shopping_menu: Control = $".."
@onready var replace_weapon_panel: Control = $"Replace Weapon Panel"

var purchasable_weapon : Gun

signal switch_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_labels()
	replace_weapon_panel.hide()
	purchasable_weapon = shopping_menu.for_sale_weapon

func _on_to_shop_button_pressed() -> void:
	switch_scene.emit()


func _on_buy_ammo_button_pressed() -> void:
	GameController.primary_gun.add_to_ammo_capacity(100)
	if GameController.secondary_gun:
		GameController.secondary_gun.add_to_ammo_capacity(100)

func update_labels() -> void:
	money.text = "Cash: $" + str(GameController.money)
	description_text.text = ""

func _on_buy_weapon_button_pressed() -> void:
	if not GameController.secondary_gun:
		print("Secondary does not exist")
		GameController.secondary_gun = Gun.new(shopping_menu.for_sale_weapon.gun_name, shopping_menu.for_sale_weapon.damage, shopping_menu.for_sale_weapon.cap_ammo, shopping_menu.for_sale_weapon.max_ammo, shopping_menu.for_sale_weapon.mag_size, shopping_menu.for_sale_weapon.reload_time, shopping_menu.for_sale_weapon.fire_rate)
	else:
		replace_weapon_panel.show()
	$"Buy Weapon Button".queue_free()

func _on_buy_weapon_button_mouse_entered() -> void:
	if shopping_menu.for_sale_weapon:
		description_text.text = shopping_menu.for_sale_weapon._to_string()


func _on_buy_weapon_button_mouse_exited() -> void:
	description_text.text = ""
