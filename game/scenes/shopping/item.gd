extends Resource

class_name Item

enum Item_Type {ITEM}

var item_name : String
var item_type : Item_Type
var item_desc : String
var flat_value : int
var percent_value : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
