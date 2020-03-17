extends Node2D

export (int) var attack_range = 5

func _physics_process(delta):
	#var player = scn_player.instance()
	var dir = ($SpaceShip.global_position - $Enemy.global_position).normalized()
	#move_and_collide(dir * speed * delta)
	$Enemy.move_and_slide(dir * $Enemy.speed * delta)


func _on_SpaceShip_shoot(bullet, pos, dir):
	var b = bullet.instance()
	add_child(b)
	b._start(pos, dir)
