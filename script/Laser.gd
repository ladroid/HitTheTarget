extends Area2D

export (int) var speed = 750
export (int) var damage = 10
export (float) var lifetime = 0.5

var velocity = Vector2()

func _start(pos, dir):
	position = pos
	rotation = dir.angle()
	$Lifetime.wait_time = lifetime
	velocity = dir * speed

func _process(delta):
	position += velocity * delta
	


func _on_Lifetime_timeout():
	queue_free()


func _on_Laser_body_entered(body):
	if body.name == "Enemy":
		queue_free()
	pass # Replace with function body.
