extends CharacterBody2D

@export var speed: float = 200.0
@export var vertical_speed: float = 50.0 

var direction: Vector2 = Vector2(1, 0)  

func _ready():
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	var move_vector = direction.normalized() * speed
	move_vector.y = -vertical_speed  # negative = moving up

	velocity = move_vector
	move_and_slide()
	
	if position.x < -100 or position.x > 880 or position.y < -100:  
		queue_free()
