extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func makeFish():
	print("Making Fish")
	var new_fish = Fish.new("Salmon", 35.0, 50.0)
	print(new_fish)
	
	
