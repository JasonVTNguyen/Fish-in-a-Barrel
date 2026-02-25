extends Node

class_name Inventory

var items : Array

func add_item(item) -> void:
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
