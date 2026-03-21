extends Node
class_name Inventory

signal close_inventory

var items : Array[Item]

func add_item(item) -> void:
	print("Item added.")
	items.append(item)
	
func remove_item(item) -> void:
	var item_loc : int = find_item(item)
	if item_loc:
		items.remove_at(item_loc)
	else:
		print("Item not found.")
	
func find_item(item):
	for x in range(len(items)):
		if items[x] == item:
			return x
	return null

func _on_close_inventory_button_pressed() -> void:
	close_inventory.emit()

func update_labels() -> void:
	if len(GameController.inventory.items) > 0:
		$Panel/Items.text = str(GameController.inventory.items)
	else:
		$Panel/Items.text = ""
	$"Panel/Primary Weapon Box/Primary Gun".text = str(GameController.primary_gun.gun_name)
	if GameController.secondary_gun:
		$"Panel/Secondary Weapon Box/Secondary Gun".text = str(GameController.secondary_gun.gun_name)
	
func _on_primary_weapon_box_mouse_entered() -> void:
	$"Gun Description".text = str(GameController.primary_gun.gun_upgrades)

func _on_primary_weapon_box_mouse_exited() -> void:
	$"Gun Description".text = ""

func _on_secondary_weapon_box_mouse_entered() -> void:
	if GameController.secondary_gun:
		$"Gun Description".text = str(GameController.secondary_gun.gun_upgrades)

func _on_secondary_weapon_box_mouse_exited() -> void:
	$"Gun Description".text = ""
