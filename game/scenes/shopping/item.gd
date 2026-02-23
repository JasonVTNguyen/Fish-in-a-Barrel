extends Resource

class_name Item

enum Item_Type {ITEM, UPGRADE}

var item_name : String
var item_type : Item_Type
var item_desc : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
