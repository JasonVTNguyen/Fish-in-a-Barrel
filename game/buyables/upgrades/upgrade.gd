extends Resource
class_name Upgrade

enum Upgrade_Type {BULLET, MAGAZINE}

var upgrade_type : Upgrade_Type
var upgrade_name : String

func _init(c_upgrade_type, c_upgrade_name) -> void:
	upgrade_type = c_upgrade_type
	upgrade_name = c_upgrade_name

func _to_string() -> String:
	return "Upgrade Type: " + str(upgrade_type) + " Upgrade Name: " + str(upgrade_name)
