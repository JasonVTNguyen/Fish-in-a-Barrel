extends Control

var for_sale_weapon : Gun
var for_sale_item1 : Item

@onready var blacksmith: Control = $Blacksmith
@onready var shop: Control = $Shop
@onready var inventory: Inventory = $Inventory


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	blacksmith.hide()
	inventory.hide()
	for_sale_weapon = Catalogue.weapons.get(randi_range(0,len(Catalogue.weapons)-1))
	for_sale_item1 = Catalogue.items.get(randi_range(0,len(Catalogue.items)-1))
	
	print(for_sale_item1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_shop_switch_scene() -> void:
	blacksmith.show()
	inventory.hide()
	shop.hide()

func _on_blacksmith_switch_scene() -> void:
	blacksmith.hide()
	inventory.hide()
	shop.show()

func _on_inventory_button_pressed() -> void:
	print(GameController.inventory.items)
	inventory.update_labels()
	inventory.show()

func _on_inventory_close_inventory() -> void:
	inventory.hide()
