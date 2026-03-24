extends Upgrade
class_name Bullet_Upgrade

enum Bullet_Upgrade_Type {FLAT_DMG, PERCENT_DMG, STATUS}

@export var bullet_upgrade_type : Bullet_Upgrade_Type
@export var flat_dmg : int = 0
@export var percent_dmg : float = 1.0


func _init(c_bullet_upgrade_type : String, c_upgrade_name : String, c_price : float, c_flat : int = 0, c_percent : float = 1.0) -> void:
	super(Upgrade_Type.BULLET, c_upgrade_name, c_price)
	match c_bullet_upgrade_type:
		"FLAT_DMG":
			bullet_upgrade_type = Bullet_Upgrade_Type.FLAT_DMG
			flat_dmg = c_flat
		"PERCENT_DMG":
			bullet_upgrade_type = Bullet_Upgrade_Type.PERCENT_DMG
			percent_dmg = c_percent

func return_value(dmg_type):
	match dmg_type:
		"FLAT":
			return flat_dmg
		"PERCENT":
			return percent_dmg

func _to_string() -> String:
	return "Upgrade Type: " + str(upgrade_type) + " Upgrade Name: " + str(upgrade_name) + " Flat Value: " + str(flat_dmg) + " Percent Value: " + str(percent_dmg)
