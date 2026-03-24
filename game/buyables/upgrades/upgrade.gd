extends Resource
class_name Upgrade

enum Upgrade_Type {BULLET, MAGAZINE}

var upgrade_type : Upgrade_Type
var upgrade_name : String
var upgrade_price : float

func _init(c_upgrade_type : Upgrade_Type, c_upgrade_name, c_price) -> void:
	upgrade_type = c_upgrade_type
	upgrade_name = c_upgrade_name
	upgrade_price = c_price

func _to_string() -> String:
	return "Upgrade Type: " + str(upgrade_type) + " Upgrade Name: " + str(upgrade_name)
