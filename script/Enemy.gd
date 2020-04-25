extends KinematicBody2D

export (int) var speed = 10000
var hp = 0
var is_dead = false
var velocity = Vector2()

func _ready():
	randomize()
	hp = randi() % 4 + 1

func dead():
	hp -= 1
	if hp <= 0:
		is_dead = true
		velocity = Vector2(0, 0)
		$CollisionShape2D.set_deferred("disabled", true)
		queue_free()

func _physics_process(delta):
	var dir = (get_parent().get_node("SpaceShip").global_position - global_position).normalized()
	move_and_slide(dir * speed * delta)
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "SpaceShip" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()

