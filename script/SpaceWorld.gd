extends Node2D

#export (int) var attack_range = 5
export (int) var speed = 10000
func _physics_process(delta):
	#var player = scn_player.instance()
	var dir = ($SpaceShip.global_position - $Enemy.global_position).normalized()
	#move_and_collide(dir * speed * delta)
	$Enemy.move_and_slide(dir * speed * delta)
	
	#if $Enemy.get_slide_count() > 0:
	#	for i in range($Enemy.get_slide_count()):
	#		print("BNBN")
	#		if "Laser" in $Enemy.get_slide_collision(i).collider.name:
	#			print("AAA")
	#			$Enemy.get_slide_collision(i).collider.dead()


func _on_SpaceShip_shoot(bullet, pos, dir):
	var b = bullet.instance()
	add_child(b)
	b._start(pos, dir)
