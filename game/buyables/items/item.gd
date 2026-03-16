extends Resource

class_name Item

enum Item_Type {ITEM, SHOOTING, FISHING}

var item_name : String
var item_type : Item_Type
var item_texture : Texture
var item_desc : String
var avg_price : float

var flat_value : int = 0
var percent_value : float = 1.0

func _init(c_item_name : String, c_item_type : String, c_item_desc : String, c_price : float, c_flat : int = 0, c_percent : float = 1.0) -> void:
	item_name = c_item_name
	match c_item_type:
		"ITEM":
			item_type = Item_Type.ITEM
		"SHOOTING":
			item_type = Item_Type.SHOOTING
		"FISHING":
			item_type = Item_Type.FISHING
	item_desc = c_item_desc
	avg_price = c_price
	flat_value = c_flat
	percent_value = c_percent



func _to_string() -> String:
	return "Item Name: " + item_name + ", Description: " + item_desc
