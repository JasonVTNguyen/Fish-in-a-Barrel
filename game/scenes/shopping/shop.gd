extends Control

signal switch_scene

@onready var shopping_menu: Control = $".."

var buyable_item1 : Item

var bait_price_box : Dictionary[int, float] = {
	1 : 50.0,
	2 : 50.0,
	3 : 50.0,
	4 : 250.0,
	5 : 1000.0,
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_values()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_next_round_button_pressed() -> void:
	GameController.current_bait = GameController.total_bait
	get_tree().change_scene_to_file("res://game/scenes/fishing/fishing.tscn")

func _on_buy_bait_button_pressed() -> void:
	var bait_cost = bait_price_box.get(GameController.total_bait)
	if GameController.money >= bait_cost:
		GameController.total_bait += 1
		GameController.money -= bait_cost
	update_values()

func update_values() -> void:
	$Money.text = "Cash: " + str(GameController.money)
	$"Start Next Round Button".text = "Next Installment\n$" + str(GameController.story_round_objectives.get(GameController.current_round))

func _on_blacksmith_button_pressed() -> void:
	switch_scene.emit()

func _on_buy_bait_button_mouse_entered() -> void:
	$Description.text = "Adds more bait. Allows you to fish extra fish. (Costs: " + str(bait_price_box.get(GameController.total_bait)) + " dollars.)"

func _on_buy_bait_button_mouse_exited() -> void:
	$Description.text = ""

func _on_buy_item_button_1_mouse_entered() -> void:
	$Description.text = str(shopping_menu.for_sale_item1)

func _on_buy_item_button_1_mouse_exited() -> void:
	$Description.text = ""

func _on_buy_item_button_1_pressed() -> void:
	GameController.inventory.add_item(shopping_menu.for_sale_item1)
	$"Buy Item Button 1".queue_free()

func _on_buy_item_button_2_mouse_entered() -> void:
	$Description.text = str(shopping_menu.for_sale_item2)

func _on_buy_item_button_2_mouse_exited() -> void:
	$Description.text = ""
	
func _on_buy_item_button_2_pressed() -> void:
	GameController.inventory.add_item(shopping_menu.for_sale_item2)
	$"Buy Item Button 2".queue_free()
