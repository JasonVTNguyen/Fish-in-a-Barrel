extends Node2D

var qte_meter_count : float = 0.0

var increments1 : float
var increments2 : float
var increments3 : float

var is_counting : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	random_increments()
	print("Increment 1: ", increments1)
	print("Increment 2: ", increments2)
	print("Increment 3: ", increments3)
	is_counting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if qte_meter_count >= 60.0:
		is_counting = false
	if check_if_pass_increment(2.5):
		print("Increment Touched")
	if is_counting:
		qte_meter_count += 0.1


func random_increments():
	increments1 = randf_range(10.0, 50.0)
	increments2 = randf_range(10.0, 50.0)
	increments3 = randf_range(10.0, 50.0)

func check_if_pass_increment(offset : float):
	if qte_meter_count <= increments1 + offset or qte_meter_count >= increments1 - offset or qte_meter_count <= increments2 + offset or qte_meter_count >= increments2 - offset or qte_meter_count <= increments3 + offset or qte_meter_count >= increments3 - offset:
		return true
	
