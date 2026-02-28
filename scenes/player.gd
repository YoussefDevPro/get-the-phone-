extends CharacterBody2D


const SPEED = 300.0
const UP_FORCE = -200.0  # how strong can the player go up, but lets say the player is hesitating going up hehe
const GRAVITY = -100.0 
var max_health = 7
var health = max_health

@export var full_heart_texture: Texture2D
@export var empty_heart_texture: Texture2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	# player is always going doooown
	# velocity.y += GRAVITY * delta
	if Input.is_action_just_pressed("ui_up"):
		velocity.y += UP_FORCE * delta 
	# velocity.y = clamp(velocity.y, -UP_FORCE, 500)

	move_and_slide()
	
func damage(amount = 1):
	health -= amount
	health = clamp(health, 0, max_health) 
	print("Health:", health)  # debug
	update_health_ui()
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn") # TODO: game over scene
		

func update_health_ui():
	for i in range(7):  # assuming max health = 7
		var heart = $Camera2D/MarginContainer/HBoxContainer.get_child(i) as TextureRect
		if i < health:
			heart.texture = full_heart_texture
		else:
			heart.texture = empty_heart_texture
			
func _on_area_2d_area_entered(area):
	print("zzzzzzzzzzzzzzzzzz")
	if area.is_in_group("enemies"):
		damage(1)
		area.queue_free()  # fish gone (ate)
