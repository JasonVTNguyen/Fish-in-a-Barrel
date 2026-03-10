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
	$Panel/Items.text = str(GameController.inventory.items)
	$"Panel/Primary Weapon Box/Primary Gun".text = str(GameController.primary_gun)


func _on_primary_weapon_box_mouse_entered() -> void:
	$"Gun Description".text = str(GameController.primary_gun.gun_upgrades)

func _on_primary_weapon_box_mouse_exited() -> void:
	$"Gun Description".text = ""
