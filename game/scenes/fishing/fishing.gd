extends Node2D

var fish_scene : PackedScene = preload("res://game/scenes/fishing/fish.tscn")

enum BobberState {}

func _ready() -> void:
	$"Bait Count".text = str(GameController.current_bait)
	$"Total Value".text = str(GameController.total_value)
	for i in range(5):
		spawn_fish()

func _process(delta: float) -> void:
	pass

func spawn_fish():
	var spawned_fish = fish_scene.instantiate()
	randomize_fish(spawned_fish)
	add_child(spawned_fish)

func randomize_fish(new_fish : Fish) -> void:
	var random_fish : Fish = $"Fish Dictionary".fishtionary[randi_range(1, $"Fish Dictionary".fishtionary.size())]
	new_fish.fish_name = random_fish.fish_name
	new_fish.value = random_fish.value
	new_fish.health = random_fish.health
	new_fish.img = random_fish.img
	new_fish.lore = random_fish.lore
	
	
func makeFish(fish):
	print("Making Fish")
	GameController.current_bait -= 1
	GameController.currentFish = Fish.new(fish.fish_name, fish.value, fish.health, fish.img, fish.lore)
	get_tree().change_scene_to_file("res://game/scenes/shooting/shooting_phase.tscn")

	
