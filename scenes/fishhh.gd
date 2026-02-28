extends CharacterBody2D

@export var speed: float = 200.0
var direction: Vector2 = Vector2(1, 0)  

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
	if position.x < -100 or position.x > 780:  
		queue_free()
