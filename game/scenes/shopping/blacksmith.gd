extends Control

@onready var money: Label = $Money
@onready var description_text: Label = $"Description Text"

var purchasable_weapon : Gun

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_labels()
	generate_random_weapon()
	
func generate_random_weapon() -> void:
	purchasable_weapon = Catalogue.weapons.get(randi_range(0,len(Catalogue.weapons)-1))

func _on_to_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/scenes/shopping/shop.tscn")


func _on_buy_ammo_button_pressed() -> void:
	GameController.primary_gun.add_to_ammo_capacity(100)
	if GameController.secondary_gun:
		GameController.secondary_gun.add_to_ammo_capacity(100)

func update_labels() -> void:
	money.text = "Cash: " + str(GameController.money)
	description_text.text = ""

func _on_buy_weapon_button_pressed() -> void:
	generate_random_weapon()

func _on_buy_weapon_button_mouse_entered() -> void:
	if purchasable_weapon:
		description_text.text = purchasable_weapon._to_string()


func _on_buy_weapon_button_mouse_exited() -> void:
	description_text.text = ""
