extends Node2D
	
@export var fish_scene: PackedScene 
@export var spawn_interval: float = 2.0
@export var screen_width: float = 1024
@export var spawn_y_min: float = 100
@export var spawn_y_max: float = 600
@export var fish_speed: float = 200.0

var timer: float = 0.0
var rng = RandomNumberGenerator.new()

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		spawn_fish()
		timer = 0.0

func spawn_fish():
	var fish = fish_scene.instantiate()
	var side = rng.randi_range(0, 1)
	var y_pos = rng.randi_range(spawn_y_min, spawn_y_max)
	
	if side == 0:
		fish.position = Vector2(-50, y_pos)   
		fish.set("direction", Vector2(1, 0))  
		fish.scale.x = 1 
	else:
		fish.position = Vector2(screen_width + 50, y_pos)  
		fish.set("direction", Vector2(-1, 0))  
		fish.scale.x = -1  

	get_parent().add_child(fish)
